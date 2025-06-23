Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80C8C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sfU3Ax2lC1phJmCRq7qXLS8WVZdpVT4IrfwEya0YpI=; b=kQGBW6md+WjIOnz5auTc4XKWv6
	RhZ8UW5PQa6Zn2ucdhzLyvNRXBjydfLHWJMY95H0VFC9GxbUbGKhkYJxouwGyxGUpS3HQvZ81JoFF
	F3AFgd7+TgAr94jz5pPPvsBrVPkuFSMOYR35nZv7wi2fmrQCAdePfG+uIQrs+7IqnvqMDOl9R5bLS
	0TNrSuaX9jgDlnJv0HrrL4nXldDtXeZfGp/GCkkMiaXtaIDSqsSAJtlFWfkkEDyJxQGaU2pNbwvf3
	vdg6/VrhfDvGzDrX0hW9J07WI+QqxhMp90dqRyHkpy4g7euWeJbNyZH0mlcHoFOqYEHShpG4SGwpJ
	jXIPxDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiZB-0000000388l-00gL;
	Mon, 23 Jun 2025 14:54:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfs2-00000002b9I-08GC;
	Mon, 23 Jun 2025 12:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680112;
	bh=RvKfNvTGbOQFn1QyzjQzGAKKfTfMoWOIXhrv2ucXpIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qrkE9vPK0M2IJReSi0i2qt0L0EoPgLB4/3+dbFZL+B1YdmFvQgsZfngaKEQRVciNO
	 c7+Bq4CFDUSZzEZGj7cScl4v6lHwvPXULkTpp5Z0iyp0HdSbBSsyoydN1QE2A52eti
	 g/eYvTZfnBfzCP2WMuEnpVcPVSznVEzAZughxssuFaIz1lmZS8bmxQmzJJKsXLvjOj
	 qIhfarD3iEaPe/OqK+z11hGKXp6NdNY6KJEKuP7w9ZhAq1VZBMcjmZmeIZCh3r2T7I
	 tc6P9QCPamB9IO86/ZpGfIBlf5TLGCOrP2WtfP2RL6E0oOxQqCT+FDX3lQnaAOK8+9
	 T8K61Rcc0wa0w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E54117E156D;
	Mon, 23 Jun 2025 14:01:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 4/4] regulator: mtk-dvfsrc: Add support for MediaTek MT8196 DVFSRC
Date: Mon, 23 Jun 2025 14:01:44 +0200
Message-ID: <20250623120144.109359-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
References: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050154_214118_37ADCE67 
X-CRM114-Status: UNSURE (   9.90  )
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

The MediaTek MT8196 Chromebook SoC features one DVFSRC regulator
with 6 voltage steps.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index 5bc4d85517f0..c0c9a6751c26 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -166,6 +166,24 @@ static const struct dvfsrc_regulator_pdata mt8195_data = {
 	.size = ARRAY_SIZE(mt8195_regulators),
 };
 
+static const unsigned int mt8196_voltages[] = {
+	575000,
+	600000,
+	650000,
+	725000,
+	825000,
+	875000,
+};
+
+static const struct regulator_desc mt8196_regulators[] = {
+	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt8196_voltages),
+};
+
+static const struct dvfsrc_regulator_pdata mt8196_data = {
+	.descs = mt8196_regulators,
+	.size = ARRAY_SIZE(mt8196_regulators),
+};
+
 static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
 {
 	struct regulator_config config = { .dev = &pdev->dev };
@@ -195,6 +213,7 @@ static const struct of_device_id mtk_dvfsrc_regulator_match[] = {
 	{ .compatible = "mediatek,mt8183-dvfsrc-regulator", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-dvfsrc-regulator", .data = &mt6873_data },
 	{ .compatible = "mediatek,mt8195-dvfsrc-regulator", .data = &mt8195_data },
+	{ .compatible = "mediatek,mt8196-dvfsrc-regulator", .data = &mt8196_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_dvfsrc_regulator_match);
-- 
2.49.0


