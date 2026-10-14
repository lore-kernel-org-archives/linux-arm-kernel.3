Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F6ECC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpni2JRpgkEjawgt1PmipE1xAxWhPvLzmF7/Xh75+JA=; b=Yo2efNySXe0WMNapuuqHDpGDaU
	me+q1SMskN17S1QRsuEgTVNAGn7FruMZv9EIUxud1l88DX/uSRm7oERaO9h7mkxmAIHpV5aPsAbC/
	V2X3XOrs//hCXR1LBOvnmtBIkOaKwbBiZx53fxYYAyo5szpChQIVGeLi7kn+Ju8rML3Aw5knfw485
	5q9XkPDCRRJF/m00gTNLwnHrzgoVwtkmNxuHlSmGpVRf234EBrtY1Kp3vx6YESeidOT91dBpkKiCB
	ei/O7vW1+grC/HloEdSpJbECfdyPdy2+O2a095uTK3JxNfTcZC+wEa/f15lpBF3WgjXfqDA6aLN3D
	saXqzs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwvr-0000000FIov-11Lm;
	Wed, 14 Oct 2026 11:14:03 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwvo-0000000FIoO-2cAq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:14:02 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B557C200467;
	Wed, 14 Oct 2026 13:13:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791976438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zpni2JRpgkEjawgt1PmipE1xAxWhPvLzmF7/Xh75+JA=;
	b=Pcusq2EkMyVmljTpeACu7OeAQYlY8G5hPzhIymNUKkJAsoZKG/L/JN0ZMdGfkqO1wgKhHl
	rtqONRv8nCaCVFZij+Hpm3TEYjoVYN/YZm/SdQ0HFisnSdDzp1u4wErKrS6J3hIe9Q/YMS
	SW1mFsofphwTeVhuUR3lLxQYlZS+K2sMQDiI1CLAuB+TqRBN1Xlm9Sxyoj3ZYQbejpZkoI
	N1+Y5CYkQ6vCwy0tNYNSBzowDRjHFyRjVwFvHREB/73zVpyv0bGU+ZONxQEpA+QIeQYKyU
	DF6AqaOxt+G2bCrScaEPtcr3+VstFiVs1mg6MrY0p6MuQILnzZsL6pTZJuh8RQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791976438; a=rsa-sha256;
	cv=none;
	b=bcVIKJEim+JyQ4T2LOmd7o2XzT6ubp8h7e5tUMeswifoiesriJwL8P97qTx5qJEGH8OkQm
	IJyDCYR7JVdlCY2yUCyB3agzbfu+tqDy4fQ9ekI1/C4Y1MvfhEARpzPvlV4sSOdPegjN4Q
	B1dlmdSf4SubWAobtCTRbURykH/CRrEjHy9UX8N3QmOWmMnK6fhH3daUpZ2KakzvwRYq0k
	wivQo55k1FcxWXDISDX7YsvOshnMgEl4+eM3mt5XoIs8b+gh825FRQSiqBMLWgsd2hyL67
	KK+G2gB7Fj6eGmCcWWdwo1p677pac9wrIBIf9l2M7+ZN2C4k5PT4OlpCZm+tIg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791976438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zpni2JRpgkEjawgt1PmipE1xAxWhPvLzmF7/Xh75+JA=;
	b=cmAVh/pquHVMWfxS1AJa2UY2i29kcqJSSvhIWvMHV1ZsmBr9PgMm8Cwn5XYsO4piVy4xOF
	G7qYTeI66miIaweIO0AtXT5seodANiUj9g+ZMW3dSMds8AhSLrHXQ3eFsCdMCf7SYr62+m
	BVWSx8ntw75dkdkeRb4v4AZ4FhykNgbzPOpfxr4TI14Z8lzImE6545CaRUUgC5RqtlPYQp
	W4HRxCFJDY3jVh8uoI25GMZxBBUdPT/xe7ujUjXjNUeTnaDu7JWGaukoBR2qra98JhlvG4
	cLz9GIgy0yTsGDcGNYU2HaAMxwJkH+qy16jwDFCjyfLtFY5sXneKc3DrJU/FDQ==
Message-ID: <90c5efa22600044657e67b9e1297bda2fb53f60c.camel@pengutronix.de>
Subject: Re: [PATCH RFC 5/5] reset: Add BCMBCA block resets through the PMB
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore	 <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 14 Oct 2026 13:13:58 +0200
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-5-daf5d177e113@kernel.org>
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
	 <20261014-xg6846b-bcmbca-xrdp-reset-v1-5-daf5d177e113@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_041401_325623_35321AE9 
X-CRM114-Status: GOOD (  33.67  )
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

On Mi, 2026-10-14 at 11:48 +0200, Linus Walleij wrote:
> Support BCM6846 XRDP, PCIe and PVTMON resets through the Processor
> Monitor Bus (PMB) of the third generation Platform Management
> Controller (PMC3).
>=20
> Use per-SoC reset groups and sequences with transport serialization.
> Reset XRDP and its Runner cores together to keep their shared SRAM
> Buffer Pool Manager (SBPM) state consistent. Consumers must quiesce
> all affected users, including firmware voltage monitoring for PVTMON.
>=20
> Power-cycle resets for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL were
> considered but left out. These belong in power-domain and platform
> power-management abstractions, which can coordinate affected users.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/reset/Kconfig            |  15 +++
>  drivers/reset/Makefile           |   1 +
>  drivers/reset/reset-bcmbca-pmb.c | 281 +++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 297 insertions(+)
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 3168ab1eea88..fb2b20deb050 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -49,6 +49,21 @@ config RESET_BCM6345
>  	help
>  	  This enables the reset controller driver for BCM6345 SoCs.
> =20
> +config RESET_BCMBCA_PMB
> +	tristate "Broadcom BCMBCA PMB reset controller"
> +	depends on ARCH_BCMBCA || COMPILE_TEST
> +	depends on OF && HAS_IOMEM
> +	select BCMBCA_PMB
> +	help
> +	  Reset BCMBCA blocks through the Processor Monitor Bus (PMB) of
> +	  the third generation Platform Management Controller (PMC3).
> +	  Supports the BCM6846 XRDP packet engine and its Runner cores,
> +	  PCIe, and analog acquisition in the process, voltage and temperature
> +	  monitor. Blocks must be powered and all affected users quiesced
> +	  before reset.
> +
> +	  The module will be called reset-bcmbca-pmb.
> +
>  config RESET_BERLIN
>  	tristate "Berlin Reset Driver"
>  	depends on ARCH_BERLIN || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 45ad17062462..d0d618cc6495 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_RESET_ASPEED) +=3D reset-aspeed.o
>  obj-$(CONFIG_RESET_ATH79) +=3D reset-ath79.o
>  obj-$(CONFIG_RESET_AXS10X) +=3D reset-axs10x.o
>  obj-$(CONFIG_RESET_BCM6345) +=3D reset-bcm6345.o
> +obj-$(CONFIG_RESET_BCMBCA_PMB) +=3D reset-bcmbca-pmb.o
>  obj-$(CONFIG_RESET_BERLIN) +=3D reset-berlin.o
>  obj-$(CONFIG_RESET_BRCMSTB) +=3D reset-brcmstb.o
>  obj-$(CONFIG_RESET_BRCMSTB_RESCAL) +=3D reset-brcmstb-rescal.o
> diff --git a/drivers/reset/reset-bcmbca-pmb.c b/drivers/reset/reset-bcmbc=
a-pmb.c
> new file mode 100644
> index 000000000000..d3b247a48574
> --- /dev/null
> +++ b/drivers/reset/reset-bcmbca-pmb.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * BCMBCA block resets through the Processor Monitor Bus (PMB) of the
> + * third generation Platform Management Controller (PMC3).
> + *
> + * SoC match data maps reset IDs to groups of blocks and their sequences=
.
> + * XRDP and its Runner cores share SRAM Buffer Pool Manager (SBPM) state
> + * and must be reset together, preserving their bus interfaces.
> + * PCIe uses soft-reset pulses; PVTMON resets analog acquisition.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/reset-controller.h>
> +#include <linux/soc/bcm/bcmbca-pmb.h>
> +
> +#include <dt-bindings/reset/brcm,bcm6846-pmb.h>
> +
> +struct bcmbca_pmb_reset_block {
> +	u8 bus;
> +	u8 device;
> +	u16 offset; /* PMB word offset of the reset register. */
> +	u32 mask;
> +	u32 assert_value;
> +	u32 deassert_value;
> +};
> +
> +struct bcmbca_pmb_reset;
> +
> +struct bcmbca_pmb_reset_group {
> +	const char *name;
> +	int (*reset)(struct bcmbca_pmb_reset *rst,
> +		     const struct bcmbca_pmb_reset_group *group);

What is the point of this indirection?

There is only a single array of struct bcmbca_pmb_reset_group and all
entries use the same bcmbca_pmb_reset_sequence().

> +	const struct bcmbca_pmb_reset_block *blocks;
> +	unsigned int num_blocks;
> +	unsigned int assert_us;
> +};
> +
> +struct bcmbca_pmb_reset_variant {
> +	const struct bcmbca_pmb_reset_group *groups;
> +	unsigned int num_groups;
> +};
> +
> +struct bcmbca_pmb_reset {
> +	struct reset_controller_dev rcdev;
> +	const struct bcmbca_pmb_reset_variant *variant;
> +	struct bcmbca_pmb *pmb;
> +};
> +
> +static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
> +				     const struct bcmbca_pmb_reset_group *group);
> +
> +static const struct bcmbca_pmb_reset_block bcm6846_xrdp_resets[] =3D {
> +	/* Keep the XRDP bus interfaces out of reset. */

What does this comment refer to? assert_value being GENMASK(2, 0)
instead of 0?

> +	{
> +		.bus =3D 1,
> +		.device =3D 12,
> +		.offset =3D 5,
> +		.mask =3D GENMASK(27, 0),
> +		.assert_value =3D GENMASK(2, 0),
> +		.deassert_value =3D GENMASK(27, 0),

Are the four different devices the packet engine and the tree runner
cores mentioned in the dt-bindings patch?

Do the 28 bits refer to 28 different resets?

> +	},
> +	{
> +		.bus =3D 1,
> +		.device =3D 14,
> +		.offset =3D 5,
> +		.mask =3D GENMASK(27, 0),
> +		.deassert_value =3D GENMASK(27, 0),
> +	},
> +	{
> +		.bus =3D 1,
> +		.device =3D 15,
> +		.offset =3D 5,
> +		.mask =3D GENMASK(27, 0),
> +		.deassert_value =3D GENMASK(27, 0),
> +	},
> +	{
> +		.bus =3D 1,
> +		.device =3D 16,
> +		.offset =3D 5,
> +		.mask =3D GENMASK(27, 0),
> +		.deassert_value =3D GENMASK(27, 0),
> +	},
> +};
> +
> +/* Bits 6 and 7 select the lane configuration and must remain unchanged.=
 */
> +static const struct bcmbca_pmb_reset_block bcm6846_pcie_resets[] =3D {
> +	{
> +		.bus =3D 0,
> +		.device =3D 18,
> +		.offset =3D 5,
> +		.mask =3D GENMASK(5, 0),
> +		.assert_value =3D GENMASK(5, 0),

Same here, are these 6 different resets? Does the hardware require them
to be asserted/deasserted at the same time?

> +	},
> +	{
> +		.bus =3D 0,
> +		.device =3D 19,
> +		.offset =3D 5,
> +		.mask =3D GENMASK(5, 0),
> +		.assert_value =3D GENMASK(5, 0),
> +	},
> +};

Why put these in an array?

> +
> +/* Analog acquisition reset, independent of clock and power configuratio=
n. */
> +static const struct bcmbca_pmb_reset_block bcm6846_pvtmon_reset =3D {
> +	.bus =3D 1,
> +	.device =3D 6,
> +	.offset =3D 17,
> +	.mask =3D BIT(0),
> +	.deassert_value =3D BIT(0),
> +};
> +
> +static const struct bcmbca_pmb_reset_group bcm6846_pmb_reset_groups[] =
=3D {
> +	[BCM6846_RESET_XRDP] =3D {
> +		.name =3D "XRDP",
> +		.reset =3D bcmbca_pmb_reset_sequence,
> +		.blocks =3D bcm6846_xrdp_resets,
> +		.num_blocks =3D ARRAY_SIZE(bcm6846_xrdp_resets),
> +		.assert_us =3D 10,
> +	},
> +	[BCM6846_RESET_PCIE0] =3D {
> +		.name =3D "PCIe0",
> +		.reset =3D bcmbca_pmb_reset_sequence,
> +		.blocks =3D &bcm6846_pcie_resets[0],
> +		.num_blocks =3D 1,
> +		.assert_us =3D 10000,
> +	},
> +	[BCM6846_RESET_PCIE1] =3D {
> +		.name =3D "PCIe1",
> +		.reset =3D bcmbca_pmb_reset_sequence,
> +		.blocks =3D &bcm6846_pcie_resets[1],
> +		.num_blocks =3D 1,
> +		.assert_us =3D 10000,
> +	},
> +	[BCM6846_RESET_PVTMON] =3D {
> +		.name =3D "PVTMON",
> +		.reset =3D bcmbca_pmb_reset_sequence,
> +		.blocks =3D &bcm6846_pvtmon_reset,
> +		.num_blocks =3D 1,
> +		.assert_us =3D 1000,
> +	},
> +};
> +
> +static const struct bcmbca_pmb_reset_variant bcm6846_pmb_variant =3D {
> +	.groups =3D bcm6846_pmb_reset_groups,
> +	.num_groups =3D ARRAY_SIZE(bcm6846_pmb_reset_groups),
> +};
> +
> +/* Best effort with both locks held; never restart a partially reset gro=
up. */
> +static void bcmbca_pmb_reset_cleanup(struct bcmbca_pmb_reset *rst,
> +				     const struct bcmbca_pmb_reset_group *group)
> +{
> +	const struct bcmbca_pmb_reset_block *block;
> +	unsigned int i;
> +	u32 value;
> +	int ret;
> +
> +	for (i =3D 0; i < group->num_blocks; i++) {
> +		block =3D &group->blocks[i];
> +		ret =3D bcmbca_pmb_read(rst->pmb, block->bus, block->device,
> +				      block->offset, &value);
> +		if (!ret) {
> +			value &=3D ~block->mask;
> +			value |=3D block->assert_value;
> +			ret =3D bcmbca_pmb_write(rst->pmb, block->bus, block->device,
> +					       block->offset, value);
> +		}

Could the PMB bus driver provide an _update_bits() function for these
read-modify-write sequences? It is the one handling the locking anyway.

This whole driver feels a bit like if PMB could just export a regmap,
it would collapse into a few regmap_multi_reg_write()s.

> +		if (ret)
> +			dev_err(rst->rcdev.dev,
> +				"failed to hold PMB bus %u device %u in reset: %d\n",
> +				block->bus, block->device, ret);
> +	}
> +}
> +
> +/* Called with both PMB locks held, including during error cleanup. */

Which two locks are "both"? pmb->lock mutex and the PMB_MUTEX hardware
lock?

> +static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
> +				     const struct bcmbca_pmb_reset_group *group)
> +{
> +	const struct bcmbca_pmb_reset_block *block;
> +	unsigned int i;
> +	u32 value;
> +	int ret, pass;
> +
> +	if (!group->num_blocks)
> +		return -EINVAL;
> +
> +	/* Assert every block before releasing any of them. */
> +	for (pass =3D 0; pass < 2; pass++) {

Maybe   for (pass =3D PASS_ASSERT; pass <=3D PASS_DEASSERT

> +		for (i =3D 0; i < group->num_blocks; i++) {
> +			block =3D &group->blocks[i];
> +			ret =3D bcmbca_pmb_read(rst->pmb, block->bus, block->device,
> +					      block->offset, &value);
> +			if (ret)
> +				goto release;
> +			value &=3D ~block->mask;
> +			value |=3D pass ? block->deassert_value : block->assert_value;
> +			ret =3D bcmbca_pmb_write(rst->pmb, block->bus, block->device,
> +					       block->offset, value);
> +			if (ret)
> +				goto release;
> +		}
> +		if (!pass && group->assert_us)
> +			usleep_range(group->assert_us, group->assert_us * 2);

Is that assertion delay the time the reset needs to stay asserted or is
this really a delay that needs to be observed between successive
assertions in a group?

> +	}
> +release:
> +	if (ret) {
> +		dev_err(rst->rcdev.dev, "%s %s failed at PMB bus %u device %u: %d\n",
> +			group->name, pass ? "release" : "assert",

Please use "deassert" to avoid possible confusion with the
reset_control_release() meaning of "release".

> +			block->bus, block->device, ret);
> +		bcmbca_pmb_reset_cleanup(rst, group);
> +	}
> +	return ret;
> +}
[...]

regards
Philipp

