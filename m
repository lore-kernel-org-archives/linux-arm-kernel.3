Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3943DE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t34M54e0o8wVUPWIHGdqqZcLLUNuEd48S7sCIGNF1L4=; b=OG0CCIQnQa1UxpWos1K+Kxqv+m
	/iyNuYX1xemMsVPjj1ltM+sd910AlZKjyvStTzoNAEC+5VD5s96apH/3kzuCFvPbnxLGmwsPfoxyh
	AcemO7cibA39UM/upXptq8toI10QMX8QPtTvvK2Ol+CuJFAg/x6cgT3I+AtZjOb3lbQy0/UQkD2nA
	kJMc+iqY0SWcD6/NKS1tcHNpiYsVzNr2Og0p7lp9CNHBs5uRfs0DsoOJ4U3YThOQ53q3qOApgCxw+
	uKKy0wYizdGO464X7Thm9PzLp+xiCV9CksdJAgHaqP9Mut2EqDGij4Bh4Zf47VG7m2ML9VaSSyU4m
	zAfboqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJARF-0000000FoUr-3Imh;
	Thu, 05 Dec 2024 11:54:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAIh-0000000Fm0K-0uKH;
	Thu, 05 Dec 2024 11:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733399141;
	bh=3eME8UfPEfZdlFmVGNRby9khB502c4tpaAyif4VnZHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bm855CSddzgdBtKKFYvtKnwV/oTsGRg8+ROPK8hL2hFNqLntj181E1vhl/KFHbQ+q
	 g9mFLbazfQDcPK7rbViswNJsS4VWAIZPE05Q8mt5KBAcribo2TIcBaI6gWSOBykTP9
	 ZeAdRuKG/sELrTOcTofUXlbTrHVKEE/umDX7uUM9q60BrZ8pvb18hXqvAXO7F8Uxab
	 3o0wCF4maO/vSE20ZgAMCaU9J6GU/7TUtj6q46rwMVIzTczZkSb4FMcrn2wK31RSmy
	 HC6VF+NLdqonXihrJTpanIX1/82/cHLiKCjfMQUli9EjMQmKWG37d8Nv7ly3cc69Ev
	 M4cP5zySdI/dQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE8F017E363B;
	Thu,  5 Dec 2024 12:45:40 +0100 (CET)
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
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 05/15] drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
Date: Thu,  5 Dec 2024 12:45:07 +0100
Message-ID: <20241205114518.53527-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_034543_406108_DE34182D 
X-CRM114-Status: GOOD (  13.24  )
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

In preparation for adding support for newer DPI instances which
do support direct-pin but do not have any H_FRE_CON register,
like the one found in MT8195 and MT8188, add a branch to check
if the reg_h_fre_con variable was declared in the mtk_dpi_conf
structure for the probed SoC DPI version.

As a note, this is useful specifically only for cases in which
the support_direct_pin variable is true, so mt8195-dpintf is
not affected by any issue.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 378b49b6bdfb..79923d1bfbc9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -430,12 +430,13 @@ static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool enable)
 
 static void mtk_dpi_config_2n_h_fre(struct mtk_dpi *dpi)
 {
-	mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, H_FRE_2N, H_FRE_2N);
+	if (dpi->conf->reg_h_fre_con)
+		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, H_FRE_2N, H_FRE_2N);
 }
 
 static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
 {
-	if (dpi->conf->edge_sel_en)
+	if (dpi->conf->edge_sel_en && dpi->conf->reg_h_fre_con)
 		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
 }
 
-- 
2.47.0


