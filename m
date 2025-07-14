Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91AEC83F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwvjge2GeqaMg396NhQCN7JdiOQJJjUcM4eCQwiwFj0=; b=mEA1yySPT5NH+agdnNNlW7OYoD
	h5DAarFfRr6DSpRf6lN5h6mEeOCiunKKjmdR2boYfGhCDVWwYXtUCuVNNbyqjpjzx367ai0xTqT1d
	NviSCiuVWai4b/SKAuCAvITnzEbBiSh952BPslFnie2qu/nIGZuFbA4ab1zdut4eG0D3gZEm9IKuX
	BnJJWYCtIdEL13/LSqe3k5sb43V9Ha1RIBOrX91O5GwavD4Ycwe0108dniASLmiurcQR1TTTKcbuD
	HoIZlr1bpuofQeUclU9l9TATKl76lcJPKoAQqxWuxLBimcmmhIsj+vghUU2LJeGdY/SxvTF/oQFz7
	iq3fgGaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKn7-00000002ZLy-2Bf7;
	Mon, 14 Jul 2025 15:08:29 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJrT-00000002QJH-445e;
	Mon, 14 Jul 2025 14:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752502119; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P8UDvgsVwVciUQt96dTQIa29Smi8epcHkilTE2jhIgd25ttH4jxGxPNoo13IiFXfyBA/N3vcvjoopzouIj4G8Ren6bSpvtsQfm61MBPg/v86KAVYD8rapcbrTi2/kkkxbm6OS0Se2RqUMwzb5jNhrQYtfZDwpkWrUw9+ae8uAcI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752502119; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zwvjge2GeqaMg396NhQCN7JdiOQJJjUcM4eCQwiwFj0=; 
	b=Q3bGZySeLOjOLGbTE28edXMK/4B1OWTFsS6Rta9+IGG+mevcQDAEjnjJ7RggU3CAnI9oRVs/WItK/boZdd3K6Ojcq3coYcZoHzgis1sUBjH6nV3N1Hrp13rM9thy+D7zWS4xnx328vLPfFpI77NetCi5H8n/gtgFMgObaEnkkbY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752502119;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=zwvjge2GeqaMg396NhQCN7JdiOQJJjUcM4eCQwiwFj0=;
	b=J3yoWZvM9Jb01k3qPIHdkpDSGi1HcXftJdv58jzN7Dy2B2xViu4dNzDrbt0aDNnT
	wlAEaVrvrJzGBk4UrK3EbJOtXDKTiqv2Lk7wczEEvay2HN6JdTDf4cjz+63KcGwhfXM
	Y4BVqMxykVj1u9yYaKqYay79QxhRa7R+6SF+fQyE=
Received: by mx.zohomail.com with SMTPS id 1752502117056801.62164174365;
	Mon, 14 Jul 2025 07:08:37 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 14 Jul 2025 16:08:15 +0200
Subject: [PATCH v2 2/4] cpufreq: mediatek-hw: Refactor match data into
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-mt8196-cpufreq-v2-2-cc85e78855c7@collabora.com>
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
X-CRM114-CacheID: sfid-20250714_070856_071388_B5B79104 
X-CRM114-Status: GOOD (  15.69  )
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

While the driver could get away with having the per-compatible match
data just be an array of the reg offsets, the only thing it used it for
right now, this doesn't really allow it to be extended in any meaningful
way if some other per-variant information needs to be communicated.

Refactor the code to make the DT match data a struct, which currently
only contains a single member: the reg offsets. This will allow this
struct to be extended with other members for other hardware variants.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 74f1b4c796e4cc9ebccf50dd4e165a1eba03136a..b2aba1842226c7d24a8b9599ea62408cac9f803c 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -41,15 +41,22 @@ struct mtk_cpufreq_data {
 	struct resource *res;
 	void __iomem *base;
 	int nr_opp;
+	const struct mtk_cpufreq_variant *variant;
 };
 
-static const u16 cpufreq_mtk_offsets[REG_ARRAY_SIZE] = {
-	[REG_FREQ_LUT_TABLE]	= 0x0,
-	[REG_FREQ_ENABLE]	= 0x84,
-	[REG_FREQ_PERF_STATE]	= 0x88,
-	[REG_FREQ_HW_STATE]	= 0x8c,
-	[REG_EM_POWER_TBL]	= 0x90,
-	[REG_FREQ_LATENCY]	= 0x110,
+struct mtk_cpufreq_variant {
+	const u16 reg_offsets[REG_ARRAY_SIZE];
+};
+
+static const struct mtk_cpufreq_variant cpufreq_mtk_base_variant = {
+	.reg_offsets = {
+		[REG_FREQ_LUT_TABLE]	= 0x0,
+		[REG_FREQ_ENABLE]	= 0x84,
+		[REG_FREQ_PERF_STATE]	= 0x88,
+		[REG_FREQ_HW_STATE]	= 0x8c,
+		[REG_EM_POWER_TBL]	= 0x90,
+		[REG_FREQ_LATENCY]	= 0x110,
+	},
 };
 
 static int __maybe_unused
@@ -157,7 +164,7 @@ static int mtk_cpu_create_freq_table(struct platform_device *pdev,
 
 static int mtk_cpu_resources_init(struct platform_device *pdev,
 				  struct cpufreq_policy *policy,
-				  const u16 *offsets)
+				  const struct mtk_cpufreq_variant *variant)
 {
 	struct mtk_cpufreq_data *data;
 	struct device *dev = &pdev->dev;
@@ -200,9 +207,10 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 
 	data->base = base;
 	data->res = res;
+	data->variant = variant;
 
 	for (i = REG_FREQ_LUT_TABLE; i < REG_ARRAY_SIZE; i++)
-		data->reg_bases[i] = base + offsets[i];
+		data->reg_bases[i] = base + variant->reg_offsets[i];
 
 	ret = mtk_cpu_create_freq_table(pdev, data);
 	if (ret) {
@@ -336,7 +344,7 @@ static void mtk_cpufreq_hw_driver_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mtk_cpufreq_hw_match[] = {
-	{ .compatible = "mediatek,cpufreq-hw", .data = &cpufreq_mtk_offsets },
+	{ .compatible = "mediatek,cpufreq-hw", .data = &cpufreq_mtk_base_variant },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_cpufreq_hw_match);

-- 
2.50.1


