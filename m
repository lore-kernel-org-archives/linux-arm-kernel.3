Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E257C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oB4W4SH6htOtdlhb8GrE+2UJqq21f/9wPF0wA34Zojk=; b=0rUtYV4+61cnVYeSCqfD2gmSYs
	+mXHQerrzWL7biNQ/AvA419V4FFoHpoVsIvoMaVxSKuzCcNReSUpPfT3dpO8doEmMKOCEMkz9HrGV
	8jbchD1igHb46F3267vwLjcX3+xkFimZq9BCtnwMs3EXgAZb2EEXcQY+rvWHJ8oHNRJApP1aGRvMC
	2E2/iC8QV68N/CflTp0kMW3AUwrQTFIrspPGwA1dxp01jKijb3z6jnNZhB4ckh1cNGJSLJSZDdrSU
	xuzqKdzIsf0Ksv2NcBlK6oHiuidXG0d7+ClK0n3L6zX8BNXnrpr4Vos55LUDEZHW+vao8eZ7BsVSo
	5qCEzy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tatOV-0000000C5SI-1iKe;
	Thu, 23 Jan 2025 09:20:59 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tatND-0000000C5Gp-30cf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 09:19:41 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30613802a04so6531951fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 01:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737623978; x=1738228778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB4W4SH6htOtdlhb8GrE+2UJqq21f/9wPF0wA34Zojk=;
        b=sG86R61+3DGr99MCSC+n4WKz7wq1TIuPf2YsBeq1omZcCfDuYA5BmwHPAuWJrUOrEK
         kwa1k+KLf70KikMKx3v3YyTxmIZRMOz7LGvigModxniT/NQNPaCx9FQGjYhVy832cdcx
         +2LCECTfQ3QthP6DF1XgjXNmF+RwRS2/QABYQGY4Aw0Oy0t5IxZV7oqCy4g1LQjW0rzj
         RrTUHhp7j5IfqcPeE2kYew3+7b4ygV+4beuAK+SPjJMfMqRcHkjTlmmRANHgZdOMBwKg
         2SHibHTukPxbTs41Yqkmw3h/HOQmrn48DSqsfKdwAru02wIaQYZFXxx2K6iNd9H893++
         vYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623978; x=1738228778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB4W4SH6htOtdlhb8GrE+2UJqq21f/9wPF0wA34Zojk=;
        b=NHk4rd7HKXkxgGbHu20SSbrI91EN2xFboyiyTl08+LkItrPEI8dh8aUz9/oCULAZgE
         qLzUZf4tLgg4VvKed6mk0g+nXQM0qeRyUmFOiG2+IsbRrG08QuhtNg3yu99x4ragz43+
         LwmhZKEg53OrIH/31/TwqPU+qJKO+5tBkhTNYXbvoTUbmZ5EsIHY5XPsGKptYfBAoZX+
         Zwis4ssCgExP+tP9lNNzhF9xdRjXpOvRoOu7U6PxmyJZqD+Lc9HpiPDESrLKpg0C1o1F
         UXJq3aLn+Ws52Iy1P03lmPX2g2X6T+uwqT0HubwFf6qLH0NInwMOpUcT/GewL2qd80+A
         faPg==
X-Forwarded-Encrypted: i=1; AJvYcCXe4iQPzMNgWVdpR15oDqBVDR3u9GZ3fMfENA/A6jBMUfvujbbvsAMo89bMcWU1QCP1LvQK3jSmtMMqtw7wPQT2@lists.infradead.org
X-Gm-Message-State: AOJu0YzgGIz3BLyE7w9eZSQ3MDf7Ik2qDO1gSCEQPrhdHfxvakvVjrxs
	uLiJigDI6DMhyQhHGSj2KmVwYO/dxON2tZB3LB+osy4nrArct0DXdC48FoeF3S2w1hKmTdFBo/O
	0GM19jmUGuP7vzIwrPJPLXLvBv3aoyVYUrHWTUQ==
X-Gm-Gg: ASbGnctDTOUj/KNVaJSgZrTR5H0I4BqwjKLWVTnn02SszQibW+vQRYaNTrq2CH7bV4P
	rvgHPGargmyukFUiZoVy9dbjEnfP4kDqxdI2iciE6QXrrhGWi1Eh+DUFc5y5RmL8RSRxhBcmIrF
	qrTh1V4CbtggT6XioS+g==
X-Google-Smtp-Source: AGHT+IGbSoxSTFInm4TCaCofKOLTJWRiuDcAw2dKFZSYyjUZBr9SIVV2X/zkpumKU3mLaYhF4wBklmHsUPwTqe2gouc=
X-Received: by 2002:a2e:a373:0:b0:2fb:4abb:7001 with SMTP id
 38308e7fff4ca-3072ca5c94dmr67603241fa.2.1737623977535; Thu, 23 Jan 2025
 01:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
 <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de> <CAMRc=MdYB_XHCaurs1mO+KGX7rB5zFT3zCi=UbNY0rSbMEJdWw@mail.gmail.com>
 <3f21523b-816e-488c-bf0a-c6677c375a18@pengutronix.de>
In-Reply-To: <3f21523b-816e-488c-bf0a-c6677c375a18@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Jan 2025 10:19:26 +0100
X-Gm-Features: AbW1kvYo_Qrh_r7UXUMBdQ5UCw_ecPTbUqtFHQIGsKawdSRJFwErHJRVdlHKD1o
Message-ID: <CAMRc=MewWr8nrUBgWe+ckTuVdmLC=grkw1aWeXnWszcaBZvZvQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_011940_019315_73D92276 
X-CRM114-Status: GOOD (  22.50  )
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

On Tue, Jan 21, 2025 at 11:37=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> Hello Bartosz,
>
> On 15.01.25 17:52, Bartosz Golaszewski wrote:
> >
> > I recently wrote a user-space compatibility layer for sysfs[1]. While
> > right now it doesn't support static base numbers, I'm very open to
> > adding it except that I wasn't sure how to approach it.
> >
> > Is this of any use to you and could it help you switch to libgpiod
> > without changing your user-space set-up (given the support for static
> > GPIO numbering)?
>
> If the goal is to have a drop-in replacement for sysfs outside
> of the kernel, I think it needs to maintain the same numbering.
>
> I am not sure I see myself using it, because the new projects are using
> libgpiod from the get-go. My issue is not with removal of sysfs, but with
> user hostile deprecation approaches.
>
> > If so, how would you like to see this implemented? A
> > config file at /etc that would list chip labels and their desired GPIO
> > base?
>
> Many GPIOs tend to not have labels. I think the mapping config file
> should rather map GPIO controllers to a base address. The same thing the
> kernel is currently doing. This assumes the numbering of the built-in
> GPIO controllers is deterministic, e.g. by consulting /aliases. I haven't
> checked, but I hope this is already the case.

Well, they will have labels, it's just that the label will be
something like "6e80000.gpio" which can very well be mapped onto a
predefined GPIO range.

The file could look like:

/etc/gpio-static-base.conf

```
6e80000.gpio 12
foobar 340
```

Where the first column is the label and the second the static base
that must be less than 512 - ngpio.

Bart

