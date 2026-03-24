Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE655F54ADE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mg1lNRcP9xwdCPo9wffR5je0bpnEHHelMS/0fbsbExo=; b=FJbNOrAl3CGPhk1WPLRlqOjczZ
	UKmtkYVEnn33NcIABO5Jiyn+Ln73xQ8zyAe8ssc8e4cGWwolq5vfSwcBXJ0UDXCnJmtMhvgVr9GeQ
	ezLITYPOH+6oH7g9iehuj8wCfB0MmqSldzdaXdDA56ocPJ4GVPthjH3NyND9mPCiNiVimTL2Xscem
	EaxKuL1HZqiCZScCIzR73bksXepc0u3eC3W+QI7B/maZIfO4rIkFwQYmgIYqRDTSfZuYQ2w06Hth0
	neZGn38ca+JT+IkOAbCWrIhsTDJXVAWjBeH+6j6Bbx1eY0omyKyuG1twEZfdOXeKLjQNkAdPsUtBx
	FOCIw3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rb-00000001uXL-4BMz;
	Tue, 24 Mar 2026 16:44:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rN-00000001uOP-3RTa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:44:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E8774422B;
	Tue, 24 Mar 2026 16:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C6AC2BCB6;
	Tue, 24 Mar 2026 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370645;
	bh=b0m0FnMqUK3YcK+u1bAXX+KhD9qbCEgekt0QI4jDH9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C3o8s0Ol4By0oYHYu2S85is0Yw89BKW8tT0wJQwH6GAicXAoVwsw9NyoEqTrGrmT3
	 d6lQ7pzdiVGr4OPazoq7jhAC68KzgOBKtXlJLFcpOUNdxvSRLPCaEE235HqCUJAnN6
	 mlKtv/132wg0q6Qmq3bqCNaRG7m3nc877Q8S+K9xYumBzTdG5JFcPY8mPGhaBU9FNb
	 4wBkwNfDU6rwcdBSIt/2L3XWjsn0bXGtrDCQDNHEWS14VlTXRuDLeWD0C9HrDnzGtQ
	 gG7xfCX3rSGROT0LfF8/uISCwAWzK711a7YLVhfWP82qZ9tkTmbRdBKcMmBsZDX39M
	 48wsqiXWrwuFg==
Received: by wens.tw (Postfix, from userid 1000)
	id D76AD5FFBF; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] soc: sunxi: sram: Support claiming multiple regions per device
Date: Wed, 25 Mar 2026 00:43:53 +0800
Message-ID: <20260324164357.1607247-6-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_094406_001262_5074A3A1 
X-CRM114-Status: GOOD (  17.30  )
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

On the H616, the video engine needs to claim two SRAM regions.

Support claiming multiple regions per device.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 164 +++++++++++++++++++--------------
 1 file changed, 96 insertions(+), 68 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index aba155379ccc..4d81897179e7 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -165,79 +165,48 @@ static inline struct sunxi_sram_desc *to_sram_desc(const struct sunxi_sram_data
 	return container_of(data, struct sunxi_sram_desc, data);
 }
 
-static const struct sunxi_sram_data *sunxi_sram_of_parse(struct device_node *node,
-							 unsigned int *reg_value)
+static const struct sunxi_sram_data *sunxi_sram_get_match(struct device_node *np, u8 val,
+							  unsigned int *reg_value)
 {
 	const struct of_device_id *match;
 	const struct sunxi_sram_data *data;
 	const struct sunxi_sram_func *func;
-	struct of_phandle_args args;
-	u8 val;
-	int ret;
-
-	ret = of_parse_phandle_with_fixed_args(node, "allwinner,sram", 1, 0,
-					       &args);
-	if (ret)
-		return ERR_PTR(ret);
 
-	if (!of_device_is_available(args.np)) {
-		ret = -EBUSY;
-		goto err;
-	}
+	if (!of_device_is_available(np))
+		return ERR_PTR(-ENODEV);
 
-	val = args.args[0];
-
-	match = of_match_node(sunxi_sram_dt_ids, args.np);
-	if (!match) {
-		ret = -EINVAL;
-		goto err;
-	}
+	match = of_match_node(sunxi_sram_dt_ids, np);
+	if (!match)
+		return ERR_PTR(-ENODEV);
 
 	data = match->data;
-	if (!data) {
-		ret = -EINVAL;
-		goto err;
-	}
-
-	for (func = data->func; func->func; func++) {
-		if (val == func->val) {
-			if (reg_value)
-				*reg_value = func->reg_val;
+	if (!data)
+		return ERR_PTR(-EINVAL);
 
+	for (func = data->func; func->func; func++)
+		if (val == func->val)
 			break;
-		}
-	}
 
-	if (!func->func) {
-		ret = -EINVAL;
-		goto err;
-	}
+	if (!func->func)
+		return ERR_PTR(-EINVAL);
 
-	of_node_put(args.np);
-	return match->data;
+	if (reg_value)
+		*reg_value = func->reg_val;
 
-err:
-	of_node_put(args.np);
-	return ERR_PTR(ret);
+	return data;
 }
 
-int sunxi_sram_claim(struct device *dev)
+#define SUNXI_SRAM_PROP "allwinner,sram"
+#define SUNXI_SRAM_CELLS 1
+
+static int sunxi_sram_claim_one(struct device_node *np, u8 arg)
 {
 	const struct sunxi_sram_data *sram_data;
 	struct sunxi_sram_desc *sram_desc;
 	unsigned int device;
 	u32 val, mask;
 
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	if (!base)
-		return -EPROBE_DEFER;
-
-	if (!dev || !dev->of_node)
-		return -EINVAL;
-
-	sram_data = sunxi_sram_of_parse(dev->of_node, &device);
+	sram_data = sunxi_sram_get_match(np, arg, &device);
 	if (IS_ERR(sram_data))
 		return PTR_ERR(sram_data);
 
@@ -248,33 +217,28 @@ int sunxi_sram_claim(struct device *dev)
 	if (sram_desc->claim_cnt) {
 		if (!WARN_ON(sram_desc->claim_cnt == U8_MAX))
 			sram_desc->claim_cnt++;
-		spin_unlock(&sram_lock);
-		return 0;
+	} else {
+		mask = GENMASK(sram_data->offset + sram_data->width - 1,
+			       sram_data->offset);
+		val = readl(base + sram_data->reg);
+		val &= ~mask;
+		writel(val | ((device << sram_data->offset) & mask),
+		       base + sram_data->reg);
+
+		sram_desc->claim_cnt++;
 	}
 
-	mask = GENMASK(sram_data->offset + sram_data->width - 1,
-		       sram_data->offset);
-	val = readl(base + sram_data->reg);
-	val &= ~mask;
-	writel(val | ((device << sram_data->offset) & mask),
-	       base + sram_data->reg);
-
-	sram_desc->claim_cnt++;
 	spin_unlock(&sram_lock);
 
 	return 0;
 }
-EXPORT_SYMBOL(sunxi_sram_claim);
 
-void sunxi_sram_release(struct device *dev)
+static void sunxi_sram_release_one(struct device_node *np, u8 arg)
 {
 	const struct sunxi_sram_data *sram_data;
 	struct sunxi_sram_desc *sram_desc;
 
-	if (!dev || !dev->of_node)
-		return;
-
-	sram_data = sunxi_sram_of_parse(dev->of_node, NULL);
+	sram_data = sunxi_sram_get_match(np, arg, NULL);
 	if (IS_ERR(sram_data))
 		return;
 
@@ -285,6 +249,70 @@ void sunxi_sram_release(struct device *dev)
 		sram_desc->claim_cnt--;
 	spin_unlock(&sram_lock);
 }
+
+int sunxi_sram_claim(struct device *dev)
+{
+	struct of_phandle_iterator it;
+	int err;
+	int count = 0;
+
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (!base)
+		return -EPROBE_DEFER;
+
+	if (!dev || !dev->of_node)
+		return -EINVAL;
+
+	of_for_each_phandle(&it, err, dev->of_node, SUNXI_SRAM_PROP,
+			    NULL, SUNXI_SRAM_CELLS) {
+		u32 args[SUNXI_SRAM_CELLS];
+
+		of_phandle_iterator_args(&it, args, SUNXI_SRAM_CELLS);
+
+		err = sunxi_sram_claim_one(it.node, args[0]);
+		if (err)
+			goto err;
+
+		count++;
+	}
+
+	if (count == 0)
+		return -ENOENT;
+
+	return 0;
+
+err:
+	while (count--) {
+		struct of_phandle_args args;
+
+		of_parse_phandle_with_fixed_args(dev->of_node, SUNXI_SRAM_PROP,
+						 SUNXI_SRAM_CELLS, count, &args);
+		sunxi_sram_release_one(args.np, args.args[0]);
+	}
+
+	return err;
+}
+EXPORT_SYMBOL(sunxi_sram_claim);
+
+void sunxi_sram_release(struct device *dev)
+{
+	struct of_phandle_iterator it;
+	int err;
+
+	if (!dev || !dev->of_node)
+		return;
+
+	of_for_each_phandle(&it, err, dev->of_node, SUNXI_SRAM_PROP,
+			    NULL, SUNXI_SRAM_CELLS) {
+		u32 args[SUNXI_SRAM_CELLS];
+
+		of_phandle_iterator_args(&it, args, SUNXI_SRAM_CELLS);
+
+		sunxi_sram_release_one(it.node, args[0]);
+	}
+}
 EXPORT_SYMBOL(sunxi_sram_release);
 
 struct sunxi_sramc_variant {
-- 
2.47.3


