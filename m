Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C9EC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+ZgkU5hlK6cBoEe1y7viVl5BQfLJzppOf1DUClk288=; b=r+jY1dtG0nZpM7CmojPamH/7MI
	QADWCLx0HCbUxaOFbTmuso0jE+FzlSoJXQnKIgZajFPijdwV8vQY7BdrvB08vJc365L+ND9C+Z/A+
	qBEnVCIJHZ7yPBWf5H9eBTa1pmQifKejZkqEIi9/xYLAzqO2O+1ps4uDXH0SxDa6IZdOWGa+yel+d
	ZY5lyZwRP6aIJ428FqP7j9ZlwM1Clx3BBiP6bULrzhZlbO+VCuJp5PRtuVTm6L4w3pSZ+NSFm1dOR
	fyOVONv2kGTBkraBkzn58pM+AA+zKeh2eX6jCJ2bbiDsggYRBaMbVbD4YNKC5M1j3lpGHoX2bw7NF
	g/ET0/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetw3-00000001tCZ-0dr9;
	Wed, 01 Jul 2026 12:20:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvj-00000001s0E-13Th;
	Wed, 01 Jul 2026 12:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908437;
	bh=2D0aTJgmzWJqvGnR/9KkzM/quY9ZK6V/tZuS6gdte3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d+Brl2jGq9m9uvwYzGjjGmzwnHum+t7VA/Vb9i7FFITIItXbSwuRob/SPoJCBN8nM
	 WFe6PHLe6uF2940W/1M1hvXT4XTAt3UPYobG42CG6sYglxOYL6+lbiVXwmctoBu80f
	 lb7MdbBoCovorE0fZw6PBo2mH/QLWJDA0VYMUa3Z7Y7eEGdlDmDhE/hB46V8wwKgzT
	 DkOqvmST6/4Yro2o3JhTXo0kpVE4EAaRtAwuIALZuxWKa980ZTXKcWrrs0mAUhrJiy
	 9WA7l9mbxhoQgPtVv/ukciTPavMEapmeuF5HAouHWcmBtUi/P/7SEgPc83ciymGrPy
	 TLC/hc7x3pkvQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C89E17E15A5;
	Wed,  1 Jul 2026 14:20:36 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 08/11] drm/mediatek: mtk_dp: Move max link rate to SoC specific data
Date: Wed,  1 Jul 2026 14:20:21 +0200
Message-ID: <20260701122024.19557-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_052039_473885_159450EF 
X-CRM114-Status: GOOD (  13.23  )
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

In preparation for adding support for the eDP IP found in the
MT8196 SoC, having a higher supported maximum link rate, move
this parameter to SoC data instead of statically assigning it
to the training info during initialization.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index bf3a4b15f3ec..5272e717bfda 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -167,6 +167,7 @@ struct mtk_dp_data {
 	bool audio_supported;
 	bool audio_pkt_in_hblank_area;
 	u16 audio_m_div2_bit;
+	u8 hw_max_link_rate;
 };
 
 static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -1481,7 +1482,7 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 {
 	bool plugged_in = (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP);
 
-	mtk_dp->train_info.link_rate = DP_LINK_BW_5_4;
+	mtk_dp->train_info.link_rate = mtk_dp->data->hw_max_link_rate;
 	mtk_dp->train_info.lane_count = mtk_dp->max_lanes;
 	mtk_dp->train_info.cable_plugged_in = plugged_in;
 
@@ -3013,6 +3014,7 @@ static const struct mtk_dp_data mt8188_dp_data = {
 	.audio_supported = true,
 	.audio_pkt_in_hblank_area = true,
 	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct mtk_dp_data mt8195_edp_data = {
@@ -3021,6 +3023,7 @@ static const struct mtk_dp_data mt8195_edp_data = {
 	.efuse_fmt = mt8195_edp_efuse_fmt,
 	.audio_supported = false,
 	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct mtk_dp_data mt8195_dp_data = {
@@ -3029,6 +3032,7 @@ static const struct mtk_dp_data mt8195_dp_data = {
 	.efuse_fmt = mt8195_dp_efuse_fmt,
 	.audio_supported = true,
 	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.hw_max_link_rate = DP_LINK_BW_5_4,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
-- 
2.54.0


