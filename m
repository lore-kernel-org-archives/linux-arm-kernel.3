Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E260C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 02:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGjcsfnEeMr0A80hfuoLpj4oh9sasxsu0uuaKRwigWg=; b=ZtXtDpC8nMOLImyIaHftIR8wfV
	RhGT/7Vyxypt/jEqxNITd1mSewE9ZBQMnX91aKwsZ/QD8vY9mkul/li8DJ72QC9ycR7OGc9sq8Qvz
	jI9uMn71xIya1M27dW4VCdwJ0bwQfgswctCE3+xjkZ9wwcKHymUS00fZAUwINCCd3CJ4PqVtA5R5R
	CmhFkiqRTZWNGxaPLjWCQUccvQ+13dnbmi+veQpsNsls/r7rkpc3sw6v/ovOC4afzYwnAO1XzusRw
	vH1A6rTm3G6ZydQsENnLOz1oHh1tQC/mVGWitqrkHSRbDPo0MCf8D4stAk0rox5eXEUjzknWYVvbK
	CJxyTDAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WSE-00000004Frv-1GtE;
	Tue, 15 Apr 2025 02:55:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WJD-00000004DRY-1u5Y;
	Tue, 15 Apr 2025 02:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 085754425B;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8BD8C4CEEC;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685157;
	bh=2x91J5sem5IP8gA0gECFNvOpz83ewu5oEZzUTMSLuJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O9lkO4ame3P0xGx9j6/HBR1vb2zUOAxfcz11sefe7z/DcwyPZWyuOUc/3TZcfy28Q
	 OYWBwCkWTKLQ74qmRcrO4Nq+PPXthuSyMTfJwaaj/Qs837P86ifJs44CmdsX4zzTDY
	 WndRi3uauNX27N6ATR75t32Iz/rFYSg6kDMUeDZUZtpbz8/Ib7lCYoh9jnCnaX0Iwg
	 Qvhn7oQhuIYwKM8+CGlxXV0Kgsg6+j57V3mUHwpTjjtw+XlIwJvPAtTBc/EUnxsTTy
	 2cMP3lmaMZ1kmySvKMdFJgHG5o/6egt2qUd6Njehr8WeG+xBn79taBJ36Ei0LsJ65x
	 memFgHuO5gkOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29B6C369B8;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 15 Apr 2025 10:45:24 +0800
Subject: [PATCH v3 1/7] soc: amlogic: clk-measure: Define MSR_CLK's
 register offset separately
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-clk-measure-v3-1-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744685155; l=5875;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=0guFezE8LgXk4zTIDey8n/7AjPQ9HaO6/P9CKzBKwgU=;
 b=LH0Wu2xuiibSPuT7Nk/mM9O+YUHq27jKVIacku7LUFDJOsShPXDqWbYF+YqTgLXQF09mTRSp0
 QVupv191xPtCMG6JrwE29U4gOyvElxjCwGFXDU3ocI5eyZ09thS93vY
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_194559_548380_00FB89E6 
X-CRM114-Status: GOOD (  15.64  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Since the MSR_CLK register offset differs between chip variants, we
replace the macro-based definition with chip-specific assignments.

Change the max_register in regmap_config to be retrieved from DTS.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 55 ++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 39638d6a593c..3594ef5b7ff0 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -14,11 +14,6 @@
 
 static DEFINE_MUTEX(measure_lock);
 
-#define MSR_CLK_DUTY		0x0
-#define MSR_CLK_REG0		0x4
-#define MSR_CLK_REG1		0x8
-#define MSR_CLK_REG2		0xc
-
 #define MSR_DURATION		GENMASK(15, 0)
 #define MSR_ENABLE		BIT(16)
 #define MSR_CONT		BIT(17) /* continuous measurement */
@@ -39,9 +34,17 @@ struct meson_msr_id {
 	const char *name;
 };
 
+struct msr_reg_offset {
+	unsigned int duty_val;
+	unsigned int freq_ctrl;
+	unsigned int duty_ctrl;
+	unsigned int freq_val;
+};
+
 struct meson_msr_data {
 	struct meson_msr_id *msr_table;
 	unsigned int msr_count;
+	const struct msr_reg_offset *reg;
 };
 
 struct meson_msr {
@@ -495,6 +498,7 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 			    unsigned int duration)
 {
 	struct meson_msr *priv = clk_msr_id->priv;
+	const struct msr_reg_offset *reg = priv->data.reg;
 	unsigned int val;
 	int ret;
 
@@ -502,22 +506,22 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	if (ret)
 		return ret;
 
-	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
+	regmap_write(priv->regmap, reg->freq_ctrl, 0);
 
 	/* Set measurement duration */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_DURATION,
+	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_DURATION,
 			   FIELD_PREP(MSR_DURATION, duration - 1));
 
 	/* Set ID */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_CLK_SRC,
+	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_CLK_SRC,
 			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
 
 	/* Enable & Start */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0,
+	regmap_update_bits(priv->regmap, reg->freq_ctrl,
 			   MSR_RUN | MSR_ENABLE,
 			   MSR_RUN | MSR_ENABLE);
 
-	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
+	ret = regmap_read_poll_timeout(priv->regmap, reg->freq_ctrl,
 				       val, !(val & MSR_BUSY), 10, 10000);
 	if (ret) {
 		mutex_unlock(&measure_lock);
@@ -525,10 +529,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	}
 
 	/* Disable */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
+	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_ENABLE, 0);
 
 	/* Get the value in multiple of gate time counts */
-	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
+	regmap_read(priv->regmap, reg->freq_val, &val);
 
 	mutex_unlock(&measure_lock);
 
@@ -599,11 +603,10 @@ static int clk_msr_summary_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(clk_msr_summary);
 
-static const struct regmap_config meson_clk_msr_regmap_config = {
+static struct regmap_config meson_clk_msr_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.max_register = MSR_CLK_REG2,
 };
 
 static int meson_msr_probe(struct platform_device *pdev)
@@ -611,6 +614,7 @@ static int meson_msr_probe(struct platform_device *pdev)
 	const struct meson_msr_data *match_data;
 	struct meson_msr *priv;
 	struct dentry *root, *clks;
+	struct resource *res;
 	void __iomem *base;
 	int i;
 
@@ -636,15 +640,24 @@ static int meson_msr_probe(struct platform_device *pdev)
 	       match_data->msr_count * sizeof(struct meson_msr_id));
 	priv->data.msr_count = match_data->msr_count;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	meson_clk_msr_regmap_config.max_register = resource_size(res) - 4;
 	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					     &meson_clk_msr_regmap_config);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
+	priv->data.reg = devm_kzalloc(&pdev->dev, sizeof(struct msr_reg_offset),
+				      GFP_KERNEL);
+	if (!priv->data.reg)
+		return -ENOMEM;
+
+	memcpy((void *)priv->data.reg, match_data->reg,
+	       sizeof(struct msr_reg_offset));
+
 	root = debugfs_create_dir("meson-clk-msr", NULL);
 	clks = debugfs_create_dir("clks", root);
 
@@ -664,29 +677,41 @@ static int meson_msr_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct msr_reg_offset msr_reg_offset = {
+	.duty_val = 0x0,
+	.freq_ctrl = 0x4,
+	.duty_ctrl = 0x8,
+	.freq_val = 0xc,
+};
+
 static const struct meson_msr_data clk_msr_gx_data = {
 	.msr_table = (void *)clk_msr_gx,
 	.msr_count = ARRAY_SIZE(clk_msr_gx),
+	.reg = &msr_reg_offset,
 };
 
 static const struct meson_msr_data clk_msr_m8_data = {
 	.msr_table = (void *)clk_msr_m8,
 	.msr_count = ARRAY_SIZE(clk_msr_m8),
+	.reg = &msr_reg_offset,
 };
 
 static const struct meson_msr_data clk_msr_axg_data = {
 	.msr_table = (void *)clk_msr_axg,
 	.msr_count = ARRAY_SIZE(clk_msr_axg),
+	.reg = &msr_reg_offset,
 };
 
 static const struct meson_msr_data clk_msr_g12a_data = {
 	.msr_table = (void *)clk_msr_g12a,
 	.msr_count = ARRAY_SIZE(clk_msr_g12a),
+	.reg = &msr_reg_offset,
 };
 
 static const struct meson_msr_data clk_msr_sm1_data = {
 	.msr_table = (void *)clk_msr_sm1,
 	.msr_count = ARRAY_SIZE(clk_msr_sm1),
+	.reg = &msr_reg_offset,
 };
 
 static const struct of_device_id meson_msr_match_table[] = {

-- 
2.42.0



