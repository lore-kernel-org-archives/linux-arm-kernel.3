Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEC3C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+2xCRyRWIlpfyXocGr2v+nmg6Pag4z15bzbo2ZWoRE=; b=5Gk9iYQih5h+OyCu2uCOB6RwR4
	8gm+B8/OMWA7q2eVZLCSux3amh6ZlcM2ZVJeBRxNW8RZ+20oJdduTkFqmBeLe9519fkrzRVOSA6D1
	QsKwOZPVOCEpLAUBlhUp6g38ydpAqsUHP+rOw7Va8TKH8+MeYd74CUabFJA0FBFzR0cg0Qgh5tjD1
	VCd1lfB86ih6i36/Ln+BfwpAe8kEhgBgAelxlKGZDGU5Nok22L2uhJN2FEbNQTV+dwqaCRQfArR8J
	HWvY7b2CSGuBoB4MkVH9RhXY7t2/Ny1V4BWjwF2MWA8fG+PlNupQf5e/QV9XzmDYthwJ8yyH2/Edl
	M3IxG0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thoh2-00000003c8P-1YCm;
	Tue, 11 Feb 2025 11:44:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoX7-00000003YUb-1UBj;
	Tue, 11 Feb 2025 11:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273668;
	bh=6YtIqDQxt7GRfowPju5lJsPbi5k5jOuxltBvNYyf+hg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qhxQkSQHj17nOq10DOOLVqZHBng7LDBFaEKstHlDC1NEO9FPrxsVBu3MGMQZEdDJE
	 k0i1zP/UA0ik0yyzHpLD60jDzeNzsYaEwUjryVszYaGoCVIIzhIoL/NdShb6WsMm0Q
	 wPKsm5wCtg0x2NkTifa7yWJN5m/UxMyi3Kw1dEbFmXJZzuB8h7/M/DF4zu0ZewU4v/
	 aDRIobwIoubu0s3+JDAnyv0PJc8xUoQ3zjETRa4l9ZohGM+vZzyfcfs2zvs5MBQPGK
	 QWzlEIVmcc/PmAjq9lWzqzqCq7hZN5KJKh+ztKUJoLBUilZjHDl4uEcRUm9pwanuXw
	 0+9fmja9aNiqQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFCBB17E1548;
	Tue, 11 Feb 2025 12:34:26 +0100 (CET)
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
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v6 05/42] drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
Date: Tue, 11 Feb 2025 12:33:32 +0100
Message-ID: <20250211113409.1517534-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033429_554864_2F8593DF 
X-CRM114-Status: GOOD (  13.15  )
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
index 59c2e4f32a61..bb1a17f1384b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -431,12 +431,13 @@ static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool enable)
 
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
2.48.1


