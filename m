Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400C5C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hVIghkvMLEcRN6boutRKZ8WVa32rj0M3KfBztevtT0=; b=JMhVEX+U8ZJLr4NHoV8JvmfzcH
	zj6tg3cyf9lCQxPVlt4E1Zkj/8+Re9EIRWlypzdOPJs2v7NF3d8z3tfMZFdFLz0KasFY05DyB+eqr
	pvZUVySd7IurKi1lkhQFNX9yZf3tXhQ4tLIUifmAb+pGJQZ9B0uUZ8A+ILC36a4/YcDKM8F7hF4Su
	DQSbrpBaxk9NrzDRNtxhyDj7Snddx2now//542ZoZsnjbJinPPmizRRyReVhhAAp2WBL7K7i5I9ZD
	xweS5imdNKtAnMp29qoacqaB40pm6QgPowcrSQ1DSsBDpcHxB2QfRpU3aHy9ZQ4WSjKReiYSDaWlo
	R+PeNXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrF7-0000000E76x-0jZx;
	Thu, 23 Jul 2026 11:05:33 +0000
Received: from mail.lysator.liu.se ([130.236.254.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrF3-0000000E75a-2ubV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 11:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804727;
	bh=YihPJyE3Si2dwoMq60eb7rEWr/RemrZtosY6FUWafRQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=ODSYM661ATahUNUm3cSf/WiyV6S7wuSBaRRoUEim2VoPlBth1KUpSzfNd5L2LFfYr
	 fk0/LmtZXjqxMkB+ul9smwNajzMWhhzTmOV1vp3pgnuowIbcelO6s78OiqO+FA3bY1
	 m+ovWQPKDewvjEsJxAW4RBz483jr7afp/zw14l6WAoMobkWZffnTIXfQifhYRbwFJ4
	 wXAXcY7WEgk9BA6knV7+Xg51WUSvhhpMy31JExcO0XVehpwdE0LgFNmHs5NzBEz25I
	 Lsgi1hyGNsfOD5mlj4llr2piK9Lb0rflK8n+WdzGXSfoKXXGJ6ACVRcx5aWJBApvDG
	 a9EyRPCFdykJg==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id BC2861B9DE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804727;
	bh=YihPJyE3Si2dwoMq60eb7rEWr/RemrZtosY6FUWafRQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=ODSYM661ATahUNUm3cSf/WiyV6S7wuSBaRRoUEim2VoPlBth1KUpSzfNd5L2LFfYr
	 fk0/LmtZXjqxMkB+ul9smwNajzMWhhzTmOV1vp3pgnuowIbcelO6s78OiqO+FA3bY1
	 m+ovWQPKDewvjEsJxAW4RBz483jr7afp/zw14l6WAoMobkWZffnTIXfQifhYRbwFJ4
	 wXAXcY7WEgk9BA6knV7+Xg51WUSvhhpMy31JExcO0XVehpwdE0LgFNmHs5NzBEz25I
	 Lsgi1hyGNsfOD5mlj4llr2piK9Lb0rflK8n+WdzGXSfoKXXGJ6ACVRcx5aWJBApvDG
	 a9EyRPCFdykJg==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id 9FD021B9DD; Thu, 23 Jul 2026 13:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804724;
	bh=YihPJyE3Si2dwoMq60eb7rEWr/RemrZtosY6FUWafRQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=juun7K1ft/J3QuLU2Dg9JAgoPyPFX+rYwfX5Gcfe5cnDmdxmYghJvagQXtY9OM9T+
	 /zAPnyO+g1eBC47v4xK6vJGast7t2v2oPvxel59DDmJ5vDUd1h1DlLPRA8tfYSO7Bq
	 AJuA0p7Pn5eIZUQhe/udnSBD6SdmYuEuXP9XR/icfmvh2DMw97uLQ23fsM9bw48Osb
	 4e630togwa0fVldDiUXWMlxM2o+SFqjTHhAuT3ju3ZHPhtkRWbWmZMoLjYFQKmclbb
	 yYLtGlbF/S91xUNZ5K6R/FGyE7o5Z2mFYTnLC5UQEgwxt735TG7G2W3KVLnmi7soWS
	 stg1Z4LVOq0cQ==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 80BDF1BAAA;
	Thu, 23 Jul 2026 13:05:24 +0200 (CEST)
Message-ID: <66e7e285-9ead-4caf-90d6-9dbbb9d86c54@lysator.liu.se>
Date: Thu, 23 Jul 2026 13:05:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Rosin <peda@lysator.liu.se>
Subject: Re: [PATCH v12 4/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
 <20260719-i2c-mux-v12-4-a5010d623a57@gmail.com>
Content-Language: en-US, sv-SE
In-Reply-To: <20260719-i2c-mux-v12-4-a5010d623a57@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_040529_906863_3A2B163C 
X-CRM114-Status: GOOD (  23.32  )
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

Hi!

On 2026-07-19 16:59, Marcus Folkesson wrote:
> The bus frequency is unnecessarily converted between Hz and kHz in
> several places.
> This is probably an old legacy from the old times (pre-devicetrees)
> when the davinci_i2c_platform_data took the bus_freq in kHz.
> 
> Stick to Hz.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   drivers/i2c/busses/i2c-davinci.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index e15eef163a8f..f543997c31e9 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -132,8 +132,8 @@ struct davinci_i2c_dev {
>   #ifdef CONFIG_CPU_FREQ
>   	struct notifier_block	freq_transition;
>   #endif
> -	/* standard bus frequency (kHz) */
> -	unsigned int		bus_freq;
> +	/* standard bus frequency */
> +	unsigned int		bus_freq_Hz;
>   	/* Chip has a ICPFUNC register */
>   	bool			has_pfunc;
>   };
> @@ -207,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
>   	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
>   		d = 6;
>   
> -	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
> +	clk = (input_clock / (psc + 1)) / (dev->bus_freq_Hz);

You can lose some brackets, e.g.

	clk = input_clock / (psc + 1) / dev->bus_freq_Hz;

Cheers,
Peter

>   	/* Avoid driving the bus too fast because of rounding errors above */
> -	if (input_clock / (psc + 1) / clk > dev->bus_freq * 1000)
> +	if (input_clock / (psc + 1) / clk > dev->bus_freq_Hz)
>   		clk++;
>   	/*
>   	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
>   	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
>   	 * to LOW ratio as 1 to 2 is more safe.
>   	 */
> -	if (dev->bus_freq > 100)
> +	if (dev->bus_freq_Hz > I2C_MAX_STANDARD_MODE_FREQ)
>   		clkl = (clk << 1) / 3;
>   	else
>   		clkl = (clk >> 1);
> @@ -240,7 +240,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
>   	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKH_REG, clkh);
>   	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKL_REG, clkl);
>   
> -	dev_dbg(dev->dev, "input_clock = %d, CLK = %d\n", input_clock, clk);
> +	dev_dbg(dev->dev, "input_clock = %u, CLK = %u\n", input_clock, clk);
>   }
>   
>   /*
> @@ -267,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
>   		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
>   	dev_dbg(dev->dev, "CLKH = %d\n",
>   		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
> -	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
> +	dev_dbg(dev->dev, "bus_freq_Hz = %dHz\n", dev->bus_freq_Hz);
>   
>   
>   	/* Take the I2C module out of reset: */
> @@ -760,7 +760,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>   	if (r)
>   		prop = I2C_MAX_STANDARD_MODE_FREQ;
>   
> -	dev->bus_freq = prop / 1000;
> +	dev->bus_freq_Hz = prop;
>   
>   	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
>   
> 


