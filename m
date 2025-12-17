Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB9AD6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Y9Ch57tOKhVufF9cmzjO6tWSgN0ZIChZXqQm0qwLh4=; b=ER/CIPde0lxlQoDI6ozjPjmjp/
	cUZ/75pFHFkbqFnqtJeJ4blwZ8x8TCC+5K+Dx1dU4dmtPgKJF6u57qPq8Cz3UuDbJ+K99P8q3MmjU
	zSo1qhz60t8ocJF6gt5tCMnEs985hkQsP6gEHVji5hPj2L8JHs6fylqHCOlDspAhR8AbtZEajKt9z
	0qe40EXbvhDZkKBAAroIrJXWLcqQO2L74sN4jlqpeyovqpziOcloyCr7f0+5Do+jcCIDsTRPxi1+D
	FqZM0prtYoaP6OkRky23N3j+MSTTO5ZiWmhN3dzSlccmP9xcMXjO6DS/ymAwy7yDJricR2MqyYC36
	OrCxYljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVokQ-00000006eJ6-0OcN;
	Wed, 17 Dec 2025 10:27:10 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVokI-00000006eFV-2FPc;
	Wed, 17 Dec 2025 10:27:05 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id D3FDA100725;
	Wed, 17 Dec 2025 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1765967216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Y9Ch57tOKhVufF9cmzjO6tWSgN0ZIChZXqQm0qwLh4=;
	b=bh/lpvlgOfcKCDgjVc/yFKmCtzHpXOm2xj71Jdeej1sz79Nz1e5udhB8tIk5UjDjKNTpIA
	C0SZsGi6KyBNM0skPOZYwIIJBn6eGjxFCV64JXay1sflK+rHoxV1sZ1037olGpNAfHD/8T
	vvLA+BxmKcJjyPwvUUTuagIGHmEl33w=
Received: from frank-u24.. (fttx-pool-217.61.152.85.bambit.de [217.61.152.85])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 9553F122725;
	Wed, 17 Dec 2025 10:26:55 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mason Chang <mason-cw.chang@mediatek.com>
Subject: [RFC net-next v4 1/3] net: ethernet: mtk_eth_soc: Add register definitions for RSS and LRO
Date: Wed, 17 Dec 2025 11:26:42 +0100
Message-ID: <20251217102648.47093-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217102648.47093-1-linux@fw-web.de>
References: <20251217102648.47093-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_022703_214893_0D3CB056 
X-CRM114-Status: GOOD (  10.20  )
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

From: Mason Chang <mason-cw.chang@mediatek.com>

Add definitions for Receive Side Scaling and Large Receive Offload support.

Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 23 +++++++++++++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 32 +++++++++++++++------
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e68997a29191..243ff16fd15e 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -50,13 +50,18 @@ static const struct mtk_reg_map mtk_reg_map = {
 		.rx_ptr		= 0x0900,
 		.rx_cnt_cfg	= 0x0904,
 		.pcrx_ptr	= 0x0908,
+		.lro_ctrl_dw0   = 0x0980,
 		.glo_cfg	= 0x0a04,
 		.rst_idx	= 0x0a08,
 		.delay_irq	= 0x0a0c,
 		.irq_status	= 0x0a20,
 		.irq_mask	= 0x0a28,
 		.adma_rx_dbg0	= 0x0a38,
+		.lro_alt_score_delta	= 0x0a4c,
 		.int_grp	= 0x0a50,
+		.lro_rx1_dly_int	= 0x0a70,
+		.lro_ring_dip_dw0	= 0x0b04,
+		.lro_ring_ctrl_dw1	= 0x0b28,
 	},
 	.qdma = {
 		.qtx_cfg	= 0x1800,
@@ -113,6 +118,7 @@ static const struct mtk_reg_map mt7986_reg_map = {
 	.tx_irq_mask		= 0x461c,
 	.tx_irq_status		= 0x4618,
 	.pdma = {
+		.rss_glo_cfg    = 0x2800,
 		.rx_ptr		= 0x4100,
 		.rx_cnt_cfg	= 0x4104,
 		.pcrx_ptr	= 0x4108,
@@ -123,6 +129,12 @@ static const struct mtk_reg_map mt7986_reg_map = {
 		.irq_mask	= 0x4228,
 		.adma_rx_dbg0	= 0x4238,
 		.int_grp	= 0x4250,
+		.int_grp3	= 0x422c,
+		.lro_ctrl_dw0	= 0x4180,
+		.lro_alt_score_delta	= 0x424c,
+		.lro_rx1_dly_int	= 0x4270,
+		.lro_ring_dip_dw0	= 0x4304,
+		.lro_ring_ctrl_dw1	= 0x4328,
 	},
 	.qdma = {
 		.qtx_cfg	= 0x4400,
@@ -170,10 +182,21 @@ static const struct mtk_reg_map mt7988_reg_map = {
 		.glo_cfg	= 0x6a04,
 		.rst_idx	= 0x6a08,
 		.delay_irq	= 0x6a0c,
+		.rx_cfg		= 0x6a10,
 		.irq_status	= 0x6a20,
 		.irq_mask	= 0x6a28,
 		.adma_rx_dbg0	= 0x6a38,
 		.int_grp	= 0x6a50,
+		.int_grp3	= 0x6a58,
+		.tx_delay_irq	= 0x6ab0,
+		.rx_delay_irq	= 0x6ac0,
+		.lro_ctrl_dw0	= 0x6c08,
+		.lro_alt_score_delta	= 0x6c1c,
+		.lro_ring_dip_dw0	= 0x6c14,
+		.lro_ring_ctrl_dw1	= 0x6c38,
+		.lro_alt_dbg	= 0x6c40,
+		.lro_alt_dbg_data	= 0x6c44,
+		.rss_glo_cfg	= 0x7000,
 	},
 	.qdma = {
 		.qtx_cfg	= 0x4400,
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 0168e2fbc619..334625814b97 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1143,16 +1143,30 @@ struct mtk_reg_map {
 	u32	tx_irq_mask;
 	u32	tx_irq_status;
 	struct {
-		u32	rx_ptr;		/* rx base pointer */
-		u32	rx_cnt_cfg;	/* rx max count configuration */
-		u32	pcrx_ptr;	/* rx cpu pointer */
-		u32	glo_cfg;	/* global configuration */
-		u32	rst_idx;	/* reset index */
-		u32	delay_irq;	/* delay interrupt */
-		u32	irq_status;	/* interrupt status */
-		u32	irq_mask;	/* interrupt mask */
+		u32	rx_ptr;			/* rx base pointer */
+		u32	rx_cnt_cfg;		/* rx max count configuration */
+		u32	pcrx_ptr;		/* rx cpu pointer */
+		u32	pdrx_ptr;		/* rx dma pointer */
+		u32	glo_cfg;		/* global configuration */
+		u32	rst_idx;		/* reset index */
+		u32	rx_cfg;			/* rx dma configuration */
+		u32	delay_irq;		/* delay interrupt */
+		u32	irq_status;		/* interrupt status */
+		u32	irq_mask;		/* interrupt mask */
 		u32	adma_rx_dbg0;
-		u32	int_grp;
+		u32	int_grp;		/* interrupt group1 */
+		u32	int_grp3;		/* interrupt group3 */
+		u32	tx_delay_irq;		/* tx delay interrupt */
+		u32	rx_delay_irq;		/* rx delay interrupt */
+		u32	lro_ctrl_dw0;		/* lro ctrl dword0 */
+		u32	lro_alt_score_delta;	/* lro auto-learn score delta */
+		u32	lro_rx1_dly_int;	/* lro rx ring1 delay interrupt */
+		u32	lro_ring_dip_dw0;	/* lro ring dip dword0 */
+		u32	lro_ring_ctrl_dw1;	/* lro ring ctrl dword1 */
+		u32	lro_alt_dbg;		/* lro auto-learn debug */
+		u32	lro_alt_dbg_data;	/* lro auto-learn debug data */
+		u32	rss_glo_cfg;		/* rss global configuration */
+
 	} pdma;
 	struct {
 		u32	qtx_cfg;	/* tx queue configuration */
-- 
2.43.0


