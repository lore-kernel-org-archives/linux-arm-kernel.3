Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4B9E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pTgQSov7vYTWNucdQE0t9hyfOwyYPp0snQQ1hygLdA=; b=LGSFx7bRQrMIhvYAob7E/EboPu
	fKgOBt+T8lu2EkgHujfzxAF2vWJesDDYhv85648uvFeAjPIXvOQ3c/dqJYlkL4qdU8xzRmvyRavwy
	euP/qHE3Bza7M2gV9IOS4150lzPtKfcRJRa9eJ5DbwKSeP3kiAUK82Yi1i9t33FdxzWTmUzkDec2I
	NPUSzzyBMqA6bJDtJxOqWfkbBJeh0cIw+ROw/fWlCxAcar+ZTVD+d+9yvRxW5+TdJZwyN8l19Ou1Q
	otUwuSoVbh49jod+44PmwnOkkTAJxQogCpBank9yTkNOMSXHYG8iC4ODEnlXQ2w7T9VqquOSB0kpt
	Rm4l8Y5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbRS-00000002DpO-0zjd;
	Fri, 06 Dec 2024 16:44:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEZ-00000002AM6-2mHG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434a766b475so22249335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733502673; x=1734107473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pTgQSov7vYTWNucdQE0t9hyfOwyYPp0snQQ1hygLdA=;
        b=vPs+nmqP5EhBxPfOxdtt4W6CeUWNr/LKELP4Am8MDe1EAi4E08bI/6o+8M5F0JgK8g
         XTrJDVbuX++23Q3C2H66slqDF+wiEzaQlRjKXwchCGimsxE63uoErpB1/rcWps2Sx+Nk
         86mYPc1StFzIaKSRA4mBo7idztungb9FPn/96NpmqaouxEuecTImSev8/zQy/egz5YOj
         D+J2z8M1CyNqSyNLFXrYoBIsbaJLcRr3xaDz5G1YUGFZ6X1+8OBZVKt/zw2HcR6KiH5D
         nb+zwWrxxtBxYu0TjBFO4NrJux14hdZiAFDaIROgq6Ht0MFIUO1pX6JIxdoJlOD30B+3
         PK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502673; x=1734107473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pTgQSov7vYTWNucdQE0t9hyfOwyYPp0snQQ1hygLdA=;
        b=wQO3wNWt+LqmKqWxqPjTQkXfivyakf45PKbi+3yg6fSXCvVkw2dqiKkhX+6pGiolRr
         QVQzPOiblVWVJuken1Jeof6tqpPGEJxNAWPlTRdAUU5/MTqpvo++fClfQc/YA9WBzSHH
         yxHqNvMkGkEbdBGf4YjqepCUGt1wu9A/iJ/KDpLMuaXCqkZjjhENgq5pLBepIRV0qU3X
         2+9KjUE4GxBBz7C376GpKLV/Ld4EcD6VywpRu/z+wuRRQ06uu1Fy7D6BHynd8JnKA8EB
         aJ+e9DP/5BDBJTtQpApUlvP21yxVSzQ+xY22MMnkBDo8YRe8R9o0Q62NyArnDLbz5M4C
         Q88A==
X-Forwarded-Encrypted: i=1; AJvYcCW6I8bB1cKWH7I2nOcibYv/yywHg19L4Vjmj7xF0jsbTDofEX3nfvE8Vz14F2Tzg5SVH5xPIQdeLbNAjlScdLXe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6DzzDhzPyqi1XhekwuA7PX6KcDK5bgH3CZBKJ1W5vfIXs+MmS
	6ddvMT8T6Ty9vp3BDuT8CBQ6EgZN+/3MG+55GYBrM4+R8upuhwz6qbzu8CBWnHw=
X-Gm-Gg: ASbGncvaUTGTyx4EzWQ3UW1Ki70XxvoU3LasO8TcOJOJAp/I1ZPewVRl2hbYnDekmkg
	AmDnfOwRIUOB0yx7bPo577dtSE660E0uMQYEEvkE/Ztet7rr2nYuSbdH8BQxBXlF5IYVly9hV16
	tMNwCgGLo7QesxPXHSJ5/5ioCN4EMGm59SsZ777DR/GdxbieOrbEA6gDIZj8aWltDdW+6Q6FCyG
	9vfPMj+8RsZ2pvsezjStSYc2I8bGlSJYcLLquvNYRPUr+/nCHM=
X-Google-Smtp-Source: AGHT+IEXqcNtnOQtrn9HCLkcY6FnKIIl9CkgV9xxYEovPWiiPgpTNBlpOFS9Y9bIrLbUO0lLfarFWQ==
X-Received: by 2002:a05:6000:1846:b0:385:fb2c:6034 with SMTP id ffacd0b85a97d-3862b3e6fddmr2723661f8f.47.1733502673558;
        Fri, 06 Dec 2024 08:31:13 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862f02f5c3sm1151942f8f.65.2024.12.06.08.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:12 -0800 (PST)
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
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v3 4/4] perf: RISC-V: add support for SSE event
Date: Fri,  6 Dec 2024 17:31:00 +0100
Message-ID: <20241206163102.843505-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206163102.843505-1-cleger@rivosinc.com>
References: <20241206163102.843505-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083115_694209_B6973B57 
X-CRM114-Status: GOOD (  18.02  )
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
appropriate pt_regs.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 51 +++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 1aa303f76cc7..bd7ab15483db 100644
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
@@ -946,10 +947,10 @@ static void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
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
@@ -957,7 +958,6 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	struct perf_event *event;
 	u64 overflow;
 	u64 overflowed_ctrs = 0;
-	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
 	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 
@@ -967,13 +967,15 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
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
 
@@ -988,16 +990,16 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 
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
 
@@ -1053,6 +1055,22 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t pmu_sbi_ovf_irq_handler(int irq, void *dev)
+{
+	return pmu_sbi_ovf_handler(dev, get_irq_regs(), false);
+}
+
+static int pmu_sbi_ovf_sse_handler(uint32_t evt, void *arg,
+				   struct pt_regs *regs)
+{
+	struct cpu_hw_events __percpu *hw_events = arg;
+	struct cpu_hw_events *hw_event = raw_cpu_ptr(hw_events);
+
+	pmu_sbi_ovf_handler(hw_event, regs, true);
+
+	return 0;
+}
+
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
@@ -1100,9 +1118,22 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pdev)
 {
 	int ret;
+	struct sse_event *evt;
 	struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
 	struct irq_domain *domain = NULL;
 
+	evt = sse_event_register(SBI_SSE_EVENT_LOCAL_PMU, 0,
+				 pmu_sbi_ovf_sse_handler, hw_events);
+	if (!IS_ERR(evt)) {
+		ret = sse_event_enable(evt);
+		if (!ret) {
+			pr_info("using SSE for PMU event delivery\n");
+			return 0;
+		}
+
+		sse_event_unregister(evt);
+	}
+
 	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
 		riscv_pmu_irq_num = RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
@@ -1137,7 +1168,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		return -ENODEV;
 	}
 
-	ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, "riscv-pmu", hw_events);
+	ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_irq_handler, "riscv-pmu", hw_events);
 	if (ret) {
 		pr_err("registering percpu irq failed [%d]\n", ret);
 		return ret;
-- 
2.45.2


