Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AC9CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 21:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEpkdPPsgBdgxp3M3WpvSReRHaWzNSA3BZdpysAd4Uo=; b=QK/vqfj5AH2PuMjg/80w5pDNs/
	SM0iucq/VCp+NW6nUC7deck3DoCThji/a9D197+cPlmmOHxCwlDKhJk3v7gLQkTpY8rLi13JpkFzM
	US59ztmDslce0Gp8H7ifTb6V2Dg+hZV2PjZ63CAEvwN2TtDQFYHwqRKMuJN+LUy6JEMNYD1K/Fz4W
	Icb9CUgmC1n6ZjrfdlftKjxVqEkSN+KelnkGKWsC1zdLOq3BA3hAY1YnAKIj6aAMY2/dfwaNiG69R
	ErjB10cu3CZdyy/LZDrmrpcz1vowq1Q2FeyXdojzXa38Dl+/KMGdD70Fq7RUZcHoNNwSz2IxNwzSH
	nq9GN6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ax8-0000000F1gf-10DE;
	Tue, 23 Sep 2025 21:53:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ax5-0000000F1fH-2gXG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 21:53:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53A8642BA8;
	Tue, 23 Sep 2025 21:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D072C4CEF5;
	Tue, 23 Sep 2025 21:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758664415;
	bh=43T9HLopp5TSSfaS/PpEBs04jnF5DnlAwLGcj6tvQ8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QFtdiphnN9U6PqfI4yB+FMCirtdRv+x4abZHcBByKq62QTC45K2gDopib2ulQNxDb
	 w+HUWaDby+yb+VNyzwN+0gQrESBnT43VpPMATSYgc1DbjLs7r+YgDnxeIg0K8xfDdv
	 pE5yM0R/CrUBYjye8s/9oNBEKYKWFdpsVUbaLuyWDfI3Tlq7DFt8sEn1o3fjG0psp3
	 gflVn+TR38Tu5VPU5U+AwKXvQgdmNeUpOpFhr6Sc+Rz8+LNVSSSN/pI76pqzXROjDb
	 YnuZUIIpmZMN4HAXlMmYj5gleREbbO7ujyhVDrMCjLTHukL9FRbMD9Y4w+gEWW5a/q
	 kqq2AXN8Lgi5w==
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
	Menglong Dong <menglong8.dong@gmail.com>
Subject: [PATCH 9/9] bpf, x86: Use single ftrace_ops for direct calls
Date: Tue, 23 Sep 2025 23:51:47 +0200
Message-ID: <20250923215147.1571952-10-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923215147.1571952-1-jolsa@kernel.org>
References: <20250923215147.1571952-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_145335_733216_40D1914D 
X-CRM114-Status: GOOD (  18.68  )
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
ftrace_ops obejct for each trampoline.

At the moment we can enable this only on x86 arch, because arm relies
on ftrace_ops object representing just single trampoline image (stored
in ftrace_ops::direct_call).

Adding HAVE_SINGLE_FTRACE_DIRECT_OPS config option to be enabled on
each arch that supports this.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 arch/x86/Kconfig        |  1 +
 kernel/bpf/trampoline.c | 85 +++++++++++++++++++++++++++++++++++------
 kernel/trace/Kconfig    |  3 ++
 kernel/trace/ftrace.c   | 15 +++++++-
 4 files changed, 92 insertions(+), 12 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 52c8910ba2ef..bfc9115baa6f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -330,6 +330,7 @@ config X86
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
 	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
+	select HAVE_SINGLE_FTRACE_DIRECT_OPS	if X86_64 && DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 
 config INSTRUCTION_DECODER
 	def_bool y
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 3464859189a2..e3b721773dfb 100644
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
+		if (tr->func.addr == (void *) ip)
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
@@ -137,6 +165,48 @@ void bpf_image_ksym_del(struct bpf_ksym *ksym)
 			   PAGE_SIZE, true, ksym->name);
 }
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+#ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
+struct ftrace_ops direct_ops = {
+       .ops_func = bpf_tramp_ftrace_ops_func,
+};
+
+static int direct_ops_get(struct bpf_trampoline *tr)
+{
+	tr->fops = &direct_ops;
+	return 0;
+}
+static void direct_ops_clear(struct bpf_trampoline *tr) { }
+static void direct_ops_free(struct bpf_trampoline *tr) { }
+#else
+static int direct_ops_get(struct bpf_trampoline *tr)
+{
+	tr->fops = kzalloc(sizeof(struct ftrace_ops), GFP_KERNEL);
+	if (!tr->fops)
+		return -1;
+	tr->fops->private = tr;
+	tr->fops->ops_func = bpf_tramp_ftrace_ops_func;
+	return 0;
+}
+
+static void direct_ops_clear(struct bpf_trampoline *tr)
+{
+	tr->fops->func = NULL;
+	tr->fops->trampoline = 0;
+}
+
+static void direct_ops_free(struct bpf_trampoline *tr)
+{
+	if (tr->fops) {
+		ftrace_free_filter(tr->fops);
+		kfree(tr->fops);
+	}
+}
+#endif /* CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS */
+#else
+static void direct_ops_free(struct bpf_trampoline *tr) { }
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
+
 static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
 {
 	struct bpf_trampoline *tr;
@@ -155,14 +225,11 @@ static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
 	if (!tr)
 		goto out;
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
-	tr->fops = kzalloc(sizeof(struct ftrace_ops), GFP_KERNEL);
-	if (!tr->fops) {
+	if (direct_ops_get(tr)) {
 		kfree(tr);
 		tr = NULL;
 		goto out;
 	}
-	tr->fops->private = tr;
-	tr->fops->ops_func = bpf_tramp_ftrace_ops_func;
 #endif
 
 	tr->key = key;
@@ -482,8 +549,7 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
 		 * trampoline again, and retry register.
 		 */
 		/* reset fops->func and fops->trampoline for re-register */
-		tr->fops->func = NULL;
-		tr->fops->trampoline = 0;
+		direct_ops_clear(tr);
 
 		/* free im memory and reallocate later */
 		bpf_tramp_image_free(im);
@@ -864,10 +930,7 @@ void bpf_trampoline_put(struct bpf_trampoline *tr)
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
index 2af1304d1a83..c4b969fb1010 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2592,8 +2592,13 @@ unsigned long ftrace_find_rec_direct(unsigned long ip)
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
 
@@ -5986,6 +5991,10 @@ int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned lo
 	if (!hash)
 		return -ENOMEM;
 
+#ifndef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
+	ops->direct_call = addr;
+#endif
+
 	err = register_ftrace_direct_hash(ops, hash);
 	free_ftrace_hash(hash);
 	return err;
@@ -6050,6 +6059,10 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long
 		return -ENOMEM;
 
 	err = modify_ftrace_direct_hash(ops, hash, lock_direct_mutex);
+#ifndef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
+	if (!err)
+		ops->direct_call = addr;
+#endif
 	free_ftrace_hash(hash);
 	return err;
 }
-- 
2.51.0


