Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8B9CA0FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLSpwY6RNF1An/589ykdgqwqMQlC8m6DMs4VS5fCzsA=; b=26QVmfmfuAv1fmijsJ5ceblLyO
	mFvoeLq+z34NyFiHPPqp9a6EIp26KSMXmAfncvH3ObptYm8f/xEF2mGyxdk0QKRzpNVGaHPMiGEWN
	zWGKTKrNRnyJW/hE//18ZeYg6IQZOyM+mbIaRuEaKmh4WRk9L+zTPccafA+//+RvJ8mh9PLS1WnZo
	c2gkLO55jHfAw1HBlii7LiU4gno3D37UI62Xdtn2hcf8qHfn904H6Lc4j9Uiu7x5EDoFTjANZEQYv
	VPv+OzVSS5h5d4282/qLtT0O/21tw6MWDNQzRaIwTUgzyqAhzzy1f5hq0jRZcateL2aeVKPG2uDlL
	Z3NGZNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDsv-00000000kg6-0soE;
	Thu, 21 Aug 2025 22:35:53 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7K1-0000000HPbs-0i2b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:35:26 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so202430a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790524; x=1756395324; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLSpwY6RNF1An/589ykdgqwqMQlC8m6DMs4VS5fCzsA=;
        b=VO6thcMD6RFT4NpC3qBKlJbEyCMnbDMbpEnuw6IJPgwlkQa380tmgrFfXAFO7O1zX2
         5jGvVYDN5wrOURHxW1mO4SrMHsxS6A56z40G34prcuEyK5hWQmTfTgXLtGjULPHVAzah
         1MbWEMR6T6Ao5WxKnKcODChp/svTLR5rFjviACgFzK26S+pm4A6VLkXmzjr2Re4xXHLA
         g+d4cJbaulv6ZUdxKMtXAXOBBipm7Hsvzs3teE/oll0ynLsn+GE4Q05d0qiAsnITse78
         XjkXRKYwJhqdCNLvTMmDhOF0WqjfyjT2TSjYdZ+6WtP4AYSkEl+8JKjnN1zAWUPa93yI
         xFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790524; x=1756395324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLSpwY6RNF1An/589ykdgqwqMQlC8m6DMs4VS5fCzsA=;
        b=TNXUl0RBpajXzb7kYCi4tRdAmCMi2VMYscSgIr2u5kz2JE1FVMboyDIqLdq+vtFgl9
         9q++VhIdDWmsaJHT1AAlvGemzFy4GpFPP0MrtKNa2mehStFpYLgH3tF1L6BJRlPigmfL
         QPeR52zrHYYqBXbwEscXXW6Y42l9QpgvOpKtna/K5Wirfrgttqm+dxLcEQj/mB9XD//9
         6LWb0BQtMdtNbXtDpyBZS8+BEz6u7A1gEjoddLgkgzUTYVZzd0/61Dqo4XmZc2gTZ2Oq
         dcAstrhQXKJ2kK77XQ1IjrP5e3t0IFd2pBmPFQTVmaKEdeV4RACkjgI12q5S287aGBBf
         9xtg==
X-Forwarded-Encrypted: i=1; AJvYcCV/ARsFEOTVfavpRe76ZRlN9vP2ugDq7ZdiBA+cGehcsggCe3Q1YzIOnPEiRy0xl5QvHqnQNXwfVg/OD/sHAKJJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzTU4JDiTuIdcV8LdizzsNP4zOTsDa9yYN9cHK0Rg43O7TPuewy
	B95ubwwh6CwdzaUFE/aH4IfX+H1kp18GW+Rx94uCMBy/J20TI4qLGt2F
X-Gm-Gg: ASbGncvh4dcXIiQUPW4psD3q4p/CGUwl4nJBQfvl+n5VHBxvz3oAuvGHGJpJg2jSeBj
	hRcjsrQrS/lm3/K0VkDXy2Xi0jqrvODDipB7tweDmVUvzQSJuz1NUpUjj6eu7KuWnTT+wXXv7+p
	i0YLDjTKahGg/Q2Ehoa7RnR5SCW6cQlG04CgQyX2aWpXqV3Lu7v0jCn2oXbabQ6ovXuY81rqTR6
	iRM0Gq4z0jYHiBlymCQSQV8poLnV1ytcPhNWAFMrP6ZMR44Bb11+GWh0KUlm7KnbYe06j1hteyx
	dnXrtDbxvdDfWsY9491MJSIUmUsbBC55FXV6UrVSNpw+04x/iGNzj9XQY+2clXGiyLWmoeYMbSR
	CFYsO1DOu1F4dlVXI9ac3fI2dO7DSXVv59WFZzzJnA8FYHN8r5Qo6j52f
X-Google-Smtp-Source: AGHT+IGXKIXj6g5EIXQ9klworLSEI351sbS/X/g2LHpU43eKp02xoQkOVKpnvsmP/2hLrsV8ESH69A==
X-Received: by 2002:a17:903:2ad0:b0:234:8ef1:aa7b with SMTP id d9443c01a7336-245fec06a22mr40906125ad.20.1755790524220;
        Thu, 21 Aug 2025 08:35:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325154999f1sm73194a91.25.2025.08.21.08.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:35:23 -0700 (PDT)
Date: Thu, 21 Aug 2025 08:35:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] watchdog: s3c2410_wdt: Increase max timeout value
 of watchdog
Message-ID: <d41f8009-7a9d-4c46-b7f7-c8c86abd2e5c@roeck-us.net>
References: <20250818021826.623830-1-sw617.shin@samsung.com>
 <CGME20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9@epcas2p1.samsung.com>
 <20250818021826.623830-4-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818021826.623830-4-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_083525_209932_68CFA99C 
X-CRM114-Status: GOOD (  28.56  )
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

On Mon, Aug 18, 2025 at 11:18:24AM +0900, Sangwook Shin wrote:
> Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
> 38400000 frequency system if the system has 32-bit WTCNT register.
> 
> cat /sys/class/watchdog/watchdog0/max_timeout
> 3665038
> 
> [    0.330082] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=1099511400000, timeout=3665038, freq=300000
> [    0.330087] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3665038, divisor=256, count=1099511400000 (fffffc87)
> [    0.330127] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
> [    0.330134] s3c2410-wdt 10060000.watchdog_cl0: Starting watchdog: count=0xfffffc87, wtcon=0001ff39
> [    0.330319] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset enabled, irq disabled
> 
> If the system has a 32-bit WTCNT, add QUIRK_HAS_32BIT_CNT to its quirk flags,
> and it will operate with a 32-bit counter. If not, it will operate with a 16-bit
> counter like in the previous version.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 1e8cf0299713..d983cbcb975c 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -34,7 +34,8 @@
>  #define S3C2410_WTCNT		0x08
>  #define S3C2410_WTCLRINT	0x0c
>  
> -#define S3C2410_WTCNT_MAXCNT	0xffff
> +#define S3C2410_WTCNT_MAXCNT_16	0xffff
> +#define S3C2410_WTCNT_MAXCNT_32	0xffffffff
>  
>  #define S3C2410_WTCON_RSTEN		BIT(0)
>  #define S3C2410_WTCON_INTEN		BIT(2)
> @@ -124,6 +125,10 @@
>   * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
>   * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
>   * Debug mode is determined by the DBGACK CPU signal.
> + *
> + * %QUIRK_HAS_32BIT_CNT: WTDAT and WTCNT are 32-bit registers. With these
> + * 32-bit registers, larger values will be set, which means that larger timeouts
> + * value can be set.
>   */
>  #define QUIRK_HAS_WTCLRINT_REG			BIT(0)
>  #define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
> @@ -131,6 +136,7 @@
>  #define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
>  #define QUIRK_HAS_PMU_CNT_EN			BIT(4)
>  #define QUIRK_HAS_DBGACK_BIT			BIT(5)
> +#define QUIRK_HAS_32BIT_CNT			BIT(6)
>  
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -199,6 +205,7 @@ struct s3c2410_wdt {
>  	struct notifier_block	freq_transition;
>  	const struct s3c2410_wdt_variant *drv_data;
>  	struct regmap *pmureg;
> +	u32 max_cnt;
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
> @@ -412,7 +419,7 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
>  {
>  	const unsigned long freq = s3c2410wdt_get_freq(wdt);
>  	const u64 n_max = (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
> -			S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
> +			S3C2410_WTCON_MAXDIV * wdt->max_cnt;
>  	u64 t_max = div64_ul(n_max, freq);
>  
>  	if (t_max > UINT_MAX)
> @@ -572,7 +579,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
>  	unsigned long freq = s3c2410wdt_get_freq(wdt);
> -	unsigned int count;
> +	unsigned long count;
>  	unsigned int divisor = 1;
>  	unsigned long wtcon;
>  
> @@ -582,7 +589,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  	freq = DIV_ROUND_UP(freq, 128);
>  	count = timeout * freq;
>  
> -	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
> +	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
>  		count, timeout, freq);
>  
>  	/* if the count is bigger than the watchdog register,
> @@ -590,8 +597,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  	   actually make this value
>  	*/
>  
> -	if (count >= 0x10000) {
> -		divisor = DIV_ROUND_UP(count, 0xffff);
> +	if (count > wdt->max_cnt) {
> +		divisor = DIV_ROUND_UP(count, wdt->max_cnt);
>  
>  		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
>  			dev_err(wdt->dev, "timeout %d too big\n", timeout);
> @@ -599,7 +606,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  		}
>  	}
>  
> -	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
> +	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
>  		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
>  
>  	count = DIV_ROUND_UP(count, divisor);
> @@ -807,6 +814,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->src_clk))
>  		return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed to get source clock\n");
>  
> +	if (wdt->drv_data->quirks & QUIRK_HAS_32BIT_CNT)
> +		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_32;
> +	else
> +		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_16;
> +
>  	wdt->wdt_device.min_timeout = 1;
>  	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
>  
> -- 
> 2.25.1
> 
> 

