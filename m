Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10CDCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 06:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=; b=K5Jz+lJtyxb26xbCbL1J8McJVZ
	IiuAL0zLjefvSKnwyPjIQufBI+DRXvXK0+lOyNZiEdUozzKfQtTiS42zEdpifqE10B5pRdLr472Mg
	miF8STf4xOUhvbcSbgStDLtqKUOivt3KOu8qOPdTl7aQp+Nz5VueSO3zAIpbUj2gtAb/34+ZKvpiz
	chPFjKyzxdTiA/TEeymfeXosMoyH7qEfFV7B0eG/wJFX5+qybRo+djmJbs3Q7zp8ZvmqqXXkngJn/
	0MLM12nL1RrnuHMHVB3CeMVzaaT53RiYM1A8spflQQTC5yHjy4l4qU6asUx0W8nVeFGem1DcHt2uk
	OSJ8646Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgqp-0000000Fo6h-3AdC;
	Tue, 12 May 2026 06:44:19 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgqo-0000000Fo5h-0FsQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 06:44:19 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bccd251d622so404387566b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 23:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778568256; cv=none;
        d=google.com; s=arc-20240605;
        b=Rm6fC6QsJb/h6/9S52z2x3TojvXVf9jYEob6B1aLFCAg+U7T+WVRw5kEYkkwrVxVMm
         U/vbGebUpz+CNP61K/FQn1uz3+S3QRtZwWa4Lcd+o+bFBIpqG7xNTCNE1t2yR/0nfnbW
         r8cBYcIvIObEogOTqV3ou7V5lfVn7C3t/Ag2ZCB9/3K1fPdHDkqPBzT89LCPO7iByGKQ
         RVXdOhitgYfEDghDPWyK8ln3Ac6G0LsajUtVYD1WTJa1UqNdQOZPsC791GMe+CNc7y/Y
         +SX0+hKPOKQYkXrjExRao0I2CYxjeIom4s9JzzMgV8huKq4F2PxxyLky8lOd5y74wPCg
         Fnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=;
        fh=PKJDxXz/mCFYxVxPGv19h8wzQSpcL6MIQVEnyrPKdps=;
        b=beaN3wewiO1rfW6SSQEN3tHor7cDx4/rIm4wTLq46PoJ5oFJZy4p4NfSysmKu2uLC7
         lmGSAia9+XG9j0OzlhrT3sVTm3DEnuNdqRAJlyEkGvSAxLmzVBIe52aaWfjU146DB/Kc
         xtLvEzAznILosdaLaLSRsH91yoNx1eSB+D287bkBDNcVBm69BoqHW6gSCG++gpafNwLu
         wVeOxszB2CJ6BdOZM6dcdyySu1rS4D2xfAd15huO5RuRZLAggPpD4k4j31eYrmUBKOqW
         6EX25EM/jSkgvvDGmwUXCCYuMBoaDceHrrH7Ln0GzLsbTqoubZs1vx4LL3KRULZi0o2B
         HBSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778568256; x=1779173056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=;
        b=nSf0G3Ykd6rlHN+ojcR0VW8kMSKZ2Uy+4wV3EfLUzSFGwlVlB9Ag7rZ1DZNqLOGrwL
         FnDRqFc1pvDR87lK9Asg2MS8bdljq3I/GPdi5CQcM/imejTHQEuYASh+y/4bIPTz8zAe
         686l7L+449EfZI0mpkdFIiFjbzSnPHyVt0mMGJ+kivICNyxP/CUBEJB+0lBTQ4TAbmyZ
         X80tGyZDSKsOgjMcf1qXzcOh+iAC7GnYyR/8fqNPbeFaQvy2VIS9f7K3oT8z6LkmBwk9
         gX1Uwwtup5alU0AvfNKlKGUsh3nCBMIM3My4N5plKNnO/O9SPLlfNMLn+D9nP3kS3mVt
         tPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568256; x=1779173056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=;
        b=YktV9kchobK7McIAuxY4WWtMLlpqxXd96ZTSH/NOlT/5ciq/TW+K/XfeSrTpWE8P3O
         Cd9jgXPp6DbvkMkcmnrN+fDJe6CaYTGtOEZ0GZyX4gPIg9QnUdJl2g9qG2s0eoGijadA
         VmHz+LgF06sLU7NwCOVzImN44Lnri7hGCpyiBFrQWFBC6vXZY5INtcCjStM9T5X4kuMs
         Lpo8F6o+6fhcorhpHQnXXUyhoBZ/n47ClyjoiHzFnk+Stb++m2ZgpXC8yVDHC7tM9MXL
         jA7jsh0MzZvE8Cvq+nIuC/O3KqPLNGBeEy5jAhl8dyFsmcCMatPl2t65CverG1XY1vhb
         LSkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZmqpwN9eaQVKSa9Bn6LXWK6i5In/RWMNXqlaiPx42g0qcJQabEibThu3vr5uNrhSb9IKv06IrRJsR+NCV6EUz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5e94vpSbQTe4N9DhdjidS78DhpFw2q5yOzRp9pYNFHvlcqZvr
	MZOgA7haWO29VF8WGT1NRp/aR8gSzirliN7kNbPAjfq6o+cCfeea5YBNOXn5hdfcR8VLPvvGhQ5
	fQbiS9gQJK3V3DFc8tZx6Mdl4mFxCDJQ=
X-Gm-Gg: Acq92OFRzzvw5DiqrvQdql5HHCSOE/V27NLu4BM0PxWboy7W+OpZcsqfPSfqqSI4rdc
	JlS6ueDAcCMLm5oD4p4DymVnOOVNBbJh6Y6I2RosyBeqaQilSw/4YSEgnTZ3c++tqntQRGlQvx/
	9CoSBl5UXIFg2PMOPqapGFDmdFvlmB1T4SCLRm46BU/rjQldsWcLO/9vaC0Q7wGBVFgoRwX+SAq
	O+/Y///2srJc9i38iMN7o2HeWA1J8X2Vcof9yK5vfYiyacwjkDIVhloGZv48+iCO43TwnknjZoO
	8ONzhuSiwanTiZ34KjHo/iWT9fAgE9iRL+wyACVi1QBertRzx2lNLSx7x6YLHt44UjBlz1tnsai
	0OM+jsI4=
X-Received: by 2002:a17:907:728f:b0:bd1:d244:ca24 with SMTP id
 a640c23a62f3a-bd28e412eadmr84527766b.14.1778568255436; Mon, 11 May 2026
 23:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 09:43:38 +0300
X-Gm-Features: AVHnY4ISc11FAtQmtWdJlGYyo0XawWUZJbHlaYzrkD_vnuBBxzJNK6YMpmrGwVg
Message-ID: <CAHp75VdtORjmCCWy3-oiN-RQd+s7z=2G4s8hemv3xrq47vXu5g@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] iio: adc: mediatek: add mt6323 PMIC AUXADC driver
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_234418_148378_93FAF1AB 
X-CRM114-Status: GOOD (  28.02  )
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

On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
> provides support for reading various channels including battery and
> charger voltages, battery and chip temperature, current sensing and
> accessory detection.
>
> Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.

...

> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/iio/iio.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/stringify.h>

+ time.h // USEC_PER_MSEC

> +#include <linux/types.h>

...

> +#define AUXADC_TRIM_CH2                (3 << 10)
> +#define AUXADC_TRIM_CH4                (3 << 8)
> +#define AUXADC_TRIM_CH5                (3 << 4)
> +#define AUXADC_TRIM_CH6                (3 << 2)

Without a comment it's hard to say if these are like masks or actual
values. Can you clarify that in the comment on top of these four?

> +#define VOLTAGE_FULL_RANGE     1800

Are there any units? Are they millivolts or is it just some scale?

...

> +#define MTK_PMIC_IIO_CHAN(_name, _idx, _ch_type)       \
> +{                                                      \
> +       .type =3D _ch_type,                              \
> +       .indexed =3D 1,                                  \
> +       .channel =3D _idx,                               \
> +       .address =3D _idx,                               \
> +       .datasheet_name =3D __stringify(_name),          \
> +       .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) | \
> +                             BIT(IIO_CHAN_INFO_SCALE) \

Keep the trailing comma as this is not a terminator.

> +}

...

> +/**
> + * struct mt6323_auxadc - Main driver structure
> + * @regmap:        Regmap from PWRAP
> + * @lock:          Mutex to serialize AUXADC reading vs configuration
> + *
> + * The MediaTek MT6323 (as well as lot of other PMICs) have the followin=
g hierarchy:
> + * PMIC AUXADC <- PMIC MFD <- SoC PWRAP (wrapper for PWRAP FSM)
> + *
> + * Therefore, PWRAP regmap should be get using dev->parent->parent.

get --> obtained

> + */

...

> +static int mt6323_auxadc_prepare_channel(struct mt6323_auxadc *auxadc)
> +{
> +       struct regmap *map =3D auxadc->regmap;
> +       u32 val;
> +       int ret;
> +
> +       ret =3D regmap_read(map, MT6323_AUXADC_CON19, &val);
> +       if (ret)
> +               return ret;
> +
> +       /* The ADC is idle */
> +       if (!(val & AUXADC_DECI_GDLY_MASK))
> +               return 0;
> +
> +       ret =3D regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19, val,
> +                                      !(val & AUXADC_ADC19_BUSY_MASK), 1=
0, 500);

It's better to have a logical split

       ret =3D regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19,
                                      val, !(val & AUXADC_ADC19_BUSY_MASK),
                                      10, 500);

> +       if (ret)
> +               return ret;
> +
> +       return regmap_clear_bits(map, MT6323_AUXADC_CON19,
> +                                AUXADC_DECI_GDLY_MASK);
> +}

...

> +static int mt6323_auxadc_read(struct mt6323_auxadc *auxadc,
> +                             const struct iio_chan_spec *chan, int *out)
> +{
> +       struct regmap *map =3D auxadc->regmap;
> +       u32 val, reg =3D mt6323_auxadc_channel_to_reg(chan->address);
> +       int ret;
> +
> +       ret =3D regmap_read_poll_timeout(map, reg, val, (val & AUXADC_RDY=
_MASK),

Parentheses are not needed in this case. But I'm fine with it here as
it probably makes it easier to get the idea.

> +                                      1 * USEC_PER_MSEC, 100 * USEC_PER_=
MSEC);
> +       if (ret)
> +               return ret;
> +
> +       *out =3D FIELD_GET(AUXADC_DATA_MASK, val);
> +
> +       return 0;
> +}
> +
> +static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
> +                                 const struct iio_chan_spec *chan, int *=
val,
> +                                 int *val2, long mask)

Logical split

static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
                                 const struct iio_chan_spec *chan,
                                 int *val, int *val2, long mask)

> +{
> +       struct mt6323_auxadc *auxadc =3D iio_priv(indio_dev);
> +       int ret, mult =3D 1;

Decouple assignment and definition. These types of assignments are
hard to maintain and might lead to subtle mistakes in the future.

> +       if (mask =3D=3D IIO_CHAN_INFO_RAW) {
> +               guard(mutex)(&auxadc->lock);
> +               ret =3D mt6323_auxadc_prepare_channel(auxadc);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt6323_auxadc_request(auxadc, chan->address);
> +               if (ret)
> +                       return ret;

Please, add a comment with the reference to a datasheet (ideally)
explaining this sleep.

> +               fsleep(300);
> +
> +               ret =3D mt6323_auxadc_read(auxadc, chan, val);
> +               if (ret)
> +                       return ret;
> +               return IIO_VAL_INT;
> +       } else if (mask =3D=3D IIO_CHAN_INFO_SCALE) {

Redundant 'else'

> +               if (chan->channel =3D=3D MT6323_AUXADC_ISENSE ||
> +                   chan->channel =3D=3D MT6323_AUXADC_BATSNS)
> +                       mult =3D 4;
> +
> +               *val =3D mult * VOLTAGE_FULL_RANGE;
> +               *val2 =3D AUXADC_PRECISE;
> +
> +               return IIO_VAL_FRACTIONAL;

> +       } else

Ditto, and it's the wrong style. Read the Coding Style documentation
to clarify this.

> +               return -EINVAL;
> +}

...

> +       ret =3D devm_mutex_init(dev, &auxadc->lock);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to initialize mute=
x\n");

Unneeded error message. Most likely it's -ENOMEM, which will be
ignored by dev_err_probe() anyway.

...

> +       ret =3D devm_iio_device_register(dev, iio);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to register iio de=
vice\n");

If you don't see the device, it's failed to register, do we need this messa=
ge?

--=20
With Best Regards,
Andy Shevchenko

