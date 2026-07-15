Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35B8C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwko2hrncYt53zZGnXY8IXUD28MaawCDLpcYVtsjjOo=; b=l0jwDYoAHb70+Fug9uVSWhLE8I
	6t5IcK1Gr9fZYny0PguvcCZvEdgtZWz7251k7wseE0aZyU8ooVoa+sXsqAsOjXwzWXuX57fyFalDe
	wrdsfOOST4QMsNzVjDW0RbYAlv6i59V5Ilx3L+mdekk+zdLZDlxM/QA3ZkAIyskTGCJWgWL3Qrbty
	5LAizFMCIn3zMhuE6ymZjE67Em6L+xT5XNFoyMsODSeX5U9od/MvWBhmUNVfWUQAd2xnwZQ/QW/Vr
	FC6KnglQI7JfbzSbmFa4crFrUHiGUBut4uX7n5RP5div1n+NbkMUTMLbamHfiYVKt0rMgNlpE+DYG
	b0UXdbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyi3-0000000EmPp-1l9J;
	Wed, 15 Jul 2026 12:27:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyi1-0000000EmOS-1hUe;
	Wed, 15 Jul 2026 12:27:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6CB840418;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFC0BC2BCF4;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784118448;
	bh=Ixh7QjHO8Sw6SkBbzsHgSMI9ywDCBo9qAZr4szmg7DI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hREBKbQVHNYnpvpLjDiEOykL6cAFnIvFiE/HunwP11FOkUXdxtePz2K3ib4wrYzA4
	 orbMl3R9hbpe26G6LY5QJU2Nn5mrQ7l+0jTqqBQ50W4J64sb31oTuj9qyQLPO8zFRc
	 Q+ELrKz9aQyVf7b0H3JCTptagx25vgSrdXHRtQkX1sWYmIOzJWt2cAkiZnbnMU9tcu
	 MdbZTxHRpdMVAzB1HgAhTovk9jhe6p8SudYsSq+SfP9emLb70rWIeOTQVDrnLzyhiM
	 E1hC8U4ebAl05RvfdJPYqgSIV8SsABvL1QCzkNy9W/YxS2yjHsHjDRFJW1CT+8jUgL
	 sMxS3ze9H7yng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3936C44507;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 15 Jul 2026 15:26:40 +0300
Subject: [PATCH v2 3/3] soc: mediatek: pwrap: add mt6572 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-6572-pwrap-v2-3-bea1d801c81b@protonmail.com>
References: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
In-Reply-To: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784118429; l=3053;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=734OeVA8OVJF9zkD8y++4eBar+yDgtHe1s1/kC7/Zxk=;
 b=DHzyEVHfr1jchQ2eMIJvIUXEpktNqNFiQGh7LMUnb35+vD/3R+cuXsTBdugL4SGiL0gbHPFa2
 rM7wXhvcZ/VD/JGoEUvtlFqLb5G2V1rzlLb2Sj/aVOaQXvh2Tax15Yw
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add mt6572 registers and platform data for the pmic wrapper.

While vendor kernel source code suggests that mt6572 can be paired with
the mt6320 PMIC, no such devices have been found yet. Hence, registers
that not included in the mt2701 array are omitted.

The mt2701 SoC-specific initialization function is used because they
share the same GPS_INTF settings.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index a4b10b0a97cb..3f05fc724e15 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1314,6 +1314,7 @@ enum pmic_type {
 
 enum pwrap_type {
 	PWRAP_MT2701,
+	PWRAP_MT6572,
 	PWRAP_MT6765,
 	PWRAP_MT6779,
 	PWRAP_MT6795,
@@ -1733,6 +1734,11 @@ static void pwrap_init_chip_select_ext(struct pmic_wrapper *wrp, u8 hext_write,
 static int pwrap_common_init_reg_clock(struct pmic_wrapper *wrp)
 {
 	switch (wrp->master->type) {
+	case PWRAP_MT6572:
+		pwrap_writel(wrp, 0x8, PWRAP_RDDMY);
+		pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_RDDMY_NO], 0x8);
+		pwrap_init_chip_select_ext(wrp, 5, 0, 0, 0);
+		break;
 	case PWRAP_MT6795:
 		if (wrp->slave->type == PMIC_MT6331) {
 			const u32 *dew_regs = wrp->slave->dew_regs;
@@ -1839,6 +1845,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 		pwrap_writel(wrp, 1, PWRAP_CIPHER_START);
 		break;
 	case PWRAP_MT2701:
+	case PWRAP_MT6572:
 	case PWRAP_MT6765:
 	case PWRAP_MT6779:
 	case PWRAP_MT6795:
@@ -2277,6 +2284,24 @@ static const struct pmic_wrapper_type pwrap_mt2701 = {
 	.init_soc_specific = pwrap_mt2701_init_soc_specific,
 };
 
+/*
+ * MT6572 register map is a superset of the MT2701. It has additional registers
+ * OP_TYPE (0x10), MSB_FIRST (0x14), GPS_STA (0x40) and SW_RST (0x180),
+ * which were omitted because the driver doesn't use them.
+ */
+static const struct pmic_wrapper_type pwrap_mt6572 = {
+	.regs = mt2701_regs,
+	.type = PWRAP_MT6572,
+	.arb_en_all = 0x1ff,
+	.int_en_all = 0x7ffffffd,
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_RESET | PWRAP_CAP_DCM,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = pwrap_mt2701_init_soc_specific,
+};
+
 static const struct pmic_wrapper_type pwrap_mt6765 = {
 	.regs = mt6765_regs,
 	.type = PWRAP_MT6765,
@@ -2446,6 +2471,7 @@ static const struct pmic_wrapper_type pwrap_mt8186 = {
 
 static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt2701-pwrap", .data = &pwrap_mt2701 },
+	{ .compatible = "mediatek,mt6572-pwrap", .data = &pwrap_mt6572 },
 	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
 	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
 	{ .compatible = "mediatek,mt6795-pwrap", .data = &pwrap_mt6795 },

-- 
2.54.0



