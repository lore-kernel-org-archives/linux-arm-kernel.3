Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EA9C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7F6e96RqSKPGmem9HBErRTXIUJKGfyH5j1B0FbnrDKg=; b=f31PKjWAAniFmmD7HjygY+/L4c
	XLmlLOMlZY5BCK0HxSZjVTA3AIZwmiTnOuXIhIa+3jnpDtx/go2TbzP95eWXMaX6CBIiB+EWNp0iB
	AJiGuv4Buc0f2oOaC5GW6SEanv2RknaNAewd+590kB+uCE5CLsA+VK0g2uDjgG1YxGh8oP50neuRd
	Ore7yKYGWExxpmzVT9FhR46EF4CXN3GZBTcUH49cB4oLACEBDvc6UqFi8DHWmgFiu6c3mhg7dfMYT
	uLmGqaYKp0lZAh/u5p2XUHmg5TNgdYATHX6pJ9IZ3U/EnhMfmni/zFZyLcT6rdjYuT7yQHN7eFqmS
	ujhZ3iSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrFH-0000000E7A6-1B9A;
	Thu, 23 Jul 2026 11:05:43 +0000
Received: from mail.lysator.liu.se ([130.236.254.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrFE-0000000E78y-3lK9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 11:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804739;
	bh=in9hEhcN7GZIhf5isSbTI+bdoIywHLb1dvz0Fr6zf8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tW8Xoa+0b/mCUVJ8g7Q47oO1dyPG9n6hCgNyM++UFQnOd2EA6N4JjSFEcFsx9viWb
	 r7biqkcKGTMC+OaZ/3v2ex7NcW9e4LK1kkXl/qZdm6qwarotDVHZLgRywz4PYgLt2b
	 jknLty5x8JpMaOvXkuVL7Rui3+PT2SO/fj68cCIhirqW40ZE0lcFALWKkkrgQqHrQP
	 FcsGx+JSPmZvmUg1DEcdSlXDO2kTOhT5Al7sD9z4gbUocVIeieyRKr7kt+P3dIMOlA
	 TCnrxuzzOTPtI+bJ/pNf3d11PKvQN10GuIcNywdhtg/QLWidylUr4z1DHiOIsWovwY
	 LX1dYGr/e3R7w==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id F2B481BA3D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:05:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804738;
	bh=in9hEhcN7GZIhf5isSbTI+bdoIywHLb1dvz0Fr6zf8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HaNiWzmIBWJVBSJsRJJ8c/DXwjT7fF8muRJE8Rm0su1jhjdvn6i82TqC+BGoIMlVM
	 SjURUD2qphclpVAURYsPbcq0vcEcgUyNkE/v24QX1CTUksIx14/kisHSA8zXdY+AX0
	 0eZ/18kX+lG/Hp+jOgLKNs2LLeOKL1ZeZl4vqX4IvcvtiTjFCrzvi1KpUk+KKdWiOo
	 Dn8mencDb3F5LiIYOR/ykXWhstypFke6WR+eDt7jOckVER6utAw6v+WE3JOHN8rtFl
	 RDDM76/Gal+AyUMIJE7YdHtQqBGFA2B0i0z2/occ/D1B+uNxfFYP+MMt0pXF7TUgF9
	 4VKyDuVEltXDw==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id D8AC41BA3B; Thu, 23 Jul 2026 13:05:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804735;
	bh=in9hEhcN7GZIhf5isSbTI+bdoIywHLb1dvz0Fr6zf8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cDADhrnSooOAJAKlP+6sPGj0ZmHprOaXuXCNwO1rm0KW0Rqbt5pFqHg2dJuvM8jO4
	 8/urmtjseU0trg4HV1gDOchC/QWfMB0NBzT3Y6ZnL85L7pVnUz10cBfWFJ3DCo7O2B
	 3Pc7FR20gSzCiGy+ulFQlBBMCY9nFSRhsXUkqgNUmf4opyW5WtnQBtLkCLeAsTrzPl
	 +CU1up2o0xr4GhrNW7ptRZKrdEWEupLgGktl9E1CqFZ3qOPqwBMVOGUBuWQWS/uzSk
	 oVIbCkGYL1HQTLDlMsLgqnhgP8b7orjWAlIMzt/z0JW7ei6b+MS4/+l67gYVUX0nR0
	 4r0nSwWfogwHA==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 55D2B1BAAF;
	Thu, 23 Jul 2026 13:05:35 +0200 (CEST)
Message-ID: <5df2c584-c63c-4393-99e1-909528f0c085@lysator.liu.se>
Date: Thu, 23 Jul 2026 13:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/7] i2c: davinci: add support for setting bus
 frequency
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
 <20260719-i2c-mux-v12-5-a5010d623a57@gmail.com>
Content-Language: en-US, sv-SE
From: Peter Rosin <peda@lysator.liu.se>
In-Reply-To: <20260719-i2c-mux-v12-5-a5010d623a57@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_040541_107336_65AFFFC5 
X-CRM114-Status: GOOD (  25.60  )
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
> Populate adapter with clock_Hz and .set_clk_freq() to enable support for
> dynamic bus frequency.
> 
> Remove bus_freq_Hz entirely and only use clock_Hz instead.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 33 +++++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index f543997c31e9..87fef17bca55 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -132,8 +132,6 @@ struct davinci_i2c_dev {
>  #ifdef CONFIG_CPU_FREQ
>  	struct notifier_block	freq_transition;
>  #endif
> -	/* standard bus frequency */
> -	unsigned int		bus_freq_Hz;
>  	/* Chip has a ICPFUNC register */
>  	bool			has_pfunc;
>  };
> @@ -171,6 +169,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
>  	u32 clkh;
>  	u32 clkl;
>  	u32 input_clock = clk_get_rate(dev->clk);
> +	u32 bus_freq_Hz = dev->adapter.clock_Hz;
>  
>  	/* NOTE: I2C Clock divider programming info
>  	 * As per I2C specs the following formulas provide prescaler
> @@ -207,16 +206,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
>  	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
>  		d = 6;
>  
> -	clk = (input_clock / (psc + 1)) / (dev->bus_freq_Hz);
> +	clk = (input_clock / (psc + 1)) / (bus_freq_Hz);

Repeat bracket comment from 4/7. I.e.

	clk = input_clock / (psc + 1) / bus_freq_Hz;

Cheers,
Peter

>  	/* Avoid driving the bus too fast because of rounding errors above */
> -	if (input_clock / (psc + 1) / clk > dev->bus_freq_Hz)
> +	if (input_clock / (psc + 1) / clk > bus_freq_Hz)
>  		clk++;
>  	/*
>  	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
>  	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
>  	 * to LOW ratio as 1 to 2 is more safe.
>  	 */
> -	if (dev->bus_freq_Hz > I2C_MAX_STANDARD_MODE_FREQ)
> +	if (bus_freq_Hz > I2C_MAX_STANDARD_MODE_FREQ)
>  		clkl = (clk << 1) / 3;
>  	else
>  		clkl = (clk >> 1);
> @@ -267,7 +266,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
>  		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
>  	dev_dbg(dev->dev, "CLKH = %d\n",
>  		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
> -	dev_dbg(dev->dev, "bus_freq_Hz = %dHz\n", dev->bus_freq_Hz);
> +	dev_dbg(dev->dev, "bus_freq_Hz = %dHz\n", dev->adapter.clock_Hz);
>  
>  
>  	/* Take the I2C module out of reset: */
> @@ -279,6 +278,23 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
>  	return 0;
>  }
>  
> +static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_Hz)
> +{
> +	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
> +
> +	/* put I2C into reset */
> +	davinci_i2c_reset_ctrl(dev, 0);
> +
> +	/* compute clock dividers */
> +	adap->clock_Hz = clock_Hz;
> +	i2c_davinci_calc_clk_dividers(dev);
> +
> +	/* Take the I2C module out of reset: */
> +	davinci_i2c_reset_ctrl(dev, 1);
> +
> +	return clock_Hz;
> +}
> +
>  /*
>   * This routine does i2c bus recovery by using i2c_generic_scl_recovery
>   * which is provided by I2C Bus recovery infrastructure.
> @@ -755,12 +771,13 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>  	dev->dev = &pdev->dev;
>  	dev->irq = irq;
>  	platform_set_drvdata(pdev, dev);
> +	adap = &dev->adapter;
>  
>  	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
>  	if (r)
>  		prop = I2C_MAX_STANDARD_MODE_FREQ;
>  
> -	dev->bus_freq_Hz = prop;
> +	adap->clock_Hz = prop;
>  
>  	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
>  
> @@ -800,7 +817,6 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>  		goto err_unuse_clocks;
>  	}
>  
> -	adap = &dev->adapter;
>  	i2c_set_adapdata(adap, dev);
>  	adap->owner = THIS_MODULE;
>  	adap->class = I2C_CLASS_DEPRECATED;
> @@ -809,6 +825,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>  	adap->dev.parent = &pdev->dev;
>  	adap->timeout = DAVINCI_I2C_TIMEOUT;
>  	adap->dev.of_node = dev_of_node(&pdev->dev);
> +	adap->set_clk_freq = davinci_i2c_set_clk;
>  
>  	if (dev->has_pfunc)
>  		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;
> 


