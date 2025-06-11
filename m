Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C2CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clQc+ALpEbRfKWwmdYpg7fRgJck1oxl3hljPINdz/zY=; b=tiNwUMYJmTC/0FMAHGkUU0Akvj
	tC0drrwRXhGizCgMS4AAT6fDbBAUEQCZqjbDKhVJifsado7gc2oyMY0NtuhyM+NLDGivMUHqBPcEt
	ehg8kQxvE4Eeo8cQYrdODeRZAfZCFXLpSztOoMxSjx9RHvcbXzVBtn/X4kU93aVaYShT7BrTRuPeR
	hEPx29QeQ4j5LwPB4cORFEGsVvm+tU3nTPwQdGpj8y9lDoQgDb9781Olo09qA4iOtu3JVtiiEL08N
	gL/X/fqVEuHoj2n5gzivoMiPhfpBohw39Ny6susAskazcaXpHfNZX8Vc+CYCAg0gIiR0uZNvm7n4j
	zgTKVHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUMW-0000000Ba6I-0mps;
	Wed, 11 Jun 2025 22:56:04 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPS2A-0000000BA29-1CQJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:26:56 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2ea6dd628a7so84223fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 13:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673613; x=1750278413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clQc+ALpEbRfKWwmdYpg7fRgJck1oxl3hljPINdz/zY=;
        b=JWzuoWmc0+2puoQiReXE5v9tb2O4aihS2Cu40ftGLuChVh8WVMuwUVgn2q9u7Wa+pA
         WXmzNfnwuFJRapvQNmorAmNWmEPKqSR7wqm5sCjhh0u+0bJgILtOR48U5Z+ILJOZCJWf
         8U2GJBfUq13bCXJMCVy1RzBQ+7z90IqYNBJyu9vWNZJAxZ0v57FQLNQtcMai3jjPHGmK
         I1xje6EAUg7wKcnn9gpUan26fvVci7i8IQr/GhKJBXmtWpiuPXpzfrPRybN/ZCE0oxXC
         Y5p5QKw4xXOkzkA/ucmISsU0GCh3GKoeCvrUkjEz2yyCaHnknpGVjZyXiJywy64nVAWI
         wsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673613; x=1750278413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clQc+ALpEbRfKWwmdYpg7fRgJck1oxl3hljPINdz/zY=;
        b=qMUsfjyoZdPj3FUAvvZndlLNpDwYc60CZzGo0EbeagGdHqpsdTEO55Iz29d3g75QrS
         sYnqphcVI3dPpn3d7iegfTJVXZF+S4t9yrqSmIsMInLyDkKU/m2DtNtD9xw6YfyoPXhv
         GyrrNtRngTrtT5v2ZbavC/OZBsBh5Rm3jm+owftBDER7xtfq18/m18fusAPztskUz41z
         fshfFonJ4W0w1kuuM3N/XM1zaEM1zcBoQ2PHtQNHzVW7YMLgJnPnEwKnb5BXtRHh3uaq
         CjYn643I3Nw40a8xvihbwIf49uIzy1TqTjbZKMFz8q1q2PaAYGGp1IQ5nhoPriV8ABD0
         lsrw==
X-Forwarded-Encrypted: i=1; AJvYcCUld8ssIZ0xLu4X634H4sGSrxJe6Wxpj+bBVP06uuXiIFlg27iVZB3nBuo0mYhVZgnMwovx6OBiqUjWhio+m3a6@lists.infradead.org
X-Gm-Message-State: AOJu0YwbLPUu7D8BOC1TltwBv7qEdarD1EKBjZo/nbV7Bsuc/y29qF4J
	TYrx9sWC9gbAeBvsnj8io8hrnB9oHoUi7gaOoyPNHa7wT43tBx4ah1/ZQplbym63NRw=
X-Gm-Gg: ASbGncuMPh0zARCvAplF3x1a0v9QcinN2o+YFwd7BUWAVctapW2mZEslv2VExVjYw2I
	HqSN+V3091bDFpgqJan0jSHF3PO40jhnUklMCRZWRXSDXaD+RDFdcgaCe8kyk926uUGsMkDeC20
	sMKxrzcB72KY80SWwiffuVmMdZDaKGpL47banuT88KA7FvMkiwNZrnkci23FB1VYHtMrnd3JbtZ
	giy+lsZJwtFy1g4ugkuPxYuMd5ibtnRZRzewA4TlT3AhBB0wy0f/j9ztP6m6P3Gw0bQLTwEOZ5b
	OSSDhaveRR5K8vJzoqsYl6n+L7Sv/zpGhPLI9J/nK5kqp2BT7Y9GGsN8fSjZv9a9Fyhmk1CgHQH
	k305kZX92Fh5Bw6J7bWvdje/SdTCdAW9dceXlzLY=
X-Google-Smtp-Source: AGHT+IHVTR6x7Iywr4DoILca74HC62mQNiOYdv89GViJJzcv39NMYjFI9UxLuEQSNiTRmXfbxbG8uQ==
X-Received: by 2002:a05:6870:3644:b0:2c2:4090:9e8 with SMTP id 586e51a60fabf-2ea96e8b67cmr2383236fac.22.1749673613362;
        Wed, 11 Jun 2025 13:26:53 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4753:719f:673f:547c? ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab8df2448sm1925fac.23.2025.06.11.13.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:26:51 -0700 (PDT)
Message-ID: <b4e3260d-ecf9-4a51-85c1-889d7741d287@baylibre.com>
Date: Wed, 11 Jun 2025 15:26:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] bus: ts-nbus: use bitmap_set_value8()
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
 <20250611-gpio-set-array-helper-v4-3-fb86a9b499ab@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250611-gpio-set-array-helper-v4-3-fb86a9b499ab@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_132654_331145_0F4B4262 
X-CRM114-Status: GOOD (  20.25  )
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

On 6/11/25 3:18 PM, David Lechner wrote:
> Use bitmap_set_value8() instead of accessing the bitmap directly.
> 
> Accessing the bitmap directly is not considered good practice. We now
> have a helper function that can be used instead, so let's use it.
> 
> The bitmap has to be zero-initialized now to avoid a compiler warning
> since bitmap_set_value8() does read/modify/write rather than just the
> write that this is replacing.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> v4 changes:
> - Fix typo s/get/set/ in commit message
> - Zero-initialize the bitmap to avoid compiler warning
> ---
>  drivers/bus/ts-nbus.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
> index b4c9308caf0647a3261071d9527fffce77784af2..17540034e64a4e591ea61b0b4eef86a2081b02f5 100644
> --- a/drivers/bus/ts-nbus.c
> +++ b/drivers/bus/ts-nbus.c
> @@ -10,6 +10,7 @@
>   * TS-4600 SoM.
>   */
>  
> +#include <linux/bitmap.h>
>  #include <linux/bitops.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
> @@ -105,9 +106,9 @@ static void ts_nbus_set_direction(struct ts_nbus *ts_nbus, int direction)
>   */
>  static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
>  {
> -	DECLARE_BITMAP(values, 8);
> +	DECLARE_BITMAP(values, 8) = { };
>  
> -	values[0] = 0;
> +	bitmap_set_value8(values, byte, 0);

I got distracted by an appointment and forgot to compile test before
sending. :-(

byte is undefined here. Will send v5 soon.

>  
>  	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
>  	gpiod_set_value_cansleep(ts_nbus->csn, 0);
> @@ -149,9 +150,9 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
>   */
>  static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
>  {
> -	DECLARE_BITMAP(values, 8);
> +	DECLARE_BITMAP(values, 8) = { };
>  
> -	values[0] = byte;
> +	bitmap_set_value8(values, byte, 8);
>  
>  	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
>  }
> 


