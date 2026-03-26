Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8AD10A3D81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+p4pxfx3aecFf1jcljxVcZ8DPw75vCS0BNhnP3haqmw=; b=wGhe7RnWmqqST16wybFUIKwYRH
	g3guuml7WSbBFIJXDbaApB/YO2jzMIsolCePRZvb3PSzmYLyA9wsPaVAkhNtLzw4NHkopvroYxCw8
	iCdbHgMqtp8rjMvOQq0zfUA+sEDmugzVFtQzEd1jcH7jqLmu0af/dWAkCZW595p/Gu8vC0gq6xh6r
	Iq4ptIVsqqGrWUAElFKXyL0d5im509L4SEj6QUAp+iGRKsaLl01nyv3QRErc4DYE+cCUA8Gr5CChN
	4aWmTC59h03AH8YFobeFP8h6yFvjPFHbawjhXlnAwoZ8q5v0elDyrN21PZCXbXXt57x6b5Pq/9Vwc
	gY3ZmThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jSz-00000005Oxh-259w;
	Thu, 26 Mar 2026 12:05:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jSx-00000005Ovl-0sdV;
	Thu, 26 Mar 2026 12:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774526732;
	bh=NihN73nX4Vo6b33p6sv55lawetyANmkKtj9GSk6TAPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JIKVgHPpvBaQswcqC7BG0fi+ByVeAo4SNGX7S3ABsYlx4aI1C3oONp1ZTocwS66BM
	 HwyoorwLvXFKS1S2wKCJK2o4lU7rHd85r9ehGMiM7+i+FB1aYG/MebFJJNk6zf4IcI
	 evHL+GjUs0EAOOBl4r7vfKv97VH4hL1xZkrSCTXKmfGyQfeyt9m94NqNjcV+v/VYlG
	 e4K8K7gMxvyFrEOJqmR5yxlFnmfzxJr85XXvm5hKxGleM/Wr7aVk8l8ub4IELG3VHe
	 +O1yTbC4pEqR0yqz1GsMuRTqNYNbbKv8SLxQf9x4oWJmsHhvHCYG07/mwHJXx34SdM
	 m7+y+VhP6+NOg==
Received: from yukiji.home (lfbn-idf1-1-2269-27.w92-151.abo.wanadoo.fr [92.151.67.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D878517E60BF;
	Thu, 26 Mar 2026 13:05:31 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 26 Mar 2026 13:04:13 +0100
Subject: [PATCH net-next v2 2/4] net: phy: Add Airoha phy library for
 shared code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-add-airoha-an8801-support-v2-2-1a42d6b6050f@collabora.com>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
In-Reply-To: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com, 
 matthias.bgg@gmail.com, kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774526729; l=4772;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=NihN73nX4Vo6b33p6sv55lawetyANmkKtj9GSk6TAPU=;
 b=vTFeCSNE/LeYsMxRsqGBiAJjhzyloUxyF6nTfkp2mFJLedPhcK5la7iyrFSJOfJ/+6un9NoXP
 hDLh2FYhYcgCbdiUKBAYcCbnAN+ZFZ53bivo4UQsKSsf74fGph0+ACj
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_050535_396105_6770AA56 
X-CRM114-Status: GOOD (  15.46  )
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

In preparation of Airoha AN8801R PHY support, split out the interface
functions that will be common between the already present air_en8811h
driver and the new one, and put them into a new library named
air_phy_lib.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/phy/Kconfig       |  6 ++++++
 drivers/net/phy/Makefile      |  1 +
 drivers/net/phy/air_en8811h.c | 13 ++-----------
 drivers/net/phy/air_phy_lib.c | 30 ++++++++++++++++++++++++++++++
 drivers/net/phy/air_phy_lib.h | 14 ++++++++++++++
 5 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index b5ee338b620d53980fbec9e83ab0de3d96ab4cc9..b6b1cde7e51fa1e470bfe210c8764a193449acb5 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -92,10 +92,16 @@ config AS21XXX_PHY
 
 config AIR_EN8811H_PHY
 	tristate "Airoha EN8811H 2.5 Gigabit PHY"
+	select AIR_NET_PHYLIB
 	select PHY_COMMON_PROPS
 	help
 	  Currently supports the Airoha EN8811H PHY.
 
+config AIR_NET_PHYLIB
+	tristate
+	help
+	  Airoha Ethernet PHY common library
+
 config AMD_PHY
 	tristate "AMD and Altima PHYs"
 	help
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 05e4878af27abeae3dfd9ab18fd29f8bf788b2a4..7cf1fa9e12cb6073a9e68c0ffa6284b361b80487 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -30,6 +30,7 @@ obj-y				+= $(sfp-obj-y) $(sfp-obj-m)
 obj-$(CONFIG_ADIN_PHY)		+= adin.o
 obj-$(CONFIG_ADIN1100_PHY)	+= adin1100.o
 obj-$(CONFIG_AIR_EN8811H_PHY)   += air_en8811h.o
+obj-$(CONFIG_AIR_NET_PHYLIB)	+= air_phy_lib.o
 obj-$(CONFIG_AMD_PHY)		+= amd.o
 obj-$(CONFIG_AMCC_QT2025_PHY)	+= qt2025.o
 obj-$(CONFIG_AQUANTIA_PHY)	+= aquantia/
diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 29ae73e65caaa9cdebe2253b5349aa6c7478dc85..be7c3426182a26fe3799b875827750e7772caadd 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -21,6 +21,8 @@
 #include <linux/wordpart.h>
 #include <linux/unaligned.h>
 
+#include "air_phy_lib.h"
+
 #define EN8811H_PHY_ID		0x03a2a411
 #define AN8811HB_PHY_ID		0xc0ff04a0
 
@@ -40,7 +42,6 @@
 #define   AIR_AUX_CTRL_STATUS_SPEED_1000	0x8
 #define   AIR_AUX_CTRL_STATUS_SPEED_2500	0xc
 
-#define AIR_EXT_PAGE_ACCESS		0x1f
 #define   AIR_PHY_PAGE_STANDARD			0x0000
 #define   AIR_PHY_PAGE_EXTENDED_4		0x0004
 
@@ -244,16 +245,6 @@ static const unsigned long en8811h_led_trig = BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
 					      BIT(TRIGGER_NETDEV_RX)          |
 					      BIT(TRIGGER_NETDEV_TX);
 
-static int air_phy_read_page(struct phy_device *phydev)
-{
-	return __phy_read(phydev, AIR_EXT_PAGE_ACCESS);
-}
-
-static int air_phy_write_page(struct phy_device *phydev, int page)
-{
-	return __phy_write(phydev, AIR_EXT_PAGE_ACCESS, page);
-}
-
 static int __air_buckpbus_reg_write(struct phy_device *phydev,
 				    u32 pbus_address, u32 pbus_data)
 {
diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
new file mode 100644
index 0000000000000000000000000000000000000000..04c4719a073f98ef75eabd54c4851f6a16391350
--- /dev/null
+++ b/drivers/net/phy/air_phy_lib.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Airoha Ethernet PHY common library
+ *
+ * Copyright (C) 2026 Airoha Technology Corp.
+ * Copyright (C) 2026 Collabora Ltd.
+ *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
+ */
+
+#include <linux/phy.h>
+
+#include "air_phy_lib.h"
+
+#define AIR_EXT_PAGE_ACCESS		0x1f
+
+int air_phy_read_page(struct phy_device *phydev)
+{
+	return __phy_read(phydev, AIR_EXT_PAGE_ACCESS);
+}
+EXPORT_SYMBOL_GPL(air_phy_read_page);
+
+int air_phy_write_page(struct phy_device *phydev, int page)
+{
+	return __phy_write(phydev, AIR_EXT_PAGE_ACCESS, page);
+}
+EXPORT_SYMBOL_GPL(air_phy_write_page);
+
+MODULE_DESCRIPTION("Airoha PHY Library");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Louis-Alexis Eyraud");
diff --git a/drivers/net/phy/air_phy_lib.h b/drivers/net/phy/air_phy_lib.h
new file mode 100644
index 0000000000000000000000000000000000000000..dd501b175a3a38e57744f79571eb1bc4ef46fdf5
--- /dev/null
+++ b/drivers/net/phy/air_phy_lib.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2026 Airoha Technology Corp.
+ * Copyright (C) 2026 Collabora Ltd.
+ *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
+ */
+
+#ifndef __AIR_PHY_LIB_H
+#define __AIR_PHY_LIB_H
+
+int air_phy_read_page(struct phy_device *phydev);
+int air_phy_write_page(struct phy_device *phydev, int page);
+
+#endif /* __AIR_PHY_LIB_H */

-- 
2.53.0


