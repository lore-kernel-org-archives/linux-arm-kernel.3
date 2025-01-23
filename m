Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A3DC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kMCU7JI2f45P9pb6ILoxbxLuURV0M7F3cMeOhbGqmaQ=; b=CgmxeWRLh0sF+ZcUP5N7M0WrDi
	1Pz5sViP3s2Z843coOPfUovV30/kw0rHaVzXxrVccwfja+sxIPsbdEKKfesZ+Tnr1YO96UTed/RRD
	W8iAWbYJa5hSRdZTdXKrukTV2wOgH63JsnOZyCzYdUwLtwVlcI+aTLeD3nSWhZwaV4L8t9AzrL7Uj
	hIfoZRwMRMQlWuMS30rRRg8NpfM5gW14R4p+pZaQC3l9nV2CoczPVkDuKxaluEzdKi/2VE/VAJkmv
	2S3HZyVIE9qailpM6UHZTHILcQjoVESCYLMwYY+IFHN58zSGqErmJBwUBMqjWZlh6+8c5bR1euqiR
	JbEAa4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taudl-0000000CEmo-1yh3;
	Thu, 23 Jan 2025 10:40:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tauaX-0000000CENQ-0AeP;
	Thu, 23 Jan 2025 10:37:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7C8A5C54CE;
	Thu, 23 Jan 2025 10:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F04FDC4CED3;
	Thu, 23 Jan 2025 10:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737628648;
	bh=OLu3vDS2ZKNfJItxo4kTx0bToRxzEIyab1r5UHmyvxs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ga8qYqDsybdkksU/AwUp5UHj7N1EaIJmc1s/MDEYBSkyXAqBSD0QAf+tbcnzwE0j0
	 R8aIo+J5V42W+CAOPHvhmTNYxGv/fUv3rDrum2h8MM5lX77u6CM1ixkK+OhzdcL7Ex
	 UTxPOIJ4lkdif86wrFQe9flEJHGjCUTVPUNd4brpNmxwSwWB0RgA+kFcXwozkHSWmu
	 Llv7X2h7FzX99xtA5QZZu3D9i23p0HGlq3FniNT6AiQBZgU1LmZ75e6JPhWmqd/q03
	 q9Ww76zPuv/xeOegTyuuseSAK/3N7XXKon9+F2nB+fNrdxZiM60GNgDTrNE2XGyWlV
	 OOIS5x45lNgTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62D3C02182;
	Thu, 23 Jan 2025 10:37:27 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 23 Jan 2025 18:37:08 +0800
Subject: [PATCH] soc: amlogic: clk-measure: Optimize the memory size of
 clk-measure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-optimize_memory_size_of_clk_measure-v1-1-06aa6a01ff37@amlogic.com>
X-B4-Tracking: v=1; b=H4sIANMbkmcC/x2N0QrCMBAEf6Xcs4Ektmj9FSmhxI0emqbcqail/
 270bWYedhdSCEPp0CwkeLJymaq4TUPxMk5nGD5VJ299Z53fmjLfOfMHISMXeQf9cUkh3q41jfo
 QmNTH1mLvul3fUl2aBYlf/5fjsK5fo59KM3UAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737628646; l=9300;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=09XhYDP6iI0Tb7WSsTJeEPwen1jQBHDBnTyU/ciBS8c=;
 b=IDA62YuwwJTS75iY3P6AMNE7mnzXnQVceQXhlo/VtGYQqoiiAqWtFDNQMB/I8/2d/D3hif5PK
 99O/0zM5p/MAmBD4AtSdc6WekpU+vYnfuoA5qii9cL8DanTxN/Dstpq
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_023729_179255_BBA71E51 
X-CRM114-Status: GOOD (  19.59  )
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

Define struct meson_msr as a static global variable and remove the
"*priv" member from struct meson_msr_id.

Define the size of the corresponding array based on the actual number of
msr_id of the chip.

The array corresponding to msr_id is defined as "__initdata" to reduce
memory usage.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Each msr_id defines a pointer(*priv), and all these pointers point to
the same address.

The number of msr_ids for each chip is inconsistent. Defining a
fixed-size array for each chip to store msr_ids would waste memory.
---
 drivers/soc/amlogic/meson-clk-measure.c | 119 ++++++++++++++++++++------------
 1 file changed, 74 insertions(+), 45 deletions(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index a6453ffeb753..b52e9ce25ea8 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -33,23 +33,27 @@ static DEFINE_MUTEX(measure_lock);
 #define DIV_STEP		32
 #define DIV_MAX			640
 
-#define CLK_MSR_MAX		128
-
 struct meson_msr_id {
-	struct meson_msr *priv;
 	unsigned int id;
 	const char *name;
 };
 
+struct meson_msr_data {
+	struct meson_msr_id *msr_table;
+	unsigned int msr_count;
+};
+
 struct meson_msr {
 	struct regmap *regmap;
-	struct meson_msr_id msr_table[CLK_MSR_MAX];
+	struct meson_msr_data data;
 };
 
 #define CLK_MSR_ID(__id, __name) \
 	[__id] = {.id = __id, .name = __name,}
 
-static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
+static struct meson_msr meson_msr;
+
+static struct meson_msr_id clk_msr_m8[] __initdata = {
 	CLK_MSR_ID(0, "ring_osc_out_ee0"),
 	CLK_MSR_ID(1, "ring_osc_out_ee1"),
 	CLK_MSR_ID(2, "ring_osc_out_ee2"),
@@ -98,7 +102,7 @@ static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
 	CLK_MSR_ID(63, "mipi_csi_cfg"),
 };
 
-static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
+static struct meson_msr_id clk_msr_gx[] __initdata = {
 	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
 	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
 	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
@@ -168,7 +172,7 @@ static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
 	CLK_MSR_ID(82, "ge2d"),
 };
 
-static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
+static struct meson_msr_id clk_msr_axg[] __initdata = {
 	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
 	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
 	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
@@ -242,7 +246,7 @@ static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
 	CLK_MSR_ID(109, "audio_locker_in"),
 };
 
-static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
+static struct meson_msr_id clk_msr_g12a[] __initdata = {
 	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
 	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
 	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
@@ -358,7 +362,7 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
 	CLK_MSR_ID(122, "audio_pdm_dclk"),
 };
 
-static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
+static struct meson_msr_id clk_msr_sm1[] __initdata = {
 	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
 	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
 	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
@@ -489,9 +493,8 @@ static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
 };
 
 static int meson_measure_id(struct meson_msr_id *clk_msr_id,
-			       unsigned int duration)
+			    unsigned int duration)
 {
-	struct meson_msr *priv = clk_msr_id->priv;
 	unsigned int val;
 	int ret;
 
@@ -499,22 +502,22 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	if (ret)
 		return ret;
 
-	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
+	regmap_write(meson_msr.regmap, MSR_CLK_REG0, 0);
 
 	/* Set measurement duration */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_DURATION,
+	regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0, MSR_DURATION,
 			   FIELD_PREP(MSR_DURATION, duration - 1));
 
 	/* Set ID */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_CLK_SRC,
+	regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0, MSR_CLK_SRC,
 			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
 
 	/* Enable & Start */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0,
+	regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0,
 			   MSR_RUN | MSR_ENABLE,
 			   MSR_RUN | MSR_ENABLE);
 
-	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
+	ret = regmap_read_poll_timeout(meson_msr.regmap, MSR_CLK_REG0,
 				       val, !(val & MSR_BUSY), 10, 10000);
 	if (ret) {
 		mutex_unlock(&measure_lock);
@@ -522,10 +525,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	}
 
 	/* Disable */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
+	regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
 
 	/* Get the value in multiple of gate time counts */
-	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
+	regmap_read(meson_msr.regmap, MSR_CLK_REG2, &val);
 
 	mutex_unlock(&measure_lock);
 
@@ -579,7 +582,7 @@ static int clk_msr_summary_show(struct seq_file *s, void *data)
 	seq_puts(s, "  clock                     rate    precision\n");
 	seq_puts(s, "---------------------------------------------\n");
 
-	for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
+	for (i = 0 ; i < meson_msr.data.msr_count ; ++i) {
 		if (!msr_table[i].name)
 			continue;
 
@@ -604,77 +607,103 @@ static const struct regmap_config meson_clk_msr_regmap_config = {
 
 static int meson_msr_probe(struct platform_device *pdev)
 {
-	const struct meson_msr_id *match_data;
-	struct meson_msr *priv;
+	const struct meson_msr_data *match_data;
+	struct meson_msr_id *msr_table;
 	struct dentry *root, *clks;
 	void __iomem *base;
 	int i;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct meson_msr),
-			    GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
 	match_data = device_get_match_data(&pdev->dev);
 	if (!match_data) {
 		dev_err(&pdev->dev, "failed to get match data\n");
 		return -ENODEV;
 	}
 
-	memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
+	msr_table = devm_kcalloc(&pdev->dev, match_data->msr_count,
+				 sizeof(struct meson_msr_id), GFP_KERNEL);
+	if (!msr_table)
+		return -ENOMEM;
+
+	memcpy(msr_table, match_data->msr_table,
+	       match_data->msr_count * sizeof(struct meson_msr_id));
+	meson_msr.data.msr_table = msr_table;
+	meson_msr.data.msr_count = match_data->msr_count;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
-					     &meson_clk_msr_regmap_config);
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
+	meson_msr.regmap = devm_regmap_init_mmio(&pdev->dev, base,
+						 &meson_clk_msr_regmap_config);
+	if (IS_ERR(meson_msr.regmap))
+		return PTR_ERR(meson_msr.regmap);
 
 	root = debugfs_create_dir("meson-clk-msr", NULL);
 	clks = debugfs_create_dir("clks", root);
 
-	debugfs_create_file("measure_summary", 0444, root,
-			    priv->msr_table, &clk_msr_summary_fops);
+	debugfs_create_file("measure_summary", 0444, root, msr_table,
+			    &clk_msr_summary_fops);
 
-	for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
-		if (!priv->msr_table[i].name)
+	for (i = 0 ; i < meson_msr.data.msr_count ; ++i) {
+		if (!msr_table[i].name)
 			continue;
 
-		priv->msr_table[i].priv = priv;
-
-		debugfs_create_file(priv->msr_table[i].name, 0444, clks,
-				    &priv->msr_table[i], &clk_msr_fops);
+		debugfs_create_file(msr_table[i].name, 0444, clks,
+				    &msr_table[i], &clk_msr_fops);
 	}
 
 	return 0;
 }
 
+static const struct meson_msr_data clk_msr_gx_data = {
+	.msr_table = clk_msr_gx,
+	.msr_count = ARRAY_SIZE(clk_msr_gx),
+};
+
+static const struct meson_msr_data clk_msr_m8_data = {
+	.msr_table = clk_msr_m8,
+	.msr_count = ARRAY_SIZE(clk_msr_m8),
+};
+
+static const struct meson_msr_data clk_msr_axg_data = {
+	.msr_table = clk_msr_axg,
+	.msr_count = ARRAY_SIZE(clk_msr_axg),
+};
+
+static const struct meson_msr_data clk_msr_g12a_data = {
+	.msr_table = clk_msr_g12a,
+	.msr_count = ARRAY_SIZE(clk_msr_g12a),
+};
+
+static const struct meson_msr_data clk_msr_sm1_data = {
+	.msr_table = clk_msr_sm1,
+	.msr_count = ARRAY_SIZE(clk_msr_sm1),
+};
+
 static const struct of_device_id meson_msr_match_table[] = {
 	{
 		.compatible = "amlogic,meson-gx-clk-measure",
-		.data = (void *)clk_msr_gx,
+		.data = &clk_msr_gx_data,
 	},
 	{
 		.compatible = "amlogic,meson8-clk-measure",
-		.data = (void *)clk_msr_m8,
+		.data = &clk_msr_m8_data,
 	},
 	{
 		.compatible = "amlogic,meson8b-clk-measure",
-		.data = (void *)clk_msr_m8,
+		.data = &clk_msr_m8_data,
 	},
 	{
 		.compatible = "amlogic,meson-axg-clk-measure",
-		.data = (void *)clk_msr_axg,
+		.data = &clk_msr_axg_data,
 	},
 	{
 		.compatible = "amlogic,meson-g12a-clk-measure",
-		.data = (void *)clk_msr_g12a,
+		.data = &clk_msr_g12a_data,
 	},
 	{
 		.compatible = "amlogic,meson-sm1-clk-measure",
-		.data = (void *)clk_msr_sm1,
+		.data = &clk_msr_sm1_data,
 	},
 	{ /* sentinel */ }
 };

---
base-commit: 1e1fd26ed4ca05cc1f0e5857918da4dd54967f7d
change-id: 20250123-optimize_memory_size_of_clk_measure-f9c40e815794

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



