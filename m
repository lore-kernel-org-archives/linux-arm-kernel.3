Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D27BCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 21:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:In-Reply-To:MIME-Version:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dn3CDjIt2vIiMqs+R+BPuA4q7fB48nnalDkVYsI1XXk=; b=AsIHITspIdALrdR3wYwX7wfPcm
	/TNtt393Qn7vl2oggQHhDa8CxZA2xDdQwtxgc0TQI3jGhcr8NWcCdNrqkZMsg+IIbcgMCvy2BibA5
	DnyOGoPKjeocoQ2+lxZVGmezPAaXSA1FIiPAwW+6ou2XIDdqUcuIjGE1jasD9WlAB56t4XCsZK9Y1
	zsbmxC/ww1pxAIlde+D3QEnoYej8YvcQCvU5uAvHly4YuJoyh3FdkphIX0ql7+bQ3jKsFJedw4QPm
	WQWI+2UcIBKGRLHoOfsUXAMhqJOsyO56qQuwjfMoZX0s1fv7+Dlhlo7M1LJc5i1+xZZgFEjwUIM4p
	tI2FQL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRzHh-00000002z8L-2wdn;
	Tue, 26 May 2026 21:25:57 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRzHd-00000002z7v-3rCc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 21:25:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-67fd8befac7so2279867a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779830751; cv=none;
        d=google.com; s=arc-20240605;
        b=lhvJcGWg5YS8HZw/irzB1pdPX3t7M+UM3zkO1j4035f7DRK11CAnLADH/sD4rlTE33
         iErqA+jKk+WxI1Czef+f4GHVN8FR0JDvBsXAD6EEtJcNKue15xg9ptU7cHxDKufgBBCR
         /uH+AI0+merlkCzKzlzatqzpXmK3LtWxQnE3Lx3285JfNUe3qYFUcyQHpISdaEOODYn6
         0TGz/vPcA4dufgq9SC/umk1+GMYxMD0A7B/wxZ27+FVIvSPlS6SHjNER5vuGxG8bcSJS
         KdvrNVPqpFF5Ydaupp5WftZA3farY4mC9E4h73vV3U+8pLN9WWy8XI1iJA2d4+kvdy1i
         rQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=dn3CDjIt2vIiMqs+R+BPuA4q7fB48nnalDkVYsI1XXk=;
        fh=ros95oCHr9lnxJGdJdRRAKZx2AeBVOZk4OC9yc2Puoc=;
        b=Y54a0U8yxwzf3OW+tcDRozm3kX6NCiM/mqQKQX8PqqXUvDZv9XrpyP5Vod1PcaTr8b
         oUHQYul+0hBwpCag/gpbTCYi35WqZLLVO7t6okCSlWVCuQUwZC2vD5te1e8zIYwritHy
         ArPEGUCrMt6xxOgE/n9MF0g0KphAwmKQBRj5CC47ZDP0KG0gO0j7It3H8CeapY3CCVWK
         w2LjXSRTwhd40pYApf9QRU6nbbyOqkUbWhnvmoliO4jsqtA3KxQ4r5w4LrSjaIC1OsPS
         uNy4itTCPFzv0FnCE5yv/q44VPGyElfd3nqY3kWe1GGbzUOFEHarPu4WhpC7TnDkqv8k
         8JOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779830751; x=1780435551; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dn3CDjIt2vIiMqs+R+BPuA4q7fB48nnalDkVYsI1XXk=;
        b=VA81592johZGap81bNMbe2tSNk6bwU6e1bT4gxGmu9LqPPbIy/wcmMZNy9ne+PvpYn
         BNCbyouoWMkTVA6XfXXHk2PGJ+EZdgrFkmU8fmr6D6I/EAh9Xym9jPQ9sd3ya60DPH0l
         CsjagOCX13ChmVZSBzj8AINAWF99UaAaugo9VNFH0w/o6ila95C8E7/YL15EfpXGJJVd
         bt8cPlURVGYjUGRwIODW90gH3a2FZJ3Sj8B2EMpIdY88mWcAwnXq/dxgSbOsiHBw+mx0
         6zjls2vBkofmyzjvv+cHuZBkCnvIXpzzDuv80cf8gZqsmgTFjqTbm8E5JnGs/3Cxei5Y
         ju+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779830751; x=1780435551;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dn3CDjIt2vIiMqs+R+BPuA4q7fB48nnalDkVYsI1XXk=;
        b=Oe8fLA8OOd1b5tIIt6YvdHtoKEcaHhXsAeaUpoGaD8VAe4vCrHhxfVK16S2E4cGpGG
         /dsfy3z93aagT/VChN660FlzTDUxmPKm2RK8Ddca8d/wq0kfMc2D00ql1q4B87IrD2h3
         rKzZH4kmBzsYvfeveO318s9+th0MQL2uVO2XDnENj6MedAJjuOFHq0D2PVTWOx7Ln1OO
         guf9c4yccVH4vGoVvEaI5NaZuQ5tKg58c4SKDJfJfZ9lKwOZ95bqRbmoN+DQ2frfZB0g
         +NNr/M+n9a08S7ZSbjCqUxuoN2Yhyla7Q53h/wP5AmUSvPnPURVXcirgXo4FZ7xldfiY
         JkCA==
X-Forwarded-Encrypted: i=1; AFNElJ9TXb5WGMOni+otbnSsUoLNzxx4p9YIW8B1rE3w65iC59jI/nJpEhDA+M2BdpNilcVc7fl65Eb3lZ9gPlQp55e7@lists.infradead.org
X-Gm-Message-State: AOJu0YwgFxgGGze2tXgJN1HLGHoEVGm0mAlIA0QrQVtkPZCcnL5GUst2
	lETDAaU/CXSTqPComwyHQKq5vmSBBwVHSREH4tuOoytwpvZmp4kuIc/hpnK8TADoFzvr9yfuSBX
	JFr+7E5RmGrez/3RZcUkbDHweAUmHy6lfXlLSK6/G0A==
X-Gm-Gg: Acq92OEYRzsvif6nYB4WTqjklsnBbDZaABce1mb2oN2k6xLfXDt4pl+0GOsJnqls+5H
	tIKIa1yiL6X9zPhkAQ9D/noJELN2V+UaJsvUHAF9UscYwanaGB60iZf/Ualv2DEyOYw/AO9EYpY
	IKILiRWGqQjUZuk0nqVS5t87e6Ut97u2sn+fzeeo95qTMdm4+1BL8VKjA2O3ZKzbp4X40wgmnch
	aoVCmZ7jb1UAhIa0GqKC4W1iDNX/f4gi+zMzv17YvPMhz0WlGx3xg1dete6OJ8UqqunXmL0OBJe
	arNT6BR/X1+A3w4jxfTvcKqnC0H7h7Rvl0sg
X-Received: by 2002:a17:907:fd8a:b0:bd5:18ee:a54a with SMTP id
 a640c23a62f3a-bdd2293ec75mr1247285466b.8.1779830751354; Tue, 26 May 2026
 14:25:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 23:25:50 +0200
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 23:25:50 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Jonathan Cameron <jic23@kernel.org>, 
	Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
 <20260522-wip-stmark2-dac-v3-11-16be0ad35a67@baylibre.com> <20260526143050.5fca6514@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20260526143050.5fca6514@jic23-huawei>
Date: Tue, 26 May 2026 23:25:50 +0200
X-Gm-Features: AVHnY4K4EVRlMYVfttR7ggQcjq5xwYPhtPTl_I0B1Kvzgy2_6s0yq2t2OwfFyUw
Message-ID: <CALSJ-wAqOkQ0j-rKb7Oju9BVqWuE1_Y-D5WQSHeaiV6JPQngRQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] iio: dac: add mcf54415 DAC
To: Jonathan Cameron <jic23@kernel.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_142554_014659_C464FCB1 
X-CRM114-Status: GOOD (  50.87  )
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

Hi Jonathan,

On Tue, May 26, 2026 at 02:30:50PM +0100, Jonathan Cameron wrote:
> On Fri, 22 May 2026 23:20:39 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:
>
> > From: Angelo Dureghello <adureghello@baylibre.com>
> >
> > Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> > DAC configuration registers are mapped in the internal IO address space.
> >
> > The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> > analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> > consists of a conversion unit, an output amplifier, and the associated
> > digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> > are respectively 0 and 0xfff, left untouched in this initial version.
> >
> > This initial version of the driver is minimalistic, "output raw" only, to
> > be extended in the future. DMA and external sync are disabled, default mode
> > is high speed, default format is right-justified 12bit on 16bit word.
> >
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> https://sashiko.dev/#/patchset/20260522-wip-stmark2-dac-v3-0-16be0ad35a67%40baylibre.com
>
> Given there were only a couple of comments I've included them below alongside
> my review.  All minor stuff.
>
> Thanks,
>
> Jonathan
>
> > ---
> > Changes in v2:
> > - remove tests from commit message, moved to patch 0
> > - remove additional blank lines
> > - remove dead code and unused definitions
> > - use regmap
> > - add limit check on raw write
> > - non functional style fixes
> > - add COMPILE_TEST to Kconfig
> > Changes in v3:
> > - add comments where needed
> > - code style changes
> > - remove unneeded variables
> > - use regmap_set_bits where possible
> > - remove macro not needed to define a single channel
> > - set up regmap to big_endian accesses for next patches that will come,
> >   that will adjust ColdFire readx/writex as standard LE (links in 0/x).
> > - add return value check on regmap calls
> > - sashiko: remove unneeded .io_port from regmap init.
> > - sashiko: add select REGMAP_MMIO in Kconfig
>
> Looks like you missed or disagreed with the previous sashiko comment on v2 about
> type passed to regmap_read()
>

Sahiko asks if regmap_read produces a compiler watning.
I don't see any,

> > ---
> >  drivers/iio/dac/Kconfig        |  11 +++
> >  drivers/iio/dac/Makefile       |   1 +
> >  drivers/iio/dac/mcf54415_dac.c | 207 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 219 insertions(+)
> >
> > diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> > index cd4870b65415..b1a578076188 100644
> > --- a/drivers/iio/dac/Kconfig
> > +++ b/drivers/iio/dac/Kconfig
> > @@ -516,6 +516,17 @@ config MAX5821
> >  	  Say yes here to build support for Maxim MAX5821
> >  	  10 bits DAC.
> >
> > +config MCF54415_DAC
> > +	tristate "NXP MCF54415 DAC driver"
> > +	depends on M5441x || COMPILE_TEST
> > +	select REGMAP_MMIO
> > +	help
> > +	  Say yes here to build support for NXP MCF54415
> > +	  12bit DAC.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called mcf54415_dac.
> > +
>
> > diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
> > new file mode 100644
> > index 000000000000..c8c87572d43d
> > --- /dev/null
> > +++ b/drivers/iio/dac/mcf54415_dac.c
> > @@ -0,0 +1,207 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * NXP mcf54415 DAC driver
> > + *
> > + * Copyright 2026 BayLibre - adureghello@baylibre.com
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/compiler_types.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
>
> not seeing any use of this. I guess it 'evolved' away.
> Anyhow, please sanity check these all one more time for v4.
>

thanks,
removed it and also linux/array_size.h that's unused now.

> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <linux/iio/iio.h>
> > +
> > +#define MCF54415_DAC_CR			0x00
> > +#define MCF54415_DAC_CR_PDN		BIT(0)
> > +#define MCF54415_DAC_CR_HSLS		BIT(6)
> > +#define MCF54415_DAC_CR_WMLVL		GENMASK(9, 8)
> > +#define MCF54415_DAC_CR_FILT		BIT(12)
> > +
> > +#define MCF54415_DAC_DATA		0x02
> > +
> > +struct mcf54415_dac {
> > +	struct regmap *map;
> > +	struct clk *clk;
> > +};
> > +
> > +static const struct regmap_config mcf54415_dac_regmap_config = {
> > +	.reg_bits = 16,
> > +	.reg_stride = 2,
> > +	.val_bits = 16,
> > +	.max_register = 0x0c, /* DACX_FILTCNT,  R.M. Table 30-2 */
> > +	.val_format_endian = REGMAP_ENDIAN_BIG,
> > +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> > +};
> > +
> > +static int mcf54415_dac_init(struct mcf54415_dac *info)
> > +{
> > +	int ret;
> > +
> > +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> > +	ret = regmap_write(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_FILT |
> > +			   FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));
>
> Perhaps use a local variable. It is a tiny bit too easy to miss that
> parameter being split over two lines.
>
> 	u16 val = MCF54415_DAC_CR_FILT | FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1);
>
> would avoid that.

ack, done.

>
> Alternatively perhaps just reflowing as:
> 	ret = regmap_write(info->map, MCF54415_DAC_CR,
> 			   MCF54415_DAC_CR_FILT |
> 			   FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));
>
> avoids that reading issue (I read it wrong ;)
>
>
>
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* DAC is ready after 12us, from RM table 40-3  */
> > +	fsleep(12);
> > +
> > +	return 0;
> > +}
>
> > +
> > +static int mcf54415_read_raw(struct iio_dev *indio_dev,
> > +			     struct iio_chan_spec const *chan,
> > +			     int *val, int *val2, long mask)
> > +{
> > +	struct mcf54415_dac *info = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		ret = regmap_read(info->map, MCF54415_DAC_DATA, val);
>
> Sashiko pointed out that regmap_read() expects a u32* so this should use
> a local variable for the read.
>

Sashiko asked if this is causing a warning. I don't see any.
Register read is a 16bit reg, and the valid 12bits are masked just after
to ensure returned value is always correct.

So can stay as is, or to make sashiko happy i can do something as:

	struct mcf54415_dac *info = iio_priv(indio_dev);
	int ret;
	u32 reg;

	switch (mask) {
	case IIO_CHAN_INFO_RAW:
		ret = regmap_read(info->map, MCF54415_DAC_DATA, &reg);
		if (ret)
			return -EIO;
		*val = reg & 0xfff;
		return IIO_VAL_INT;

> > +		if (ret)
> > +			return -EIO;
>
> Another one sashiko got. Why is this eating the possibly more useful error
> code from regmap_read()?
>

fixed with return ret

> > +		*val &= 0xfff;
> > +		return IIO_VAL_INT;
> > +	case IIO_CHAN_INFO_SCALE:
> > +		/* Reference voltage as per ColdFire datasheet is 3.3V */
> > +		*val = 3300 /* mV */;
> > +		*val2 = 12;
> > +		return IIO_VAL_FRACTIONAL_LOG2;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
>
> > +static int mcf54415_dac_resume(struct device *dev)
> > +{
> > +	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(info->clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	mcf54415_dac_init(info);
> If this fails should we report it?  I think you'd at least want
> some print to help with debug. (Sashiko got this)
>

Ok, so doing


	ret = mcf54415_dac_init(info);

	if (ret) {
		dev_err(dev, "could not resume device\n");
		return ret;
	}



> > +
> > +	return 0;
> > +}
>
>

Regards,
angelo

