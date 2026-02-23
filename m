Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB2FEA4FD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RuniNnNlGiTyYJotmFYj911sHoaLf3n2mQIYgujh2c=; b=4VtdTLHaLXnDX1TEIty50ecVY+
	Ck3MZDgxiMNmQIF3jCTZC0GaBqSqUHmJAy/QQZ6dbcBDhdKnn1SZGCn5Am8U4U1zBdcK+DVJ/ypGZ
	b//+DlLr7t+mUbTBhjtvhDyDujOYxG2ztDcM3u9M59s1nqT+3WTpg4Hjv8E0e5s0WmdCiE+7p24wT
	BohoyKd67bLaupsZMddrUM6u73kwGSzbk4te+bDW8sDZ167Pz4ftiaTO0dkOL8YsUaaVE0J/TWd3C
	jjxarIolrzWmuVACvC9waPTApt/GLiEKMoBYx2wgmlRUW4hyV8NOo8B69QOd+E3c9wdEyFxwPk+io
	wn36viYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXhk-00000000YaJ-0AiB;
	Mon, 23 Feb 2026 15:18:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXhh-00000000YZb-1jhQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:18:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4362507f0bcso3166526f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771859911; x=1772464711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RuniNnNlGiTyYJotmFYj911sHoaLf3n2mQIYgujh2c=;
        b=F8JYmI8YuHy7NRu6GugDlE7L6lgoMXws74U472K/yekvRUmrRr0T73ZNVENpuNxM/h
         mCFz7g/BGUqq0EALE63PtgcEfgV+rBPPi6ELQ7QpNVOIY1E5LgB63IuKcPJ6rurA2sOH
         O23q2gwkgIP5r4O2yvE24T2Fgibtz1b+nUn9fYIlx4jIOOYchqxu96gl4itoKqxENI4W
         lEvVLKGCI7LDnitox9FGVJHn9+ily7B+crYSJ5vfo/OQzvLDSFrD5vNk+uGZN5/k65XG
         q9CWTLVr/XqVVLR9MgiJPolkjzaRPaq13i2o/19ci+EXqB6NLpuJ7QoP5MyuM39JcN7N
         bZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859911; x=1772464711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5RuniNnNlGiTyYJotmFYj911sHoaLf3n2mQIYgujh2c=;
        b=opdi0ds5RlNYc6CBa7GK1pv51cVh2bTWKBOhlMv9ldcd/OMKbNTBJUO0JjrdWf77Wa
         +k4+3jdx+cTBzHukuHzzhpvwLJeVnMGfjfR5CruGhjQ4/kDYDMqdvoEQct0qsMzElDdn
         SUYESl7VqhDOBwgMaAundbCaSztyZxTgeiMwMMcfwJQgydbq7kjyfjDU5eyk7t22reNO
         1SzhyTM494YZnFWhueZB0afpScKPDK4oxhRh8IhDOnKP217zgXDD6b0jxbGIM57FSCZr
         dZ+crA0KDbMokhWG2b1ip2kb9Hrk2WOTygNWzYRpuLX06XHZNM+Tg9r+p7rrXz6KJcAs
         tAfA==
X-Gm-Message-State: AOJu0Ywb4Psafvzk9O5RejQixSLf/7kwdrH5rWXym1bIffLPhUyEOjPQ
	YTyseFvLxbpNPXgQt61wJPqCwwetE7p0ezLdTrqGCSMT/aixVX972JTT
X-Gm-Gg: ATEYQzx39VyJdkEvMwNRNUJ/1Bpqv2h6Y0wJCnFDME8AT5ZiG4i+cLMAbaMaH0OBvqx
	IbKH17aZJ7y08y5X77ILDoR1rWcNa235/o6YrgEK4vLfgnrPwapaCeIsARtEGDKq0xgbBYw6I0x
	Q84GtUxYie3I2J+lj8RwlLCQ4GfrJXYlRrYPpAAkv9pn38Ah61VqQi9/28x8iWYvTtvz5ZYL0zt
	z74p+BP3JAxPm1mCT9uTa5wtz0fSfMsJCvNefGedCb0Unur3qmKQ2oOMX21K4pEKDzDzkB0/Uyo
	e5WSs/pjMD5o/JrouS8m4A1YfdlLuImrSYfOKE2img8ToBQOKJRpzNi7TE1bpTgvNluiih/t3kv
	VAfQ1wOKoIMH924ZKlr/8A4H9CDlvJTJqN/QykFlcb7ZX/80mU/FNZpr78nMmSUd6hSMlmPBq3J
	xLuhj3gTbsZ7DwufvSJ+ZKnC/HCFWrrCirwRIYhG7eluOiIBRofON3KrdxWAyi8MvS
X-Received: by 2002:a5d:5f93:0:b0:430:2773:84d6 with SMTP id ffacd0b85a97d-4396ffde31fmr15606743f8f.24.1771859911308;
        Mon, 23 Feb 2026 07:18:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54a68sm21133203f8f.39.2026.02.23.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:18:30 -0800 (PST)
Date: Mon, 23 Feb 2026 15:18:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/1] spi: pxa2xx: use min() instead of min_t()
Message-ID: <20260223151829.6192b32d@pumpkin>
In-Reply-To: <20260223144437.2836369-1-andriy.shevchenko@linux.intel.com>
References: <20260223144437.2836369-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_071833_502170_1E1F67C1 
X-CRM114-Status: GOOD (  22.41  )
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

On Mon, 23 Feb 2026 15:44:37 +0100
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> min_t(int, a, b) casts an 'unsigned long' to 'int'. This might lead
> to the cases when big number is wrongly chosen. On the other hand,
> the SPI transfer speed rate is unsigned and driver uses signed type
> for an unknown reason. Change the type of the SPI transfer speed
> to be unsigned and convert to use min() instead of min_t().

I think you should use 'unsigned int' or 'u32' not 'unsigned long'.
There is no reason for these fields to have different sizes on 32 and 64bit.

Were spi to support 4GHz clocks (fat chance on a pcb track) you'd
need to use u64.

	David

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/spi/spi-pxa2xx.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
> index f7881a31e4cc..23e40f410814 100644
> --- a/drivers/spi/spi-pxa2xx.c
> +++ b/drivers/spi/spi-pxa2xx.c
> @@ -796,7 +796,7 @@ static irqreturn_t ssp_int(int irq, void *dev_id)
>   * The function calculates parameters for all cases and chooses the one closest
>   * to the asked baud rate.
>   */
> -static unsigned int quark_x1000_get_clk_div(int rate, u32 *dds)
> +static unsigned int quark_x1000_get_clk_div(unsigned long rate, u32 *dds)
>  {
>  	unsigned long xtal = 200000000;
>  	unsigned long fref = xtal / 2;		/* mandatory division by 2,
> @@ -885,12 +885,12 @@ static unsigned int quark_x1000_get_clk_div(int rate, u32 *dds)
>  	return q - 1;
>  }
>  
> -static unsigned int ssp_get_clk_div(struct driver_data *drv_data, int rate)
> +static unsigned int ssp_get_clk_div(struct driver_data *drv_data, unsigned long rate)
>  {
>  	unsigned long ssp_clk = drv_data->controller->max_speed_hz;
>  	const struct ssp_device *ssp = drv_data->ssp;
>  
> -	rate = min_t(int, ssp_clk, rate);
> +	rate = min(ssp_clk, rate);
>  
>  	/*
>  	 * Calculate the divisor for the SCR (Serial Clock Rate), avoiding
> @@ -902,8 +902,7 @@ static unsigned int ssp_get_clk_div(struct driver_data *drv_data, int rate)
>  		return (DIV_ROUND_UP(ssp_clk, rate) - 1)  & 0xfff;
>  }
>  
> -static unsigned int pxa2xx_ssp_get_clk_div(struct driver_data *drv_data,
> -					   int rate)
> +static unsigned int pxa2xx_ssp_get_clk_div(struct driver_data *drv_data, unsigned long rate)
>  {
>  	struct chip_data *chip =
>  		spi_get_ctldata(drv_data->controller->cur_msg->spi);


