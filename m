Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961E2CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=; b=KWgO3P/qRGIisX1wGYLi4SxSCc
	6sxCLn7qPaQwqPnWIEykJgzSx0EqxNLylqZyntFZLZUevTXHjW2OECRhc0MVlZm+AyMZtvH87PBrD
	+in6dUmq6F1PkvEXfdYLNTOLypUIsA10PSnHmsFGt4WlpfkMyj+Q42EwN9Ox7u28pn5uzkPI/3o9w
	n1BHijm/SxgBQ1lcvG1QfBDT7nhHZen/X5N+OZZT4uydOf2MUrXvGJk/iG13+3U/IC6MN3bnelw6L
	Jepx9qeJJ/ITK2F1xJsYkrsZdX85PrGv96aWU4J5VznEg6nxED3upjc+V+/CEeL+uWp+2b/LP1ErJ
	sCzsc7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhBR-0000000FrbD-13OD;
	Tue, 12 May 2026 07:05:37 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhBP-0000000FraC-2zx6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:05:36 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-bccb9dca1beso450720266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778569534; cv=none;
        d=google.com; s=arc-20240605;
        b=BPk/1ETylxuGBk8akQfc0sV05eDSmsl22bZRKyPjXDBxJLIt0rHBgg4RETquQhnRss
         dKad68iVSQXwLlJVERCszAGkAS1LCFz0GKA99caPcoSXfM3f/CmMGVNYSQ1vmTGek/+K
         Tddju/klXzu75trasrrzaRbYWY8czGbSHMcb/Eh/LWGQzw7is2/HwSQuWDKOtq5jxS/T
         4z4dljn0v5y8fdxM1Ggel8Ub3v/ISz0dySjd1eIC5ozYZuK/+iprLgLWWdepF5Scz/Cr
         bB8NsMeVwoJTE6xnFQ6cKeBO3I2B+c6clucw9rOqtg5EVhJaZy899vIsFyYpYYqR+jwI
         03BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=;
        fh=vaa9tDAT/rxHsFkWAf+skdCQD4QOOMoS8NlWGz9K3hg=;
        b=Qgn9M21y4dZmJRbKm8uahedDrQp7MJtH2jWpQtuHHF2UK0AEwcjRoWoBQreEWC6xNc
         QhbHn6EmJBsjHhX8DUZtnaA+gGa6HjcQYtppSd96H3ivH52e9S2Em6fDuD2mdPpR65PN
         gnqjr/o/K167YZ+YuShzPQW5MTDDLE3REckkWdTNk5L7EPDdIBGiz26Cz0KycTcCXAdq
         coJInr6aRfoDGlxSqEtpGRQrm0M0ansoHDa0A/FiYk6bHegLGGZFyc1pyZtonAfyhq6j
         6A+6BAaYs678KpNljsG5oQjeW7DTxnZHiCFA9AqsLOMxDDD94N78rq/QzVS+8hu2KVlc
         OQzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569534; x=1779174334; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=;
        b=cxcWpcKfOam/qotsbBcthus5xrmwfz3joZZ33auL76zr8Ke+IO5mAXCfQ6hS3wSQIX
         eTEWdHg3vDxjqvKziFNaLUuhT/ueGEe4j6tN/A/C8aZL5AqqvLfpGsGobHcDfj6rsktE
         /oKfRUwrqCWlDUa7FK+PbBUAeqP361CYuvGQVYqwndB5iXJ6BPAHXvPAklhuuX3/bZEt
         sp4HlKrCb85BVYDDmrVJkDBPPoiPyhCmP97Ihn2mYT6w1kEreC9QMlSeYxB1oLsqyAsP
         FlEGDlv0WBM9FwnJgYIOA8VIT1bU7wyUpjYOxmp1h6yHEEgaLJOQbapkayDncACNLr80
         DLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569534; x=1779174334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=;
        b=S6FQB2uAgagfb77d5oOOUZtGUvOXRu17rnRR30GvhUbznMSkjknV8uGYBqO3oHEPEA
         8FZDz3qvi1m0Se0Du9UUIxOeE8dIReq2CTgV+t7s1qNHgXlgJoOKnxKm4BD09jiqU0Iw
         nW+fuAucKsloUM2S3rqgxTD5y+5Gsel8uK1hSYmkV4n61YfKHHmYpp2I3j536PH3uNgE
         AZ1dV04wWdzh/ZZOTna8qwCeVpVPgGANnVa2M0tl4qOjegX8dENVGnLO0Fs4q7yHJixM
         PV+VJIcMx9kv4CFYp0/uIYxEayeSu+7mLgJqLeAPa+e0lIgylw30qK3L7GWIQMmYf0Ln
         /DmA==
X-Forwarded-Encrypted: i=1; AFNElJ/CmxvCoC+5NEb7uo2LT3DwX2KxJnUIeNAO02sMcVZoJP+IBbTp9sBvFOeZcwW1BWUxrtQo/JwjJ4Zx7xDMKGN/@lists.infradead.org
X-Gm-Message-State: AOJu0YywIOZ6MmqLzVpGTGxc5uSzTclTr7JuSpnrVrbhvPYkxWjkGOYq
	kdcWByQVL9TxyFsbXgKh8ycsOD61jNxvgnJ8+4HNbThlSyelOrsw9ksVlubHxp02QOf8SWbPSo2
	CrZhHjHk/fqT55SXnblVrvE+Ahs4ms/Y=
X-Gm-Gg: Acq92OGUOSc6Jf10+eIncdh5oKrizE7+U1wWPG8woBfJkzyheCx1gGmHuRBtBzwsJQ/
	M0rr0VznBfUPWJdGVasft5ue435ddnCgGthMhU7sozp1aOEGMlfpsKoQSf3jJJosxIAa28wGkw5
	WhUwv3DUChaDSmauVDpf7YVjQSEIKLNKApLg/GcEYXH/vTT1JVaqxv9X/bCJPed/d1l1wKDy9n/
	s8733OOFCezWlYiAVBu5CNS3ENU0FzQ2MzBurNec08w0EJgiKI/8mtifB/kcsMYZhUVYqhxsYi3
	onNdVx/9MoArHWkqF2A5wqe5knfBFLh+cdCrZ0njtbxYBMLCkj9bhQ1feTEvJGORZZS4aiff0uv
	zqxkN4JA=
X-Received: by 2002:a17:907:8b87:b0:bcd:2dbd:8241 with SMTP id
 a640c23a62f3a-bcd2dbd8f82mr647649566b.5.1778569533677; Tue, 12 May 2026
 00:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-7-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-7-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 10:04:56 +0300
X-Gm-Features: AVHnY4Ir9Mq_UQabCQBoJYVIwG-u_PpfuUXY4u_xRVfJJhNKJhDnleR-UqRVa9w
Message-ID: <CAHp75VfgrbEDLavMKFp2maFCH08RBUxF2wYhh56GG1HCq4ogmA@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] thermal: mediatek: add PMIC thermal support
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
X-CRM114-CacheID: sfid-20260512_000535_782584_9AB37026 
X-CRM114-Status: GOOD (  23.33  )
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
> Add a new driver to support thermal monitoring on MediaTek PMICs.
>
> The driver retrieves calibration data from EFUSE, calculates the
> temperature using a linear interpolation, and registers the device with
> the thermal framework.
>
> Initial support is added for the mt6323 PMIC.

...

+ array_size.h

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/err.h>
> +#include <linux/iio/consumer.h>

> +#include <linux/kernel.h>

No way the driver(s) nowadays use this header. Please, drop it and add
the ones that are really in use (there are missing ones).

> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>

> +#include <linux/slab.h>

Is it used?

> +#include <linux/thermal.h>

Missing types.h

> +#include <linux/units.h>

...

> +#define MT6323_ADC_VOLTAGE_RANGE       1800
> +#define MT6323_ADC_RESOLUTION          32768

These two ring a bell with the first code patch. Are they the same?
Can they be deduplicated?

...

> +       ret =3D iio_read_channel_processed(sensor->adc_channel, &raw);
> +       if (ret < 0) {

Do we need that ' < 0' part? What is the meaning of positive returned
value (if any) and why do we ignore that? Same question to all similar
checks in the whole series.

> +               dev_err(sensor->mt->dev, "failed to read iio channel: %d\=
n",
> +                       ret);
> +               return ret;
> +       }

...

> +       /*
> +        * Temperature coefficient. The o_slope is a trim value applied t=
o
> +        * the base calibration

Respect English grammar and punctuation. Here is the period missing.

> +        */

...

> +static int mtk_pmic_thermal_extract_efuse_mt6323(struct mtk_pmic_thermal=
 *mt,
> +                                                u16 *buf)
> +{
> +       u32 reg;
> +       s32 vts, degc_cali, o_slope, o_slope_sign, id;
> +       int ret;

Better to keep reversed xmas tree order.

> +       return 0;
> +}

...

> +static int mtk_pmic_thermal_get_calib_data(struct device *dev,
> +                                          struct mtk_pmic_thermal *mt)
> +{

> +       void *buf __free(kfree) =3D NULL;

This is a discouraged way of defining variables with __free(). See below.

> +       struct nvmem_cell *cell;
> +       size_t len;
> +       int ret;
> +
> +       cell =3D nvmem_cell_get(dev, NULL);
> +       if (IS_ERR(cell))
> +               return PTR_ERR(cell);

> +       buf =3D nvmem_cell_read(cell, &len);

Should be rather here

       void *buf __free(kfree) =3D nvmem_cell_read(cell, &len);

> +       nvmem_cell_put(cell);
> +
> +       if (IS_ERR(buf)) {
> +               ret =3D PTR_ERR(buf);
> +               buf =3D NULL;
> +               return ret;
> +       }
> +
> +       if (len < 2 * sizeof(u16)) {
> +               dev_err(dev, "invalid calibration data length\n");
> +               return -EINVAL;

return dev_err_probe(...);

> +       }
> +
> +       ret =3D mt->data->extract_efuse(mt, buf);
> +       if (ret) {
> +               dev_info(dev, "device not calibrated, using default value=
s\n");
> +               mt->data->precalc(mt, MT6323_DEFAULT_VTS,
> +                                 MT6323_DEFAULT_DEGC_CALI,
> +                                 MT6323_DEFAULT_SLOPE,
> +                                 MT6323_DEFAULT_SLOPE_SIGN);
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_pmic_thermal_init_sensor(struct mtk_pmic_thermal *mt, int=
 id)
> +{
> +       struct mtk_pmic_sensor *sensor =3D &mt->sensors[id];
> +       struct device *dev =3D mt->dev;
> +
> +       sensor->id =3D id;
> +       sensor->mt =3D mt;
> +
> +       if (mt->data->num_sensors > 1)
> +               sensor->adc_channel =3D devm_iio_channel_get(dev, mt->dat=
a->sensors[id]);
> +       else
> +               sensor->adc_channel =3D devm_iio_channel_get(dev, NULL);

> +

Unneeded blank line as the above and below are coupled semantically.

> +       if (IS_ERR(sensor->adc_channel))
> +               return dev_err_probe(dev, PTR_ERR(sensor->adc_channel),
> +                                    "failed to get channel %s\n",
> +                                    mt->data->sensors[id]);
> +
> +       sensor->tzdev =3D devm_thermal_of_zone_register(dev, id, sensor,
> +                                                     &mtk_pmic_thermal_o=
ps);
> +       if (IS_ERR(sensor->tzdev))
> +               return dev_err_probe(dev, PTR_ERR(sensor->tzdev),
> +                                    "failed to register thermal zone %d\=
n", id);
> +
> +       return 0;
> +}

...

> +static const struct of_device_id mtk_pmic_thermal_of_match[] =3D {
> +       { .compatible =3D "mediatek,mt6323-thermal",
> +         .data =3D &mt6323_thermal_data },
> +       { /* sentinel */ },

No comma for the terminator entry.

> +};

--=20
With Best Regards,
Andy Shevchenko

