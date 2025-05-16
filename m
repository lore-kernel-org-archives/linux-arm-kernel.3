Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E1EC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzwGRueTXdqiA1x5+m8noznkR/L46ared2SRPTQyfVE=; b=ip2kzttlxubD/tlMAX0lQXRQcG
	2eyTDxYHFiIyjO738jrRgM2UX8X6luejBwbjN52ZKrVyh8tj1OTD3lXTKFIUcs3WlcoSuEP2WH/jw
	4HYXyy5Mm0WE1tWN9et9ZHvJZ3IZg03w90QVZEZCu0asSMVnGZYKPvAqFFAsY4uMzRETBMTqssW8y
	zIWrInYNMGfN6vvBgvLsLpLbmcnex9vmY/2pN4HC3ut+9UsQEH3jQ5PBH6GERFjme0QTvyRKOsyGe
	s+fmck/P6BHXq/vhrNG3IlxLATrNneLiGeG8m6xaf7iL1TmwYpn3tgdMfst1JhWITo/+Y2k+0+5Ry
	oY0HDqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsK6-000000038TJ-1gtH;
	Fri, 16 May 2025 10:29:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsEI-000000037WH-2OSk;
	Fri, 16 May 2025 10:23:51 +0000
X-UUID: dabc9b3c323f11f0bed96b30c12bc3d6-20250516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zzwGRueTXdqiA1x5+m8noznkR/L46ared2SRPTQyfVE=;
	b=tcq88ql3Jc7+ogYlsS5OUcAWOWQ9zXiQtpllSedfLcAhlsWH3t5UF8c7PyoTmNUOQhTun4mTgxbKJOOjGSzoYsPn+dln2lNvSQAaj+ZZbjZL4yN4ZWK3Zps5XpPY1sEAjWQOAm2dMFMs2ne6xFmTmPjrmMjkYbH3OALcgZ8C7So=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7903b3c1-b771-4fbc-9935-68ba769b23cc,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:3afecd97-7410-4084-8094-24619d975b02,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dabc9b3c323f11f0bed96b30c12bc3d6-20250516
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1262642889; Fri, 16 May 2025 03:23:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 16 May 2025 18:23:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 16 May 2025 18:23:44 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v4 1/2] net: phy: mediatek: Sort config and file names in Kconfig and Makefile
Date: Fri, 16 May 2025 18:23:26 +0800
Message-ID: <20250516102327.2014531-2-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250516102327.2014531-1-SkyLake.Huang@mediatek.com>
References: <20250516102327.2014531-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_032350_611858_078756B6 
X-CRM114-Status: GOOD (  11.70  )
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

Sort config and file names in Kconfig and Makefile in
drivers/net/phy/mediatek/ in alphabetical order.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/Kconfig  | 6 +++---
 drivers/net/phy/mediatek/Makefile | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index 2a8ac5aed0f8..29a09d39ff6f 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config MTK_NET_PHYLIB
-	tristate
-
 config MEDIATEK_GE_PHY
 	tristate "MediaTek Gigabit Ethernet PHYs"
 	select MTK_NET_PHYLIB
@@ -25,3 +22,6 @@ config MEDIATEK_GE_SOC_PHY
 	  the MT7981 and MT7988 SoCs. These PHYs need calibration data
 	  present in the SoCs efuse and will dynamically calibrate VCM
 	  (common-mode voltage) during startup.
+
+config MTK_NET_PHYLIB
+	tristate
diff --git a/drivers/net/phy/mediatek/Makefile b/drivers/net/phy/mediatek/Makefile
index 814879d0abe5..14b2c17b3f8f 100644
--- a/drivers/net/phy/mediatek/Makefile
+++ b/drivers/net/phy/mediatek/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_MTK_NET_PHYLIB)		+= mtk-phy-lib.o
 obj-$(CONFIG_MEDIATEK_GE_PHY)		+= mtk-ge.o
 obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mtk-ge-soc.o
+obj-$(CONFIG_MTK_NET_PHYLIB)		+= mtk-phy-lib.o
-- 
2.45.2


