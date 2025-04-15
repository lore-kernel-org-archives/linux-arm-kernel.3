Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FD1C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlVAQGNvnlCWZGAKFMSG1jFD5hLtBh/GXl4+Ouwj/Fc=; b=VLVO2crnFMSz8QZxFbrIP9LAXD
	I3XT9YeOcLVz4g1laV9eBPbJxtdWp0uKu1O0+Dar9Ywy0Tn0Lm8FXi/d3w+j0Xwt3sGGN9h1Te/0Y
	UN0WH05jK5dXh8f7uGqZqHofu/VQKlYg2US1LxG1VN+evHuYYtGmyY2PEejZfJT6ShBKHj4BBKmzh
	HKKMaDlS/oKI1OIkB3wR/WVzFEH0OEFg7Cf3n5OTFSKyxZvoPdqixAzuM9/MSvEbwhB3OZo97bFIs
	7A1c1SnHv91Ejx0feVqMhtfhEDDG4stfcF0Q1v9C/4/oXgkQAEMU4iBR6Xy1BA7n9mhBh/sLthbXJ
	2PWQYPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jpe-00000006WeK-0BZj;
	Tue, 15 Apr 2025 17:12:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jUn-00000006T00-0P6h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:50:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso58048325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744735847; x=1745340647; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tlVAQGNvnlCWZGAKFMSG1jFD5hLtBh/GXl4+Ouwj/Fc=;
        b=RL0882UmDT8zZYhbzfQATYNPgmNy0MloC/sbWWer2862q3zRT1eCKtLP+9ilDVAXaL
         6s0yc4siKwn0yH8NcvYCZX7EWXmGGm1BFqZ2B3wrtVGCGpEqMrYwQvph9r/4+961vnJU
         wYyMPx48GXyDPrVlcAGsORAQy5bkiDtMIMTjY8c6zoFX9WUoyA7AQLnuh6Xw5xzT1cUY
         OHcrmq68eYLZkGx4g628PDCJDru+9EX2AWteVsGxoJMEMzxWZsq79WDIvjnLr0awpGHD
         Xnf6MlVjR0LNkrS/5fTJoNXqNyMX7g5l8iJyGCQ6xrQTmsU3QIavBJupg0JpyouNmjzr
         wAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744735847; x=1745340647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlVAQGNvnlCWZGAKFMSG1jFD5hLtBh/GXl4+Ouwj/Fc=;
        b=kiDMa0ahqrZRWipiMoGaLw6B3reevQ5DESiTfPrD4AExTsCcJXUshzVYjxZBwNScgb
         bWXYtYKfO4sX3q2w0fXwd+tN12Sc/IVfGyywA0WtJjNbmQUWh1oVMTyx/Kci+k7DRHp4
         i1jxxZtP5hS8H4dyTQVFL8TqCNibngnvgdm+bOiGPiq8ql9I9D04UVnxtm6u07eH4Dd4
         gS1TcxmjHS9e4xmt3leChXIsfIGg+ogY3p6syna0fyUXbi13LC79lK3a3bJWUA+FxA1U
         nM2B6M74x+PF8Dwmdw76lLbZokH64lxLBO14Y8EC8pTogyOwvB1Ie6XDdYva3pdI4VSy
         8MqA==
X-Forwarded-Encrypted: i=1; AJvYcCUjCRxbqiW27FyJr6v0y9Zcuus9lTnMw3Q7hFcLfRCiHLpbAkwTx+S9kIupHyvW3qQLhp8oyxiIO2q/GubL3Zrp@lists.infradead.org
X-Gm-Message-State: AOJu0YxbFCyi8L/ftcLsC8TfoBW9htZjQJGntHt/PbZfZFcB0wn3FjwD
	mY82Dl+4aLmN4AZT++3XDlc7mwFs5DhKimkf6JsBJ3vj3JjAxbQ4/DRpFrmzY3k=
X-Gm-Gg: ASbGncs6k+VFtx60QZOXyxtxn6rnSSWWGPrZQp2+hb2gkv1MI3BwkYiLcIIJKbfL8tT
	sR45V4qXIzNB+pwzxzTzhwMVZmOOh1N/b0qB50EkVbs6xrVjCEXANObfrENqd4S4umcQNOYAiuf
	1Gig7koVrh/jWaSjskzusumsz4+Ter4vRJj6uDBNZEsQsP0KOjieea7VoW/iBnE2vYWEsDiZT7P
	XJfWyt65Ej+zhZRRb8zwUVyZj5VtCGYsLWOPWezuZMqkh5UdxuH3EIP8ZvtRKQw0SFHCOUrscDX
	7hfta5eojBriPbr7wYmmj2K9HzC07NxyyFPYL9UCkfmosKojANIK0FIVay/ZM+0Cc7lVCKf79H5
	gh6PKDaTmdfS91A==
X-Google-Smtp-Source: AGHT+IH/mPDTsLx4PlG7B3akd7q5hvRmVjt0R/Ymm4Ns9uebUkuiIOp2ecSrLQUodXoC8P0d0Jpwsw==
X-Received: by 2002:a05:600c:1f94:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43f3a925de9mr183619625e9.3.1744735847024;
        Tue, 15 Apr 2025 09:50:47 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c81f6sm211899675e9.20.2025.04.15.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 09:50:46 -0700 (PDT)
Date: Tue, 15 Apr 2025 18:50:44 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
Message-ID: <Z_6OZHYfC0bC5289@mai.linaro.org>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402233407.2452429-7-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_095049_151752_A838BDF7 
X-CRM114-Status: GOOD (  32.51  )
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

Hi Will,

On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> From: Donghoon Yu <hoony.yu@samsung.com>
> 
> On Arm64 platforms the Exynos MCT driver can be built as a module. On
> boot (and even after boot) the arch_timer is used as the clocksource and
> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> source for the arch_timer.

From a previous thread where there is no answer:

https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/

I don't feel comfortable with changing the clocksource / clockevent drivers to
a module for the reasons explained in the aforementionned thread.

Before this could be accepted, I really need a strong acked-by from Thomas

Thanks

  -- Daniel

> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clocksource/Kconfig      |  3 +-
>  drivers/clocksource/exynos_mct.c | 49 +++++++++++++++++++++++++++-----
>  2 files changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 487c85259967..e89373827c3a 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -443,7 +443,8 @@ config ATMEL_TCB_CLKSRC
>  	  Support for Timer Counter Blocks on Atmel SoCs.
>  
>  config CLKSRC_EXYNOS_MCT
> -	bool "Exynos multi core timer driver" if COMPILE_TEST
> +	tristate "Exynos multi core timer driver" if ARM64
> +	default y if ARCH_EXYNOS || COMPILE_TEST
>  	depends on ARM || ARM64
>  	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
>  	help
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 62febeb4e1de..8943274378be 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -15,9 +15,11 @@
>  #include <linux/cpu.h>
>  #include <linux/delay.h>
>  #include <linux/percpu.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_address.h>
> +#include <linux/platform_device.h>
>  #include <linux/clocksource.h>
>  #include <linux/sched_clock.h>
>  
> @@ -241,7 +243,7 @@ static cycles_t exynos4_read_current_timer(void)
>  }
>  #endif
>  
> -static int __init exynos4_clocksource_init(bool frc_shared)
> +static int exynos4_clocksource_init(bool frc_shared)
>  {
>  	/*
>  	 * When the frc is shared, the main processor should have already
> @@ -511,7 +513,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
>  	return 0;
>  }
>  
> -static int __init exynos4_timer_resources(struct device_node *np)
> +static int exynos4_timer_resources(struct device_node *np)
>  {
>  	struct clk *mct_clk, *tick_clk;
>  
> @@ -539,7 +541,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
>   * @local_idx: array mapping CPU numbers to local timer indices
>   * @nr_local: size of @local_idx array
>   */
> -static int __init exynos4_timer_interrupts(struct device_node *np,
> +static int exynos4_timer_interrupts(struct device_node *np,
>  					   unsigned int int_type,
>  					   const u32 *local_idx,
>  					   size_t nr_local)
> @@ -652,7 +654,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>  	return err;
>  }
>  
> -static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
> +static int mct_init_dt(struct device_node *np, unsigned int int_type)
>  {
>  	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
>  	u32 local_idx[MCT_NR_LOCAL] = {0};
> @@ -700,15 +702,48 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
>  	return exynos4_clockevent_init();
>  }
>  
> -
> -static int __init mct_init_spi(struct device_node *np)
> +static int mct_init_spi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_SPI);
>  }
>  
> -static int __init mct_init_ppi(struct device_node *np)
> +static int mct_init_ppi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_PPI);
>  }
> +
> +#ifdef MODULE
> +static int exynos4_mct_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int (*mct_init)(struct device_node *np);
> +
> +	mct_init = of_device_get_match_data(dev);
> +	if (!mct_init)
> +		return -EINVAL;
> +
> +	return mct_init(dev->of_node);
> +}
> +
> +static const struct of_device_id exynos4_mct_match_table[] = {
> +	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
> +	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
> +
> +static struct platform_driver exynos4_mct_driver = {
> +	.probe		= exynos4_mct_probe,
> +	.driver		= {
> +		.name	= "exynos-mct",
> +		.of_match_table = exynos4_mct_match_table,
> +	},
> +};
> +module_platform_driver(exynos4_mct_driver);
> +#else
>  TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
>  TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
> +#endif
> +
> +MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

