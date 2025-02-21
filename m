Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00E4C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0r6iIPJ09XHFsPRsV0r11bvmeugmZ8633Hc5QQfZDM=; b=Dg8vohmS9bTra2bWKipWJarcaU
	LTIrz0RR1AWAhUCgpezHrEW+lEp5ugV9oA7hUNHlyfGCaPBvhhPtSx1x2p6oRDlpxYD6rDR8dV/3S
	GoVaKHHYgrjcQP0bUg7KpOkj2/eKVJFHHfAwu39FIpY/x2by6prS/y39KuI3hzJbTJ9CUFm3IXlx5
	62jKxYcOSVPqiSVA0owDXz6gQ0USYfGmHp2C4uiF367R6ALTmlU5zvQfOajDtmstS8nBBnZwPWvCQ
	xHca6kXh3rV0qndBOVP2JEQqbmGVIrqsyfbRVC/pV8CwNDATfQzk7Q76jIBqQgZeMuWRPtlldzGYI
	lxwV1ZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXi4-00000006WEJ-1xpE;
	Fri, 21 Feb 2025 18:25:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXTx-00000006TiP-0HTb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:10:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43996e95114so16199985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 10:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740161435; x=1740766235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0r6iIPJ09XHFsPRsV0r11bvmeugmZ8633Hc5QQfZDM=;
        b=dp6uzlvpFcq25jpvRJw9b/6WaY5ZeTPhN1H73T8UxSla4aT4mFuBjnzj5UTDx6+B8/
         qnsEe/ek+E/beL1WfuFtpQToGzhn1TD4iIoVZYXhocGADpcmqkRwF0csfC1LqMfiMb5r
         ymM9HBOEtj6+R6R+ccH/nXnD1cvJRflQgSsSGQUc+PLdLlzjle5t6pgh7UU6aiq1hLwL
         DqOKPg071ul1mifDBBGMCa846CnI6Q9V3BuvIc9gPNWzJ3saj6HXDYYq81WAu75z6iyc
         scXyKboIlJgVC5uvWuI18EO/MrZd4fHqyBw/ZPmwqNHlyRqnWUiREZ58NW8F71neb3oz
         Pe0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740161435; x=1740766235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0r6iIPJ09XHFsPRsV0r11bvmeugmZ8633Hc5QQfZDM=;
        b=lkYVWCwZHi7p6P3ioW+3pouzq19dcRweAV0RLNymptAu+QuJ/pfCp4d2PSS+ApFnw+
         evJg1E+MdDnTywjs16iojkp6mHEJw6pCZaBbV6Bgek93i+WN8SqpQE+JGmQAJDOdmDzX
         V49cMsFEr8W5mo+RhuCAH/1W2+1WEMKqshsVRtwcP58pMgm81WHVVv14jflcqhUJUF5w
         qDu7d5Ll5tnnN7jO8+1kvicsxXb5dpIlJP53Hygr9rCBnL4iHwzX2hSAHlZ7FvaBx4PQ
         x4/EHxZ3QPS43lWwfBclmYLOvMUrYRTqFfGZwvYhIDq3Ng2FAfB5CDFYsXXlq3r1dv4P
         BFqw==
X-Forwarded-Encrypted: i=1; AJvYcCUaU6PTh/B92QG5rBHQw1FRMtBx/CXhpOolodz0fT9Qkth1vQuE0ZKLx1FvyzsNf/xa7fTKlpbb1xXgNCrjV2/O@lists.infradead.org
X-Gm-Message-State: AOJu0YwfuA81qdZsEfHM54td/rINPNnFdk5chak055xX4qmsUnyCyNC6
	0BTGIVAaPKBLBZ3EOonekdKf8jXfX4/L+NaIK4O0sVDjxnABztdW
X-Gm-Gg: ASbGnct7UHRCIO2D0UaxgAXAi3quqtU6DJgnBZsQPD5ALyNEWEik/N2aeLQVvLexgs0
	z6ETGow9/RS7/cX2fVn4fOUFd2m4LP33ArUIpvIyQB+iqYMYi8X7P2yY6DN9uM/iYg5Rgi/1nRM
	SIhMW0Wz8yvC/H0IhFq3Zuw9HxqFH84fwtVK/mCUpGX+yUUw6kGRQtLUyvAQyPDkt4KJVyrdlc1
	UtUOq9oNraG30XsuMHck5lwIoMCSlk5pqpbTe4NsSL2qyUlQWGdb55N0L+Nkbujx/wP968iZFIf
	UVuz/TFuy2pxsLpvdAyvgku02VNPuIFjUBxMnc5aamVcUY4UBiq5xUrHKuMlWwtjl8SkLTWsOJa
	FZw==
X-Google-Smtp-Source: AGHT+IExFiU5Xc+fGk11eNldRJ1AiPN0u+agLLJYUKrZV6ShEZz487T/k3atzV3etCUhpG4ayKUuWw==
X-Received: by 2002:a05:600c:1906:b0:439:9c0e:3709 with SMTP id 5b1f17b1804b1-439aeafab74mr29474155e9.8.1740161434935;
        Fri, 21 Feb 2025 10:10:34 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02d684dsm24494145e9.16.2025.02.21.10.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:10:34 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/5] pmdomain: sunxi: add H6 PRCM PPU driver
Date: Fri, 21 Feb 2025 19:10:33 +0100
Message-ID: <4987742.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250221005802.11001-3-andre.przywara@arm.com>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_101037_113589_8E44985F 
X-CRM114-Status: GOOD (  37.62  )
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

Dne petek, 21. februar 2025 ob 01:57:59 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner Power Reset Clock Management (RPCM) block contains a few
> bits that control some power domains. The most prominent one is the one
> for the Mali GPU. On the Allwinner H6 this domain is enabled at reset, so
> we didn't care about it so far, but the H616 defaults to it being disable=
d.
>=20
> Add a power domain driver for those bits. Some BSP code snippets and
> some spare documentation describe three bits, slightly different between
> the H6 and H616, so add three power domains for each SoC, connected to
> their compatible string.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pmdomain/sunxi/Kconfig              |  10 +
>  drivers/pmdomain/sunxi/Makefile             |   1 +
>  drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c | 191 ++++++++++++++++++++
>  3 files changed, 202 insertions(+)
>  create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
>=20
> diff --git a/drivers/pmdomain/sunxi/Kconfig b/drivers/pmdomain/sunxi/Kcon=
fig
> index 17781bf8d86d7..43eecb3ea9819 100644
> --- a/drivers/pmdomain/sunxi/Kconfig
> +++ b/drivers/pmdomain/sunxi/Kconfig
> @@ -8,3 +8,13 @@ config SUN20I_PPU
>  	help
>  	  Say y to enable the PPU power domain driver. This saves power
>  	  when certain peripherals, such as the video engine, are idle.
> +
> +config SUN50I_H6_PRCM_PPU
> +	tristate "Allwinner H6 PRCM power domain driver"
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	depends on PM
> +	select PM_GENERIC_DOMAINS
> +	help
> +	  Say y to enable the Allwinner H6/H616 PRCM power domain driver.
> +	  This is required to enable the Mali GPU in the H616 SoC, it is
> +	  optional for the H6.
> diff --git a/drivers/pmdomain/sunxi/Makefile b/drivers/pmdomain/sunxi/Mak=
efile
> index ec1d7a2fb21db..c1343e1237599 100644
> --- a/drivers/pmdomain/sunxi/Makefile
> +++ b/drivers/pmdomain/sunxi/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_SUN20I_PPU)		+=3D sun20i-ppu.o
> +obj-$(CONFIG_SUN50I_H6_PRCM_PPU)	+=3D sun50i-h6-prcm-ppu.o
> diff --git a/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c b/drivers/pmdoma=
in/sunxi/sun50i-h6-prcm-ppu.c
> new file mode 100644
> index 0000000000000..1c6b0c78b222d
> --- /dev/null
> +++ b/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) Arm Ltd. 2024
> + *
> + * Allwinner H6/H616 PRCM power domain driver.
> + * This covers a few registers inside the PRCM (Power Reset Clock Manage=
ment)
> + * block that control some power rails, most prominently for the Mali GP=
U.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/reset.h>
> +
> +/*
> + * The PRCM block covers multiple devices, starting with some clocks,
> + * then followed by the power rails.
> + * The clocks are covered by a different driver, so this driver's MMIO r=
ange
> + * starts later in the PRCM MMIO frame, not at the beginning of it.
> + * To keep the register offsets consistent with other PRCM documentation,
> + * express the registers relative to the beginning of the whole PRCM, and
> + * subtract the PPU offset this driver is bound to.
> + */
> +#define PD_H6_PPU_OFFSET		0x250
> +#define PD_H6_VDD_SYS_REG		0x250
> +#define PD_H616_ANA_VDD_GATE			BIT(4)
> +#define PD_H6_CPUS_VDD_GATE			BIT(3)
> +#define PD_H6_AVCC_VDD_GATE			BIT(2)
> +#define PD_H6_GPU_REG			0x254
> +#define PD_H6_GPU_GATE				BIT(0)
> +
> +struct sun50i_h6_ppu_pd {
> +	struct generic_pm_domain	genpd;
> +	void __iomem			*reg;
> +	u32				gate_mask;
> +	bool				negated;
> +};
> +
> +#define FLAG_PPU_ALWAYS_ON	BIT(0)
> +#define FLAG_PPU_NEGATED	BIT(1)
> +
> +struct sun50i_h6_ppu_desc {
> +	const char *name;
> +	u32 offset;
> +	u32 mask;
> +	unsigned int flags;
> +};
> +
> +struct sun50i_h6_ppu_desc sun50i_h6_ppus[] =3D {
> +	{ "AVCC", PD_H6_VDD_SYS_REG, PD_H6_AVCC_VDD_GATE },
> +	{ "CPUS", PD_H6_VDD_SYS_REG, PD_H6_CPUS_VDD_GATE },
> +	{ "GPU", PD_H6_GPU_REG, PD_H6_GPU_GATE },
> +	{}
> +};
> +
> +struct sun50i_h6_ppu_desc sun50i_h616_ppus[] =3D {
> +	{ "PLL", PD_H6_VDD_SYS_REG, PD_H6_AVCC_VDD_GATE,
> +		FLAG_PPU_ALWAYS_ON | FLAG_PPU_NEGATED },
> +	{ "ANA", PD_H6_VDD_SYS_REG, PD_H616_ANA_VDD_GATE, FLAG_PPU_ALWAYS_ON },
> +	{ "GPU", PD_H6_GPU_REG, PD_H6_GPU_GATE, FLAG_PPU_NEGATED },
> +	{}
> +};
> +#define to_sun50i_h6_ppu_pd(_genpd) \
> +	container_of(_genpd, struct sun50i_h6_ppu_pd, genpd)
> +
> +static bool sun50i_h6_ppu_power_status(const struct sun50i_h6_ppu_pd *pd)
> +{
> +	bool bit =3D readl(pd->reg) & pd->gate_mask;
> +
> +	return bit ^ pd->negated;
> +}
> +
> +static int sun50i_h6_ppu_pd_set_power(const struct sun50i_h6_ppu_pd *pd,
> +				      bool set_bit)
> +{
> +	u32 reg =3D readl(pd->reg);
> +
> +	if (set_bit)
> +		writel(reg | pd->gate_mask, pd->reg);
> +	else
> +		writel(reg & ~pd->gate_mask, pd->reg);
> +
> +	return 0;
> +}
> +
> +static int sun50i_h6_ppu_pd_power_on(struct generic_pm_domain *genpd)
> +{
> +	const struct sun50i_h6_ppu_pd *pd =3D to_sun50i_h6_ppu_pd(genpd);
> +
> +	return sun50i_h6_ppu_pd_set_power(pd, !pd->negated);
> +}
> +
> +static int sun50i_h6_ppu_pd_power_off(struct generic_pm_domain *genpd)
> +{
> +	const struct sun50i_h6_ppu_pd *pd =3D to_sun50i_h6_ppu_pd(genpd);
> +
> +	return sun50i_h6_ppu_pd_set_power(pd, pd->negated);
> +}
> +
> +static int sun50i_h6_ppu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct genpd_onecell_data *ppu;
> +	struct sun50i_h6_ppu_pd *pds;
> +	const struct sun50i_h6_ppu_desc *desc;
> +	void __iomem *base;
> +	int ret, i, count;
> +
> +	desc =3D of_device_get_match_data(dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	for (count =3D 0; desc[count].name; count++)
> +		;
> +
> +	pds =3D devm_kcalloc(dev, count, sizeof(*pds), GFP_KERNEL);
> +	if (!pds)
> +		return -ENOMEM;
> +
> +	ppu =3D devm_kzalloc(dev, sizeof(*ppu), GFP_KERNEL);
> +	if (!ppu)
> +		return -ENOMEM;
> +
> +	ppu->num_domains =3D count;
> +	ppu->domains =3D devm_kcalloc(dev, count, sizeof(*ppu->domains),
> +				    GFP_KERNEL);
> +	if (!ppu->domains)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, ppu);
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	for (i =3D 0; i < count; i++) {
> +		struct sun50i_h6_ppu_pd *pd =3D &pds[i];
> +
> +		pd->genpd.name		=3D desc[i].name;
> +		pd->genpd.power_off	=3D sun50i_h6_ppu_pd_power_off;
> +		pd->genpd.power_on	=3D sun50i_h6_ppu_pd_power_on;
> +		if (desc[i].flags & FLAG_PPU_ALWAYS_ON)
> +			pd->genpd.flags =3D GENPD_FLAG_ALWAYS_ON;
> +		pd->negated		=3D !!(desc[i].flags & FLAG_PPU_NEGATED);
> +		pd->reg			=3D base + desc[i].offset - PD_H6_PPU_OFFSET;
> +		pd->gate_mask		=3D desc[i].mask;
> +
> +		ret =3D pm_genpd_init(&pd->genpd, NULL,
> +				    !sun50i_h6_ppu_power_status(pd));
> +		if (ret) {
> +			dev_warn(dev, "Failed to add GPU power domain: %d\n", ret);

I suppose you want to replace "GPU" with desc[i].name.

Otherwise it looks good to me, but I'd like to hear a comment from genpd ma=
intainers.

Best regards,
Jernej

> +			return ret;
> +		}
> +		ppu->domains[i] =3D &pd->genpd;
> +	}
> +
> +	ret =3D of_genpd_add_provider_onecell(dev->of_node, ppu);
> +	if (ret)
> +		dev_warn(dev, "Failed to add provider: %d\n", ret);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id sun50i_h6_ppu_of_match[] =3D {
> +	{ .compatible	=3D "allwinner,sun50i-h6-prcm-ppu",
> +	  .data		=3D &sun50i_h6_ppus },
> +	{ .compatible	=3D "allwinner,sun50i-h616-prcm-ppu",
> +	  .data		=3D &sun50i_h616_ppus },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sun50i_h6_ppu_of_match);
> +
> +static struct platform_driver sun50i_h6_ppu_driver =3D {
> +	.probe	=3D sun50i_h6_ppu_probe,
> +	.driver	=3D {
> +		.name			=3D "sun50i-h6-prcm-ppu",
> +		.of_match_table		=3D sun50i_h6_ppu_of_match,
> +		/* Power domains cannot be removed while they are in use. */
> +		.suppress_bind_attrs	=3D true,
> +	},
> +};
> +module_platform_driver(sun50i_h6_ppu_driver);
> +
> +MODULE_AUTHOR("Andre Przywara <andre.przywara@arm.com>");
> +MODULE_DESCRIPTION("Allwinner H6 PRCM power domain driver");
> +MODULE_LICENSE("GPL");
>=20





