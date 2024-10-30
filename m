Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73473D5CC90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNSa2kfL4CrNWDSpKuHuCoNeytvhALp1cji8Fdb0hKs=; b=HlAn0WBvC+SSDAgk9N+tBdpdin
	zTvFvht1hP1dBdwYp+frKMARYeUmILq1mS+NmjFCgycOuUNqb88BeQpPA8AW4HMZGsp5LSQaSbHV0
	kAV5GKKfhQjxZoGGMYsnlz9JPWH4BoGTRujaBIz9Gj8hWH+aMe+lI6pEu6G/BM2ondougzfHNjHoW
	UzSwn3MQM3F3/+Lx3sMlHdy9/eSqO1v2DWuA3LqxnXBXC9sYYapcI6MSavymxBQRFg7Y0mIOBe2Vx
	a72CPNXIViaVBV3pbeG/LZplQqDnRoIi/rP8pO0r6bWXicA1D3rGATryTHjVWdZ4rUb2fY8ijdNxi
	3mcTLE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66KU-000000001X4-3qzK;
	Wed, 30 Oct 2024 10:53:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t665V-0000000Ha1a-19zg;
	Wed, 30 Oct 2024 10:38:06 +0000
X-UUID: 0a3b55aa96ab11ef82ff63e91e7eb18c-20241030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sNSa2kfL4CrNWDSpKuHuCoNeytvhALp1cji8Fdb0hKs=;
	b=gmvaLKnuptuRNZ+a7DLiFHpQlbsW7EImMLEbnriGl5T2JLWCjNVgqxMcBqsN5KMg9b2gb7A4LMIO/eYtrqVZqFAw8NQKFY54dN520F9RAY0VCoD984OKri0Nl65Fs7O01shykuHH6zX2ueGi/jhs/RY46gdh8MQfME0gF9B5/HI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:40726e0c-4317-42b4-a3db-8689ec7a6833,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:48df4ae7-cb6b-4a59-bfa3-98f245b4912e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0a3b55aa96ab11ef82ff63e91e7eb18c-20241030
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1004737024; Wed, 30 Oct 2024 03:38:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Oct 2024 18:37:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Oct 2024 18:37:58 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Simon
 Horman" <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next 4/5] net: phy: mediatek: Integrate read/write page helper functions
Date: Wed, 30 Oct 2024 18:35:53 +0800
Message-ID: <20241030103554.29218-5-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241030103554.29218-1-SkyLake.Huang@mediatek.com>
References: <20241030103554.29218-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.069700-8.000000
X-TMASE-MatchedRID: dY/STlX7LWKw8kFTdnBpUcdDwwczffCufLPKYyLDlAdo5YsPsbyLXUgC
	lCIX2geweeTK1AUftLLijpjet3oGSAV0DOIpze3p4pdq9sdj8LUK3n1SHen81fFJXtgF4GFLUPL
	91Dv7dOIBz/qRD2hFcngQwncoPpqKCYQihzr905ltPeYaZY+k178sbddn7IcZRi9INZ1ZpGEx4S
	ftoQr3xM3ZiXXMcP4YoqDdv5CX5TjDiZmOF0V5FZ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyJ8TM
	nmE+d0Z1AsD/E4UR7Ws3XFbuXbpsaUGTnfsa7pox7Z20LmKG/OsF/46ifTin+W21jS40FF+nwUd
	hkr42QLeuUz0FT6I0xjTW0JmC2y2eZUpm6wun3ba/06NhYDa4wyzCDjlUx89p2y3mIB+it9WXGv
	UUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.069700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B53C67DA0D8030081098948A7979B88326A69ED31E79DA156411C06A0C26351E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_033805_350190_A4520C72 
X-CRM114-Status: GOOD (  13.57  )
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

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
No change since commit:
https://lore.kernel.org/netdev/20241004102413.5838-6-SkyLake.Huang@mediatek.com/

Andrew Lunn has already reviewed this.
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


