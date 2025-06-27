Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0BDC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jj2bLybNvPyHSij0xa+7vNe8FDo/UYuhavfR08FTa9E=; b=WHAnGaCXQ4Dgv7yZW2GsC7d0eZ
	6cCZij5sX+C64g5xvnGyNdh82Ag9/sBflHtJOQhMkpu1h4exn41BJgi53uA48fTrvBOCoMJeSKbZc
	JwJW2eow0LHgOVTcbrkKqGl2MAEd7zXtgLZRCXsyeM0EK6hoziGn8Gi8zyQphfJpIowfLftSvUvwB
	spkpsTevN4iSZ6CIo8UWpM6xFcgxKBvoA+a3gf4RUbbAQ+A6iK/PScSJ40M1X4FOyMwAv2jiy0rzS
	16xRhhx8GA+G62QPq5hZHt0fSu25nXfSjh54JAlsPylm6w+OPrW+SlMwtLtCHHunfzjTPY9YcZWSy
	nA+AgtnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC1i-0000000FI3Y-2kej;
	Fri, 27 Jun 2025 16:34:10 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBBv-0000000F8X3-3ptQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:40:41 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60c6fea6742so3886222a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751038838; x=1751643638; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jj2bLybNvPyHSij0xa+7vNe8FDo/UYuhavfR08FTa9E=;
        b=muK7Ask3Kz1/S+KRzzrB/SPYa2JSdv9fApBJQvWj3EzuUbb+DvbJDhcVbzv2xlQasA
         znJsQwYQZcRzcVB7OzUckov9SAoY9jRj5v8KkWtbeNTARuInGETSwpA054T9jLJqCTc/
         Ocp8dBLPqxGuRq45DJd0Jf/0/cdFdwRQdgLFEHMZCUkjARwQ6mvAEZXF4U/SBHnlCjMq
         RmtfEZpv1zqij/Ouoip+71AA9Z7N6F0vsPR2tUNofHzcjfQ7mcL4/IDDOuI60ECTHYUX
         0PlLyuTUlLLNrHEZJwWQeFsVGBQQ9QzgsSjV2R/GKCb3A7eLFUKL3IhSdSLxyWuPQJu0
         Fbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038838; x=1751643638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jj2bLybNvPyHSij0xa+7vNe8FDo/UYuhavfR08FTa9E=;
        b=g2SKsGiPkjo90nL5yESsp4VjbUQ4wD3WP8xPd31hRMd2ax1+lZ9CN+BZTogCt+iVUD
         e5D4llbEFjdq0eRZd46vunXDXMhqh5cHjpKsnSEuLUehHKB5ER3zZ2gW9AJAWfx1zqiQ
         0Gq9myfsF81FqhjIGmLzpi1S/z4uODLNohbYbm480ivep5ORvmtDhWYjG4nTVMouZGNz
         P8bSnZrp+h4nFRtsbDKBq8mqzXqnyQlSzcRt4L/TwQg4tonHz1BtgMXDC2bAbikNSzG/
         D6KjarbW1uGFNN2n0WDVz8A1Ra6klJfU7XDy6bhRC5JYo6cqXZCU1ISjQL+vwBlXaBxy
         rknA==
X-Forwarded-Encrypted: i=1; AJvYcCUkMtYKUfMLy/RcWFKgKd42IW4/qQPOh3rcMeY37hi5LQjuMi1PpUYyo/Q0p1jv7AO/WLz2iE3WrDOhYBH/CwoD@lists.infradead.org
X-Gm-Message-State: AOJu0YzhXBiclEUqazuC57O8rO8sm6bbX8UIjhJQao47KM7d9dFEEqKj
	2OvWy3p42+ESe+EWVttzMa9ZQKFaP3gb723ilisxlZAfiCTGUO/iNpE/gRSw24eZslIHhQjhHb0
	/PAMUvzH1SLzFt4ibAJIHkVCc6FjqhDfIvEQ7hZrVYg==
X-Gm-Gg: ASbGncs8999JOjvDUWltpSMy9q54tm/QrT0jEZ5jEpTMs/DOF0xpLMmXVKmBV0gDYB/
	+XguyFhLAJQ93fmbi/hO1+k2TVvu2B5sl2tVV7W4JL1RtsEknY+hWuLVG/StJbNAXuiGrXVD6A4
	AR242oBfRYoJPUtqqFd4ENFjsfOli783pMd1F/4JcU6EKxOPQWmKDmODRpLc2qCqz6KaNt6d/iz
	3SxPg==
X-Google-Smtp-Source: AGHT+IEvkXr4JcCj5oD0vFiY1H6Wn1hmSJv40jglC0KLoMmc4+ZOMxDrQflQwFqUtAQPpKoqyo8PcKiVmvrT6rHam7I=
X-Received: by 2002:a05:6402:2802:b0:608:6711:a06f with SMTP id
 4fb4d7f45d1cf-60c88b33e2bmr3273384a12.4.1751038838221; Fri, 27 Jun 2025
 08:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250626215911.5992-1-hiagofranco@gmail.com> <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
 <20250627144955.tbmk6ako3rgv3djo@hiagonb>
In-Reply-To: <20250627144955.tbmk6ako3rgv3djo@hiagonb>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 27 Jun 2025 09:40:27 -0600
X-Gm-Features: Ac12FXyUCI-R2q8qxbHAG9epzvsz_v3mTi9fyUrRB-IT5cqGx_PrRwpqh4kxuRo
Message-ID: <CANLsYkz3SD1PPnVwoBnnKhyCUig67o+=NgoDucq5m+4sQ=xMYQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084039_980731_6E307882 
X-CRM114-Status: GOOD (  34.12  )
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

On Fri, 27 Jun 2025 at 08:50, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Fri, Jun 27, 2025 at 08:31:20AM -0600, Mathieu Poirier wrote:
> > On Thu, 26 Jun 2025 at 15:59, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > This patch series depends on Ulf's patches that are currently under
> > > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > > Without them, this series is not going to work.
> > >
> >
> > I thought we agreed to repost when the feature referred to above and
> > the work in drivers/pmdomain/core.c will be merge.  I'm not sure what
> > to do with this patchset.
>
> Sorry Mathieu, my goal was to update the whole patch series with your
> reviews from v5 so you could take a look and then I would resend
> everything again once the others have been merged.
>

Ok, I'll take a look next week.

> If you prefer I can wait for the other patches to be merged and then
> send the next v7 corrected.
>
> Best regards,
> Hiago.
>
> >
> > > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > > started by the bootloader and the M core and A core are in the same
> > > partition, the driver is not capable to detect the remote core and
> > > report the correct state of it.
> > >
> > > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > > returns the power status of a given power domain (M core power domains
> > > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > > already powered on, the driver will attach to it.
> > >
> > > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > > return before dev_clk_get() is called, as it currently generates an SCU
> > > fault reset if the remote core is already running and the kernel tries
> > > to enable the clock again. These changes are a follow up from a v1 sent
> > > to imx_rproc [2] and from a reported regression [3].
> > >
> > > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> > >
> > > v6:
> > > - Added "reviewed by" from Ulf and Bjorn.
> > > - Fixed and improved commit descriptions of patches 2 and 3.
> > > - Improved the comment inside imx_rproc.c file.
> > > v5:
> > > - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> > > v4:
> > > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > > v3:
> > > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > > v2:
> > > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > > v1:
> > > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> > >
> > > Hiago De Franco (3):
> > >   pmdomain: core: introduce dev_pm_genpd_is_on()
> > >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> > >     SCU
> > >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> > >
> > >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> > >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> > >  include/linux/pm_domain.h      |  6 +++++
> > >  3 files changed, 73 insertions(+), 7 deletions(-)
> > >
> > > --
> > > 2.39.5
> > >

