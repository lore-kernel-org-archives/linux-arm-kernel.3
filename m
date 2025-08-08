Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0819BC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvmMQppGzlyK1V459PeF8q1FGyH1g7f7ZgjlVByhCvs=; b=4TO9XoMkzvwwaIIKhnRmWGMe6k
	5vYm7tSqpNpYJlHjLSSJV7nPwPuumGhdV8Jrm7LSWHOoT6x9Nh/WDd6CBXsSh40waNr4VqpLQ0W3l
	w20jhfNiG5RM28clK9jXQ5S7ovy6NlZ6gvdUYt1aV3phPaxhB1SWcEwoJg5ilgcIkk4qIOsC9s10x
	j+VaeGzTPF9qS1WKQS+2PgbsxzQEOBCeC3iRkrNL7+Tq7pHQgMfEEkd2CD+N0aVJ00NbawUv//UcA
	De9tiFvdAxch2Y9B9FxzPlqaq/4eE2y3u/JBTImZGBZ+MCaEpGdrEWsYy89Pwa8y1vr/Dye7yqywO
	k+gPnHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPOT-00000003EQK-0vyI;
	Fri, 08 Aug 2025 15:52:33 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPCC-00000003Cb6-1JBy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 15:39:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso1750218a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 08:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754667591; x=1755272391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvmMQppGzlyK1V459PeF8q1FGyH1g7f7ZgjlVByhCvs=;
        b=LWUv5xZljj96Tnq/cjYOW3oN2hEDmU/dvsglM1+tvY41aOLH+duOG8IWugic1sVmpP
         yfuMT5IZtLdnMmE1/l2qJUEYfl6QoGTtv5WmriqCEz38jqZRBi9mE+nlx7ex2psQm+Oh
         GcUFmKB126V9f3dVsLr4cq9RWTocgCmTI48sgEqErAoXMrQHTpu/JKi+o+PKIaSZ89dE
         8PcEbG2L2AntBqGTk4wwR0UpdzWm+0DQ+LeLcUHS/gYYW/B62l8dAt09UXXlD8usG5Ma
         ZiDre3yrb0NIo8Sr8hNg3RJiqU9AUDjZ6YO4L4C/Arq9OI0XtSIw3oXQXIJz8V2nW63w
         xATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754667591; x=1755272391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvmMQppGzlyK1V459PeF8q1FGyH1g7f7ZgjlVByhCvs=;
        b=cuBAtunhaX9oZPY/dwfWJlEIA1kEmVRsD0e0o0lRj0UiCya5+ELn3QcS6EfIa1r7V0
         eFWOlZNmEvdBx5aoeJyr86VXMW/ubgFCxJxtftWuhyYNl2YouaAE3Jy6t6xXS5adx0zr
         Pz/SYYKOGPFc8NyF2zzrm8uX7MP/saZSGHQsyJZ2979rvuVDYM4mYILMOx/EX43hhgMP
         Hl/+/UZe3fgkTzSgiby4rS4S4CQ3wnXImfQKLABVrah2CbJg853CNI770fjoqU/FebF1
         dOdqy/wCnAI1p/SKAh5c6JmwZyYEuMb4Lns7xz2Kf+wdz8F3baQNuUk9YDoPDOCznTTh
         rIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE1D9wtvtQQ4g/P6pJ/AwOrIQ/LDxv39lFzdXPXExDJ3gabF10AKJp6D7wU+N+LRsowYLg0k090ABIEHLtAxSm@lists.infradead.org
X-Gm-Message-State: AOJu0YwNzvh8N6pE4MlyiUja2VhuPdXB7ErVaPR25rks+hTeMysei9hx
	0v3Jaq7hpPqTG/dIRPBxFRAEknHs6QfKH7+Hi/n4O+3cBJ7HXFFJz8CO/cRjNvC0oOQ=
X-Gm-Gg: ASbGncsiRu5GJxxLb8oOg6k/C+kCAJCzltEex6LJh4B8XPyh0gomXiqhYcGoKnVLANU
	g8xgcY3c7jCkhWqOtAo/DWhS0wDje+nwPlZtGzBOSLr8sm1Z1IbZkH/lg4kic3bFRZ7aSYbTCBl
	7DUlbOSfLtvFshjH1C/9D1+DrqyWJB89/+3Zmwn98IuFlM1qlzNKMLbwa2RtWqcY6ptLOkZZSnP
	Wxp9/WC6JtMR9PBKSUKS9sIrlQlZFtRrgYxnV9CRmnh8kdffzrlKmh+D+/5wWXbLzpVpLdMD/yo
	Zu37See3t4+DLMCKrpQtiOywxcQ67jNWfXQ0dubZJk2snL/AGiXEI8iuzNhLL5+LYNcuCR4G9xL
	bz8Q=
X-Google-Smtp-Source: AGHT+IGGV7QKPYmSz7Mf7+cp35kxVzbsnvhdLApwmQzEaWp5jQeO3Ij9R7B98ce2bxwO0Y+lnCT38g==
X-Received: by 2002:a17:902:d592:b0:235:779:ede5 with SMTP id d9443c01a7336-242c2250093mr48550665ad.40.1754667591429;
        Fri, 08 Aug 2025 08:39:51 -0700 (PDT)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3218c3c2d58sm1135971a91.16.2025.08.08.08.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 08:39:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v6 4/5] perf: RISC-V: add support for SSE event
Date: Fri,  8 Aug 2025 15:38:55 +0000
Message-ID: <20250808153901.2477005-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808153901.2477005-1-cleger@rivosinc.com>
References: <20250808153901.2477005-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_083952_352839_5D994833 
X-CRM114-Status: GOOD (  22.74  )
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

In order to use SSE within PMU drivers, register a SSE handler for the
local PMU event. Reuse the existing overflow IRQ handler and pass
appropriate pt_regs. Add a config option RISCV_PMU_SSE to select event
delivery via SSE events.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 drivers/perf/Kconfig           | 10 +++++
 drivers/perf/riscv_pmu.c       | 19 +++++++++
 drivers/perf/riscv_pmu_sbi.c   | 71 +++++++++++++++++++++++++++++-----
 include/linux/perf/riscv_pmu.h |  3 ++
 4 files changed, 93 insertions(+), 10 deletions(-)

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index a9188dec36fe..8cf0befaf2c0 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -105,6 +105,16 @@ config RISCV_PMU_SBI
 	  full perf feature support i.e. counter overflow, privilege mode
 	  filtering, counter configuration.
 
+config RISCV_PMU_SSE
+	depends on RISCV_PMU && RISCV_SSE
+	bool "RISC-V PMU SSE events"
+	default n
+	help
+	  Say y if you want to use SSE events to deliver PMU interrupts. This
+	  provides a way to profile the kernel at any level by using NMI-like
+	  SSE events. SSE events being really intrusive, this option allows
+	  to select it only if needed.
+
 config STARFIVE_STARLINK_PMU
 	depends on ARCH_STARFIVE || COMPILE_TEST
 	depends on 64BIT
diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 7644147d50b4..1eb28381b80f 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -13,6 +13,7 @@
 #include <linux/irqdesc.h>
 #include <linux/perf/riscv_pmu.h>
 #include <linux/printk.h>
+#include <linux/riscv_sse.h>
 #include <linux/smp.h>
 #include <linux/sched_clock.h>
 
@@ -254,6 +255,22 @@ void riscv_pmu_start(struct perf_event *event, int flags)
 	perf_event_update_userpage(event);
 }
 
+static void riscv_pmu_disable(struct pmu *pmu)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(pmu);
+
+	if (rvpmu->sse_evt)
+		sse_event_disable_local(rvpmu->sse_evt);
+}
+
+static void riscv_pmu_enable(struct pmu *pmu)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(pmu);
+
+	if (rvpmu->sse_evt)
+		sse_event_enable_local(rvpmu->sse_evt);
+}
+
 static int riscv_pmu_add(struct perf_event *event, int flags)
 {
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
@@ -411,6 +428,8 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 		.event_mapped	= riscv_pmu_event_mapped,
 		.event_unmapped	= riscv_pmu_event_unmapped,
 		.event_idx	= riscv_pmu_event_idx,
+		.pmu_enable	= riscv_pmu_enable,
+		.pmu_disable	= riscv_pmu_disable,
 		.add		= riscv_pmu_add,
 		.del		= riscv_pmu_del,
 		.start		= riscv_pmu_start,
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..8c1ac7985df6 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -17,6 +17,7 @@
 #include <linux/irqdomain.h>
 #include <linux/of_irq.h>
 #include <linux/of.h>
+#include <linux/riscv_sse.h>
 #include <linux/cpu_pm.h>
 #include <linux/sched/clock.h>
 #include <linux/soc/andes/irq.h>
@@ -948,10 +949,10 @@ static void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 		pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
 }
 
-static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
+static irqreturn_t pmu_sbi_ovf_handler(struct cpu_hw_events *cpu_hw_evt,
+				       struct pt_regs *regs, bool from_sse)
 {
 	struct perf_sample_data data;
-	struct pt_regs *regs;
 	struct hw_perf_event *hw_evt;
 	union sbi_pmu_ctr_info *info;
 	int lidx, hidx, fidx;
@@ -959,7 +960,6 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	struct perf_event *event;
 	u64 overflow;
 	u64 overflowed_ctrs = 0;
-	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
 	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 
@@ -969,13 +969,15 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	/* Firmware counter don't support overflow yet */
 	fidx = find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
 	if (fidx == RISCV_MAX_COUNTERS) {
-		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
+		if (!from_sse)
+			csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
 		return IRQ_NONE;
 	}
 
 	event = cpu_hw_evt->events[fidx];
 	if (!event) {
-		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
+		if (!from_sse)
+			ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
 		return IRQ_NONE;
 	}
 
@@ -990,16 +992,16 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 
 	/*
 	 * Overflow interrupt pending bit should only be cleared after stopping
-	 * all the counters to avoid any race condition.
+	 * all the counters to avoid any race condition. When using SSE,
+	 * interrupt is cleared when stopping counters.
 	 */
-	ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
+	if (!from_sse)
+		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
 
 	/* No overflow bit is set */
 	if (!overflow)
 		return IRQ_NONE;
 
-	regs = get_irq_regs();
-
 	for_each_set_bit(lidx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
 		struct perf_event *event = cpu_hw_evt->events[lidx];
 
@@ -1055,6 +1057,51 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t pmu_sbi_ovf_irq_handler(int irq, void *dev)
+{
+	return pmu_sbi_ovf_handler(dev, get_irq_regs(), false);
+}
+
+#ifdef CONFIG_RISCV_PMU_SSE
+static int pmu_sbi_ovf_sse_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	struct cpu_hw_events __percpu *hw_events = arg;
+	struct cpu_hw_events *hw_event = raw_cpu_ptr(hw_events);
+
+	pmu_sbi_ovf_handler(hw_event, regs, true);
+
+	return 0;
+}
+
+static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
+{
+	int ret;
+	struct sse_event *evt;
+	struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
+
+	evt = sse_event_register(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, 0,
+				 pmu_sbi_ovf_sse_handler, hw_events);
+	if (IS_ERR(evt))
+		return PTR_ERR(evt);
+
+	ret = sse_event_enable(evt);
+	if (ret) {
+		sse_event_unregister(evt);
+		return ret;
+	}
+
+	pr_info("using SSE for PMU event delivery\n");
+	pmu->sse_evt = evt;
+
+	return ret;
+}
+#else
+static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
@@ -1105,6 +1152,10 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 	struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
 	struct irq_domain *domain = NULL;
 
+	ret = pmu_sbi_setup_sse(pmu);
+	if (!ret)
+		return 0;
+
 	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
 		riscv_pmu_irq_num = RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
@@ -1139,7 +1190,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		return -ENODEV;
 	}
 
-	ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, "riscv-pmu", hw_events);
+	ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_irq_handler, "riscv-pmu", hw_events);
 	if (ret) {
 		pr_err("registering percpu irq failed [%d]\n", ret);
 		return ret;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 701974639ff2..d4a5c55fe077 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -28,6 +28,8 @@
 
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
+struct sse_event;
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;
@@ -54,6 +56,7 @@ struct riscv_pmu {
 	char		*name;
 
 	irqreturn_t	(*handle_irq)(int irq_num, void *dev);
+	struct sse_event *sse_evt;
 
 	unsigned long	cmask;
 	u64		(*ctr_read)(struct perf_event *event);
-- 
2.43.0


