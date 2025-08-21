Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9DCCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRLqK08OVMmJdMROYY5gLtmulSbN9W6tBOjQn6amin4=; b=Gi06rr8sQixMOqBlF6pHUbQNI9
	ANp2Nwu6Fi53Zlt6sRtwrYDdmO7MT/dcLCltll8J52FGE0qPmUkyDqtWBmhNxp21SM/Qsa51sWyjJ
	B2v31hcY/HY9A8DV2pygfjxjg89rbTJd39dCxtMt9ayPR2ieXQEEXsfAl8TTnwZJy+TNIGBv7oOpJ
	JpGKra67TI5dFLbWEaUAYnja0S0ncc1rmC7sBu2KNYub7Yv0eA7fRpxjEyk8pfZTYBhs87Pw8Cx8z
	Llk5KCgJl41x5G+XJYErcE81VdSNWvVYxQCGYaaAk4LT8LUWYIyhHF/3xIy63n2upX48cVKR5HXfJ
	vGuJhEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFBY-00000000z7A-2EJx;
	Thu, 21 Aug 2025 23:59:12 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upB1d-00000000JNA-3Y15
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 19:32:42 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7a3a085so230747666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755804759; x=1756409559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRLqK08OVMmJdMROYY5gLtmulSbN9W6tBOjQn6amin4=;
        b=VaYExI7PGMwa0Ahlfr2cwXnOY50MoT5fLxSdDDb+xMbrxWkaUFlqDcXBZL+xMDG2hk
         ftwe8ta3fVWQ1X/mx3UjtzDWagCIazyXQjna3ZGXPhh2++PX8X6VbiFvZ+v3+5v7JGOB
         JxkmshnsgkN7K7WS2Wl8/cpV+q44JhlhpJ0DQtk14uBrkmQzL1QC+3Mf4ARcv8vXl2w6
         imgA6hMDjSKuVKN4lrZv2uSM3Qn9tyA6o1SVBCbdtMFseQ4mF6p/qbCBpLHTbL4t77y6
         2yIBzEDZtx4DLxHSOmKEuAnEcIH7rH18PHoDLIeg2ZAQqs8A3GB2T1amNVqQSItRo7ly
         2E+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755804759; x=1756409559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRLqK08OVMmJdMROYY5gLtmulSbN9W6tBOjQn6amin4=;
        b=JwvYKuhO4RNhur/wuAiP1hs2QmY2vds0mLEW+3QSs6Uv0g7BKvVrVZS/agE83CXH4E
         Bg8n0f20R+CgS8FgzLx2wrS+bxJNKBSwi9QPnp8eKFVzGEjH4bNaSyFnzBDFstFbdTj9
         VmlNF1vPt07FS9CVSO3/kEmAdE/Vb7gDCHet09Xh2g6g+X8ft95dV9z0fXE9Vmx82GIK
         vacGdBcCujNRhr7sn0qCDLfVmxvqWTOIb03M0/8x+3vH1lSDxXlxqdQ+MdumTa0e/d3r
         ws1stf/JtZ0ULKroGwHubCvUe3zcxOffgTDZifdI9iwyQot7wQwUl4InHR3hWT3WPKC0
         Ekxw==
X-Forwarded-Encrypted: i=1; AJvYcCWIFDjeC/ShifoTw4LAIuXr+LvRxFQ/yq4pcDsFAJZIA8fuTVexEYNO05PyQtEXSotILK5tycSGMwiR1Arx716e@lists.infradead.org
X-Gm-Message-State: AOJu0YxYJ5imykPsQ14DaAELkQHUhECDoxWzFS7IsoF6MJg2bnlks3il
	UMcIMWA2XRdiyb1p+lDEtj+5eWWGSGmcHffSouHKHEQIKwpab1aeiDysaxTSUffBVzpd16Jni3A
	2l2OYonRFOR0pOJqmMgbmm6uxd1bj+n8=
X-Gm-Gg: ASbGncvJsi9h6L6SiTqP2r63NREQK+9b/SAzCHdw7dal8j2kpfaL8RDc/26N7xJbiTd
	eQA+QtXADHANIyel9bohjGyxx7cqHAcUfcilhgAW3OtmwG4Z2FE46clWp3aNZ3D7mMlzzWMKblS
	T0snmgPvI90G25YavSDNBxgfeYrwM2Ii0B/FOz1RuC6Hca3Vtrx6DEoKeXb9Tz2lyUYu2dLIl21
	i0BGCQ=
X-Google-Smtp-Source: AGHT+IGOIbVKqBj+vmRS/jNj35fqo6hWeIQ+/QWsSjigHRPAp04Gjd/a80YAnw+ewLJoCZCFVYccVfOoYsqlgEeXGU0=
X-Received: by 2002:a17:907:9305:b0:afe:dd9:de22 with SMTP id
 a640c23a62f3a-afe29636c7amr26949366b.56.1755804759066; Thu, 21 Aug 2025
 12:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-2-jszhang@kernel.org>
 <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
 <20250820191039.4f8af41e@barney> <CAHp75Vdpgf3DUMQw0mYqhG=9UrYG8KWrobbd387QZapBor_LHg@mail.gmail.com>
 <aKdNBhpNofchexgb@xhacker>
In-Reply-To: <aKdNBhpNofchexgb@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 22:32:01 +0300
X-Gm-Features: Ac12FXyjIQRwKlj3uPfKIF3JpppwdcYeB0_SHnmwLlcXBwK3Cn364srz9mf2Mt4
Message-ID: <CAHp75VfG3mZsBMTeg0nwDJV2PKG=M+UAst4fy05oh+Df4YGL8Q@mail.gmail.com>
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: =?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_123241_885011_5B0416A0 
X-CRM114-Status: GOOD (  24.51  )
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

On Thu, Aug 21, 2025 at 8:02=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Aug 20, 2025 at 10:04:39PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 20, 2025 at 8:11=E2=80=AFPM Michael B=C3=BCsch <mb@bues.ch>=
 wrote:
> > > On Wed, 20 Aug 2025 19:54:44 +0300
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > >
> > > > > The dwapb_context structure is always embedded into struct
> > > > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 byte=
s
> > > > > data overhead for !CONFIG_PM_SLEP.
> > > >
> > > > I don't think it's a good approach to add a lot of data for peanuts=
 in
> > > > case of PM_SLEEP=3Dn.
> > >
> > > It wastes 36 bytes in case of PM=3Dn.
> >
> > ...per port.
> >
> > > The driver currently allocates the struct with kzalloc and stores a p=
ointer to it
> > > in case of PM=3Dy.
> > > So this probably has an overhead in the same order of magnitude (poin=
ter +
> > > malloc overhead/alignment/fragmentation) in case of PM=3Dy now.
> >
> > ...per driver.
>
> Before the patch, struct dwapb_context *ctx is also per port.

OK. So the comparison is 4 or 8 bytes per port vs. 36 bytes per port, corre=
ct?

> > So, I can't say it's equal, but I leave this to maintainers to decide,
>
> What in my mind now: this is linux rather than RTOS. After greping the
> the arm/arm64/riscv dts dir, the max port number is 6, the berlin2q
> soc families, so this means current we have wasted 216 bytes memory which
> is trivial compared to the system memory.

Maybe, but this should be clarified in the commit message. And again,
I have no strong objection on this part, but it needs to be described
accurately at bare minimum.

--=20
With Best Regards,
Andy Shevchenko

