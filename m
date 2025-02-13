Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC031C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26YmjNwG62Ai1VoB2TZP4oBHj1k46+t5lY3/xow1ns4=; b=hDbMuZLUE459TCxy56Dp9zt0i8
	TNChi23l7/n+7EyLIABTV5459fYZq13IvcvbrpbvnfxQtkU1NkRGgmZJHEmws8NKnSj60FCgrqf0e
	izMUzjo1HHnrCCiwoWK8Ju5LgzS0rEKDka5i9Tq1ibxHt4pCppdkNp8jrkkrKcfvRJooDWgAhcoJE
	hrdISd9ufkLuf+qsdDzkUKIrCHS3o7con2/+5hRwBCk3CtBvM9KhWlIQGF9GcKEGcDx2k/qYnMVY+
	tVrDLIE67cvCgXRFPf4YLmcf9WFSqeGRd6qLXKrZnQZ8YnaiSXK+u0sWrVIXhooAWAKJmQ45+rAJm
	r9DTvmoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUTb-0000000AFzZ-1Yzw;
	Thu, 13 Feb 2025 08:21:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUGM-0000000ADk3-1FOO;
	Thu, 13 Feb 2025 08:07:59 +0000
X-UUID: a16ab3c4e9e111ef82ff63e91e7eb18c-20250213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=26YmjNwG62Ai1VoB2TZP4oBHj1k46+t5lY3/xow1ns4=;
	b=p6mB6vqGStOCTMcdSksQ3HMVF57CSOmU5UEkUdWzOnCnJGG/ZTAVhfh184SImlT/5yVQpdccHXVsCQbr2o6ZLqq9TQiPbLGift+qHjjokmmBjN2U9/LSb53CoSS+v6kGIVG2f0tSlGo215H2b648ftVDa1E+AxthY2ou01hOsf4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:3124888e-c42b-4994-ab53-8ba7780a15c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:860b4f8f-637d-4112-88e4-c7792fee6ae2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a16ab3c4e9e111ef82ff63e91e7eb18c-20250213
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 934360811; Thu, 13 Feb 2025 01:07:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Feb 2025 16:07:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Feb 2025 16:07:52 +0800
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
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v2 3/5] net: phy: mediatek: Add token ring set bit operation support
Date: Thu, 13 Feb 2025 16:05:51 +0800
Message-ID: <20250213080553.921434-4-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250213080553.921434-1-SkyLake.Huang@mediatek.com>
References: <20250213080553.921434-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_000758_345468_14B6840F 
X-CRM114-Status: GOOD (  11.45  )
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

From: Sky Huang <skylake.huang@mediatek.com>

Previously in mtk-ge-soc.c, we set some register bits via token
ring, which were implemented in three __phy_write().
Now we can do the same thing via __mtk_tr_set_bits() helper.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c  | 10 ++++++----
 drivers/net/phy/mediatek/mtk-phy-lib.c |  7 +++++++
 drivers/net/phy/mediatek/mtk.h         |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index ee335f4..b7bd3e3 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -62,6 +62,10 @@
 /* MasDSPreadyTime */
 #define MASTER_DSP_READY_TIME_MASK		GENMASK(14, 7)
 
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x18 */
+/* EnabRandUpdTrig */
+#define ENABLE_RANDOM_UPDOWN_COUNTER_TRIGGER	BIT(8)
+
 /* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x20 */
 /* ResetSyncOffset */
 #define RESET_SYNC_OFFSET_MASK			GENMASK(11, 8)
@@ -789,10 +793,8 @@ static void mt798x_phy_common_finetune(struct phy_device *phydev)
 			FIELD_PREP(SLAVE_DSP_READY_TIME_MASK, 0x18) |
 			FIELD_PREP(MASTER_DSP_READY_TIME_MASK, 0x18));
 
-	/* EnabRandUpdTrig = 1 */
-	__phy_write(phydev, 0x11, 0x2f00);
-	__phy_write(phydev, 0x12, 0xe);
-	__phy_write(phydev, 0x10, 0x8fb0);
+	__mtk_tr_set_bits(phydev, 0x1, 0xf, 0x18,
+			  ENABLE_RANDOM_UPDOWN_COUNTER_TRIGGER);
 
 	__mtk_tr_modify(phydev, 0x0, 0x7, 0x15,
 			NORMAL_MSE_LO_THRESH_MASK,
diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 7275e4e..df8fdad 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -69,6 +69,13 @@ void mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 }
 EXPORT_SYMBOL_GPL(mtk_tr_modify);
 
+void __mtk_tr_set_bits(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		       u8 data_addr, u32 set)
+{
+	__mtk_tr_modify(phydev, ch_addr, node_addr, data_addr, 0, set);
+}
+EXPORT_SYMBOL_GPL(__mtk_tr_set_bits);
+
 int mtk_phy_read_page(struct phy_device *phydev)
 {
 	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index af44d1a..2d8e5b9 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -72,6 +72,8 @@ void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set);
 void mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		   u8 data_addr, u32 mask, u32 set);
+void __mtk_tr_set_bits(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		       u8 data_addr, u32 set);
 
 int mtk_phy_read_page(struct phy_device *phydev);
 int mtk_phy_write_page(struct phy_device *phydev, int page);
-- 
2.18.0


