Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671F0EE0205
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKI6fd/o4Xujvh0KCQzIPU+orX7p+bFlDuyFfZDMORw=; b=KN48mq8Kx4JU2OwMcqux5d88JJ
	7j798tZSOPEgpRzkocHhd0e1VeHi5Zjy1DDbGx8nYYVr1BrtGGsaPSeuYyoV6Ng3ppVd6SGixamlD
	CEcC6AC+rgeRChcpotqWiEbFX29WzClM8nqoVkh+op908mYaTn0mSw/jsBkdsKQbeIa1BO3b5Upa3
	HkrRUY1pbkVPsonaBr4ERXMC64Cv7ecoQ7emYZDNsL6px1eIylET+i5vkiu4Pu/x9qJxqF6t8TwDn
	RMM6AYURYjqyHpwP/5avzOqWkmP5dIcd3JWTDynnC+znFs/uuU2dzpQrydowdhSiFIbkYSxL/um6e
	sbz0taTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vab3w-00000004xGJ-1qte;
	Tue, 30 Dec 2025 14:51:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vab3u-00000004xFR-2EkL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 14:51:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D8BA40C36;
	Tue, 30 Dec 2025 14:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F0BC4CEFB;
	Tue, 30 Dec 2025 14:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767106262;
	bh=nhPjtyH+1jx9XO4H6psdQcnvbEZVvVYR0jh9UFg5wNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hK58HmHHYArQaWG33mxcDgy2hjSUM3gHA2uSaOIq1l+XmgTBzPbE8EA3sT4Wr0lPI
	 b+np/Oc3ohRyMaWK9q0GvnXNgXlK5C8sE/orEDh76ah0il2mpKbaodErcRXraR9gkV
	 nxWojG7OJ+e3N3CBs3vIXHq69QVp3Cp1vWg6rgkcXZJ+1jvFSHhZpnATkF3uydEBhe
	 OnSCJhWQVnblaXFZSykVGAZl7LDcelYSSUid8j3wD0/s7m1HwYqnUwczAy4EP+0yBk
	 CJ6jbaf6PFdcxsUCrk8jZsbJVVWhfefoSjWPsuZ8IINfTiRyqkfhJzUdbUADKE9fRr
	 ++uySceZaKUvw==
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
Subject: [PATCHv6 bpf-next 4/9] ftrace: Add update_ftrace_direct_add function
Date: Tue, 30 Dec 2025 15:50:05 +0100
Message-ID: <20251230145010.103439-5-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230145010.103439-1-jolsa@kernel.org>
References: <20251230145010.103439-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_065102_614418_E00B3A7F 
X-CRM114-Status: GOOD (  21.95  )
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

Adding update_ftrace_direct_add function that adds all entries
(ip -> addr) provided in hash argument to direct ftrace ops
and updates its attachments.

The difference to current register_ftrace_direct is
 - hash argument that allows to register multiple ip -> direct
   entries at once
 - we can call update_ftrace_direct_add multiple times on the
   same ftrace_ops object, becase after first registration with
   register_ftrace_function_nolock, it uses ftrace_update_ops to
   update the ftrace_ops object

This change will allow us to have simple ftrace_ops for all bpf
direct interface users in following changes.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h |   7 +++
 kernel/trace/ftrace.c  | 140 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 472f2d8a4c0f..f0fcff389061 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -543,6 +543,8 @@ int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long addr,
 int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr);
 int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
 
+int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash);
+
 void ftrace_stub_direct_tramp(void);
 
 #else
@@ -569,6 +571,11 @@ static inline int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned l
 	return -ENODEV;
 }
 
+static inline int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
+{
+	return -ENODEV;
+}
+
 /*
  * This must be implemented by the architecture.
  * It is the way the ftrace direct_ops helper, when called
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 3ca3aee5f886..3d1170da1bb8 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6275,6 +6275,146 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
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
+	int size;
+
+	size = hash_count(a) + hash_count(b);
+	if (size > 32)
+		size = 32;
+
+	add = alloc_and_copy_ftrace_hash(fls(size), a);
+	if (!add)
+		return NULL;
+
+	size = 1 << b->size_bits;
+	for (int i = 0; i < size; i++) {
+		hlist_for_each_entry(entry, &b->buckets[i], hlist) {
+			if (add_ftrace_hash_entry_direct(add, entry->ip, entry->direct) == NULL) {
+				free_ftrace_hash(add);
+				return NULL;
+			}
+		}
+	}
+	return add;
+}
+
+/**
+ * update_ftrace_direct_add - Updates @ops by adding direct
+ * callers provided in @hash
+ * @ops: The address of the struct ftrace_ops object
+ * @hash: The address of the struct ftrace_hash object
+ *
+ * This is used to add custom direct callers (ip -> addr) to @ops,
+ * specified in @hash. The @ops will be either registered or updated.
+ *
+ * Returns: zero on success. Non zero on error, which includes:
+ *  -EINVAL - The @hash is empty
+ */
+int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
+{
+	struct ftrace_hash *old_direct_functions = NULL;
+	struct ftrace_hash *new_direct_functions;
+	struct ftrace_hash *old_filter_hash;
+	struct ftrace_hash *new_filter_hash = NULL;
+	struct ftrace_func_entry *entry;
+	int err = -EINVAL;
+	int size;
+	bool reg;
+
+	if (!hash_count(hash))
+		return -EINVAL;
+
+	mutex_lock(&direct_mutex);
+
+	/* Make sure requested entries are not already registered. */
+	size = 1 << hash->size_bits;
+	for (int i = 0; i < size; i++) {
+		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
+			if (__ftrace_lookup_ip(direct_functions, entry->ip))
+				goto out_unlock;
+		}
+	}
+
+	old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
+
+	/* If there's nothing in filter_hash we need to register the ops. */
+	reg = hash_count(old_filter_hash) == 0;
+	if (reg) {
+		if (ops->func || ops->trampoline)
+			goto out_unlock;
+		if (ops->flags & FTRACE_OPS_FL_ENABLED)
+			goto out_unlock;
+	}
+
+	err = -ENOMEM;
+	new_filter_hash = hash_add(old_filter_hash, hash);
+	if (!new_filter_hash)
+		goto out_unlock;
+
+	new_direct_functions = hash_add(direct_functions, hash);
+	if (!new_direct_functions)
+		goto out_unlock;
+
+	old_direct_functions = direct_functions;
+	rcu_assign_pointer(direct_functions, new_direct_functions);
+
+	if (reg) {
+		ops->func = call_direct_funcs;
+		ops->flags |= MULTI_FLAGS;
+		ops->trampoline = FTRACE_REGS_ADDR;
+		ops->local_hash.filter_hash = new_filter_hash;
+
+		err = register_ftrace_function_nolock(ops);
+		if (err) {
+			/* restore old filter on error */
+			ops->local_hash.filter_hash = old_filter_hash;
+
+			/* cleanup for possible another register call */
+			ops->func = NULL;
+			ops->trampoline = 0;
+		} else {
+			new_filter_hash = old_filter_hash;
+		}
+	} else {
+		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
+		/*
+		 * new_filter_hash is dup-ed, so we need to release it anyway,
+		 * old_filter_hash either stays on error or is already released
+		 */
+	}
+
+	if (err) {
+		/* reset direct_functions and free the new one */
+		rcu_assign_pointer(direct_functions, old_direct_functions);
+		old_direct_functions = new_direct_functions;
+	}
+
+ out_unlock:
+	mutex_unlock(&direct_mutex);
+
+	if (old_direct_functions && old_direct_functions != EMPTY_HASH)
+		call_rcu_tasks(&old_direct_functions->rcu, register_ftrace_direct_cb);
+	free_ftrace_hash(new_filter_hash);
+
+	return err;
+}
+
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 
 /**
-- 
2.52.0


