Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E23CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZvPM2kK/iH8kxarqS+fsJRVggzGmH1040vRRo8BDmQ=; b=oq/T8r6Kiiev+La/eW6x7Hfihn
	i4p6HqrduDbX8tMm62kMC7IqCTRxkXGJF5Avk3Ts19qL/JrhOV3DSxHqGflDX1x9w67bFu+PMxAzI
	fK+/MPPT397S6hOdWC+vntgWlBZOP1TKf0wgDvnAn1UKFXT+Fm1mGwDbxb0cMPtGDnZWeUpf6uefz
	+gLE1hq5D4ytCtI1WN9YlXDHu2q1sVw9l8Qaxq1ti14J1qKBcYlFswJmMF/JoS7Uz92MuCFqJdr8h
	Qcb3dwrGUMYewlM5INO/GzFiqdb8BGDjG0NMg+Tvv1Li6Xtu8G1RDt9xcSQldT2lH4L1hoIdoO0yy
	QXFZaRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuVM-00000007Bpd-3mFm;
	Fri, 29 May 2026 10:31:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuVK-00000007Bnh-1B4N;
	Fri, 29 May 2026 10:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D3116056E;
	Fri, 29 May 2026 10:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED40AC2BCC6;
	Fri, 29 May 2026 10:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780050708;
	bh=i0kY+XePY2pwY14AeOvcQg6Ciu3E77/ceWwmA+lXhD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d1m1811CauOm/vRCWcyfA1b+8RAmz2nsbxE3zVV1i6tCJEtoIxTTXEFhec7a0C8Dk
	 xS87XNW/AaZlT/8QN/71h1Bk+i6obg2N+wxMstxzcNc4waVZOL3AzCqhSunbEIIwh2
	 3VC+bs+PaXDVj/32NMdlkhhDMSsxJsWnFqH+RcVlxkOLMeZ/z5rKhscXHBXIcAHXhA
	 8ob7aNFuaNsRP9zmyrCC9IlxT9AziUSe/QSCjY6LnrLoDM1LJd/nYLDFqAGTcOBGAP
	 +7I+PneysZTL9lylru9ibB1cN7CZPofKAAjimbwLzWOd93cYA6pdVcQFg64/jYQhnx
	 fFZALkxhiDokQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABF2CD5BD2;
	Fri, 29 May 2026 10:31:47 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Fri, 29 May 2026 18:31:41 +0800
Subject: [PATCH 02/11] net: wwan: t9xx: Add control plane transaction layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-t9xx_driver_v1-v1-2-bdbfe2c01e57@compal.com>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
In-Reply-To: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jack Wu <jackbb_wu@compal.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, 
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, 
 Minano Tseng <Minano.tseng@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780050704; l=7908;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=mLIfsfKkyn2fG6Qw+CqDeaQRZ5KuIjQhr1fHf+lulaQ=;
 b=l3UksZr4oiFC4yYYP+7iHUvA80m8Zq3m3YVh83FNd4FPnPO+Mk9z3olRi67SUo1x4KI8I0pbz
 Q8SWE6vf+QOBfHZs0ExWJRNlDB/Bu7lVHRDDbNSaIZHebJlHxInYprH
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
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
Reply-To: jackbb_wu@compal.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jack Wu <jackbb_wu@compal.com>

The control plane implements TX services that reside in the
transaction layer. The services receive the packets from the
port layer and call the corresponding DMA components to
transmit data to the device. Meanwhile, TX services receive
and manage the port control commands from the port layer.

The control plane implements RX services that reside in the
transaction layer. The services receive the downlink packets
from the modem and transfer the packets to the corresponding
port layer interfaces.

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 drivers/net/wwan/Kconfig                    |  5 ++++
 drivers/net/wwan/t9xx/Makefile              |  5 ++--
 drivers/net/wwan/t9xx/mtk_ctrl_plane.c      | 34 ++++++++++++++++++++++
 drivers/net/wwan/t9xx/mtk_ctrl_plane.h      | 22 +++++++++++++++
 drivers/net/wwan/t9xx/mtk_dev.c             | 44 +++++++++++++++++++++++++++++
 drivers/net/wwan/t9xx/mtk_dev.h             |  4 +++
 drivers/net/wwan/t9xx/pcie/Makefile         | 10 +++++++
 drivers/net/wwan/t9xx/pcie/mtk_pci.c        |  8 ++----
 drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h | 21 ++++++++++++++
 9 files changed, 146 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
index 4cee537c739f..d8be12fb988c 100644
--- a/drivers/net/wwan/Kconfig
+++ b/drivers/net/wwan/Kconfig
@@ -124,6 +124,7 @@ config MTK_T7XX
 config MTK_T9XX
 	tristate "MediaTek PCIe 5G WWAN modem T9xx device"
 	depends on PCI
+	select MTK_T9XX_PCI
 	select NET_DEVLINK
 	help
 	  Enables MediaTek PCIe based 5G WWAN modem (T9xx series) device.
@@ -133,6 +134,10 @@ config MTK_T9XX
 
 	  If unsure, say N.
 
+config MTK_T9XX_PCI
+	tristate
+	depends on PCI && MTK_T9XX
+
 endif # WWAN
 
 endmenu
diff --git a/drivers/net/wwan/t9xx/Makefile b/drivers/net/wwan/t9xx/Makefile
index 6f2dd3f91454..ae9d6f2344ab 100644
--- a/drivers/net/wwan/t9xx/Makefile
+++ b/drivers/net/wwan/t9xx/Makefile
@@ -4,7 +4,8 @@ ccflags-y += -I$(src)/pcie
 ccflags-y += -I$(src)
 
 obj-$(CONFIG_MTK_T9XX) += mtk_t9xx.o
+obj-$(CONFIG_MTK_T9XX_PCI) += pcie/
 
 mtk_t9xx-y := \
-	pcie/mtk_pci.o \
-	pcie/mtk_pci_drv_m9xx.o
+	mtk_dev.o \
+	mtk_ctrl_plane.o
diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.c b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
new file mode 100644
index 000000000000..ae5e1797b817
--- /dev/null
+++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022, MediaTek Inc.
+ * Copyright (c) 2022-2023, Intel Corporation.
+ */
+
+#include <linux/device.h>
+
+#include "mtk_ctrl_plane.h"
+
+int mtk_ctrl_init(struct mtk_md_dev *mdev)
+{
+	struct mtk_ctrl_blk *ctrl_blk;
+
+	ctrl_blk = devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNEL);
+	if (!ctrl_blk)
+		return -ENOMEM;
+
+	ctrl_blk->mdev = mdev;
+	mdev->ctrl_blk = ctrl_blk;
+
+	return 0;
+}
+EXPORT_SYMBOL(mtk_ctrl_init);
+
+int mtk_ctrl_exit(struct mtk_md_dev *mdev)
+{
+	struct mtk_ctrl_blk *ctrl_blk = mdev->ctrl_blk;
+
+	devm_kfree(mdev->dev, ctrl_blk);
+
+	return 0;
+}
+EXPORT_SYMBOL(mtk_ctrl_exit);
diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.h b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
new file mode 100644
index 000000000000..8276be19b456
--- /dev/null
+++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#ifndef __MTK_CTRL_PLANE_H__
+#define __MTK_CTRL_PLANE_H__
+
+#include <linux/kref.h>
+#include <linux/skbuff.h>
+
+#include "mtk_dev.h"
+
+struct mtk_ctrl_blk {
+	struct mtk_md_dev *mdev;
+	struct mtk_ctrl_trans *trans;
+};
+
+int mtk_ctrl_init(struct mtk_md_dev *mdev);
+int mtk_ctrl_exit(struct mtk_md_dev *mdev);
+
+#endif /* __MTK_CTRL_PLANE_H__ */
diff --git a/drivers/net/wwan/t9xx/mtk_dev.c b/drivers/net/wwan/t9xx/mtk_dev.c
new file mode 100644
index 000000000000..f254ca7ed877
--- /dev/null
+++ b/drivers/net/wwan/t9xx/mtk_dev.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#include <linux/module.h>
+
+#include "mtk_dev.h"
+
+struct mtk_md_dev *mtk_dev_alloc(struct device *pdev, const struct mtk_dev_ops *dev_ops)
+{
+	struct mtk_md_dev *mdev;
+
+	mdev = devm_kzalloc(pdev, sizeof(*mdev), GFP_KERNEL);
+	if (!mdev)
+		return NULL;
+
+	mdev->dev_ops = dev_ops;
+	mdev->dev = pdev;
+	return mdev;
+}
+EXPORT_SYMBOL(mtk_dev_alloc);
+
+void mtk_dev_free(struct mtk_md_dev *mdev)
+{
+	struct device *dev = mdev->dev;
+
+	devm_kfree(dev, mdev);
+}
+EXPORT_SYMBOL(mtk_dev_free);
+
+static int __init mtk_common_drv_init(void)
+{
+	return 0;
+}
+module_init(mtk_common_drv_init);
+
+static void __exit mtk_common_drv_exit(void)
+{
+}
+module_exit(mtk_common_drv_exit);
+
+MODULE_DESCRIPTION("MediaTek T9xx PCIe WWAN driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/wwan/t9xx/mtk_dev.h b/drivers/net/wwan/t9xx/mtk_dev.h
index 8278a0e2875e..37eec1a358fa 100644
--- a/drivers/net/wwan/t9xx/mtk_dev.h
+++ b/drivers/net/wwan/t9xx/mtk_dev.h
@@ -57,6 +57,7 @@ struct mtk_md_dev {
 	void *hw_priv;
 	u32 hw_ver;
 	char dev_str[MTK_DEV_STR_LEN];
+	void *ctrl_blk;
 };
 
 static inline u32 mtk_dev_get_dev_state(struct mtk_md_dev *mdev)
@@ -105,4 +106,7 @@ static inline int mtk_dev_send_dev_evt(struct mtk_md_dev *mdev, u32 dev_evt)
 	return mdev->dev_ops->send_dev_evt(mdev, dev_evt);
 }
 
+struct mtk_md_dev *mtk_dev_alloc(struct device *pdev, const struct mtk_dev_ops *dev_ops);
+void mtk_dev_free(struct mtk_md_dev *mdev);
+
 #endif /* __MTK_DEV_H__ */
diff --git a/drivers/net/wwan/t9xx/pcie/Makefile b/drivers/net/wwan/t9xx/pcie/Makefile
new file mode 100644
index 000000000000..7410d1796d27
--- /dev/null
+++ b/drivers/net/wwan/t9xx/pcie/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+ccflags-y += -I$(src)
+ccflags-y += -I$(src)/..
+
+obj-$(CONFIG_MTK_T9XX_PCI) += mtk_t9xx_pcie.o
+
+mtk_t9xx_pcie-y := \
+	mtk_pci_drv_m9xx.o \
+	mtk_pci.o
diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
index adec3ccdee08..518c32d55643 100644
--- a/drivers/net/wwan/t9xx/pcie/mtk_pci.c
+++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 
 #include "mtk_dev.h"
+#include "mtk_trans_ctrl.h"
 #include "mtk_pci.h"
 #include "mtk_pci_reg.h"
 
@@ -385,8 +386,7 @@ static u32 mtk_pci_ext_h2d_evt_hw_bits(u32 chs)
 
 	SET_HW_BITS(hw_bits, chs, MHCCIF_RC2EP_EVT_DEVICE_RESET,
 		    DEV_EVT_H2D_DEVICE_RESET);
-	SET_HW_BITS(hw_bits, chs, MHCCIF_RC2EP_EVT_DRM_DISABLE_AP,
-		    EXT_EVT_H2D_DRM_DISABLE_AP);
+
 	return LE32_TO_U32(cpu_to_le32(hw_bits));
 }
 
@@ -779,13 +779,11 @@ static int mtk_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct mtk_md_dev *mdev;
 	int ret;
 
-	mdev = devm_kzalloc(dev, sizeof(*mdev), GFP_KERNEL);
+	mdev = mtk_dev_alloc(dev, &pci_hw_ops);
 	if (!mdev) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	mdev->dev_ops = &pci_hw_ops;
-	mdev->dev = dev;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
diff --git a/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
new file mode 100644
index 000000000000..d6de4c43b529
--- /dev/null
+++ b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#ifndef __MTK_TRANS_CTRL_H__
+#define __MTK_TRANS_CTRL_H__
+
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/skbuff.h>
+#include <linux/types.h>
+
+#include "mtk_dev.h"
+
+struct mtk_ctrl_trans {
+	struct mtk_ctrl_blk *ctrl_blk;
+	struct mtk_md_dev *mdev;
+};
+
+#endif

-- 
2.34.1



