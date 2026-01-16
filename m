Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C619D4A616
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gVkLjFWXdsLXhZXMgSkslb6Gc2W6vyzdGMqF3LNrLk=; b=YPjWaYkADOoXfOzpkj0QvbkaTF
	kv30ImHg4jm7hkKPGyDg1ezTaxRbKfjlF6RLAPphZI0EGOhlUkWBQ/4Q0EfqwyknjySklLLJbY6ZX
	EQ0od69EQWKCx5OTQHVwSJCDyTsqkWXvVhCLSCof4r62J6Y1EbcrnL51KHzKOrp2fps8BtwZ+cvH0
	Li8Tq9KnKQaMdBB6Y2b/zKVQk2GWCy+OhxCFAyTaSrFg+8f65AHI1hdqvy5GjpaX46sEC3UQvyzjh
	YHNc3tAzG1wy9s+0JynxXWYgyQPQ8uVv79mOlnlTNoks/ObNaJakhDPcoP+HHgy76tOsiZyanq1mC
	B8pPYNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgg53-0000000DrEF-2HO2;
	Fri, 16 Jan 2026 09:25:23 +0000
Received: from mail-dl1-f42.google.com ([74.125.82.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgg50-0000000DrDn-1Huv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:25:19 +0000
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12448c4d404so912627c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 01:25:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768555517; cv=none;
        d=google.com; s=arc-20240605;
        b=JyjOlnylN4ADXjIsDMp9tzYrzwuCa4xRsWEheJlC+dJyDRc5bJGCj2r2amftW+ydx2
         LrRh/nbj/8eeoqqlJ8q8Lj2gOLEOW0csdyIluVowdpDUSIgg+RyzEbUTE/9XQ6u/aCH0
         xxF4gimD5jOtRmo1bnSdEkk/hy0rO9iDPOw0qnayRTW+JowsYm8PDwns1cZ18ZUu5jtb
         ZdGbpqKv8VIspOUsYWMGnLfOwJp7PZt3UoCvh3HfZ6zx6NUpv8FbP92rILRF23WMLZgH
         KxKYOIgm2PxjZ43JAxPdmGvOTaNt1mUGx0t/MHzy7gJ8YRiS06KRWAKqmwfRdNp81ksR
         0Nvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1gVkLjFWXdsLXhZXMgSkslb6Gc2W6vyzdGMqF3LNrLk=;
        fh=WPXJj4cOuCW4fuZA0PzbCY6lSunGdDgzvtjQQ5YpSlU=;
        b=FgjkFY1oApJC4W9aPB8FMkVv8hUjS+K35ZshcYWeAKDLaNVfvNc4kE+erVEYYbEdI/
         Tom/kciLQzPj3GZAkGR+jfqVDhy835l4Rn0MDxrgh6/p93yWRbFkqYVYOEADfHvJezSV
         x7WRdJ5ufDMutut4CwPRLSPRfiDra1BJ4TWn8tb8loMaG9PvMVfBX26/lZ2OC4r2aTF0
         SUWaM+ISYtdujKzowO7F9e9nPDoBRDmM4Fonxu3OTmG7JhP/nuVRRP1zU9EtPrtSMRLR
         VaeKeJGRHK94wvqgJe49xZGEEUDWTCE18KldAL4ypKLfwW2NM/gQFlGeP5gaY37Pew8W
         tmuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768555517; x=1769160317; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gVkLjFWXdsLXhZXMgSkslb6Gc2W6vyzdGMqF3LNrLk=;
        b=jfdCV0kuQu/0Zn6yXxe2OqAXQS9LlPfi6ilDn6nV+71QMJtfDQnZMUsE0vgMhtldK6
         7vzbl6PFJgkpJTxtQQgis6iIClIwsCvgBAs7AueVTbPSdB4rzjcqPprTy9IimyY8HqKl
         P/fgOJ9q40f6AE95gZfSWeNS2cF5J7AP38rOJkCRwjjprasu+S86b1ewKRcg8ju8K6WQ
         qdIZNP7oMk3RcGeXTXfQp2kGPfxxAipSGpuatvKscOm1fnGPclxaNHpfdtWpGHmgmRL8
         G8X7DZNAVcfZ4bSGc5A2/A8+2lvFUJuYc7o/QOnXvja3MelwhNHBnl68REBynrjg3LxX
         Emgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555517; x=1769160317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1gVkLjFWXdsLXhZXMgSkslb6Gc2W6vyzdGMqF3LNrLk=;
        b=eEb8+3G0qDnVyJv8P/s0DdAG2d1bgBSOCPyWk3c4Em3IVp9KNuXcqhqnmsrB0Keyxx
         Eg3VcKSnC4ValNhdnfZC7i3BbQOtZFwrHRunGnN9aMoOvJzEbno+Bl0hbNdSIB7wX5yg
         17BGFamtpQYOtuADRwrAZg3zjS+2LKIF/gfjjtY26BXeKd5bi7miHYG0mjCmjMg8hJiG
         C2wD3uyKxgHZbWXqCL8nC0Br0MFxiDgwUQoqBIg7eCf0844jdiIae2OvmX+wofTYSbWD
         l1jNkVhvm9S33BMqJy8SvkzEFT3w1dGgG9yuJFffk8TzqtSWVmmdIk0DHbQxZQXG5hQw
         HuqA==
X-Forwarded-Encrypted: i=1; AJvYcCVlJkOsU5qL4aNfIWFLMx2XN2uLP8O7eX0vzl/IQ4ugwvaKof9ug4EuzoxFbPhFZrtZJerKwtZ+YUwtYFyvr1Mw@lists.infradead.org
X-Gm-Message-State: AOJu0YwsKhvAGAP116Z4tWBL+Tb7TSAcfnuF+TLwf04QuIRktiPW7Ydl
	C8LGRkzKKAo+ckUP1eLbLVyBLBXVgvh+ltVHe23iFAtPGfPcUyNHKcbuK6jOFiCBaxVT5i0YRqA
	56mrEgHqp3jEj+Vg3wRnXJyvac/ge7yc=
X-Gm-Gg: AY/fxX44ao89e1ipZjNjSl5/86UG2/tjYSTnFu0rhn1srO++b/QIkMyWMISJrDu1P5f
	+PhGD2HHdBaVT5dKdf1OLYoSHxOpBytSw8achvut3hvALBuQgkkZ/DAq3Bl+oOW4JmtAXkGnxjq
	m8gGG3ES0pMclneMvyh7Jxa2pULVjtog5iFHJrBd+pJsCicPKb1hIIdlKZxFGqzBQ1YrtrmIMvj
	AgwRruyKvu9/G9dV4h+59eBKiyCI8pxE1wm08KRyFpnAuhalFiCKA03LE2Jm+E2dZW9HZ7g0etb
	ZjieyOxJTusi2k2/tnQjGtHZx6D4mHLq6bG/EeXzjEXgqxp6Y3FAAXA47n7H+HLiywxtYYQB7oN
	szMOiXfjko8eIe2u4jPUK
X-Received: by 2002:a05:7022:128e:b0:11f:3483:bbb2 with SMTP id
 a92af1059eb24-1244a72e2c6mr2287226c88.12.1768555516713; Fri, 16 Jan 2026
 01:25:16 -0800 (PST)
MIME-Version: 1.0
References: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn> <20260116091704.3399142-3-Qing-wu.Li@leica-geosystems.com.cn>
In-Reply-To: <20260116091704.3399142-3-Qing-wu.Li@leica-geosystems.com.cn>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 11:27:58 +0200
X-Gm-Features: AZwV_Qhvgz-kbrRItIaZk0_yMWKQZjkC3dhXXrMaQSnI1xaVYEnm76i5Ds3FryY
Message-ID: <CAEnQRZAz_-S29L66a_ySxGAX-SKAeAvHfKqjanLsGNCZ7_zsAw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] i2c: imx: add abort path for invalid block length
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	bsp-development.geo@leica-geosystems.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_012518_382230_6E24305B 
X-CRM114-Status: GOOD (  20.07  )
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

On Fri, Jan 16, 2026 at 11:19=E2=80=AFAM LI Qingwu
<Qing-wu.Li@leica-geosystems.com.cn> wrote:
>
> When a block read returns an invalid length (0 or >I2C_SMBUS_BLOCK_MAX),
> the current implementation leaves the bus hanging with SDA held low,
> blocking all further I2C communication on the bus.
>
> Add a dedicated IMX_I2C_STATE_READ_BLOCK_DATA_ABORT state and ISR
> handler to properly terminate the transfer when an invalid block length
> is detected:
>   - Set TXAK and receive the next byte with NACK
>   - On the following interrupt, generate a Stop condition
>   - Read and discard the final byte
>   - Report -EPROTO to the caller
>
> This ensures the bus is released correctly and allows other devices on
> the bus to continue operating normally.
>
> Tested on i.MX 8M Plus with continuous block read operations.
>
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---
>  drivers/i2c/busses/i2c-imx.c | 55 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 85f554044cf1..71457dbffb7a 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -233,6 +233,7 @@ enum imx_i2c_state {
>         IMX_I2C_STATE_READ_CONTINUE,
>         IMX_I2C_STATE_READ_BLOCK_DATA,
>         IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
> +       IMX_I2C_STATE_READ_BLOCK_DATA_ABORT

Please add the comma at the end of the last line so that we still have
nice diffs
next time we add an element at the end of the enum.

