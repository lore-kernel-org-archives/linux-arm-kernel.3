Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFCCC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfew289h2YKL7y42Tigk9r+EQG43qGYxbP+/iUbiafw=; b=HZ8cmVX0Bp8aKF7Xc9H/8Td7Ow
	kY9HNwj/yWDAkCz8fIv/onnUffZsJ0zsl74xQNaX224buYveJ2FqRcSi41H6AiNsXWrQwcJObLEyB
	3FuNZV+gNm3v1LX+Q/j7CZwWhCWqluxQIovuNXdzDKBVd4ooyDtM2EiAqALcNjBiDeaPy6KUxg5YJ
	MbAb70w/EzFi8B5YYCJwzlkEf57+JHhoGBB3A66S8GAHOgd7l2iepQ9nfQm6kTWXw7n8XfgTd/cVH
	LDRb65Gpv7rRK/cgYu0TbfRI5mJjfvYJ+ixki1XkEHtL5pcGxJe+Hzqq60mZpAs/IK1BTZAE0a12O
	Gb79Vb0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTj1i-00000003DbO-0ufu;
	Mon, 23 Jun 2025 15:24:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTftQ-00000002bV5-2lbD;
	Mon, 23 Jun 2025 12:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680199;
	bh=tOpD5LTV/P8tm/1UAfOVh6bSUSeBFltYVVD8Ct+QpFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BPXElbYC3D6vKdJHilYWDaXvnIxCXG/COLTXYBdOwULJ+hNDORKb4FIgpddGRpDwX
	 G4gMXKXSMZKCANDv1FP45YLB5LljbXixmNAY4MjBIEdpAsKPSW3aTIf0XKqx8dpF9Z
	 bsktZbufErjX3MZOPqYvOZWpb+Eq/+FlMPefUFFnMKBR8yoHisN8zgiCLita9zI36G
	 UNGlL480/C50S3vhdawEvIk/cs6G4Z48/do0+Qs2q85T1nc9Hl1D/O/0JmLoSdixEB
	 E+NHGAkXRUPfQCrpOL1axLY6MVUcKdlt3NPBouzbQkVA3suCVjTkHNK8FZa5SisHru
	 XdvCDRxe4QRrw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3B1C17E0EC0;
	Mon, 23 Jun 2025 14:03:18 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] phy: mediatek: tphy: Clarify and add kerneldoc to mtk_phy_pdata
Date: Mon, 23 Jun 2025 14:03:14 +0200
Message-ID: <20250623120315.109881-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
References: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050320_847171_35B96CB0 
X-CRM114-Status: GOOD (  13.18  )
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

As struct mtk_phy_pdata was almost fully documented, transfer
the comments into kerneldoc on top.
While at it, also rewrite the comments to both improve the writing
writing and the actual information in the documentation, and add a
description for the `version` member of the structure.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 644a34bd2b0b..858824b4476e 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -277,19 +277,19 @@ enum mtk_phy_version {
 	MTK_PHY_V3,
 };
 
+/**
+ * mtk_phy_pdata - SoC specific platform data
+ * @avoid_rx_sen_degradation: Avoid TX Sensitivity level degradation (MT6795/8173 only)
+ * @sw_pll_48m_to_26m:        Workaround for V3 IP (MT8195) - switch the 48MHz PLL from
+ *                            fractional mode to integer to output 26MHz for U2PHY
+ * @sw_efuse_supported:       Switches off eFuse auto-load from PHY and applies values
+ *                            read from different nvmem (usually different eFuse array)
+ *                            that is pointed at in the device tree node for this PHY
+ * @version:                  PHY IP Version
+ */
 struct mtk_phy_pdata {
-	/* avoid RX sensitivity level degradation only for mt8173 */
 	bool avoid_rx_sen_degradation;
-	/*
-	 * workaround only for mt8195, HW fix it for others of V3,
-	 * u2phy should use integer mode instead of fractional mode of
-	 * 48M PLL, fix it by switching PLL to 26M from default 48M
-	 */
 	bool sw_pll_48m_to_26m;
-	/*
-	 * Some SoCs (e.g. mt8195) drop a bit when use auto load efuse,
-	 * support sw way, also support it for v2/v3 optionally.
-	 */
 	bool sw_efuse_supported;
 	enum mtk_phy_version version;
 };
-- 
2.49.0


