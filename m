Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D39EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAUDpG1Lw7CPdxYL4I5lL2O3AUcR+EJcQiK17gkwQDI=; b=qB1Y6RIaAicUZahKtX9tD3Fozl
	w8EgUT6OdbjNlzr6lq+Fq9jZXJW320u5An//0eYiQNYeMjjCfHbVxsRFBOTW9yYURA0dG0apzl1Kf
	T9zW3LjKmzT3GhHQz9atGbVUrBdLMGBXIoiT5W6p8/dOEeaX/qIWGJXU+RnTjZF0jDB6TbBGwyN0M
	/AiE6GF72WC0GccTpaOVoMy0PvnVifTNtLXAvr/NgX7YUIoWGkQ+t2WMFaS4FkCLkIXwG/tMgYD7j
	xV/BmWAYENXVOS3h/IxwS9/eHUhPIvjZG8ihc2Iiv3RUhhSlRA+qwOTn/vhr3x/HFzC1kbHXnLIST
	z0FGmInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiUV-00000003760-37rc;
	Mon, 23 Jun 2025 14:49:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfs0-00000002b86-1Usx;
	Mon, 23 Jun 2025 12:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680111;
	bh=7+3qDAZFGfiGojBDB98yfVLQi/48x5P4sLWsKLj+ByI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jqFozwkZYPw1RhWp5Z+k9+JXMOPotEdU4Yp+aLukS5qw8I+kAptS8afdE6tjGpBTD
	 CmmRq7yNZkivSExcdlsCeiS35SrmqNFIUOxWiKP8llMXO4cY3QnHR04TkDFFFwDJIY
	 y0BWlruCrqSsC7Fm0s13cb1TanOjb85HoXgoBDIM2yY6sNtCiHyOoYzVrW+r+Sh3fR
	 XUgC+tyvy9UYy6cQF6R3O4+U0ekc8XJSjnuRgdX245eOqWWpZ6dBuXNau9ZtDbKdVM
	 2TrFR39VJjzsb3x0/K9xwGmgpQYBnUou6v9hrIcjNOzIx5ta/guywMn2HCHOMpvA4j
	 S5QeDk9D4p3uw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7149817E10D5;
	Mon, 23 Jun 2025 14:01:50 +0200 (CEST)
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
Subject: [PATCH v1 2/4] regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
Date: Mon, 23 Jun 2025 14:01:42 +0200
Message-ID: <20250623120144.109359-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
References: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050152_547011_47257E87 
X-CRM114-Status: GOOD (  11.17  )
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

The MediaTek Dimensity 1200 (MT6893) features the same DVFSRC
regulators as the other currently supported SoCs, but with a
different select value: add an array describing the possible
voltages for the VCORE and VSCP regulators, and assign it to
a new compatible for this SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index f5662c569464..5bc4d85517f0 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -117,6 +117,24 @@ static const struct dvfsrc_regulator_pdata mt6873_data = {
 	.size = ARRAY_SIZE(mt6873_regulators),
 };
 
+static const unsigned int mt6893_voltages[] = {
+	575000,
+	600000,
+	650000,
+	725000,
+	750000,
+};
+
+static const struct regulator_desc mt6893_regulators[] = {
+	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt6893_voltages),
+	MTK_DVFSRC_VREG("dvfsrc-vscp", VSCP, mt6893_voltages),
+};
+
+static const struct dvfsrc_regulator_pdata mt6893_data = {
+	.descs = mt6893_regulators,
+	.size = ARRAY_SIZE(mt6893_regulators),
+};
+
 static const unsigned int mt8183_voltages[] = {
 	725000,
 	800000,
@@ -173,6 +191,7 @@ static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
 
 static const struct of_device_id mtk_dvfsrc_regulator_match[] = {
 	{ .compatible = "mediatek,mt6873-dvfsrc-regulator", .data = &mt6873_data },
+	{ .compatible = "mediatek,mt6893-dvfsrc-regulator", .data = &mt6893_data },
 	{ .compatible = "mediatek,mt8183-dvfsrc-regulator", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-dvfsrc-regulator", .data = &mt6873_data },
 	{ .compatible = "mediatek,mt8195-dvfsrc-regulator", .data = &mt8195_data },
-- 
2.49.0


