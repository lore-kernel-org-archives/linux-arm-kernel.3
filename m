Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF8AD1950C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I8NCqtdKCDQg/h+vlP7+WRT2HIbB0HaXTUJf1+ishbw=; b=i2lvBcty8+fgUkL41MiIDP2zlv
	sqX4kNfuQ2tdcsk2hEoOfmzcqWuPUzK7UnPwYlAe0IdShrb2n19X9ocGPTLw+IoSvPz973kZzbFGn
	ddIPP5vERaFQ1LiUwLd6+rKRH4ClBjoJ7URiGSs9LwFBx1/juj6B9Ep/y90yWd8XI4lbL/uQgyJVx
	hAjagAMQPjWsn2NfI70ykt5hTdGn23apOrsOgo/7Bec8Rea8GXv91Lp8MzoNyokCLuXZ4bFd4y+PV
	wxtNl76m1nrMf0hS9UaHD59hMHcBhJt+CVKDnBB0yaNZVImnxTThpOMyYPDom2un4WAcSZjdnK67y
	SWcpkJyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQL2-0000000Cy0T-2Ll4;
	Mon, 26 Jan 2026 17:25:20 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQL0-0000000Cxzp-2BjV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:25:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-435903c4040so2915081f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 09:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769448316; x=1770053116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8NCqtdKCDQg/h+vlP7+WRT2HIbB0HaXTUJf1+ishbw=;
        b=Z9zO9BVdl/pfwG+Dhxt4fsH5QvHiX++q8XPrMUPoig5yoqo7xDuQguMj6rOuBKDAB8
         KnIgvWnLYJDOVVrPAx8K9DXhJZ3ceE4GJYWanOA+o9GAVIxPzJh4Qsx4g2CPel1gQpFX
         tXCaY+C9X04CvzZie72vIjqzH7KAMe9wm0If4R1ry/Eatbfx4ZQjKrygs9Jp+qhgSkfN
         1Nj3KmZzqW6ckwEwjXpqMJFvKsj4Qe9aJxyQTgSOeHVb40VT56eCjN5j48Lh4/GzYoJt
         2lTOXMRZ7VIl+dv1Ri3TeJvv6BTuyoAVxk/h+NDNbCQRDe6VWPJrPtQ/61Q9pJNS3/XJ
         Exrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448316; x=1770053116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8NCqtdKCDQg/h+vlP7+WRT2HIbB0HaXTUJf1+ishbw=;
        b=j+McSC94AKI1OmsjMVxMeyMSnraMvkitwwocSzLxpGh5z4ws13vd2uh/ck9oh7cMWj
         FejRUU6QQsbtYbMxz0glEZPtXGt3cGXWeEsL/dOpkUNpHaAGrKx0CIkd7DLZA71tWEIr
         VtTNe1yFnAq1ZjQt9DYWUaZJRO7pPgIiZRHeCpHO+MrqYn7j5h0HzZ8fF8Q5Q2F4ZkcH
         YAIh7dshIWi5GG2ugHj1sZ5tDOVPkFiTdSLb2UWarwbxKL0NewNrg2GCERa3EtZci7MN
         o93aob4bG12DtzFjLi7QKutbu7+lmvFIKlajwOrAmegKHPHGh3yMq65u4YlXxWJPZTM7
         yuNw==
X-Forwarded-Encrypted: i=1; AJvYcCW6VQ8S8YV/4PdKxyknFXdHByvSEb16DcUiaChWwy1Ot7w+THvKMUshfD61a6E1MSVTtSi9x1WTBnkEXUHfC2EY@lists.infradead.org
X-Gm-Message-State: AOJu0YzWo2hJdfKbDxo8fIj9AIe3k7mNnBaIYzw1ks4T/dNXJj1ONXn2
	SX/obBacpWvzzJQX/7huRsF9MQN98tZFn2q6UaDS0EJ7vk61bSPx1Cwd
X-Gm-Gg: AZuq6aIEyOO18A87ntEZb0EGU65BqhjnjeEzoQXfNZ/uxL7aWvpW9Rs4rM8a8wEvE2Q
	4Q2eXTMQfXRbTUlVQEZ40h2A4Wbx0ZB6ednavjtqbtdKnxfuL+PDEWgLUgrCI962eY1XotbF+fO
	rT+uNAZYOfEK7j/7Gurd+JilrEg3EkjdEszdhXYg9x1I+7KzDeNBdYu+Dq4qJmvEns5eoIxE+/p
	671IsCEfzI7S4RHPpXAlB3Ob0we1oNCBMRK25HUR2FSk3ky65OeCM6IsHopSIOKZBRdpVzb9/nI
	RZN9I9qn26o2R+bML9539CVJ2f9dPygWiw4ellpYiMgiMZw1IbxK8CVg+EEE2uV/5FqmjdN+jiS
	tVpDsQQhc72GKCr1x1Gnym41Jt29XQM9z0aZBCPKoynka7USFfTy4k4WDyv/WQKAQicd5wrx1Ab
	gBsNHwspZ3rnJgwApRi99aR/qpV+JM666kclgx0d011LB8bQmSR7EyHFwacj52/iTj6yL55ADk8
	KYYV2+rfZasEDz0+mw3ljElT8pDCo0FbE+j+sBHw/oB
X-Received: by 2002:a05:6000:2889:b0:435:9e32:2b78 with SMTP id ffacd0b85a97d-435ca0f7b5cmr7897753f8f.1.1769448315992;
        Mon, 26 Jan 2026 09:25:15 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:6788:ac2b:89cc:7ade])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm31288531f8f.11.2026.01.26.09.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:25:15 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC address across unconditional reset
Date: Mon, 26 Jan 2026 17:25:03 +0000
Message-ID: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_092518_603039_40F73C41 
X-CRM114-Status: GOOD (  24.14  )
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

Commit 90f522a20e3d1 ("NET: dwmac: Make dwmac reset unconditional")
asserts a reset in probe when a reset controller is present. This reset
clears the MAC address registers, so a valid address programmed by the
bootloader gets lost and the driver falls back to a random address.

Read the MAC address from the hardware registers before resetting the
hardware. Keep the existing address selection logic when no valid
address is found, and program the selected address back into the MAC
after probe so it remains consistent in hardware.

Export stmmac_bus_clks_config() so the early read path can enable the
bus clocks before accessing the MAC registers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi all,

Sending this patch as an RFC if there is an alternative/better way to
achieve this.

Cheers,
Prabhakar
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 66 ++++++++++++++++++-
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  3 +-
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  2 +
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 347a0078f622..171bf08d6242 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -44,6 +44,7 @@
 #include <net/page_pool/helpers.h>
 #include <net/pkt_cls.h>
 #include <net/xdp_sock_drv.h>
+#include "stmmac_platform.h"
 #include "stmmac_ptp.h"
 #include "stmmac_fpe.h"
 #include "stmmac.h"
@@ -7659,11 +7660,65 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
 
+static int stmmac_read_mac_before_reset(struct stmmac_priv *priv,
+					u8 *mac_addr)
+{
+	unsigned int hi_addr, lo_addr;
+	int ret;
+
+	eth_zero_addr(mac_addr);
+
+	/* Deassert reset to allow hardware access */
+	if (priv->plat->stmmac_rst) {
+		ret = reset_control_deassert(priv->plat->stmmac_rst);
+		if (ret)
+			return ret;
+	}
+
+	/* Enable bus clocks to read MAC address */
+	ret = stmmac_bus_clks_config(priv, true);
+	if (ret) {
+		dev_warn(priv->device, "failed to enable clocks: %d\n", ret);
+		goto assert_reset;
+	}
+
+	switch (priv->plat->core_type) {
+	case DWMAC_CORE_GMAC4:
+	case DWMAC_CORE_XGMAC:
+		/* GMAC4/XGMAC: MAC Address0 High/Low Register */
+		hi_addr = 0x300;  /* GMAC_ADDR_HIGH(0) */
+		lo_addr = 0x304;  /* GMAC_ADDR_LOW(0) */
+		break;
+	case DWMAC_CORE_GMAC:
+	case DWMAC_CORE_MAC100:
+		/* GMAC/GMAC3/MAC100: MAC Address0 High/Low Register */
+		hi_addr = 0x40;   /* GMAC_ADDR_HIGH(0) */
+		lo_addr = 0x44;   /* GMAC_ADDR_LOW(0) */
+		break;
+	default:
+		hi_addr = 0;
+	}
+
+	if (hi_addr)
+		stmmac_get_mac_addr(priv->ioaddr, mac_addr, hi_addr, lo_addr);
+
+	ret = 0;
+
+	stmmac_bus_clks_config(priv, false);
+
+assert_reset:
+	if (priv->plat->stmmac_rst)
+		reset_control_assert(priv->plat->stmmac_rst);
+
+	return ret;
+}
+
 static int __stmmac_dvr_probe(struct device *device,
 			      struct plat_stmmacenet_data *plat_dat,
 			      struct stmmac_resources *res)
 {
 	struct net_device *ndev = NULL;
+	u8 saved_mac_addr[ETH_ALEN];
 	struct stmmac_priv *priv;
 	u32 rxq;
 	int i, ret = 0;
@@ -7740,6 +7795,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	if ((phyaddr >= 0) && (phyaddr <= 31))
 		priv->plat->phy_addr = phyaddr;
 
+	/* Save MAC address before reset (if bootloader programmed it) */
+	stmmac_read_mac_before_reset(priv, saved_mac_addr);
+
 	if (priv->plat->stmmac_rst) {
 		ret = reset_control_assert(priv->plat->stmmac_rst);
 		reset_control_deassert(priv->plat->stmmac_rst);
@@ -7768,7 +7826,13 @@ static int __stmmac_dvr_probe(struct device *device,
 	if (priv->synopsys_id < DWMAC_CORE_5_20)
 		priv->plat->dma_cfg->dche = false;
 
-	stmmac_check_ether_addr(priv);
+	if (is_valid_ether_addr(saved_mac_addr))
+		eth_hw_addr_set(priv->dev, saved_mac_addr);
+	else
+		stmmac_check_ether_addr(priv);
+
+	/* Store the MAC address in hardware */
+	stmmac_set_umac_addr(priv, priv->hw, priv->dev->dev_addr, 0);
 
 	ndev->netdev_ops = &stmmac_netdev_ops;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..6f0393f2992d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -857,7 +857,7 @@ void stmmac_pltfr_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
 
-static int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
+int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
 	int ret;
@@ -888,6 +888,7 @@ static int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(stmmac_bus_clks_config);
 
 static int __maybe_unused stmmac_runtime_suspend(struct device *dev)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index 6e6561e29d6e..2d52197020a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -20,6 +20,8 @@ struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res);
 
+int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled);
+
 int stmmac_pltfr_probe(struct platform_device *pdev,
 		       struct plat_stmmacenet_data *plat,
 		       struct stmmac_resources *res);
-- 
2.52.0


