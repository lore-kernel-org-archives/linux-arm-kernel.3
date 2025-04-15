Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA35C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfKGax6IMKtvyoQdeai875WZiIuZMPB62VAGo5JT8fo=; b=fDX7dRquGfy5/78ZC+lPKVQiAu
	m5oBfPETr0p0K6KMJ1Eb088VxwJyuNJ1v03lZOEbnI8tuqWZ5xCMPfiaDJS0kO/sl7nodkzvDyhth
	p7WEiooECIpVvBx8ck6H36Q0GwUbzh5RI1OmFilTn0Fxj1yD5GqQ3z2d0QUruc58Y8ZxautP6q9Ep
	z3+rPmbBoUX00rVSEchxL6XhLpMIMRdy4aI4N+LeuwydO5U+NH88yHVyPo5GdSwqY4Xbx+i+pr8W6
	KQVvsNoZ0Xu6xX/NLWIuQBT0fjamHws2T/F96ZpH/JHexH7FmyP4NmMlHfyQWf4GPEtmg4iRkGnF6
	LxJgwBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gga-00000005ypA-31gm;
	Tue, 15 Apr 2025 13:50:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gUj-00000005wlm-3r3Z
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Apr 2025 13:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zfKGax6IMKtvyoQdeai875WZiIuZMPB62VAGo5JT8fo=; b=lIVRcuvhi1XNh2O98WyywYruaA
	dfQtLGt9KMATXaNUyDT2h7EkRhIBdMMW0PjXA/RzQURdoqJl5qeoN/xdZBxPqEAl4dP+5CTTcl60O
	FVdyg0XEebi7CWVfeerH9qkRyXItGKCRjVimy6kiySg67W6t0Rbdj28oww+94ZL2gMldei/hpWy4i
	/G1Rq5XCTeQLyhixuo/XTK4NljR7Jjzbf8JNeMeSVFZHbUlhd2aeoWoAmqJVoN6NvkrL3N2CZsHkS
	zvch+FIxUXSOi4gm5kN2m+/eUrd5LjDZxvYgeTlNJZJzy5feeqFwFzxdnO/5qpsAiV2eskTnqaVUf
	pEAuyBaQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4gUg-00000009tnK-3rlA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:38:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4gUC-0006Pd-2X; Tue, 15 Apr 2025 15:38:00 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4gU8-000QdR-03;
	Tue, 15 Apr 2025 15:37:56 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4gU7-000BD8-2u;
	Tue, 15 Apr 2025 15:37:55 +0200
Message-ID: <c9d8f97470c3c5a8c0214af266b9579086460ba1.camel@pengutronix.de>
Subject: Re: [PATCH net-next v6 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Richard Cochran
 <richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>,  Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Tue, 15 Apr 2025 15:37:55 +0200
In-Reply-To: <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_143831_102861_B3197341 
X-CRM114-Status: GOOD (  24.08  )
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

On Di, 2025-04-15 at 13:56 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
> SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 148 ++++++++++++++++++
>  3 files changed, 160 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbe=
th.c
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index 3c820ef56775..2c99b23f0faa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
>  	  This selects the Qualcomm ETHQOS glue layer support for the
>  	  stmmac device driver.
> =20
> +config DWMAC_RENESAS_GBETH
> +	tristate "Renesas RZ/V2H(P) GBETH support"
> +	default ARCH_RENESAS
> +	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
> +	help
> +	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
> +	  RZ/V2H(P) SoCs.
> +
> +	  This selects the Renesas RZ/V2H(P) Soc specific glue layer support
> +	  for the stmmac device driver.
> +
>  config DWMAC_ROCKCHIP
>  	tristate "Rockchip dwmac support"
>  	default ARCH_ROCKCHIP
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/e=
thernet/stmicro/stmmac/Makefile
> index 594883fb4164..91050215511b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX)	+=3D dwmac-lpc18xx.o
>  obj-$(CONFIG_DWMAC_MEDIATEK)	+=3D dwmac-mediatek.o
>  obj-$(CONFIG_DWMAC_MESON)	+=3D dwmac-meson.o dwmac-meson8b.o
>  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+=3D dwmac-qcom-ethqos.o
> +obj-$(CONFIG_DWMAC_RENESAS_GBETH) +=3D dwmac-renesas-gbeth.o
>  obj-$(CONFIG_DWMAC_ROCKCHIP)	+=3D dwmac-rk.o
>  obj-$(CONFIG_DWMAC_RZN1)	+=3D dwmac-rzn1.o
>  obj-$(CONFIG_DWMAC_S32)		+=3D dwmac-s32.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> new file mode 100644
> index 000000000000..8674b7605d83
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
> + *
> + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> + *
> + *                         Rx / Tx
> + *   -------+------------- on / off -------
> + *          |
> + *          |            Rx-180 / Tx-180
> + *          +---- not ---- on / off -------
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include "stmmac_platform.h"
> +
> +struct renesas_gbeth {
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct reset_control *rstc;
> +	struct device *dev;
> +	void __iomem *regs;

This doesn't seem to be used anywhere.

> +};
> +
> +static const char *const renesas_gbeth_clks[] =3D {
> +	"tx", "tx-180", "rx", "rx-180",
> +};
> +
> +static int renesas_gbeth_clks_config(struct renesas_gbeth *gbeth, bool e=
nabled)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	int ret;
> +
> +	plat_dat =3D gbeth->plat_dat;
> +	if (enabled) {
> +		ret =3D reset_control_deassert(gbeth->rstc);
> +		if (ret) {
> +			dev_err(gbeth->dev, "Reset deassert failed\n");
> +			return ret;
> +		}
> +
> +		ret =3D clk_bulk_prepare_enable(plat_dat->num_clks,
> +					      plat_dat->clks);
> +		if (ret)
> +			reset_control_assert(gbeth->rstc);
> +	} else {
> +		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
> +		ret =3D reset_control_assert(gbeth->rstc);
> +		if (ret)
> +			dev_err(gbeth->dev, "Reset assert failed\n");
> +	}
> +
> +	return ret;
> +}

Apart from the plat_dat assignment, this function has two completely
separate paths. I'd fold its contents into renesas_gbeth_init/exit().


regards
Philipp

