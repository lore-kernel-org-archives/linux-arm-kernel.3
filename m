Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2760CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:In-Reply-To:MIME-Version:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCAT/FSMB8tJhmNGpR3NQBa4aJk54FUzKfLnS0Vjt6c=; b=TRatDqyUx5aKPGSfLbyTqZwiXG
	re5AaDWGGFp1in3tlvXu0jMpCakdMP254LTY4OYrc+g2oQGEyN2mmmI4PccWWAjQI38tHHNyfHVb9
	QkHAGC/UtfJK06n8aI1D0toxhm5GyxvCsiv/gAqWk8Ss/RsY2jsQBkeaBwI/kbfd80zY7ShPJ9y6C
	0GMX8ZmcrPgfqMKDHKo4fFRC1uBbTDytMOQdGw8ddRuje/zTM5693vlT37NDTxVWGgVFtozCqb+io
	xh4c2RjaiHFHFVyX/J9pyIEMChXQX5KElRcGAnEOeOrjXqhntVKO8Ws3sOng8xSUibLXZAUZPI8Eu
	6K5U52/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2I3-00000007hLb-2Ckb;
	Thu, 21 May 2026 12:14:15 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2I0-00000007hKj-3ZNG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:14:14 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bd0209f25c1so1022837266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779365650; cv=none;
        d=google.com; s=arc-20240605;
        b=UEhYmkoa8MehFtvv7QS+giqagpo7SH2Q6DzyS+gS9pu0N8RDU9pBkSyxEzJv7ecra/
         lzJ/t3Mu2/qe1SsrzDevpVu+pP1P5IVG3PPzpOedtWKcKiW3U/VFS78sIJmLm9RMxwn/
         zGzrqp4UWI1yo6JayWfwnL3Rnh8lCsL/T0YVEvzE67vvnKBE9xw6BWMuKb2ujxTIP9wB
         hsL7rlweLMVyzhfPs1pTV164KhoIgZKVht/xO6wq5Jq8gMu1XbcNEXZCzAb+8ySh2/3B
         uVDwuz5tOTfVkCtFovDW1lhwyaWPlWxa7pA6XryRqC2X9aNKX0xJcybRxmI3juni7/Q5
         Iu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=kCAT/FSMB8tJhmNGpR3NQBa4aJk54FUzKfLnS0Vjt6c=;
        fh=XaWInRZ+kuIKsrPkL0LbXeSE1nCyaSipRQh00++I628=;
        b=KL7cLzSD99gLnq9/ch/MLBTMpainKp7+StsQbmDCIxtJqyyQVpe7O031Ifuzjca3rh
         kJ+s+ufchgWFW6qKnWNOsDaHskRLsY6xwTtDC7wSLWalhWFBP0nHIeYfjGqh3KCw4iDu
         u5XvWSjD9N257LzSQQSvQnPTxR+BQ/5UMm3RUK8T1soC6oVNrx0xY6Y1gwmRAWjmiRCm
         m+6Dz3AYUP8MbnNq3RIoTNHLC7Zyky1q4WVt5/arVZl9SlX/NktOs+DtEkHrzliw7MW/
         V0W1U+QqDjPH3A55oYIw1Io0GLEQtyUqYBoMUTwnrZh9XoXby/ZuM9dfitXxECv/qagD
         kaBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779365650; x=1779970450; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCAT/FSMB8tJhmNGpR3NQBa4aJk54FUzKfLnS0Vjt6c=;
        b=mFPsPqssofpdmd/wzb+JUwWab8o2mpOnUc4tnY4x+BAhSvfwHaC0mhxD3YGVa8FFeU
         rcNtfdQiaGokX7cV9AbBEDK8E96IU6wsJE5M1+S+SQLqCGnRSnFdUSv2MiYX63qP7OMK
         3roLeKLn8tvpm5IhqOlG4JoNXspzDoet/EfR4wYD/AWeX0Rzdicp211fSTLd6thjB2AM
         aXSu5M0T+L8QlMk2vHAU9iZGtzSSr1+Udd/x8+ExvG49ZXXtryLDDsK1X+4imd6BZoNH
         QbJZLImSNpKLSyn5iequf9OVN4FYvLzGzbF9BUAMa7ZSEq5TV2TaoUFLJPoxVlccAhrX
         3n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365650; x=1779970450;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kCAT/FSMB8tJhmNGpR3NQBa4aJk54FUzKfLnS0Vjt6c=;
        b=f2uU+VdZ+PBr0jhwzg1BP4zHDcFF77vupAPAMQKvqePDGbREYziMCpmejYv2St9Jzn
         N0HK9cEZcr/yz2U9a3pca7ub4NsH4ty7466P4EEBIagpI3x+tkvaba4JDmqcTmGfvkbM
         bLnZR0i7VdPjb18F1MvjldavZ7TUdBUZluaIpji9me1wWYJhBp/PubioHo/mVzrvEcdE
         YNBvA2P6hE65n4jLDWf2ZLyc/cgwMlwxmrL31mVejRRFIjmr4MIGIOiLCt5mmOOVIAFv
         TusMoC/T6OprwbFSM+tyRm/q4W7jOmX5hCbniWfidrjsGjvcoT8PnioARK/8wzYifWoz
         jNzg==
X-Forwarded-Encrypted: i=1; AFNElJ9ldOFVpdiFO3EGg3BzFuwKZXCKOi1YT2SE9Rojwpo7RX6ckoS5IzNHi0guTihGAXYcl8F8rEE6jN5yWKd4xkwO@lists.infradead.org
X-Gm-Message-State: AOJu0YwDJSY18M53Qrdv7nPhRxpQ7YWV5/6CQN6sANRMF5WhAfKfHQXa
	Ne5iUhdKI2D4QjGb2mRioWj7yrnxba18xgeA75A6rMpEcMfi+cs5YvIjZPcA/6ENoHQi5Y5r3Z6
	YpJtLwsuLdtLE6sDWL9mYuDOqqTa5fDhQqzEOTotlOA==
X-Gm-Gg: Acq92OFLVSmfEH3EOsgASvCyp1KDjhpw4qUfy64UJgvntLIjPH716oiYCw7D59p+zT9
	QRzLq+sCv96Ee3O2nZo6kT1+5bSZTbCHj3ikr+E84qFhIeAGDN6BiXI5OG7Zkh2zQ4bOcTebgKN
	wedT9Hg/cRBHHoNC2Jqoqc+2dE7qOLlRQGW88KcKtIv9TvQOwRK2vjdBWkug/V/Ai978AqJpfNn
	+HYReTSd9U6HcFslqIX8rB/7VolP4m/j2klySNN5v54Iw6loKOENxB4lWd4WRPSIU5VfYlwTvGe
	P//PGBV8s0Z55bqbhumtv1xlxIWC361d6mJl
X-Received: by 2002:a17:907:6d27:b0:bd2:e940:db38 with SMTP id
 a640c23a62f3a-bdc17d23987mr141007766b.28.1779365650245; Thu, 21 May 2026
 05:14:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 05:14:07 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 05:14:07 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com> <agTe7vZ94DnmD4Ed@ashevche-desk.local>
MIME-Version: 1.0
In-Reply-To: <agTe7vZ94DnmD4Ed@ashevche-desk.local>
Date: Thu, 21 May 2026 05:14:07 -0700
X-Gm-Features: AVHnY4KQ9snIXNmFVw7beAhQpkjp4lsWxF_SmKnG6LJVzoen_-CkRZHjCww1Cio
Message-ID: <CALSJ-wBbjwrhTEpfKm-JHox7-E1YRQ=kTj1JN+KyiucTTu7c3A@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] iio: dac: add mcf54415 DAC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_051412_929156_3DDA34A7 
X-CRM114-Status: GOOD (  32.18  )
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

Hi Andy,

just few points below, the rest has been fixed:

On Wed, May 13, 2026 at 11:28:30PM +0300, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 11:14:35AM +0200, Angelo Dureghello wrote:
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
>
> ...
>
> > +#include <linux/array_size.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/compiler_types.h>
> > +#include <linux/delay.h>
>
> + err.h
>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
>
> ...
>
> > +struct mcf54415_dac {
> > +	struct clk *clk;
> > +	struct regmap *map;
>
> I believe that regmap pointer is used more often, can you check with
> bloat-o-meter that swapping these two (by the order) gives any benefit in
> object size?
>

checking size in ColdFire arch with last kernel.org gcc had no benefit,
anyway put regmap before

> > +};
>
> ...
>
> > +	.max_register = 0x1F,
>
> No definition? What datasheet says about this? Perhaps define the MAX as per
> last defined register in the datasheet?
>
> > +};
>
> ...
>
> > +static void mcf54415_dac_init(struct mcf54415_dac *info)
> > +{
> > +	/* Keeping defaults and enable DAC (bit 0 set to 0) */
> > +	regmap_write(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_FILT |
> > +		     FIELD_PREP(MCF54415_DAC_CR_WMLVL, 1));
>
> Seems the whole driver ignores IO errors, why?
>
> > +	/* DAC is ready after 12us, from RM table 40-3  */
> > +	fsleep(12);
> > +}
>
> ...
>
> > +static void mcf54415_dac_exit(void *data)
> > +{
> > +	struct mcf54415_dac *info = data;
> > +
> > +	regmap_update_bits(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_PDN,
> > +			   MCF54415_DAC_CR_PDN);
>
> regmap_set_bits()
>
> > +}
>
> ...
>
> > +static int mcf54415_write_raw(struct iio_dev *indio_dev,
> > +			      struct iio_chan_spec const *chan,
> > +			      int val, int val2, long mask)
> > +{
> > +	struct mcf54415_dac *info = iio_priv(indio_dev);
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		if (val < 0 || val > 4095)
>
> Do we have a definition for the resolution? I'm fine with the plain numbers,
> but it's better to add a short comment to say that this is "based on the
> resolution of XXX register per datasheet".
>
> > +			return -EINVAL;
> > +		regmap_write(info->map, MCF54415_DAC_DATA, val);
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
>
> ...
>
> > +static int mcf54415_dac_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct iio_dev *indio_dev;
> > +	struct mcf54415_dac *info;
> > +	void __iomem *regs;
> > +	int ret;
> > +
> > +	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
> > +	if (!indio_dev)
> > +		return -ENOMEM;
> > +
> > +	info = iio_priv(indio_dev);
> > +
> > +	regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(regs))
> > +		return dev_err_probe(dev, PTR_ERR(regs),
> > +				     "failed to get io regs\n");
>
> One line.
>

i decided to stay inside 80 in all the file, is it ok ?

> > +
> > +	info->map = devm_regmap_init_mmio(dev, regs,
> > +					  &mcf54415_dac_regmap_config);
> > +	if (IS_ERR(info->map))
> > +		return PTR_ERR(info->map);
> > +
> > +	info->clk = devm_clk_get_enabled(dev, "dac");
> > +	if (IS_ERR(info->clk))
> > +		return dev_err_probe(dev, PTR_ERR(info->clk),
> > +				     "failed getting clock\n");
>
> Also can be a single line, but this one a bit longer than above, gives
> 88 characters.

same as above

>
> > +	platform_set_drvdata(pdev, indio_dev);
> > +
> > +	indio_dev->name = "mcf54415";
> > +	indio_dev->info = &mcf54415_dac_iio_info;
> > +	indio_dev->modes = INDIO_DIRECT_MODE;
> > +	indio_dev->channels = mcf54415_dac_iio_channels;
> > +	indio_dev->num_channels = ARRAY_SIZE(mcf54415_dac_iio_channels);
> > +
> > +	mcf54415_dac_init(info);
> > +
> > +	ret = devm_add_action_or_reset(dev, mcf54415_dac_exit, info);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return devm_iio_device_register(dev, indio_dev);
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Regards,
angelo

