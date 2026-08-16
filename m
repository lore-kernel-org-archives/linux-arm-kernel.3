Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AECC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m31MQUkSQS2jVChso5vZVbxBylBeL+g3s9FxURuBxhg=; b=KStKgwPrFA0tCVMLArhkANpjLA
	XDYaNrpER2Ide7tciCi6uW9/+xH1eD3k6K4ltjrwVHRsxxVCPh8cbJGwmH0P4dNOnO1iFIif29yvp
	Qb43kd3VmcnX3EHFOZvcyu7K+ZWGKT5F7qjl3g5gaDt9mZm8SWBe6wcqWSLgfY1IeDtJKmhEzCs2f
	NDfSZ/mVzfEydN/UR4Mm8N2IH983Dhs3oNqvlZj0ThQ3H4463pcEXFRbLYH22ozgme0wsVSlcbmZr
	hPFLTC6w6jU2KqIKGluweEn/Wg2EpFmXEEUIBPjcDY3F20FchRoaPyUc61yEj1wYebBKH2likcJq4
	e3q9jA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvblC-00000004pPF-1DJB;
	Sun, 16 Aug 2026 14:22:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbl9-00000004pOd-24C3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 14:22:48 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso32797955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786890166; x=1787494966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m31MQUkSQS2jVChso5vZVbxBylBeL+g3s9FxURuBxhg=;
        b=qkugnfzDx1xfXd4QOtYltqNyd/A/UOVOLT4y9NwF4sQc371V5EnYtZMXCs85jcf1yu
         82zOSQXsWJss3CLYH/BR+jUNQXlVI9z/PF305vQC929cOfQUHkUEGeSCon12cnHTE9e7
         C1xg/eph/tn1WMcRmTKp65T5YTH0r38bhu0YTnjBTfJF/3wjotVJJ3xJLNINYahMapRh
         iKVC2Fx0rb6C5zesWkPRV9OeoOzD/qqqwe02Rnm5erThle5BxDWyOHQWeG6VkPQjieJg
         MHh2xd0J22nJ1xEOtHmJwnsAVX6BGW2nYh3H9OBCHbdGEnG0I98CygOOobEkjFe/5BlX
         g7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786890166; x=1787494966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m31MQUkSQS2jVChso5vZVbxBylBeL+g3s9FxURuBxhg=;
        b=QrT9u9f/BDrrcuCznDYANPHMtQkrn75sFeaibpZAnCNh0SFi5kUc9LgdQtZTJ6KPIk
         m4MhUt/HfuQCKCkXpvBlQqMr/5/DPWC2M0lyEUhG4vcFbqm90bDJfO/egXAgAMEvAylI
         B4+bN8AOsrsrKWRoKzj0ba0uyOHHv+cp4MaqX57W19CQk+VdvEZ2YEpUq+xNi2xBy3qt
         sfQ9QDP3XuiN8tLOWKoYZC+ATDFmlk6pEOwxHLxx4HPkc0BQkq3RtotBsDg1UjebncLk
         b3g1TrDwlQjg54neOqA4gLXBd+y38uJUio4kNXJUy1dB4M/7S0kYiU14T6yi2Lj/qXK1
         jpxw==
X-Forwarded-Encrypted: i=1; AHgh+RqMR0DrKlV8s2mxOm0qY5IU17f+kAkvVzTqeXYg40FIYFzbKK3Ns/tN8bULkbZOZLQg/BGyG4NzYtFdtpWsbNWc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3RIll34UJXfyC/2Fx3+ggYz+WavS15BVbbpUgcoFcLcu9YKjA
	TR0pgXPGbdEyAEZx6ZUQZvIOvpPcORYeoVPiKhoDrnF1wMJBU3JF1Llw
X-Gm-Gg: AR+sD12MtVrvO0efUHf07eNneHv1V8xPF8CgYdaDNnmnJvtIAeoUbJkKRXDiUg/H6uL
	FpGLaZQIdPsw9dDkiBGDIKNb+9m8Th+xeSS++Y03EplOzXuGNPhQm7JbtKpkPRCxOi1MpAnc3jM
	p+F3+eoeXsCAKAzWHX8PoP8xVwS++IgvE5XKxO7OFjuVKGbF02bRkKE11Xs4okuchtaKtejuT/h
	tL1WXzj4QvRXbdLmUO5v9+CLokJUb5bXfPWgG7lwazMIrS6f49SPqi9nEXMXdUdUrokyNW84aKr
	wFRb9Ifgq+iip2w+llcXHW/Q+yTdeckJPlbzeACdHCXvepr/kmGLT3t2+tqtzuKtSCMgXNZyoWC
	B6HWANur4J5cNf65/y/Ha+3sehMmoxPwaIMIkh//Tn7g7arfQeY/wtWTynVCqoQYN45e2algCaU
	be29EFLEBp+I9DYPkYBFzIC9jfPcwKJUrDwNAFOpLQXD4/BB8H7r3cbbu6QN3fc+QCZR+eREAdK
	SV0PGQ=
X-Received: by 2002:a17:902:e80b:b0:2c9:fb11:1bf4 with SMTP id d9443c01a7336-2d3b08825e1mr196775075ad.7.1786890166204;
        Sun, 16 Aug 2026 07:22:46 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc8199sm26102365ad.74.2026.08.16.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 07:22:44 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: will@kernel.org,
	mark.rutland@arm.com,
	sj@kernel.org,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	kunwu.chan@linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Lian Wang <lianux.mm@gmail.com>
Subject: [RFC PATCH 1/4] mm/damon/perf: introduce AUX backend interface and Kconfig
Date: Sun, 16 Aug 2026 22:22:18 +0800
Message-ID: <20260816142222.689624-2-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816142222.689624-1-kunwu.chan@linux.dev>
References: <20260816142222.689624-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_072247_566961_CF86F061 
X-CRM114-Status: GOOD (  19.46  )
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

From: Kunwu Chan <kunwu.chan@gmail.com>

Add the backend operations used by AUX trace-buffer PMUs, backend state
to damon_perf_event, and stubs for configurations without AUX support.

Add CONFIG_DAMON_PERF_AUX for the ARM SPE transport and a separate
CONFIG_DAMON_PERF_SPE_KUNIT_TEST option.  The current transport requires
ARM SPE to be built into the kernel; it remains independent of the
optional observability counters and tracepoints.

Co-developed-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/damon.h       |  5 +++
 mm/damon/Kconfig            | 28 +++++++++++++++
 mm/damon/perf/aux_backend.h | 72 +++++++++++++++++++++++++++++++++++++
 3 files changed, 105 insertions(+)
 create mode 100644 mm/damon/perf/aux_backend.h

diff --git a/include/linux/damon.h b/include/linux/damon.h
index c191c065b0e4..a27c5f6c459b 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -8,6 +8,7 @@
 #ifndef _DAMON_H_
 #define _DAMON_H_
 
+#include <linux/cpumask.h>
 #include <linux/math64.h>
 #include <linux/memcontrol.h>
 #include <linux/mutex.h>
@@ -127,6 +128,7 @@ struct damon_target {
 enum damon_report_source {
 	DAMON_REPORT_SRC_PERF_OVERFLOW = 0,  /* overflow_handler (IBS, PEBS) */
 	DAMON_REPORT_SRC_PAGE_FAULT,         /* damon_report_page_fault() */
+	DAMON_REPORT_SRC_PERF_AUX,           /* AUX trace-buffer backend */
 };
 
 /**
@@ -538,6 +540,7 @@ struct damos_filter {
 struct damon_ctx;
 struct damon_target_lookup;
 struct damos;
+struct damon_perf_backend_ops;
 
 /**
  * struct damos_walk_control - Control damos_walk().
@@ -1056,6 +1059,8 @@ struct damon_perf_event_attr {
 struct damon_perf_event {
 	struct damon_perf_event_attr attr;
 	void *priv;
+	const struct damon_perf_backend_ops *ops;
+	cpumask_t aux_cpumask;
 	struct list_head list;
 	struct hlist_node hlist_node;
 	bool init_complete;
diff --git a/mm/damon/Kconfig b/mm/damon/Kconfig
index 9fac286df124..e9fb62ec186f 100644
--- a/mm/damon/Kconfig
+++ b/mm/damon/Kconfig
@@ -149,4 +149,32 @@ config DAMON_PERF_OBSERVE
 
 	  If unsure, say N.
 
+
+config DAMON_PERF_AUX
+	bool "DAMON AUX trace-buffer backend support"
+	depends on DAMON
+	depends on PERF_EVENTS
+	depends on ARM_SPE_PMU=y
+	default n
+	help
+	  Enable the functional AUX trace-buffer transport for DAMON perf
+	  events.  This provides backend selection and drain scheduling for
+	  ARM SPE, which does not deliver samples through an overflow
+	  callback.  ARM SPE must be built into the kernel.
+
+	  This transport is independent of CONFIG_DAMON_PERF_OBSERVE.
+
+	  If unsure, say N.
+
+config DAMON_PERF_SPE_KUNIT_TEST
+	bool "Test the DAMON perf SPE parser" if !KUNIT_ALL_TESTS
+	depends on DAMON_PERF_AUX && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  Test the ARM SPE parser with byte-exact packet streams.  The cases
+	  cover valid records, truncation, alignment, error resynchronization
+	  and consumed-length accounting.  Results can be exposed through
+	  debugfs when CONFIG_KUNIT_DEBUGFS is enabled.
+
+	  If unsure, say N.
 endmenu
diff --git a/mm/damon/perf/aux_backend.h b/mm/damon/perf/aux_backend.h
new file mode 100644
index 000000000000..70e6ac6771bc
--- /dev/null
+++ b/mm/damon/perf/aux_backend.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _DAMON_PERF_AUX_BACKEND_H
+#define _DAMON_PERF_AUX_BACKEND_H
+
+#include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/perf_event.h>
+#include <linux/types.h>
+
+struct damon_ctx;
+struct damon_perf_event;
+
+/**
+ * struct damon_perf_backend_ops - PMU-specific AUX backend operations
+ * @name: Human-readable backend name.
+ * @flags: Bitmask of DAMON_PERF_BACKEND_* flags.
+ * @match_pmu: Return true when this backend claims @perf_event.
+ * @init: Allocate per-event, per-CPU resources.
+ * @cleanup: Release resources initialized for one CPU.
+ * @arm: Prepare the AUX producer before perf_event_enable().
+ * @disarm: Quiesce backend state after perf_event_disable().
+ * @drain: Parse pending AUX data into DAMON access reports.
+ *
+ * All callbacks run in process context.  The caller serializes resource
+ * lifetime against CPU hotplug and invokes @drain only for CPUs recorded
+ * in damon_perf_event::aux_cpumask.
+ */
+struct damon_perf_backend_ops {
+	const char *name;
+	u32 flags;
+	bool (*match_pmu)(struct perf_event *perf_event);
+	int (*init)(struct damon_perf_event *event, int cpu,
+		    struct perf_event *perf_event);
+	void (*cleanup)(struct damon_perf_event *event, int cpu);
+	int (*arm)(struct damon_perf_event *event, int cpu);
+	void (*disarm)(struct damon_perf_event *event, int cpu);
+	unsigned int (*drain)(struct damon_perf_event *event, int cpu);
+};
+
+#define DAMON_PERF_BACKEND_AUX	BIT(0)
+
+#ifdef CONFIG_DAMON_PERF_AUX
+void damon_perf_aux_drain(struct damon_ctx *ctx);
+int damon_perf_aux_register_backend(const struct damon_perf_backend_ops *ops);
+const struct damon_perf_backend_ops *
+damon_perf_aux_find_backend(struct perf_event *perf_event);
+void damon_perf_aux_select(struct damon_perf_event *event,
+			   struct perf_event *perf_event);
+#else
+static inline void damon_perf_aux_drain(struct damon_ctx *ctx)
+{
+}
+
+static inline int
+damon_perf_aux_register_backend(const struct damon_perf_backend_ops *ops)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline const struct damon_perf_backend_ops *
+damon_perf_aux_find_backend(struct perf_event *perf_event)
+{
+	return NULL;
+}
+
+static inline void damon_perf_aux_select(struct damon_perf_event *event,
+					 struct perf_event *perf_event)
+{
+}
+#endif
+
+#endif /* _DAMON_PERF_AUX_BACKEND_H */
-- 
2.43.0


