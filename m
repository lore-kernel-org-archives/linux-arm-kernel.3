Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5378CFA446
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMqFacuWE2ErhJM0r1BMbUxyt4t7H+b4qg2KlN+KvAo=; b=4KP5jBtI4KFW6xA1OPY32emiiS
	LiWZT/EJbTRL6xMYgLkyS7wff3oZiLsQn+E6aTHNP5wvU05vfdSlI1JHl0403T7iP38BL+K7hlh1P
	ryfpBhyANEcNGTsK9YKnQz5xltLjNBC7wDdhCwtXKt4jKyRlGOL6dJv66CSAKe3dnzSjJ7bpgTNqz
	gbcdVZajQipHjaQDLQ8A8gq+peQ9eX+I2zJxpt7uT116w4zpj7ljpwaiesYpPrYifViHl9VQTZkrg
	aimdtiNmbPCh4GD3c6BpsqSOgE3OWFzMbhwQk3lLeetzR55Q9yqXHfML+TZA6N8dvD+OZjaXBlFj0
	Fuz+WNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMC9A-00000007Rj5-3fss;
	Thu, 20 Nov 2025 21:24:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMC99-00000007Rib-2woP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:24:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 279236016D;
	Thu, 20 Nov 2025 21:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1EFC4CEF1;
	Thu, 20 Nov 2025 21:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763673894;
	bh=lfhp1WdaWfC5KnIhI8D/pxbcrNx0gUfpW6nQZKPGORs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fW/jD4vJ8E6utvZI+At/2/HbVruCbI82EKwo7RX4iGEMwyc2fFr657vlgozhSDoUO
	 nxAR/iXSnpgkCW9hB3BTdwN9XNVLRzx6hIuAIjadj2NK6glL/ZXixaBeunYqj7DBK9
	 4YWKjfiAzlHncZC7IrNgQObR6dPcdvPVJAIld6caF6wukWWQMLaCJhYgavRdzt1fbp
	 ltMZd3h4XUfu/N0/UX1ZQcnGMHvZlYReP30izOvg/2DaEO0QswJy0sE2A3d9ZommN+
	 ZyTN+Kc0jkOEcF86BWnNnuToWjHkXfxB6hy3HLFY50BR9bG2Os2gghjl6aD7xlcmbH
	 ZUTsMxohPgyAw==
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
Subject: [PATCHv3 bpf-next 4/8] ftrace: Add update_ftrace_direct_del function
Date: Thu, 20 Nov 2025 22:23:58 +0100
Message-ID: <20251120212402.466524-5-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251120212402.466524-1-jolsa@kernel.org>
References: <20251120212402.466524-1-jolsa@kernel.org>
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

Adding update_ftrace_direct_del function that removes all entries
(ip -> addr) provided in hash argument to direct ftrace ops and
updates its attachments.

The difference to current unregister_ftrace_direct is
 - hash argument that allows to unregister multiple ip -> direct
   entries at once
 - we can call update_ftrace_direct_del multiple times on the
   same ftrace_ops object, becase we do not need to unregister
   all entries at once, we can do it gradualy with the help of
   ftrace_update_ops function

This change will allow us to have simple ftrace_ops for all bpf
direct interface users in following changes.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h |   6 +++
 kernel/trace/ftrace.c  | 110 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 9cf4cd56d982..c571deeff840 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -551,6 +551,7 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr);
 int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
 
 int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash);
+int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash);
 
 void ftrace_stub_direct_tramp(void);
 
@@ -583,6 +584,11 @@ static inline int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace
 	return -ENODEV;
 }
 
+static inline int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
+{
+	return -ENODEV;
+}
+
 /*
  * This must be implemented by the architecture.
  * It is the way the ftrace direct_ops helper, when called
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 850ff55ff25e..cc730a8fd087 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6376,6 +6376,116 @@ int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
 	return err;
 }
 
+/**
+ * hash_sub - substracts @b from @a and returns the result
+ * @a: struct ftrace_hash object
+ * @b: struct ftrace_hash object
+ *
+ * Returns struct ftrace_hash object on success, NULL on error.
+ */
+static struct ftrace_hash *hash_sub(struct ftrace_hash *a, struct ftrace_hash *b)
+{
+	struct ftrace_func_entry *entry, *del;
+	struct ftrace_hash *sub;
+	int size, i;
+
+	sub = alloc_and_copy_ftrace_hash(a->size_bits, a);
+	if (!sub)
+		goto error;
+
+	size = 1 << b->size_bits;
+	for (i = 0; i < size; i++) {
+		hlist_for_each_entry(entry, &b->buckets[i], hlist) {
+			del = __ftrace_lookup_ip(sub, entry->ip);
+			if (WARN_ON_ONCE(!del))
+				goto error;
+			remove_hash_entry(sub, del);
+			kfree(del);
+		}
+	}
+	return sub;
+
+ error:
+	free_ftrace_hash(sub);
+	return NULL;
+}
+
+int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
+{
+	struct ftrace_hash *old_direct_functions = NULL, *new_direct_functions = NULL;
+	struct ftrace_hash *old_filter_hash = NULL, *new_filter_hash = NULL;
+	struct ftrace_func_entry *del, *entry;
+	unsigned long size, i;
+	int err = -EINVAL;
+
+	if (!hash_count(hash))
+		return -EINVAL;
+	if (check_direct_multi(ops))
+		return -EINVAL;
+	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
+		return -EINVAL;
+	if (direct_functions == EMPTY_HASH)
+		return -EINVAL;
+
+	mutex_lock(&direct_mutex);
+
+	old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
+	old_direct_functions = direct_functions;
+
+	/* Make sure requested entries are already registered. */
+	size = 1 << hash->size_bits;
+	for (i = 0; i < size; i++) {
+		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
+			del = __ftrace_lookup_ip(direct_functions, entry->ip);
+			if (!del || del->direct != entry->direct)
+				goto out_unlock;
+		}
+	}
+
+	err = -ENOMEM;
+	new_filter_hash = hash_sub(old_filter_hash, hash);
+	if (!new_filter_hash)
+		goto out_unlock;
+
+	new_direct_functions = hash_sub(old_direct_functions, hash);
+	if (!new_direct_functions)
+		goto out_unlock;
+
+	/* If there's nothing left, we need to unregister the ops. */
+	if (ftrace_hash_empty(new_filter_hash)) {
+		err = unregister_ftrace_function(ops);
+		if (!err) {
+			/* cleanup for possible another register call */
+			ops->func = NULL;
+			ops->trampoline = 0;
+			ftrace_free_filter(ops);
+			ops->func_hash->filter_hash = NULL;
+		}
+	} else {
+		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
+		/*
+		 * new_filter_hash is dup-ed, so we need to release it anyway,
+		 * old_filter_hash either stays on error or is released already
+		 */
+	}
+
+	if (err) {
+		/* reset direct_functions and free the new one */
+		old_direct_functions = new_direct_functions;
+	} else {
+		rcu_assign_pointer(direct_functions, new_direct_functions);
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
2.51.1


