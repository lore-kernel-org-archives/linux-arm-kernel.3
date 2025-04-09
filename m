Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D6AC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vd/QL7cwGQw2Ko+m2PLEuUmLdJIwKboxMrJQhQQxqU=; b=DbGXRFuvsWyF7Nt2TIH9mpqSZ5
	gg2/ZHd/wE8tuNjytyCQUZ8oTy8f8l4EK880rX0mRrjjs0wNtDgsdfaIqqLt/kRRGgem4PhLTxRJe
	hvov4cvl/HP2s2jueBpkwMMVna3p0K4730n/YqSSit8CY9En9nHAfpCdFcllOT0KpkF10v5ac3zA+
	/Bg8GDNU0eny+GUd4Ou3/SzV20VcpJ6ZzGdmDGYzdTMuKEte4k8hxEpk1N6JhzJ62q86wsrQRTFdV
	UJ8bY6XR7rPPBc1lyFpaaGgS7MpMTadaQ8g48ElbtjJkWDGG006DZiErEYy5PPT4UCRVsVqAr9Rut
	8kuymWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VPW-00000007HzZ-0SMl;
	Wed, 09 Apr 2025 13:24:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VF1-00000007F49-0pfS;
	Wed, 09 Apr 2025 13:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204397;
	bh=NEuXEAf0EoHvdi3tLgzyhmCbJUmfqZDU6pN1X9AaFMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AALbTqykzgOFJwXwrfudo7uMKkPLpsGgttDFYQ/SHqOVCdGLvIuMr+OiI0f3r7s3l
	 cT4p7GxNdHYQ1+z57QywB+fSapcg2pUN8qIyEZ5nMwhbS6yl2rUUUWlBcp2h6jXVmW
	 f1myxybJ6YqDKKos0Cg6YGg7TNBn3CnAj/ET46w3wSGG+CGdghGPZAs30hoZ0Ho2BB
	 hJqa3pbv0LKe2+BGG3L+7ibaoDI2GVXnw1W3yylMmwIvBhwBVCnMPE0QC21SoJwvp9
	 BjmmC0qUeyIx3JVSkgOHiCb8FbRQ9iReaBMg098MnjgoA1UkGauCZg4S1fC/ESO32U
	 V3H25MdeUH0SQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C775917E0FC1;
	Wed,  9 Apr 2025 15:13:16 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v1 5/5] drm/mediatek: mtk_dpi: Rename output fmts array for MT8195 DP_INTF
Date: Wed,  9 Apr 2025 15:13:06 +0200
Message-ID: <20250409131306.108635-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061319_918624_80B730AE 
X-CRM114-Status: UNSURE (   9.78  )
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

For the sake of increasing human readability and avoid possible
confusion between DPI and DP_INTF output formats (as the two are
ever so slightly different), rename the mt8195_output_fmts array
to mt8195_dp_intf_output_fmts.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 9de537a77493..0b7f91fb519f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1106,7 +1106,7 @@ static const u32 mt8195_dpi_output_fmts[] = {
 	MEDIA_BUS_FMT_YUV10_1X30,
 };
 
-static const u32 mt8195_output_fmts[] = {
+static const u32 mt8195_dp_intf_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 	MEDIA_BUS_FMT_RGB888_2X12_LE,
 	MEDIA_BUS_FMT_RGB888_2X12_BE,
@@ -1248,8 +1248,8 @@ static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.dpi_factor = dpi_factor_mt8195_dp_intf,
 	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8195_dp_intf),
 	.max_clock_khz = 600000,
-	.output_fmts = mt8195_output_fmts,
-	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
+	.output_fmts = mt8195_dp_intf_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8195_dp_intf_output_fmts),
 	.pixels_per_iter = 4,
 	.dimension_mask = DPINTF_HPW_MASK,
 	.hvsize_mask = DPINTF_HSIZE_MASK,
-- 
2.49.0


