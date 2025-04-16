Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EAFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pmq0gKwjPdUWLQWi6+Iss58yTq3ELIvWqz5Da6Pn798=; b=aKA9U53dYixn/o8wn2o9Fe26Rc
	17H1/dBrVRMK1dUHHeKXVehboGlht6rGHed+ZW+DaTPpr52URw8YnuYEThiX7qpVvmEf5OUzxlr9d
	RD/Wrgk4cHVtcCFW2qtDE2nAF5YUZe3egH3OR3W53Bkl0oetOk4ek0Y+eZ1fceUw6LkRSMVX2c+E5
	pVsQ5VDbGqeV9HfwBmbngCpiM13KdkuFx722RgVuKT4zSA1Fyy2ZHd1xTJbwD6l4M1MwtOiGnENUr
	IGPgeMPOPo6oiDgefpmy7ZXaCXqaU7ZqE0NFXz+zz+Enj0yRkR1ESJSbxs6w9hc71e+mB6NPaGwyO
	4pT7biWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4r78-00000007j3Z-3DpL;
	Wed, 16 Apr 2025 00:58:54 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4r0K-00000007haN-3REw;
	Wed, 16 Apr 2025 00:51:54 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u4qxf-000000001Tx-3dKZ;
	Wed, 16 Apr 2025 00:51:45 +0000
Date: Wed, 16 Apr 2025 01:51:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 4/5] net: ethernet: mtk_eth_soc: net: revise NETSYSv3
 hardware configuration
Message-ID: <28929b5bb2bfd45e040a07c0efefb29e57a77513.1744764277.git.daniel@makrotopia.org>
References: <8ab7381447e6cdcb317d5b5a6ddd90a1734efcb0.1744764277.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ab7381447e6cdcb317d5b5a6ddd90a1734efcb0.1744764277.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_175152_860094_014FFE4E 
X-CRM114-Status: GOOD (  12.46  )
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

From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>

Change hardware configuration for the NETSYSv3.
 - Enable PSE dummy page mechanism for the GDM1/2/3
 - Enable PSE drop mechanism when the WDMA Rx ring full
 - Enable PSE no-drop mechanism for packets from the WDMA Tx
 - Correct PSE free drop threshold
 - Correct PSE CDMA high threshold

Fixes: 1953f134a1a8b ("net: ethernet: mtk_eth_soc: add NETSYS_V3 version support")
Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: no change

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 20 ++++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  7 ++++++-
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index bdb98c9d8b1c1..338849b488cae 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4043,11 +4043,23 @@ static int mtk_hw_init(struct mtk_eth *eth, bool reset)
 	mtk_w32(eth, 0x21021000, MTK_FE_INT_GRP);
 
 	if (mtk_is_netsys_v3_or_greater(eth)) {
-		/* PSE should not drop port1, port8 and port9 packets */
-		mtk_w32(eth, 0x00000302, PSE_DROP_CFG);
+		/* PSE dummy page mechanism */
+		mtk_w32(eth, PSE_DUMMY_WORK_GDM(1) | PSE_DUMMY_WORK_GDM(2) |
+			PSE_DUMMY_WORK_GDM(3) | DUMMY_PAGE_THR, PSE_DUMY_REQ);
+
+		/* PSE free buffer drop threshold */
+		mtk_w32(eth, 0x00600009, PSE_IQ_REV(8));
+
+		/* PSE should not drop port8, port9 and port13 packets from WDMA Tx */
+		mtk_w32(eth, 0x00002300, PSE_DROP_CFG);
+
+		/* PSE should drop packets to port8, port9 and port13 on WDMA Rx ring full */
+		mtk_w32(eth, 0x00002300, PSE_PPE_DROP(0));
+		mtk_w32(eth, 0x00002300, PSE_PPE_DROP(1));
+		mtk_w32(eth, 0x00002300, PSE_PPE_DROP(2));
 
 		/* GDM and CDM Threshold */
-		mtk_w32(eth, 0x00000707, MTK_CDMW0_THRES);
+		mtk_w32(eth, 0x08000707, MTK_CDMW0_THRES);
 		mtk_w32(eth, 0x00000077, MTK_CDMW1_THRES);
 
 		/* Disable GDM1 RX CRC stripping */
@@ -4064,7 +4076,7 @@ static int mtk_hw_init(struct mtk_eth *eth, bool reset)
 		mtk_w32(eth, 0x00000300, PSE_DROP_CFG);
 
 		/* PSE should drop packets to port 8/9 on WDMA Rx ring full */
-		mtk_w32(eth, 0x00000300, PSE_PPE0_DROP);
+		mtk_w32(eth, 0x00000300, PSE_PPE_DROP(0));
 
 		/* PSE Free Queue Flow Control  */
 		mtk_w32(eth, 0x01fa01f4, PSE_FQFC_CFG2);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 39709649ea8d1..eaa96c8483b70 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -151,7 +151,12 @@
 #define PSE_FQFC_CFG1		0x100
 #define PSE_FQFC_CFG2		0x104
 #define PSE_DROP_CFG		0x108
-#define PSE_PPE0_DROP		0x110
+#define PSE_PPE_DROP(x)		(0x110 + ((x) * 0x4))
+
+/* PSE Last FreeQ Page Request Control */
+#define PSE_DUMY_REQ		0x10C
+#define PSE_DUMMY_WORK_GDM(x)	BIT(16 + (x))
+#define DUMMY_PAGE_THR		0x1
 
 /* PSE Input Queue Reservation Register*/
 #define PSE_IQ_REV(x)		(0x140 + (((x) - 1) << 2))
-- 
2.49.0

