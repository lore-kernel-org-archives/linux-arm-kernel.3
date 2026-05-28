Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3838CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 09:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jWHKJMDDQO/AD2C8e59urtbYtaRKLnOjHNYulCSOOs=; b=jd35ppiNRHSLB51FNAhl4NrThK
	CICwQkJNqvlHUkGNOL8YcLQdwquCTzdpvb/EIrnw0E6ZLkxz1chhRbD6xwhG+AYSdsz9ffdEFGWYw
	DTxmeeu0VXO235K+PjlDl9semfvXeFIFlVaIF49MHrDx5pmpoAHUbjPQc2M+tkm3izkmEOdYRsOQo
	aDXKsdYcjOEh7H+Lz0ieNfDHNzhlzAIyiI8EuJFs3EfbAPzVg2Mxr4pbR3NflVoAnaowvhr3t84hG
	SYVGU9UbM60ELjrUyRFAqpfMPekL4PGb7TPUtRzuTuPOdMp2ltUR4sNOYKf/7khkgrXCT1zJNhjZ0
	+21CryxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWdE-00000005SUZ-16hi;
	Thu, 28 May 2026 09:02:24 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWdB-00000005STE-28p0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 09:02:23 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a40502e63bso12645775e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 02:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779958939; cv=none;
        d=google.com; s=arc-20240605;
        b=hVoY9zOADuEN4d3/Eb7gTbF/GVkNsC2Ou2UAoSx7AfcaTezbLqE1XYA3fbwtB+nsqj
         IlktJurQ9M14yuFGjskXGz43PHwbaRHJYaLpMZv53y8bSVVd8m61kxhimuWVMIanVt5O
         jK39Wpwcinr74zMhrnRsM7nnd2YqBPOaK6z9C3xsT8prlcshgYgehrCTrjaLhoQgneSh
         IElVcixuR9EfyuAUijNDpeqEYtiqEC0t/KzukBDi5FbU5T1WXPCRvy4AHohwcgpNAfaV
         s1toXWb36uXxFKuQKkRMIHD0lhqoG6BXTM3OxdNAQGeWzrzNp84cQdSNzhdZOra3LIRG
         26BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1jWHKJMDDQO/AD2C8e59urtbYtaRKLnOjHNYulCSOOs=;
        fh=YDODCbkgCHOrxytmSsejWDls6w4n58sp+S0ArUoY+ys=;
        b=N6XVpn8HoYBEJbTtkc2kSUJ489ZQO3mI7vkZFvCnlZkwoEtBwcHPGEPIRI4YetSJyf
         e71WL10Q8tKvgL3O3hb+DeM+uMMq1rKXgJsFETDoOmc0egu7LTKtPI6OfDW2MsFoBI9e
         f3+uD545IrC34ftvTIs31CcqaHGkYgsxlTSPRwxGrCmMcWGV5+KDMymJeuXB45T+Fj8L
         6GVvQ7Xic4CYOcYGP4B2xJFDPXGmVKMQXwWuyk2qMFQIG2G+qM9eWiB+rJEtPNugnBKk
         TafSCqvnPaYDMUH+j+f+JuauJhDX29fBwC6nK9O1HL7mfCqJqfqth8/UZ8DOwW3xKqmR
         MfBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779958939; x=1780563739; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1jWHKJMDDQO/AD2C8e59urtbYtaRKLnOjHNYulCSOOs=;
        b=RB4ftD0tYyv6OGoXBhZErdijWanar/4kWeZc/GVjNNIdmnTzbJCHTziLmeLsHjYdzp
         qpl35W+543kVlzEn1aq9ImDAlpLtfTv5A36jz4LU0Wv7jlHAnyLc6ub7wretTfvnBnYY
         GaAjE7+l2iyqOleVkRxV9KRA91NdxaWrcqcUD55+Pu6svxpV/Z5drhO/ZTVfJ/Cmq/GS
         o0EIxwbaFuQsZTYYJJaCdE+sDuEkXTvj8hDA7d1xHycdXhuNj9mpVQZPM2p44df0JdWR
         PzG9LhLXtoZ/izFwpM/VLzfCmzfKGraZ5XfZkh+EL7cWIFyZmOB7ZGpwxf+Fd74trPpA
         UlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958939; x=1780563739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jWHKJMDDQO/AD2C8e59urtbYtaRKLnOjHNYulCSOOs=;
        b=Ruth6Fkiq08YEApUrsuKukHaNLQlZILgg8/Enldx2VQyMRNeYEf3mtQJaDZmS5AlyI
         6pXoDYgx+q3QUj9idtzbSTE3kqxvtUmTl5llNtDimbSCQC33B2DYEZCecsyg0i+FvFdG
         36OG3W41sDHCmjktBf7tHUEX64iMQh+Trnsqon2EKobhRS96hdP85saj7v851s2WYg3I
         bJhlSVhTwf11k7JdAwzSUSb0lrQ7dd9zL+G9EEZOCqGg9x5UmnEEPBHayPWxJ3J91WbU
         XCC10qWoI/iw+1LJC6IRH7u9x15Aj1DxAlglCjpU+XUWAM8knS2ZtDghN1FSrfOXrJI5
         VMxg==
X-Forwarded-Encrypted: i=1; AFNElJ/lWUL8xcoikcThkmDJ9g1CPx0NN0mrNC4qerUjv2n1ecMs3nsRai2WiG/F+FspXA2hAtS1HkkGWNoG3ZeUavzz@lists.infradead.org
X-Gm-Message-State: AOJu0YzYjJNtm5skr1hn2deCfgKvkxSHKYhQihamG7byFiVSIRkDE/mA
	HPJzSVc8C3yuOu64XkZGVdFmnu4lmBV2UEJ+TdmUwpPU0WbubuK7PML+Z2p4LCfgzX7071rihOS
	OkLAb5RviueFemzDlXyparYLCSeBFZRM=
X-Gm-Gg: Acq92OFGpHbFM439zeEhObZ7V5spzST91ZUzPpFzXgVur8PVkG8sy53WqsPBV6xhmxQ
	iIih/ijLJ1Rk3Px3eSR5j8CIfNaHCbbMT/xjq63xiMS6u7b1Lsj+OX0SH7Uym7jdaGJKK92WSOY
	oL5Xlqc6O9A3k2VUjHBm8GQGSgs63gqCliuK3CxeNW0KT8nFfqC7xpx+4hORwJtIhLsu36SZJFs
	C9nTuxOhJ03/MPc4906TQaKTYKCWwe25IFny4gCngOV4qhV2hWnq3ZixlhLLQTYVGTBlJCcrjml
	+K36dJKDsv0A4onI6vKJUQMiTqn12CXx2/URqK4YQLn503kj1C/iQanaPAhJtrDaDPJaWRl8Oko
	JEK2KDX+EJ7UZ10lORtdEhEr7X09ecfvLIPhwzYqpebsc1hJo9wtpjLZErFOwKXT6nw6Ehz1D00
	OzTaCryPXznFOUXeSZC9YQ+ZPOptw=
X-Received: by 2002:a05:6512:1244:b0:5a8:63e0:971b with SMTP id
 2adb3069b0e04-5aa323a9bc6mr7945935e87.35.1779958938073; Thu, 28 May 2026
 02:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
 <20260528-axiado-ax3000-ax3005-saradc-v1-2-345dd5f6608a@axiado.com>
In-Reply-To: <20260528-axiado-ax3000-ax3005-saradc-v1-2-345dd5f6608a@axiado.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 28 May 2026 11:02:05 +0200
X-Gm-Features: AVHnY4I2L8jUROgryJNYEp7XvVDoqkCQpW4rzktdx5-T3JCp_JJeNfOp0KVoQ8I
Message-ID: <CALoEA-yfqYky=Un0r5K8QBc_H8DVziuiKuLap7ArAQOmaLKnZw@mail.gmail.com>
Subject: Re: [PATCH 2/3] iio: adc: add Axiado SARADC driver
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_020221_622254_878FF7A5 
X-CRM114-Status: GOOD (  33.14  )
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

On Thu, 28 May 2026 at 10:11, Petar Stepanovic <pstepanovic@axiado.com> wrote:
>
> Add support for the SARADC controller found on Axiado AX3000 and
> AX3005 SoCs.
>
> The driver supports single-shot voltage reads through the IIO
> subsystem. The number of available input channels is selected from
> the SoC match data, allowing AX3000 and AX3005 variants to use the
> same driver.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---

Hi Petar, a few comments inline. Additionally, Sashiko came back
with a few issues:
https://sashiko.dev/#/patchset/20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a%40axiado.com.

> +++ b/drivers/iio/adc/axiado_saradc.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021-2026 Axiado Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/iio/iio.h>

IIO specific headers should follow the generic <linux/*> headers and
be grouped separately.

> +#include <linux/io.h>
> +#include <linux/kernel.h>

Don't use kernel.h when adding a new driver. The existing drivers in IIO
are currently being moved away from kernel.h, as it is a catch-all header.
You should include what you use manually (there is a tool for this, it's
called iwyu-tool).

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +
> +/* Register offsets */
> +#define AX_SARADC_GLOBAL_CTRL 0x0004
> +#define AX_SARADC_MANUAL_CTRL 0x0008
> +#define AX_SARADC_DOUT 0x001C
> +
> +/* GLOBAL_CTRL fields */
> +#define AX_SARADC_CH_EN_MASK GENMASK(31, 16)
> +#define AX_SARADC_SAMPLE_MASK GENMASK(6, 5)
> +#define AX_SARADC_MODE_MASK GENMASK(4, 3)
> +#define AX_SARADC_PD BIT(2)
> +#define AX_SARADC_ENABLE BIT(0)
> +
> +/* GLOBAL_CTRL values */
> +#define AX_SARADC_SAMPLE_16 FIELD_PREP(AX_SARADC_SAMPLE_MASK, 0)
> +#define AX_SARADC_MODE FIELD_PREP(AX_SARADC_MODE_MASK, 1)
> +
> +#define AX_SARADC_MANUAL_CTRL_EN(n) (BIT(0) | ((n) << 1))
> +#define AX_RESOLUTION_BITS 10
> +#define AX_SARADC_CONV_CYCLES 13
> +
> +struct axiado_saradc {
> +       void __iomem *regs;
> +       struct clk *clk;
> +       unsigned long clk_rate;
> +       int vref_uv;
> +       struct mutex lock; /* Serializes ADC conversions. */
> +};
> +
> +static int axiado_saradc_conversion(struct axiado_saradc *info,
> +                                   struct iio_chan_spec const *chan, int *val)
> +{
> +       unsigned long usecs;
> +       /* Select the channel to be used and trigger conversion */
> +       iowrite32(AX_SARADC_MANUAL_CTRL_EN(chan->channel),
> +                 info->regs + AX_SARADC_MANUAL_CTRL);
> +
> +       /* Hardware requires 13 conversion cycles at clk_rate */
> +       usecs = DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * 1000000, info->clk_rate);
> +       usleep_range(usecs, usecs + 10);

fsleep() is preferred over usleep_range(), it selects the optimal
sleep function while guaranteeing a sleep of at least usecs time.

> +
> +       *val = ioread32(info->regs + AX_SARADC_DOUT) &
> +              GENMASK(AX_RESOLUTION_BITS - 1, 0);
> +
> +       /* Stop manual conversion */
> +       iowrite32(0, info->regs + AX_SARADC_MANUAL_CTRL);
> +       return 0;
> +}
> +
> +static int axiado_saradc_read_raw(struct iio_dev *indio_dev,
> +                                 struct iio_chan_spec const *chan, int *val,

Small nit, but I'd move int * val onto the line along with val2 and mask
so it's logically separated.

> +                                 int *val2, long mask)
> +{
> +       struct axiado_saradc *info = iio_priv(indio_dev);
> +       int ret;
> +
> +       switch (mask) {
> +       case IIO_CHAN_INFO_RAW:
> +               mutex_lock(&info->lock);

I wanted to recommend using the guard(mutex) macro, but you're
only using a mutex once, so up to you.

> +               ret = axiado_saradc_conversion(info, chan, val);
> +               mutex_unlock(&info->lock);
> +               return ret ? ret : IIO_VAL_INT;
> +       case IIO_CHAN_INFO_SCALE:
> +               *val = info->vref_uv / 1000;
> +               *val2 = AX_RESOLUTION_BITS;
> +               return IIO_VAL_FRACTIONAL_LOG2;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static const struct iio_info axiado_saradc_iio_info = {
> +       .read_raw = axiado_saradc_read_raw,
> +};
> +
> +struct axiado_saradc_soc_data {
> +       unsigned int num_channels;
> +};
> +
> +static const struct axiado_saradc_soc_data ax3000_saradc_data = {
> +       .num_channels = 16,
> +};
> +
> +static const struct axiado_saradc_soc_data ax3005_saradc_data = {
> +       .num_channels = 8,
> +};
> +
> +#define AX_SARADC_CH(_index, _id)                                       \
> +       {                                                               \
> +               .type = IIO_VOLTAGE, .indexed = 1, .channel = (_index), \
> +               .info_mask_separate = BIT(IIO_CHAN_INFO_RAW),           \
> +               .info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),   \
> +               .datasheet_name = (_id), .scan_index = -1,              \
> +               .scan_type = {                                          \
> +                       .sign = 'u',                                    \
> +                       .realbits = AX_RESOLUTION_BITS,                 \
> +                       .storagebits = 16,                              \
> +                       .endianness = IIO_CPU,                          \
> +               },                                                      \
> +       }
> +
> +static const struct iio_chan_spec axiado_saradc_iio_channels[] = {
> +       AX_SARADC_CH(0, "adc0"),   AX_SARADC_CH(1, "adc1"),
> +       AX_SARADC_CH(2, "adc2"),   AX_SARADC_CH(3, "adc3"),
> +       AX_SARADC_CH(4, "adc4"),   AX_SARADC_CH(5, "adc5"),
> +       AX_SARADC_CH(6, "adc6"),   AX_SARADC_CH(7, "adc7"),
> +       AX_SARADC_CH(8, "adc8"),   AX_SARADC_CH(9, "adc9"),
> +       AX_SARADC_CH(10, "adc10"), AX_SARADC_CH(11, "adc11"),
> +       AX_SARADC_CH(12, "adc12"), AX_SARADC_CH(13, "adc13"),
> +       AX_SARADC_CH(14, "adc14"), AX_SARADC_CH(15, "adc15"),
> +};
> +
> +static int axiado_saradc_probe(struct platform_device *pdev)
> +{
> +       struct axiado_saradc *info;
> +       const struct axiado_saradc_soc_data *soc_data;

Use reverse christmas tree order.

> +       struct iio_dev *indio_dev;
> +       int ret;
> +       u32 reg;

Reg isn't a really good name, regval would be better.

> +
> +       indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
> +       if (!indio_dev)
> +               return -ENOMEM;
> +
> +       info = iio_priv(indio_dev);
> +
> +       info->regs = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(info->regs))
> +               return PTR_ERR(info->regs);
> +
> +       info->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +       if (IS_ERR(info->clk))
> +               return PTR_ERR(info->clk);
> +
> +       info->clk_rate = clk_get_rate(info->clk);
> +       if (!info->clk_rate)
> +               return dev_err_probe(&pdev->dev, -EINVAL,
> +                                    "invalid clock rate\n");
> +
> +       info->vref_uv = devm_regulator_get_enable_read_voltage(&pdev->dev,
> +                                                              "vref");
> +       if (info->vref_uv < 0)
> +               return dev_err_probe(&pdev->dev, info->vref_uv,
> +                                    "failed to get vref voltage\n");
> +
> +       soc_data = device_get_match_data(&pdev->dev);
> +       if (!soc_data)
> +               return dev_err_probe(&pdev->dev, -EINVAL,
> +                                    "failed to get match data\n");
> +
> +       mutex_init(&info->lock);

Use devm_mutex_init since everything else is devm.

> +       reg = FIELD_PREP(AX_SARADC_CH_EN_MASK,
> +                        GENMASK(soc_data->num_channels - 1, 0)) |
> +             AX_SARADC_SAMPLE_16 | AX_SARADC_MODE | AX_SARADC_ENABLE;
> +
> +       iowrite32(AX_SARADC_PD, info->regs + AX_SARADC_GLOBAL_CTRL);

Sashiko notes to add a small delay here to prevent a zero width pulse.

> +       iowrite32(reg, info->regs + AX_SARADC_GLOBAL_CTRL);
> +       indio_dev->name = dev_name(&pdev->dev);

Hmm, Sashiko may have a point here, this could break the ABI.
The name member is usually assigned a hardcoded string and
it shouldn't contain whitespace, dots or dashes, which dev_name()
could return.

> +       indio_dev->dev.parent = &pdev->dev;
> +       indio_dev->info = &axiado_saradc_iio_info;
> +       indio_dev->modes = INDIO_DIRECT_MODE;
> +       indio_dev->channels = axiado_saradc_iio_channels;
> +       indio_dev->num_channels = soc_data->num_channels;
> +
> +       ret = devm_iio_device_register(&pdev->dev, indio_dev);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "failed to register IIO device\n");

You can just do `return devm_iio_device_register`.

> +       return 0;
> +}
> +

I don't see any kind of cleanup procedure, like a remove() function
or devm_add_action_or_reset callback, is this intentional?

> +static const struct of_device_id axiado_saradc_match[] = {
> +       {
> +               .compatible = "axiado,ax3000-saradc",
> +               .data = &ax3000_saradc_data,
> +       },
> +       {
> +               .compatible = "axiado,ax3005-saradc",
> +               .data = &ax3005_saradc_data,
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, axiado_saradc_match);
> +
> +static struct platform_driver axiado_saradc_driver = {
> +       .driver = {
> +               .name = KBUILD_MODNAME,
> +               .of_match_table = axiado_saradc_match,
> +       },
> +       .probe = axiado_saradc_probe,
> +};
> +
> +module_platform_driver(axiado_saradc_driver);
> +
> +MODULE_AUTHOR("AXIADO CORPORATION");
> +MODULE_DESCRIPTION("AXIADO SARADC driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>

-- 
Kind regards

CJD

