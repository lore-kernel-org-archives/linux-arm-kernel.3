Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B21C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3UVmLbw05nY1bIJLdntt1cb4T+VHhtyOYBFetAFNM8=; b=gRkmsjEjGD+oSVHV0KzetjOPHB
	PKWjcHl7JPEZici9WsIuijOnb3sEBNd/tb4mdHP3RtRX8mmYkg8hZfnMXqvZUUeyEAKDxGF+AyQeN
	S8OYN/A9xze40q2blB5dHF4bmxYKckGso2jN6ZqDu385/mihG5aqHS0w/p9V0bjPJ3B32CflFRIYP
	rlD/UJqVf2DECFGL9LLfTd9e0lvXN4PYwWwiwfrR/RH3i+WNhoOzzsmY81k9PdhXGAL7wPFPAn+pG
	NKeF9uHm6AFjKVKsm4+7Y9mT6zyMg8kgA8Y1VtVkEd/5+w5Y/i4cPKAqTnJnUL0eVafTUpib5lKSs
	IhFzh81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kw9-0000000CKf4-0yFT;
	Thu, 17 Apr 2025 08:49:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kot-0000000CIu6-24Ke
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:42:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so4870725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744879322; x=1745484122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3UVmLbw05nY1bIJLdntt1cb4T+VHhtyOYBFetAFNM8=;
        b=cKFWmfY5hwUAPXLADWm/qNOZZ3aXAyVy5QFx7J4E3ZA1TqWtuKDJ4bI83fJrT4og4P
         7O45E++nnzs9emY8QPDt1uYzyT5MRfNzMfQ8TmSxCfEPLEU+iyr49ncaZEAekkP8P8gA
         z8UaRYavid52XO12pmnc/0/0SRXCExOHp/aoDevRf0NNSZL1zxbWXUn0ewn3jS6U6tqj
         lJ+XJvh+8yhMViMsEhLz2XsYPrN0G5gtEdsPK8VxWapPCUuODw6ZKDm1ArIayma/X3O+
         1tLs37Jc73SjC4TFgv0Dqk/HhWLR+pQyeH6RypdSA7TRGOP1PcBcaiQXq8HHBitjrdBJ
         DWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879322; x=1745484122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3UVmLbw05nY1bIJLdntt1cb4T+VHhtyOYBFetAFNM8=;
        b=v32WO9OQ1sbXtB6eEaoKHXKOJLX+iJlns6tneqIn2QBhcnoXqmuo8nyKjHVf0ySRjI
         kirsvqttFVjHA1IVjeQ1JLzSUkCUkLY3WWvci0vdqeNi5MBiME9o1CvH9qYkcH9RZr1W
         iE2I0TvAtwBRlaN3wodFQn1sheReyKvjIyQSgpotua+GS5DlU7TpB333MO/HII5m5lq4
         CvKMIqPGgtZR+Spy6W0iUTPCSxWFPYUCwlQkKd2gke5/yRU9Tn2VT/VdJ+EF/180w25s
         LaJNwr4Mx2AiFEXV3Q+j13pmznOfas8DZF58nVOiOzUe/q0uaMxQBbcm30Y/pTgRQX1f
         RotQ==
X-Forwarded-Encrypted: i=1; AJvYcCXveJnr2M5dvJiSUL0GNwjhYdLK6XgjpnXa4jvF1lrkvirgPa12/7MKvO9etfyDwXERmtAbALJv7f8PsjdEgqie@lists.infradead.org
X-Gm-Message-State: AOJu0YzzEKNg8AsN88ANJZgsi70mbfDSTniEF1ro+UL9QiFsfJe5fn7a
	KARXsJtbyPnoyugegyyMxmvxPy6ywpYekk5ZfREFirx4iICcvKbk
X-Gm-Gg: ASbGnctQHVtb8PCV90EcR0icfPNlQOCHRl9hqnd5/Wnolpu496NEZCX9JAZfghqVSy7
	hnhDQqXmmPDaF79fNtT456ORIl8VVhp0juk+VfSqhLBv1yxlq9LS1oJ/PQpyKm+3Wx9eOKHxYvx
	nzrbCRWQpNPazTu/K1wivJrSeXmSEFocTkJ3duEPdJNH5V54llC6JkbgJPkFZAQhdVUsjw4Lx+j
	+kFjHC/TI4gfVEH1E9myqDrF7N6DbJpkE/nrP1o4NeD686BJFTQb1xsIxdFn0sOl/vQQ860Ryq2
	krGOs+mbLZIoC3dxdXjqaUY8AJfHwOKpA9bSu9lmGS8e89ZGXFyMwyXHLuWV5A/7XbAOxar6H/M
	=
X-Google-Smtp-Source: AGHT+IEKs+6jhZ985uIK+btCMwuIhDugVlaE5upqmp/6lm+E6MjhS8dGU3Cbrgnk209p7sVuYILBsg==
X-Received: by 2002:a05:600c:a110:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-4406815ee8cmr323245e9.21.1744879321536;
        Thu, 17 Apr 2025 01:42:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:42:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v8 3/4] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Date: Thu, 17 Apr 2025 09:40:14 +0100
Message-ID: <20250417084015.74154-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_014203_537603_0C823068 
X-CRM114-Status: GOOD (  24.03  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 146 ++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 3c820ef56775..2c99b23f0faa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
 	  This selects the Qualcomm ETHQOS glue layer support for the
 	  stmmac device driver.
 
+config DWMAC_RENESAS_GBETH
+	tristate "Renesas RZ/V2H(P) GBETH support"
+	default ARCH_RENESAS
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
+	help
+	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
+	  RZ/V2H(P) SoCs.
+
+	  This selects the Renesas RZ/V2H(P) Soc specific glue layer support
+	  for the stmmac device driver.
+
 config DWMAC_ROCKCHIP
 	tristate "Rockchip dwmac support"
 	default ARCH_ROCKCHIP
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 594883fb4164..91050215511b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
+obj-$(CONFIG_DWMAC_RENESAS_GBETH) += dwmac-renesas-gbeth.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
new file mode 100644
index 000000000000..9a774046455b
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
+ *
+ * The Rx and Tx clocks are supplied as follows for the GBETH IP.
+ *
+ *                         Rx / Tx
+ *   -------+------------- on / off -------
+ *          |
+ *          |            Rx-180 / Tx-180
+ *          +---- not ---- on / off -------
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include "stmmac_platform.h"
+
+struct renesas_gbeth {
+	struct plat_stmmacenet_data *plat_dat;
+	struct reset_control *rstc;
+	struct device *dev;
+};
+
+static const char *const renesas_gbeth_clks[] = {
+	"tx", "tx-180", "rx", "rx-180",
+};
+
+static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct renesas_gbeth *gbeth = priv;
+	int ret;
+
+	plat_dat = gbeth->plat_dat;
+
+	ret = reset_control_deassert(gbeth->rstc);
+	if (ret) {
+		dev_err(gbeth->dev, "Reset deassert failed\n");
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(plat_dat->num_clks,
+				      plat_dat->clks);
+	if (ret)
+		reset_control_assert(gbeth->rstc);
+
+	return ret;
+}
+
+static void renesas_gbeth_exit(struct platform_device *pdev, void *priv)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct renesas_gbeth *gbeth = priv;
+	int ret;
+
+	plat_dat = gbeth->plat_dat;
+
+	clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
+
+	ret = reset_control_assert(gbeth->rstc);
+	if (ret)
+		dev_err(gbeth->dev, "Reset assert failed\n");
+}
+
+static int renesas_gbeth_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct renesas_gbeth *gbeth;
+	unsigned int i;
+	int err;
+
+	err = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "failed to get resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "dt configuration failed\n");
+
+	gbeth = devm_kzalloc(dev, sizeof(*gbeth), GFP_KERNEL);
+	if (!gbeth)
+		return -ENOMEM;
+
+	plat_dat->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
+	plat_dat->clks = devm_kcalloc(dev, plat_dat->num_clks,
+				      sizeof(*plat_dat->clks), GFP_KERNEL);
+	if (!plat_dat->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < plat_dat->num_clks; i++)
+		plat_dat->clks[i].id = renesas_gbeth_clks[i];
+
+	err = devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks);
+	if (err < 0)
+		return err;
+
+	plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
+	if (!plat_dat->clk_tx_i)
+		return dev_err_probe(dev, -EINVAL,
+				     "error finding tx clock\n");
+
+	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(gbeth->rstc))
+		return PTR_ERR(gbeth->rstc);
+
+	gbeth->dev = dev;
+	gbeth->plat_dat = plat_dat;
+	plat_dat->bsp_priv = gbeth;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	plat_dat->init = renesas_gbeth_init;
+	plat_dat->exit = renesas_gbeth_exit;
+	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			   STMMAC_FLAG_SPH_DISABLE;
+
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,rzv2h-gbeth", },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
+
+static struct platform_driver renesas_gbeth_driver = {
+	.probe  = renesas_gbeth_probe,
+	.driver = {
+		.name		= "renesas-gbeth",
+		.of_match_table	= renesas_gbeth_match,
+	},
+};
+module_platform_driver(renesas_gbeth_driver);
+
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas GBETH DWMAC Specific Glue layer");
+MODULE_LICENSE("GPL");
-- 
2.49.0


