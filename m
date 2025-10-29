Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F66CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 21:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aRsEnCiQ9M0lwVqWibYzYaOgwylmwPJ55DO60+I7HIw=; b=NcetYZ2nigbDUhD30PvNYZKZiP
	nIqAY1lMDkysOfbLbx+hxcx9F7WmkeNI1Cn/eWLSLwqJiRFkCwvy3rY/h74g8UXVvdy5SfrGb7+iP
	AQkT+YCHLWHMqLL4h7L3ISAamgsxq4mUXwspG/Ugvj3ZnKJmFW7sg7Kc8vzXIwBNJeDY/+OghDbdC
	A3SygtbKgJXN0aVuq/4JUmBnNOUCEYeQRxXScnw8j8tipIeoHpyPCv6iRPV3NOX52gJYeKFUsUEOF
	4b77wwSPQfszaIK7qB4fpFaIB1rTBDAeD1i8jeIYeon33KZA+8YFfsIvE2Dm3j/HKmow+FIC0r6W+
	70tOhKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDqL-00000002zBk-0gid;
	Wed, 29 Oct 2025 21:36:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDqI-00000002zAK-2qSa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 21:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA2B440C24;
	Wed, 29 Oct 2025 21:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE6EC4CEF7;
	Wed, 29 Oct 2025 21:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761773789;
	bh=SiQp/ENWkBUhBR+c2XqLQgeyJNHs792zr2aN4XdNGHE=;
	h=From:To:Cc:Subject:Date:From;
	b=aG682G4eIx2YeqDN/1oPrX6Dj4JDv2Zq4TRlmE4BDRS/AVIo4r2ZUTnTyaOF6Q5FW
	 FGatbLm1AZsVzl4SKpo7n8H/kCnn5dmOs4iVBAxowhunzP1D8IqMUos7bXre+2TKHR
	 LTD0NtXwzvsio8jdcOmJgoqfEtTNWO6ZD0eOODUFRs9bdE3tEGXsAywK7fqM5XY6Ot
	 M0TjKi34Tawfrk7fRbQEHkWIDzr50GwofXzs2r6Rf1UoodVuuxceDVLzv7SneN1tBo
	 TwthmEk28egzmGvujnyRm6Jj15APKMUSauN6KNGRgvtqbzbJayaUDbpGCXm3M92GLK
	 JDcOXUo6bguNQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf: arm_pmuv3: Add new Cortex and C1 CPU PMUs
Date: Wed, 29 Oct 2025 16:34:24 -0500
Message-ID: <20251029213424.2951519-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_143630_752758_0A457913 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

Add CPU PMU compatible strings for Cortex-A320, Cortex-A520AE,
Cortex-A720AE, and C1 Nano/Premium/Pro/Ultra.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
The bindings landed in 6.18, but I forgot the driver side needs 
updating...

 drivers/perf/arm_pmuv3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 69c5cc8f5606..64457b7f4013 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1465,6 +1465,10 @@ static int name##_pmu_init(struct arm_pmu *cpu_pmu)			\
 
 PMUV3_INIT_SIMPLE(armv8_pmuv3)
 
+PMUV3_INIT_SIMPLE(armv8_c1_nano)
+PMUV3_INIT_SIMPLE(armv8_c1_premium)
+PMUV3_INIT_SIMPLE(armv8_c1_pro)
+PMUV3_INIT_SIMPLE(armv8_c1_ultra)
 PMUV3_INIT_SIMPLE(armv8_cortex_a34)
 PMUV3_INIT_SIMPLE(armv8_cortex_a55)
 PMUV3_INIT_SIMPLE(armv8_cortex_a65)
@@ -1472,11 +1476,14 @@ PMUV3_INIT_SIMPLE(armv8_cortex_a75)
 PMUV3_INIT_SIMPLE(armv8_cortex_a76)
 PMUV3_INIT_SIMPLE(armv8_cortex_a77)
 PMUV3_INIT_SIMPLE(armv8_cortex_a78)
+PMUV3_INIT_SIMPLE(armv9_cortex_a320)
 PMUV3_INIT_SIMPLE(armv9_cortex_a510)
 PMUV3_INIT_SIMPLE(armv9_cortex_a520)
+PMUV3_INIT_SIMPLE(armv9_cortex_a520ae)
 PMUV3_INIT_SIMPLE(armv9_cortex_a710)
 PMUV3_INIT_SIMPLE(armv9_cortex_a715)
 PMUV3_INIT_SIMPLE(armv9_cortex_a720)
+PMUV3_INIT_SIMPLE(armv9_cortex_a720ae)
 PMUV3_INIT_SIMPLE(armv9_cortex_a725)
 PMUV3_INIT_SIMPLE(armv8_cortex_x1)
 PMUV3_INIT_SIMPLE(armv9_cortex_x2)
@@ -1508,6 +1515,10 @@ PMUV3_INIT_MAP_EVENT(armv8_brcm_vulcan, armv8_vulcan_map_event)
 
 static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "arm,armv8-pmuv3",	.data = armv8_pmuv3_pmu_init},
+	{.compatible = "arm,c1-nano-pmu",	.data = armv8_c1_nano_pmu_init},
+	{.compatible = "arm,c1-premium-pmu",	.data = armv8_c1_premium_pmu_init},
+	{.compatible = "arm,c1-pro-pmu",	.data = armv8_c1_pro_pmu_init},
+	{.compatible = "arm,c1-ultra-pmu",	.data = armv8_c1_ultra_pmu_init},
 	{.compatible = "arm,cortex-a34-pmu",	.data = armv8_cortex_a34_pmu_init},
 	{.compatible = "arm,cortex-a35-pmu",	.data = armv8_cortex_a35_pmu_init},
 	{.compatible = "arm,cortex-a53-pmu",	.data = armv8_cortex_a53_pmu_init},
@@ -1520,11 +1531,14 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "arm,cortex-a76-pmu",	.data = armv8_cortex_a76_pmu_init},
 	{.compatible = "arm,cortex-a77-pmu",	.data = armv8_cortex_a77_pmu_init},
 	{.compatible = "arm,cortex-a78-pmu",	.data = armv8_cortex_a78_pmu_init},
+	{.compatible = "arm,cortex-a320-pmu",	.data = armv9_cortex_a320_pmu_init},
 	{.compatible = "arm,cortex-a510-pmu",	.data = armv9_cortex_a510_pmu_init},
 	{.compatible = "arm,cortex-a520-pmu",	.data = armv9_cortex_a520_pmu_init},
+	{.compatible = "arm,cortex-a520ae-pmu",	.data = armv9_cortex_a520ae_pmu_init},
 	{.compatible = "arm,cortex-a710-pmu",	.data = armv9_cortex_a710_pmu_init},
 	{.compatible = "arm,cortex-a715-pmu",	.data = armv9_cortex_a715_pmu_init},
 	{.compatible = "arm,cortex-a720-pmu",	.data = armv9_cortex_a720_pmu_init},
+	{.compatible = "arm,cortex-a720ae-pmu",	.data = armv9_cortex_a720ae_pmu_init},
 	{.compatible = "arm,cortex-a725-pmu",	.data = armv9_cortex_a725_pmu_init},
 	{.compatible = "arm,cortex-x1-pmu",	.data = armv8_cortex_x1_pmu_init},
 	{.compatible = "arm,cortex-x2-pmu",	.data = armv9_cortex_x2_pmu_init},
-- 
2.51.0


