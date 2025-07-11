Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1539C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEyk9gUxmxGGqpdMez2kdxKmqgQQdyz75f8g3l8O+F0=; b=sqiUDvpzaqfxtq9r57weDgGePC
	+EuNZIM44UVJlN7FSxVTJSVn0C6EktGsAPMQyXI9GLnf+zOdigECQWRy6O2wR9rMQQNV0jxBsIhz2
	7M8pkdOOmVxVnmLU4kSrFi+Ts96hbosbJrxkZF8t9FuFmKRaWM72dBK78Y/4YLel84nu0GXxHiE6C
	YZhREUC+MhFpD++Hi4RLnOH4YUjuA3EL4LwrHbOweX2aFaTgOR4rsCmPClJY5gkE1q1LZFh9kjFdz
	NHTB2vKhip6RU+zkVoKImZlabKCnp8/ZmiHsoM06iHmoNc5MMwkHD86N1e9FjP6YH7EneCB8C5eJd
	JvrmB9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFzg-0000000FC5y-34vS;
	Fri, 11 Jul 2025 15:49:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFCU-0000000F5dh-2OOJ;
	Fri, 11 Jul 2025 14:58:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752245879; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mLT4odeGP3wtaLuuJNmMU4mcGOoofU0jqjV3UnHSpd9vUccGyc2MCwVWnfUY70ss4ksb32AtkbMcjzAt+vZd7EB8i9shS9RYaC5Qt8RjLb5pOFDfbVz9w9cFOw/w6y7fENObqG7ikgsgP1K+yZWgVsgKlHN9PPZ6vY/2IFGrnSA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752245879; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kEyk9gUxmxGGqpdMez2kdxKmqgQQdyz75f8g3l8O+F0=; 
	b=FYJPubdba2WS9Oxd+ltzCD+nVb4CVjmHzdoqQa3b1Ck/hUM1j7kIPSCgge51wfrr9KIp5wKdyA3VddFIMRYxsIK41Ie4NXNxmtZhtqDpSb0/0A7S0Y5v1exgUR2lr5ZaMdwoHA3mp/kXrKToFboZmq+kioffTDkxxM8N1kqXNUQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752245879;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=kEyk9gUxmxGGqpdMez2kdxKmqgQQdyz75f8g3l8O+F0=;
	b=aaqcBnF5Xda15uuNKnHDj3Hd2rA3hsPqIm8XjzsJdb6WHPd4bF7K+v99IX3Js5gJ
	Qn1UlapnRbcJDp2ycM69mTk/A2n/Ncie4DqvBn7zNOZh5r7xL/Ip3dViuygldQedsVp
	WN5bhr5PgzCUCzHgtj9G+1mVEB0AqCaBmJwsNjzc=
Received: by mx.zohomail.com with SMTPS id 1752245877398787.5849825391359;
	Fri, 11 Jul 2025 07:57:57 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 11 Jul 2025 16:57:36 +0200
Subject: [PATCH 4/5] cpufreq: mediatek-hw: Separate per-domain and
 per-instance data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-mt8196-cpufreq-v1-4-e1b0a3b4ac61@collabora.com>
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
X-CRM114-CacheID: sfid-20250711_075810_643840_2B2F7116 
X-CRM114-Status: GOOD (  18.78  )
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

As it stood, the mediatek cpufreq driver could get away with never
really having a private driver instance struct. This is because all data
was stored in the per-domain structs.

However, this complicates matters when actual per-instance data like the
variant struct is introduced. Instead of having a pointer to it for
every domain, have a pointer to a global "priv" struct that can be
extended over time, and rename the "data" struct to "domain" to
distinguish its purpose better.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 42 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index b2aba1842226c7d24a8b9599ea62408cac9f803c..53611077d0d9a2d9865cf771568ab71abc0e6fbd 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -35,13 +35,17 @@ enum {
 	REG_ARRAY_SIZE,
 };
 
-struct mtk_cpufreq_data {
+struct mtk_cpufreq_priv {
+	const struct mtk_cpufreq_variant *variant;
+};
+
+struct mtk_cpufreq_domain {
+	struct mtk_cpufreq_priv *parent;
 	struct cpufreq_frequency_table *table;
 	void __iomem *reg_bases[REG_ARRAY_SIZE];
 	struct resource *res;
 	void __iomem *base;
 	int nr_opp;
-	const struct mtk_cpufreq_variant *variant;
 };
 
 struct mtk_cpufreq_variant {
@@ -63,7 +67,7 @@ static int __maybe_unused
 mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
 			  unsigned long *KHz)
 {
-	struct mtk_cpufreq_data *data;
+	struct mtk_cpufreq_domain *data;
 	struct cpufreq_policy *policy;
 	int i;
 
@@ -90,7 +94,7 @@ mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
 static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
 				       unsigned int index)
 {
-	struct mtk_cpufreq_data *data = policy->driver_data;
+	struct mtk_cpufreq_domain *data = policy->driver_data;
 
 	writel_relaxed(index, data->reg_bases[REG_FREQ_PERF_STATE]);
 
@@ -99,7 +103,7 @@ static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
 
 static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
 {
-	struct mtk_cpufreq_data *data;
+	struct mtk_cpufreq_domain *data;
 	struct cpufreq_policy *policy;
 	unsigned int index;
 
@@ -118,7 +122,7 @@ static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
 static unsigned int mtk_cpufreq_hw_fast_switch(struct cpufreq_policy *policy,
 					       unsigned int target_freq)
 {
-	struct mtk_cpufreq_data *data = policy->driver_data;
+	struct mtk_cpufreq_domain *data = policy->driver_data;
 	unsigned int index;
 
 	index = cpufreq_table_find_index_dl(policy, target_freq, false);
@@ -129,7 +133,7 @@ static unsigned int mtk_cpufreq_hw_fast_switch(struct cpufreq_policy *policy,
 }
 
 static int mtk_cpu_create_freq_table(struct platform_device *pdev,
-				     struct mtk_cpufreq_data *data)
+				     struct mtk_cpufreq_domain *data)
 {
 	struct device *dev = &pdev->dev;
 	u32 temp, i, freq, prev_freq = 0;
@@ -164,9 +168,9 @@ static int mtk_cpu_create_freq_table(struct platform_device *pdev,
 
 static int mtk_cpu_resources_init(struct platform_device *pdev,
 				  struct cpufreq_policy *policy,
-				  const struct mtk_cpufreq_variant *variant)
+				  struct mtk_cpufreq_priv *priv)
 {
-	struct mtk_cpufreq_data *data;
+	struct mtk_cpufreq_domain *data;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct of_phandle_args args;
@@ -187,6 +191,8 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 	index = args.args[0];
 	of_node_put(args.np);
 
+	data->parent = priv;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
 	if (!res) {
 		dev_err(dev, "failed to get mem resource %d\n", index);
@@ -207,10 +213,9 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 
 	data->base = base;
 	data->res = res;
-	data->variant = variant;
 
 	for (i = REG_FREQ_LUT_TABLE; i < REG_ARRAY_SIZE; i++)
-		data->reg_bases[i] = base + variant->reg_offsets[i];
+		data->reg_bases[i] = base + priv->variant->reg_offsets[i];
 
 	ret = mtk_cpu_create_freq_table(pdev, data);
 	if (ret) {
@@ -231,7 +236,7 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 {
 	struct platform_device *pdev = cpufreq_get_driver_data();
 	int sig, pwr_hw = CPUFREQ_HW_STATUS | SVS_HW_STATUS;
-	struct mtk_cpufreq_data *data;
+	struct mtk_cpufreq_domain *data;
 	unsigned int latency;
 	int ret;
 
@@ -270,7 +275,7 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 
 static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 {
-	struct mtk_cpufreq_data *data = policy->driver_data;
+	struct mtk_cpufreq_domain *data = policy->driver_data;
 	struct resource *res = data->res;
 	void __iomem *base = data->base;
 
@@ -283,7 +288,7 @@ static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 static void mtk_cpufreq_register_em(struct cpufreq_policy *policy)
 {
 	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
-	struct mtk_cpufreq_data *data = policy->driver_data;
+	struct mtk_cpufreq_domain *data = policy->driver_data;
 
 	em_dev_register_perf_domain(get_cpu_device(policy->cpu), data->nr_opp,
 				    &em_cb, policy->cpus, true);
@@ -305,6 +310,7 @@ static struct cpufreq_driver cpufreq_mtk_hw_driver = {
 
 static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
 {
+	struct mtk_cpufreq_priv *priv;
 	const void *data;
 	int ret, cpu;
 	struct device *cpu_dev;
@@ -328,7 +334,13 @@ static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
 	if (!data)
 		return -EINVAL;
 
-	platform_set_drvdata(pdev, (void *) data);
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->variant = data;
+
+	platform_set_drvdata(pdev, priv);
 	cpufreq_mtk_hw_driver.driver_data = pdev;
 
 	ret = cpufreq_register_driver(&cpufreq_mtk_hw_driver);

-- 
2.50.0


