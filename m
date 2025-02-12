Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45E9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZK7N0RvI1RP9meht+2jiH+DAoOo8n7KlGYjO2wfTKbE=; b=qY1rT9WtIyN6G/bzqBRnQYFcqz
	z4HBNNb8KOPxCA9EMCXn3G/t4XXppTVFh8XgXQqdg6gfrMjyQnKpcmemcaCIqViGpJmZYuzEumWUM
	1DSw+OhA3LEIZCo5Ke05Rz1HECbyev0F2emEe3VArLy5cktEJmC+8Al6qpaDL3dxQ0JXaOu5G7ZEu
	rN1T0gz6Lx760nxasn8hJmdCDP0S+zZme3y6x0V0wQybvmMSsaawO0pOsv6uFea8ZH6MS0daKgOyl
	0s1Vyrklm18dswbtnR1ILu90y8wValXhsWJCtMfe31zBPQ7M3BHDwaXLoNkiTDsAgDzpYUxwgW7Sx
	KRjPadmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiA5V-0000000705I-1he9;
	Wed, 12 Feb 2025 10:35:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Xb-00000006tgl-1cyD;
	Wed, 12 Feb 2025 10:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739354421;
	bh=5t1pOw/RmPVLN0/9D4JVG3zITCY2l9s7W0UVjdfG4SQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzZH5fRnZEcY/UbfOJWkpOi5EP9/KoZ5qpY9+K0h+siPziefb1DRSiana9Ji1TGB0
	 UoJ/ObmR5IFAOE7u22m8gEN9d+aeyM84XPGDV5yfSNzo1b4YGV6pH3NEs45XzI1MzH
	 Yu8tHcjmfVSwDRg4d13UWkEe9kA7RJExTGLZZxhQHBL49YWorXCxbQwNfQp5Y2GpBW
	 PZSvkgHiLGAtDcgHGaDaP5tvZMrx5QBF7c23j/cE/Xe4rlMNuY5iNGakBV8hL+6RJe
	 t9SPA+IzmUb3a1ydiW1hrSbMlomW3mz1Z4LR5jiAs6p/5Alhu5zp+w6XPzQgm7K0wu
	 JAnMN6nt6b7Rw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18C7517E1558;
	Wed, 12 Feb 2025 11:00:21 +0100 (CET)
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
Subject: [PATCH v1 5/8] soc: mediatek: mt8167-mmsys: Fix missing regval in all entries
Date: Wed, 12 Feb 2025 11:00:09 +0100
Message-ID: <20250212100012.33001-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
References: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020023_592510_3BA8DBD3 
X-CRM114-Status: UNSURE (   9.24  )
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

The mmsys routing table for this SoC was effectively missing
initialization of the val variable of struct mtk_mmsys_routes:
this means that `val` was incorrectly initialized to zero,
hence the registers were wrongly initialized.

Add the required regval to all of the entries of the routing
table for this SoC to fix display controller functionality.

Fixes: 060f7875bd23 ("soc: mediatek: mmsys: Add support for MT8167 SoC")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index f7a35b3656bb..655ef962abe9 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -17,18 +17,23 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
 		MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
+		OVL0_MOUT_EN_COLOR0
 	}, {
 		DDP_COMPONENT_DITHER0, DDP_COMPONENT_RDMA0,
-		MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0
+		MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0,
+		MT8167_DITHER_MOUT_EN_RDMA0
 	}, {
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
-		MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0
+		MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
+		COLOR0_SEL_IN_OVL0
 	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI0,
-		MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_RDMA0
+		MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_RDMA0,
+		MT8167_DSI0_SEL_IN_RDMA0
 	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI0,
-		MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_DSI0
+		MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_DSI0,
+		MT8167_RDMA0_SOUT_DSI0
 	},
 };
 
-- 
2.48.1


