Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1224E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cWQvY1dmKWTj9h0fpLQrdBY556hc2VzVio+GQthHH34=; b=3/ifjUTXGEf3L6yz59GFHNdK4N
	HIwFSb9JEtLp8d5fxlUOO5Oxmvl+TEA/Q++YMGlSXsvB0KPXAhwmj1oNCHp6RR0oRYHzTF2GrHy7a
	zlK5bl1mNk/gT6+NtYTJjSLhl+AvN87CAgk1LY1kOj4NQqtEKbsFE+/SjMNJVOb+rpamD60uXepf3
	DZue44uBUfJ9KqKBf+1+pvO3tw/cRlaXaUMNRKelEtgkNGvjdEhLey85urPVD7ZRFpJIqIECLg8XX
	lJaRyamHAgW+38WNddKu3sPGhMuCyPzWUq0DEjMmhqX1qv2pdBY2X8gdabk37Gi8uTxS6yvU2U+pd
	h/JmHb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEi6-00000001fPO-1UOF;
	Thu, 19 Dec 2024 11:28:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEh0-00000001fC3-0cY3;
	Thu, 19 Dec 2024 11:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734607664;
	bh=jGr7l1XjdNoaC0hYd6vP62G59dS8Dz8DoHtLTvY76g0=;
	h=From:To:Cc:Subject:Date:From;
	b=e5+nyAyamOIu7fWUIPaXaf/Vs/tR7aquS0QbTD8itJHfrii2AAZ/gAutWBabmxe9N
	 MTfRPQ1sYyFdImTI92AE7rdtnpw5jfoRf+ogq3YRUnAIIj7v18Y4eCsZkoH+WfAJP7
	 aGUvEC8ygCDMu4T8BOnjtoQL5lQa5WgMfzJrBaCND0JvEIVCbQx9UghBDuCHHaekn1
	 6Z+G7sx5KY8hUIkurpFtTcTsk8mOaEv14YklKJtkBg+JIVfFHYsv6OOwMV8Ash0kao
	 3/Q/hkhtJP50sm6kQF2H9+mjBbxW8XNlbdUtwUXLDFMTWRE4vBNBKlkIfeRrwGcaH1
	 uSu7h6R9BGOcA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92A8217E35FC;
	Thu, 19 Dec 2024 12:27:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	rex-bc.chen@mediatek.com,
	xinlei.lee@mediatek.com,
	shuijing.li@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] drm/mediatek: mtk_dsi: Add registers to pdata to fix MT8186/MT8188
Date: Thu, 19 Dec 2024 12:27:33 +0100
Message-ID: <20241219112733.47907-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_032746_380148_EA0CA0FC 
X-CRM114-Status: GOOD (  13.00  )
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

Registers DSI_VM_CMD and DSI_SHADOW_DEBUG start at different
addresses in both MT8186 and MT8188 compared to the older IPs.

Add two members in struct mtk_dsi_driver_data to specify the
offsets for these two registers on a per-SoC basis, then do
specify those in all of the currently present SoC driver data.

This fixes writes to the Video Mode Command Packet Control
register, fixing enablement of command packet transmission
(VM_CMD_EN) and allowance of this transmission during the
VFP period (TS_VFP_EN) on both MT8186 and MT8188.

Fixes: 03d7adc41027 ("drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c")
Fixes: 814d5341f314 ("drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e61b9bc68e9a..978332cd52f5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -139,11 +139,11 @@
 #define CLK_HS_POST			GENMASK(15, 8)
 #define CLK_HS_EXIT			GENMASK(23, 16)
 
-#define DSI_VM_CMD_CON		0x130
+/* DSI_VM_CMD_CON */
 #define VM_CMD_EN			BIT(0)
 #define TS_VFP_EN			BIT(5)
 
-#define DSI_SHADOW_DEBUG	0x190U
+/* DSI_SHADOW_DEBUG */
 #define FORCE_COMMIT			BIT(0)
 #define BYPASS_SHADOW			BIT(1)
 
@@ -187,6 +187,8 @@ struct phy;
 
 struct mtk_dsi_driver_data {
 	const u32 reg_cmdq_off;
+	const u32 reg_vm_cmd_off;
+	const u32 reg_shadow_dbg_off;
 	bool has_shadow_ctl;
 	bool has_size_ctl;
 	bool cmdq_long_packet_ctl;
@@ -367,8 +369,8 @@ static void mtk_dsi_set_mode(struct mtk_dsi *dsi)
 
 static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
 {
-	mtk_dsi_mask(dsi, DSI_VM_CMD_CON, VM_CMD_EN, VM_CMD_EN);
-	mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
+	mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, VM_CMD_EN, VM_CMD_EN);
+	mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, TS_VFP_EN, TS_VFP_EN);
 }
 
 static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
@@ -714,7 +716,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 
 	if (dsi->driver_data->has_shadow_ctl)
 		writel(FORCE_COMMIT | BYPASS_SHADOW,
-		       dsi->regs + DSI_SHADOW_DEBUG);
+		       dsi->regs + dsi->driver_data->reg_shadow_dbg_off);
 
 	mtk_dsi_reset_engine(dsi);
 	mtk_dsi_phy_timconfig(dsi);
@@ -1263,26 +1265,36 @@ static void mtk_dsi_remove(struct platform_device *pdev)
 
 static const struct mtk_dsi_driver_data mt8173_dsi_driver_data = {
 	.reg_cmdq_off = 0x200,
+	.reg_vm_cmd_off = 0x130,
+	.reg_shadow_dbg_off = 0x190
 };
 
 static const struct mtk_dsi_driver_data mt2701_dsi_driver_data = {
 	.reg_cmdq_off = 0x180,
+	.reg_vm_cmd_off = 0x130,
+	.reg_shadow_dbg_off = 0x190
 };
 
 static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
 	.reg_cmdq_off = 0x200,
+	.reg_vm_cmd_off = 0x130,
+	.reg_shadow_dbg_off = 0x190,
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
 };
 
 static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
 	.reg_cmdq_off = 0xd00,
+	.reg_vm_cmd_off = 0x200,
+	.reg_shadow_dbg_off = 0xc00,
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
 };
 
 static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 	.reg_cmdq_off = 0xd00,
+	.reg_vm_cmd_off = 0x200,
+	.reg_shadow_dbg_off = 0xc00,
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
 	.cmdq_long_packet_ctl = true,
-- 
2.47.0


