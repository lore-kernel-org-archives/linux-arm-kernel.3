Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8C0C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTQRZWLuMJ5D27J6h2Zq5ShMXuTwnBEXA38JAQRrfHs=; b=j9MfDTeMWpJOjjSnZpvTJecsG/
	Ac0eYFLqgTdzfhFC8K2ftXs6AEVaMsHqVG2akLxf6oHf89ZN9QKYJHXPf+Bgt4szKYeSWao7MzE7X
	zJMg2/qwYlEWcekhLdrpy9IrexkOQJJJ9ix/p/RU/XHEENhHk9u4s5hIVqh2F0N4viFmsut6dTWKU
	+O4Ct/Acn4/dqeXpN9YX1zV4plP60iGxs3uZoPjpBNAXgiZGmHNwXuakM/btXUsSeMIa9e1vWfGCg
	zkd261rCgwz4wi1jMkMnfUz9FRCjh7Txx1Umls3pLpQ0joG+YW0EwMQpDS2jKmpTldwpoMDslq0Gp
	bd4LDhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiA8H-000000070c4-3mTy;
	Wed, 12 Feb 2025 10:38:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Xb-00000006tgv-3Zj6;
	Wed, 12 Feb 2025 10:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739354422;
	bh=0oCn2xELjVZlzCfZ6/7zjfuG4e61sBTLWv99cxlg43w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n8Y9Oj+sD5RPCq9diQsvFAhZ1kHJpBPrfyxShRxuzIbncDL1opgMkcmcATh6KQk95
	 AE8/iIm9qnP73psINNACJZcHjt9yFT4Qc+V5zhTAgNhNGk6DZ1q6VsUrqZNmS9/OPg
	 3ppqZcXdVminOKu53Ls7lJ4ubWLP4t8+HO7GxWflnKlfvHMwTr0U0d/jEG2zWtM5Wt
	 Jvirn/UI9WX5JVuvTDE5NqbFxlXEPFOMzsZYF1tUYsp3bEodylTx74GC3EZYksfNWn
	 rMeT8699DuAneG3+WuaDVq2tMcsr6oCscYXxfoFOh+TFHo0N/6ueN/jJGHGxqgcaRf
	 idzrBPoHu5eVw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCD9117E155A;
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
Subject: [PATCH v1 6/8] soc: mediatek: mt8365-mmsys: Fix routing table masks and values
Date: Wed, 12 Feb 2025 11:00:10 +0100
Message-ID: <20250212100012.33001-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
References: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020024_061952_F7D2E463 
X-CRM114-Status: GOOD (  14.21  )
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

The mmsys driver reads the routing table and writes to the
hardware `val & mask`, but multiple entries in the mmsys
routing table for the MT8365 SoC are setting a 0x0 mask:
this effectively writes .. nothing .. to the hardware.

That would never work, and if the display controller was
actually working with the mmsys doing no routing at all,
that was only because the bootloader was correctly setting
the display controller routing registers before booting the
kernel, and the mmsys was never reset.

Make this table to actually set the routing by adding the
correct register masks to it.

While at it, also change MOUT val definitions to BIT(x), as
the MOUT registers are effectively checking for each bit to
enable output to the corresponding HW.
Please note that, for this SoC, only the MOUT registers are
checking bits (as those can enable multiple outputs), while
the others are purely reading a number to select an input.

Fixes: bc3fc5c05100 ("soc: mediatek: mmsys: add MT8365 support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8365-mmsys.h | 48 ++++++++++++-----------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/soc/mediatek/mt8365-mmsys.h b/drivers/soc/mediatek/mt8365-mmsys.h
index 7abaf048d91e..ae37945e6c67 100644
--- a/drivers/soc/mediatek/mt8365-mmsys.h
+++ b/drivers/soc/mediatek/mt8365-mmsys.h
@@ -14,8 +14,9 @@
 #define MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN		0xfd8
 #define MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00	0xfdc
 
+#define MT8365_DISP_MS_IN_OUT_MASK			GENMASK(3, 0)
 #define MT8365_RDMA0_SOUT_COLOR0			0x1
-#define MT8365_DITHER_MOUT_EN_DSI0			0x1
+#define MT8365_DITHER_MOUT_EN_DSI0			BIT(0)
 #define MT8365_DSI0_SEL_IN_DITHER			0x1
 #define MT8365_RDMA0_SEL_IN_OVL0			0x0
 #define MT8365_RDMA0_RSZ0_SEL_IN_RDMA0			0x0
@@ -30,52 +31,43 @@ static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
 		MT8365_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN,
-		MT8365_OVL0_MOUT_PATH0_SEL, MT8365_OVL0_MOUT_PATH0_SEL
-	},
-	{
+		MT8365_DISP_MS_IN_OUT_MASK, MT8365_OVL0_MOUT_PATH0_SEL
+	}, {
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
 		MT8365_DISP_REG_CONFIG_DISP_RDMA0_SEL_IN,
-		MT8365_RDMA0_SEL_IN_OVL0, MT8365_RDMA0_SEL_IN_OVL0
-	},
-	{
+		MT8365_DISP_MS_IN_OUT_MASK, MT8365_RDMA0_SEL_IN_OVL0
+	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
 		MT8365_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL,
-		MT8365_RDMA0_SOUT_COLOR0, MT8365_RDMA0_SOUT_COLOR0
-	},
-	{
+		MT8365_DISP_MS_IN_OUT_MASK, MT8365_RDMA0_SOUT_COLOR0
+	}, {
 		DDP_COMPONENT_COLOR0, DDP_COMPONENT_CCORR,
 		MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN,
-		MT8365_DISP_COLOR_SEL_IN_COLOR0,MT8365_DISP_COLOR_SEL_IN_COLOR0
-	},
-	{
+		MT8365_DISP_MS_IN_OUT_MASK, MT8365_DISP_COLOR_SEL_IN_COLOR0
+	}, {
 		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8365_DISP_REG_CONFIG_DISP_DITHER0_MOUT_EN,
-		MT8365_DITHER_MOUT_EN_DSI0, MT8365_DITHER_MOUT_EN_DSI0
-	},
-	{
+		MT8365_DISP_MS_IN_OUT_MASK, MT8365_DITHER_MOUT_EN_DSI0
+	}, {
 		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN,
-		MT8365_DSI0_SEL_IN_DITHER, MT8365_DSI0_SEL_IN_DITHER
-	},
-	{
+		MT8365_DISP_MS_IN_OUT_MASK, MT8365_DSI0_SEL_IN_DITHER
+	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
 		MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN,
-		MT8365_RDMA0_RSZ0_SEL_IN_RDMA0, MT8365_RDMA0_RSZ0_SEL_IN_RDMA0
-	},
-	{
+		MT8365_DISP_MS_IN_OUT_MASK, MT8365_RDMA0_RSZ0_SEL_IN_RDMA0
+	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
 		MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00,
 		MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK, MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK
-	},
-	{
+	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
 		MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN,
-		MT8365_DPI0_SEL_IN_RDMA1, MT8365_DPI0_SEL_IN_RDMA1
-	},
-	{
+		MT8365_DISP_MS_IN_OUT_MASK, MT8365_DPI0_SEL_IN_RDMA1
+	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
 		MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL,
-		MT8365_RDMA1_SOUT_DPI0, MT8365_RDMA1_SOUT_DPI0
+		MT8365_DISP_MS_IN_OUT_MASK, MT8365_RDMA1_SOUT_DPI0
 	},
 };
 
-- 
2.48.1


