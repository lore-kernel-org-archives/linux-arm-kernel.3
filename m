Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46465C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQ2EdDdM+YfgqqW81eKr0qghK9M0AxANGJ6vLIOVl1Y=; b=FNy2KhaZ97BKQdF8eS4y9+ls5M
	NNEQUFJfY0Wj8vxpPk8APVDrckly6EaQB+dlVnKqHQVHzNu81Vn8iT1liEK8jEUlYq6Z2fTkQpz3N
	Bg11KDIqj3Ll3AzCKi6CCD0REHJWtzWbLIPel+1TPC8GPUXplrNEm72Uv0iO9HyfW5WqW1JIJKR9l
	4MJtFg88WJmcWGk+9FrVzNt3uLJQVLj0Usv3ugqgcBlJ7mc+YxRHlBpyVuhFBKQ2fX0N4B7r09Q8H
	kPsKwjgR1/G933fXTrtfwI7YthKrJ1tE73I321tzYxGPjMoEugg8wVmFCTsZ9ExgpcRWA4dR5vxdO
	vKGAm4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VKh-00000007V5y-0xj1;
	Mon, 28 Apr 2025 20:44:07 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VAL-00000007U0l-2wgD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:33:27 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6e8f05acc13so74884376d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745872404; x=1746477204; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQ2EdDdM+YfgqqW81eKr0qghK9M0AxANGJ6vLIOVl1Y=;
        b=DGx9Zbu8RLjrdscaBBcZS6OIW9yTkTJt1kojRv5+nzw606gJQxHGNLnpIhQ95MJNr7
         2QCpNZSScOB7KdNVB+HT65pKy7zC+OJ+3ZCJdL15fQmBvlYKO8YNqRi/jymzGzy/SbQP
         3DnNm+SszEzttPw8wBT/8I++B+M/AKUXkOFczbIs00qrjnc6i14bHtibpLmQHi+yX0n/
         GiKfsGsIBcq3VLf9I1BJiFbwcNGlZbOGFjjs3dKXdiHammGpFx2EfN5CaVNy2Pf8nxpf
         6BhKYXe8vIuctEA5FfeWdqlrlnVN988gdh+bI10kcqs2yHrR+yI1q+HE+KT7mruh8RWb
         +e/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745872404; x=1746477204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQ2EdDdM+YfgqqW81eKr0qghK9M0AxANGJ6vLIOVl1Y=;
        b=b/qgpQFA6eMt5FpthEn55PUhZK/9vaofS4zomJLkWRJZgp9sBs60GrsNUUkNaga5MV
         8oH/PcQ2yAIm4XLmLKtOdTvBxi7n04pCyPVNpQ6lYF2oZL7KV5fKyVp1pPaZgjznisng
         0jAxIVhCAq2QNrTFFEz7S66IDgYR6xHEI+HhNR7MqLOXV+SSME4t1mwRXzVgusPTXDkF
         yXmAeRqPUH57R4kTUbCF3t2UKKNrDTxKfVTTo7jhHYD//EGco6+r0Ips3wnxfHBiALRi
         M0wgTlZyH9evomxSOhM27JoLs3oTcCjttEIIRUd8zOnFGPzY/vgEK+waT9WR7UotzLUc
         u6HA==
X-Forwarded-Encrypted: i=1; AJvYcCUa+6Ar7Wth9OTKn/jvBqti6aZMWjQYTPMtq0a+Fnb52+25bUDM7Jq7/exDYqKbqTZuKnQKpVhcScAgrI4gZSKQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy+K+C02/KGYiGkNHrWZzx2zc7iSm7nhTPQAGl7+8VwUjp4+Ns
	le28HVrCmz1T7CBBdZBT5D0wUAB9a75LGEL/Tim+fhG9LcPmATuIOfFXa7rqwUI=
X-Gm-Gg: ASbGncvJzbTR6n1IhdA4ejH58E8TTgWnSrTrRuTFgKCIY5ZGqV0TFHthpChbxtan5hx
	LBy9Jekxh8JijUEZJcrL7tLeNMrZyF5dilvyjeTbr7Xy7Gxfqk48sG4+W0gNyNihN2KNwAeYNsH
	tYZhhRiORteXW+1zvBOOqq6aCl8qFLUGmqYDpsJ+RbnjRQjWAqOT9M7Sp0wCriWtWe507buIKA+
	j43JL2YmXRW6sNo891VjpMI3NXekDVMrETZNfBRKLcTgYuSAtw+RWf5tmumxy2pFfBMEHmc6aGX
	kC6XCgvswBe4piBi2zN37TytYy6oKeJcC2ve6AQgRsnPUQc0W6RPAB+wIxOCMzJ1vyP8dzBc+eB
	lYzGhOga/
X-Google-Smtp-Source: AGHT+IH03W54Ogp2vik7UhE//X7NOGZSRD4J6CwkMZ0uRqLYuTjNtUJodqVeNFIafp53TQeAosBzoQ==
X-Received: by 2002:a05:6214:1d2d:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6f4d1eee16fmr182717706d6.5.1745872403837;
        Mon, 28 Apr 2025 13:33:23 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0aaf904sm64935576d6.101.2025.04.28.13.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:33:23 -0700 (PDT)
Message-ID: <48336225-0e43-46b5-bfc0-34ca8e6a4399@baylibre.com>
Date: Mon, 28 Apr 2025 16:33:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] iio: adc: ad4695: use u16 for buffer elements
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-2-6f7f6126f1cb@baylibre.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-2-6f7f6126f1cb@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_133325_750750_4AB71E37 
X-CRM114-Status: GOOD (  22.49  )
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


On 2025-04-28 16:23, David Lechner wrote:
> Change the type of the buffer elements to u16 since we currently only
> support 16-bit word size. The code was originally written to also allow
> for 32-bit word size when oversampling is enabled, but so far,
> oversampling is only implemented when using SPI offload and therefore
> doesn't use this buffer.
>
> AD4695_MAX_CHANNEL_SIZE macro is dropped since it no longer adds any
> value.
>
> AD4695_MAX_CHANNELS + 2 is changed to AD4695_MAX_CHANNELS + 1 because
> previously we were overallocating. AD4695_MAX_CHANNELS is the number of
> of voltage channels and + 1 is for the temperature channel.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   drivers/iio/adc/ad4695.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
> index 68c6625db0d75f4cade7cb029e94191118dbcaa0..0c633d43e480d5404074e9fa35f1d330b448f0a2 100644
> --- a/drivers/iio/adc/ad4695.c
> +++ b/drivers/iio/adc/ad4695.c
> @@ -106,8 +106,6 @@
>   
>   /* Max number of voltage input channels. */
>   #define AD4695_MAX_CHANNELS		16
> -/* Max size of 1 raw sample in bytes. */
> -#define AD4695_MAX_CHANNEL_SIZE		2
>   
>   enum ad4695_in_pair {
>   	AD4695_IN_PAIR_REFGND,
> @@ -162,8 +160,8 @@ struct ad4695_state {
>   	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
>   	struct spi_message buf_read_msg;
>   	/* Raw conversion data received. */
> -	u8 buf[ALIGN((AD4695_MAX_CHANNELS + 2) * AD4695_MAX_CHANNEL_SIZE,
> -		     sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
> +	u16 buf[ALIGN((AD4695_MAX_CHANNELS + 1) * sizeof(u16),
> +		      sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
>   	u16 raw_data;
>   	/* Commands to send for single conversion. */
>   	u16 cnv_cmd;
> @@ -660,9 +658,8 @@ static int ad4695_buffer_preenable(struct iio_dev *indio_dev)
>   	iio_for_each_active_channel(indio_dev, bit) {
>   		xfer = &st->buf_read_xfer[num_xfer];
>   		xfer->bits_per_word = 16;
> -		xfer->rx_buf = &st->buf[rx_buf_offset];
> +		xfer->rx_buf = &st->buf[rx_buf_offset++];
>   		xfer->len = 2;
> -		rx_buf_offset += xfer->len;
>   
>   		if (bit == temp_chan_bit) {
>   			temp_en = 1;
>

