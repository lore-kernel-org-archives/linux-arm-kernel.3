Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379CAC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 13:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uNMJX530UJ5/FMBVTRpdxGyIh+Z1Pm9NrQtCU29omM=; b=pJKrbN0iUHlBVAUOWLfqbaf7zG
	yjPR63KEb+V70mVFRj9wQzDVvXh4jrfVbjAnZeRrtsO7G/x4/lXPvTA8N22pF3LyVvM8KgfoAiArr
	bz4cil7IMuvhw3A9NblN2io+P63estPNet8MW8tkJ8KsAxyl33yMzetZtvgsext8B32eYJEzVQ691
	4Pwq0F2WehZ6LMC3Ih0Wakolxz1fjjTVFk3nc0f7E7f1D4KiDppBvUZve+ioti+0C5gEbZvAlXGuw
	ror8VISgmM4/WCwky+0AXWd4lvLvkYUnGoPz11MzzPha7QwgSy3YS1SMdbtG24B01jdboeuQ8bd+X
	DmTmXZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivb8-0000000AaWB-2uCq;
	Mon, 04 Aug 2025 13:51:30 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiv7C-0000000AWPB-1oG4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:20:35 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-615d1865b2dso4888999a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754313633; x=1754918433; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uNMJX530UJ5/FMBVTRpdxGyIh+Z1Pm9NrQtCU29omM=;
        b=jgkOR7tQvKozs4xT6uRt9JtfQKyznmL9P/Wt7ocOb8JrdlUdhK8Oei/hQ1ld47U35N
         N2mqT7aNnAruDdd35PTY/H/RadGXC4qddcaOvBgv6PRg4vqRBIJwwRIuMd14kSOE2i26
         cFZlR3MjahRKcPR6f1wOUTtIcexllqfKEl/tduZrX3Wq6i83LTTmj04LFp2GU1cNnNCw
         7tEHoV/lHqbfYYsw9p1WnEd7k6XNAVcxYmJ0W0tED/+22T5crIXcpbl0xsbNiRd68Meq
         4yaIMxdMEe35ePoCnEd3HiQBTEShLPjnjuTU3aGNxf62Nvol1v3W1svmAc0kQ/C8IKEE
         qZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313633; x=1754918433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uNMJX530UJ5/FMBVTRpdxGyIh+Z1Pm9NrQtCU29omM=;
        b=RAgxqc3opv4mEbUtKYJooSIXR339Ngg8LonbI3eWBGH9kX5j/kVectwRH/8OtbdAtP
         RqwPsBPxYWd0UjPZA8nVCfV0QtSEr22XrXM3sOrxNDu8p2egxaoj4pldtve+HgoMAx13
         GeygasFZnUvDD3v+ZLaQgWoZOUTlCmuNP2nR5Eo8cfh5hu3QaRevsCxN8KFFtq9Gz7QJ
         KZzduFUbY8enb1wA2MA+oBm74iDiF9KkegCsr+Bzhfm6Y9MSb0NTBwpd+v7GhCxdO84g
         8ZEgeZDXPdHXt8wEBRMEMPoEIDj3XhoX78iB8njhcb6qZfZ4hh1lNQsTYHee+ohqXuVJ
         E0+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqv6Cm1kZbRP+8pgGPbjAvFIg/ezxKf9AI3i9l5ksyYV0GrZQ4VUu+/RngvsacQ3cVrW5CbS1mnPlTAlvuiPS5@lists.infradead.org
X-Gm-Message-State: AOJu0YxzJXT4Q6s1aS0capufYAWArAvgR3G8fCzoBuCKpxIPBFGjMndt
	Pqwc1vxBX1mmkhFy4STWmmfWjuibzcnnOf1wvM/ghMvzHDGlx/MTX5gVsNorrpej7PTD5BKZ8IJ
	1vYTujQvRPs/i83z+ZONr7OTxoADAWXI=
X-Gm-Gg: ASbGncvG259EiKtEm9BSl+nXAdQvXsfpelLHF2OtvhMExKfE1NPUQRZdHdygj/H68Pz
	Wxy43JAbMo5EkRGXwCuKDLgDacir92QfIvNgmbTsBtsdPEhqz6uOafhZHfXEijoFn/kb/AHg1sL
	oaPLrQRJaBi85NDBWETng/KDO1O+9F6cI7AVJg2rSHJ+R0HhSetR2BKhznvNRaY7JRIe3G7Hlma
	AmzXkcYpg==
X-Google-Smtp-Source: AGHT+IH55Yo1BgDPedqMf76upD4RRZOwqu/nbofA0uIoYKNZwi6dqXWIkk5A1EpmC7x7m7FwcTy17me/S9RW0g81Zc8=
X-Received: by 2002:a17:907:9812:b0:af6:3194:f024 with SMTP id
 a640c23a62f3a-af940081981mr890827266b.13.1754313632780; Mon, 04 Aug 2025
 06:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250804100219.63325-1-varshini.rajendran@microchip.com> <20250804100219.63325-10-varshini.rajendran@microchip.com>
In-Reply-To: <20250804100219.63325-10-varshini.rajendran@microchip.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Aug 2025 15:19:55 +0200
X-Gm-Features: Ac12FXyVSAOQ2aISM_03IMhcULkAAa8cSQa55tHeNKnPhc_HQaN3w3aON3y7Tjs
Message-ID: <CAHp75VddM_4efeC_YpTya81DrSzdo2AQKJEQ4z21KiCT3gt0TQ@mail.gmail.com>
Subject: Re: [PATCH 09/15] iio: adc: at91-sama5d2_adc: adapt the driver for sama7d65
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, srini@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_062034_472539_23ECC1E3 
X-CRM114-Status: GOOD (  18.86  )
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

On Mon, Aug 4, 2025 at 12:03=E2=80=AFPM Varshini Rajendran
<varshini.rajendran@microchip.com> wrote:
>
> Add support to sama7d65 ADC. The differences are highlighted with the
> compatible. The init and parsing of the temperature sensor and
> calibration indexes are the main differences.

...

> +static int at91_sama7d65_adc_temp_sensor_init(struct at91_adc_state *st,
> +                                             struct device *dev);

Again, please try to avoid forward declarations. They make code harder
to maintain.

...

> +enum at91_sama7d65_adc_ts_clb_idx {
> +       AT91_SAMA7D65_ADC_TS_CLB_IDX_P1 =3D 2,
> +       AT91_SAMA7D65_ADC_TS_CLB_IDX_P4 =3D 1,
> +       AT91_SAMA7D65_ADC_TS_CLB_IDX_P6 =3D 4,
> +       AT91_SAMA7D65_ADC_TS_CLB_IDX_MAX =3D 10,

MAX and trailing comma are odd when they go together.

> +};

...

> +static const struct at91_adc_platform sama7d65_platform =3D {
> +       .layout =3D &sama7g5_layout,
> +       .adc_channels =3D &at91_sama7g5_adc_channels,
> +#define AT91_SAMA7D65_SINGLE_CHAN_CNT  16
> +#define AT91_SAMA7D65_DIFF_CHAN_CNT    8
> +#define AT91_SAMA7D65_TEMP_CHAN_CNT    1
> +       .nr_channels =3D AT91_SAMA7D65_SINGLE_CHAN_CNT +
> +                      AT91_SAMA7D65_DIFF_CHAN_CNT +
> +                      AT91_SAMA7D65_TEMP_CHAN_CNT,
> +#define AT91_SAMA7D65_MAX_CHAN_IDX     (AT91_SAMA7D65_SINGLE_CHAN_CNT + =
\
> +                                       AT91_SAMA7D65_DIFF_CHAN_CNT + \
> +                                       AT91_SAMA7D65_TEMP_CHAN_CNT)
> +       .max_channels =3D ARRAY_SIZE(at91_sama7g5_adc_channels),
> +       .max_index =3D AT91_SAMA7D65_MAX_CHAN_IDX,
> +#define AT91_SAMA7G5_HW_TRIG_CNT       3
> +       .hw_trig_cnt =3D AT91_SAMA7G5_HW_TRIG_CNT,
> +       .osr_mask =3D GENMASK(18, 16),
> +       .oversampling_avail =3D { 1, 4, 16, 64, 256, },
> +       .oversampling_avail_no =3D 5,
> +       .chan_realbits =3D 16,
> +       .temp_sensor =3D true,
> +       .temp_chan =3D AT91_SAMA7G5_ADC_TEMP_CHANNEL,
> +       .temp_init =3D at91_sama7d65_adc_temp_sensor_init,
> +};

It's harder to read the static assignment interleaved by the sparse
definitions. Can't you group definitions followed by the initialiser?

...

> +static int at91_sama7d65_adc_temp_sensor_init(struct at91_adc_state *st,
> +                                             struct device *dev)
> +{
> +       struct at91_adc_temp_sensor_clb *clb =3D &st->soc_info.temp_senso=
r_clb;
> +       struct nvmem_cell *temp_calib;
> +       u32 *buf =3D NULL;

What for this NULL initialiser?

> +       size_t len;
> +       int ret =3D 0;

This initialisation can be avoided (see below how).

> +       if (!st->soc_info.platform->temp_sensor)
> +               return 0;
> +
> +       /* Get the calibration data from NVMEM. */
> +       temp_calib =3D devm_nvmem_cell_get(dev, "temperature_calib");
> +       if (IS_ERR(temp_calib)) {
> +               ret =3D PTR_ERR(temp_calib);
> +               if (ret !=3D -ENOENT)
> +                       dev_err(dev, "Failed to get temperature_calib cel=
l!\n");
> +               return ret;
> +       }
> +
> +       buf =3D nvmem_cell_read(temp_calib, &len);
> +       if (IS_ERR(buf)) {
> +               dev_err(dev, "Failed to read calibration data!\n");
> +               return PTR_ERR(buf);
> +       }

...

> +       /*
> +        * We prepare here the conversion to milli from micro to avoid

Here we prepare the...

> +        * doing it on hotpath.
> +        */

...

> +free_buf:
> +       kfree(buf);
> +       return ret;

Can't use cleanup.h? I.e. __free().

--=20
With Best Regards,
Andy Shevchenko

