Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7DDFD88D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 00:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=; b=jL4AppND9f6xz7IYcXS0JGyacr
	UOZhCSCtT1EMGMfxngmkabg26F1Bh/nno8TcPCu9Nc4ENGJs9cXnxi1pZuF1yI2Jkqva+RSDtGaQr
	clE3wG3sLrJjK2PShYIZ7Clx4Mu+bip+Vpo1Dw7Qc9mnzpDUwqPdz0FJgWZCzbqwi1JaYLeCAi4Vb
	yna+VOki2s6+1ZmbGHmn3y5SlJHdb5OWxvODDtAvMuHa19wKQkN5lpzGcJAlpWWwEZjxUX99FoLa1
	MdA4Q7wM5lg2g/tJirt4SoyyT5DShUO3iLhV5qrDDtF95xwoQq09+y0RiIh2B6wbd+OJwyvcDRD9F
	egDT+8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w073x-0000000AP9M-0UkD;
	Wed, 11 Mar 2026 00:04:33 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w073t-0000000AP8c-1ovw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 00:04:32 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-46704fbf62dso1679521b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773187468; x=1773792268; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=;
        b=TlGRNu8w1b67dUilXeID628ePJ+o2sgZJJvuiCb5oocg8PI5zDHUYLb7uIN5yfDbgv
         nK5lacKW1m6TWmviInHf07ogHl5qiRGzWwkVxZNbkx/EX3D+1oZFiWfOG/6PTSM8sFp4
         fnZ5W6lx1xXJjC+aW/AJ0kHR4I1yPrPZUPbFqriXru1CEtsDjszfaKBj9Ju3UaHHPGmW
         SOwsG7SFjL4zX3NUmPsLcw/v4X91rj9AgVxj+hS+rwhS3UAb9gsj+dpfhoWJG8xJJxoe
         gYwVJZyyIhQCac1RqMDFKT64L55EgqzPzSOX75HXWv7j3fTUX9a4Jb9Kr7KQLOPM68rI
         s0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773187468; x=1773792268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=;
        b=oY4leJTwQ7gtx5oO7QMMh8945Z49US8H2tUqJkAPAOz1ytaoQUrVzSiCisr86ASoDH
         SMnZRh+ND578/AuqL3nQlchaGwuUWMBJAGwn65dp0JH4FmKYwDQ7TNzm8vq0gGBN4ZOr
         E4M7R524alKZvAPrP8ByFv+W7pr0mb6xOTuGKO+vosHSuekjQ6mGUpeOKbpuGzG2Bqr8
         7cN1Ir8U+LT62q2Lt3cd95jYQR/5iJMkb1yqneLev9ItJDN5y314NOWaKuVC/nHyXGsu
         HyIKyRFigNCPcbNuybS5NrReGCy5x0sDpPRCN5VaaqxhRp+VwDrUoyrwCw9bzln46Uw2
         RH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMu9iA/AscNRIdVrFlSj/IHX7vcisZJIC2s4KQZU1HI1D4XnjVPSxYQpg+gmJ6zfDyrUnqakqBdrgZ02y9Gyne@lists.infradead.org
X-Gm-Message-State: AOJu0YwBsH29KKQQBfTi8NdB/nHpEErfoMeBjx3ovizDq0EhkDKZ9cnf
	3PPjtVgWWaZ/4f1u9mZNQJRMeqK6HpoA450uzDWQE+V7qlznnVu9qiWnS5Nr4C6oGQ8=
X-Gm-Gg: ATEYQzyMClhYiWmnyO0To7xyV6B1oBVSERjHZPfwcnrZIVzxKhAydc7w9W7LsUkZ59I
	gQYbIEiwkYZAKroLHdyd6FHl5ZaSccvpo+ikxhSoHHAx1xFcRmdlYFInjDOuH2KgnIBQ/RLekrV
	iOs20/AydMv9jLeOoNTutboGUWQS9Ef5yARP6+7gqohVQMZSI1d1n82wdL0gsFsA0xoO79dMsN/
	hwIXIqHpqAflOrxXH5CavAVGLdVzJ8z0HknsDVwh7iCCy3HH8ogqptbGQhOUCecBbzmd2vdcF3U
	wkWd8Yzediw00X5InwxUgMov/qCTpjwU7sS4swZDIXd1Rpkw1QbKcMnLwVXvEPy8RU4X6yMn8CS
	ic/FO9lJGr/xgB6uE+k1nC/xVh3qER34BCSVBr/uqx+5Vqmk58CZy8lzy9YWcyPi1BOsEz1e+1Q
	SxSdYh2DwPtAXD0Wue2QVkQANp8hvWMhFJ0n5XMNCrXXUq+RLoQc96pj3dAnn3ssiL/5asqhP03
	w==
X-Received: by 2002:a05:6808:14c8:b0:450:b249:718c with SMTP id 5614622812f47-46733547c85mr330873b6e.31.1773187468063;
        Tue, 10 Mar 2026 17:04:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:82ac:f3fe:2e5f:ec03? ([2600:8803:e7e4:500:82ac:f3fe:2e5f:ec03])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734160cebsm233690b6e.7.2026.03.10.17.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:04:26 -0700 (PDT)
Message-ID: <04ffc988-f4ce-47f8-a998-66d2553d88af@baylibre.com>
Date: Tue, 10 Mar 2026 19:04:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
Cc: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
 kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
 marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
 hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com,
 dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-4-sanjayembedded@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260310200513.2162018-4-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_170429_755125_C18CFA49 
X-CRM114-Status: GOOD (  16.29  )
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

On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().
> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  drivers/iio/common/st_sensors/st_sensors_core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
> index dac593be5695..f641b62e692b 100644
> --- a/drivers/iio/common/st_sensors/st_sensors_core.c
> +++ b/drivers/iio/common/st_sensors/st_sensors_core.c
> @@ -501,14 +501,14 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
>  
>  	byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
>  					ch->scan_type.shift, 8);
> -	outdata = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
> +	u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);

Even better would be to not alloc new memory at all.

We could probably reuse buffer_data from struct st_sensor_data for this.

>  	if (!outdata)
>  		return -ENOMEM;
>  
>  	err = regmap_bulk_read(sdata->regmap, ch->address,
>  			       outdata, byte_for_channel);
>  	if (err < 0)
> -		goto st_sensors_free_memory;
> +		return err;
>  
>  	if (byte_for_channel == 1)
>  		*data = (s8)*outdata;
> @@ -517,9 +517,6 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
>  	else if (byte_for_channel == 3)
>  		*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
>  
> -st_sensors_free_memory:
> -	kfree(outdata);
> -
>  	return err;

Should be able to change this to `return 0;` now.

>  }
>  


