Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08574D64064
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXGN3lAhTOiiDdvB/kCVtxfAmSFZnGBeXEnN6Z1wyuQ=; b=tlHFv3VLf/LtjRsWk7YZi4J8DC
	Gw/UDuDbEJQXMKzWT+CgV3SIYAuROr6xSxH2eJsjcZzFOKVwXzjoLIztYZIEirH61CIaSxFYLP/r/
	eAg64SZH87LUXkHMBjXgszFva8u4GCWzun3EZFvvg8lv+QRUh13kTdOZRNYuoi+PzHhK2KGk+YMpm
	g8mGWwTXYa0I26CGsXmKRLw1dNLTffjLkM80PFAXlpiYfKPMvty760dI4sORNp47fhM8VsUg7ta9I
	oDM+Jz9/EURoAUU3tUGL49TQcRIxgHFPGmb9ewxZIIJY4H7aNAF0+4jQGOK8lGYPmSeGTKURh6gyo
	uw4PEDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9S2N-0000000BGiN-1LvE;
	Fri, 08 Nov 2024 16:40:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RxD-0000000BFeb-1beA;
	Fri, 08 Nov 2024 16:35:25 +0000
X-UUID: 70da75ac9def11ef82ff63e91e7eb18c-20241108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jXGN3lAhTOiiDdvB/kCVtxfAmSFZnGBeXEnN6Z1wyuQ=;
	b=uVB/NlqbVaKZwgShqCqqQ3LySCETYdc5ExPEeQIykUXDHwreyuqHYQnmBQrPOxkdCX1VfUNfIpLV+tReW/0C7bqS4AVt6Up86SSol9fTrm170N2gjarTgosbVNpmbOmyLY3B3Kcj5nPcZag+x8nk+uqDeA0DDTJGbzipMJHVyoE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:fbad6fa5-5855-4a74-96bc-2b089420e8e9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:a2f9d91b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 70da75ac9def11ef82ff63e91e7eb18c-20241108
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1119421205; Fri, 08 Nov 2024 09:35:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 9 Nov 2024 00:35:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 9 Nov 2024 00:35:15 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v3 1/5] net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
Date: Sat, 9 Nov 2024 00:34:51 +0800
Message-ID: <20241108163455.885-2-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
References: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_083523_511397_AC3E32EC 
X-CRM114-Status: GOOD (  17.52  )
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

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

Re-organize MediaTek ethernet phy driver files and get ready to integrate
some common functions and add new 2.5G phy driver.
mtk-ge.c: MT7530 Gphy on MT7621 & MT7531 Gphy
mtk-ge-soc.c: Built-in Gphy on MT7981 & Built-in switch Gphy on MT7988
mtk-2p5ge.c: Planned for built-in 2.5G phy on MT7988

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 MAINTAINERS                                   |  4 ++--
 drivers/net/phy/Kconfig                       | 17 +-------------
 drivers/net/phy/Makefile                      |  3 +--
 drivers/net/phy/mediatek/Kconfig              | 22 +++++++++++++++++++
 drivers/net/phy/mediatek/Makefile             |  3 +++
 .../mtk-ge-soc.c}                             |  0
 .../phy/{mediatek-ge.c => mediatek/mtk-ge.c}  |  0
 7 files changed, 29 insertions(+), 20 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/Kconfig
 create mode 100644 drivers/net/phy/mediatek/Makefile
 rename drivers/net/phy/{mediatek-ge-soc.c => mediatek/mtk-ge-soc.c} (100%)
 rename drivers/net/phy/{mediatek-ge.c => mediatek/mtk-ge.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index e291445..6deaf94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13793,8 +13793,8 @@ M:	Qingfang Deng <dqfext@gmail.com>
 M:	SkyLake Huang <SkyLake.Huang@mediatek.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
-F:	drivers/net/phy/mediatek-ge-soc.c
-F:	drivers/net/phy/mediatek-ge.c
+F:	drivers/net/phy/mediatek/mtk-ge-soc.c
+F:	drivers/net/phy/mediatek/mtk-ge.c
 F:	drivers/phy/mediatek/phy-mtk-xfi-tphy.c
 
 MEDIATEK I2C CONTROLLER DRIVER
diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 1df0595..e0e4b5e 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -251,22 +251,7 @@ config MAXLINEAR_GPHY
 	  Support for the Maxlinear GPY115, GPY211, GPY212, GPY215,
 	  GPY241, GPY245 PHYs.
 
-config MEDIATEK_GE_PHY
-	tristate "MediaTek Gigabit Ethernet PHYs"
-	help
-	  Supports the MediaTek Gigabit Ethernet PHYs.
-
-config MEDIATEK_GE_SOC_PHY
-	tristate "MediaTek SoC Ethernet PHYs"
-	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
-	depends on NVMEM_MTK_EFUSE
-	help
-	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
-
-	  Include support for built-in Ethernet PHYs which are present in
-	  the MT7981 and MT7988 SoCs. These PHYs need calibration data
-	  present in the SoCs efuse and will dynamically calibrate VCM
-	  (common-mode voltage) during startup.
+source "drivers/net/phy/mediatek/Kconfig"
 
 config MICREL_PHY
 	tristate "Micrel PHYs"
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 197acfa..de38cbf 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -71,8 +71,7 @@ obj-$(CONFIG_MARVELL_PHY)	+= marvell.o
 obj-$(CONFIG_MARVELL_88Q2XXX_PHY)	+= marvell-88q2xxx.o
 obj-$(CONFIG_MARVELL_88X2222_PHY)	+= marvell-88x2222.o
 obj-$(CONFIG_MAXLINEAR_GPHY)	+= mxl-gpy.o
-obj-$(CONFIG_MEDIATEK_GE_PHY)	+= mediatek-ge.o
-obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mediatek-ge-soc.o
+obj-y				+= mediatek/
 obj-$(CONFIG_MESON_GXL_PHY)	+= meson-gxl.o
 obj-$(CONFIG_MICREL_KS8995MA)	+= spi_ks8995.o
 obj-$(CONFIG_MICREL_PHY)	+= micrel.o
diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
new file mode 100644
index 0000000..112d9c0
--- /dev/null
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config MEDIATEK_GE_PHY
+	tristate "MediaTek Gigabit Ethernet PHYs"
+	help
+	  Supports the MediaTek non-built-in Gigabit Ethernet PHYs.
+
+	  Non-built-in Gigabit Ethernet PHYs include mt7530/mt7531.
+	  You may find mt7530 inside mt7621. This driver shares some
+	  common operations with MediaTek SoC built-in Gigabit
+	  Ethernet PHYs.
+
+config MEDIATEK_GE_SOC_PHY
+	tristate "MediaTek SoC Ethernet PHYs"
+	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
+	depends on NVMEM_MTK_EFUSE
+	help
+	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
+
+	  Include support for built-in Ethernet PHYs which are present in
+	  the MT7981 and MT7988 SoCs. These PHYs need calibration data
+	  present in the SoCs efuse and will dynamically calibrate VCM
+	  (common-mode voltage) during startup.
diff --git a/drivers/net/phy/mediatek/Makefile b/drivers/net/phy/mediatek/Makefile
new file mode 100644
index 0000000..005bde2
--- /dev/null
+++ b/drivers/net/phy/mediatek/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_MEDIATEK_GE_PHY)		+= mtk-ge.o
+obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mtk-ge-soc.o
diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
similarity index 100%
rename from drivers/net/phy/mediatek-ge-soc.c
rename to drivers/net/phy/mediatek/mtk-ge-soc.c
diff --git a/drivers/net/phy/mediatek-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
similarity index 100%
rename from drivers/net/phy/mediatek-ge.c
rename to drivers/net/phy/mediatek/mtk-ge.c
-- 
2.45.2


