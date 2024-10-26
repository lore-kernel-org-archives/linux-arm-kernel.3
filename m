Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC2BD10BF7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CHB5QxCeir0/dM/PawRnw8mP/8tCstX7FKvrSJQ9HMI=; b=LQ20rcahq9hOsJok9T+Q/SsBFZ
	77g3hK4WNNIs2xVqyaVvGcbnSFTpGyoPL0r7R55f4o/Q8g2EAsM5/B3NwnrroNvtljCJEN6M7Zhxb
	/K2wBJfR/9gdDW2Vd1Q6FGCgxgBBOQqjwkXFIrAgqH28zA3hIgkrivF9i57TkzcFp6i5KrwyiPsCM
	z5APCOXCqjHWd3kw4TZJDIRh0g82Tm8x+2Hf/yFUe70qyw8CGXOGRcLhe0vlyr0hMR1nmIDBzFdz6
	Dk1haL7KeAPTGcKpnKCuQL+wQ562BbJUv629OmwGZtVic5QEy+38puYCSJFNUXL59GbgyM87rbxfr
	2B56n3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4hFK-00000006iM2-0vfN;
	Sat, 26 Oct 2024 13:54:26 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4hDk-00000006iHA-18rX;
	Sat, 26 Oct 2024 13:52:49 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1t4hDa-000000003qV-0Ibp;
	Sat, 26 Oct 2024 13:52:38 +0000
Date: Sat, 26 Oct 2024 14:52:25 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Sujuan Chen <sujuan.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>
Subject: [PATCH net] net: ethernet: mtk_wed: fix path of MT7988 WO firmware
Message-ID: <Zxz0GWTR5X5LdWPe@pidgin.makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_065248_327804_774CEB38 
X-CRM114-Status: GOOD (  11.89  )
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

linux-firmware commit 808cba84 ("mtk_wed: add firmware for mt7988
Wireless Ethernet Dispatcher") added mt7988_wo_{0,1}.bin in the
'mediatek/mt7988' directory while driver current expects the files in
the 'mediatek' directory.

Change path in the driver header now that the firmware has been added.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_wo.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.h b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
index 87a67fa3868d..c01b1e8428f6 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
@@ -91,8 +91,8 @@ enum mtk_wed_dummy_cr_idx {
 #define MT7981_FIRMWARE_WO	"mediatek/mt7981_wo.bin"
 #define MT7986_FIRMWARE_WO0	"mediatek/mt7986_wo_0.bin"
 #define MT7986_FIRMWARE_WO1	"mediatek/mt7986_wo_1.bin"
-#define MT7988_FIRMWARE_WO0	"mediatek/mt7988_wo_0.bin"
-#define MT7988_FIRMWARE_WO1	"mediatek/mt7988_wo_1.bin"
+#define MT7988_FIRMWARE_WO0	"mediatek/mt7988/mt7988_wo_0.bin"
+#define MT7988_FIRMWARE_WO1	"mediatek/mt7988/mt7988_wo_1.bin"
 
 #define MTK_WO_MCU_CFG_LS_BASE				0
 #define MTK_WO_MCU_CFG_LS_HW_VER_ADDR			(MTK_WO_MCU_CFG_LS_BASE + 0x000)
-- 
2.47.0


