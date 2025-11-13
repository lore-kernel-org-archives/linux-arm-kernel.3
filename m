Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B574CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiwACUjLv1Ah3ZsK/zWQ5OhRX7IKibGJ9/5LXUDaW8E=; b=jCRjwtIX4P1lgW0gOpuC4oppMS
	xZ3xmQHBCsW29NFXntB3V7AMHWKhF3ly3j73jZuFurI+DTFmOhAKsrtRUMi8//+zzbjF9uNl0z0xI
	0qH4jnVmfX4z9EbbUCKEjhFffe/hduAdd5z0LLM2NY0WbQ+xkfz46RX1R0DQGcgdBGiybZySFHJdl
	V77EkENqly3PWiObA505zISs/H8ixvi+7OzwiovIe3qMj2ikFiEFbDhcutXCZ6rlZbNZgGwVb8Mfj
	ZlrL4PsU+GKqq3upCgp21WYIqxucxxN3u5vySDn3tZ9xMkdJdfkZScHA8Myo6hMFKq44nr+R2p6dE
	1Nx7NyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWcX-0000000AU1I-178Q;
	Thu, 13 Nov 2025 12:40:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWcV-0000000AU0c-3BGM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 12:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A45466021D;
	Thu, 13 Nov 2025 12:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94666C2BCB1;
	Thu, 13 Nov 2025 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763037608;
	bh=V8rBOjZtmXBB00DGUlrm6sAahh/cFbuz8mzbSTjRzGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jSO5ic0R/xIUoJCmsp0tUZM/yX21oAUjRG+MQ+WQ8qVm8kEI3EnBmX9nh5jMAhhZO
	 Fs3tRs2SgF/gkbJALZLhEE2eExORaLi/N7T+oy+FuahFufWx7WGV4NPNkn5hZdFccD
	 vpWeeO80GCioi/stn0dhV5mdCChcPpB94V9cixQf5zrHzZ4pC9vwiLrgQWWoS/Z3gi
	 B/MjZkXXmc6kSvagpE58Ly8I4LRrjpeRQdrz8d5tQAHwVGC5+kpQyYXfZaOv/yyFNw
	 RYKiX5IULET3BrTZXbthSRyjWC+7cHhrFGxKPVPIobGtISb3PndrDhLnZ1L+u39ZRu
	 2t1lF3DfwXLdQ==
From: Jiri Olsa <jolsa@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: [PATCHv2 bpf-next 8/8] bpf, x86: Use single ftrace_ops for direct calls
Date: Thu, 13 Nov 2025 13:37:50 +0100
Message-ID: <20251113123750.2507435-9-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113123750.2507435-1-jolsa@kernel.org>
References: <20251113123750.2507435-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Using single ftrace_ops for direct calls update instead of allocating
ftrace_ops object for each trampoline.

With single ftrace_ops object we can use update_ftrace_direct_* api
that allows multiple ip sites updates on single ftrace_ops object.

Adding HAVE_SINGLE_FTRACE_DIRECT_OPS config option to be enabled on
each arch that supports this.

At the moment we can enable this only on x86 arch, because arm relies
on ftrace_ops object representing just single trampoline image (stored
in ftrace_ops::direct_call). Ach that do not support this will continue
to use *_ftrace_direct api.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 arch/x86/Kconfig        |   1 +
 kernel/bpf/trampoline.c | 166 ++++++++++++++++++++++++++++++++++++----
 kernel/trace/Kconfig    |   3 +
 kernel/trace/ftrace.c   |   7 +-
 4 files changed, 160 insertions(+), 17 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fa3b616af03a..65a2fc279b46 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -332,6 +332,7 @@ config X86
 	select SCHED_SMT			if SMP
 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
 	select ARCH_SUPPORTS_SCHED_MC		if SMP
+	select HAVE_SINGLE_FTRACE_DIRECT_OPS	if X86_64 && DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 
 config INSTRUCTION_DECODER
 	def_bool y
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 26887a0db955..436d393591a5 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -33,12 +33,40 @@ static DEFINE_MUTEX(trampoline_mutex);
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex);
 
+#ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
+static struct bpf_trampoline *direct_ops_ip_lookup(struct ftrace_ops *ops, unsigned long ip)
+{
+	struct hlist_head *head_ip;
+	struct bpf_trampoline *tr;
+
+	mutex_lock(&trampoline_mutex);
+	head_ip = &trampoline_ip_table[hash_64(ip, TRAMPOLINE_HASH_BITS)];
+	hlist_for_each_entry(tr, head_ip, hlist_ip) {
+		if (tr->ip == ip)
+			goto out;
+	}
+	tr = NULL;
+out:
+	mutex_unlock(&trampoline_mutex);
+	return tr;
+}
+#else
+static struct bpf_trampoline *direct_ops_ip_lookup(struct ftrace_ops *ops, unsigned long ip)
+{
+	return ops->private;
+}
+#endif /* CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS */
+
 static int bpf_tramp_ftrace_ops_func(struct ftrace_ops *ops, unsigned long ip,
 				     enum ftrace_ops_cmd cmd)
 {
-	struct bpf_trampoline *tr = ops->private;
+	struct bpf_trampoline *tr;
 	int ret = 0;
 
+	tr = direct_ops_ip_lookup(ops, ip);
+	if (!tr)
+		return -EINVAL;
+
 	if (cmd == FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF) {
 		/* This is called inside register_ftrace_direct_multi(), so
 		 * tr->mutex is already locked.
@@ -137,6 +165,122 @@ void bpf_image_ksym_del(struct bpf_ksym *ksym)
 			   PAGE_SIZE, true, ksym->name);
 }
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+#ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
+/*
+ * We have only single direct_ops which contains all the direct call
+ * sites and is the only global ftrace_ops for all trampolines.
+ *
+ * We use 'update_ftrace_direct_*' api for attachment.
+ */
+struct ftrace_ops direct_ops = {
+	.ops_func = bpf_tramp_ftrace_ops_func,
+};
+
+static int direct_ops_alloc(struct bpf_trampoline *tr)
+{
+	tr->fops = &direct_ops;
+	return 0;
+}
+
+static void direct_ops_free(struct bpf_trampoline *tr) { }
+
+static struct ftrace_hash *hash_from(unsigned long ip, void *addr)
+{
+	struct ftrace_hash *hash;
+
+	ip = ftrace_location(ip);
+	if (!ip)
+		return NULL;
+	hash = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
+	if (!hash)
+		return NULL;
+	if (!add_hash_entry_direct(hash, ip, (unsigned long) addr)) {
+		free_ftrace_hash(hash);
+		return NULL;
+	}
+	return hash;
+}
+
+static int direct_ops_add(struct ftrace_ops *ops, unsigned long ip, void *addr)
+{
+	struct ftrace_hash *hash = hash_from(ip, addr);
+	int err = -ENOMEM;
+
+	if (hash)
+		err = update_ftrace_direct_add(ops, hash);
+	free_ftrace_hash(hash);
+	return err;
+}
+
+static int direct_ops_del(struct ftrace_ops *ops, unsigned long ip, void *addr)
+{
+	struct ftrace_hash *hash = hash_from(ip, addr);
+	int err = -ENOMEM;
+
+	if (hash)
+		err = update_ftrace_direct_del(ops, hash);
+	free_ftrace_hash(hash);
+	return err;
+}
+
+static int direct_ops_mod(struct ftrace_ops *ops, unsigned long ip, void *addr, bool lock_direct_mutex)
+{
+	struct ftrace_hash *hash = hash_from(ip, addr);
+	int err = -ENOMEM;
+
+	if (hash)
+		err = update_ftrace_direct_mod(ops, hash, lock_direct_mutex);
+	free_ftrace_hash(hash);
+	return err;
+}
+#else
+/*
+ * We allocate ftrace_ops object for each trampoline and it contains
+ * call site specific for that trampoline.
+ *
+ * We use *_ftrace_direct api for attachment.
+ */
+static int direct_ops_alloc(struct bpf_trampoline *tr)
+{
+	tr->fops = kzalloc(sizeof(struct ftrace_ops), GFP_KERNEL);
+	if (!tr->fops)
+		return -ENOMEM;
+	tr->fops->private = tr;
+	tr->fops->ops_func = bpf_tramp_ftrace_ops_func;
+	return 0;
+}
+
+static void direct_ops_free(struct bpf_trampoline *tr)
+{
+	if (tr->fops) {
+		ftrace_free_filter(tr->fops);
+		kfree(tr->fops);
+	}
+}
+
+static int direct_ops_add(struct ftrace_ops *ops, unsigned long ip, void *addr)
+{
+	ftrace_set_filter_ip(ops, (unsigned long)ip, 0, 1);
+	return register_ftrace_direct(ops, (long)addr);
+}
+
+static int direct_ops_del(struct ftrace_ops *ops, unsigned long ip, void *addr)
+{
+	return unregister_ftrace_direct(ops, (long)addr, false);
+}
+
+static int direct_ops_mod(struct ftrace_ops *ops, unsigned long ip, void *addr, bool lock_direct_mutex)
+{
+	if (lock_direct_mutex)
+		return modify_ftrace_direct(ops, (long)addr);
+	return modify_ftrace_direct_nolock(ops, (long)addr);
+}
+#endif /* CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS */
+#else
+static void direct_ops_free(struct bpf_trampoline *tr) { }
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
+
 static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
 {
 	struct bpf_trampoline *tr;
@@ -155,14 +299,11 @@ static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
 	if (!tr)
 		goto out;
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
-	tr->fops = kzalloc(sizeof(struct ftrace_ops), GFP_KERNEL);
-	if (!tr->fops) {
+	if (direct_ops_alloc(tr)) {
 		kfree(tr);
 		tr = NULL;
 		goto out;
 	}
-	tr->fops->private = tr;
-	tr->fops->ops_func = bpf_tramp_ftrace_ops_func;
 #endif
 
 	tr->key = key;
@@ -187,7 +328,7 @@ static int unregister_fentry(struct bpf_trampoline *tr, void *old_addr)
 	int ret;
 
 	if (tr->func.ftrace_managed)
-		ret = unregister_ftrace_direct(tr->fops, (long)old_addr, false);
+		ret = direct_ops_del(tr->fops, tr->ip, old_addr);
 	else
 		ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, old_addr, NULL);
 
@@ -201,10 +342,7 @@ static int modify_fentry(struct bpf_trampoline *tr, void *old_addr, void *new_ad
 	int ret;
 
 	if (tr->func.ftrace_managed) {
-		if (lock_direct_mutex)
-			ret = modify_ftrace_direct(tr->fops, (long)new_addr);
-		else
-			ret = modify_ftrace_direct_nolock(tr->fops, (long)new_addr);
+		ret = direct_ops_mod(tr->fops, tr->ip, new_addr, lock_direct_mutex);
 	} else {
 		ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, old_addr, new_addr);
 	}
@@ -226,8 +364,7 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
 	}
 
 	if (tr->func.ftrace_managed) {
-		ftrace_set_filter_ip(tr->fops, (unsigned long)ip, 0, 1);
-		ret = register_ftrace_direct(tr->fops, (long)new_addr);
+		ret = direct_ops_add(tr->fops, tr->ip, new_addr);
 	} else {
 		ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, NULL, new_addr);
 	}
@@ -863,10 +1000,7 @@ void bpf_trampoline_put(struct bpf_trampoline *tr)
 	 */
 	hlist_del(&tr->hlist_key);
 	hlist_del(&tr->hlist_ip);
-	if (tr->fops) {
-		ftrace_free_filter(tr->fops);
-		kfree(tr->fops);
-	}
+	direct_ops_free(tr);
 	kfree(tr);
 out:
 	mutex_unlock(&trampoline_mutex);
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index d2c79da81e4f..4bf5beb04a5b 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -50,6 +50,9 @@ config HAVE_DYNAMIC_FTRACE_WITH_REGS
 config HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	bool
 
+config HAVE_SINGLE_FTRACE_DIRECT_OPS
+	bool
+
 config HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
 	bool
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 03948ec81434..e223fc196567 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2605,8 +2605,13 @@ unsigned long ftrace_find_rec_direct(unsigned long ip)
 static void call_direct_funcs(unsigned long ip, unsigned long pip,
 			      struct ftrace_ops *ops, struct ftrace_regs *fregs)
 {
-	unsigned long addr = READ_ONCE(ops->direct_call);
+	unsigned long addr;
 
+#ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
+	addr = ftrace_find_rec_direct(ip);
+#else
+	addr = READ_ONCE(ops->direct_call);
+#endif
 	if (!addr)
 		return;
 
-- 
2.51.1


