Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94598C83F2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhgqMkvJ2gEVmIAD+4huwT8GCQ2yDInP6e75xTIEBvc=; b=KprU/llPcgCMpUcRAsNKKK+vq4
	Upnq8X6SG7mf+qPbZMzL8PKdl982hGnZtlYepIJZYI+v6OZSUaO2vQQIUbdODX4DXACeCYB5hjJut
	BLxdEmwP5UYXM0BFCInn67r/eDitzc+ypO3lm3wzAID3dLVlqnsgVtWvgtx2NQ81YJJqFh067EzcP
	+qGbbb+26eJQZh62ZXw62LsSJJUVk1qu0MW56Lo6TlDtj6FwuOiaP0VJUm5uPvwJZGXCzCvH5MxpC
	6S2pBfMr6K+BNxffk7Pm3am+JYPGieUrx4o6sd8awP35feA3B1HzNgd3J7ORg7ovXz0rRcuzcpYc6
	FHmO9L/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKn9-00000002ZP8-3XnZ;
	Mon, 14 Jul 2025 15:08:31 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJrY-00000002QK6-1ZaH;
	Mon, 14 Jul 2025 14:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752502127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ORFqVihe5f5SSjorHR3QpRCpIff9qeAwgdKFoWmmO/U6LoQomf6QtkQjfmZN8q/9CPMMCHHNdophZmxdc9k2dFMlvz+HK9NmMCMhlQpibRU1ZPa9CwschtW+2FbXh2CyxoCdjyxM9tjhLiywM6ZOVxW18yng038OuUe+cVkMhmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752502127; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GhgqMkvJ2gEVmIAD+4huwT8GCQ2yDInP6e75xTIEBvc=; 
	b=NV35unbIdVUBCUlXeWlUZT5Qr7I1T2jqE7f8WIcP+rIjwI2OP8PeVmTEA0icQPGjilVSp9U00n86gPshAmhVii7I22XLO94xmD+KQgixuZQHeVQQh+eMc3CUvjymNRnteYtnKultYQfixFU3AKF16U1GO76I2SxGUeYAYxUuyZI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752502127;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=GhgqMkvJ2gEVmIAD+4huwT8GCQ2yDInP6e75xTIEBvc=;
	b=alwJWvB3176m0cyaFtVNUB0GuVSjylv2ojd3Z5XYDNnBMcAMFkSxaOOBjIy0SbWJ
	zeE/hx+G4FVZ3CxlhQbVioYRS/55Pi5Nt/eWMsgLfL/k1hX1r0v92E+xG+cFf2BABi4
	oxNJ3VAnOaL+xDMh/gUhpyX5U+z//VxH8qCLCDJc=
Received: by mx.zohomail.com with SMTPS id 1752502125478993.0818009950015;
	Mon, 14 Jul 2025 07:08:45 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 14 Jul 2025 16:08:17 +0200
Subject: [PATCH v2 4/4] cpufreq: mediatek-hw: Add support for MT8196
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-mt8196-cpufreq-v2-4-cc85e78855c7@collabora.com>
References: <20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com>
In-Reply-To: <20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_070900_498962_1427427A 
X-CRM114-Status: GOOD (  19.03  )
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

The MT8196 SoC uses DVFS to set a desired target frequency for each CPU
core. It also uses slightly different register offsets.

Add support for it, which necessitates reworking how the mmio regs are
acquired, as mt8196 has the fdvfs config register and the fdvfs
registers as two reg items before the performance domains.

I've verified with both `sysbench cpu run` and `head -c 10G \
/dev/urandom | pigz -p 8 -c - | pv -ba > /dev/null` that we don't just
get a higher reported clock frequency, but that the observed performance
also increases, by a factor of 2.64 in an 8 thread sysbench test.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 75 +++++++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 53611077d0d9a2d9865cf771568ab71abc0e6fbd..de6b2b8f6600f23148a7a24cafeae339903ba119 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -24,6 +24,8 @@
 #define POLL_USEC			1000
 #define TIMEOUT_USEC			300000
 
+#define MT8196_FDVFS_MAGIC		0xABCD0001UL
+
 enum {
 	REG_FREQ_LUT_TABLE,
 	REG_FREQ_ENABLE,
@@ -36,7 +38,10 @@ enum {
 };
 
 struct mtk_cpufreq_priv {
+	struct device *dev;
 	const struct mtk_cpufreq_variant *variant;
+	void __iomem *fdvfs_config;
+	void __iomem *fdvfs;
 };
 
 struct mtk_cpufreq_domain {
@@ -49,7 +54,10 @@ struct mtk_cpufreq_domain {
 };
 
 struct mtk_cpufreq_variant {
+	int (*init)(struct mtk_cpufreq_priv *priv);
 	const u16 reg_offsets[REG_ARRAY_SIZE];
+	const unsigned int fdvfs_fdiv;
+	const unsigned int domain_offset;
 };
 
 static const struct mtk_cpufreq_variant cpufreq_mtk_base_variant = {
@@ -63,6 +71,37 @@ static const struct mtk_cpufreq_variant cpufreq_mtk_base_variant = {
 	},
 };
 
+static int mtk_cpufreq_hw_mt8196_init(struct mtk_cpufreq_priv *priv)
+{
+	priv->fdvfs_config = devm_of_iomap(priv->dev, priv->dev->of_node, 0, NULL);
+	if (IS_ERR_OR_NULL(priv->fdvfs_config))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->fdvfs_config),
+				     "failed to get fdvfs-config iomem\n");
+
+	if (readl_relaxed(priv->fdvfs_config) == MT8196_FDVFS_MAGIC) {
+		priv->fdvfs = devm_of_iomap(priv->dev, priv->dev->of_node, 1, NULL);
+		if (IS_ERR_OR_NULL(priv->fdvfs))
+			return dev_err_probe(priv->dev, PTR_ERR(priv->fdvfs),
+					     "failed to get fdvfs iomem\n");
+	}
+
+	return 0;
+}
+
+static const struct mtk_cpufreq_variant cpufreq_mtk_mt8196_variant = {
+	.init = mtk_cpufreq_hw_mt8196_init,
+	.reg_offsets = {
+		[REG_FREQ_LUT_TABLE]	= 0x0,
+		[REG_FREQ_ENABLE]	= 0x84,
+		[REG_FREQ_PERF_STATE]	= 0x88,
+		[REG_FREQ_HW_STATE]	= 0x8c,
+		[REG_EM_POWER_TBL]	= 0x90,
+		[REG_FREQ_LATENCY]	= 0x114,
+	},
+	.fdvfs_fdiv = 26000,
+	.domain_offset = 2,
+};
+
 static int __maybe_unused
 mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
 			  unsigned long *KHz)
@@ -91,12 +130,31 @@ mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
 	return 0;
 }
 
+static void mtk_cpufreq_hw_fdvfs_switch(unsigned int target_freq,
+				       struct cpufreq_policy *policy)
+{
+	struct mtk_cpufreq_domain *data = policy->driver_data;
+	struct mtk_cpufreq_priv *priv = data->parent;
+	unsigned int cpu;
+
+	target_freq = DIV_ROUND_UP(target_freq, priv->variant->fdvfs_fdiv);
+	for_each_cpu(cpu, policy->real_cpus) {
+		writel_relaxed(target_freq, priv->fdvfs + cpu * 4);
+	}
+}
+
 static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
 				       unsigned int index)
 {
 	struct mtk_cpufreq_domain *data = policy->driver_data;
+	unsigned int target_freq;
 
-	writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
+	if (data->parent->fdvfs) {
+		target_freq = policy->freq_table[index].frequency;
+		mtk_cpufreq_hw_fdvfs_switch(target_freq, policy);
+	} else {
+		writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
+	}
 
 	return 0;
 }
@@ -127,7 +185,10 @@ static unsigned int mtk_cpufreq_hw_fast_switch(struct cpufreq_policy *policy,
 
 	index = cpufreq_table_find_index_dl(policy, target_freq, false);
 
-	writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
+	if (data->parent->fdvfs)
+		mtk_cpufreq_hw_fdvfs_switch(target_freq, policy);
+	else
+		writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
 
 	return policy->freq_table[index].frequency;
 }
@@ -188,7 +249,7 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 	if (ret < 0)
 		return ret;
 
-	index = args.args[0];
+	index = args.args[0] + priv->variant->domain_offset;
 	of_node_put(args.np);
 
 	data->parent = priv;
@@ -339,6 +400,13 @@ static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->variant = data;
+	priv->dev = &pdev->dev;
+
+	if (priv->variant->init) {
+		ret = priv->variant->init(priv);
+		if (ret)
+			return ret;
+	}
 
 	platform_set_drvdata(pdev, priv);
 	cpufreq_mtk_hw_driver.driver_data = pdev;
@@ -357,6 +425,7 @@ static void mtk_cpufreq_hw_driver_remove(struct platform_device *pdev)
 
 static const struct of_device_id mtk_cpufreq_hw_match[] = {
 	{ .compatible = "mediatek,cpufreq-hw", .data = &cpufreq_mtk_base_variant },
+	{ .compatible = "mediatek,mt8196-cpufreq-hw", .data = &cpufreq_mtk_mt8196_variant },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_cpufreq_hw_match);

-- 
2.50.1


