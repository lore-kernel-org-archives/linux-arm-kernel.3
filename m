Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62341D64064
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2LlcVPkVu2AiR+BkVm1jRgLTSzsLTgqctnGu+62FH4=; b=fo4Yyhk8JTI+LLAoEF7QOiP19V
	mt4+Yn5MsCHiDYgf+dA2OjoZdBqDYpUHVn+M/oqxm9uvTJlR2JdCH5yiuoFrLp48XtZTeF5veiLEb
	/+Kj1tLVw903YIOEeJATAMKV0hVPx4V8DKziL4U/TIvB9HQxQIDPmAXsM4Z7g+NURoovtXLrZmeuZ
	qBerGlQ411K6D2qrysoiplq4iCjYNXx16Cp6+XlYMUYs5G79K6AyUp+nXgM3i8xX5fPfk5b9PQnBC
	fRGPaq50CRVnTU/IeKUD+pG6Y3DHj0qsbm4/pBTeXDp2Z08UWZaYvf4DG9VRXHLJuRYMiEWR3+I74
	TWL1zryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9S9o-0000000BIEu-2c3t;
	Fri, 08 Nov 2024 16:48:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RyZ-0000000BG1D-3xnh;
	Fri, 08 Nov 2024 16:36:49 +0000
X-UUID: a37f43ac9def11ef82ff63e91e7eb18c-20241108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=K2LlcVPkVu2AiR+BkVm1jRgLTSzsLTgqctnGu+62FH4=;
	b=tHt9+qY44y0nXuwkEmvsZ3DneuPdCf6+8+wX0/CvEm/7aC7y26cBacfZj7vgU1g37PtkZm5kZlJh8S+/4s/yiIN2eHqD2P13pzk0CsQHi0+aM1EQBrV09XIXCE7OtbVmAxaNaNgx+hunRc/cEjM3T/IjorULbTxwWcGvocJ5B4s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:565d1f8c-3b6d-433c-ab36-d6445c97a361,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:b194bfca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a37f43ac9def11ef82ff63e91e7eb18c-20241108
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1175082210; Fri, 08 Nov 2024 09:36:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 9 Nov 2024 00:36:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 9 Nov 2024 00:36:40 +0800
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
Subject: [PATCH net-next v3 5/5] net: phy: mediatek: add MT7530 & MT7531's PHY ID macros
Date: Sat, 9 Nov 2024 00:34:55 +0800
Message-ID: <20241108163455.885-6-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
References: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_083648_078051_14B74B50 
X-CRM114-Status: GOOD (  12.18  )
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

This patch adds MT7530 & MT7531's PHY ID macros in mtk-ge.c so that
it follows the same rule of mtk-ge-soc.c.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 9122899..ed2617b 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -5,6 +5,9 @@
 
 #include "mtk.h"
 
+#define MTK_GPHY_ID_MT7530		0x03a29412
+#define MTK_GPHY_ID_MT7531		0x03a29441
+
 #define MTK_EXT_PAGE_ACCESS		0x1f
 #define MTK_PHY_PAGE_STANDARD		0x0000
 #define MTK_PHY_PAGE_EXTENDED		0x0001
@@ -59,7 +62,7 @@ static int mt7531_phy_config_init(struct phy_device *phydev)
 
 static struct phy_driver mtk_gephy_driver[] = {
 	{
-		PHY_ID_MATCH_EXACT(0x03a29412),
+		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
 		.name		= "MediaTek MT7530 PHY",
 		.config_init	= mt7530_phy_config_init,
 		/* Interrupts are handled by the switch, not the PHY
@@ -73,7 +76,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 		.write_page	= mtk_phy_write_page,
 	},
 	{
-		PHY_ID_MATCH_EXACT(0x03a29441),
+		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7531),
 		.name		= "MediaTek MT7531 PHY",
 		.config_init	= mt7531_phy_config_init,
 		/* Interrupts are handled by the switch, not the PHY
@@ -91,8 +94,8 @@ static struct phy_driver mtk_gephy_driver[] = {
 module_phy_driver(mtk_gephy_driver);
 
 static struct mdio_device_id __maybe_unused mtk_gephy_tbl[] = {
-	{ PHY_ID_MATCH_EXACT(0x03a29441) },
-	{ PHY_ID_MATCH_EXACT(0x03a29412) },
+	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530) },
+	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7531) },
 	{ }
 };
 
-- 
2.45.2


