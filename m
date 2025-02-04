Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6643DC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4R+14MvP6+jfAZ/2SDPJZGHYgAQ9ZFZffV6N7sMB9Y=; b=ODpwwEqFTUPcUs5MeaL2ND1yo4
	JAJwXy2JLVn+sgLuHng/6C1Hl4s3Pw0fId7wbMtbvTiC+o0UPvm1wVFn8CsJhgEuJiYJUz3tXkuvy
	DBiFUrTT0W20BWxXK/EoPGv9ZOkA9/gu+caS9xFsRtnsueA4cpOEy/lXIiM5HY/hPZS5+ktrZ8zL0
	pPVcxRN6lZVdyXaUpQmfhjTdig+G00E5I1u09eJWKFw72amfGpcoqQ5BXIJtNCDToSCnJwWqu+1ci
	3BJYaBcBQrpi9etxIJjmpxOP7CnjnpzLazcDCpoOW9jqJ2fmmjZ6gAO4I4dxVXukoQjdTgaKbRnjy
	RQFOgA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfPVQ-00000001W6v-21hg;
	Tue, 04 Feb 2025 20:26:48 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP2u-00000001RvE-0nCa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:57:21 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ce7a0ec1easo44432465ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 11:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738699039; x=1739303839; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4R+14MvP6+jfAZ/2SDPJZGHYgAQ9ZFZffV6N7sMB9Y=;
        b=0SSvujdJwEahcRFaGBkPURB4A/A7f8uA48RC5Grz+RrPo2H4/7ALAAP3zqPTX7qgz2
         Ix97t2Xy29N985+DKcJ+fQeIOvHpLWcQMvgqW/lhHF200GsXEbyyIgbc5PTtewy2fd5k
         U0m+fF9WpbHmf6FTWGyMm1zG0ClJ1N0yu/Z/QR9gNRVJQr9+mHsokvUwonGAN9OlZ4tV
         lIRkDEsBIh8DOBTbdUnzfsEmJR0fCWt86rlCST3biqy7gl4Ob6K+e585G5WvJRomNuGF
         pSHV5Wl9W+xDvo0zhMeD67slM/yNI+yRXu/GbT2lKIq7Z8ZRB04pz2SSs4yn09NPVLaU
         86VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738699039; x=1739303839;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4R+14MvP6+jfAZ/2SDPJZGHYgAQ9ZFZffV6N7sMB9Y=;
        b=pDEa918MG64phhNVU7ZZd2J6q9Y5S20SZXgPQJ2xLQMvllsrxzhfWmfv09LE2hdeZJ
         zCzbYZhJqKXQ2mAN/EzMP6HxmBK6069pqNs9L1zi0tIeJ3KPDNqg4RZiDEXDVI/B1Ihf
         x/9Vg/dbZ8/8T2LFqenbhT01jmyT6dC7eK2r9iXrBD01Yfct15Qo710+BbImMOjeR/DC
         LrEiuTRGhMj7r14kim5nr4Y45gnrkuI59L0Th6VyJ6izNvG6hfPKkU2vPy07qlzSOUE7
         d8gfApS6o2tWLcgBBJQRiKB62u/ZCXXZ7yzaivJ9qL9YpKq7gxJFbddfkjAjC5nAuaOr
         Uj2A==
X-Forwarded-Encrypted: i=1; AJvYcCUPQsjAc04Abk3eb3rOU4XAH2hou2Zllk2BggdWKYDAP8Abgwshi43nT/goGU2pAheRU3DrBvhMYTDfu13vW2Sb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw53H/x/Y+Kp8kJDNRuUZrS8MjDoXw3d2NLVejSjA07x8H606hA
	NwJXPi/YW175eWbekPqe6QFHOGvo7PrgiNdavF9cihLJjm5fkEaFYoXe+4ZtbZIvEidJjIk9Ppz
	hW9xaD2hYfgZrE7hDVvXS2g==
X-Google-Smtp-Source: AGHT+IFjKjYyuQlNa/ishtIcrEB5bPDdOoTVbdVO7D85Z9CPphU0w8y5cfrKi9gtvFrT4dURbTET8ohchq0pXDfx0g==
X-Received: from ilbdr11.prod.google.com ([2002:a05:6e02:3f0b:b0:3ce:7e27:ea5a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3f83:b0:3d0:4eaa:e480 with SMTP id e9e14a558f8ab-3d04f40166emr2549635ab.3.1738699039331;
 Tue, 04 Feb 2025 11:57:19 -0800 (PST)
Date: Tue,  4 Feb 2025 19:57:08 +0000
In-Reply-To: <20250204195708.1703531-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250204195708.1703531-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204195708.1703531-2-coltonlewis@google.com>
Subject: [PATCH 2/2] perf: arm_pmuv3: Uninvert dependency between {asm,perf}/arm_pmuv3.h
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_115720_238697_06D85596 
X-CRM114-Status: GOOD (  18.76  )
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

perf/arm_pmuv3.h includes asm/arm_pmuv3.h at the bottom of the
file. This counterintiutive decision was presumably made so
asm/arm_pmuv3.h would be included everywhere perf/arm_pmuv3.h was even
though the actual dependency relationship goes the other way because
asm/arm_pmuv3.h depends on the PMEVN_SWITCH macro that was presumably
put there to avoid duplicating it in the asm files for arm and arm64.

Extract the relevant macro to its own file to avoid this unusual
structure so it may be included in the asm headers without worrying
about ordering issues.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h   |  2 ++
 arch/arm64/include/asm/arm_pmuv3.h |  1 +
 include/linux/perf/arm_pmuv3.h     | 49 ++-------------------------
 include/linux/perf/pmevn_switch.h  | 54 ++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 47 deletions(-)
 create mode 100644 include/linux/perf/pmevn_switch.h

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 2ec0e5e83fc9..a39277b6a365 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -9,6 +9,8 @@
 #include <asm/cp15.h>
 #include <asm/cputype.h>
 
+#include <linux/perf/pmevn_switch.h>
+
 #define PMCCNTR			__ACCESS_CP15_64(0, c9)
 
 #define PMCR			__ACCESS_CP15(c9,  0, c12, 0)
diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 89fd6abb7da6..e22fb26b6169 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -10,6 +10,7 @@
 #include <asm/sysreg.h>
 
 #include <linux/perf_event.h>
+#include <linux/perf/pmevn_switch.h>
 
 #ifdef CONFIG_KVM
 void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a2..00623b69cdcc 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -6,6 +6,8 @@
 #ifndef __PERF_ARM_PMUV3_H
 #define __PERF_ARM_PMUV3_H
 
+#include <asm/arm_pmuv3.h>
+
 #define ARMV8_PMU_MAX_GENERAL_COUNTERS	31
 #define ARMV8_PMU_CYCLE_IDX		31
 #define ARMV8_PMU_INSTR_IDX		32 /* Not accessible from AArch32 */
@@ -268,51 +270,4 @@
 #define ARMV8_PMU_BUS_WIDTH	GENMASK(19, 16)
 #define ARMV8_PMU_THWIDTH	GENMASK(23, 20)
 
-/*
- * This code is really good
- */
-
-#define PMEVN_CASE(n, case_macro) \
-	case n: case_macro(n); break
-
-#define PMEVN_SWITCH(x, case_macro)				\
-	do {							\
-		switch (x) {					\
-		PMEVN_CASE(0,  case_macro);			\
-		PMEVN_CASE(1,  case_macro);			\
-		PMEVN_CASE(2,  case_macro);			\
-		PMEVN_CASE(3,  case_macro);			\
-		PMEVN_CASE(4,  case_macro);			\
-		PMEVN_CASE(5,  case_macro);			\
-		PMEVN_CASE(6,  case_macro);			\
-		PMEVN_CASE(7,  case_macro);			\
-		PMEVN_CASE(8,  case_macro);			\
-		PMEVN_CASE(9,  case_macro);			\
-		PMEVN_CASE(10, case_macro);			\
-		PMEVN_CASE(11, case_macro);			\
-		PMEVN_CASE(12, case_macro);			\
-		PMEVN_CASE(13, case_macro);			\
-		PMEVN_CASE(14, case_macro);			\
-		PMEVN_CASE(15, case_macro);			\
-		PMEVN_CASE(16, case_macro);			\
-		PMEVN_CASE(17, case_macro);			\
-		PMEVN_CASE(18, case_macro);			\
-		PMEVN_CASE(19, case_macro);			\
-		PMEVN_CASE(20, case_macro);			\
-		PMEVN_CASE(21, case_macro);			\
-		PMEVN_CASE(22, case_macro);			\
-		PMEVN_CASE(23, case_macro);			\
-		PMEVN_CASE(24, case_macro);			\
-		PMEVN_CASE(25, case_macro);			\
-		PMEVN_CASE(26, case_macro);			\
-		PMEVN_CASE(27, case_macro);			\
-		PMEVN_CASE(28, case_macro);			\
-		PMEVN_CASE(29, case_macro);			\
-		PMEVN_CASE(30, case_macro);			\
-		default: WARN(1, "Invalid PMEV* index\n");	\
-		}						\
-	} while (0)
-
-#include <asm/arm_pmuv3.h>
-
 #endif
diff --git a/include/linux/perf/pmevn_switch.h b/include/linux/perf/pmevn_switch.h
new file mode 100644
index 000000000000..1f211468d8bf
--- /dev/null
+++ b/include/linux/perf/pmevn_switch.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __PMEVN_SWITCH_H
+#define __PMEVN_SWITCH_H
+
+#include <asm-generic/bug.h>
+
+/*
+ * This code is really good
+ */
+
+#define PMEVN_CASE(n, case_macro) \
+	case n: case_macro(n); break
+
+#define PMEVN_SWITCH(x, case_macro)				\
+	do {							\
+		switch (x) {					\
+		PMEVN_CASE(0,  case_macro);			\
+		PMEVN_CASE(1,  case_macro);			\
+		PMEVN_CASE(2,  case_macro);			\
+		PMEVN_CASE(3,  case_macro);			\
+		PMEVN_CASE(4,  case_macro);			\
+		PMEVN_CASE(5,  case_macro);			\
+		PMEVN_CASE(6,  case_macro);			\
+		PMEVN_CASE(7,  case_macro);			\
+		PMEVN_CASE(8,  case_macro);			\
+		PMEVN_CASE(9,  case_macro);			\
+		PMEVN_CASE(10, case_macro);			\
+		PMEVN_CASE(11, case_macro);			\
+		PMEVN_CASE(12, case_macro);			\
+		PMEVN_CASE(13, case_macro);			\
+		PMEVN_CASE(14, case_macro);			\
+		PMEVN_CASE(15, case_macro);			\
+		PMEVN_CASE(16, case_macro);			\
+		PMEVN_CASE(17, case_macro);			\
+		PMEVN_CASE(18, case_macro);			\
+		PMEVN_CASE(19, case_macro);			\
+		PMEVN_CASE(20, case_macro);			\
+		PMEVN_CASE(21, case_macro);			\
+		PMEVN_CASE(22, case_macro);			\
+		PMEVN_CASE(23, case_macro);			\
+		PMEVN_CASE(24, case_macro);			\
+		PMEVN_CASE(25, case_macro);			\
+		PMEVN_CASE(26, case_macro);			\
+		PMEVN_CASE(27, case_macro);			\
+		PMEVN_CASE(28, case_macro);			\
+		PMEVN_CASE(29, case_macro);			\
+		PMEVN_CASE(30, case_macro);			\
+		default: WARN(1, "Invalid PMEV* index\n");	\
+		}						\
+	} while (0)
+
+
+#endif
-- 
2.48.1.362.g079036d154-goog


