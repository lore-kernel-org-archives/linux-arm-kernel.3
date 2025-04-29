Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6FDC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AFZuP5QCiVw2bvfwORhzfZHSaEjFI09KNVHM5hnVfQ=; b=LSv1aZXn0s6s78SNXtDl1KOI1V
	MrLxV3cJz1ZvKLKtzXtNfhaPHF7bU7JUX984dcofxeJ6WZTJs6h+onp09QI+Xo7kt6hc9tY5TM5Fz
	zh7Acp6tACmEEKIBrpUt3VeN92VAclR72vjE5rci43MPvxO3LtBtWEfMwsHiAnYF23l4XPC4e7MG3
	XoDeu3Q9dHwJKAXO8H1oy2f9vXB6r8pN+IaoZGBWm7KgUP1evaglH1ZV/1dvAXXjNaQva2qeUF1CN
	Xk5A8Hr4ER96d3G9vXHZH2I7Fy2k+E7YD0p5OQibwg7BS69Ou5+DOCluZpAfbVsUPgG3WGdIqVOEk
	Fut+NItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9h85-0000000966c-2pnu;
	Tue, 29 Apr 2025 09:19:53 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9h5S-000000095bq-1l1d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 09:17:11 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e73120cc26fso3714296276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 02:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745918229; x=1746523029; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9AFZuP5QCiVw2bvfwORhzfZHSaEjFI09KNVHM5hnVfQ=;
        b=H/kVQX+hgXXpIvyO1AIbWxP5HY8qrl8QMQOQApmtlGkEbmhZrS5CO+DqMLSo4VYRKY
         csKPAYmualGagFkUkZAfrXD5hI4ifRah5jW0BoVHNLS0e6mD+4vAN4Ml7OrdWgZRK1nS
         d604tLTeKDXH3hU7QepWaSoOJ0EdsFYRHa5B5YSDKrZeD1PpkSmnmaels+ENK41SuzND
         2MXM4iLaaGdfBHd0ku73xD1xsR6YnajYHNkoaSBa31vg85B1bDwMN5KHIu+i+U0to3FA
         dyV7n4svlFz7jm3ObupvtA4bdfnVGtVkt7v8de5qNhZS4DDqa1/U+7GiXGmt1UqdF3Yy
         CCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918229; x=1746523029;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9AFZuP5QCiVw2bvfwORhzfZHSaEjFI09KNVHM5hnVfQ=;
        b=EfsZ7rhIqDF6mS+gffqj7NX/+9DB+PC00vI6gvlwVLxVeaLIkjv37LusOF+w1ok+wk
         H/2rYCV0cPOCpI9+F1iOXwY/IaXGug/OzneU287W2BJGwCkQ10gMqnCTmLDl4oYqApzj
         ah5qYxjUSeJ1RkbL/Zv2SLKdGJ3Pj2zwjoYhSjX6B5vJxbyrHzsTst6r4+wplMBTSKv3
         LZScKaZ2HCObi2VUTJGUbXoLbJSOp8AUYyrNJf5talja6e7NA3cgFcw4VzIpk1UrxTnD
         AnxkKpvJLRLINWLITpNwFL2Raea4ouszOOHXrQipyFVR0S+EMaqsVCWGotOzLUcNMCuf
         mJUA==
X-Forwarded-Encrypted: i=1; AJvYcCWu7cx4kNBbXjbmWB5ZpNHk6j3+vmxaW+gqW/eC1qN5WCe8roR1OaHhecoqvikUa8SRBNxuJblDsvFZ30MSrMrc@lists.infradead.org
X-Gm-Message-State: AOJu0YwD3VToUqz97mJcmCx4Q8rMJhj8Wp1CNF//t7kX9U0v1A9BPGho
	Byb1X9RpF6w45KbS46VITZfwElJuYzDfxC/Majo9oKGCJ8lnz63WMtZO56B/JDzSvQN7/Xf68Yp
	yY+D24uEc5AdhPhjiTuamCVyfP0CL3PWMvE68Gg==
X-Gm-Gg: ASbGncv2a3TvrD9xiqyYUXUWfy0SaX/ynShs70CmMn4grXXvIQdgrs1LAwiX04Kpx/o
	h9xFGfGptLQa9rrjP6Rrs3oO7ADy2WD0pjbzVtff6TdlXTKCq3GgEoSAI2RQu1jLES+9ekqF7BN
	MkkXuY0v+a20RBRP1q87IfbFg=
X-Google-Smtp-Source: AGHT+IHzF99Jc5zjHiTwpYwDuGNz5KeVf6zfylnYOW5l1S9c2m17qhd0GLM02sExOq6djyUCeukxpH9Gv2n/QOZUitk=
X-Received: by 2002:a05:6902:2085:b0:e72:ecd8:6d51 with SMTP id
 3f1490d57ef6-e7323471842mr15952277276.46.1745918229201; Tue, 29 Apr 2025
 02:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com> <aA-yRD3FX5Nr9ypK@shikoro>
In-Reply-To: <aA-yRD3FX5Nr9ypK@shikoro>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 29 Apr 2025 11:16:33 +0200
X-Gm-Features: ATxdqUERauDj9X-EyfbLPJoHlMhqfczBHusMUQhGDJMr2QFYf9GT2Yl7ZA3WSRs
Message-ID: <CAPDyKFrWrw4ZthJ_GGZQ-qtgrPjQ2j0BoJTVbHH_qA1oTMt0kg@mail.gmail.com>
Subject: Re: [PATCH 00/11] mmc: rename mmc_retune_* to mmc_host_retune_*
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Aubin Constans <aubin.constans@microchip.com>, Ben Dooks <ben-linux@fluff.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Hu Ziji <huziji@marvell.com>, 
	imx@lists.linux.dev, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Viresh Kumar <vireshk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_021710_453856_A2F78029 
X-CRM114-Status: GOOD (  19.27  )
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

On Mon, 28 Apr 2025 at 18:52, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Ulf,
>
> uuuh, I overlooked this mail, sorry!
>
> > Sorry if my suggestion was unclear. I only had the MMC_CAP|CAP2_*
> > related functions in mind. I think we should leave the mmc_retune*
> > functions as is as they are not "can" functions.
>
> I agree. I suggested that in my initial series, too.
>
> > mmc_host_cmd23, mmc_host_done_complete, mmc_boot_partition_access,
> > mmc_host_uhs. All in drivers/mmc/core/host.h
> >
> > According to your earlier renaming series, we should rename these function too:
> > mmc_host_can_cmd23, mmc_host_can_done_complete,
> > mmc_host_can_boot_partition, mmc_host_can_uhs
> >
> > Does this make sense to you?
>
> I don't know these functions well, so you are probably right. I'll look
> into it. One question: do you really suggest:
>
> mmc_boot_partition_access -> mmc_host_can_boot_partition
>
> or should it be:
>
> mmc_boot_partition_access -> mmc_host_can_boot_partition_access

The name tends to be rather long, perhaps while at it move to
mmc_host_can_boot_partition and rename the MMC_CAP* too?

>
> ? I tend to think the first is better, just making sure.
>
> Happy hacking,
>
>    Wolfram

Thanks and kind regards
Uffe

