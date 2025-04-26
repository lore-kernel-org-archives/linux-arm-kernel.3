Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EAEC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cauEAeX5gZdD3edeRITKGPyax+4+cC+K3VGSTUIo9t0=; b=Aa/QtYDi6NPC8FoWAzyUHI0Ppm
	HHuU3zAvs/3j+rXY6bGxlxGISICgE6mrkcIWaKjjr6NQpXexNF889eIg5XaJbC9yvvbg19rfeKtbK
	5UU1bm/o7xeY82ZcuRE4sozMavNkyeCnxpiFu4usrPxJZv7VxIuJwiMxm5cf3m9Roi1aNKDEC7BEQ
	i12yqTU1pjFEG3t1QZcCTDCO7JOv4KXCev0mlCuOvyvRuDgV2ogcFNfpDSlTI02FLINdaxt1Acui/
	eLrYapaXV56p2BLZrFDm7WwU1XPLkmzSi+xAuHcKnTewXQijoa8Pdy6gFl2iaMUtr7QXlA/xmZK4f
	Nb4kpGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dfw-00000001vhK-1G3E;
	Sat, 26 Apr 2025 11:26:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8de3-00000001vSz-193v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 11:24:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98079A4D10C;
	Sat, 26 Apr 2025 11:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD53C4CEE2;
	Sat, 26 Apr 2025 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745666670;
	bh=Vm3IZsXSU/eJ3GT/vGl/2eAMEOMlqN1H1YjSaFCjHPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kCnEm0L9XsLd42X/d0xWdPdEJPU7tmJ/15p7TAlv5KLJSJb/CYnsflVssIrYoHGP1
	 oA6ItURQH2h4irWSOEx0cwTW0DyppMfy62Odo7Nfg/LEctieuYFG+iEE9qnpl+CYYI
	 isU6WMDFGU1kqGnyZo8GjCRXfuO4TozI/bgSIIV4qHX82t572Nz5lUDBeKecp/KwH1
	 tPMolfjPPAnSng9TgfCpRQN6jTZod1Fo0mnA+AQzr+4lerl5riS+Vwo0KyXWdSohC+
	 RihIlAISvJgbTjwVFlsdrZIvsWmKJ+5pab9hPI/gnz2S39gH99ix+JAQ2V1JYgsZhO
	 OPPIZ6TSSGM8Q==
Date: Sat, 26 Apr 2025 12:24:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/6] iio: adc: ad4695: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
Message-ID: <20250426122422.29660e70@jic23-huawei>
In-Reply-To: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-3-f12df1bff248@baylibre.com>
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
	<20250425-iio-introduce-iio_declare_buffer_with_ts-v3-3-f12df1bff248@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_042431_373788_D3450B12 
X-CRM114-Status: GOOD (  17.07  )
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

On Fri, 25 Apr 2025 16:08:45 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use IIO_DECLARE_DMA_BUFFER_WITH_TS() to declare the buffer that gets
> used with iio_push_to_buffers_with_ts(). This makes the code a bit
> easier to read and understand.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/ad4695.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
> index 0c633d43e480d5404074e9fa35f1d330b448f0a2..992abf6c63b51dee222caf624e172455fb9b9900 100644
> --- a/drivers/iio/adc/ad4695.c
> +++ b/drivers/iio/adc/ad4695.c
> @@ -160,8 +160,7 @@ struct ad4695_state {
>  	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
>  	struct spi_message buf_read_msg;
>  	/* Raw conversion data received. */
> -	u16 buf[ALIGN((AD4695_MAX_CHANNELS + 1) * sizeof(u16),
> -		      sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
> +	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_CHANNELS + 1);

As a follow up, maybe we can rename that AD4695_MAX_CHANNELS to
AD4695_MAX_ADC_CHANNELS so I don't wonder why there is a + 1?

>  	u16 raw_data;
>  	/* Commands to send for single conversion. */
>  	u16 cnv_cmd;
> 


