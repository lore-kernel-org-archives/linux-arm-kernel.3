Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C701FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 10:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Wk/E6gFcBPa0/cjOCcgRpBO67wzZNWewnL0fIUm6Ec=; b=pfNVlaQTE0yT2fCsQ/KpVK8vBm
	2DbhlEGyYEmTRWONK3VLhKz/Fd+yVABZtY5Gl8Vvwx3lBlAwR0rTY+uBXzeFocxg+gBLN5PTqXjAz
	eoDuucnvReUv0xOr5tB2ZRsOh1hk93z4HkGN6fYF7KD4QeuuVrzwuQkaCFSlx32/G2vL0WvuT7iYK
	TMrEI/c8kNnKUAb8Gy+rI49RswW7HeeyqpTZEYnS2u7bkfRwTfP+2bwVoCr7prMgn3uFjow8vokyc
	bvaEHNnH4E0x4UsZmKVU3VKgZzHpEWYSvfsqLhdOhOWBjT6ZnFwfjFBQrKYjYEn5XKvYgWTokEMvG
	l8vJqMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwvZ-0000000FSYq-2Lv9;
	Sun, 26 Apr 2026 10:41:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwvY-0000000FSYS-1ywj;
	Sun, 26 Apr 2026 10:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 934C2600CB;
	Sun, 26 Apr 2026 10:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B5DC2BCAF;
	Sun, 26 Apr 2026 10:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777200087;
	bh=bWuYnO75xPWJJzpmOLfME7o59x3oZomw2PqqFsHNDKc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Rxn4W1ybROgNUPHL7WHZepd5HEn3s4NjpiHxJPTzVQTagfs298o6rOZZ3vI4COjS0
	 Zo1QTzuYVJJEhelJrboWJ+aYJZsM/LthaEvmMqcFjg+2TOQZvd6FP9h40puitiI696
	 qGup3Zb0LePODPuqynEoHZA936p8PvtaL9GK/RJAmK5gfwmUXI1q8B3iAhgWP3MsR3
	 2TUZmwQcf0j0+HQwKrKWJwMkbUxdviLcEfi2ZEHMD8XBUJGVWIHHcW35afjIB1vAlB
	 ZhtLxGOS6feEg8BeHxFvIMPytR2sbX52jNC4sLyZ43+naquvu5p1m+BrsuNnPhFB+e
	 v4Dt1yZDNY+OA==
Date: Sun, 26 Apr 2026 11:41:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Felix Gu <ustc.gu@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
Message-ID: <20260426114118.7ad8b130@jic23-huawei>
In-Reply-To: <CAKxU2N9_Nmk_apUZLSCGssXpwxYOz9k99ggRcUM3EPGUzaVi7w@mail.gmail.com>
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
	<CAKxU2N9_Nmk_apUZLSCGssXpwxYOz9k99ggRcUM3EPGUzaVi7w@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Sat, 25 Apr 2026 12:20:55 -0700
Rosen Penev <rosenp@gmail.com> wrote:

> On Sat, Apr 25, 2026 at 9:07=E2=80=AFAM Felix Gu <ustc.gu@gmail.com> wrot=
e:
> >
> > meson_sar_adc_temp_sensor_init() allocates a buffer with
> > nvmem_cell_read(), but the old code leaked it if
> > syscon_regmap_lookup_by_phandle() failed.
> >
> > Switch buf to __free(kfree) so all return paths release it.
> >
> > Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/iio/adc/meson_saradc.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_sar=
adc.c
> > index 23991a3612bd..9708ddcc4919 100644
> > --- a/drivers/iio/adc/meson_saradc.c
> > +++ b/drivers/iio/adc/meson_saradc.c
> > @@ -786,7 +786,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *i=
ndio_dev,
> >  static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
> >  {
> >         struct meson_sar_adc_priv *priv =3D iio_priv(indio_dev);
> > -       u8 *buf, trimming_bits, trimming_mask, upper_adc_val;
> > +       u8 trimming_bits, trimming_mask, upper_adc_val;
> >         struct device *dev =3D indio_dev->dev.parent;
> >         struct nvmem_cell *temperature_calib;
> >         size_t read_len;
> > @@ -807,14 +807,12 @@ static int meson_sar_adc_temp_sensor_init(struct =
iio_dev *indio_dev)
> >         }
> >
> >         read_len =3D MESON_SAR_ADC_EFUSE_BYTES;
> > -       buf =3D nvmem_cell_read(temperature_calib, &read_len);
> > +       u8 *buf __free(kfree) =3D nvmem_cell_read(temperature_calib, &r=
ead_len);
> >         nvmem_cell_put(temperature_calib);
> >         if (IS_ERR(buf))
> >                 return dev_err_probe(dev, PTR_ERR(buf), "failed to read=
 temperature_calib cell\n");
> > -       if (read_len !=3D MESON_SAR_ADC_EFUSE_BYTES) {
> > -               kfree(buf); =20
> I don't like this. Just add the missing kfree.

That is the minimal fix, so we should probably do that first
even if we then circle back to consider if __free() magic is worth using he=
re.

J
> > +       if (read_len !=3D MESON_SAR_ADC_EFUSE_BYTES)
> >                 return dev_err_probe(dev, -EINVAL, "invalid read size o=
f temperature_calib cell\n");
> > -       }
> >
> >         priv->tsc_regmap =3D syscon_regmap_lookup_by_phandle(dev->of_no=
de, "amlogic,hhi-sysctrl");
> >         if (IS_ERR(priv->tsc_regmap))
> > @@ -835,8 +833,6 @@ static int meson_sar_adc_temp_sensor_init(struct ii=
o_dev *indio_dev)
> >         priv->temperature_sensor_adc_val |=3D upper_adc_val << BITS_PER=
_BYTE;
> >         priv->temperature_sensor_adc_val >>=3D trimming_bits;
> >
> > -       kfree(buf);
> > -
> >         return 0;
> >  }
> >
> >
> > ---
> > base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
> > change-id: 20260425-meson_saradc-54abc52d9b31
> >
> > Best regards,
> > --
> > Felix Gu <ustc.gu@gmail.com>
> > =20


