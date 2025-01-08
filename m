Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD2AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/ljNWnFFLsO0qM4wfk7we1pD6ZL8txquRN7nzlRbfw=; b=mxPBJ7HK1NVy4ln9h47J56EYjL
	VWJUDxuStmDw8hlBKqtMYZLVOEECs2ZsigMpUW4aM8HL9NFZBBVE6WaN0TioWIdqGQKAyBoed+/AI
	/j4vMprrdb5wgKtl0uH85t5Age68l5TQ4/S4dlK7GT/65uM3GCQN9r9YULsruDIOfj16Y9RoONqGV
	m4usN7WnzfV9cepox4ZqVZ2xcP7khcpzgWf8JNqPhOkuIz5jzOVJUmkoBZeoIlIwz2uLdca1wRMQu
	3fO/iUT4d/yZpuPSqkIXsFDjshO9JsReoqc0mMHn6ap0yX4xcfEqUBrNiodtXajJQEoE2qpgzo9p4
	aGE3YCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV8p-00000008Q9l-26Uo;
	Wed, 08 Jan 2025 12:26:31 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUVv-00000008H3X-3mxF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:46:21 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361b090d23so48862855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 03:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736336778; x=1736941578; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/ljNWnFFLsO0qM4wfk7we1pD6ZL8txquRN7nzlRbfw=;
        b=rbCfZ+BiYabRhAOQ48YITnOEImolnORNy2UJsJqmLtVoDxpfonV/Za7+LOnp6jQg94
         pGfcJQluGmfeS9Gze0AQZmZKaiGxEgcXqVsjKm+i7DD64WlmBojHVrK/aJhCwMyBKSk5
         pQkqtveEdNGXz5R3EoUVAM1bR+5JOCv/NIo0O9+nSqx9M/Ol9CzRB2JNL7yTWtbTKHrk
         xiVOWWF1U3aPkgFWS4a0NFl7UszXWFvMkJE0iMsjShsmWN7poFR9wDePl9Iz1Oy0p/X7
         wCI5u+QPgAKITASu+YyhTnsIi8N2ogIXJp2TqqMud2YRadCTS4gXYe8WcUb1/JMAjjrc
         GeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336778; x=1736941578;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/ljNWnFFLsO0qM4wfk7we1pD6ZL8txquRN7nzlRbfw=;
        b=fvhsOezZ1kys2yjnR9yrV710OXJ4/qUhej1++lCsYrWmQTPLF5BxrXp067Ik4EDN+E
         TME7WSiu+vHmOLRtXb9LTwBMf0sETW/jsyu6QZy4xdco9AYr07b4TeoY5YAnjq9gS81l
         Yn0iftD23M8A/IxtBKiGmtHTI2YMr2SnnjmRAdKTHrr2SzNa1DgWRYBbGMmdrM6LREC0
         UmA8Bfg2eCicYxkRo5L84vCZE88rN+RQaC2KdX9D93KSY4nYI/yUX1Mm+dVrw6ouYYEC
         XFpii6k3uAbu+sokyKTksAIVN4p7O+2tnivXLArXoalnjU+hLl4WMjE4tWI2ExUJ6bO9
         niHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrgUuTFDMNUH6qyyemaTtgGsvpeigDKh8B/uARa09VLTy6RXYFs3yryiMaBAaYkzi9I2O846+4Q54s8vlQwx7k@lists.infradead.org
X-Gm-Message-State: AOJu0Yygu03OyiAU6wq9P78yVOPX1wg9Cd1aKR6fghnLFHtDvKa80hMl
	1QS4Y8ChxDNBm/MOKi8z4YWtlA5xFb05++BUhnXTgTwn7z8iybwa5BTFTeMc1NbxeALPZFB0XvK
	jZWQT9gKfvD805Vljxw==
X-Google-Smtp-Source: AGHT+IHuYaoZkvQka603lwunTyfYYS1GNixlL63EeZDX8dZuJ7nKrAaTL9PyKuw1CaVQQyEwJdzqG3uc5Wv5Ofuj
X-Received: from wmqa17.prod.google.com ([2002:a05:600c:3491:b0:434:fa72:f1bf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f06:b0:436:6160:5b81 with SMTP id 5b1f17b1804b1-436e26b98d1mr21080765e9.14.1736336778060;
 Wed, 08 Jan 2025 03:46:18 -0800 (PST)
Date: Wed,  8 Jan 2025 11:45:32 +0000
In-Reply-To: <20250108114536.627715-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250108114536.627715-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250108114536.627715-9-vdonnefort@google.com>
Subject: [PATCH v2 08/12] KVM: arm64: Add clock for hyp tracefs
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
X-CRM114-CacheID: sfid-20250108_034619_946689_15465AE4 
X-CRM114-Status: GOOD (  24.98  )
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

Configure the hypervisor tracing clock before starting tracing. For
tracing purpose, the boot clock is interesting as it doesn't stop on
suspend. However, it is corrected on a regular basis, which implies we
need to re-evaluate it every once in a while.

Cc: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Christopher S. Hall <christopher.s.hall@intel.com>
Cc: Richard Cochran <richardcochran@gmail.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 0cf171eacd9b..81bae121a4fe 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -79,6 +79,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vcpu,
 	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
+	__KVM_HOST_SMCCC_FUNC___pkvm_update_clock_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_load_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_enable_tracing,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index a7c0c73af0e5..df17683a3b12 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -16,6 +16,7 @@ struct hyp_buffer_page {
 void *tracing_reserve_entry(unsigned long length);
 void tracing_commit_entry(void);
 
+void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
 int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size);
 void __pkvm_teardown_tracing(void);
 int __pkvm_enable_tracing(bool enable);
@@ -24,6 +25,8 @@ int __pkvm_swap_reader_tracing(unsigned int cpu);
 static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
 static inline void tracing_commit_entry(void) { }
 
+static inline
+void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
 static inline int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
 static inline void __pkvm_teardown_tracing(void) { }
 static inline int __pkvm_enable_tracing(bool enable) { return -ENODEV; }
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 35d3228632e7..89a76af342c8 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -379,6 +379,18 @@ static void handle___pkvm_teardown_vm(struct kvm_cpu_context *host_ctxt)
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
@@ -439,6 +451,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_init_vm),
 	HANDLE_FUNC(__pkvm_init_vcpu),
 	HANDLE_FUNC(__pkvm_teardown_vm),
+	HANDLE_FUNC(__pkvm_update_clock_tracing),
 	HANDLE_FUNC(__pkvm_load_tracing),
 	HANDLE_FUNC(__pkvm_teardown_tracing),
 	HANDLE_FUNC(__pkvm_enable_tracing),
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index debb3ee7dd3a..022fe2e24f82 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -468,6 +468,21 @@ static void rb_teardown_bpage_backing(void)
 	hyp_buffer_pages_backing.size = 0;
 }
 
+void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
+{
+	int cpu;
+
+	/* After this loop, all CPUs are observing the new bank... */
+	for (cpu = 0; cpu < hyp_nr_cpus; cpu++) {
+		struct hyp_rb_per_cpu *cpu_buffer = per_cpu_ptr(&trace_rb, cpu);
+
+		while (atomic_read(&cpu_buffer->status) == HYP_RB_WRITING);
+	}
+
+	/* ...we can now override the old one and swap. */
+	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
+}
+
 int __pkvm_swap_reader_tracing(unsigned int cpu)
 {
 	struct hyp_rb_per_cpu *cpu_buffer;
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index be5bc602abc4..78193dbd8a33 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -16,10 +16,33 @@
 
 #define RB_POLL_MS 100
 
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
 #define TRACEFS_DIR "hypervisor"
 #define TRACEFS_MODE_WRITE 0640
 #define TRACEFS_MODE_READ 0440
 
+struct hyp_trace_clock {
+	u64			cycles;
+	u64			cyc_overflow64;
+	u64			boot;
+	u32			mult;
+	u32			shift;
+	struct delayed_work	work;
+	struct completion	ready;
+};
+
 static struct hyp_trace_buffer {
 	struct hyp_trace_desc		*desc;
 	struct ring_buffer_remote	remote;
@@ -28,6 +51,7 @@ static struct hyp_trace_buffer {
 	bool				tracing_on;
 	int				nr_readers;
 	struct mutex			lock;
+	struct hyp_trace_clock		clock;
 } hyp_trace_buffer = {
 	.lock		= __MUTEX_INITIALIZER(hyp_trace_buffer.lock),
 };
@@ -74,6 +98,109 @@ bpage_backing_free(struct hyp_buffer_pages_backing *bpage_backing)
 	free_pages_exact((void *)bpage_backing->start, bpage_backing->size);
 }
 
+static void __hyp_clock_work(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct hyp_trace_buffer *hyp_buffer;
+	struct hyp_trace_clock *hyp_clock;
+	struct system_time_snapshot snap;
+	u64 rate, delta_cycles;
+	u64 boot, delta_boot;
+
+	hyp_clock = container_of(dwork, struct hyp_trace_clock, work);
+	hyp_buffer = container_of(hyp_clock, struct hyp_trace_buffer, clock);
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
+		if (hyp_buffer->tracing_on && err > NSEC_PER_USEC)
+			pr_warn_ratelimited("hyp trace clock off by %lluus\n",
+					    err / NSEC_PER_USEC);
+	}
+
+	if (delta_boot > U32_MAX) {
+		do_div(delta_boot, NSEC_PER_SEC);
+		rate = delta_cycles;
+	} else {
+		rate = delta_cycles * NSEC_PER_SEC;
+	}
+	rate = div64_u64(rate, delta_boot);
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
+static void hyp_clock_start(struct hyp_trace_buffer *hyp_buffer)
+{
+	struct hyp_trace_clock *hyp_clock = &hyp_buffer->clock;
+	struct system_time_snapshot snap;
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
+}
+
+static void hyp_clock_stop(struct hyp_trace_buffer *hyp_buffer)
+{
+	struct hyp_trace_clock *hyp_clock = &hyp_buffer->clock;
+
+	cancel_delayed_work_sync(&hyp_clock->work);
+}
+
+static void hyp_clock_wait(struct hyp_trace_buffer *hyp_buffer)
+{
+	struct hyp_trace_clock *hyp_clock = &hyp_buffer->clock;
+
+	wait_for_completion(&hyp_clock->ready);
+}
+
 static int __get_reader_page(int cpu)
 {
 	return kvm_call_hyp_nvhe(__pkvm_swap_reader_tracing, cpu);
@@ -294,10 +421,14 @@ static int hyp_trace_start(void)
 	if (hyp_buffer->tracing_on)
 		goto out;
 
+	hyp_clock_start(hyp_buffer);
+
 	ret = hyp_trace_buffer_load(hyp_buffer, hyp_trace_buffer_size);
 	if (ret)
 		goto out;
 
+	hyp_clock_wait(hyp_buffer);
+
 	ret = kvm_call_hyp_nvhe(__pkvm_enable_tracing, true);
 	if (ret) {
 		hyp_trace_buffer_teardown(hyp_buffer);
@@ -307,6 +438,9 @@ static int hyp_trace_start(void)
 	hyp_buffer->tracing_on = true;
 
 out:
+	if (!hyp_buffer->tracing_on)
+		hyp_clock_stop(hyp_buffer);
+
 	mutex_unlock(&hyp_buffer->lock);
 
 	return ret;
@@ -326,6 +460,7 @@ static void hyp_trace_stop(void)
 	if (!ret) {
 		ring_buffer_poll_remote(hyp_buffer->trace_buffer,
 					RING_BUFFER_ALL_CPUS);
+		hyp_clock_stop(hyp_buffer);
 		hyp_buffer->tracing_on = false;
 		hyp_trace_buffer_teardown(hyp_buffer);
 	}
@@ -614,6 +749,14 @@ static const struct file_operations hyp_trace_pipe_fops = {
 	.release        = hyp_trace_pipe_release,
 };
 
+static int hyp_trace_clock_show(struct seq_file *m, void *v)
+{
+	seq_puts(m, "[boot]\n");
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(hyp_trace_clock);
+
 int hyp_trace_init_tracefs(void)
 {
 	struct dentry *root, *per_cpu_root;
@@ -638,6 +781,9 @@ int hyp_trace_init_tracefs(void)
 	tracefs_create_file("trace_pipe", TRACEFS_MODE_WRITE, root,
 			    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_pipe_fops);
 
+	tracefs_create_file("trace_clock", TRACEFS_MODE_READ, root, NULL,
+			    &hyp_trace_clock_fops);
+
 	per_cpu_root = tracefs_create_dir("per_cpu", root);
 	if (!per_cpu_root) {
 		pr_err("Failed to create tracefs folder "TRACEFS_DIR"/per_cpu/\n");
-- 
2.47.1.613.gc27f4b7a9f-goog


