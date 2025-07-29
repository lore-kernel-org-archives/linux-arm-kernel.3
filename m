Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C5BC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQ3zIuKmYjiiVQZZvgJD4Hb48Xt4mLbw8QLpqmoGdVk=; b=e2NsHpiR3v2DGdR+UjiakUH7FU
	ZvZa51WzyBIc9Ga7WnKM8qABLl1CuXvgnAuu8DU4QyRIr+7StCnwfjZRUG3DP2ZbKqSK1XyuUp7k6
	fS9g3GJQ8tYOT/87hOv7OUI6ffcu/X4pSjGktPov6tZcYLoIi4fh+cghzhXUA1HwthUC+hO0MGHvM
	eAcTfFKT0I0qpMHgpLd6Qkx3WQFc45yzNd9/t5j1S6/oMBmk+DT9mr2wm9alDDJsDXziskMgPtZ03
	+R3NaR6h/zt6M1Sv9lD89amHatEKeg/KtgwYmG4BqHnOAJpERux/puDepbG9CYyirJT1YJ+r7LrzB
	lU+lkzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughhL-0000000GY4l-2PRf;
	Tue, 29 Jul 2025 10:36:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughZX-0000000GWgv-3feV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 10:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51AC1601EC;
	Tue, 29 Jul 2025 10:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CB7C4CEEF;
	Tue, 29 Jul 2025 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753784919;
	bh=PoVJYmha+F5Q+Shyh8Z6KZj91FS00Vyug/N39XeYgMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvoNT2pkbNwrm9T3+/0Qy1iPrq8hPGDjfzb55rvDPU92Tp6ra268grQaNQUx/5YMG
	 flGt4OoLgVr05TK/y0/MaDFjfeaCK9Nmax3CMWqKkBtEQsUomO5+nm4IinpJJAoxKo
	 DiuxSJys3Fu7aNhh/s7CmnP1JP7ESYd+2zu8r4pwK+SC6W8TDAlos1TLXwn6yIJSw5
	 PLqtuv8SRR78GdCvlV+OXenW26soPrMNPSXYxcVCGLhK0yavus3sL3n35uoWAykTU2
	 3r2sseihRrqZPsOB0wjVMzNJ/ibme2TeBY6y8zW9RNF7faQPJ10WIm8FXw+7goiAEU
	 yXy0ct+8CUksg==
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
Subject: [RFC 02/10] ftrace: Add register_ftrace_direct_hash function
Date: Tue, 29 Jul 2025 12:28:05 +0200
Message-ID: <20250729102813.1531457-3-jolsa@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729102813.1531457-1-jolsa@kernel.org>
References: <20250729102813.1531457-1-jolsa@kernel.org>
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

Adding register_ftrace_direct_hash function that registers
all entries (ip -> direct) provided in hash argument.

The difference to current register_ftrace_direct is
 - hash argument that allows to register multiple ip -> direct
   entries at once
 - we can call register_ftrace_direct_hash multiple times on the
   same ftrace_ops object, becase after first registration with
   register_ftrace_function_nolock, it uses ftrace_update_ops to
   update the ftrace_ops object

This change will allow us to have simple ftrace_ops for all bpf
direct interface users in following changes.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h |   7 +++
 kernel/trace/ftrace.c  | 123 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index b672ca15f265..e45bcc9de53b 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -526,6 +526,8 @@ int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long addr,
 int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr);
 int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
 
+int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash);
+
 void ftrace_stub_direct_tramp(void);
 
 #else
@@ -552,6 +554,11 @@ static inline int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned l
 	return -ENODEV;
 }
 
+int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
+{
+	return -ENODEV;
+}
+
 /*
  * This must be implemented by the architecture.
  * It is the way the ftrace direct_ops helper, when called
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 5b8f565a1258..1dbb113f4e9c 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6219,6 +6219,129 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 	return err;
 }
 EXPORT_SYMBOL_GPL(modify_ftrace_direct);
+
+static unsigned long hash_count(struct ftrace_hash *hash)
+{
+	return hash ? hash->count : 0;
+}
+
+/**
+ * hash_add - adds two struct ftrace_hash and returns the result
+ * @a: struct ftrace_hash object
+ * @b: struct ftrace_hash object
+ *
+ * Returns struct ftrace_hash object on success, NULL on error.
+ */
+static struct ftrace_hash *hash_add(struct ftrace_hash *a, struct ftrace_hash *b)
+{
+	struct ftrace_func_entry *entry;
+	struct ftrace_hash *add;
+	int size, i;
+
+	size = hash_count(a) + hash_count(b);
+	if (size > 32)
+		size = 32;
+
+	add = alloc_and_copy_ftrace_hash(fls(size), a);
+	if (!add)
+		goto error;
+
+	size = 1 << b->size_bits;
+	for (i = 0; i < size; i++) {
+		hlist_for_each_entry(entry, &b->buckets[i], hlist) {
+			if (add_hash_entry_direct(add, entry->ip, entry->direct) == NULL)
+				goto error;
+		}
+	}
+	return add;
+
+ error:
+	free_ftrace_hash(add);
+	return NULL;
+}
+
+static void call_direct_funcs_hash(unsigned long ip, unsigned long pip,
+				   struct ftrace_ops *ops, struct ftrace_regs *fregs)
+{
+	unsigned long addr;
+
+	addr = ftrace_find_rec_direct(ip);
+	if (!addr)
+		return;
+
+	arch_ftrace_set_direct_caller(fregs, addr);
+}
+
+int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
+{
+	struct ftrace_hash *filter_hash = NULL, *new_hash = NULL, *free_hash = NULL;
+	struct ftrace_func_entry *entry;
+	int i, size, err;
+	bool reg;
+
+	if (!hash_count(hash))
+		return 0;
+
+	mutex_lock(&direct_mutex);
+
+	/* Make sure requested entry is not already registered. */
+	size = 1 << hash->size_bits;
+	for (i = 0; i < size; i++) {
+		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
+			if (__ftrace_lookup_ip(direct_functions, entry->ip))
+				goto out_unlock;
+		}
+	}
+
+	filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
+
+	/* If there's nothing in filter_hash we need to register the ops. */
+	reg = hash_count(filter_hash) == 0;
+	if (reg) {
+		if (ops->func || ops->trampoline)
+			goto out_unlock;
+		if (ops->flags & FTRACE_OPS_FL_ENABLED)
+			goto out_unlock;
+	}
+
+	filter_hash = hash_add(filter_hash, hash);
+	if (!filter_hash)
+		goto out_unlock;
+
+	new_hash = hash_add(direct_functions, hash);
+	if (!new_hash)
+		goto out_unlock;
+
+	free_hash = direct_functions;
+	rcu_assign_pointer(direct_functions, new_hash);
+	new_hash = NULL;
+
+	if (reg) {
+		ops->func = call_direct_funcs_hash;
+		ops->flags = MULTI_FLAGS;
+		ops->trampoline = FTRACE_REGS_ADDR;
+		ops->local_hash.filter_hash = filter_hash;
+
+		err = register_ftrace_function_nolock(ops);
+		if (!err)
+			filter_hash = NULL;
+	} else {
+		err = ftrace_update_ops(ops, filter_hash, EMPTY_HASH);
+	}
+
+ out_unlock:
+	mutex_unlock(&direct_mutex);
+
+	if (free_hash && free_hash != EMPTY_HASH)
+		call_rcu_tasks(&free_hash->rcu, register_ftrace_direct_cb);
+
+	if (filter_hash)
+		free_ftrace_hash(filter_hash);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(register_ftrace_direct_hash);
+
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 
 /**
-- 
2.50.1


