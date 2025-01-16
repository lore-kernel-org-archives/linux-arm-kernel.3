Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8FDC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 01:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUP9M3THZVRCyFSTWbq2674BwZ0HRnKBLtpplxQWnRg=; b=OPRsIeCpIiCDCw8dsHIluujVOb
	sDP7dUGJuhpE1eMGDBVEFF8dMgOqEfrxY/fbpE+aulMMNwM2pZ+gNc7vrvu7QcNvDKr3K4TopcYNI
	5GSk9ArAhk5rHEKws1TjvDsrzImab+vgHY/UULtF2N3pHnQKfFCgBxxqezcsGOs/JRXBGKsL+LMA9
	y/hSK56EyLfsuHmqxP8ROqdahoiYwCqfrBOPiKUbeYyrziIkP8IQ+eAUQNNir5VxRRSt+xfn8neI3
	6NuYCKm1HsP1UWQ94dNuqtgAO+uwMxdKmvZQeHo29XhfzyEfgP69yEWolLH5FXTy7Ym2NPWu01c+q
	abIRoUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEdz-0000000DXjX-19Lm;
	Thu, 16 Jan 2025 01:25:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEbo-0000000DXRn-2wth;
	Thu, 16 Jan 2025 01:23:45 +0000
X-UUID: 843704fad3a811ef9048ed6ed365623b-20250115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nUP9M3THZVRCyFSTWbq2674BwZ0HRnKBLtpplxQWnRg=;
	b=oPD2+WS88eyrLXgjEIMxqok9Mh+2vuggQaCoQy5bh9JElm24DRG/WiwNpqP9gdyKgJGH9KBxMqy/9KTXZdu8h5EkEkNn/xoj4xNjyYFgj1mPtyPkqHfoN5GZor+Ak54h17icDly0I1akvUoCTN8W6UNrPRPuRdNEaX6Qa5S29eI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:9b46f6da-84f2-4bf7-91d6-603045d4e84e,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:2497f337-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 843704fad3a811ef9048ed6ed365623b-20250115
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1121332515; Wed, 15 Jan 2025 18:23:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 Jan 2025 09:23:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 16 Jan 2025 09:23:36 +0800
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
Subject: [PATCH net-next 2/3] net: phy: mediatek: Move some macros to phy-lib for later use
Date: Thu, 16 Jan 2025 09:21:57 +0800
Message-ID: <20250116012159.3816135-3-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_172344_743779_2A35B464 
X-CRM114-Status: GOOD (  11.98  )
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

Move some macros to phy-lib because MediaTek's 2.5G built-in
ethernet PHY will also use them.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-ge.c | 4 ----
 drivers/net/phy/mediatek/mtk.h    | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 79663da..937254a 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -8,10 +8,6 @@
 #define MTK_GPHY_ID_MT7530		0x03a29412
 #define MTK_GPHY_ID_MT7531		0x03a29441
 
-#define MTK_PHY_PAGE_EXTENDED_1			0x0001
-#define MTK_PHY_AUX_CTRL_AND_STATUS		0x14
-#define   MTK_PHY_ENABLE_DOWNSHIFT		BIT(4)
-
 #define MTK_PHY_PAGE_EXTENDED_2			0x0002
 #define MTK_PHY_PAGE_EXTENDED_3			0x0003
 #define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG11	0x11
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 712a9f0..cda1dc8 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -8,7 +8,11 @@
 #ifndef _MTK_EPHY_H_
 #define _MTK_EPHY_H_
 
+#define MTK_PHY_AUX_CTRL_AND_STATUS		0x14
+#define   MTK_PHY_ENABLE_DOWNSHIFT		BIT(4)
+
 #define MTK_EXT_PAGE_ACCESS			0x1f
+#define MTK_PHY_PAGE_EXTENDED_1			0x0001
 #define MTK_PHY_PAGE_STANDARD			0x0000
 #define MTK_PHY_PAGE_EXTENDED_52B5		0x52b5
 
-- 
2.45.2


