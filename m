Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD09D2ED12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJlvsdjO7MakrXAnTGrsJvCK8GVpY/2Oni8KztKsRFI=; b=WRmzvl4Y6/I7kwWNYkrUKk/Fuj
	CdfKcoK9ZeNQmUMU/w7QEudd+D9lesOhyFGipIbFBf6xM9+Snw3bHZ+Kio90XZlYQkGqHBPvCwNPo
	qLH/bAlP6M8z2r706ommKDGLO17ucjij8Ok4OUzx/3EeiznE2jjMgIo1ocq/gq7WszihtKh9DCkKk
	NFsSOg0aoqIg/MuovW0lXqZa1j3CEErJsNTV75CgyuF3nDnnyB6l/eAcM4MZd2k16NGJZmCp9Air0
	uxNZJCd18y2Zlq7aKuxh04/RSAB6bJ8pubtdwFVTlztFkswhcxyTRGtLkdY1kxndG/OqU4juwciJs
	UVwKi+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9hZ-00000003gnE-1cCk;
	Tue, 20 Jan 2026 11:15:15 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9hV-00000003gmM-2e6n;
	Tue, 20 Jan 2026 11:15:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768907647; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MLm/apznCo1vkrhgqdt2z6fqtnb1SbIVdgzHikdkv35tmySWGCVPqd99XhKn9owM3TbqWCkOIMUUwMS+4V/TExvZibsn+8Ef//q7UoIpTE2r5lb8zot88oM3B8j424J46SwRKKCxuFyolNStCD9T4Odg+1rktwEjUujOY7kupJg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768907647; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tJlvsdjO7MakrXAnTGrsJvCK8GVpY/2Oni8KztKsRFI=; 
	b=h7QuZ28EnDC7OQBna/NjX26H1HsexkJZmeY1FtM/izwfHFAZwH8EL5v++SrxWlMuY3MvlCvGBkrSFHFJvTyjQxl9FabP5zAfyzp91rYyIofRWW4ljwoTCkP2u5S7awWzTYW51Qlgz5vSOqZkTV7986ETKQgVlqL8SVgq5v9KunM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768907647;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=tJlvsdjO7MakrXAnTGrsJvCK8GVpY/2Oni8KztKsRFI=;
	b=IQ5J3XJXRxRY9SMaPXJbxjogepRElpYKptpWbrV3D841tGD/EIepXwW76IZohqcy
	tnt4sfgsqRQ+Nlu3e54z/Hy1Q5EUkmVxxbP0+LS0HVeGOdWosQZsgLuN1Jw6Fudw2GR
	WCsTFNyASwHiRvKnThPceu0ee3SM5iJpw8xp1sd8=
Received: by mx.zohomail.com with SMTPS id 176890764538613.18629924577317;
	Tue, 20 Jan 2026 03:14:05 -0800 (PST)
Date: Tue, 20 Jan 2026 11:13:50 +0000
From: Yao Zi <me@ziyao.cc>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aW9jbqBSgkiLLw8r@pie>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120043609.910302-4-inochiama@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_031510_500445_B3CA1C1C 
X-CRM114-Status: GOOD (  25.79  )
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

On Tue, Jan 20, 2026 at 12:36:08PM +0800, Inochi Amaoto wrote:
> Adds Spacemit dwmac driver support on the Spacemit K3 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 224 ++++++++++++++++++
>  3 files changed, 237 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> new file mode 100644
> index 000000000000..72744e60d02a
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Spacemit DWMAC platform driver
> + *
> + * Copyright (C) 2026 Inochi Amaoto <inochiama@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/math.h>

These are the only two headers listed out-of-order. Is this intended?

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>

...

> +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> +					       unsigned int *config)
> +{
> +	int i;
> +	int code, best_code = 0;
> +	unsigned int best_delay = 0;
> +	unsigned int best_config = 0;
> +
> +	if (delay == 0)
> +		return 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> +		unsigned int step = k3_delay_step_10x[i];
> +
> +		for (code = 1; code <= MAX_DLINE_DELAY_CODE; code++) {
> +			/*
> +			 * Note K3 require a specific factor for calculate
> +			 * the delay, in this scenario it is 0.9. So the
> +			 * formula is code * step / 10 * 0.9
> +			 */
> +			unsigned int tmp = code * step * 9 / 10 / 10;
> +
> +			if (abs(tmp - delay) < abs(best_delay - delay)) {
> +				best_code = code;
> +				best_delay = tmp;
> +				best_config = i;
> +			}

Is the inner loop really necessary? Could it be replaced by

	this_code = DIV_ROUND_CLOSEST(delay * 10 * 10, step * 9);
	this_delay = this_code * step * 9 / 10 / 10;

Then comparing abs(this_delay - delay) and abs(best_delay - delay)?

> +		}
> +	}
> +
> +	*config = best_config;
> +
> +	return best_code;
> +}

...

> +static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
> +					  struct stmmac_resources *stmmac_res,
> +					  struct regmap *apmu,
> +					  unsigned int ctrl_offset)
> +{
> +	unsigned int mask = PHY_INTF_MII | PHY_INTF_RGMII | WAKE_IRQ_EN;
> +	unsigned int val = 0;
> +
> +	switch (plat_dat->phy_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		val |= PHY_INTF_MII;
> +		break;

The OR operation seems unnecessary and could be replaced with an
assignment. Same for PHY_INTERFACE_MODE_RGMII's case.

> +
> +	case PHY_INTERFACE_MODE_RMII:
> +		break;
> +
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		val |= PHY_INTF_RGMII;
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}

...

> +static int spacemit_dwmac_probe(struct platform_device *pdev)
> +{

...

> +	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
> +	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);

According to of.h, of_property_read_u32, which in turn calls
of_property_read_u32_array, could fail with -ENODATA if there's no value
associated with the property. Should the case be handled?

Regards,
Yao Zi

