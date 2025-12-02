Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78956CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqLe6Xq0tibOP6f4xQHVAJbG1SEQPQU2DuMeX4VLOC4=; b=G9/crqOZ+X2dUEE+HEveVioyle
	+8hA2qHEnzQYncLrhpr84hHy8zGMVkSa4XmwuKT6aPWJC6j+U9KsJm68YxhBrEVK0cXeN+YO5esS3
	dztgYmAnMeFQ/G0h5/UUD0XyaYqzlGZMlKxa5Lzegdm0Zrpb8g5W3F+2WRg9rb2AgQn+tppYwmtzE
	/LEf9CT6FI9C+i3WPPZQMHv/ruv+W8F402EpmxWpGr5MwKoJwqF/RH2mCcOH08lVMZjFLzQonZgVA
	AYp/UsUuDpbdTWiddcGBYvxvLXipy0CPyVnk07FjHEC8fscxoAicDgUlNV8dMmrNRBioHo1bszUBX
	hERg9ltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMox-000000058oM-4Bvj;
	Tue, 02 Dec 2025 09:37:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMog-000000058R2-04gr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 02 Dec 2025 09:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eqLe6Xq0tibOP6f4xQHVAJbG1SEQPQU2DuMeX4VLOC4=; b=jb5elULhs/jBDYWsSLoavmbJo1
	8hnbHQU2+JdMAhf+s9HG/abu6TdGCe7yY8leHSugSQ/oZdoWYfyQCCOSJSQOxtPTkZS3gQ20A1IGk
	jvAyiqoIXjoegfWA0faXF1I4yOR9AzCQChyeSabFYiTzs0hWt5clTQ7drgA3BtvYMwkj8MW+LTddj
	2dEhkLxNvRdAoBMZ+0YByz9dVNbguBOAiJ3+FSMgomhr3XSBrIfI1uKoQc61tAq74SSskAzq3ZQw/
	7BSdeBChwLw8FgVdzrVxrzwNucuxXfRGQ9nI8Jch5hLRunXPgtpfAmVMqs+t+v4XhlJov5tGH+4l7
	Fp1W0GJg==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLx4-0000000HaL0-0g1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:41:39 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42b56125e77so2824070f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668215; x=1765273015; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eqLe6Xq0tibOP6f4xQHVAJbG1SEQPQU2DuMeX4VLOC4=;
        b=msARR9HhX8rbSvmVkCg7USjhCxszolimipuAJJkZkGaKlVtgtTepnWn1Rb6rcn5q9P
         zO2ecx36qpA4AeuGVD+6GT7o5rdjfKoV8GLLXAzvfkY7HA0P/uQmxKAd0LMvY4UKKNGQ
         poVCLAfitjjnR0pa6Qv9f+Z5BawfNIprIHwUoTcYWtgKcj8OwY2lDbKP5LSQ9qsErV2y
         KDiwHUcdXeotsBGW6duRZgCivRMswBTL8qJV7G2B6bGgSI+Oq3lxuQtL9OHojsqp/4J6
         RS6pQxC4q+V2280QN4Ly+L7xUVPWQLr+mgJVkGjuagrcJuosikit7SFuppErqMxJIRwg
         52Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668215; x=1765273015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqLe6Xq0tibOP6f4xQHVAJbG1SEQPQU2DuMeX4VLOC4=;
        b=kpNXaf79r6+xGBQpKKqS6j3uVcmTPt/T0UkKeYDkvBuqhn8ItOfpXVRioTakZ7XKuu
         e46I7n9/sPmS6VDLebQjJKAfrjY0ub1hRhBmvpGv6oOQDfKUw9ROw+2SIa4q9hpBpQ+a
         fK53bFnbg/GXxloGK2pNPPKyHeWeuhU5dMarwCICus+2jsHDpXrI9PCA77tPFHLzNJ/+
         n+piMBAu7F9tLGDQWIblPoqr8dWn9Mmj5nOw+hbOY1dawubdU/41jE4PFJBqQ463+XI4
         oyOgCcJUR5Evf/Hmn979s3yUCtyK6I0zE3mhkViwXP3M2UqMHjvMTqekg+6s/O83VlsC
         6zfg==
X-Forwarded-Encrypted: i=1; AJvYcCWUeNAaBcGS8SolQ8HLbYP2RI/0sJKM6axg4EXjyheJ46ymLEcssTqtfrjjxutNN0YcwgPaFeN74jpOZWZtNIOX@lists.infradead.org
X-Gm-Message-State: AOJu0YyZij/iEIJ33QnjKx0KkYJwWj+I8QiqwZwp93BPQe8ybFfHKgj3
	Vb9LFw6vN5lOut2n6EgEqp3JpEIhYxzDR5Ig8N5hAQq78q4iRC3Bl+XQdDCScbFrtN4DDZ1R0V/
	KYkTqS2dJSTkJauWu+LCcgQ==
X-Google-Smtp-Source: AGHT+IGsutLM/DAfDBlXBg006vFBTHRQUX46vIYB79KnzR5KxNniw7za4k8fQ4DJbD9e9DAG5DVm7RZYs9qmbRw2
X-Received: from wrml10.prod.google.com ([2002:adf:e58a:0:b0:429:b854:c5e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1886:b0:42b:2dfd:534f with SMTP id ffacd0b85a97d-42e0f344720mr29160806f8f.34.1764668215430;
 Tue, 02 Dec 2025 01:36:55 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:18 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-26-vdonnefort@google.com>
Subject: [PATCH v9 25/30] KVM: arm64: Sync boot clock with the nVHE/pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	"Christopher S. Hall" <christopher.s.hall@intel.com>, Richard Cochran <richardcochran@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_084138_392524_0FC5E982 
X-CRM114-Status: GOOD (  25.02  )
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

Configure the hypervisor tracing clock with the kernel boot clock. For
tracing purposes, the boot clock is interesting: it doesn't stop on
suspend. However, it is corrected on a regular basis, which implies the
need to re-evaluate it every once in a while.

Cc: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Christopher S. Hall <christopher.s.hall@intel.com>
Cc: Richard Cochran <richardcochran@gmail.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index f83650a7aad9..375607c67285 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -93,6 +93,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___tracing_unload,
 	__KVM_HOST_SMCCC_FUNC___tracing_enable,
 	__KVM_HOST_SMCCC_FUNC___tracing_swap_reader,
+	__KVM_HOST_SMCCC_FUNC___tracing_update_clock,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index 7da8788ce527..fd641e1b1c23 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -11,6 +11,7 @@ int __tracing_load(unsigned long desc_va, size_t desc_size);
 void __tracing_unload(void);
 int __tracing_enable(bool enable);
 int __tracing_swap_reader(unsigned int cpu);
+void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
 #else
 static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
 static inline void tracing_commit_entry(void) { }
@@ -19,5 +20,6 @@ static inline int __tracing_load(unsigned long desc_va, size_t desc_size) { retu
 static inline void __tracing_unload(void) { }
 static inline int __tracing_enable(bool enable) { return -ENODEV; }
 static inline int __tracing_swap_reader(unsigned int cpu) { return -ENODEV; }
+static inline void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
 #endif
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 8b78b29c2069..45b8f70828de 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -613,6 +613,18 @@ static void handle___tracing_swap_reader(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __tracing_swap_reader(cpu);
 }
 
+static void handle___tracing_update_clock(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u32, mult, host_ctxt, 1);
+	DECLARE_REG(u32, shift, host_ctxt, 2);
+	DECLARE_REG(u64, epoch_ns, host_ctxt, 3);
+	DECLARE_REG(u64, epoch_cyc, host_ctxt, 4);
+
+	__tracing_update_clock(mult, shift, epoch_ns, epoch_cyc);
+
+	cpu_reg(host_ctxt, 1) = 0;
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -658,6 +670,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__tracing_unload),
 	HANDLE_FUNC(__tracing_enable),
 	HANDLE_FUNC(__tracing_swap_reader),
+	HANDLE_FUNC(__tracing_update_clock),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index df9d66fcb3c9..97e9f6c1a52c 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -271,3 +271,19 @@ int __tracing_swap_reader(unsigned int cpu)
 
 	return ret;
 }
+
+void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
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
index 2866effe28ec..1e5fc27f0e9d 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -4,15 +4,133 @@
  * Author: Vincent Donnefort <vdonnefort@google.com>
  */
 
+#include <linux/cpumask.h>
 #include <linux/trace_remote.h>
+#include <linux/tracefs.h>
 #include <linux/simple_ring_buffer.h>
 
+#include <asm/arch_timer.h>
 #include <asm/kvm_host.h>
 #include <asm/kvm_hyptrace.h>
 #include <asm/kvm_mmu.h>
 
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
+	kvm_call_hyp_nvhe(__tracing_update_clock, hyp_clock->mult,
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
 static struct hyp_trace_buffer {
 	struct hyp_trace_desc	*desc;
@@ -183,6 +301,8 @@ static void hyp_trace_unload(struct trace_buffer_desc *desc, void *priv)
 
 static int hyp_trace_enable_tracing(bool enable, void *priv)
 {
+	hyp_trace_clock_enable(&hyp_clock, enable);
+
 	return kvm_call_hyp_nvhe(__tracing_enable, enable);
 }
 
@@ -201,7 +321,22 @@ static int hyp_trace_enable_event(unsigned short id, bool enable, void *priv)
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
@@ -212,8 +347,22 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 
 int __init kvm_hyp_trace_init(void)
 {
+	int cpu;
+
 	if (is_kernel_in_hyp_mode())
 		return 0;
 
+#ifdef CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND
+	for_each_possible_cpu(cpu) {
+		const struct arch_timer_erratum_workaround *wa =
+			per_cpu(timer_unstable_counter_workaround, cpu);
+
+		if (wa && wa->read_cntvct_el0) {
+			pr_warn("hyp trace can't handle CNTVCT workaround '%s'\n", wa->desc);
+			return -EOPNOTSUPP;
+		}
+	}
+#endif
+
 	return trace_remote_register("hypervisor", &trace_remote_callbacks, &trace_buffer, NULL, 0);
 }
-- 
2.52.0.107.ga0afd4fd5b-goog


