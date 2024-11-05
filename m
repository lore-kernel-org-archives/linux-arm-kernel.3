Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DA2D2B931
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 14:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NofeNN9AC//s6BEM3bevXlTodSmIgHrxhhrVsX/YYA=; b=Rd4XlcUdA+sx2YpQu3nOVU3m8q
	c/DaaIlSy5NUEFAqBXCMQS+j+bGnTjLh2tubxTrOnRbJtJ32INQhDfm7Et3OcIjy9P3Mz9lMYmRT0
	Ow8/2SHaYL4lCMhJ64tPd0RfJKy33evX6vlISSa7Pks7xzZl4Lma8qMjAXbcrhULGMWJHbjCDCWAi
	tvFbvAUiY9nD3v4/CPFEBfQU0fotD69aYZd036UEgb+/cImiqnOimRLVqS2QdvujS0dpClh8GTe0U
	R/1fdhWDfqNufBkS8lOHE6cVs8uDg6EeYO42yGzsOfNzdBCfeASceTxGY6clxjEPnWpki2TF43qVG
	IXuwkOmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Kby-0000000HHiD-1Kug;
	Tue, 05 Nov 2024 14:32:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KRi-0000000HFft-1A0E;
	Tue, 05 Nov 2024 14:22:15 +0000
X-UUID: 578d57929b8111ef82ff63e91e7eb18c-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5NofeNN9AC//s6BEM3bevXlTodSmIgHrxhhrVsX/YYA=;
	b=KuM1+jq14icOLOp34in04Or+AvlNQJO+MjgbjMYY4ONVnLSoSXkato5V8Na4dWNPpskWOLbswi3B9IzbLJRzwFnqGiDZpCKWvHb+Ar0lnPuw9a1S4ul3e+apHUbzDC3pexTxRAI8RW53ko9/22GU/LrwcZD9blYtDetZPuPLNF4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:25594996-a943-47b5-b925-48acbaebe23d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:171ebb48-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 578d57929b8111ef82ff63e91e7eb18c-20241105
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1304122472; Tue, 05 Nov 2024 07:22:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 22:22:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Nov 2024 22:22:06 +0800
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
Subject: [PATCH net-next v2 4/5] net: phy: mediatek: Integrate read/write page helper functions
Date: Tue, 5 Nov 2024 22:19:10 +0800
Message-ID: <20241105141911.13326-5-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241105141911.13326-1-SkyLake.Huang@mediatek.com>
References: <20241105141911.13326-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_062214_355668_134D2535 
X-CRM114-Status: GOOD (  13.83  )
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

This patch integrates read/write page helper functions as MTK phy lib.
They are basically the same in mtk-ge.c & mtk-ge-soc.c.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c  | 18 ++++--------------
 drivers/net/phy/mediatek/mtk-ge.c      | 20 ++++++--------------
 drivers/net/phy/mediatek/mtk-phy-lib.c | 12 ++++++++++++
 drivers/net/phy/mediatek/mtk.h         |  3 +++
 4 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index d3a8b39..38dc898 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -271,16 +271,6 @@ struct mtk_socphy_shared {
 	struct mtk_socphy_priv	priv[4];
 };
 
-static int mtk_socphy_read_page(struct phy_device *phydev)
-{
-	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
-}
-
-static int mtk_socphy_write_page(struct phy_device *phydev, int page)
-{
-	return __phy_write(phydev, MTK_EXT_PAGE_ACCESS, page);
-}
-
 /* One calibration cycle consists of:
  * 1.Set DA_CALIN_FLAG high to start calibration. Keep it high
  *   until AD_CAL_COMP is ready to output calibration result.
@@ -1337,8 +1327,8 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.probe		= mt7981_phy_probe,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
-		.read_page	= mtk_socphy_read_page,
-		.write_page	= mtk_socphy_write_page,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 		.led_blink_set	= mt798x_phy_led_blink_set,
 		.led_brightness_set = mt798x_phy_led_brightness_set,
 		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
@@ -1354,8 +1344,8 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.probe		= mt7988_phy_probe,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
-		.read_page	= mtk_socphy_read_page,
-		.write_page	= mtk_socphy_write_page,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 		.led_blink_set	= mt798x_phy_led_blink_set,
 		.led_brightness_set = mt798x_phy_led_brightness_set,
 		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 54ea64a..9122899 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -3,6 +3,8 @@
 #include <linux/module.h>
 #include <linux/phy.h>
 
+#include "mtk.h"
+
 #define MTK_EXT_PAGE_ACCESS		0x1f
 #define MTK_PHY_PAGE_STANDARD		0x0000
 #define MTK_PHY_PAGE_EXTENDED		0x0001
@@ -11,16 +13,6 @@
 #define MTK_PHY_PAGE_EXTENDED_2A30	0x2a30
 #define MTK_PHY_PAGE_EXTENDED_52B5	0x52b5
 
-static int mtk_gephy_read_page(struct phy_device *phydev)
-{
-	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
-}
-
-static int mtk_gephy_write_page(struct phy_device *phydev, int page)
-{
-	return __phy_write(phydev, MTK_EXT_PAGE_ACCESS, page);
-}
-
 static void mtk_gephy_config_init(struct phy_device *phydev)
 {
 	/* Enable HW auto downshift */
@@ -77,8 +69,8 @@ static struct phy_driver mtk_gephy_driver[] = {
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
-		.read_page	= mtk_gephy_read_page,
-		.write_page	= mtk_gephy_write_page,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 	},
 	{
 		PHY_ID_MATCH_EXACT(0x03a29441),
@@ -91,8 +83,8 @@ static struct phy_driver mtk_gephy_driver[] = {
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
-		.read_page	= mtk_gephy_read_page,
-		.write_page	= mtk_gephy_write_page,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 	},
 };
 
diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 8d795bc..98a09d6 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -6,6 +6,18 @@
 
 #include "mtk.h"
 
+int mtk_phy_read_page(struct phy_device *phydev)
+{
+	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
+}
+EXPORT_SYMBOL_GPL(mtk_phy_read_page);
+
+int mtk_phy_write_page(struct phy_device *phydev, int page)
+{
+	return __phy_write(phydev, MTK_EXT_PAGE_ACCESS, page);
+}
+EXPORT_SYMBOL_GPL(mtk_phy_write_page);
+
 int mtk_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 				unsigned long rules,
 				unsigned long supported_triggers)
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 9aaff2c..63d9fe1 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -66,6 +66,9 @@ struct mtk_socphy_priv {
 	unsigned long		led_state;
 };
 
+int mtk_phy_read_page(struct phy_device *phydev);
+int mtk_phy_write_page(struct phy_device *phydev, int page);
+
 int mtk_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
 				unsigned long rules,
 				unsigned long supported_triggers);
-- 
2.45.2


