Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C535D1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCiPAQs/TM9AsCozQTlCunzfqs84a9xHtb61ZoQ+638=; b=oqMkdL+wui5o9JFFvafThkYioz
	NXyGdQg6WQj92woP3aliXydlcLrS58xbpfc2rv0Hjt/VvsOcP5M0hr40abEHjq6mct0PCDXtAAWoA
	WHdls+FnGvGWzKduELh4d3E3zTOPudrzZKHD9kmPbS5Jpkj0pX4K0ymLdkxvbExKrZQb0sHmJSNrb
	BxYqACZd5Jp++wooS2uW/lxNv4Rt3c9Jkh5NsntowtX+OWMovR+mplEa4r+R6y/Ex96G1igciDl5X
	fNI37LyKWsM8epuRdKqFqxKyhd09s/F/8mJznzZvTHMZBK8AkW+lr1vHZb7bbljq/dxMC1Te1eUtQ
	rPpZQTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiAS-00000006Idp-2rkh;
	Wed, 03 Dec 2025 08:24:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiAR-00000006Id3-2kP6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:24:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A78E60172;
	Wed,  3 Dec 2025 08:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF41BC4CEFB;
	Wed,  3 Dec 2025 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764750294;
	bh=Emu7TZrB/ba81eue9Hl9bE7eY0YOVtdlGr12xVhmDKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sh8Fb7Im7xyYcTF2xrSNDJ2NMg2CvH8hTvagHrIIwdOmBBjhY+ouhMVsYfNhGk2Hc
	 8wlEN/thKFYSr/Qe8EpAl4Dkh7LEivEzKnbIB94aeD2tUNHmrzi80D65RiecIPrMbC
	 RR/UoHEMP/6JttVuso8JnsC6m3y65TazU9ssVDErULtHVd196+ydU4+ZL+xH8rVHkT
	 5kE8+XWSG32xuaYsFCA3s3GLggL0XtV/LiUVQ3s6kK4uPvmwQ5bRuSNzlKzqMHZgIs
	 UNNqEpevQ1nVyXVjMOx9s9Bfga0yPVYGerh8wk4Sue+ZGOrkR/6zSKPIuq+mtTfDWz
	 ZZ3w7XutaBJoA==
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
Subject: [PATCHv4 bpf-next 4/9] ftrace: Add update_ftrace_direct_add function
Date: Wed,  3 Dec 2025 09:23:57 +0100
Message-ID: <20251203082402.78816-5-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203082402.78816-1-jolsa@kernel.org>
References: <20251203082402.78816-1-jolsa@kernel.org>
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
 kernel/trace/ftrace.c  | 128 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 8c034b028af4..eb60d971ec1d 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -550,6 +550,8 @@ int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long addr,
 int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr);
 int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
 
+int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash);
+
 void ftrace_stub_direct_tramp(void);
 
 #else
@@ -576,6 +578,11 @@ static inline int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned l
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
index 84aee9096a9e..1660a87547dd 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6249,6 +6249,134 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
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
+int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
+{
+	struct ftrace_hash *old_direct_functions = NULL, *new_direct_functions = NULL;
+	struct ftrace_hash *old_filter_hash = NULL, *new_filter_hash = NULL;
+	struct ftrace_func_entry *entry;
+	int i, size, err = -EINVAL;
+	bool reg;
+
+	if (!hash_count(hash))
+		return -EINVAL;
+
+	mutex_lock(&direct_mutex);
+
+	/* Make sure requested entries are not already registered. */
+	size = 1 << hash->size_bits;
+	for (i = 0; i < size; i++) {
+		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
+			if (__ftrace_lookup_ip(direct_functions, entry->ip))
+				goto out_unlock;
+		}
+	}
+
+	old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
+	old_direct_functions = direct_functions;
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
+	new_direct_functions = hash_add(old_direct_functions, hash);
+	if (!new_direct_functions)
+		goto out_unlock;
+
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
+			old_filter_hash = new_filter_hash;
+
+			/* cleanup for possible another register call */
+			ops->func = NULL;
+			ops->trampoline = 0;
+		}
+	} else {
+		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
+		/*
+		 * new_filter_hash is dup-ed, so we need to release it anyway,
+		 * old_filter_hash either stays on error or is released already
+		 */
+		old_filter_hash = new_filter_hash;
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
+	if (old_filter_hash)
+		free_ftrace_hash(old_filter_hash);
+
+	return err;
+}
+
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 
 /**
-- 
2.52.0


