Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47CCD64063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRO4OIZF2n53Foyj4HL8DaQ+Q//MKWUoAnJhy45uRp8=; b=F/72EGrOqi93obg1O/QRhF/tlo
	lwGmgz/rqFYD/4Z28cvi0uZyKY7jOyhI4NM+YoMPG6d6akjF3KF3uO4xt12bNUUstl8HtnD5ijYFx
	umODAKc//a32GF+pcKiL5c8HdJKGMMqVnv0/Ws9SEmnJH511K/Rh2PdJk0AVzXT+piI0ZveiXyoIL
	jAiWVaBGxFFpX0L9yL3vM04eK4JF0PCzBz9Q7QpJu1VuGFeeTKzyXexR1TIYMPcsjV0kHuBg+p5Qr
	89JLA98Qp8lObZAcEBHcaPU105iRL7MGKKIYNIkCU6/mTF+oZWh/wUX45yBgJ7TDETH7aYC1F8vJP
	HeUSjXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9S66-0000000BHTi-31Y9;
	Fri, 08 Nov 2024 16:44:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RyG-0000000BFvp-3X5k;
	Fri, 08 Nov 2024 16:36:30 +0000
X-UUID: 96910e329def11ef82ff63e91e7eb18c-20241108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SRO4OIZF2n53Foyj4HL8DaQ+Q//MKWUoAnJhy45uRp8=;
	b=RtuH2AWuBj7qpcMrT7EsS76VTxlNNeRMn7ydo7Tc2LxlOH1FsVDr+IErpvzwcZLLIgQtk/7qrE3lpwUPCib7Z3DQdLJNFnzVAF6u3KXv3CwvAAVLwNpYANNyMPP55f0wWcdIieVJScPHYI0B5p+MOa10X52onjNuR60zNT9h7Ds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:03b4a643-882d-47a9-9a02-5e95765dd0dd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:8cdac706-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 96910e329def11ef82ff63e91e7eb18c-20241108
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1197032065; Fri, 08 Nov 2024 09:36:22 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 9 Nov 2024 00:36:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 9 Nov 2024 00:36:19 +0800
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
Subject: [PATCH net-next v3 3/5] net: phy: mediatek: Improve readability of mtk-phy-lib.c's mtk_phy_led_hw_ctrl_set()
Date: Sat, 9 Nov 2024 00:34:53 +0800
Message-ID: <20241108163455.885-4-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
References: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_083628_911427_CDA40016 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

This patch removes parens around TRIGGER_NETDEV_RX/TRIGGER_NETDEV_TX in
mtk_phy_led_hw_ctrl_set(), which improves readability.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 44 ++++++++++++++------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 34b0957..8d795bc 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -129,29 +129,33 @@ int mtk_phy_led_hw_ctrl_set(struct phy_device *phydev, u8 index,
 		on |= MTK_PHY_LED_ON_LINK2500;
 
 	if (rules & BIT(TRIGGER_NETDEV_RX)) {
-		blink |= (on & on_set) ?
-			  (((on & MTK_PHY_LED_ON_LINK10) ?
-			    MTK_PHY_LED_BLINK_10RX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK100) ?
-			    MTK_PHY_LED_BLINK_100RX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK1000) ?
-			    MTK_PHY_LED_BLINK_1000RX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK2500) ?
-			    MTK_PHY_LED_BLINK_2500RX : 0)) :
-			  rx_blink_set;
+		if (on & on_set) {
+			if (on & MTK_PHY_LED_ON_LINK10)
+				blink |= MTK_PHY_LED_BLINK_10RX;
+			if (on & MTK_PHY_LED_ON_LINK100)
+				blink |= MTK_PHY_LED_BLINK_100RX;
+			if (on & MTK_PHY_LED_ON_LINK1000)
+				blink |= MTK_PHY_LED_BLINK_1000RX;
+			if (on & MTK_PHY_LED_ON_LINK2500)
+				blink |= MTK_PHY_LED_BLINK_2500RX;
+		} else {
+			blink |= rx_blink_set;
+		}
 	}
 
 	if (rules & BIT(TRIGGER_NETDEV_TX)) {
-		blink |= (on & on_set) ?
-			  (((on & MTK_PHY_LED_ON_LINK10) ?
-			    MTK_PHY_LED_BLINK_10TX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK100) ?
-			    MTK_PHY_LED_BLINK_100TX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK1000) ?
-			    MTK_PHY_LED_BLINK_1000TX : 0) |
-			   ((on & MTK_PHY_LED_ON_LINK2500) ?
-			    MTK_PHY_LED_BLINK_2500TX : 0)) :
-			  tx_blink_set;
+		if (on & on_set) {
+			if (on & MTK_PHY_LED_ON_LINK10)
+				blink |= MTK_PHY_LED_BLINK_10TX;
+			if (on & MTK_PHY_LED_ON_LINK100)
+				blink |= MTK_PHY_LED_BLINK_100TX;
+			if (on & MTK_PHY_LED_ON_LINK1000)
+				blink |= MTK_PHY_LED_BLINK_1000TX;
+			if (on & MTK_PHY_LED_ON_LINK2500)
+				blink |= MTK_PHY_LED_BLINK_2500TX;
+		} else {
+			blink |= tx_blink_set;
+		}
 	}
 
 	if (blink || on)
-- 
2.45.2


