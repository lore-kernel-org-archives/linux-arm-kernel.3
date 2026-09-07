Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300F1C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 02:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/5E7ar9Qu1U4zuanyEAu2sMH4ZDvgtn0WBn4A7tQrg=; b=jIxrEoxTVCcqRJ2X6WzbwowPNS
	Ni9mKaUZsWJHovKuDoDhQdmt4Xqca/kQDXL4dNw3CiKwXV1SVsEYOQO2YPuIF8c3IX1zyCuFuexAO
	gcPBfOOeIpPkIrHEiYQTd32FIaSNcg/NZKghFGfx4awyGQOvfHgHRou7OC56AQJeuzFwky1fZx2xG
	XPKz6694ml7VyM3IVA23+Mru0Wh9Joc0DZBXoOGF0nzH9dfXU0auWwj7BH2PLGIPfHWstotF4ALeY
	rM4Q0GLQ+eV3zmUrQT1g2TPKrIQl5NNnEhQJi5rHl3R5kK/R0ty0Zk3imdUjC4qj08UR6a7U6AY72
	kkUe4/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3OvD-00000005hiS-1b3K;
	Mon, 07 Sep 2026 02:17:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3OvC-00000005hiK-1n7c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 02:17:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C92C260A96;
	Mon,  7 Sep 2026 02:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5261F00A3A;
	Mon,  7 Sep 2026 02:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788747441;
	bh=j/5E7ar9Qu1U4zuanyEAu2sMH4ZDvgtn0WBn4A7tQrg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=n8vSLj72dWOHQnbPTHf/ryJBe+xSb4TjwpqdJNETOYqLT9/O6dCmQw+NlK7hRegNT
	 CUvFmeq2wUuU7IN3i2b6v6Dw5+LpFyYpY4lnM5NU1gLhc1dZcHL4eLYSRzg7mfJuSL
	 5fzbg8Pi0kjdhqfX10DN5rnFYtigHyeoWmK2vjWA/rzkYyRlmKCHa6ZvyxKtirjQc0
	 Nk8e0rC5Dru0lBT0hkLdqK2CN/mghpDXFT8Lx1rQXE5YnWKBxmCaQOW5u7oWqF+T7X
	 ++W4J9x4X0uqhSds3eo98TVRktn4jhMEQd/vm5XbDffrgtQE35caizAT2lvLDrp+1T
	 jeRY03Dxa5nnw==
Date: Mon, 7 Sep 2026 03:17:16 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
 <joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
 <Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
 <mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 07/17] iio: adc: at91-sama5d2_adc: adapt the driver
 for sama7d65
Message-ID: <20260907031716.0e5ceb9a@jic23-huawei>
In-Reply-To: <20260815212113.65e60919@jic23-huawei>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
	<20260806074024.531259-8-varshini.rajendran@microchip.com>
	<20260815212113.65e60919@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 15 Aug 2026 21:21:13 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Thu, 6 Aug 2026 13:10:14 +0530
> Varshini Rajendran <varshini.rajendran@microchip.com> wrote:
> 
> > Add support for sama7d65 ADC. The differences are highlighted with the
> > compatible. The calibration data layout is the main difference.
> > 
> > Update Kconfig help text to mention SAMA7 SoC family support.
> > 
> > Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>  
> 
> The Sashiko feedback on this one is interesting.
> 
> https://sashiko.dev/#/patchset/20260806074024.531259-1-varshini.rajendran%40microchip.com
> 
> The timestamp in the chan_spec array isn't the last one - the
> timestamp comes after it which is going to break in various
> unhelpful ways - as iio_push_to_buffers_with_timestamp() requires
> the timestamp to be the last scan index.
> 
> in at91_adc_trigger_handler_nodma() there is a comment saying
> that it can only be used with voltage channels. That's fine but
> if they aren't useful, why are the scan_index values not -1
> which is how we hide those interfaces for channels for which
> buffered capture is not supported.
> 
> Given you have the hardware set up, can you check if the
> scan_elements/*_en is there for the temp channel and
> that for cases where it is enabled, we get an error in the
> buffer preenable callback?
> 
> So I think it's a false positive but fair enough given the
> current user interfaces seems likely to be rather odd.
> 
> Please sanity check all this.
This is still open.  I'm going to mark the series as expecting
a new version in patchwork as it's been sitting a while without
activity and loose track of status after a week or two!

Jonathan
> 
> One other thing inline.
> 
> Jonathan
> 
> 
> > ---
> >  drivers/iio/adc/Kconfig            |  2 +-
> >  drivers/iio/adc/at91-sama5d2_adc.c | 30 ++++++++++++++++++++++++++++++
> >  2 files changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > index 3755a81c1efd..85b443853a08 100644
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -647,7 +647,7 @@ config AT91_SAMA5D2_ADC
> >  	select IIO_TRIGGERED_BUFFER
> >  	help
> >  	  Say yes here to build support for Atmel SAMA5D2 ADC which is
> > -	  available on SAMA5D2 SoC family.
> > +	  available on SAMA5D2 and SAMA7 SoC families.
> >  
> >  	  To compile this driver as a module, choose M here: the module will be
> >  	  called at91-sama5d2_adc.
> > diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> > index 3e9feb824a66..c1e5139a058c 100644
> > --- a/drivers/iio/adc/at91-sama5d2_adc.c
> > +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> > @@ -528,6 +528,15 @@ static const struct at91_adc_temp_calib_layout sama7g5_temp_calib = {
> >  	.p1_scale = { .numerator = 1000, .denominator = 1 },
> >  };
> >  
> > +static const struct at91_adc_temp_calib_layout sama7d65_temp_calib = {
> > +	.tag_idx = 1,
> > +	.p1_idx = 3,
> > +	.p4_idx = 2,
> > +	.p6_idx = 5,
> > +	.min_len = 11,
> > +	.p1_scale = { .numerator = 1, .denominator = 1000 },
> > +};
> > +
> >  /* Temperature sensor calibration - Vtemp voltage sensitivity to temperature. */
> >  #define AT91_ADC_TS_VTEMP_DT		(2080U)
> >  
> > @@ -766,6 +775,24 @@ static const struct at91_adc_platform sama7g5_platform = {
> >  	.temp_calib_layout = &sama7g5_temp_calib,
> >  };
> >  
> > +static const struct at91_adc_platform sama7d65_platform = {
> > +	.layout = &sama7g5_layout,
> > +	.adc_channels = &at91_sama7g5_adc_channels,
> > +	.nr_channels = AT91_SAMA7G5_SINGLE_CHAN_CNT +
> > +		       AT91_SAMA7G5_DIFF_CHAN_CNT +
> > +		       AT91_SAMA7G5_TEMP_CHAN_CNT,
> > +	.max_channels = ARRAY_SIZE(at91_sama7g5_adc_channels),
> > +	.max_index = AT91_SAMA7G5_MAX_CHAN_IDX,
> > +	.hw_trig_cnt = AT91_SAMA7G5_HW_TRIG_CNT,
> > +	.osr_mask = GENMASK(18, 16),
> > +	.oversampling_avail = { 1, 4, 16, 64, 256 },
> > +	.oversampling_avail_no = 5,
> > +	.chan_realbits = 16,
> > +	.temp_sensor = true,
> > +	.temp_chan = AT91_SAMA7G5_ADC_TEMP_CHANNEL,  
> Is this ever used?
> 
> > +	.temp_calib_layout = &sama7d65_temp_calib,
> > +};
> > +
> >  static int at91_adc_chan_xlate(struct iio_dev *indio_dev, int chan)
> >  {
> >  	int i;
> > @@ -2632,6 +2659,9 @@ static const struct of_device_id at91_adc_dt_match[] = {
> >  	}, {
> >  		.compatible = "microchip,sama7g5-adc",
> >  		.data = &sama7g5_platform,
> > +	}, {
> > +		.compatible = "microchip,sama7d65-adc",
> > +		.data = &sama7d65_platform,
> >  	}, {
> >  		/* sentinel */
> >  	}  
> 
> 


