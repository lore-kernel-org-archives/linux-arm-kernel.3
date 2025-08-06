Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AC6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 20:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWazn7LbEKToZVBXfT81sYQ79Zs+usROHmWn+qgVcAw=; b=edZFjr3eRJWxmF0wWSrRgbVlYZ
	3SHRnkO7BTBvgRBAFsmq7oqGW7l4vhHXvNHno5llAULBzImwfm23THjnMuBul/i5YWYGf2/uuyPFg
	vRxP3tHY4aH+hV+nfizz2BCZn7dB4nbhNykAYMLuqnqFGKmhP77KsuanQ2yOxJ8H8jfkqOx7TXi4j
	aSNslRUir/TUYmVyiTpcUw9uoHZ5uyahncGLMaRDy67JOZdY3vvtjJ6qVEXXV+p7/Yih+EeGv2LrT
	LOl2CwYV5VcWywQc2i6Rp20ZWdgExKaqOR40ub3QxbLwHuOMLQouu+9v2MweIEb6ikW7mRmC+qMRe
	0K8oVN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkgN-0000000GOID-4BWt;
	Wed, 06 Aug 2025 20:24:20 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGf-0000000GGFd-3iBV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:47 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b0e0c573531so121921a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510265; x=1755115065; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jWazn7LbEKToZVBXfT81sYQ79Zs+usROHmWn+qgVcAw=;
        b=He2FMoYhHl7cHOxSWp71tbdUVppprSXNxeOQ5Uza7H54veAeuv9QlYi1py/e2Rw7Nr
         be2BQpGiCgc148rRWb7mS+0eMa8xorsJgxTKDNfZx8mSEfvbOnxZYoBias3a3GASMqln
         0Bow5riO2qCh9/vAPzU74Ik4uejIkJTovmhxueCW+Hb+HDLnKSUPU1SOC5XqUUqYsAWS
         OmEAorq+J+dHKGgFk2AuPnrJsFupV0qaFqndtZsztNAV6TAjKFYA5qb4WMCxC1/I7Oi+
         VEWPHz4r4YsFwTNbet5G17ReU9o/w848KhokG/gqofbzEcr+4E5jye6aN/9jI9PV/rMQ
         bt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510265; x=1755115065;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWazn7LbEKToZVBXfT81sYQ79Zs+usROHmWn+qgVcAw=;
        b=SYWQeibCndq36fdON3/Qdq+UleJsx5b06hpWUGZfaQPQ2DIOwXuePnjSmEobYGxpfb
         h60Scm2LYQX8LJOfOulb8FLwhCXSoRGcPfC1TLbBXxemsRcqJCEL2sN4kIBXoPd7y8yl
         RD9S68jhf+Lvg2u4H6yR3UN1dGqBOnZPns2WGjU5tYa7HjS6NNz68c3TT4FWY4SGgVyL
         kKcPbsDzQQNgX91gI/BvKugHh+uRAwIf3orFi9QYmIBuPZSsZ+8ryIyXRPkpV0YFuv7M
         gJH9W+92+zchGrR6tk1NYEO/blLjqh7knaCsnSQ5UDur31igAxcwOcvcCOM7pRoe9bBH
         XmlA==
X-Gm-Message-State: AOJu0YzupLtl7WLULbbn/nEIylDy0ZgobcmI+s+2+zJNe6PsWlk0+ZTw
	jUxPAtGgNP7Fo+pl5YDLHayLGzJx43Ya6Zj6Gy6cNN9dmZ0BzT2rjzAjIaOZAmZ0PwyMRSCYWdF
	K6TIk4A==
X-Google-Smtp-Source: AGHT+IEOZHdE2/PbxBEmSs9IzcnvpAQDGgoykrCqSet5dWYTZm1GHUavvsVGL1zycY+fmJU68DVHh19KP/o=
X-Received: from pgbcs10.prod.google.com ([2002:a05:6a02:418a:b0:b42:2ab5:b109])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:218d:b0:23d:f987:b033
 with SMTP id adf61e73a8af0-240314c22f5mr6625238637.40.1754510264630; Wed, 06
 Aug 2025 12:57:44 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:31 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-10-seanjc@google.com>
Subject: [PATCH v5 09/44] perf/x86: Switch LVTPC to/from mediated PMI vector
 on guest load/put context
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125745_931316_D7BB1EA8 
X-CRM114-Status: GOOD (  16.33  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add arch hooks to the mediated vPMU load/put APIs, and use the hooks to
switch PMIs to the dedicated mediated PMU IRQ vector on load, and back to
perf's standard NMI when the guest context is put.  I.e. route PMIs to
PERF_GUEST_MEDIATED_PMI_VECTOR when the guest context is active, and to
NMIs while the host context is active.

While running with guest context loaded, ignore all NMIs (in perf).  Any
NMI that arrives while the LVTPC points at the mediated PMU IRQ vector
can't possibly be due to a host perf event.

Signed-off-by: Xiong Zhang <xiong.y.zhang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: use arch hook instead of per-PMU callback]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/core.c     | 27 +++++++++++++++++++++++++++
 include/linux/perf_event.h |  3 +++
 kernel/events/core.c       |  4 ++++
 3 files changed, 34 insertions(+)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 7610f26dfbd9..9b0525b252f1 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -55,6 +55,8 @@ DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events) = {
 	.pmu = &pmu,
 };
 
+static DEFINE_PER_CPU(bool, x86_guest_ctx_loaded);
+
 DEFINE_STATIC_KEY_FALSE(rdpmc_never_available_key);
 DEFINE_STATIC_KEY_FALSE(rdpmc_always_available_key);
 DEFINE_STATIC_KEY_FALSE(perf_is_hybrid);
@@ -1756,6 +1758,16 @@ perf_event_nmi_handler(unsigned int cmd, struct pt_regs *regs)
 	u64 finish_clock;
 	int ret;
 
+	/*
+	 * Ignore all NMIs when a guest's mediated PMU context is loaded.  Any
+	 * such NMI can't be due to a PMI as the CPU's LVTPC is switched to/from
+	 * the dedicated mediated PMI IRQ vector while host events are quiesced.
+	 * Attempting to handle a PMI while the guest's context is loaded will
+	 * generate false positives and clobber guest state.
+	 */
+	if (this_cpu_read(x86_guest_ctx_loaded))
+		return NMI_DONE;
+
 	/*
 	 * All PMUs/events that share this PMI handler should make sure to
 	 * increment active_events for their events.
@@ -2727,6 +2739,21 @@ static struct pmu pmu = {
 	.filter			= x86_pmu_filter,
 };
 
+void arch_perf_load_guest_context(unsigned long data)
+{
+	u32 masked = data & APIC_LVT_MASKED;
+
+	apic_write(APIC_LVTPC,
+		   APIC_DM_FIXED | PERF_GUEST_MEDIATED_PMI_VECTOR | masked);
+	this_cpu_write(x86_guest_ctx_loaded, true);
+}
+
+void arch_perf_put_guest_context(void)
+{
+	this_cpu_write(x86_guest_ctx_loaded, false);
+	apic_write(APIC_LVTPC, APIC_DM_NMI);
+}
+
 void arch_perf_update_userpage(struct perf_event *event,
 			       struct perf_event_mmap_page *userpg, u64 now)
 {
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 0c529fbd97e6..3a9bd9c4c90e 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1846,6 +1846,9 @@ static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
 # define perf_arch_guest_misc_flags(regs)	perf_arch_guest_misc_flags(regs)
 #endif
 
+extern void arch_perf_load_guest_context(unsigned long data);
+extern void arch_perf_put_guest_context(void);
+
 static inline bool needs_branch_stack(struct perf_event *event)
 {
 	return event->attr.branch_sample_type != 0;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index e1df3c3bfc0d..ad22b182762e 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6408,6 +6408,8 @@ void perf_load_guest_context(unsigned long data)
 		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
 	}
 
+	arch_perf_load_guest_context(data);
+
 	perf_ctx_enable(&cpuctx->ctx, EVENT_GUEST);
 	if (cpuctx->task_ctx)
 		perf_ctx_enable(cpuctx->task_ctx, EVENT_GUEST);
@@ -6433,6 +6435,8 @@ void perf_put_guest_context(void)
 
 	perf_event_sched_in(cpuctx, cpuctx->task_ctx, NULL, EVENT_GUEST);
 
+	arch_perf_put_guest_context();
+
 	if (cpuctx->task_ctx)
 		perf_ctx_enable(cpuctx->task_ctx, EVENT_GUEST);
 	perf_ctx_enable(&cpuctx->ctx, EVENT_GUEST);
-- 
2.50.1.565.gc32cd1483b-goog


