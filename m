Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A800CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yN+jlUj2bkdJO2fa3tTsgtziLO5bfzzPt08XHlkjhtE=; b=I7rSHW9jH90f9BgGA0ucR34LaH
	LW3hvtpH0bhbqOUrOzyuh8Quh8dX3/rE9YIglROUaAc956LAOEn7MvYJ/XRx5iXk0JkHnbMZDb4Ed
	ruc646OiT+xEz8a9ZcZj6c96nN19gJ/y7brm+pfGAdies51xz6XzhmDv3qlT5nigwE4dMfTJ67XHw
	DWyYEleszuygwb96ukBlOBAMw8+iGRZ/y0M9YNACoubRfyQNcyKrI8uZhZycO7gdNxPh6U0SZdQ9X
	4g+VI+YSgRs7c1Y+L4cgchv3fP7pO0e5vx3UGv/oywDtTznEpilqFSIOTlKrrIDa9N5q4ypsBZSaf
	XpLjuJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNFG-00000007muY-3xTu;
	Wed, 24 Jun 2026 13:02:22 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNFA-00000007mtP-39cY;
	Wed, 24 Jun 2026 13:02:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 20A192000D8;
	Wed, 24 Jun 2026 15:02:13 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcNF7-004Qb0-09;
	Wed, 24 Jun 2026 15:02:13 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcNF6-00000000B61-3z8C;
	Wed, 24 Jun 2026 15:02:12 +0200
Message-ID: <eb03894ae2765a426457238157e474087ea0aaa6.camel@pengutronix.de>
Subject: Re: [PATCH v9 02/12] reset: Add Realtek basic reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
 bmasney@redhat.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Wed, 24 Jun 2026 15:02:12 +0200
In-Reply-To: <20260624112940.3475605-3-eleanor.lin@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
	 <20260624112940.3475605-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_060216_940170_1895BB53 
X-CRM114-Status: GOOD (  21.53  )
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

On Mi, 2026-06-24 at 19:29 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Define the reset operations backed by a regmap-based register interface
> and prepare the reset controller to be registered through the reset
> framework.
>=20
> Since the reset controllers on Realtek SoCs often share the same register
> space with the clock controllers, this common framework is designed to
> extract the regmap and device tree node from the parent device
> (e.g., an auxiliary device parent).
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v8:
> - Rename common.[ch] to reset-rtk-common.[ch].
> ---
>  MAINTAINERS                              |  1 +
>  drivers/reset/Kconfig                    |  1 +
>  drivers/reset/Makefile                   |  1 +
>  drivers/reset/realtek/Kconfig            |  8 +++
>  drivers/reset/realtek/Makefile           |  2 +
>  drivers/reset/realtek/reset-rtk-common.c | 90 ++++++++++++++++++++++++
>  drivers/reset/realtek/reset-rtk-common.h | 29 ++++++++
>  7 files changed, 132 insertions(+)
>  create mode 100644 drivers/reset/realtek/Kconfig
>  create mode 100644 drivers/reset/realtek/Makefile
>  create mode 100644 drivers/reset/realtek/reset-rtk-common.c
>  create mode 100644 drivers/reset/realtek/reset-rtk-common.h
>=20
[...]
> diff --git a/drivers/reset/realtek/reset-rtk-common.c b/drivers/reset/rea=
ltek/reset-rtk-common.c
> new file mode 100644
> index 000000000000..75b27cb2a208
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtk-common.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include "reset-rtk-common.h"
> +
> +static inline struct rtk_reset_data *to_rtk_reset_controller(struct rese=
t_controller_dev *r)
> +{
> +	return container_of(r, struct rtk_reset_data, rcdev);
> +}
> +
> +static inline const struct rtk_reset_desc *rtk_reset_get_desc(struct rtk=
_reset_data *data,
> +							      unsigned long idx)
> +{
> +	return &data->descs[idx];
> +}
> +
> +static int rtk_reset_assert(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	const struct rtk_reset_desc *desc;
> +	u32 mask, val;
> +
> +	desc =3D rtk_reset_get_desc(data, idx);
> +	mask =3D desc->write_en ? (0x3U << desc->bit) : BIT(desc->bit);
> +	val  =3D desc->write_en ? (0x2U << desc->bit) : 0;
> +
> +	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
> +}
> +
> +static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
> +			      unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	const struct rtk_reset_desc *desc;
> +	u32 mask, val;
> +
> +	desc =3D rtk_reset_get_desc(data, idx);
> +	mask =3D desc->write_en ? (0x3U << desc->bit) : BIT(desc->bit);
> +	val =3D mask;
> +
> +	return regmap_update_bits(data->regmap, desc->ofs, mask, val);

You can use regmap_set_bits() here.

> +}
> +
> +static int rtk_reset_status(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	const struct rtk_reset_desc *desc;
> +	u32 val;

	unsigned int val;

> +	int ret;
> +
> +	desc =3D rtk_reset_get_desc(data, idx);
> +	ret =3D regmap_read(data->regmap, desc->ofs, &val);
> +	if (ret)
> +		return ret;
> +
> +	return !((val >> desc->bit) & 1);
> +}
> +
> +static const struct reset_control_ops rtk_reset_ops =3D {
> +	.assert   =3D rtk_reset_assert,
> +	.deassert =3D rtk_reset_deassert,
> +	.status   =3D rtk_reset_status,
> +};
> +
> +/* The caller must initialize data->descs, data->rcdev.nr_resets and
> + * data->rcdev.owner before calling rtk_reset_controller_add().
> + */
> +int rtk_reset_controller_add(struct device *dev,
> +			     struct rtk_reset_data *data)
> +{
> +	data->regmap          =3D dev_get_platdata(dev);
> +	data->rcdev.ops       =3D &rtk_reset_ops;
> +	data->rcdev.dev       =3D dev;
> +	data->rcdev.of_node   =3D dev->parent->of_node;

This split rcdev initialization is more hassle than it is worth.
Please just export rtk_reset_ops and duplicate the
regmap/ops/dev/of_node assignment in the probe functions.

Alternatively, consolidate the probe function and export it from here.

regards
Philipp

