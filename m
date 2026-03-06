Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CDDF513EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEnB/hiv2/rKoS+M+yUbl2/5GxTIZHy/Mw1vnmK96nU=; b=i5sYaA522rJXYWRve/HfjnbD8D
	8r9opWrm5otOMGNwTFAXWLtqb/HPKsx/twjo1LDU9MMtrAYWW67q8rIuIaAuWo6Tfng7n4oh6axrt
	lqa0wP8qI+djSuLqW+3r/qRH3o6hTbIPwNooq6FekaI031yMTNa7oJay7kJvkmxloM1UYUK4kFe4w
	Bd88l82QIqo70UDNGTYoMqay8cfpCPFjECsk5zZT2pJ9JNvz4corEheQHpYtL15o/MuveJ0DM2luz
	DSoRhrubUIcF46P2toS1HXt9YKPfEGshOqpiNNBK4gTVo2+Jrk6pyr+VLiYCMDlqIfhKDN7zfzd0E
	9EprKYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLIx-00000002uut-0H4x;
	Fri, 06 Mar 2026 02:52:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLIv-00000002uuj-32u8;
	Fri, 06 Mar 2026 02:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A6F3600B0;
	Fri,  6 Mar 2026 02:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99677C116C6;
	Fri,  6 Mar 2026 02:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772765560;
	bh=59Brc3xI7MFaiXfr+R/dXuomEGyJC2J+vM/pJ/BSte8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJUaAkiLxDd++c9sKrZnqEjNkKjdzz59SAy9wTUS1ke/qS9IR+iEnm9Z/8NB6RYYS
	 G4cBNUSwM/FjCfDVijoXBZeTdM6XI5OEt/qpfFy85VNsIy9YabGSW8YMCuVvrmQBvP
	 vh50wIestjE8G3UWXVt3B13MTpR5ZR+lk8NDl6u/HeetyPp1HbmueZyG101OrPjk6x
	 riwbXU+4Q+LcUWQq9YgabkBvYTwNF3AiDSPS6qR1+Nuclfz1G7gGt1TlnUNeEi4bWf
	 COpVWmyM6Wa0LRo2zZbmdhFIWpw7mUNtvPmGI+oGg83DDdnQ/O+37pYUXtM2RpFyqG
	 lf7jy2ZxDTxEQ==
From: Jakub Kicinski <kuba@kernel.org>
To: inochiama@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	dlan@kernel.org,
	palmer@dabbelt.com,
	me@ziyao.cc,
	boon.khai.ng@altera.com,
	linux-riscv@lists.infradead.org,
	edumazet@google.com,
	joabreu@synopsys.com,
	pjw@kernel.org,
	weishangjuan@eswincomputing.com,
	andrew+netdev@lunn.ch,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	siyanteng@cqsoftware.com.cn,
	richardcochran@gmail.com,
	looong.bin@gmail.com,
	quentin.schulz@cherry.de,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	dlan@gentoo.org,
	alexandre.torgue@foss.st.com,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	aou@eecs.berkeley.edu,
	rmk+kernel@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	vladimir.oltean@nxp.com,
	mcoquelin.stm32@gmail.com,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	peppe.cavallaro@st.com,
	devicetree@vger.kernel.org,
	pabeni@redhat.com,
	linux-stm32@st-md-mailman.stormreply.com,
	wens@kernel.org,
	maxime.chevallier@bootlin.com
Subject: Re: [net-next,v7,3/3] net: stmmac: Add glue layer for Spacemit K3 SoC
Date: Thu,  5 Mar 2026 18:52:37 -0800
Message-ID: <20260306025237.580075-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304080721.1658224-4-inochiama@gmail.com>
References: <20260304080721.1658224-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: Add glue layer for Spacemit K3 SoC

The ethernet controller on Spacemit K3 SoC is Synopsys DesignWare
MAC (version 5.40a), with the following special points:
1. The rate of the tx clock line is auto changed when the mac speed
   rate is changed, and no need for changing the input tx clock.
2. This controller require a extra syscon device to configure the
   interface type, enable wake up interrupt and delay configuration
   if needed.

Add Spacemit dwmac driver support on the Spacemit K3 SoC.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> new file mode 100644
> index 000000000000..22aa25a7417b
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> @@ -0,0 +1,228 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Spacemit DWMAC platform driver
> + *
> + * Copyright (C) 2026 Inochi Amaoto <inochiama@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/math.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#include "stmmac_platform.h"

[ ... ]

> +struct spacmit_dwmac {
> +	struct regmap *apmu;
> +	unsigned int ctrl_offset;
> +	unsigned int dline_offset;
> +};

This isn't a bug, but the struct name is 'spacmit_dwmac' (missing 'e'),
while the driver filename is 'dwmac-spacemit.c' and all function names use
'spacemit_*' (e.g., spacemit_dwmac_probe, spacemit_dwmac_set_delay). Should
the struct be named 'spacemit_dwmac' for consistency?

[ ... ]

> +static int spacemit_dwmac_fix_delay(struct spacmit_dwmac *dwmac,
> +				    struct plat_stmmacenet_data *plat_dat,
> +				    unsigned int tx_delay,
> +				    unsigned int rx_delay)
> +{
> +	int rx_code;
> +	int tx_code;
> +
> +	rx_code = spacemit_dwmac_detected_delay_value(rx_delay);
> +	if (rx_code < 0)
> +		return rx_code;
> +
> +	tx_code = spacemit_dwmac_detected_delay_value(tx_delay);
> +	if (tx_code < 0)
> +		return tx_code;
> +
> +	return spacemit_dwmac_set_delay(dwmac, tx_code, rx_code);
> +}

The 'plat_dat' parameter appears to be unused in spacemit_dwmac_fix_delay().
The function only uses 'dwmac', 'tx_delay', and 'rx_delay'. Is this
parameter needed?

[ ... ]

