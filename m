Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB7AC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNe2RjMwKSYb7bSPUDDr1Bx9LiJECptd7lfy/+dVTj4=; b=0hSSksLaOaqGJ6NNwWlgHyfPHe
	qdntiJFhQ3xgqISkenTRZhTLFn2PQWTyw3hAzE0Et8zG30lHtNWP7usA3l1Dl92+lqLzAAtLX/bKr
	ip2dJhFer1ceOcNsQKJd9QNockVThYn2Sz9+mivlcb3rNnVRji96MpIW1lkmaO4lC2A21Bl1Z0oMK
	LTTED6fTpi8TxtLFos8nZOC2B37VMQWOxdorUW4+3GxSslFGYIXkAz5SSbR74ArrTJK8i5ypY2B8o
	XPPXSBX4J2DgmgIsL+kXgHYnltY6S2IdNiNcDloY4QJLJwj84C4UYzgAOteW27kR8pMoGKw2iFA6r
	+PZ7iVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5OB-00000008gI2-2XQF;
	Thu, 24 Jul 2025 23:30:15 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Vq-00000008bdM-3PGN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:34:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFAA710391E81;
	Fri, 25 Jul 2025 00:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753396444; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sNe2RjMwKSYb7bSPUDDr1Bx9LiJECptd7lfy/+dVTj4=;
	b=QkBtDEGY/l8ypDjI2ihsEquSLafPDKJNJqRwNQY0M1wBoQmNBL40OYPdnPgrja0fqwtZJP
	I2fonq1jmT5fMzlqbilfEMBZzoNI4fr2OrYmAeB/Q9GJPYgpiBc8KQyH8Kp65Z7A2yS/eR
	5PqWmGvtcg+RVBxBxX6dPldcJGmkVXYLIHHTybx/BIBKoJKBJJ9ySG8ampNaJFEUb03Qab
	/BJjcKypogdlzogQAyYiGlIVci4HYjLRv5Wn/x6oRPtWJHlWivJVP8d6stVJGvKuOwoCnO
	xRFZttOoZS/d4OlhAF3+Lcs42xyK3bnTv/3m76a1c58LateFiTLpFhpeIDfUcQ==
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Simon Horman <horms@kernel.org>,
	Lukasz Majewski <lukma@denx.de>
Subject: [net-next v16 08/12] net: mtip: Extend the L2 switch driver with management operations
Date: Fri, 25 Jul 2025 00:33:14 +0200
Message-Id: <20250724223318.3068984-9-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250724223318.3068984-1-lukma@denx.de>
References: <20250724223318.3068984-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_153407_138148_37A64AA0 
X-CRM114-Status: GOOD (  22.47  )
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

This patch provides function necessary for manging the L2 switch.

Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Changes for v13:
- New patch - created by excluding some code from large (i.e. v12 and
  earlier) MTIP driver

Changes for v14 - v16:
- None
---
 .../net/ethernet/freescale/mtipsw/Makefile    |   2 +-
 .../net/ethernet/freescale/mtipsw/mtipl2sw.c  |  31 ++
 .../net/ethernet/freescale/mtipsw/mtipl2sw.h  |  23 +
 .../ethernet/freescale/mtipsw/mtipl2sw_mgnt.c | 443 ++++++++++++++++++
 4 files changed, 498 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c

diff --git a/drivers/net/ethernet/freescale/mtipsw/Makefile b/drivers/net/ethernet/freescale/mtipsw/Makefile
index bd8ffb30939a..a99aaf6ddfb2 100644
--- a/drivers/net/ethernet/freescale/mtipsw/Makefile
+++ b/drivers/net/ethernet/freescale/mtipsw/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_FEC_MTIP_L2SW) += nxp-mtipl2sw.o
-nxp-mtipl2sw-objs := mtipl2sw.o
+nxp-mtipl2sw-objs := mtipl2sw.o mtipl2sw_mgnt.o
diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
index 7ccf467ad8ba..6d2e21ccf404 100644
--- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
+++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
@@ -474,8 +474,35 @@ static void mtip_config_switch(struct switch_enet_private *fep)
 
 	writel(0, fep->hwp + ESW_BKLR);
 
+	/* Do NOT disable learning */
+	mtip_port_learning_config(fep, 0, 0, 0);
+	mtip_port_learning_config(fep, 1, 0, 0);
+	mtip_port_learning_config(fep, 2, 0, 0);
+
+	/* Disable blocking */
+	mtip_port_blocking_config(fep, 0, 0);
+	mtip_port_blocking_config(fep, 1, 0);
+	mtip_port_blocking_config(fep, 2, 0);
+
 	writel(MCF_ESW_IMR_TXF | MCF_ESW_IMR_RXF,
 	       fep->hwp + ESW_IMR);
+
+	mtip_port_enable_config(fep, 0, 1, 1);
+	mtip_port_enable_config(fep, 1, 1, 1);
+	mtip_port_enable_config(fep, 2, 1, 1);
+
+	mtip_port_broadcast_config(fep, 0, 1);
+	mtip_port_broadcast_config(fep, 1, 1);
+	mtip_port_broadcast_config(fep, 2, 1);
+
+	/* Disable multicast receive on port 0 (MGNT) */
+	mtip_port_multicast_config(fep, 0, 0);
+	mtip_port_multicast_config(fep, 1, 1);
+	mtip_port_multicast_config(fep, 2, 1);
+
+	/* Setup VLANs to provide port separation */
+	if (!fep->br_offload)
+		mtip_switch_en_port_separation(fep);
 }
 
 static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
@@ -564,6 +591,10 @@ static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
 
 	skb_tx_timestamp(skb);
 
+	/* For port separation - force sending via specified port */
+	if (!fep->br_offload && port != 0)
+		mtip_forced_forward(fep, port, 1);
+
 	/* Trigger transmission start */
 	writel(MCF_ESW_TDAR_X_DES_ACTIVE, fep->hwp + ESW_TDAR);
 
diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h
index 8a3cce976476..7e5373823d43 100644
--- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h
+++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h
@@ -621,6 +621,29 @@ static inline int mtip_get_time(void)
 
 #define MTIP_PORT_FORWARDING_INIT 0xFF
 
+/* Switch Management functions */
+int mtip_vlan_input_process(struct switch_enet_private *fep,
+			    int port, int mode, unsigned short port_vlanid,
+			    int vlan_verify_en, int vlan_domain_num,
+			    int vlan_domain_port);
+int mtip_set_vlan_verification(struct switch_enet_private *fep, int port,
+			       int vlan_domain_verify_en,
+			       int vlan_discard_unknown_en);
+int mtip_port_multicast_config(struct switch_enet_private *fep, int port,
+			       bool enable);
+int mtip_vlan_output_process(struct switch_enet_private *fep, int port,
+			     int mode);
+void mtip_switch_en_port_separation(struct switch_enet_private *fep);
+void mtip_switch_dis_port_separation(struct switch_enet_private *fep);
+int mtip_port_broadcast_config(struct switch_enet_private *fep,
+			       int port, bool enable);
+int mtip_forced_forward(struct switch_enet_private *fep, int port, bool enable);
+int mtip_port_learning_config(struct switch_enet_private *fep, int port,
+			      bool disable, bool irq_adj);
+int mtip_port_blocking_config(struct switch_enet_private *fep, int port,
+			      bool enable);
 bool mtip_is_switch_netdev_port(const struct net_device *ndev);
+int mtip_port_enable_config(struct switch_enet_private *fep, int port,
+			    bool tx_en, bool rx_en);
 void mtip_clear_atable(struct switch_enet_private *fep);
 #endif /* __MTIP_L2SWITCH_H_ */
diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c
new file mode 100644
index 000000000000..2178b3d02d57
--- /dev/null
+++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  L2 switch Controller driver for MTIP block - switch MGNT
+ *
+ *  Copyright (C) 2025 DENX Software Engineering GmbH
+ *  Lukasz Majewski <lukma@denx.de>
+ *
+ *  Based on a previous work by:
+ *
+ *  Copyright 2010-2012 Freescale Semiconductor, Inc.
+ *  Alison Wang (b18965@freescale.com)
+ *  Jason Jin (Jason.jin@freescale.com)
+ *
+ *  Copyright (C) 2010-2013 Freescale Semiconductor, Inc. All Rights Reserved.
+ *  Shrek Wu (B16972@freescale.com)
+ */
+
+#include <linux/etherdevice.h>
+#include <linux/netdevice.h>
+#include <linux/platform_device.h>
+
+#include "mtipl2sw.h"
+
+int mtip_vlan_input_process(struct switch_enet_private *fep,
+			    int port, int mode, unsigned short port_vlanid,
+			    int vlan_verify_en, int vlan_domain_num,
+			    int vlan_domain_port)
+{
+	/* Only modes from 1 to 4 are valid*/
+	if (mode < 0 || mode > 4) {
+		dev_err(&fep->pdev->dev,
+			"%s: VLAN input processing mode (%d) not supported\n",
+			__func__, mode);
+		return -EINVAL;
+	}
+
+	if (port < 0 || port > 2) {
+		dev_err(&fep->pdev->dev, "%s: Port (%d) not supported!\n",
+			__func__, port);
+		return -EINVAL;
+	}
+
+	if (vlan_verify_en == 1 &&
+	    (vlan_domain_num < 0 || vlan_domain_num > 32)) {
+		dev_err(&fep->pdev->dev, "%s: Domain out of range\n", __func__);
+		return -EINVAL;
+	}
+
+	writel(FIELD_PREP(MCF_ESW_PID_VLANID_MASK, port_vlanid),
+	       fep->hwp + ESW_PID(port));
+	if (port == 0) {
+		if (vlan_verify_en == 1)
+			writel(FIELD_PREP(MCF_ESW_VRES_VLANID_MASK,
+					  port_vlanid) | MCF_ESW_VRES_P0,
+			       fep->hwp + ESW_VRES(vlan_domain_num));
+
+		writel(readl(fep->hwp + ESW_VIMEN) | MCF_ESW_VIMEN_EN0,
+		       fep->hwp + ESW_VIMEN);
+		writel(readl(fep->hwp + ESW_VIMSEL) |
+		       FIELD_PREP(MCF_ESW_VIMSEL_IM0_MASK, mode),
+		       fep->hwp + ESW_VIMSEL);
+	} else if (port == 1) {
+		if (vlan_verify_en == 1)
+			writel(FIELD_PREP(MCF_ESW_VRES_VLANID_MASK,
+					  port_vlanid) | MCF_ESW_VRES_P1,
+			       fep->hwp + ESW_VRES(vlan_domain_num));
+
+		writel(readl(fep->hwp + ESW_VIMEN) | MCF_ESW_VIMEN_EN1,
+		       fep->hwp + ESW_VIMEN);
+		writel(readl(fep->hwp + ESW_VIMSEL) |
+		       FIELD_PREP(MCF_ESW_VIMSEL_IM1_MASK, mode),
+		       fep->hwp + ESW_VIMSEL);
+	} else if (port == 2) {
+		if (vlan_verify_en == 1)
+			writel(FIELD_PREP(MCF_ESW_VRES_VLANID_MASK,
+					  port_vlanid) | MCF_ESW_VRES_P2,
+			       fep->hwp + ESW_VRES(vlan_domain_num));
+
+		writel(readl(fep->hwp + ESW_VIMEN) | MCF_ESW_VIMEN_EN2,
+		       fep->hwp + ESW_VIMEN);
+		writel(readl(fep->hwp + ESW_VIMSEL) |
+		       FIELD_PREP(MCF_ESW_VIMSEL_IM2_MASK, mode),
+		       fep->hwp + ESW_VIMSEL);
+	}
+
+	return 0;
+}
+
+int mtip_vlan_output_process(struct switch_enet_private *fep, int port,
+			     int mode)
+{
+	if (port < 0 || port > 2) {
+		dev_err(&fep->pdev->dev, "%s: Port (%d) not supported!\n",
+			__func__, port);
+		return -EINVAL;
+	}
+
+	if (port == 0) {
+		writel(readl(fep->hwp + ESW_VOMSEL) |
+		       FIELD_PREP(MCF_ESW_VOMSEL_OM0_MASK, mode),
+		       fep->hwp + ESW_VOMSEL);
+	} else if (port == 1) {
+		writel(readl(fep->hwp + ESW_VOMSEL) |
+		       FIELD_PREP(MCF_ESW_VOMSEL_OM1_MASK, mode),
+		       fep->hwp + ESW_VOMSEL);
+	} else if (port == 2) {
+		writel(readl(fep->hwp + ESW_VOMSEL) |
+		       FIELD_PREP(MCF_ESW_VOMSEL_OM2_MASK, mode),
+		       fep->hwp + ESW_VOMSEL);
+	}
+
+	return 0;
+}
+
+int mtip_set_vlan_verification(struct switch_enet_private *fep, int port,
+			       int vlan_domain_verify_en,
+			       int vlan_discard_unknown_en)
+{
+	if (port < 0 || port > 2) {
+		dev_err(&fep->pdev->dev, "%s: Port (%d) not supported!\n",
+			__func__, port);
+		return -EINVAL;
+	}
+
+	if (vlan_domain_verify_en == 1) {
+		if (port == 0)
+			writel(readl(fep->hwp + ESW_VLANV) | MCF_ESW_VLANV_VV0,
+			       fep->hwp + ESW_VLANV);
+		else if (port == 1)
+			writel(readl(fep->hwp + ESW_VLANV) | MCF_ESW_VLANV_VV1,
+			       fep->hwp + ESW_VLANV);
+		else if (port == 2)
+			writel(readl(fep->hwp + ESW_VLANV) | MCF_ESW_VLANV_VV2,
+			       fep->hwp + ESW_VLANV);
+	} else if (vlan_domain_verify_en == 0) {
+		if (port == 0)
+			writel(readl(fep->hwp + ESW_VLANV) & ~MCF_ESW_VLANV_VV0,
+			       fep->hwp + ESW_VLANV);
+		else if (port == 1)
+			writel(readl(fep->hwp + ESW_VLANV) & ~MCF_ESW_VLANV_VV1,
+			       fep->hwp + ESW_VLANV);
+		else if (port == 2)
+			writel(readl(fep->hwp + ESW_VLANV) & ~MCF_ESW_VLANV_VV2,
+			       fep->hwp + ESW_VLANV);
+	}
+
+	if (vlan_discard_unknown_en == 1) {
+		if (port == 0)
+			writel(readl(fep->hwp + ESW_VLANV) | MCF_ESW_VLANV_DU0,
+			       fep->hwp + ESW_VLANV);
+		else if (port == 1)
+			writel(readl(fep->hwp + ESW_VLANV) | MCF_ESW_VLANV_DU1,
+			       fep->hwp + ESW_VLANV);
+		else if (port == 2)
+			writel(readl(fep->hwp + ESW_VLANV) | MCF_ESW_VLANV_DU2,
+			       fep->hwp + ESW_VLANV);
+	} else if (vlan_discard_unknown_en == 0) {
+		if (port == 0)
+			writel(readl(fep->hwp + ESW_VLANV) & ~MCF_ESW_VLANV_DU0,
+			       fep->hwp + ESW_VLANV);
+		else if (port == 1)
+			writel(readl(fep->hwp + ESW_VLANV) & ~MCF_ESW_VLANV_DU1,
+			       fep->hwp + ESW_VLANV);
+		else if (port == 2)
+			writel(readl(fep->hwp + ESW_VLANV) & ~MCF_ESW_VLANV_DU2,
+			       fep->hwp + ESW_VLANV);
+	}
+
+	dev_dbg(&fep->pdev->dev, "%s: ESW_VLANV %#x\n", __func__,
+		readl(fep->hwp + ESW_VLANV));
+
+	return 0;
+}
+
+int mtip_port_multicast_config(struct switch_enet_private *fep,
+			       int port, bool enable)
+{
+	u32 reg = 0;
+
+	if (port < 0 || port > 2) {
+		dev_err(&fep->pdev->dev, "%s: Port (%d) not supported\n",
+			__func__, port);
+		return -EINVAL;
+	}
+
+	reg = readl(fep->hwp + ESW_DMCR);
+	if (enable) {
+		if (port == 0)
+			reg |= MCF_ESW_DMCR_P0;
+		else if (port == 1)
+			reg |= MCF_ESW_DMCR_P1;
+		else if (port == 2)
+			reg |= MCF_ESW_DMCR_P2;
+	} else {
+		if (port == 0)
+			reg &= ~MCF_ESW_DMCR_P0;
+		else if (port == 1)
+			reg &= ~MCF_ESW_DMCR_P1;
+		else if (port == 2)
+			reg &= ~MCF_ESW_DMCR_P2;
+	}
+
+	writel(reg, fep->hwp + ESW_DMCR);
+	return 0;
+}
+
+/* enable or disable port n tx or rx
+ * tx_en 0 disable port n tx
+ * tx_en 1 enable  port n tx
+ * rx_en 0 disable port n rx
+ * rx_en 1 enable  port n rx
+ */
+int mtip_port_enable_config(struct switch_enet_private *fep, int port,
+			    bool tx_en, bool rx_en)
+{
+	u32 reg = 0;
+
+	if (port < 0 || port > 2) {
+		dev_err(&fep->pdev->dev, "%s: Port (%d) not supported\n",
+			__func__, port);
+		return -EINVAL;
+	}
+
+	reg = readl(fep->hwp + ESW_PER);
+	if (tx_en) {
+		if (port == 0)
+			reg |= MCF_ESW_PER_TE0;
+		else if (port == 1)
+			reg |= MCF_ESW_PER_TE1;
+		else if (port == 2)
+			reg |= MCF_ESW_PER_TE2;
+	} else {
+		if (port == 0)
+			reg &= (~MCF_ESW_PER_TE0);
+		else if (port == 1)
+			reg &= (~MCF_ESW_PER_TE1);
+		else if (port == 2)
+			reg &= (~MCF_ESW_PER_TE2);
+	}
+
+	if (rx_en) {
+		if (port == 0)
+			reg |= MCF_ESW_PER_RE0;
+		else if (port == 1)
+			reg |= MCF_ESW_PER_RE1;
+		else if (port == 2)
+			reg |= MCF_ESW_PER_RE2;
+	} else {
+		if (port == 0)
+			reg &= (~MCF_ESW_PER_RE0);
+		else if (port == 1)
+			reg &= (~MCF_ESW_PER_RE1);
+		else if (port == 2)
+			reg &= (~MCF_ESW_PER_RE2);
+	}
+
+	writel(reg, fep->hwp + ESW_PER);
+	return 0;
+}
+
+void mtip_switch_en_port_separation(struct switch_enet_private *fep)
+{
+	u32 reg;
+
+	mtip_vlan_input_process(fep, 0, 3, 0x10, 1, 0, 0);
+	mtip_vlan_input_process(fep, 1, 3, 0x11, 1, 1, 0);
+	mtip_vlan_input_process(fep, 2, 3, 0x12, 1, 2, 0);
+
+	reg = readl(fep->hwp + ESW_VRES(0));
+	writel(reg | MCF_ESW_VRES_P1 | MCF_ESW_VRES_P2,
+	       fep->hwp + ESW_VRES(0));
+
+	reg = readl(fep->hwp + ESW_VRES(1));
+	writel(reg | MCF_ESW_VRES_P0, fep->hwp + ESW_VRES(1));
+
+	reg = readl(fep->hwp + ESW_VRES(2));
+	writel(reg | MCF_ESW_VRES_P0, fep->hwp + ESW_VRES(2));
+
+	dev_dbg(&fep->pdev->dev, "%s: VRES0: 0x%x\n",
+		__func__, readl(fep->hwp + ESW_VRES(0)));
+	dev_dbg(&fep->pdev->dev, "%s: VRES1: 0x%x\n", __func__,
+		readl(fep->hwp + ESW_VRES(1)));
+	dev_dbg(&fep->pdev->dev, "%s: VRES2: 0x%x\n", __func__,
+		readl(fep->hwp + ESW_VRES(2)));
+
+	mtip_set_vlan_verification(fep, 0, 1, 0);
+	mtip_set_vlan_verification(fep, 1, 1, 0);
+	mtip_set_vlan_verification(fep, 2, 1, 0);
+
+	mtip_vlan_output_process(fep, 0, 2);
+	mtip_vlan_output_process(fep, 1, 2);
+	mtip_vlan_output_process(fep, 2, 2);
+}
+
+void mtip_switch_dis_port_separation(struct switch_enet_private *fep)
+{
+	writel(0, fep->hwp + ESW_PID(0));
+	writel(0, fep->hwp + ESW_PID(1));
+	writel(0, fep->hwp + ESW_PID(2));
+
+	writel(0, fep->hwp + ESW_VRES(0));
+	writel(0, fep->hwp + ESW_VRES(1));
+	writel(0, fep->hwp + ESW_VRES(2));
+
+	writel(0, fep->hwp + ESW_VIMEN);
+	writel(0, fep->hwp + ESW_VIMSEL);
+	writel(0, fep->hwp + ESW_VLANV);
+	writel(0, fep->hwp + ESW_VOMSEL);
+}
+
+int mtip_port_broadcast_config(struct switch_enet_private *fep,
+			       int port, bool enable)
+{
+	u32 reg = 0;
+
+	if (port < 0 || port > 2) {
+		dev_err(&fep->pdev->dev, "%s: Port (%d) not supported\n",
+			__func__, port);
+		return -EINVAL;
+	}
+
+	reg = readl(fep->hwp + ESW_DBCR);
+	if (enable) {
+		if (port == 0)
+			reg |= MCF_ESW_DBCR_P0;
+		else if (port == 1)
+			reg |= MCF_ESW_DBCR_P1;
+		else if (port == 2)
+			reg |= MCF_ESW_DBCR_P2;
+	} else {
+		if (port == 0)
+			reg &= ~MCF_ESW_DBCR_P0;
+		else if (port == 1)
+			reg &= ~MCF_ESW_DBCR_P1;
+		else if (port == 2)
+			reg &= ~MCF_ESW_DBCR_P2;
+	}
+
+	writel(reg, fep->hwp + ESW_DBCR);
+	return 0;
+}
+
+/* The frame is forwarded to the forced destination ports.
+ * It only replace the MAC lookup function,
+ * all other filtering(eg.VLAN verification) act as normal
+ */
+int mtip_forced_forward(struct switch_enet_private *fep, int port, bool enable)
+{
+	u32 reg = 0;
+
+	if (port & ~GENMASK(1, 0)) {
+		dev_err(&fep->pdev->dev,
+			"%s: Forced forward for port(s): 0x%x not supported!\n",
+			__func__, port);
+		return -EINVAL;
+	}
+
+	/* Enable Forced forwarding for port(s) */
+	reg |= FIELD_PREP(MCF_ESW_P0FFEN_FD_MASK, port & GENMASK(1, 0));
+
+	if (enable)
+		reg |= MCF_ESW_P0FFEN_FEN;
+	else
+		reg &= ~MCF_ESW_P0FFEN_FEN;
+
+	writel(reg, fep->hwp + ESW_P0FFEN);
+	return 0;
+}
+
+int mtip_port_learning_config(struct switch_enet_private *fep, int port,
+			      bool disable, bool irq_adj)
+{
+	u32 reg = 0;
+
+	if (port < 0 || port > 2) {
+		dev_err(&fep->pdev->dev, "%s: Port (%d) not supported\n",
+			__func__, port);
+		return -EINVAL;
+	}
+
+	reg = readl(fep->hwp + ESW_BKLR);
+	if (disable) {
+		if (irq_adj)
+			writel(readl(fep->hwp + ESW_IMR) & ~MCF_ESW_IMR_LRN,
+			       fep->hwp + ESW_IMR);
+
+		if (port == 0)
+			reg |= MCF_ESW_BKLR_LD0;
+		else if (port == 1)
+			reg |= MCF_ESW_BKLR_LD1;
+		else if (port == 2)
+			reg |= MCF_ESW_BKLR_LD2;
+	} else {
+		if (irq_adj)
+			writel(readl(fep->hwp + ESW_IMR) | MCF_ESW_IMR_LRN,
+			       fep->hwp + ESW_IMR);
+
+		if (port == 0)
+			reg &= ~MCF_ESW_BKLR_LD0;
+		else if (port == 1)
+			reg &= ~MCF_ESW_BKLR_LD1;
+		else if (port == 2)
+			reg &= ~MCF_ESW_BKLR_LD2;
+	}
+
+	writel(reg, fep->hwp + ESW_BKLR);
+	dev_dbg(&fep->pdev->dev, "%s ESW_BKLR %#x, ESW_IMR %#x\n", __func__,
+		readl(fep->hwp + ESW_BKLR), readl(fep->hwp + ESW_IMR));
+
+	return 0;
+}
+
+int mtip_port_blocking_config(struct switch_enet_private *fep, int port,
+			      bool enable)
+{
+	u32 reg = 0;
+
+	if (port < 0 || port > 2) {
+		dev_err(&fep->pdev->dev, "%s: Port (%d) not supported\n",
+			__func__, port);
+		return -EINVAL;
+	}
+
+	reg = readl(fep->hwp + ESW_BKLR);
+	if (enable) {
+		if (port == 0)
+			reg |= MCF_ESW_BKLR_BE0;
+		else if (port == 1)
+			reg |= MCF_ESW_BKLR_BE1;
+		else if (port == 2)
+			reg |= MCF_ESW_BKLR_BE2;
+	} else {
+		if (port == 0)
+			reg &= ~MCF_ESW_BKLR_BE0;
+		else if (port == 1)
+			reg &= ~MCF_ESW_BKLR_BE1;
+		else if (port == 2)
+			reg &= ~MCF_ESW_BKLR_BE2;
+	}
+
+	writel(reg, fep->hwp + ESW_BKLR);
+	return 0;
+}
-- 
2.39.5


