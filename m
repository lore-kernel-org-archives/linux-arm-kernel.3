Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5E7C54EDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 23:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnCGsMvvb/sl+WABzO40apajVfbKrxsfIXszsES8O4k=; b=Z9giuQZB+pAC7Zqhld1+rb33WE
	Z+Cyk8PL2veJLUcLJX8PV6M/7nBZYRbUSNVtaHT21BSdxix62Fxse/KziSFVpC5s0vQ6pmqhFGY2o
	Tn88VP80INQ1530iltqNZlzK0Y+siXXuRsLOtU1iqmx/rSBhvhqzgqNPmlWx4cJ/M2RTsPrPqPjB6
	cfGh2pIwLAMI6/E9sI+pLo+V85B9uIGwNRvmb85cmrbKWhKMAWOMTYrmBtI903xFpm9SEAnZvHx7v
	9e6zOTpTnE1YvSrfuhZb7Q1IoadGIb7iSJvM2qEYRrrd1sdro2AhQVRoNBEuDWk+uyelAPPeZ+ccD
	7H+2S6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFRN-00000002TmZ-28Hm;
	Thu, 22 May 2025 23:35:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFIs-00000002RmA-04ch
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:26:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso3041404f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747956380; x=1748561180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnCGsMvvb/sl+WABzO40apajVfbKrxsfIXszsES8O4k=;
        b=nTdVY3hQSLKs4oK4hl7xptoUi7pTEhtdVkOn/M52TI0eAAnQ1fIcoVViB9RvORTFtK
         vaYHOKDVJh3s7xe2Z5hxxZYZXAfoNk+Vgq6e+kF6n5YYipQU3Jeqj+HeQG6rmUqGqwCh
         grslb0a0lqdIf9dgsKV8urcCupOv9SR8AmsE7mScKzdl3xoVkmxPjewrMiNQnGzxv1qZ
         OzKTh4rBlpA79ozZPFamJi4ODhd7rlzkpU7vPs9e6B2oQ3PHjog3G01WtGYi+SU03W1t
         SW9oZt4m6mNOPP2GjaCEI3Yr3d+Bswkj8pUvHViiT7Z8k5NRBBi/IluGiLuSVLQ9vvQu
         rcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956380; x=1748561180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnCGsMvvb/sl+WABzO40apajVfbKrxsfIXszsES8O4k=;
        b=BxYAC0CR1NJoqGQYGbKYRV28medlqhkYpPoZ3/29TisJND2arsYfaZVE9NaBd5WjPi
         j0ALFWl1Pn1BbNzwYqd9vTCm52+FrhwoKvJxDgU6S+ss1Hn7Gist5peffidFCzLN/Ns4
         Ti7n7vUjA5021mzxAccb3l2Z638WyI1iEnF6TAzeiY5dCnO69FEHY9QSn4afcjWGCM10
         K3VwJP1w6C5OK13gMeoJIVsDvZi0iV8gI25oRLcz1onDL7yNFfGsrvqzNbp2fnw534dg
         UsFNwjGAbO7cQ5M3KuL2srR0wzBjdSMngdyV4Bn4Wy8nSw7oKSN9tqkscllo+oJbp3Q/
         Idyw==
X-Forwarded-Encrypted: i=1; AJvYcCXGLfv9vRfYczN/2xYS9Awba2BXuj+UodhWmEYkFanw0dW9d8gfr4K4o5vi3eX4ZJoaSB1c7unrDpa3F8S7/PYH@lists.infradead.org
X-Gm-Message-State: AOJu0YyLKpZe7YIJGGDs4Zhp/Ua5qeXLja+EIWIYvoYEZhB5UI6gcRyy
	oILExp0q+1+Ixa599gV4qwszKFoXH1+0ZIXMgE5vmt02Es8N67i7MteV2LQ8SJpvs6A=
X-Gm-Gg: ASbGncs+p5e8A6t0QIO8FDBaqlqL6jWwNSnKOnTCvkMUCglKPxomUFWAtzioeN1NSsi
	/SXG0qUsxkr40D2EHUXXqe4RYcBu+gTwD+NJUjpj45VCLjYP49OBQVjqGyYRtCivCR2FU7Smfwj
	HzilCoB+T4GfEZ0FgmNVVouWygle2gb0rUpvMZZtRzBdqWhLDdvX8nWy+0dUYNhTy3q1j2egUIK
	U8Tzb7VAeeudRb4ZnZDL/IlgZedl1E3o4Meb+aj4G3dNOIlUuFsaLU/Vj93ro42TWF2xRsubjmU
	0dPZZ+TFlw8rgTtyl72yzeFOqMt7x8Um44SUlcQbR7R8YTAjpW3hUQ==
X-Google-Smtp-Source: AGHT+IEAPIcFtYM4Tgsv9MlTn3dUZjmgON/3+kE5HDdsMMPWIynQV0odP8gmbR56f/uO+RLDFOXOwg==
X-Received: by 2002:a05:6000:178e:b0:3a0:b53a:bc06 with SMTP id ffacd0b85a97d-3a35fe5ba93mr22446826f8f.1.1747956380256;
        Thu, 22 May 2025 16:26:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:75ac:6300:c05a:35d:17ae:e731])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm117825395e9.10.2025.05.22.16.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:26:20 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 23 May 2025 00:25:10 +0100
Subject: [PATCH v3 4/7] riscv: pmu: Add infrastructure for Control Transfer
 Record
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-b4-ctr_upstream_v3-v3-4-ad355304ba1c@rivosinc.com>
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747956375; l=7051;
 i=rkanwal@rivosinc.com; s=20250522; h=from:subject:message-id;
 bh=HQlCiM1VZsjqb/niITpfgq1gwhQMuUn578fiz8Bl7N0=;
 b=44dyGW9sGFwk6vSzLsN7JNhG+rcehhGCISKRHtl7qiGT06vranNGoHavClp+64Oe2FooG8+aB
 hbd7PyOu11+Czw/bzOTiH4SgSmzUPxsOl2iTVI1jEeuNb2pSNEE6Q78
X-Developer-Key: i=rkanwal@rivosinc.com; a=ed25519;
 pk=aw8nvncslGKHEmTBTJqvkP/4tj6pijL8fwRRym/GuS8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_162622_099276_BD24521C 
X-CRM114-Status: GOOD (  22.14  )
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

To support Control Transfer Records (CTR) extension, we need to extend the
riscv_pmu framework with some basic infrastructure for branch stack
sampling. Subsequent patches will use this to add support for CTR in the
riscv_pmu_dev driver.

With CTR, the branches are stored into a hardware FIFO, which will be
sampled by software when perf events overflow. A task may be
context-switched between overflows, and to avoid leaking samples we need
to clear the last task's records when a task is context-switched in.
To do this we will be using the pmu::sched_task() callback added in this
patch.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 drivers/perf/riscv_pmu_common.c | 22 ++++++++++++++++++++++
 drivers/perf/riscv_pmu_dev.c    | 17 +++++++++++++++++
 drivers/perf/riscv_pmu_legacy.c |  2 ++
 include/linux/perf/riscv_pmu.h  | 18 ++++++++++++++++++
 4 files changed, 59 insertions(+)

diff --git a/drivers/perf/riscv_pmu_common.c b/drivers/perf/riscv_pmu_common.c
index 7644147d50b46a79f349d6cb7e32554cc9a39a74..b2dc78cbbb93926964f81f30be9ef4a1c02501df 100644
--- a/drivers/perf/riscv_pmu_common.c
+++ b/drivers/perf/riscv_pmu_common.c
@@ -157,6 +157,19 @@ u64 riscv_pmu_ctr_get_width_mask(struct perf_event *event)
 	return GENMASK_ULL(cwidth, 0);
 }
 
+static void riscv_pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
+				 bool sched_in)
+{
+	struct riscv_pmu *pmu;
+
+	if (!pmu_ctx)
+		return;
+
+	pmu = to_riscv_pmu(pmu_ctx->pmu);
+	if (pmu->sched_task)
+		pmu->sched_task(pmu_ctx, sched_in);
+}
+
 u64 riscv_pmu_event_update(struct perf_event *event)
 {
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
@@ -269,6 +282,8 @@ static int riscv_pmu_add(struct perf_event *event, int flags)
 	cpuc->events[idx] = event;
 	cpuc->n_events++;
 	hwc->state = PERF_HES_UPTODATE | PERF_HES_STOPPED;
+	if (rvpmu->ctr_add)
+		rvpmu->ctr_add(event, flags);
 	if (flags & PERF_EF_START)
 		riscv_pmu_start(event, PERF_EF_RELOAD);
 
@@ -290,8 +305,13 @@ static void riscv_pmu_del(struct perf_event *event, int flags)
 	if (rvpmu->ctr_stop)
 		rvpmu->ctr_stop(event, RISCV_PMU_STOP_FLAG_RESET);
 	cpuc->n_events--;
+
+	if (rvpmu->ctr_del)
+		rvpmu->ctr_del(event, flags);
+
 	if (rvpmu->ctr_clear_idx)
 		rvpmu->ctr_clear_idx(event);
+
 	perf_event_update_userpage(event);
 	hwc->idx = -1;
 }
@@ -402,6 +422,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 	for_each_possible_cpu(cpuid) {
 		cpuc = per_cpu_ptr(pmu->hw_events, cpuid);
 		cpuc->n_events = 0;
+		cpuc->ctr_users = 0;
 		for (i = 0; i < RISCV_MAX_COUNTERS; i++)
 			cpuc->events[i] = NULL;
 		cpuc->snapshot_addr = NULL;
@@ -416,6 +437,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 		.start		= riscv_pmu_start,
 		.stop		= riscv_pmu_stop,
 		.read		= riscv_pmu_read,
+		.sched_task	= riscv_pmu_sched_task,
 	};
 
 	return pmu;
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index cd2ac4cf34f12618a2df1895f1fab8522016d325..95e6dd272db69f53b679e5fc3450785e45d5e8b9 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -1035,6 +1035,12 @@ static void rvpmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 	}
 }
 
+static void pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,
+			   bool sched_in)
+{
+	/* Call CTR specific Sched hook. */
+}
+
 static int rvpmu_sbi_find_num_ctrs(void)
 {
 	struct sbiret ret;
@@ -1561,6 +1567,14 @@ static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
 	return -ENOENT;
 }
 
+static void rvpmu_ctr_add(struct perf_event *event, int flags)
+{
+}
+
+static void rvpmu_ctr_del(struct perf_event *event, int flags)
+{
+}
+
 static void rvpmu_ctr_start(struct perf_event *event, u64 ival)
 {
 	struct hw_perf_event *hwc = &event->hw;
@@ -1979,6 +1993,8 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 	else
 		pmu->pmu.attr_groups = riscv_sbi_pmu_attr_groups;
 	pmu->cmask = cmask;
+	pmu->ctr_add = rvpmu_ctr_add;
+	pmu->ctr_del = rvpmu_ctr_del;
 	pmu->ctr_start = rvpmu_ctr_start;
 	pmu->ctr_stop = rvpmu_ctr_stop;
 	pmu->event_map = rvpmu_event_map;
@@ -1990,6 +2006,7 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 	pmu->event_mapped = rvpmu_event_mapped;
 	pmu->event_unmapped = rvpmu_event_unmapped;
 	pmu->csr_index = rvpmu_csr_index;
+	pmu->sched_task = pmu_sched_task;
 
 	ret = riscv_pm_pmu_register(pmu);
 	if (ret)
diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 93c8e0fdb5898587e89115c10587d69380da19ec..bee6742d35fa54a9b82d4a4842b481efaa226765 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -115,6 +115,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 		BIT(RISCV_PMU_LEGACY_INSTRET);
 	pmu->ctr_start = pmu_legacy_ctr_start;
 	pmu->ctr_stop = NULL;
+	pmu->ctr_add = NULL;
+	pmu->ctr_del = NULL;
 	pmu->event_map = pmu_legacy_event_map;
 	pmu->ctr_get_idx = pmu_legacy_ctr_get_idx;
 	pmu->ctr_get_width = pmu_legacy_ctr_get_width;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index e58f8381198849ea6134a46e894d91064a1a6154..883781f12ae0be93d8292ae1a7e7b03fea3ea955 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -46,6 +46,13 @@
 	},								\
 }
 
+#define MAX_BRANCH_RECORDS 256
+
+struct branch_records {
+	struct perf_branch_stack branch_stack;
+	struct perf_branch_entry branch_entries[MAX_BRANCH_RECORDS];
+};
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;
@@ -65,6 +72,12 @@ struct cpu_hw_events {
 	bool snapshot_set_done;
 	/* A shadow copy of the counter values to avoid clobbering during multiple SBI calls */
 	u64 snapshot_cval_shcopy[RISCV_MAX_COUNTERS];
+
+	/* Saved branch records. */
+	struct branch_records *branches;
+
+	/* Active events requesting branch records */
+	int ctr_users;
 };
 
 struct riscv_pmu {
@@ -78,6 +91,8 @@ struct riscv_pmu {
 	int		(*ctr_get_idx)(struct perf_event *event);
 	int		(*ctr_get_width)(int idx);
 	void		(*ctr_clear_idx)(struct perf_event *event);
+	void		(*ctr_add)(struct perf_event *event, int flags);
+	void		(*ctr_del)(struct perf_event *event, int flags);
 	void		(*ctr_start)(struct perf_event *event, u64 init_val);
 	void		(*ctr_stop)(struct perf_event *event, unsigned long flag);
 	int		(*event_map)(struct perf_event *event, u64 *config);
@@ -85,10 +100,13 @@ struct riscv_pmu {
 	void		(*event_mapped)(struct perf_event *event, struct mm_struct *mm);
 	void		(*event_unmapped)(struct perf_event *event, struct mm_struct *mm);
 	uint8_t		(*csr_index)(struct perf_event *event);
+	void		(*sched_task)(struct perf_event_pmu_context *ctx, bool sched_in);
 
 	struct cpu_hw_events	__percpu *hw_events;
 	struct hlist_node	node;
 	struct notifier_block   riscv_pm_nb;
+
+	unsigned int ctr_depth;
 };
 
 #define to_riscv_pmu(p) (container_of(p, struct riscv_pmu, pmu))

-- 
2.43.0


