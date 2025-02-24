Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E62C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FagIlwvy2X9P44Nj2FCz/VtczZ4pRRHPPhhjGlScn4=; b=0hFvLyQ98MjHx+X4rg7iUstPcL
	85fAtVR36w84JC5RlGGiZ8gHmSNGM5tygOcQHiXCqYTykTfTkyQCebPdVQKDEA+tgyKFH8ayC/1T4
	pWctye9Nbc8YfpkMDRFw2cTz7Sn8gi7VbqUJefr6z8wm5YLfGVZjfJkzzOYD0n02zt2wU/s7Ti0vC
	jfgwADkyHI3wz5ZMfZ0oP5gGDqYOzWISbRPK9VhdVq/OY7u04vm2ey1i3LAa5q91piP39PFHVFmQ/
	TFwME61Nhk5UXn8EUcRPgo+FoMT0x4nV5yW4epgOb0bTTAEkqKvKuES51ay66hCumfpYuQ+LfvDEv
	I63Hjk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHT-0000000DnBG-1eTV;
	Mon, 24 Feb 2025 13:13:55 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXNA-0000000DeSp-1GnO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:15:45 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-38f394f6d84so3772005f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 04:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740399342; x=1741004142; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7FagIlwvy2X9P44Nj2FCz/VtczZ4pRRHPPhhjGlScn4=;
        b=fdwK5lsfJWYiGS7VNDx8Zj7rIWS9ZP3Nri94ylCBVGL8JNF0V7+aoK9IUlQV/ZFHr/
         R9G2wdBaFgU1ueaS6c2viC9WmRRA0qHCY/xb8s00atuoBaYmeIIJzAXDygiqrqs9Nvdk
         E52m9pYWSGbui0gZJgACKMf274Fzsnd8t3KnO6aXve4IE1Io1sexMY+/1/wZvvgaBhEm
         eupr2t2hDg/ApJol2Dbcuy5DWmYJ1z4sJpANa/QyWJKJNk37984s3aTDHulol5HxKZra
         oI9+6KixYNORZ57VWDbeQbMNw+OO4jmhlqtV/TEOHO1zVPdC9MADqSSckAIA4j3UlGOg
         T3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740399342; x=1741004142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FagIlwvy2X9P44Nj2FCz/VtczZ4pRRHPPhhjGlScn4=;
        b=v6T546j9OA9+uoQuYZvY5mljxjDEhaRo+7T0m7MvaGp28Bv41EELrVgmm9Rz9iH8ZL
         NbKrYAwwcPWxLJDSpjRMsQBacaMTtyPuR6r4QQl8Qv+pn6DCF72Ewga9KmgrJYWeSCM+
         JIeZE79bD1gjX9F0JQgxCF8c/WT4l9U6jmfaJpsXrGqW4IM6kF2GjLYkkIa40AoI0EM5
         bFF9hZdhNsElWWROktrLmWN6zJUkg4KE0FWKGcnFs34Omat7I5i3oU/yz0TzVaT0qEwu
         KgLNZFJB+KuxxZYyzUbNQs16zA21S3p1zK18YSi75I727mV7vdHaqKFJ62AuMydeJ+1K
         Zd+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/WGuh1gBFJORAVbt+J5lh8Kh8+FJkwDOZsZDSAO+sNFQV694Oi2L7ZSJbEzwTT8k1hXbRBmYVztETmJ5TDxMh@lists.infradead.org
X-Gm-Message-State: AOJu0YwhGhDYa2TiE44EWR8myadEyKt9c+jHKA9ZYmER/n6luyjyHQv5
	GCUMP1gGDqEoCjS91DKzBCqNe7DliDsPDJVFlnNpxbZ5rJHLcupED4KtcVKT1IJJX4/S2OTtLFQ
	Ny2J+xeVH0thgbkBl/Q==
X-Google-Smtp-Source: AGHT+IEfGb128a2DZBA8iW3Df9rmq3CoqidzScBKQXE2CAExXpW8soetaBJWs+nYkO8TCElzGRor5RI3Vx2qFvd6
X-Received: from wrbgx18.prod.google.com ([2002:a05:6000:4712:b0:38f:478d:618d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:45c5:0:b0:38d:e0be:71a3 with SMTP id ffacd0b85a97d-38f708593a9mr7968419f8f.54.1740399342646;
 Mon, 24 Feb 2025 04:15:42 -0800 (PST)
Date: Mon, 24 Feb 2025 12:13:51 +0000
In-Reply-To: <20250224121353.98697-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250224121353.98697-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224121353.98697-10-vdonnefort@google.com>
Subject: [PATCH 09/11] KVM: arm64: Add trace interface for hyp tracefs
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
X-CRM114-CacheID: sfid-20250224_041544_344831_DD6A1AA1 
X-CRM114-Status: GOOD (  15.72  )
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
index 87d3e0e73b68..74f10847a55e 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -91,6 +91,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_load_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_enable_tracing,
+	__KVM_HOST_SMCCC_FUNC___pkvm_reset_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_swap_reader_tracing,
 };
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index 6f1cc571b47a..28bbb54b7a0b 100644
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
index a8b497b22407..e2419c97c57d 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -605,6 +605,13 @@ static void handle___pkvm_enable_tracing(struct kvm_cpu_context *host_ctxt)
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
@@ -655,6 +662,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_load_tracing),
 	HANDLE_FUNC(__pkvm_teardown_tracing),
 	HANDLE_FUNC(__pkvm_enable_tracing),
+	HANDLE_FUNC(__pkvm_reset_tracing),
 	HANDLE_FUNC(__pkvm_swap_reader_tracing),
 };
 
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index d79b6539377e..bf935645ed91 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -262,7 +262,7 @@ void tracing_commit_entry(void)
 	smp_store_release(&cpu_buffer->status, HYP_RB_READY);
 }
 
-static void hyp_rb_disable_writing(struct hyp_rb_per_cpu *cpu_buffer)
+static u32 hyp_rb_disable_writing(struct hyp_rb_per_cpu *cpu_buffer)
 {
 	u32 prev_status;
 
@@ -272,6 +272,8 @@ static void hyp_rb_disable_writing(struct hyp_rb_per_cpu *cpu_buffer)
 					      HYP_RB_READY,
 					      HYP_RB_UNAVAILABLE);
 	} while (prev_status == HYP_RB_WRITING);
+
+	return prev_status;
 }
 
 static int hyp_rb_enable_writing(struct hyp_rb_per_cpu *cpu_buffer)
@@ -284,6 +286,44 @@ static int hyp_rb_enable_writing(struct hyp_rb_per_cpu *cpu_buffer)
 	return 0;
 }
 
+static int hyp_rb_reset(struct hyp_rb_per_cpu *cpu_buffer)
+{
+	struct hyp_buffer_page *bpage;
+	u32 prev_status;
+
+	if (!hyp_rb_loaded(cpu_buffer))
+		return -ENODEV;
+
+	prev_status = hyp_rb_disable_writing(cpu_buffer);
+
+	while (!hyp_bpage_is_head(cpu_buffer->head_page))
+		cpu_buffer->head_page = hyp_bpage_next_page(cpu_buffer->head_page);
+
+	bpage = cpu_buffer->tail_page = cpu_buffer->head_page;
+	do {
+		hyp_bpage_reset(bpage);
+		bpage = hyp_bpage_next_page(bpage);
+	} while (bpage != cpu_buffer->head_page);
+
+	hyp_bpage_reset(cpu_buffer->reader_page);
+
+	cpu_buffer->last_overrun = 0;
+	cpu_buffer->write_stamp = 0;
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
+		hyp_rb_enable_writing(cpu_buffer);
+
+	return 0;
+}
+
 static void hyp_rb_teardown(struct hyp_rb_per_cpu *cpu_buffer)
 {
 	int i;
@@ -572,3 +612,17 @@ int __pkvm_enable_tracing(bool enable)
 
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
+	ret = hyp_rb_reset(per_cpu_ptr(&trace_rb, cpu));
+	hyp_spin_unlock(&trace_rb_lock);
+
+	return ret;
+}
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 38d97e34eada..03a6813cbe66 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -200,6 +200,11 @@ static int __get_reader_page(int cpu)
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
@@ -361,6 +366,7 @@ static int hyp_trace_buffer_load(struct hyp_trace_buffer *hyp_buffer, size_t siz
 
 	hyp_buffer->remote.pdesc = &desc->page_desc;
 	hyp_buffer->remote.get_reader_page = __get_reader_page;
+	hyp_buffer->remote.reset = __reset;
 	hyp_buffer->trace_buffer = ring_buffer_remote(&hyp_buffer->remote);
 	if (!hyp_buffer->trace_buffer) {
 		ret = -ENOMEM;
@@ -825,6 +831,49 @@ static const struct file_operations hyp_trace_raw_fops = {
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
@@ -857,6 +906,9 @@ int hyp_trace_init_tracefs(void)
 	tracefs_create_file("trace_pipe", TRACEFS_MODE_WRITE, root,
 			    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_pipe_fops);
 
+	tracefs_create_file("trace", TRACEFS_MODE_WRITE, root,
+			    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_fops);
+
 	tracefs_create_file("trace_clock", TRACEFS_MODE_READ, root, NULL,
 			    &hyp_trace_clock_fops);
 
@@ -882,6 +934,9 @@ int hyp_trace_init_tracefs(void)
 
 		tracefs_create_file("trace_pipe_raw", TRACEFS_MODE_READ, per_cpu_dir,
 				    (void *)cpu, &hyp_trace_pipe_fops);
+
+		tracefs_create_file("trace", TRACEFS_MODE_READ, per_cpu_dir,
+				    (void *)cpu, &hyp_trace_fops);
 	}
 
 	return 0;
-- 
2.48.1.601.g30ceb7b040-goog


