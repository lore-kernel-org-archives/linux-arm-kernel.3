Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38875C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFeYngD4ucIt7AO/MWX4ZQHUevaFxkhqhnDYFChGYVQ=; b=dO/lpaL6ndIwPEiA+mv4YDSZK4
	eQxYPL29gL+Pt7kGC/cHUb+GKrIk9g5CQ8+IUaP5K10/OZEV/ea4EZRco9WFG7RtsDg//deiW7a4Q
	OAeRtL87F9f8pZLSsWyEYzbipNyRl9OvbeVXiUjMEdr8qIaZjegz3OXTkLxRZUt+vRkD9dIzFMCA+
	d21XxK0UPvo5p1vbCsQ+1dVpWXlnlTAQZkB3ca0K55EIRZrxDRnmV8TTFObLao1DxkxuS9cWcZ5hS
	yBMzDth392EFntav32bVYxvuwaNb2pbBt9wFPoXewbm3sdkfcdKUmsyjExjGIxtHqhzrdMsDuL5ik
	A1lT3ExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6PU-00000008LUC-2fWZ;
	Wed, 16 Jul 2025 17:59:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6IF-00000008Kev-0xr9;
	Wed, 16 Jul 2025 17:51:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752688295; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MeXqvEeEGB8Xf2pj+MTOTQQcWskKvwobxhUK6KHJwVg72M3EtBc9fsLbxpthwr0B+L+3Ker2zkGRx8sH5r24PNd9vrgZH0uho/WHFlszFemsstGI8Fmx5VEU8Q4iPob9x3SHUrQq57smfaTZHTvyOWNEGgWheCWPUkADwZZwWPY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752688295; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CFeYngD4ucIt7AO/MWX4ZQHUevaFxkhqhnDYFChGYVQ=; 
	b=mRMFHo7UxlZfPPBKFgsYWW59IzoMgOKLC4jaHqVlL7OyGq7jeMcUrrXY+CcXluIbfGSh5VxyiSezKoW63rqIyCNJKoS9O8uo68zjYqN4B1QRFWnJmm4aoxnEZJyVkfQ8sk/OeAPhQuSlcwbvp8YlZbsRYmFvbF0GhDokL8vkAAQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752688295;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=CFeYngD4ucIt7AO/MWX4ZQHUevaFxkhqhnDYFChGYVQ=;
	b=IMgcm7ZOsOXScxrQ6/9XkrD74GRW1FQUOTR7mRTC1YlsEQnYeOaGyJ2CC7k3d8Sh
	25K7l4+8jjxcluEq736lz++Jhvhxfkzsoko9j0pAAXb3Mlc14kg5WZhLZ738v7x+Y24
	7hV0TlyK5KMwnARLmgE6BXrNQqxrl3S4plA/ApPw=
Received: by mx.zohomail.com with SMTPS id 1752688292890516.4771910859703;
	Wed, 16 Jul 2025 10:51:32 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 16 Jul 2025 19:51:23 +0200
Subject: [PATCH v3 2/4] cpufreq: mediatek-hw: Refactor match data into
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-mt8196-cpufreq-v3-2-d440fb810d7e@collabora.com>
References: <20250716-mt8196-cpufreq-v3-0-d440fb810d7e@collabora.com>
In-Reply-To: <20250716-mt8196-cpufreq-v3-0-d440fb810d7e@collabora.com>
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
X-CRM114-CacheID: sfid-20250716_105147_326338_993DFF60 
X-CRM114-Status: GOOD (  16.56  )
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

In preparation of adding support for hybrid "FDVFS" for MT8196, refactor
the code to make the DT match data a struct, which currently only
contains a single member: the reg offsets. This will allow this struct
to be extended with other members for other hardware variants.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


