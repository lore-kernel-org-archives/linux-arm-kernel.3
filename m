Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0F2C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CwDR134Nt4L1/HlGUyQfe5GdtmkdajPwzdxGhr+4es=; b=QxThEFzw+k6NiueptJJftGC3KD
	BA3E2p9ifyRvfAaTTJTAtZ2l5ZXhLUuHXlmh6zKWz7Xn7OmTsUzDIqHHWmnG/HlRBPA7x7uSGdPcm
	CKQzuU294FO9BNXd2YpzIVPMtxJko9StrQNCA7DNL9GzIMj5JsQAHx7zxkZDghdmepsCqOBMHvMh/
	EEqJXA3HeqclW5RUWGnw2YKZI85VqzBJj6KDHhwBONQnbcoBWmgxIWVmlF2UaIIqeaSSGQrYFor3s
	lqBq1br1hYHYIBdX/vG8LEwtfnz7fbtvBj7EdnPNCK/sQm6xngNBJgxq3TgeTq0EuoKbvfpEnQOwE
	eaQIqcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tT8-0000000Ax1u-33eW;
	Thu, 10 Apr 2025 15:05:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4v-0000000AsUM-0gxT;
	Thu, 10 Apr 2025 14:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296027;
	bh=XxKeLRHlwE1CmqH6HuYvXfcg5rpJw5MzJrPdDxVNVGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HzEEUW3LFifmUEMYGfzCZANHSYeGJjQMSL9AQfPOwPpT4KQIrs+Q1V5m7onphBaeG
	 6d+SpFBRMIs6BXLRu6MZMmXi3WLIdHCuPml+hgRLx5LCdrQ/cMwCUGyhhxsoZJz/nh
	 NSr+lKCLSgKEcsbSK3vdtsvm5R8wZsiH8ve7m6RF/tGBsCnDYuphtro0FZKaRUnmoU
	 HrFiFA3eweYMwwvQ8Sl6NGJdVGFWQoKGcuVnzFMmd6AOn0djyuZXAyEb4y7yrhCGkS
	 l4Ll6JTOwzu1XPplnHAccvNozrIutDG96j8s4uZuBvP+8XlhybEvj4pTLQijX4h9Hm
	 zL5BrQFTDbQiQ==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D9E517E1134;
	Thu, 10 Apr 2025 16:40:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 3/5] regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
Date: Thu, 10 Apr 2025 16:40:17 +0200
Message-ID: <20250410144019.475930-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074029_347759_C9DF02A1 
X-CRM114-Status: GOOD (  11.29  )
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
index f5662c569464..6c84bfe56872 100644
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
+static const struct dvfsrc_regulator_pdata mt6873_data = {
+	.descs = mt6873_regulators,
+	.size = ARRAY_SIZE(mt6873_regulators),
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


