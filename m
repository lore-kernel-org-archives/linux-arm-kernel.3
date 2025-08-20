Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D39CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqORxA01ddfu04i5AUCIuKJMwCymPmwnJNmkHBTnk70=; b=iadSldNFrYpnjc/VITpZFEZ2LG
	o/afcyn3JSR8vph/prFaObM1voAQm1GEUzsSiKBgOZBkc2TplMI3NrwmVqeve8wmnTpIW7fE2Vki1
	E6rJZrwqcvc2JufWYb9heNuK1PrtOB285J5sip+O82h4IZ0VHUtEeWiSAvxWVaPykhhM31gr45fIV
	KCp9Whgln/QfxrdAPiyNqOLO+QxIPDZpaWrKPMSFfuifqLABht5vF4k/KTaCH5zeZ1WITiT5odGOw
	6DLRLZORo/2IQGCnu8+IYJ3GNZ+vmKo+w0OFoF90iPGaS5mtZQJhz0s9sDU/BYrDP/V4ibEpMSGin
	yFsHcbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoswU-0000000FHsN-0c0x;
	Thu, 21 Aug 2025 00:14:10 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoo7a-0000000Ek1L-3aT9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 19:05:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afcb7a0550cso35225466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755716717; x=1756321517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqORxA01ddfu04i5AUCIuKJMwCymPmwnJNmkHBTnk70=;
        b=icLPYzPSH7tMDRnfy9N/z+Qvt6wqj0Mmf1GiHwfe8l7Q6sld1llyWcrxd2vHf+uq53
         Ebq7myos8LvCEBayRtB/UIln3S3d+Q+VigX2KO0hRZWGS5npoA9J1Hl1fdx3ug2jhakY
         dNYvZWgtdIWuPAyWiZXovTMWBpaB/4GRQLtLJHGsk4gCdd0w/zXV5FwOIGdd1GiCw0vW
         zbS1pLtxVq8EBqs+ovxJpqGR77lBzBLCf7uttN+3FxXZfwQPfKl9Zet6O7QLJGY34Gf6
         gmZor+t4Dmvpjj4cQQBKkxj5PWp6SNB/PRzDmxscCfgEGc+vI87A+R4pAsMqGyMa0DAf
         tOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755716717; x=1756321517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqORxA01ddfu04i5AUCIuKJMwCymPmwnJNmkHBTnk70=;
        b=MwLXvkovRgL/F+LU8FPME8EhFtQ5w2pwR5fZocnJcnQX/jwWK4Y79CovtBqZjfzBWM
         wL3TDpNCvvsJCeoNCDWltNYNePF7kqKhxKosyGZMXL+vBjH0H5f7YhXmoYz2km1ZL9PW
         y7mCV3QNo1s2NZ8RN6Zp9pGfGa+kXflkkIR+MIFRt/az2cKfcVr/jgNILz8LA4tsz997
         hQt8PUQF3vNyan6WjjnK21SVrqGcKOg8tdDNEjWlAV97js+7cATnk65jLVqRNnrWNPAy
         99lBX/UYszAIyTfI72XSRPKJWFms2w0eT3yxi7gFwMzwV7Wl4VQ4WtQ3BGa6gzybLi+o
         Byog==
X-Forwarded-Encrypted: i=1; AJvYcCVXNg8/Znpqz+P1VVv/V0eSFz/njSZTaGPfPPrOxKcrIdD6udtRW/xxvo1TOpf2Fp+xVjqhNQoxv+XvZRzQ884P@lists.infradead.org
X-Gm-Message-State: AOJu0YxSk6vQbdNI4t1nuX3K+HnN/8XtO26HzP3cFMq3n61z/EjRaXh7
	P+9vIfJ/xy/7X4+FCEtovy+FCZ6dzCp0Ovoqv6XPJSVu3qCMQms5t6hXIJ71qD0wELAPnqFQdhw
	0+S30OtJiHVmV0NAgql6l5Iym/NiBgCw=
X-Gm-Gg: ASbGncsRx22hIXmSlyPROge5ybMUBaWyQOgmDr3+GlW3SvmbBNQZ65fxPtoILy9Qw6y
	Hiln3KUq/tC6MNzvj+N61xNPFRmORvGQSabKMMz32/6xnA+kz8YkenYIlvkq7OAgbBUngL22Rmf
	F4kISClTkcysTIgDlJ8/r58OmRjob374XjeKWzg4ltiS+7/xNcsNr3WKokmfLK35mFoB4+OaiWx
	HptKyWm3v3iD4x31w==
X-Google-Smtp-Source: AGHT+IHJiPRx0SngC7bjC2w4GtEgXQh9A32wKEsxcZ0CVXXlaP6DEiOwl/6IKq6V3wKbKch1kJfDHW692elgTcsQBhY=
X-Received: by 2002:a17:907:94c3:b0:ae9:8dcb:4dac with SMTP id
 a640c23a62f3a-afdf00a8cf1mr325925166b.14.1755716716491; Wed, 20 Aug 2025
 12:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-2-jszhang@kernel.org>
 <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com> <20250820191039.4f8af41e@barney>
In-Reply-To: <20250820191039.4f8af41e@barney>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 22:04:39 +0300
X-Gm-Features: Ac12FXzx226wSucqjOB8xNIk2YZERgxrOlmASf3USK3y_yzf_ctFUIqwnOa-1u8
Message-ID: <CAHp75Vdpgf3DUMQw0mYqhG=9UrYG8KWrobbd387QZapBor_LHg@mail.gmail.com>
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
To: =?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_120518_895976_7FE1AC97 
X-CRM114-Status: GOOD (  16.82  )
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

On Wed, Aug 20, 2025 at 8:11=E2=80=AFPM Michael B=C3=BCsch <mb@bues.ch> wro=
te:
>
> On Wed, 20 Aug 2025 19:54:44 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> > > The dwapb_context structure is always embedded into struct
> > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > > data overhead for !CONFIG_PM_SLEP.
> >
> > I don't think it's a good approach to add a lot of data for peanuts in
> > case of PM_SLEEP=3Dn.
>
> It wastes 36 bytes in case of PM=3Dn.

...per port.

> The driver currently allocates the struct with kzalloc and stores a point=
er to it
> in case of PM=3Dy.
> So this probably has an overhead in the same order of magnitude (pointer =
+
> malloc overhead/alignment/fragmentation) in case of PM=3Dy now.

...per driver.

So, I can't say it's equal, but I leave this to maintainers to decide,


--=20
With Best Regards,
Andy Shevchenko

