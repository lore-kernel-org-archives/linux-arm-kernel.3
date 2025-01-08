Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C819E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYv/oyiC5/y4Vd4A/vxnaQNzTH0rGNzt4KNFjScWdGU=; b=fxDMDbgP40iUt+Wu47mcsld7k0
	/Am1Td6J87IgzckSaMyK0kzCFTXZJocsVmHaLm2XXXYkdJBAYU6mTJqNcYOg9HYBDqaICMhaosvcm
	7j9/Sr/shZKq83BolH/Xxix6Rz2CIKPN+4/Q8G5wojiAHf2en5/L2YxPn8El/alYIld6LGr/Yeg45
	N3/b978kl6aBcujgX1Qec+trc1WBJLtfF5qOfG88jvUSdqjIjaDsLujd2+7NXWXEG7AD/hYCIrttr
	tR9ph4l453oUGgu7JuaE3c0qL9frL5eiadDnytsHLGdSDiT1OCUf+sS/HC67P05jrjBDexnDsX8fO
	B5zWxmKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVBB-00000008Qpn-4Be7;
	Wed, 08 Jan 2025 12:28:58 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUW0-00000008H5y-16qR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:46:25 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361ac8b25fso91455855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 03:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736336782; x=1736941582; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CYv/oyiC5/y4Vd4A/vxnaQNzTH0rGNzt4KNFjScWdGU=;
        b=LoAHA/67SFKGsQAsOhG6rDjy0R+8Pu2MdhruAxu9y/vYCE/hXL0BxYcgKkHp4z61lf
         65KJilYp/RE5zTkwovn3Juv41H0Aqf3WZkOlCM4sHKx/q7LZCYboyMjKbCEFRpo/+pej
         P2pAgD4TU1QJcjPy3GbLMRHooPg+xjMqDyL1AwhxQLOzS8l2JbXPR5MmzvwQY12p4WoE
         ukrMnMg2EJXFqsbsFCMt14VsNoZRLhc3mwe7oE3W7ZF9vhxwKMd4nYIrpSbWASy3/q2O
         DfRUS29tqtGfxXIpJ0Iz7BSpNQclUIEgTC8RBAboDGAYW9kX0L7q30Ov2OAzpAvuoYC4
         49gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336782; x=1736941582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYv/oyiC5/y4Vd4A/vxnaQNzTH0rGNzt4KNFjScWdGU=;
        b=GPGMB4E/daB4+Xj3JmTFCeM9KBIKOwAd902bPMdCTPzgwTl9CDU7/mFACWN+p/oEgi
         mjdZKWS+QR6oACS0Geyi7PCBZUA8JhTP6ruBUmsftFHO6BAwm8LjXHi/4x0ZWQEvDLSC
         lhQiJjeTpfy3KXvZjvmd5aiTEYyGq89I3t05Rk5ew2JigP99u8/+a4UKyoPnbpnbVUgB
         HFFJ2rozF9rmfOBZxnO3Uzfg9r0ZIzmjMTGc6m1mCSiQHg38V6iulQWTRwNA0jTYeez7
         zQxDeFt1uFAZp8yckBJ7+m/6cgOSsZ4IkwJM/gm/x84DlrjC+nAVOEr4o7h1YEymjba/
         PkGg==
X-Forwarded-Encrypted: i=1; AJvYcCWwvUgarnj/24FmIBr5+UJq7zkh9r6MA/Ixa2M3P4Oe3+Toj4VuvTUEYndZTb8ga8HWaMHvHa1KoQ+NGCyJwQAu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2yeODOlylrXLB9Lq2yUa51RNW6a099tgnZytFAhqnR9hTOJWf
	HDe1VA2/mYflCPuh8AUC7kWSN0xyhYZ9A4lhrTss/jx6iBTGb9YqCUrbVumZsC1vJFFbomQJby2
	LTrd00H+Y7gtj0uZQAQ==
X-Google-Smtp-Source: AGHT+IG3P/WI6G15aNJhYiqZ/XaORqWTLtGoyKDDxxx8JTZF55g/rJW5XOa81KdseVNGpa4acQA3UBIs69MjbhFm
X-Received: from wmqb11.prod.google.com ([2002:a05:600c:4e0b:b0:434:f621:ac8a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1386:b0:434:f8e5:1bb with SMTP id 5b1f17b1804b1-436e26aeb43mr20489325e9.12.1736336782317;
 Wed, 08 Jan 2025 03:46:22 -0800 (PST)
Date: Wed,  8 Jan 2025 11:45:34 +0000
In-Reply-To: <20250108114536.627715-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250108114536.627715-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250108114536.627715-11-vdonnefort@google.com>
Subject: [PATCH v2 10/12] KVM: arm64: Add trace interface for hyp tracefs
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_034624_312448_72015AE8 
X-CRM114-Status: GOOD (  15.63  )
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

The trace interface is solely here to reset tracing. Non-consuming read
is not yet supported due to the lack of support in the ring-buffer
meta page.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 81bae121a4fe..08b6a021b84e 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -83,6 +83,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_load_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_enable_tracing,
+	__KVM_HOST_SMCCC_FUNC___pkvm_reset_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_swap_reader_tracing,
 };
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index df17683a3b12..1004e1edf24f 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -20,6 +20,7 @@ void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cy
 int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size);
 void __pkvm_teardown_tracing(void);
 int __pkvm_enable_tracing(bool enable);
+int __pkvm_reset_tracing(unsigned int cpu);
 int __pkvm_swap_reader_tracing(unsigned int cpu);
 #else
 static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
@@ -30,6 +31,7 @@ void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cy
 static inline int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
 static inline void __pkvm_teardown_tracing(void) { }
 static inline int __pkvm_enable_tracing(bool enable) { return -ENODEV; }
+static inline int __pkvm_reset_tracing(unsigned int cpu) { return -ENODEV; }
 static inline int __pkvm_swap_reader_tracing(unsigned int cpu) { return -ENODEV; }
 #endif
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 89a76af342c8..a69c95e1f5e2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -413,6 +413,13 @@ static void handle___pkvm_enable_tracing(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_enable_tracing(enable);
 }
 
+static void handle___pkvm_reset_tracing(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(unsigned int, cpu, host_ctxt, 1);
+
+	cpu_reg(host_ctxt, 1) = __pkvm_reset_tracing(cpu);
+}
+
 static void handle___pkvm_swap_reader_tracing(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(unsigned int, cpu, host_ctxt, 1);
@@ -455,6 +462,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_load_tracing),
 	HANDLE_FUNC(__pkvm_teardown_tracing),
 	HANDLE_FUNC(__pkvm_enable_tracing),
+	HANDLE_FUNC(__pkvm_reset_tracing),
 	HANDLE_FUNC(__pkvm_swap_reader_tracing),
 };
 
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 022fe2e24f82..6ea0f1d475bb 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -284,12 +284,20 @@ static int rb_page_init(struct hyp_buffer_page *bpage, unsigned long hva)
 	return 0;
 }
 
+static void rb_page_reset(struct hyp_buffer_page *bpage)
+{
+	bpage->write = 0;
+	bpage->entries = 0;
+
+	local_set(&bpage->page->commit, 0);
+}
+
 static bool rb_cpu_loaded(struct hyp_rb_per_cpu *cpu_buffer)
 {
 	return !!cpu_buffer->bpages;
 }
 
-static void rb_cpu_disable_writing(struct hyp_rb_per_cpu *cpu_buffer)
+static int rb_cpu_disable_writing(struct hyp_rb_per_cpu *cpu_buffer)
 {
 	int prev_status;
 
@@ -299,6 +307,8 @@ static void rb_cpu_disable_writing(struct hyp_rb_per_cpu *cpu_buffer)
 						     HYP_RB_READY,
 						     HYP_RB_UNAVAILABLE);
 	} while (prev_status == HYP_RB_WRITING);
+
+	return prev_status;
 }
 
 static int rb_cpu_enable_writing(struct hyp_rb_per_cpu *cpu_buffer)
@@ -311,6 +321,38 @@ static int rb_cpu_enable_writing(struct hyp_rb_per_cpu *cpu_buffer)
 	return 0;
 }
 
+static int rb_cpu_reset(struct hyp_rb_per_cpu *cpu_buffer)
+{
+	struct hyp_buffer_page *bpage;
+	int prev_status;
+
+	if (!rb_cpu_loaded(cpu_buffer))
+		return -ENODEV;
+
+	prev_status = rb_cpu_disable_writing(cpu_buffer);
+
+	bpage = cpu_buffer->head_page;
+	do {
+		rb_page_reset(bpage);
+		bpage = rb_next_page(bpage);
+	} while (bpage != cpu_buffer->head_page);
+
+	rb_page_reset(cpu_buffer->reader_page);
+
+	cpu_buffer->meta->reader.read = 0;
+	cpu_buffer->meta->reader.lost_events = 0;
+	cpu_buffer->meta->entries = 0;
+	cpu_buffer->meta->overrun = 0;
+	cpu_buffer->meta->read = 0;
+	meta_pages_lost(cpu_buffer->meta) = 0;
+	meta_pages_touched(cpu_buffer->meta) = 0;
+
+	if (prev_status == HYP_RB_READY)
+		rb_cpu_enable_writing(cpu_buffer);
+
+	return 0;
+}
+
 static void rb_cpu_teardown(struct hyp_rb_per_cpu *cpu_buffer)
 {
 	int i;
@@ -602,3 +644,17 @@ int __pkvm_enable_tracing(bool enable)
 
 	return ret;
 }
+
+int __pkvm_reset_tracing(unsigned int cpu)
+{
+	int ret = 0;
+
+	if (cpu >= hyp_nr_cpus)
+		return -EINVAL;
+
+	hyp_spin_lock(&trace_rb_lock);
+	ret = rb_cpu_reset(per_cpu_ptr(&trace_rb, cpu));
+	hyp_spin_unlock(&trace_rb_lock);
+
+	return ret;
+}
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 3d2a58977442..7c9548bef8f8 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -206,6 +206,11 @@ static int __get_reader_page(int cpu)
 	return kvm_call_hyp_nvhe(__pkvm_swap_reader_tracing, cpu);
 }
 
+static int __reset(int cpu)
+{
+	return kvm_call_hyp_nvhe(__pkvm_reset_tracing, cpu);
+}
+
 static void hyp_trace_free_pages(struct hyp_trace_desc *desc)
 {
 	struct rb_page_desc *rb_desc;
@@ -364,6 +369,7 @@ static int hyp_trace_buffer_load(struct hyp_trace_buffer *hyp_buffer, size_t siz
 
 	hyp_buffer->remote.pdesc = &desc->page_desc;
 	hyp_buffer->remote.get_reader_page = __get_reader_page;
+	hyp_buffer->remote.reset = __reset;
 	hyp_buffer->trace_buffer = ring_buffer_remote(&hyp_buffer->remote);
 	if (!hyp_buffer->trace_buffer) {
 		ret = -ENOMEM;
@@ -828,6 +834,49 @@ static const struct file_operations hyp_trace_raw_fops = {
 	.release        = hyp_trace_raw_release,
 };
 
+static void hyp_trace_reset(int cpu)
+{
+	struct hyp_trace_buffer *hyp_buffer = &hyp_trace_buffer;
+
+	mutex_lock(&hyp_buffer->lock);
+
+	if (!hyp_trace_buffer_loaded(hyp_buffer))
+		goto out;
+
+	if (cpu == RING_BUFFER_ALL_CPUS)
+		ring_buffer_reset(hyp_buffer->trace_buffer);
+	else
+		ring_buffer_reset_cpu(hyp_buffer->trace_buffer, cpu);
+
+out:
+	mutex_unlock(&hyp_buffer->lock);
+}
+
+static int hyp_trace_open(struct inode *inode, struct file *file)
+{
+	int cpu = (s64)inode->i_private;
+
+	if (file->f_mode & FMODE_WRITE) {
+		hyp_trace_reset(cpu);
+
+		return 0;
+	}
+
+	return -EPERM;
+}
+
+static ssize_t hyp_trace_write(struct file *filp, const char __user *ubuf,
+			       size_t count, loff_t *ppos)
+{
+	return count;
+}
+
+static const struct file_operations hyp_trace_fops = {
+	.open           = hyp_trace_open,
+	.write          = hyp_trace_write,
+	.release        = NULL,
+};
+
 static int hyp_trace_clock_show(struct seq_file *m, void *v)
 {
 	seq_puts(m, "[boot]\n");
@@ -860,6 +909,9 @@ int hyp_trace_init_tracefs(void)
 	tracefs_create_file("trace_pipe", TRACEFS_MODE_WRITE, root,
 			    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_pipe_fops);
 
+	tracefs_create_file("trace", TRACEFS_MODE_WRITE, root,
+			    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_fops);
+
 	tracefs_create_file("trace_clock", TRACEFS_MODE_READ, root, NULL,
 			    &hyp_trace_clock_fops);
 
@@ -885,6 +937,9 @@ int hyp_trace_init_tracefs(void)
 
 		tracefs_create_file("trace_pipe_raw", TRACEFS_MODE_READ, per_cpu_dir,
 				    (void *)cpu, &hyp_trace_pipe_fops);
+
+		tracefs_create_file("trace", TRACEFS_MODE_READ, per_cpu_dir,
+				    (void *)cpu, &hyp_trace_fops);
 	}
 
 	return 0;
-- 
2.47.1.613.gc27f4b7a9f-goog


