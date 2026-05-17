Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C71CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 21:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:MIME-Version:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDbYh8nveG6AJ4qGTnJ5WMHjZoY6FKTJ3XlYsYDU5zY=; b=ypUXCuLYYoQOUiZEF9Chmn29BT
	bpjeH2QX8hGN9rpd6MhpTCctskbaUPrWJ6KlfzWV4q/WYxyF5dja0TsThUxrNiv+AjfNhPt0rRE7v
	5iW3MAATU2arONCrb8DrpFGoB5QBG9AYH9X8REt0mevgLq1UsP/z2uoyz7zsqgtQBTXZ3awmkrGCK
	HLQ3Roy5ciHxpa5lQbTA+OfljXdnaEXgIdPNlAKWiHF5xHoSVYxeXiUIDpvzzuF0hfsfy8BNYec7E
	Xtv5wcx8viDIDd/Ip84BfG6m3x6dalAEBVRYCph2ErLAhV05ahG4l244o0qEv23zImWl335+JP2ht
	AHtuTOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOifN-0000000DSqN-2qq7;
	Sun, 17 May 2026 21:04:53 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOifK-0000000DSpj-2RpH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 21:04:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b9d9971d059so225086966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 14:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779051888; cv=none;
        d=google.com; s=arc-20240605;
        b=KOo3fj2JUmTzz9Xov/UDAH8sefejmyCJHDePjYIwxacAF+3ZS87USFs3oEBR1oL2A4
         iiPVD5u4/hSxl5GN2ILLpPbXASYAH5IZkrD5d++MwxknIjL2JPzmkyTzAMBz0sYqc/+I
         jgK0IYIFJi+xSN0Bs1O5eudkuLb1pXyWvuZcM2cYvJQzypiFdWW4lbBqXLRdsCo21CkB
         ukyA7tydq3nA8z/Ew2OYmscWlnMUGzOxVD4FhTi1kIUNwSxDm/YZTUA7rL47DV71Efpp
         qYfN1QrVkJ1lOCQ6oBTuopyvrUvvH8tnF4t3wDHP5lqUSc9bkS11riQnZ9lmpywA0lJp
         YFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
         :references:esfrom:mail-followup-to:dkim-signature;
        bh=hDbYh8nveG6AJ4qGTnJ5WMHjZoY6FKTJ3XlYsYDU5zY=;
        fh=bVjD/RGsMEGgzb2SY8Yqn/rGMMpKjWKmI4njZToZFJg=;
        b=IwuxtcvyM4fbmQ0ieZXDS+fPtP0tpezOj0wc5KNk4JwYtQ+UPaT8NwnbW694aO9b5K
         Z3H++o/TST7BThKwWl3zk+BWlubdttAtvtN3+JTEnz2D0lr52jyEftHJ5rO4hw6QAyAQ
         7hJNGji6UnWOf13RxbOoM9OjZFOkKSs3qd9FEVSWEPMx7nmxm3BvqOtJSLcQhBB1WaI1
         dqnVOOBCWUk0bjkHHxxxqXB6oshkMldU1AEapm94s3rsK0hE1WWw5AWWlT1+gVDHa+Fq
         HSdgLZutgicVEBSFIvmEbIkLyDp2a1cQ5tX0QR6LXVA+fEI2i9isoesLC/y80/ajL9dU
         WHkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779051888; x=1779656688; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
         :references:esfrom:mail-followup-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDbYh8nveG6AJ4qGTnJ5WMHjZoY6FKTJ3XlYsYDU5zY=;
        b=Z7YN1Genh/eDNvMpztI0+T3GnePojVCHx5Kdwhh/q7kUDohq1ed7vOTwBBZrLeXeQ+
         6O31TFfdFuk+K9sqIXLSaZO08kmmxDPVVI6FiTP5fZmCvRl0qtt285qM9CcFPsuByuF5
         tvNKisB94lU7L+1P3bE51oSfF8XN0NptG5QkOkJ9ODxLQ0dVmKBCG4DwTECgVY/UtBks
         xCrWX5Rt7QXr3FdS1QyOgGZVWUxw+IENehEJLn1/BfZR6AQBIPD5PO82WGAaCo33L9vQ
         oAOq/QaGy79PloftcPP2XHzfSe6/dLJ2IBs/YVgmbeFw7vBAc3Nq3j6LnmO/TnBcIqOi
         HDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779051888; x=1779656688;
        h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
         :references:esfrom:mail-followup-to:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hDbYh8nveG6AJ4qGTnJ5WMHjZoY6FKTJ3XlYsYDU5zY=;
        b=bHA6tIVUcNgStyyb/VXy8cggSPdhS1bbgt+RZYkMKQN30HApfLBfR5rahN72EfvFcq
         NnLmaMCxNwz8vTxQ9Op00XuIJyYgZIHCKQBNKB0r6Dy1MYMx2uRXLxFG9tfudSSuMlUz
         4O2imjp0AvzxbH3sV3LpY5BaB6v4iLvapN0WqKs4UlQJOzMUQT4q9cofR1XWPQDq3Yqr
         7kLInYhyYPho7CKvF6gy3a+Gf0Entrw5qeZkie/ID1ImX6fP5e92lTz8IqOIoeVOt6/F
         UcYKQlggQm6VcmJXGsZUm8Cgu/QpWoLcpe5fHmuWF/lsh8ESeWDr5UEZjMkQQYJoPod5
         06+A==
X-Forwarded-Encrypted: i=1; AFNElJ8/ttoD1M8ingbWnAT0Php6yJH1gkeiAX9rkzdqfio+U6OjwyI/Ax1dhRh0n56n6dldTqsYiuzuthBOoyK8cuvQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwrRQoWD7h8t08PY4UQr3JBzhqWvFys9Ixr6YsFOzi1VCE93fLR
	BljGlLW22DWD1k0B8nIJNPy/fxteqndVkDcCid3TlEDMNut96gAJ+1oJDdKZ24LQbDKg38cS2DV
	GrbCdMOpiKCUMa1wm8KyN7hAQwcEw6Qtg0JKxJ6imng==
X-Gm-Gg: Acq92OHt7Lq+STCn+BXeOpiypv+PegMV+DST6a0Mxe3exWWsOA9qGZQvRCGceC8of4c
	ZkLiAKYinvtVNr5+c8IGmCwLx+0txDeJwowPtdMABtwrk8aTKkKIwYJfWOhax98Jj5QSk6gKlQT
	6rC+5ByD9ahz2Y86c35U1wXELdc+t3uBXxieaLgzC5MSzIBfYHQ+Sl0JJhZyVcNlXV26DUBUpQL
	0iBpH4kC/vh+XNkwHpTRR0uhwKDs+SWf+96KSKpQlEiH5hU9ZzvivqBy+yBskX/EDzQJ8GDgGnJ
	BaY7NaLO1ajR4WASAKsqjaI6W8Rp5tSRcV1l
X-Received: by 2002:a17:907:e143:b0:bbf:74d7:1c4a with SMTP id
 a640c23a62f3a-bd51797a62amr374507666b.40.1779051888479; Sun, 17 May 2026
 14:04:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 14:04:46 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 14:04:46 -0700
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
esFrom: angelo@archlinux
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com> <agTe7vZ94DnmD4Ed@ashevche-desk.local>
MIME-Version: 1.0
In-Reply-To: <agTe7vZ94DnmD4Ed@ashevche-desk.local>
From: Angelo Dureghello <adureghello@baylibre.com>
Date: Sun, 17 May 2026 14:04:46 -0700
X-Gm-Features: AVHnY4LhOGXoyOJyplIGodv_eunK_4nruqdQdyOYVyqkdOdxsDpZTI4SCFL0VTw
Message-ID: <CALSJ-wB4=fTTTExQf2pdoQVz7v5NjaaYQgwGwE+qoZNb6uzAqA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260517_140450_666681_4C3E7368 
X-CRM114-Status: GOOD (  30.90  )
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

H Andy,

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

Thanks, will look into all the above, together with sashiko, and issue
a v3 in short.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Regards,
angelo

