Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB197CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 15:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ykchracw+64FV50znwUKIsNmGJUvAyGYO9sAVqRHDLE=; b=q+Es2chS46uyBbixOZa+c28LHU
	1fvIlKng+cwBWHC1rxoKwopdU3bDcX7wWfVB6sAKzE84VlZD97S8Z82E+LRn3pNbRCCIVKQcQ1Q8W
	P8h6QOwjGerfrCrGJvT8LeTE+VH5VOvwDV9kk4rK1yZBaDKBqrfUDFxd6FEA/F8qPxNkGxQxJBI6i
	kZ+220pmaiF4Q1yXOxXi65+L78Y9zHe7nKnA1s0rOqFfMwic+iIKZ1o9CmdFDXjBkuGHFK9FjgTDI
	Rrq1hvC2LeNFuog76fTthiWsJf4IeZJpl7ZgOQI7SRXZwJfd4hhsDouPSkDfNCiA/FV+ZLNDdI3G5
	EZwchPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK73-00000009s20-03Ay;
	Fri, 24 Oct 2025 15:53:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK70-00000009s14-0bHW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 15:53:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-27c369f898fso35079815ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761321233; x=1761926033; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ykchracw+64FV50znwUKIsNmGJUvAyGYO9sAVqRHDLE=;
        b=EoQUYSHGCH7vbZim8lqrAziwocyUxdJaq9R5sbgN6EyhXB38jjdYgynyU+vPB2l1ed
         x0BSSjzneVs6B0NIylJr4oSnGzU/7iQoh7vRLMCnBIty4vDBzUJOvv9XGEC+Py8x+0cC
         QezEB5TRmCFnsg9jPOxNyDwm75YT4448tdewDq3XeQL/xjKEDtRqimA6Mnr2I2nuF+z/
         kn2oaBNa8Dsnij96hLKLxa82sd5xVFsabieVqscyIasGz0zFNckoMs+JuBOmEF1NrM1o
         Q55w9699nPOIEciOgpS7FL+/U+QuZ/8yD5CSr4lvz1D4Gdl0xBVue13oEGMNVKoZsLdu
         AGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761321233; x=1761926033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ykchracw+64FV50znwUKIsNmGJUvAyGYO9sAVqRHDLE=;
        b=XskvMmlVIzeKCOxZwrHSookhDVA8fUwwcq5i70id5yNnaHJlrWXsHWezWKTRhYppzM
         MNdhYYD+nmO5Q4zl8ato4KfTD1lacDpxoLq6/2GLC6G63DSaqR3m59l9LdP5lcVpEXmy
         Nel8fbmKZKqv5p1lKlB9MZwwdZ9VukOY8hiP8SJxVxdVzeDnwFHE22q5wn21A3QkuJL6
         d+tUusAEpMlcGtNqOF6rt6edtSKBUEXRkshOkpJEXBkq3PhbFG0tErvofBP6eOT67zoF
         Q2PAYiesAxrP1R3cLWqzm7nlFE3luWHglLNlxUaq8JBuCaFbhLOB7ExmiiIDtC/9hzT1
         +Y8w==
X-Forwarded-Encrypted: i=1; AJvYcCVoyR+inBn/o2TJI04WPWWnnqZui+iZjJIeoA3jmH1BTRVIAzV+GZdXMSYMfWBMYlvCT52Y2BG55WWS3qS65eXN@lists.infradead.org
X-Gm-Message-State: AOJu0YxsKZ/CMhnoEl0lFnFBaHsyixMPUlfzLeAXKpkKHpijNGTFz78t
	7Vb2+mSB3Qg8QjJnpx3Vzq7mE/ekJTCXqaAsbXQ+AB6in/IwxzFd6DXZIag032u19w==
X-Gm-Gg: ASbGnctGLqdUoElzfyJzyE9mT4uqTtsSam8aur+55sQ8pmqQNqmYzUoV5650WGJ9fFJ
	uTG5e8tz5YsKn95Z6PnOTZanRi9Av73ogyrxkINnweGBevQgv9A71vW+z+SO6jhLGu0mtMoMarV
	H4T5/hKi1c3iDyem1T5NqmHP0dJ+aXUib3vM6xievq9vT073oZF1BqabvSkDnkUnXCfVzfH6Lri
	xHgkegPkRk8si0olFaeZ5zW0nnPDc+NAWZmZY7zRXgGBosW7rz2uVjP56KHybeuv4fqcBMwgl99
	V0Y7uBiAimpuDUetm553zjnkvU4O93SGBeyOEM7SgyTQO+9M8Grfpd8iN4f2PqdAJqXHAgt3ohZ
	2NamU1QFhLOXxD3dVNSptbAwy8tMiVgHAdDAqFifPoivzS9J5TVUpN1BAUjiDxPdgA55419qVAF
	ArrC10OAHhRcVxCD8JlG46YDlLrDyIUlZL/OBByrMjOvh60OCpo9/cK6mEeKk=
X-Google-Smtp-Source: AGHT+IE+x2HD+4rMk0jkd18ooIAbdLhaDO73LscS2bNI12WgQHcODQg8NS4kS+ef5tm44z2hD8HW3A==
X-Received: by 2002:a17:902:ce81:b0:294:918e:d230 with SMTP id d9443c01a7336-294918ed5edmr16496605ad.56.1761321232883;
        Fri, 24 Oct 2025 08:53:52 -0700 (PDT)
Received: from google.com (80.88.82.34.bc.googleusercontent.com. [34.82.88.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e241d65sm59444195ad.107.2025.10.24.08.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:53:52 -0700 (PDT)
Date: Fri, 24 Oct 2025 15:53:48 +0000
From: William McVicker <willmcvicker@google.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	John Stultz <jstultz@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] clocksource/drivers/exynos_mct: Add module support
Message-ID: <aPuhDFKINM9iXOKb@google.com>
References: <20251023205257.2029526-1-willmcvicker@google.com>
 <CGME20251023205319eucas1p24eb9821bbcb2d59e2cb1e01c4366faab@eucas1p2.samsung.com>
 <20251023205257.2029526-7-willmcvicker@google.com>
 <40d3f3c9-7526-440b-9dbd-7ead22c8562a@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40d3f3c9-7526-440b-9dbd-7ead22c8562a@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_085354_188792_FA02596E 
X-CRM114-Status: GOOD (  39.24  )
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

On 10/24/2025, Marek Szyprowski wrote:
> On 23.10.2025 22:52, Will McVicker wrote:
> > From: Donghoon Yu <hoony.yu@samsung.com>
> >
> > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > boot (and even after boot) the arch_timer is used as the clocksource and
> > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > source for the arch_timer.
> >
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> > Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
> > Tested-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
> > ---
> >   drivers/clocksource/Kconfig      |  3 +-
> >   drivers/clocksource/exynos_mct.c | 56 +++++++++++++++++++++++++++-----
> >   2 files changed, 49 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index ffcd23668763..9450cfaf982f 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -451,7 +451,8 @@ config ATMEL_TCB_CLKSRC
> >   	  Support for Timer Counter Blocks on Atmel SoCs.
> >   
> >   config CLKSRC_EXYNOS_MCT
> > -	bool "Exynos multi core timer driver" if COMPILE_TEST
> > +	tristate "Exynos multi core timer driver" if ARM64
> > +	default y if ARCH_EXYNOS || COMPILE_TEST
> >   	depends on ARM || ARM64
> >   	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
> >   	help
> > diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> > index fece6bbc190e..a87caf3928ef 100644
> > --- a/drivers/clocksource/exynos_mct.c
> > +++ b/drivers/clocksource/exynos_mct.c
> > @@ -15,9 +15,11 @@
> >   #include <linux/cpu.h>
> >   #include <linux/delay.h>
> >   #include <linux/percpu.h>
> > +#include <linux/module.h>
> >   #include <linux/of.h>
> >   #include <linux/of_irq.h>
> >   #include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> >   #include <linux/clocksource.h>
> >   #include <linux/sched_clock.h>
> >   
> > @@ -217,6 +219,7 @@ static struct clocksource mct_frc = {
> >   	.mask		= CLOCKSOURCE_MASK(32),
> >   	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
> >   	.resume		= exynos4_frc_resume,
> > +	.owner		= THIS_MODULE,
> >   };
> >   
> >   /*
> > @@ -241,7 +244,7 @@ static cycles_t exynos4_read_current_timer(void)
> >   }
> >   #endif
> >   
> > -static int __init exynos4_clocksource_init(bool frc_shared)
> > +static int exynos4_clocksource_init(bool frc_shared)
> >   {
> >   	/*
> >   	 * When the frc is shared, the main processor should have already
> > @@ -336,6 +339,7 @@ static struct clock_event_device mct_comp_device = {
> >   	.set_state_oneshot	= mct_set_state_shutdown,
> >   	.set_state_oneshot_stopped = mct_set_state_shutdown,
> >   	.tick_resume		= mct_set_state_shutdown,
> > +	.owner			= THIS_MODULE,
> >   };
> >   
> >   static irqreturn_t exynos4_mct_comp_isr(int irq, void *dev_id)
> > @@ -476,6 +480,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
> >   	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT |
> >   			CLOCK_EVT_FEAT_PERCPU;
> >   	evt->rating = MCT_CLKEVENTS_RATING;
> > +	evt->owner = THIS_MODULE;
> >   
> >   	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
> >   
> > @@ -511,7 +516,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
> >   	return 0;
> >   }
> >   
> > -static int __init exynos4_timer_resources(struct device_node *np)
> > +static int exynos4_timer_resources(struct device_node *np)
> >   {
> >   	struct clk *mct_clk, *tick_clk;
> >   
> > @@ -539,7 +544,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
> >    * @local_idx: array mapping CPU numbers to local timer indices
> >    * @nr_local: size of @local_idx array
> >    */
> > -static int __init exynos4_timer_interrupts(struct device_node *np,
> > +static int exynos4_timer_interrupts(struct device_node *np,
> >   					   unsigned int int_type,
> >   					   const u32 *local_idx,
> >   					   size_t nr_local)
> > @@ -653,7 +658,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
> >   	return err;
> >   }
> >   
> > -static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
> > +static int mct_init_dt(struct device_node *np, unsigned int int_type)
> >   {
> >   	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
> >   	u32 local_idx[MCT_NR_LOCAL] = {0};
> > @@ -701,15 +706,48 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
> >   	return exynos4_clockevent_init();
> >   }
> >   
> > -
> > -static int __init mct_init_spi(struct device_node *np)
> > +static int mct_init_spi(struct device_node *np)
> >   {
> >   	return mct_init_dt(np, MCT_INT_SPI);
> >   }
> >   
> > -static int __init mct_init_ppi(struct device_node *np)
> > +static int mct_init_ppi(struct device_node *np)
> >   {
> >   	return mct_init_dt(np, MCT_INT_PPI);
> >   }
> > -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
> > -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
> > +
> > +static int exynos4_mct_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	int (*mct_init)(struct device_node *np);
> > +
> > +	mct_init = of_device_get_match_data(dev);
> > +	if (!mct_init)
> > +		return -EINVAL;
> > +
> > +	return mct_init(dev->of_node);
> > +}
> > +
> > +static const struct of_device_id exynos4_mct_match_table[] = {
> > +	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
> > +	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
> > +
> > +static struct platform_driver exynos4_mct_driver = {
> > +	.probe		= exynos4_mct_probe,
> > +	.driver		= {
> > +		.name	= "exynos-mct",
> > +		.of_match_table = exynos4_mct_match_table,
> > +	},
> > +};
> > +
> > +static __init int exynos_mct_init(void)
> > +{
> > +  return platform_driver_register(&exynos4_mct_driver);
> > +}
> > +module_init(exynos_mct_init);
> > +
> > +MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
> > +MODULE_LICENSE("GPL");
> 
> Sorry, but this still won't work on legacy ARM 32bit systems with MCT as 
> the only clocksource, which needs a driver available very early (that's 
> why it used TIMER_OF_DECLAREmacro). You need to make it conditional 
> under CONFIG_ARM:

Can we rely on the bootloader to setup the MCT timer and then hand-off at boot
once the driver is initialized?

Daniel was working on a solution to transparently handle calling
TIMER_OF_DECLARE() when a timer driver can be configured as both a module or
built-in here:

  https://lore.kernel.org/all/20250625085715.889837-1-daniel.lezcano@linaro.org/

Daniel, do you have plans to finish that? In the meantime, can we go with the
`#if CONFIG_ARM` solution?

Thanks,
Will

<snip>

