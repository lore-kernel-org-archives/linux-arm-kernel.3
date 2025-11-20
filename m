Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B3CF8548
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 07:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJJgvs/ZqyDxpPWXe/GBTfmOfPXUTk9veRBGRsYfnYM=; b=Ubfx8ESJKXbq1ULBT1QEtEPnMk
	V5b0NhuKSWYoxN9/4vGqYkyG4/1r3s4uKLDOY6pB9LtVHJ6cMOm4Lx3rb3XFByNojKwkbVDuQMp1f
	hySniE7TQUa6YD9dlxZggvI0QpypiUL0Ob82oQ7n9WJaZoJWjgF9KgJwUKHxgzSrEhJVCM78+duZ+
	tfrVm5x9NkAqa1GLZn/jS6bRgqjk+HVVzlWgGevLQtHdbKKvChp8sFwvIvAyoqKujE6T6/P+NOla2
	1qZNjGsCOC83ml7XtiWLD8961I5lB0IvNHKiUjnBn2ZYG4FWbKuSyvybtt4T88k5vtFqyC4aAXCUr
	yea3oImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyhV-00000006Gg1-31lK;
	Thu, 20 Nov 2025 07:03:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyhU-00000006GfX-11oo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 07:03:29 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso140720a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 23:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763622206; x=1764227006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJJgvs/ZqyDxpPWXe/GBTfmOfPXUTk9veRBGRsYfnYM=;
        b=ZGpIZBp0h9u/DY7Ef/TgsFauQwaZyGRCDWiv6HaBb5jBI4Ik04sEw+mr05xm9OsxhE
         c5ouI6KgzY8BU/ymK0RSGKlvImhwcG+42+BICp+NRYJGVyS7fNFCqmudjRt/aZyB9iqb
         5ZOlQtArWLMBNUNv7FsBaxS8akiNokZPClFHKPmzz4c0L1zFMSnbwn6/Q+VcJoFVdUzk
         N6vmDMzTr3sHI48qgsbyPKAp7jQbuiCXKNznmFI4fSvXuOMf+luCwFAIz9FBqMFeCiIh
         z8y7PhUNScbkO7wkNLpz38GftECoKsQEyCNNiNG8mXEsimdtTnBSFK9hlZE9i2rsboef
         d/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763622206; x=1764227006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJJgvs/ZqyDxpPWXe/GBTfmOfPXUTk9veRBGRsYfnYM=;
        b=T5FkicPzNTM1p4rAgfwBBMTnWukQPmc061tfeutQZPgGMDQImewhdYWQV6AFi5pL0U
         ve+kecYiOQftNZi1nrTXYTtC+BEZ/plmP8ijpsOidxt3CM3o6+mw66HsJZ8RcJLR7An7
         86Mng8Rqd6/ccSWrJQARWCVxhpDsVxfWZzUiTE08N/dMsgzbLQywwWuVPpiiIFbTfhTk
         RKY9CMBLpguKFKvsO6T9HZS/s2mUyvSRiqa4Pk1b5K6gnKev7KugTLbgrczgdbIKvFZx
         qZ5O/vTH8ZYzloonc/V6IYf8FR+48uE7eiFtUOrt+nX96RawwRsM6Y7+hdli0lMp504g
         DTKw==
X-Forwarded-Encrypted: i=1; AJvYcCV1bdRpPVeFGgmagtncy8M+djQ1YeoNe5aoT4yUuQp03OyuTaURh37F2NlZnjpI/GEI0NfDPvGKGG9++1Oqzkfu@lists.infradead.org
X-Gm-Message-State: AOJu0YzUrbFzq2v96QeD7lX9b607xKMmB1tBkSci46vq+5kvhy+h3VE8
	FieqOBlBGKOY1xzRsl1Gzc51gwA7AiykBmdfOIVT/mNagej8HrmEHj9FSBxRJi9Is2/5in8Gfvh
	1ZosuIzY0IwIOOCsIx0cbNnK8VZjQmMU=
X-Gm-Gg: ASbGncsvhLArVtThN1YxMuFun1YqKYQ+OuuLZXVCyFYaVfxycELDi7R6a2QqIAL7DM9
	vjNXgoIgUgM+2X16GS7/P1EqWHoho9fNiq7PMOgBfbFrICGIffiqdA+FnobXN7YHxG79pSYy5zJ
	38rTbB2FoLu/LhmL5PE7yV6tsQPaSP2KKQO51I0OqSg0l5LnZ3GAVh74fslDhCGO6Gtg7a3x47c
	p2bnqqSL4nddMx1gJtl7YD5hGXFYmypDy97Qh/1ENwFlzc8IJGHY1aSPfQx9nmP91IT9AWCorZ3
	KzylTgbNObSy/0jUIWUz9K4v5QQg0yuM3q8G4iNKbrRcHBTwviuI0P56AssRnDPyJ0EXYmk=
X-Google-Smtp-Source: AGHT+IEA8GU353sKcnteGmKTMEBzbiCaPQJCce5ujMTjOBQ1mFHaCHAzcFHXEgsI1VWuM6dNVzZd0ZtPLCtRbzcDf70=
X-Received: by 2002:a17:907:7f1c:b0:b73:37aa:87c0 with SMTP id
 a640c23a62f3a-b76572b27ccmr132695866b.23.1763622206151; Wed, 19 Nov 2025
 23:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20251119163327.16306-1-jszhang@kernel.org> <20251119163327.16306-3-jszhang@kernel.org>
 <aR4CLQ_2-kUM-e2F@smile.fi.intel.com> <aR5gpsbw_r-y4JdS@xhacker>
In-Reply-To: <aR5gpsbw_r-y4JdS@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Nov 2025 09:02:50 +0200
X-Gm-Features: AWmQ_bmQiILHNoGbrxHaQiqyqVXCGmcrQ_qH6-ZV56DmIu-i9MkYErmA4p9ogqA
Message-ID: <CAHp75VdxDz4hG8TH2yGbQ1CmFTSd8m+6sBfuvD-aybuXY9SoQg@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] gpio: brcmstb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_230328_300649_36BCB5A9 
X-CRM114-Status: GOOD (  14.48  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Nov 20, 2025 at 2:46=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 07:45:17PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 20, 2025 at 12:33:14AM +0800, Jisheng Zhang wrote:

...

> > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > > -   .suspend_noirq  =3D brcmstb_gpio_suspend,
> > > -   .resume_noirq =3D brcmstb_gpio_resume,
> > > +   .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > > +   .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> >
> > Can it be DEFINE_NOIRQ_DEV_PM_OPS() / NOIRQ_SYSTEM_SLEEP_PM_OPS()?
>
> Yep I agree with you. But IMHO, it's better to make the
> DEFINE_NOIRQ_DEV_PM_OPS() switching as a seperate patch and merge this
> series which wants to clean up various #ifdef #endif usages

OK.


--=20
With Best Regards,
Andy Shevchenko

