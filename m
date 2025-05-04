Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9844C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYwogTKNRhLQlzzk0HLyFC/FH/O7XgwuIl3pMpJNMNM=; b=2hVYCvcSK2c74Mpi+iB/Pr/sJT
	oWj7YKntjVdUtH8R0T4tWqRSA0nANHgshdUyN7AfrwDtUjhUFLsRyO/jW6G/ZSDQdvGqEH37lUcHS
	qqDTOmeEXh8ytgiMC/A5mriCWu7Tl+B+bkvHmpGUiW4Aj0J0/8EtxHIlayVkVuRUze5CBu35U1wZl
	MW0JiPST9lO9XE5ilw3fRtOTIva4JHpYnfAbNCShAwQnOyHJGcOG5FJokqZEFAdpbKVNQBRP7ehqi
	cwTt3R8qYyFNk1r5UNN+Eibvtqf+ErxeufP0LxrWYZ3JlD5/jtjvy08ZRVPPuKGBXx4CGa1EObvBk
	JREN5Kug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd4F-00000005iSb-3Ffs;
	Sun, 04 May 2025 17:23:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd0Q-00000005i4t-3Jq8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 766C25C5408;
	Sun,  4 May 2025 17:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAD8C4CEE7;
	Sun,  4 May 2025 17:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746379196;
	bh=mKnCL3nkz9cAe/1hO2OMMOkEX7QBuY79blrz+JeIxDk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=souD9f6lM63BfiHjGDLPXIvli20Vk0PCV8MDmApa4OsTEoJUUZI2LBa8m45CIGmZW
	 /+IUAYwS9hcWCpa8yJjdm/yaUfQDhRgLSIzfeiBbEcYTLfsW/Znwae+BUz6MCLzrRi
	 BcBUDPLazHW4IlY1ax0fOa98vl3FvNEvhvpbTa3cSfWCEBLMnVkWfbcMJTCiADphlV
	 jS+Oy2rS8BEgrOeFKjgjAtbxAYb3ysOmnp9uLsDUwg0MmcWaFQofKuTbA1gxJ2ie/U
	 feAHs94CYKR55RV2lxJA6YZuE+EcJ7ClJvkK7ZNpty23fis2Wqx/tzDFcmMkkEYPl7
	 MUPKnSym1veew==
Date: Sun, 4 May 2025 18:19:47 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Eugen
 Hristev <eugen.hristev@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/7] iio: adc: ad4695: use u16 for buffer elements
Message-ID: <20250504181947.17072724@jic23-huawei>
In-Reply-To: <48336225-0e43-46b5-bfc0-34ca8e6a4399@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
	<20250428-iio-introduce-iio_declare_buffer_with_ts-v4-2-6f7f6126f1cb@baylibre.com>
	<48336225-0e43-46b5-bfc0-34ca8e6a4399@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_101958_918632_1F05F6A9 
X-CRM114-Status: GOOD (  28.88  )
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

On Mon, 28 Apr 2025 16:33:21 -0400
Trevor Gamblin <tgamblin@baylibre.com> wrote:

> On 2025-04-28 16:23, David Lechner wrote:
> > Change the type of the buffer elements to u16 since we currently only
> > support 16-bit word size. The code was originally written to also allow
> > for 32-bit word size when oversampling is enabled, but so far,
> > oversampling is only implemented when using SPI offload and therefore
> > doesn't use this buffer.
> >
> > AD4695_MAX_CHANNEL_SIZE macro is dropped since it no longer adds any
> > value.
> >
> > AD4695_MAX_CHANNELS + 2 is changed to AD4695_MAX_CHANNELS + 1 because
> > previously we were overallocating. AD4695_MAX_CHANNELS is the number of
> > of voltage channels and + 1 is for the temperature channel.
> >
> > Signed-off-by: David Lechner <dlechner@baylibre.com>  
> Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
Mostly because there are two many patches for me to keep track of
at the moment I'm going to apply the ones in here that stand on their own
without the macro and your v5 with that size thing can be a smaller series :)

Applied this one.

Thanks,

Jonathan

> > ---
> >   drivers/iio/adc/ad4695.c | 9 +++------
> >   1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
> > index 68c6625db0d75f4cade7cb029e94191118dbcaa0..0c633d43e480d5404074e9fa35f1d330b448f0a2 100644
> > --- a/drivers/iio/adc/ad4695.c
> > +++ b/drivers/iio/adc/ad4695.c
> > @@ -106,8 +106,6 @@
> >   
> >   /* Max number of voltage input channels. */
> >   #define AD4695_MAX_CHANNELS		16
> > -/* Max size of 1 raw sample in bytes. */
> > -#define AD4695_MAX_CHANNEL_SIZE		2
> >   
> >   enum ad4695_in_pair {
> >   	AD4695_IN_PAIR_REFGND,
> > @@ -162,8 +160,8 @@ struct ad4695_state {
> >   	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
> >   	struct spi_message buf_read_msg;
> >   	/* Raw conversion data received. */
> > -	u8 buf[ALIGN((AD4695_MAX_CHANNELS + 2) * AD4695_MAX_CHANNEL_SIZE,
> > -		     sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
> > +	u16 buf[ALIGN((AD4695_MAX_CHANNELS + 1) * sizeof(u16),
> > +		      sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
> >   	u16 raw_data;
> >   	/* Commands to send for single conversion. */
> >   	u16 cnv_cmd;
> > @@ -660,9 +658,8 @@ static int ad4695_buffer_preenable(struct iio_dev *indio_dev)
> >   	iio_for_each_active_channel(indio_dev, bit) {
> >   		xfer = &st->buf_read_xfer[num_xfer];
> >   		xfer->bits_per_word = 16;
> > -		xfer->rx_buf = &st->buf[rx_buf_offset];
> > +		xfer->rx_buf = &st->buf[rx_buf_offset++];
> >   		xfer->len = 2;
> > -		rx_buf_offset += xfer->len;
> >   
> >   		if (bit == temp_chan_bit) {
> >   			temp_en = 1;
> >  
> 


