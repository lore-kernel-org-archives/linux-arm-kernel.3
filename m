Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A156C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6rmzsH2Z8JYzFqIg2uMkj0gt9jdeZsll9yf1qnb10c=; b=J2YLrqeGMnZi3ASC2/yuGEjqzg
	CI5xrLoDpUcIG775pTYYOoRmYy+a5RrPkDCNZQ6tklFdeV2B822iW8iUdLSkhg3bQrqLdoLJLCGnc
	z5GnntcHGjkZvDImm5pRzuQ29tu+/FDcwQFV8ifjTJe8FPFzoNoV3IwDtYaAP1VIzw7CLl7kjd7F4
	p3NCU16BvodjQn1yrMsmKmPgSUIndjcn4tE6b0JeD6Nj1guBa19xbEs+22EIL9C+ZuA3e4UhhsD3L
	siHYP9yLyJSW01ycIxZx0JVj7q7/aCDHClIc8e+SANbvCM7z0AU3cln7xKKD8FR8kc+himu+Qn/fl
	UmRydlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZLN-0000000BRm8-3Xl5;
	Tue, 14 Jul 2026 09:22:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZLK-0000000BRkC-2y69
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:22:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493b1710405so21541375e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 02:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784020940; x=1784625740; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a6rmzsH2Z8JYzFqIg2uMkj0gt9jdeZsll9yf1qnb10c=;
        b=F3ZxipJnEGNtHL6y4un41b6hQmMR2xgIP1uHUKYjo7LBAiRzaf4/ncL9JwCsp+TnBA
         5YYxi/kDq1orfuluawnKdvhMy4nAYC/P1vT0KeqSeN7upmJZReljgf3HmA+PwA7hsMCb
         96iLI6oJvQl0rX5C7eNb8BBu5MrvQ/m+E3FyP3w0lyNI7S0s6szQ2rpF4lEiAZ7W/kgw
         ngQ+pxLMWHy+mXBEGYOC8G4W3kmGRK46P7uwPvckC/cgIqbziq+QpurNXGCchGbsmH1Q
         d6Cxhk0XBnAhQam5auzXj5kc92sX5T4isl8kmcDiiJyv01yawFSJuqDeLJf9PJ4EVvEy
         jwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784020940; x=1784625740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6rmzsH2Z8JYzFqIg2uMkj0gt9jdeZsll9yf1qnb10c=;
        b=ZI6rs1I3fgLGZGK6mXUFeVCRnxAsNno7YvXw67zH2FtKxtAPZRA0rHMbsO/PgusSwl
         1BiWzzkHvz2kwtjMoZVp6PW3/yCCdIcVEFHVbSZX1vUnvnxVhYlZ6P7NKjUcdmxaSyMM
         4mnPrH8qMBDynwCOoGjdlmHUNFWedWIZzdrECpywCzESFi/rzzRBMXq9rIWC1iwocp5O
         qVDF2IRfQIrF+9KkAfrwrdk/mvlJe4OJhmkBG3ZcQk4fwsrmIysc2b6PEDBapGr8ND5e
         0FpP77iQCiXSG25BMnLCnCpDo8H3uzmON0dDNnuDzVmJ6SeXDOVz4A7uN1HiCX45ksD9
         SWNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/g0arTZGMEEzJjIlmXbxtHe4Qk9ttDk7c6M387lHRkJEjKTFxZjnW7zizdIc7OkqMIJ8D2iXDwC5YcYZtBIHE@lists.infradead.org
X-Gm-Message-State: AOJu0YzJePtMUH9LJTqNoNdPHlfw+Nrtn9gc7gjf4jN4wF5wXJIzVfb/
	RU3JL6nz4XWo2Ybw00jXkG8UI84Wq0sWoVR09MLMS9XZq3vCdKJDLJhzanBDQJ8KcUw=
X-Gm-Gg: AfdE7clGs5fq9F39SEGOwPN5+6EXKd4eyllSCAiKD1FDcyRBZIdn+Z13Xfolgdy3fTs
	vlxIrK6x4ovkUKARDAqJC62E2hZCwkku9OhokmQXzeyucomFGjs693Ac8+HIQ8JB2v3j/LBsI78
	Nmq/deLPP0I4VxSjAWQOhql2d1cqCbM+qLdYJNFmC9DJVce2NI2J8yM9bWL3I1cHwYnwoBqGkaj
	YIIo7zsroudLMDpdF/2j+AvaSdtYRfxePTHy814dPXH9liiW5/ptHfOS1dTN9ADs5OwxVn+2Dj2
	ttpN2QxVqLZw4jk32EupDUhaj7N7uoe65paF0Rre/X5IAnV79z+bE1S25NOJXjM6a2rBYsnmx+/
	yX02+mHlinY+xX//ba1V7z2ZKdtGJwnSBVX0pp/Ds2k37Xctz+Gv56HPXxpKFLFq+YqOFCabK5v
	dfIghcKqHnWJA=
X-Received: by 2002:a05:600c:524b:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-495159060f6mr32557165e9.24.1784020940226;
        Tue, 14 Jul 2026 02:22:20 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2dd8376sm214271875e9.2.2026.07.14.02.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 02:22:19 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 14 Jul 2026 11:25:48 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
	Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v6 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <alYAnJ66npeYbncs@apocalypse>
References: <cover.1783097764.git.andrea.porta@suse.com>
 <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_022222_788750_77F4841C 
X-CRM114-Status: GOOD (  17.64  )
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

Hi Uwe,

On 19:05 Fri 03 Jul     , Andrea della Porta wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> The Raspberry Pi RP1 southbridge features an embedded PWM
> controller with 4 output channels, alongside an RPM interface
> to read the fan speed on the Raspberry Pi 5.
> 
> Add the supporting driver.
> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/pwm/Kconfig   |   9 +
>  drivers/pwm/Makefile  |   1 +
>  drivers/pwm/pwm-rp1.c | 435 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 445 insertions(+)
>  create mode 100644 drivers/pwm/pwm-rp1.c
> 

<...snip...>

> +	.driver = {
> +		.name = "rp1-pwm",
> +		.of_match_table = rp1_pwm_of_match,
> +		.pm = pm_ptr(&rp1_pwm_pm_ops),
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver(rp1_pwm_driver);
> +
> +MODULE_DESCRIPTION("RP1 PWM driver");
> +MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
> +MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.35.3
>

I didn't get any feedback after I replied to Sashiko's latest concerns, which I
don't think are relevant. Can we proceed with this patch or are there other 
concerns about it?

Many thanks,
Andrea

