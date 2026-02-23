Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCB9EC1113
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSoWMk7UM/e+NtDYxH8dhGcwAl8yWcJJT9+skqKp56I=; b=t12JiYNkTeB7xkk62e2qlFvXS5
	3ONuxbwd/RowMAGqfDO/AdiNKUolmRkkY4qnvul6ITHNcTldA6lARDdm90qNjED3Ksb3Zj8cvRH6e
	8LMLMnJvdb/uzdOawqUSqvzmWPCkAO2dUaYmvtWl5Ng8cMTASbsgj08bQXdL+eRgwVTNPvv4mYjd6
	0zL/MqAnGcipCTpvgOQDV6URbYNthYg7L/Y6aB35unDoW5THoBYP7k+LKiJXO5BXSa7Eh/rh8yWwn
	cNI+SCZjSnTLQwU9CpyGfNKwEJFh/vwASaAqsp+Ie/fJkFAOb3DrNoD/A6hmTWJC5kPP3PlsD6bu+
	q+qsahNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZQj-00000000jFD-0AvX;
	Mon, 23 Feb 2026 17:09:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZQg-00000000jEY-2uIa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:09:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so50782995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771866545; x=1772471345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSoWMk7UM/e+NtDYxH8dhGcwAl8yWcJJT9+skqKp56I=;
        b=LGyj9SarLG08udOg3Ska/sqOgAFkEmVpUXeqTT1Z/4qPoPBM7fXLcQbJMtTK/nKXCn
         mi70brqsZWKPVmkHT8TRLU2EX3c4yywkQ0dO7o/aOpGyE9/rAa6ApdkjwU9ylCXT/ysy
         fS3c470Gx6MExGU2jO/uNfWb0er5PNWdbwfss84VCLaR77NBHzVzXRqE1novXGrLN9Fa
         NwYUSMblxqWh6TtoAQnf1HxQF3nFlztISIyRnDlgzeSFDkYH7FIk7HnJwZphgkcuzXE2
         SqdpM4Wi8yP8xRcbnT648nJRTUuJjV+mNUKhbtiAVc2jKI/iz+2RGoGf0JXZLObET6nr
         MTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866545; x=1772471345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSoWMk7UM/e+NtDYxH8dhGcwAl8yWcJJT9+skqKp56I=;
        b=X0Z7qT+qtJaaugPmcRrLEARr0lftaYoFE+4CM9174yJSKUPOBip74S+qOAHjgv6k+c
         NA+4c+n0OgjHyMpfGzZlxzZTkcundJrgrH1J4yBkDUf8rYh1a7fWSHLCbzK2wHzZ0t5b
         ti2tvuGfQZgucjP2//7kop5Q/M909XuftGf8UBzCnd/3jN4lvbJnE2VlU0jqMM/gfzm/
         JvQzLLHzTb6mP4UOl2N5Sgz82Ap0kYMTbXlEu42pkzgqqYkdlKT0PvWsG2vSg8/LVQxP
         ppnk9B4DPTA+DADD88H5Dq0rONBDYact+YFuUiHetXLio0b0d9PJHnTZ+dhv7WwXU3Yt
         Cbjg==
X-Gm-Message-State: AOJu0YxvBV18uFZkiVHy9IxwgTenhgjuT71xOhMYTO0QfUYf1qhhqXXU
	U3qr3QqyUP7MNV1BRGsQcuF9qtzvNF8BgqKIytFHi7sMurebEiBYySJk
X-Gm-Gg: AZuq6aJDUvr1uatV9djSClBZrXpKds3y+qZM7hzR+cpojty6YJEzVESSRlINKf/Pn+W
	P5W1QFUM5NAtjY+UM2iMZh8oZwD/5P1r/KTOLKWsCyOYmZU3Z5wcuEZ7Ci80+/gDaT5t6tYR+jT
	Di6/JltwcH2yxf/p+1x1tHPVgyXn0VOGNESLNBU4ixz1hn69acCvCU9w3BPe/qaL/UBt0cRgUMo
	PUtponke9OgG/J36KLkfrXxQKAjQaKFJPmRGZxVyys1XgRhKF4Myb1d1mXOO3/Q4mAfS/4u4Ole
	dWddZfCALQw9QuoulGt8tMPfs3DS9Wi4i4yP7h76I66MgLoJBYEaER5vzqRgL43AZ0KYQMhN1Dt
	fWx6r8eyHN5Zqsj8twgrPyqa77vb8vx0eJUYitsx3YJgjSFvj+rP1EOjJNd64r4U60Z3Tup//gu
	z4dX7bW9AwTj+cUQOr5//j1ORVMZjIDdluktJ44c7407dIHQ0MEUT+LyD1EtlZRsAJErxD1A249
	j0=
X-Received: by 2002:a05:600c:8716:b0:471:1717:411 with SMTP id 5b1f17b1804b1-483a95e9a7fmr160559565e9.24.1771866544616;
        Mon, 23 Feb 2026 09:09:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b75e51sm207415805e9.5.2026.02.23.09.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:09:04 -0800 (PST)
Date: Mon, 23 Feb 2026 17:09:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/1] spi: pxa2xx: use min() instead of min_t()
Message-ID: <20260223170903.5f3379b4@pumpkin>
In-Reply-To: <20260223153117.2838840-1-andriy.shevchenko@linux.intel.com>
References: <20260223153117.2838840-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_090906_749155_177CFC20 
X-CRM114-Status: GOOD (  22.63  )
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

On Mon, 23 Feb 2026 16:30:54 +0100
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> min_t(int, a, b) casts an 'u32' to 'int'. This might lead to
> the cases when big number is wrongly chosen. On the other hand,
> the SPI transfer speed rate is unsigned and driver uses signed type
> for an unknown reason. Change the type of the SPI transfer speed
> to be unsigned and convert to use min() instead of min_t().
> 

Reviewed-by: David Laight <david.laight.linux@gmail.com>
(but see below...)
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> v2: used u32 instead of unsigned long (David)
> 
>  drivers/spi/spi-pxa2xx.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
> index f7881a31e4cc..6291d7c2e06f 100644
> --- a/drivers/spi/spi-pxa2xx.c
> +++ b/drivers/spi/spi-pxa2xx.c
> @@ -796,7 +796,7 @@ static irqreturn_t ssp_int(int irq, void *dev_id)
>   * The function calculates parameters for all cases and chooses the one closest
>   * to the asked baud rate.
>   */
> -static unsigned int quark_x1000_get_clk_div(int rate, u32 *dds)
> +static unsigned int quark_x1000_get_clk_div(u32 rate, u32 *dds)
>  {
>  	unsigned long xtal = 200000000;
>  	unsigned long fref = xtal / 2;		/* mandatory division by 2,

I've looked at the file...
I think all the 'long' in that function can be 32bit.
Especially if the code actually works on 32bit.
There is also the stunning:
	do_div(fssp, 1 << 24);
in the only bit that that does need u64.

	David


> @@ -885,12 +885,12 @@ static unsigned int quark_x1000_get_clk_div(int rate, u32 *dds)
>  	return q - 1;
>  }
>  
> -static unsigned int ssp_get_clk_div(struct driver_data *drv_data, int rate)
> +static unsigned int ssp_get_clk_div(struct driver_data *drv_data, u32 rate)
>  {
> -	unsigned long ssp_clk = drv_data->controller->max_speed_hz;
> +	u32 ssp_clk = drv_data->controller->max_speed_hz;
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
> +static unsigned int pxa2xx_ssp_get_clk_div(struct driver_data *drv_data, u32 rate)
>  {
>  	struct chip_data *chip =
>  		spi_get_ctldata(drv_data->controller->cur_msg->spi);


