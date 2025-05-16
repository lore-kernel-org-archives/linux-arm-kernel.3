Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8370C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zg4MVDxepeDe1PHQtirn8D+GOdcfZUBgtKIkrZUnms=; b=hk1xGxWFG8ltK9UUehqmjqGq7j
	T8nZReyBs7L+asHfjtUSJAZz20AiGaCdXmkMNwNHkf3xpIMbiE+EnWdQUDT4ugLfpv99gDNgKTsmt
	HKx3jvdr/xrnqa68oRqMT8lFOtmpQPKebdylqZgFc3tQn1QIl8lKgL2byW9rh/XIaGYN01narsaEH
	wDYlXTcQORRSKvQXYVs0q0iuHFjt+/sh19dU5f0KWMhfumGnSfNz2EXHdZqfbOMcYK4tXgrSdGd7F
	xrAjZYkNDTB+/k5zSo5LWhMs1jPmKGusMHbu/EEYupWI5hHS3gG/bqh0Nk7TR9+yeGKowESCPdmZ6
	EGNsrOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvyy-00000003eul-1PEh;
	Fri, 16 May 2025 14:24:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvJI-00000003Xwi-3JDZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:41:14 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso12205915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402871; x=1748007671; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4zg4MVDxepeDe1PHQtirn8D+GOdcfZUBgtKIkrZUnms=;
        b=4NfsDn3h2aRIQKd3A2ZjMHhKq6mSBOukxg6u/qcK/03UMVysw/dGr1PCWmAA5z7LXC
         ZphU2zClSGPGaS2+jME+pH5slfwjXP9gAuZWUXwobzzb9igBHeAYZXrbLZaNuBUdWzLy
         O0uVUnbwhbe2dg2zA9ggzlbtGXN81476hobFc+mXagASbRT6wSgUPsKfZ1uoWxdFrU+e
         dx96Q4t06ewcnOkHb2chsKa2xnjlewglcgEsJJbiLv9wuceKeFvXUumYmahbGshXo634
         4yOMpXRdzLBeROJnglG7D4SrhLf6bT36jPropmCaAN6TTGmVIAJQFwEsOsnC6vhyyyVf
         SsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402871; x=1748007671;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zg4MVDxepeDe1PHQtirn8D+GOdcfZUBgtKIkrZUnms=;
        b=wIMasWxXZr6VWsXk18GX6/KXuoA/TzuVElBFoCWKpjA5gHbVFRcsQcHSH6sZKWHBx4
         sQrcD5ZKU1gYETK5D6Z/zyFinq9cM05fbqrx5WumJasXSbHkSVC88b6MQNozEq/K4oVF
         FiU5CMioGGtVeHb+h0PDMrBz90UNP1JQnxKvjplmYO1vEMaRU7/TA8abJ2pSWJvZO7Nv
         i7PyEufJdcBdZSW2m4tGW/duaZEimpi7eBqKMET8SwiXVFUDRYkHtJzSXYrUn2pzdyfj
         StCdsTb5qEZ4rrB75htd9SJ2u+p5V7c8iMkbusFHYZVnd/GROjK7N+JxLuKWgbox78YH
         lwmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4XHkigbwNqQATKw8IsK9kzZmC/AVvPr5n5a4TzWEXdA/2NgX3jb/0mfXsMd745iZLmiK/8eBLTiCNRrUV8HC0@lists.infradead.org
X-Gm-Message-State: AOJu0YwY4XFUALqteJnQBCotly5IWxdqGKTnyctL/BbBLByjEYLJ/iM2
	0kbUI2zfsi2vn81P5S9ec5bVncseQiiiLnfcB1jVXb4B/50mszaJlxkJ2cLywePUyzbryqMwnM3
	bFyw4kOXgUZQrqKGJ86EqAg==
X-Google-Smtp-Source: AGHT+IEJuVUSxuvnJv90hePyGcWL+t7f0fqkvfwSnOtoVzJuT5ZRfDfIXhsn4MGWo4TKKpPUBVx5qGBfOp0PbauO
X-Received: from wmbes6.prod.google.com ([2002:a05:600c:8106:b0:442:faba:ccec])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c28:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-442fd60b66emr34790875e9.4.1747402871192;
 Fri, 16 May 2025 06:41:11 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:26 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-21-vdonnefort@google.com>
Subject: [PATCH v5 20/25] KVM: arm64: Sync boot clock with the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, "Christopher S. Hall" <christopher.s.hall@intel.com>, 
	Richard Cochran <richardcochran@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_064112_849627_82EC520A 
X-CRM114-Status: GOOD (  23.63  )
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

Configure the pKVM hypervisor tracing clock with the kernel boot clock.
For tracing purpose, the boot clock is interesting as it doesn't stop on
suspend. However, it is corrected on a regular basis, which implies we
need to re-evaluate it every once in a while.

Cc: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Christopher S. Hall <christopher.s.hall@intel.com>
Cc: Richard Cochran <richardcochran@gmail.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 437ac948d136..d122d79718a0 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -87,6 +87,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
+	__KVM_HOST_SMCCC_FUNC___pkvm_update_clock_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_load_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_unload_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_enable_tracing,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index 996e90c0974f..4e11dcdf049b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -7,6 +7,7 @@
 void *tracing_reserve_entry(unsigned long length);
 void tracing_commit_entry(void);
 
+void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
 int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size);
 void __pkvm_unload_tracing(void);
 int __pkvm_enable_tracing(bool enable);
@@ -15,6 +16,8 @@ int __pkvm_swap_reader_tracing(unsigned int cpu);
 static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
 static inline void tracing_commit_entry(void) { }
 
+static inline
+void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
 static inline int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
 static inline void __pkvm_unload_tracing(void) { }
 static inline int __pkvm_enable_tracing(bool enable) { return -ENODEV; }
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 68b98547666b..c73229fb5e1b 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -571,6 +571,18 @@ static void handle___pkvm_teardown_vm(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_teardown_vm(handle);
 }
 
+static void handle___pkvm_update_clock_tracing(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u32, mult, host_ctxt, 1);
+	DECLARE_REG(u32, shift, host_ctxt, 2);
+	DECLARE_REG(u64, epoch_ns, host_ctxt, 3);
+	DECLARE_REG(u64, epoch_cyc, host_ctxt, 4);
+
+	__pkvm_update_clock_tracing(mult, shift, epoch_ns, epoch_cyc);
+
+	cpu_reg(host_ctxt, 1) = 0;
+}
+
 static void handle___pkvm_load_tracing(struct kvm_cpu_context *host_ctxt)
 {
 	 DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
@@ -639,6 +651,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
+	HANDLE_FUNC(__pkvm_update_clock_tracing),
 	HANDLE_FUNC(__pkvm_load_tracing),
 	HANDLE_FUNC(__pkvm_unload_tracing),
 	HANDLE_FUNC(__pkvm_enable_tracing),
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index f9949b243844..32fd889315f0 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -249,3 +249,19 @@ int __pkvm_swap_reader_tracing(unsigned int cpu)
 
 	return ret;
 }
+
+void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
+{
+	int cpu;
+
+	/* After this loop, all CPUs are observing the new bank... */
+	for (cpu = 0; cpu < hyp_nr_cpus; cpu++) {
+		struct simple_rb_per_cpu *simple_rb = per_cpu_ptr(trace_buffer.simple_rbs, cpu);
+
+		while (READ_ONCE(simple_rb->status) == SIMPLE_RB_WRITING)
+			;
+	}
+
+	/* ...we can now override the old one and swap. */
+	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
+}
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index ccac2ecaf96f..a6664a03f8a9 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/trace_remote.h>
+#include <linux/tracefs.h>
 #include <linux/simple_ring_buffer.h>
 
 #include <asm/kvm_host.h>
@@ -12,6 +13,121 @@
 
 #include "hyp_trace.h"
 
+/* Same 10min used by clocksource when width is more than 32-bits */
+#define CLOCK_MAX_CONVERSION_S	600
+/*
+ * Time to give for the clock init. Long enough to get a good mult/shift
+ * estimation. Short enough to not delay the tracing start too much.
+ */
+#define CLOCK_INIT_MS		100
+/*
+ * Time between clock checks. Must be small enough to catch clock deviation when
+ * it is still tiny.
+ */
+#define CLOCK_UPDATE_MS		500
+
+static struct hyp_trace_clock {
+	u64			cycles;
+	u64			cyc_overflow64;
+	u64			boot;
+	u32			mult;
+	u32			shift;
+	struct delayed_work	work;
+	struct completion	ready;
+	struct mutex		lock;
+	bool			running;
+} hyp_clock;
+
+static void __hyp_clock_work(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct hyp_trace_clock *hyp_clock;
+	struct system_time_snapshot snap;
+	u64 rate, delta_cycles;
+	u64 boot, delta_boot;
+
+	hyp_clock = container_of(dwork, struct hyp_trace_clock, work);
+
+	ktime_get_snapshot(&snap);
+	boot = ktime_to_ns(snap.boot);
+
+	delta_boot = boot - hyp_clock->boot;
+	delta_cycles = snap.cycles - hyp_clock->cycles;
+
+	/* Compare hyp clock with the kernel boot clock */
+	if (hyp_clock->mult) {
+		u64 err, cur = delta_cycles;
+
+		if (WARN_ON_ONCE(cur >= hyp_clock->cyc_overflow64)) {
+			__uint128_t tmp = (__uint128_t)cur * hyp_clock->mult;
+
+			cur = tmp >> hyp_clock->shift;
+		} else {
+			cur *= hyp_clock->mult;
+			cur >>= hyp_clock->shift;
+		}
+		cur += hyp_clock->boot;
+
+		err = abs_diff(cur, boot);
+		/* No deviation, only update epoch if necessary */
+		if (!err) {
+			if (delta_cycles >= (hyp_clock->cyc_overflow64 >> 1))
+				goto fast_forward;
+
+			goto resched;
+		}
+
+		/* Warn if the error is above tracing precision (1us) */
+		if (err > NSEC_PER_USEC)
+			pr_warn_ratelimited("hyp trace clock off by %lluus\n",
+					    err / NSEC_PER_USEC);
+	}
+
+	rate = div64_u64(delta_cycles * NSEC_PER_SEC, delta_boot);
+
+	clocks_calc_mult_shift(&hyp_clock->mult, &hyp_clock->shift,
+			       rate, NSEC_PER_SEC, CLOCK_MAX_CONVERSION_S);
+
+	/* Add a comfortable 50% margin */
+	hyp_clock->cyc_overflow64 = (U64_MAX / hyp_clock->mult) >> 1;
+
+fast_forward:
+	hyp_clock->cycles = snap.cycles;
+	hyp_clock->boot = boot;
+	kvm_call_hyp_nvhe(__pkvm_update_clock_tracing, hyp_clock->mult,
+			  hyp_clock->shift, hyp_clock->boot, hyp_clock->cycles);
+	complete(&hyp_clock->ready);
+
+resched:
+	schedule_delayed_work(&hyp_clock->work,
+			      msecs_to_jiffies(CLOCK_UPDATE_MS));
+}
+
+static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enable)
+{
+	struct system_time_snapshot snap;
+
+	if (hyp_clock->running == enable)
+		return;
+
+	if (!enable) {
+		cancel_delayed_work_sync(&hyp_clock->work);
+		hyp_clock->running = false;
+	}
+
+	ktime_get_snapshot(&snap);
+
+	hyp_clock->boot = ktime_to_ns(snap.boot);
+	hyp_clock->cycles = snap.cycles;
+	hyp_clock->mult = 0;
+
+	init_completion(&hyp_clock->ready);
+	INIT_DELAYED_WORK(&hyp_clock->work, __hyp_clock_work);
+	schedule_delayed_work(&hyp_clock->work, msecs_to_jiffies(CLOCK_INIT_MS));
+	wait_for_completion(&hyp_clock->ready);
+	hyp_clock->running = true;
+}
+
 /* Access to this struct within the trace_remote_callbacks are protected by the trace_remote lock */
 struct hyp_trace_buffer {
 	struct hyp_trace_desc	*desc;
@@ -173,6 +289,8 @@ static void hyp_trace_unload(struct trace_buffer_desc *desc, void *priv)
 
 static int hyp_trace_enable_tracing(bool enable, void *priv)
 {
+	hyp_trace_clock_enable(&hyp_clock, enable);
+
 	return kvm_call_hyp_nvhe(__pkvm_enable_tracing, enable);
 }
 
@@ -191,7 +309,22 @@ static int hyp_trace_enable_event(unsigned short id, bool enable, void *priv)
 	return 0;
 }
 
+static int hyp_trace_clock_show(struct seq_file *m, void *v)
+{
+	seq_puts(m, "[boot]\n");
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(hyp_trace_clock);
+
+static int hyp_trace_init_tracefs(struct dentry *d, void *priv)
+{
+	return tracefs_create_file("trace_clock", 0440, d, NULL, &hyp_trace_clock_fops) ?
+		0 : -ENOMEM;
+}
+
 static struct trace_remote_callbacks trace_remote_callbacks = {
+	.init			= hyp_trace_init_tracefs,
 	.load_trace_buffer	= hyp_trace_load,
 	.unload_trace_buffer	= hyp_trace_unload,
 	.enable_tracing		= hyp_trace_enable_tracing,
-- 
2.49.0.1101.gccaa498523-goog


