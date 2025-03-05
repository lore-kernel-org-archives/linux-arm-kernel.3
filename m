Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B77C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJWKgtdFRNxzOHhRY6DvU4hYJ/heKdzFO0Dv1QPS8u8=; b=ZMXQEixvzqEL/blIed6YMfPx+1
	ag81/Jl8Rl8sQdrDbvrX9acvBbEUzOeOUCjVvWcxcDs7B2LBJOqt8PIHzjSiRcEhCAo+JLSAZN+2E
	ASy/wyh/EmJuE9UHDhxi6I3j78XgmyUSmKj/2hToefgz1MXSWjjv14Hh07pVgksH1uXX+stgFQ1KU
	brE+E/gBckl4bnXkZlFIQ6ALhhyD/srGjpUxKLHq7aDzinLeRe5JoXH0kPjfvvQtpMKE5SysVFJ9a
	BTLeVBag+UaOwZFz1rLCigfBki0hKIK5Ap2MbdZJi4/52bXkooDNdQCPn5v2X/w4j9D3l5QJ34y0g
	tPRGekSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxJD-00000009Uhy-3jt1;
	Wed, 05 Mar 2025 22:33:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpw5B-00000009JxP-0shR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E05D5C6C44;
	Wed,  5 Mar 2025 21:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA16C4CED1;
	Wed,  5 Mar 2025 21:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741209311;
	bh=hXy+f0YJTclPY8w3PrHkFFWq1Rkkl1rvAIEfZmgyuH4=;
	h=From:To:Cc:Subject:Date:From;
	b=T7oLNEYjR/pVjUr6bwIyK+7nN/Ljobb3GgYk0N4zrPxf5xykSps2YAdd11pmT/QVd
	 PM/0yn0ZZMvb8+mGhT7MYFjP+SB8a+NmbyE0g4ueNAEFFM96aC63EmovEgvylgKSmo
	 LoNVkA+6vECTNwPfwd+lA86VyeMinhuGv1bU9NBnEBnQYhdrwYyt1/1h6XeMkJ//0j
	 khxx6YxtiqnKqd3JEBRsJFOfGD/bsVtuQBpB3H34G4Xd83R/BmMD1LWkwXfoJWI+pn
	 aS2V01RU4eXlN3yfbes6bIIlSarFJ5R6w5cSMEzEmaLiA9F03jeRgH34AEV9spxdjF
	 TtQhGCOykRrEg==
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: samsung: include linux/array_size.h where needed
Date: Wed,  5 Mar 2025 22:14:02 +0100
Message-Id: <20250305211446.43772-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_131513_352914_EBDB6D4E 
X-CRM114-Status: GOOD (  10.76  )
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

From: Arnd Bergmann <arnd@arndb.de>

This does not necessarily get included through asm/io.h:

drivers/soc/samsung/exynos3250-pmu.c:120:18: error: use of undeclared identifier 'ARRAY_SIZE'
  120 |         for (i = 0; i < ARRAY_SIZE(exynos3250_list_feed); i++) {
      |                         ^
drivers/soc/samsung/exynos5250-pmu.c:162:18: error: use of undeclared identifier 'ARRAY_SIZE'
  162 |         for (i = 0; i < ARRAY_SIZE(exynos5_list_both_cnt_feed); i++) {
      |                         ^

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/samsung/exynos-asv.c     | 1 +
 drivers/soc/samsung/exynos-chipid.c  | 1 +
 drivers/soc/samsung/exynos-pmu.c     | 1 +
 drivers/soc/samsung/exynos-usi.c     | 1 +
 drivers/soc/samsung/exynos3250-pmu.c | 1 +
 drivers/soc/samsung/exynos5250-pmu.c | 1 +
 drivers/soc/samsung/exynos5420-pmu.c | 1 +
 7 files changed, 7 insertions(+)

diff --git a/drivers/soc/samsung/exynos-asv.c b/drivers/soc/samsung/exynos-asv.c
index 97006cc3b946..8e681f519526 100644
--- a/drivers/soc/samsung/exynos-asv.c
+++ b/drivers/soc/samsung/exynos-asv.c
@@ -9,6 +9,7 @@
  * Samsung Exynos SoC Adaptive Supply Voltage support
  */
 
+#include <linux/array_size.h>
 #include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/energy_model.h>
diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 3f1a654c7e66..deb1d882cd4c 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -12,6 +12,7 @@
  * Samsung Exynos SoC Adaptive Supply Voltage and Chip ID support
  */
 
+#include <linux/array_size.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/mfd/syscon.h>
diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index dd5256e5aae1..c40313886a01 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -5,6 +5,7 @@
 //
 // Exynos - CPU PMU(Power Management Unit) support
 
+#include <linux/array_size.h>
 #include <linux/arm-smccc.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 173b76720079..c5661ac19f7b 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -6,6 +6,7 @@
  * Samsung Exynos USI driver (Universal Serial Interface).
  */
 
+#include <linux/array_size.h>
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
diff --git a/drivers/soc/samsung/exynos3250-pmu.c b/drivers/soc/samsung/exynos3250-pmu.c
index 30f230ed1769..26c9c6e9f551 100644
--- a/drivers/soc/samsung/exynos3250-pmu.c
+++ b/drivers/soc/samsung/exynos3250-pmu.c
@@ -7,6 +7,7 @@
 
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/soc/samsung/exynos-pmu.h>
+#include <linux/array_size.h>
 
 #include "exynos-pmu.h"
 
diff --git a/drivers/soc/samsung/exynos5250-pmu.c b/drivers/soc/samsung/exynos5250-pmu.c
index 7a2d50be6b4a..ae693d8d508b 100644
--- a/drivers/soc/samsung/exynos5250-pmu.c
+++ b/drivers/soc/samsung/exynos5250-pmu.c
@@ -7,6 +7,7 @@
 
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/soc/samsung/exynos-pmu.h>
+#include <linux/array_size.h>
 
 #include "exynos-pmu.h"
 
diff --git a/drivers/soc/samsung/exynos5420-pmu.c b/drivers/soc/samsung/exynos5420-pmu.c
index 6fedcd78cb45..58a2209795f7 100644
--- a/drivers/soc/samsung/exynos5420-pmu.c
+++ b/drivers/soc/samsung/exynos5420-pmu.c
@@ -5,6 +5,7 @@
 //
 // Exynos5420 - CPU PMU (Power Management Unit) support
 
+#include <linux/array_size.h>
 #include <linux/pm.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/soc/samsung/exynos-pmu.h>
-- 
2.39.5


