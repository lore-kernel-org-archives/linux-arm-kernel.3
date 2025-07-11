Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8783C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAwpf6q1OAFUYW1t8tkYML5f6zAM037csqTvRpDmGTU=; b=uri9mhNF+NF7VzQzvx4YkK+1QQ
	zsbItQgTdJvSp5/EZxlN7Si2ectnJyURSHexIO8ViPWkV7bRZ5c6tSDtCHnAABokhXamTWRfQrp+2
	Os29nYDrBFCv+AR5eTOEz6tj9+2v0zyNO4/30bCSybNXbF3m1B+rxdOkuftdxfwoJbmb0T1P3ejWb
	SBo1SD09CCr39xn5Qrw/B+EwU4ZTfnKW//xOGg0v/Cp9tslQtetzof1NvGsRmfe4QrSxxzQyuB5ci
	dY129BZssilXos/UoWlIp0KpxeuO757ES3wBTowQqG8NBETzW6+TK6UY61QyBUYZkD7gC5OQjjmM0
	bzbefgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaG1z-0000000FCIQ-3OID;
	Fri, 11 Jul 2025 15:51:23 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFCW-0000000F5eJ-2Gua;
	Fri, 11 Jul 2025 14:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752245883; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BzoeaZuSu+JRG0pFQ+xUn68OpDDvKtH+YKqA8bMHOW2fgc4hsVwy1m88p/+EEKqAi3V5roE+vslzi6X4WFspVCBGsV7r+QmHLhcQLg+qcSc37+tMjspP3MbK71OqpPOOWyk62CBjj/zpmZRuw9qytAwa/70Qe3uQV+Bk9KOgj6k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752245883; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jAwpf6q1OAFUYW1t8tkYML5f6zAM037csqTvRpDmGTU=; 
	b=eSow1R8+JV1i64Kz3PoE3U92JXsMO059EIf0pVQg3TMoeTgj4P2x1QYro6Opk/U6XjJEWmBPVAlkOlA0kWlsG/oJHuIYbY6hGtPtblevVBYBgkPaSAclF4lt+y/bFmEOTMiFstibAAzS4eG5S9I0TfWmDKGWv3zJXxRTa87ayeo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752245883;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=jAwpf6q1OAFUYW1t8tkYML5f6zAM037csqTvRpDmGTU=;
	b=SPa+zi99oU6Unbg+q6UO0emr1sdI2hzr3J/zNeRtH/p6jGavSlY6l1E0p3c0+tW4
	miDMp3nda+WdXis4P+pGaxefrbH87abt//RaAZwWZP46m96QZV//Aj6DsxPsiMEWIRn
	YI9NVge+junQ/IYbsIZ4bCad8GBb2gUd4hwXJm6A=
Received: by mx.zohomail.com with SMTPS id 175224588104259.94795638566734;
	Fri, 11 Jul 2025 07:58:01 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 11 Jul 2025 16:57:37 +0200
Subject: [PATCH 5/5] cpufreq: mediatek-hw: Add support for MT8196
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-mt8196-cpufreq-v1-5-e1b0a3b4ac61@collabora.com>
References: <20250711-mt8196-cpufreq-v1-0-e1b0a3b4ac61@collabora.com>
In-Reply-To: <20250711-mt8196-cpufreq-v1-0-e1b0a3b4ac61@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Hector Yuan <hector.yuan@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_075812_648216_B632A37B 
X-CRM114-Status: GOOD (  18.77  )
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

Add support for it, which necessitates acquiring some syscons as regmaps
to both check for the FDVFS magic number and to set target frequencies
for FDVFS.

I've verified with both `sysbench cpu run` and `head -c 10G \
/dev/urandom | pigz -p 8 -c - | pv -ba > /dev/null` that we don't just
get a higher reported clock frequency, but that the observed performance
also increases, by a factor of 2.64 in an 8 thread sysbench test.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 78 ++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 53611077d0d9a2d9865cf771568ab71abc0e6fbd..30cf038babb6d02a0666ed39b926f3977a164236 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -9,10 +9,12 @@
 #include <linux/init.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -24,6 +26,8 @@
 #define POLL_USEC			1000
 #define TIMEOUT_USEC			300000
 
+#define MT8196_FDVFS_MAGIC		0xABCD0001UL
+
 enum {
 	REG_FREQ_LUT_TABLE,
 	REG_FREQ_ENABLE,
@@ -36,7 +40,10 @@ enum {
 };
 
 struct mtk_cpufreq_priv {
+	struct device *dev;
 	const struct mtk_cpufreq_variant *variant;
+	struct regmap *fdvfs_config;
+	struct regmap *fdvfs;
 };
 
 struct mtk_cpufreq_domain {
@@ -49,7 +56,9 @@ struct mtk_cpufreq_domain {
 };
 
 struct mtk_cpufreq_variant {
+	int (*init)(struct mtk_cpufreq_priv *priv);
 	const u16 reg_offsets[REG_ARRAY_SIZE];
+	const unsigned int fdvfs_fdiv;
 };
 
 static const struct mtk_cpufreq_variant cpufreq_mtk_base_variant = {
@@ -63,6 +72,38 @@ static const struct mtk_cpufreq_variant cpufreq_mtk_base_variant = {
 	},
 };
 
+static int mtk_cpufreq_hw_mt8196_init(struct mtk_cpufreq_priv *priv)
+{
+	u32 val;
+
+	priv->fdvfs_config = syscon_regmap_lookup_by_compatible("mediatek,mt8196-fdvfs-config");
+	if (!priv->fdvfs_config)
+		return dev_err_probe(priv->dev, PTR_ERR(priv->fdvfs_config),
+				     "failed to get fdvfs-config syscon\n");
+
+	if (!regmap_read(priv->fdvfs_config, 0x0, &val) && val == MT8196_FDVFS_MAGIC) {
+		priv->fdvfs = syscon_regmap_lookup_by_compatible("mediatek,mt8196-fdvfs");
+		if (!priv->fdvfs)
+			return dev_err_probe(priv->dev, PTR_ERR(priv->fdvfs),
+					     "failed to get fdvfs syscon\n");
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
+};
+
 static int __maybe_unused
 mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
 			  unsigned long *KHz)
@@ -91,10 +132,34 @@ mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
 	return 0;
 }
 
+static int mtk_cpufreq_hw_fdvfs_switch(unsigned int target_freq,
+				       struct cpufreq_policy *policy)
+{
+	struct mtk_cpufreq_domain *data = policy->driver_data;
+	struct mtk_cpufreq_priv *priv = data->parent;
+	unsigned int cpu;
+	int ret;
+
+	target_freq = DIV_ROUND_UP(target_freq, priv->variant->fdvfs_fdiv);
+	for_each_cpu(cpu, policy->real_cpus) {
+		ret = regmap_write(priv->fdvfs, cpu * 4, target_freq);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
 				       unsigned int index)
 {
 	struct mtk_cpufreq_domain *data = policy->driver_data;
+	unsigned int target_freq;
+
+	if (data->parent->fdvfs) {
+		target_freq = policy->freq_table[index].frequency;
+		return mtk_cpufreq_hw_fdvfs_switch(target_freq, policy);
+	}
 
 	writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
 
@@ -127,7 +192,10 @@ static unsigned int mtk_cpufreq_hw_fast_switch(struct cpufreq_policy *policy,
 
 	index = cpufreq_table_find_index_dl(policy, target_freq, false);
 
-	writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
+	if (data->parent->fdvfs)
+		mtk_cpufreq_hw_fdvfs_switch(target_freq, policy);
+	else
+		writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
 
 	return policy->freq_table[index].frequency;
 }
@@ -339,6 +407,13 @@ static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
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
@@ -357,6 +432,7 @@ static void mtk_cpufreq_hw_driver_remove(struct platform_device *pdev)
 
 static const struct of_device_id mtk_cpufreq_hw_match[] = {
 	{ .compatible = "mediatek,cpufreq-hw", .data = &cpufreq_mtk_base_variant },
+	{ .compatible = "mediatek,mt8196-cpufreq-hw", .data = &cpufreq_mtk_mt8196_variant },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_cpufreq_hw_match);

-- 
2.50.0


