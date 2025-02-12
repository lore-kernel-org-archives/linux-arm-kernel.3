Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDC6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ql6oVQymJklkJ3CdReWxQcHnX6EMJ1+fL6Tt+ynPEV0=; b=ln3pCI5QYMk3tX259TomO55Qpm
	cck1K5zUnJt2Wo0O58tUdb078SzDtrnzQt83e0CWQO7/tO2DQX00D+BJZP//pTIvr89Z0gVZMBJ+n
	aNOx2oU8VDZzA7/6x+lJApt4sRtqmPg+7Uvv13XE2R4zn6G7LWnxCWo5enkGtQfp5cNkgQIgknGCj
	mGYEN/jmBRAmGLeVgtg8Q+NCh+8wxaDpKztRvHuMUiv3ARCuGXbgyPiFqfcX4lEUuU5t4iVohQWbu
	ZiU3Vijgfen3/dyIqqpawW1wJlUaQGVHmZSU7hzf+vl+d0csg7+yoxT+EVhYjQa/rvy+iwkiLSj/0
	2gYHNojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9on-00000006xN3-0ySL;
	Wed, 12 Feb 2025 10:18:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9XY-00000006tfS-0kmc;
	Wed, 12 Feb 2025 10:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739354418;
	bh=qynKhi81CSVOJ9xLgAOiLR+1L935dUl3dgyGcUiHllI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBSUKoHNjJzWnnwXt1RNx3wGeoi/fx/4c4XIERCcMcR4PXxNDbY0dcT3geIG3d+P5
	 D14p8VN97La6g4MK+kaZ5Oygz+g+jzaaTLVzW4kKuiMPekhEzld0PFETyDQgH7FG5h
	 TES+74apyKdZwk+UgCEQBPh2tfBp/8ZYuMWPOVKDr/Arw9jE1mFCHJfWgl/LYFjXYW
	 SnafCHLVgYI77CqXtd+Y/4xjn3sSPfSYqtDNq0VwMX48OOA/BkHVAw9KTzeM+m4UcU
	 6Z7LXHYcWKNBNbo6l6U49bhx9YFHZSXhfZvni+Lph8FZLfJOxRX5/P5Xehruu1A0Ug
	 yVNnGejtO5s5g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F7ED17E0F68;
	Wed, 12 Feb 2025 11:00:18 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	shawn.sung@mediatek.com,
	fparent@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pablo.sun@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v1 1/8] soc: mediatek: mtk-mutex: Add DPI1 SOF/EOF to MT8188 mutex tables
Date: Wed, 12 Feb 2025 11:00:05 +0100
Message-ID: <20250212100012.33001-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
References: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020020_363531_3929F488 
X-CRM114-Status: UNSURE (   9.27  )
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

MT8188 uses DPI1 to output to the HDMI controller: add the
Start of Frame and End of Frame configuration for the DPI1
IP to the tables to unblock generation and sending of these
signals to the GCE.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 5250c1d702eb..aaa965d4b050 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -155,6 +155,7 @@
 #define MT8188_MUTEX_MOD_DISP1_VPP_MERGE3	23
 #define MT8188_MUTEX_MOD_DISP1_VPP_MERGE4	24
 #define MT8188_MUTEX_MOD_DISP1_DISP_MIXER	30
+#define MT8188_MUTEX_MOD_DISP1_DPI1		38
 #define MT8188_MUTEX_MOD_DISP1_DP_INTF1		39
 
 #define MT8195_MUTEX_MOD_DISP_OVL0		0
@@ -289,6 +290,7 @@
 #define MT8188_MUTEX_SOF_DSI0			1
 #define MT8188_MUTEX_SOF_DP_INTF0		3
 #define MT8188_MUTEX_SOF_DP_INTF1		4
+#define MT8188_MUTEX_SOF_DPI1			5
 #define MT8195_MUTEX_SOF_DSI0			1
 #define MT8195_MUTEX_SOF_DSI1			2
 #define MT8195_MUTEX_SOF_DP_INTF0		3
@@ -301,6 +303,7 @@
 #define MT8188_MUTEX_EOF_DSI0			(MT8188_MUTEX_SOF_DSI0 << 7)
 #define MT8188_MUTEX_EOF_DP_INTF0		(MT8188_MUTEX_SOF_DP_INTF0 << 7)
 #define MT8188_MUTEX_EOF_DP_INTF1		(MT8188_MUTEX_SOF_DP_INTF1 << 7)
+#define MT8188_MUTEX_EOF_DPI1			(MT8188_MUTEX_SOF_DPI1 << 7)
 #define MT8195_MUTEX_EOF_DSI0			(MT8195_MUTEX_SOF_DSI0 << 7)
 #define MT8195_MUTEX_EOF_DSI1			(MT8195_MUTEX_SOF_DSI1 << 7)
 #define MT8195_MUTEX_EOF_DP_INTF0		(MT8195_MUTEX_SOF_DP_INTF0 << 7)
@@ -472,6 +475,7 @@ static const u8 mt8188_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_PWM0] = MT8188_MUTEX_MOD2_DISP_PWM0,
 	[DDP_COMPONENT_DP_INTF0] = MT8188_MUTEX_MOD_DISP_DP_INTF0,
 	[DDP_COMPONENT_DP_INTF1] = MT8188_MUTEX_MOD_DISP1_DP_INTF1,
+	[DDP_COMPONENT_DPI1] = MT8188_MUTEX_MOD_DISP1_DPI1,
 	[DDP_COMPONENT_ETHDR_MIXER] = MT8188_MUTEX_MOD_DISP1_DISP_MIXER,
 	[DDP_COMPONENT_MDP_RDMA0] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA0,
 	[DDP_COMPONENT_MDP_RDMA1] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA1,
@@ -686,6 +690,8 @@ static const u16 mt8188_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] =
 		MT8188_MUTEX_SOF_DSI0 | MT8188_MUTEX_EOF_DSI0,
+	[MUTEX_SOF_DPI1] =
+		MT8188_MUTEX_SOF_DPI1 | MT8188_MUTEX_EOF_DPI1,
 	[MUTEX_SOF_DP_INTF0] =
 		MT8188_MUTEX_SOF_DP_INTF0 | MT8188_MUTEX_EOF_DP_INTF0,
 	[MUTEX_SOF_DP_INTF1] =
-- 
2.48.1


