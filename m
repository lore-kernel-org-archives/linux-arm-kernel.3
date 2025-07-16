Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A8AC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 22:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BNzi9pF6pKSeNX9iple8zeYVhieZk3Cx6DiJRZiQRU=; b=rPBIarIm1o03Ou3V5ukvYi8zPa
	f5MFKB/3EVfSclJOGl16V1X6R71kkCzEIhEu4HNzz0cfmR+ozVR0WPA8iY8NT/e+9aMo7+vvBzj0t
	S6ydO08fRbw8mewgrmGDZcbNreF5Barja75tTXzJ4zqDrr/u+OxKbnS9Y4C0oQUk+ag23N5029JGz
	JgAtndTl0DfJs4ejWqjU9WTcrcKaobb7OW5hvJCChUBHze8ZugCdY6zx8VIhmMtxKdDDUOt5hWAaK
	qS0oebE9JHmChdmgIVeriTSnQ7+tLt7Su6Rwm/babGeCWH7wY5OehM2+Hz5Kb6g+Fx0ZkofulGSf/
	uvSZXRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAN5-00000008ltc-2zLY;
	Wed, 16 Jul 2025 22:13:03 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9z8-00000008ioz-3Xhr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 21:48:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68FC010272378;
	Wed, 16 Jul 2025 23:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1752702497; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6BNzi9pF6pKSeNX9iple8zeYVhieZk3Cx6DiJRZiQRU=;
	b=Ziq+bHueghFNT0SFeHvzKPCtZ3wptySDz8k08jCtqrt59/6Cv5ITKlxfuQj9NimpO+vhTV
	okV9ZIC41vCPOhF2y82wOXBZE1DP94p3n4FsPalnUskHiRMyzlZUKgTcstVrYEJZQr7FRR
	OEYKnmss4LOgTDRwdNJrxkgWJYVtfv7DCqJ3ITPiRvuXP+6IpZf8fvRsxPeC0bhQ1dRfUF
	5VzhHmMmMMu8IwOR91JmcZvIA3xJgzJ9VxhY5bkJkLQG5QGgHwFeC6EL1T/XpXWnAz8iAB
	PUDp/fDsZF1d4DR0IonG1SDok5ViAJv5PIOKHC6GuLkCHMkCfKUZI/YoZ3v2qQ==
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
Subject: [net-next v15 09/12] net: mtip: Extend the L2 switch driver for imx287 with bridge operations
Date: Wed, 16 Jul 2025 23:47:28 +0200
Message-Id: <20250716214731.3384273-10-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716214731.3384273-1-lukma@denx.de>
References: <20250716214731.3384273-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_144819_170566_F9E61FD7 
X-CRM114-Status: GOOD (  21.65  )
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

After this change the MTIP L2 switch can be configured as offloading
device for packet switching when bridge on their interfaces is created.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---

Changes for v13:
- New patch - created by excluding some code from large (i.e. v12 and
  earlier) MTIP driver

Changes for v14:
- None

Changes for v15:
- None
---
 .../net/ethernet/freescale/mtipsw/Makefile    |   2 +-
 .../net/ethernet/freescale/mtipsw/mtipl2sw.c  |   6 +
 .../net/ethernet/freescale/mtipsw/mtipl2sw.h  |   2 +
 .../ethernet/freescale/mtipsw/mtipl2sw_br.c   | 120 ++++++++++++++++++
 4 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c

diff --git a/drivers/net/ethernet/freescale/mtipsw/Makefile b/drivers/net/ethernet/freescale/mtipsw/Makefile
index a99aaf6ddfb2..81e2b0e03e6c 100644
--- a/drivers/net/ethernet/freescale/mtipsw/Makefile
+++ b/drivers/net/ethernet/freescale/mtipsw/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_FEC_MTIP_L2SW) += nxp-mtipl2sw.o
-nxp-mtipl2sw-objs := mtipl2sw.o mtipl2sw_mgnt.o
+nxp-mtipl2sw-objs := mtipl2sw.o mtipl2sw_mgnt.o mtipl2sw_br.o
diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
index 05e7fcba5c48..a0bcd5e025b7 100644
--- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
+++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
@@ -1883,6 +1883,10 @@ static int mtip_sw_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Could not alloc IRQ\n");
 
+	ret = mtip_register_notifiers(fep);
+	if (ret)
+		return ret;
+
 	ret = mtip_ndev_init(fep, pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "%s: Failed to create virtual ndev (%d)\n",
@@ -1914,6 +1918,7 @@ static int mtip_sw_probe(struct platform_device *pdev)
  dma_init_err:
 	mtip_ndev_cleanup(fep);
  ndev_init_err:
+	mtip_unregister_notifiers(fep);
 
 	return ret;
 }
@@ -1922,6 +1927,7 @@ static void mtip_sw_remove(struct platform_device *pdev)
 {
 	struct switch_enet_private *fep = platform_get_drvdata(pdev);
 
+	mtip_unregister_notifiers(fep);
 	mtip_ndev_cleanup(fep);
 
 	mtip_mii_remove(fep);
diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h
index a8fb8c4e1351..a126f6b60d7f 100644
--- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h
+++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h
@@ -644,6 +644,8 @@ int mtip_port_learning_config(struct switch_enet_private *fep, int port,
 int mtip_port_blocking_config(struct switch_enet_private *fep, int port,
 			      bool enable);
 bool mtip_is_switch_netdev_port(const struct net_device *ndev);
+int mtip_register_notifiers(struct switch_enet_private *fep);
+void mtip_unregister_notifiers(struct switch_enet_private *fep);
 int mtip_port_enable_config(struct switch_enet_private *fep, int port,
 			    bool tx_en, bool rx_en);
 void mtip_clear_atable(struct switch_enet_private *fep);
diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c
new file mode 100644
index 000000000000..edfd95a7790d
--- /dev/null
+++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  L2 switch Controller driver for MTIP block - bridge network interface
+ *
+ *  Copyright (C) 2025 DENX Software Engineering GmbH
+ *  Lukasz Majewski <lukma@denx.de>
+ */
+
+#include <linux/etherdevice.h>
+#include <linux/netdevice.h>
+#include <linux/platform_device.h>
+
+#include "mtipl2sw.h"
+
+static int mtip_ndev_port_link(struct net_device *ndev,
+			       struct net_device *br_ndev,
+			       struct netlink_ext_ack *extack)
+{
+	struct mtip_ndev_priv *priv = netdev_priv(ndev), *other_priv;
+	struct switch_enet_private *fep = priv->fep;
+	struct net_device *other_ndev;
+
+	/* Check if one port of MTIP switch is already bridged */
+	if (fep->br_members && !fep->br_offload) {
+		/* Get the second bridge ndev */
+		other_ndev = fep->ndev[fep->br_members - 1];
+		other_priv = netdev_priv(other_ndev);
+		if (other_priv->master_dev != br_ndev) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "L2 offloading only possible for the same bridge!");
+			return notifier_from_errno(-EOPNOTSUPP);
+		}
+
+		fep->br_offload = 1;
+		mtip_switch_dis_port_separation(fep);
+		mtip_clear_atable(fep);
+	}
+
+	if (!priv->master_dev)
+		priv->master_dev = br_ndev;
+
+	fep->br_members |= BIT(priv->portnum - 1);
+
+	dev_dbg(&ndev->dev,
+		"%s: ndev: %s br: %s fep: %p members: 0x%x offload: %d\n",
+		__func__, ndev->name,  br_ndev->name, fep, fep->br_members,
+		fep->br_offload);
+
+	return NOTIFY_DONE;
+}
+
+static void mtip_netdevice_port_unlink(struct net_device *ndev)
+{
+	struct mtip_ndev_priv *priv = netdev_priv(ndev);
+	struct switch_enet_private *fep = priv->fep;
+
+	dev_dbg(&ndev->dev, "%s: ndev: %s members: 0x%x\n", __func__,
+		ndev->name, fep->br_members);
+
+	fep->br_members &= ~BIT(priv->portnum - 1);
+	priv->master_dev = NULL;
+
+	if (fep->br_members && fep->br_offload) {
+		fep->br_offload = 0;
+		mtip_switch_en_port_separation(fep);
+		mtip_clear_atable(fep);
+	}
+}
+
+/* netdev notifier */
+static int mtip_netdevice_event(struct notifier_block *unused,
+				unsigned long event, void *ptr)
+{
+	struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
+	struct netdev_notifier_changeupper_info *info = ptr;
+	struct netlink_ext_ack *extack;
+	int ret = NOTIFY_DONE;
+
+	if (!mtip_is_switch_netdev_port(ndev))
+		return NOTIFY_DONE;
+
+	extack = netdev_notifier_info_to_extack(&info->info);
+
+	switch (event) {
+	case NETDEV_CHANGEUPPER:
+		if (!netif_is_bridge_master(info->upper_dev))
+			break;
+
+		if (info->linking)
+			ret = mtip_ndev_port_link(ndev, info->upper_dev,
+						  extack);
+		else
+			mtip_netdevice_port_unlink(ndev);
+
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	return notifier_from_errno(ret);
+}
+
+static struct notifier_block mtip_netdevice_nb __read_mostly = {
+	.notifier_call = mtip_netdevice_event,
+};
+
+int mtip_register_notifiers(struct switch_enet_private *fep)
+{
+	int ret = register_netdevice_notifier(&mtip_netdevice_nb);
+
+	if (ret)
+		dev_err(&fep->pdev->dev, "can't register netdevice notifier\n");
+
+	return ret;
+}
+
+void mtip_unregister_notifiers(struct switch_enet_private *fep)
+{
+	unregister_netdevice_notifier(&mtip_netdevice_nb);
+}
-- 
2.39.5


