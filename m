Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115C1CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=REuqv+qq8fq5f7/3CDxtH9QtSa7mEgI+gyNX+1T3kBQ=; b=e9Py4K3Tswl6lxLXr836/MGAfy
	IlKNda7E35iH7eQ5K02Bgh++1+iIl5gy70Tdo0uIM4AVm5Ie6XB92NCxICRDMY40U5P5YVfIf5wHl
	Z6iglws6PckbGnUYH0s0fu3wick3GnVsqClvrQRwOOGxwZrIoy+gdC6nif9+dz7Cl8Zddhd85R9f9
	CPbg67Bg7In7P48RxN9OEmQt4nN4HAMjah/D9EyRZjMEZwSn81uQ2HTxJjcXDyJTlccFYQzubvTky
	qq4teWT9Ndoa5VBtmM/27Hqu1h3EcpsB8GlP9f0cNv01hCcH2iGWHGpSiKV9/aJQYwd5c8D3HjMWl
	jFVUQcLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLMS-0000000AD6W-284G;
	Fri, 22 May 2026 08:36:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLMP-0000000AD5Q-3dyN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 08:36:03 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wQLML-0004Pf-Rb; Fri, 22 May 2026 10:35:57 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] ARM: meson: keep reset control around
Date: Fri, 22 May 2026 10:35:48 +0200
Message-ID: <20260522083548.2360352-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_013601_926455_0CED022F 
X-CRM114-Status: GOOD (  13.88  )
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

Do not put the reset control, retain exclusive control over it,
since After turning on a CPU, the corresponding reset line must
stay deasserted.

This also avoids calling reset_control_put() before workqueues
are operational.

Fixes: 78ebbff6d1a0 ("reset: handle removing supplier before consumers")
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
This should fix the same issue as the one reported at [1] and fixed by
[2] for rockchip.

[1] https://lore.kernel.org/all/20260417154809.1984386-1-steven.price@arm.com/
[2] https://lore.kernel.org/all/20260521210915.2331176-1-heiko@sntech.de/
---
 arch/arm/mach-meson/platsmp.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-meson/platsmp.c b/arch/arm/mach-meson/platsmp.c
index 32ac60b89fdc..5f18895104ed 100644
--- a/arch/arm/mach-meson/platsmp.c
+++ b/arch/arm/mach-meson/platsmp.c
@@ -34,6 +34,7 @@
 static void __iomem *sram_base;
 static void __iomem *scu_base;
 static struct regmap *pmu;
+static struct reset_control *cpu_rstc[4];
 
 static struct reset_control *meson_smp_get_core_reset(int cpu)
 {
@@ -62,6 +63,7 @@ static void __init meson_smp_prepare_cpus(const char *scu_compatible,
 					  const char *sram_compatible)
 {
 	static struct device_node *node;
+	int cpu;
 
 	/* SMP SRAM */
 	node = of_find_compatible_node(NULL, NULL, sram_compatible);
@@ -99,6 +101,9 @@ static void __init meson_smp_prepare_cpus(const char *scu_compatible,
 	}
 
 	scu_enable(scu_base);
+
+	for (cpu = 0; cpu < ARRAY_SIZE(cpu_rstc); cpu++)
+		cpu_rstc[cpu] = meson_smp_get_core_reset(cpu);
 }
 
 static void __init meson8b_smp_prepare_cpus(unsigned int max_cpus)
@@ -155,10 +160,9 @@ static int meson_smp_finalize_secondary_boot(unsigned int cpu)
 static int meson8_smp_boot_secondary(unsigned int cpu,
 				     struct task_struct *idle)
 {
-	struct reset_control *rstc;
+	struct reset_control *rstc = cpu_rstc[cpu];
 	int ret;
 
-	rstc = meson_smp_get_core_reset(cpu);
 	if (IS_ERR(rstc)) {
 		pr_err("Couldn't get the reset controller for CPU%d\n", cpu);
 		return PTR_ERR(rstc);
@@ -203,19 +207,16 @@ static int meson8_smp_boot_secondary(unsigned int cpu,
 		goto out;
 
 out:
-	reset_control_put(rstc);
-
 	return 0;
 }
 
 static int meson8b_smp_boot_secondary(unsigned int cpu,
 				     struct task_struct *idle)
 {
-	struct reset_control *rstc;
+	struct reset_control *rstc = cpu_rstc[cpu];
 	int ret;
 	u32 val;
 
-	rstc = meson_smp_get_core_reset(cpu);
 	if (IS_ERR(rstc)) {
 		pr_err("Couldn't get the reset controller for CPU%d\n", cpu);
 		return PTR_ERR(rstc);
@@ -286,8 +287,6 @@ static int meson8b_smp_boot_secondary(unsigned int cpu,
 		goto out;
 
 out:
-	reset_control_put(rstc);
-
 	return 0;
 }
 
-- 
2.47.3


