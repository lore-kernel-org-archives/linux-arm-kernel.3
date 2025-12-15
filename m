Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE902D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVp5WXF06e8uF/IqCjQWcjjm0HyL20oQx4Rpgul94dQ=; b=QR2BbpKOd9vZcYbcVO28peEsDj
	XnCGETRqlsUaI7kqtWO6OPuJbwD4vej7ZrKXEgUx6y4UhuZT4ghRq20F97z6+HJu6a83ZBazG43AJ
	BelXlJJrWgy8nT1z1ZGYoQcnezPKF1qEoMTTJxZ91tn50Nr8+v2cDy+B3YpzIuaIGr9eSuXcmyeZc
	kiiTwz/cTUEM9R+0jZwlZMRn+Qiozwx7P6WrSwYfZXc1BPFs3YtbgrgbFDNATEIIFuaBRMLF+qDeV
	rXA34YkMWcKl1SnAuAnnyvggxJXhMjhBjaAhPv24G/jWtGcwIyvs+8B4HUINhZ8NzTtjcogXfXTJk
	yXU1qFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVFuQ-00000004GLm-1tcT;
	Mon, 15 Dec 2025 21:15:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVFuP-00000004GKl-0OnS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:15:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3505F6018A;
	Mon, 15 Dec 2025 21:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A91C4CEF5;
	Mon, 15 Dec 2025 21:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765833307;
	bh=Qe9xN6h0/3nEIUSxeRrpz/j0xLdE8kcvmTrNdxRKDG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YNiveAfPfK1lTVxPo89LWjw7JnfBvklcahfC/MFndyH3EvdB/HDbbTfliqnj/4FLV
	 17OCyDnRdPIxB5ns6vODqSwVWL0cyd7V+Ck2uY0b2Gk8UN8XQUjNihQoSDRehL/40P
	 9t50gbOZGXfGkE+3Z276S2CAGpDSurw7qYyXipCjoW9lCwYcQnMK1XWPk2lEzAuBk1
	 HhR4oz7cQHjcE/0dV5xo6/+ogEvdvWd9uXKWAS/DOeE4DlP1sbSTjGbqceSU/dX0HC
	 0REu6eXgE7LQZAEvIFt2NM4KYlgr/yQPN2ApGzDFz9BxrtKIKEnzI4XuBQKHtfM7Kl
	 1R/djU8Bnfunw==
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
Subject: [PATCHv5 bpf-next 5/9] ftrace: Add update_ftrace_direct_del function
Date: Mon, 15 Dec 2025 22:13:58 +0100
Message-ID: <20251215211402.353056-6-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215211402.353056-1-jolsa@kernel.org>
References: <20251215211402.353056-1-jolsa@kernel.org>
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
 kernel/trace/ftrace.c  | 112 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 5cf151cb8e6d..ac4b473c7fd3 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -544,6 +544,7 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr);
 int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
 
 int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash);
+int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash);
 
 void ftrace_stub_direct_tramp(void);
 
@@ -576,6 +577,11 @@ static inline int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace
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
index ec7d93460dac..48dc0de5f2ce 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6377,6 +6377,118 @@ int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
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
+	struct ftrace_hash *old_direct_functions = NULL, *new_direct_functions;
+	struct ftrace_hash *old_filter_hash, *new_filter_hash = NULL;
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
+
+	if (!hash_count(old_filter_hash))
+		goto out_unlock;
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
+	new_direct_functions = hash_sub(direct_functions, hash);
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
+		 * old_filter_hash either stays on error or is already released
+		 */
+	}
+
+	if (err) {
+		/* free the new_direct_functions */
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
2.52.0


