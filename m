Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D086CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 21:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QX45tuaO5WXNN+CTHbEijBgzmNBMNeLxfeOXCA93uSM=; b=IT+RGf0Yo/xyBThIxXlO1qCzOw
	FECaRfFRmsM3usOWhxe9/XbuIwfLHPLHFg63AV/iCy5KXwCXm1nIQJjmvezNwk9Doosxqted36ni7
	mk2+qHdW/cSrM/i8L+YcFRvQUNt0pCtWxbFHunmrbx+dmsTco/vH8vxpbpocCl/yzYAa3+UvzIY4H
	ma092lbRU1lBfI/ZnYZnHx4OTJB2ej+9DleRh5MmRtT/tZ8gpo8xrCi7MXj8uBWR2QMOr8w5DbN1i
	yQVw+OI/d1cvmrUq55r116jZF797iMkwHK3lf+P4lxVbs52d0pnpz7XYpFT+o+wcHjMiMr+lFSsEU
	fLDDtqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Aw5-0000000F0yM-1Jwz;
	Tue, 23 Sep 2025 21:52:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Aw4-0000000F0xi-0LVO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 21:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FCBB60292;
	Tue, 23 Sep 2025 21:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5A7C4CEF5;
	Tue, 23 Sep 2025 21:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758664351;
	bh=BULakDdKw0A4NZGkv919IsMp+rW5CmZOYDx2mdUjOFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbPDkg8x5vH27VfUoF+koTvyt23ssm+a7u9uXZl1YlS2HNFgfS/7XXfJJcS36jBK+
	 jbI0CCQwFbtQmwdOyJUvQVRVRLOnaomAwjKVnHzJlEMNZ7MsqpA/Hi9F/qxuFUNWVx
	 iZqOyoV41gMhmdN2/QBQgUO8pTSfw2YthTD/82vNjswNC9ftWo3DzQDeriMn8V51WJ
	 4QUpXkEpfQZ9mRg7szIgWPrpYfg3LfGY59rOM9URqQDQTBOYCpp4RwL10WqZlRfHgb
	 0PPOBNd2hpo/yAWgbRVCF8pm1SDCpjwqIQqAJxTL2hpp7trEedJx/XLhPz0U5mZ02H
	 Q1QkPGTs/N0Bw==
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
Subject: [PATCH 3/9] ftrace: Add unregister_ftrace_direct_hash function
Date: Tue, 23 Sep 2025 23:51:41 +0200
Message-ID: <20250923215147.1571952-4-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923215147.1571952-1-jolsa@kernel.org>
References: <20250923215147.1571952-1-jolsa@kernel.org>
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

Adding unregister_ftrace_direct_hash function that unregisters
all entries (ip -> direct) provided in hash argument.

The difference to current unregister_ftrace_direct is
 - hash argument that allows to unregister multiple ip -> direct
   entries at once
 - we can call unregister_ftrace_direct_hash multiple times on the
   same ftrace_ops object, becase we do not need to unregister
   all entries at once, we can do it gradualy with the help of
   ftrace_update_ops function

This change will allow us to have simple ftrace_ops for all bpf
direct interface users in following changes.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h |  6 +++
 kernel/trace/ftrace.c  | 98 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 2705c292341a..55f5ead5d4ff 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -527,6 +527,7 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr);
 int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
 
 int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash);
+int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash);
 
 void ftrace_stub_direct_tramp(void);
 
@@ -559,6 +560,11 @@ int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash
 	return -ENODEV;
 }
 
+int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
+{
+	return -ENODEV;
+}
+
 /*
  * This must be implemented by the architecture.
  * It is the way the ftrace direct_ops helper, when called
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 06528af2281f..ab5739f72933 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6329,6 +6329,104 @@ int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash
 }
 EXPORT_SYMBOL_GPL(register_ftrace_direct_hash);
 
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
+int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
+{
+	struct ftrace_hash *new_hash = NULL, *filter_hash = NULL, *free_hash = NULL;
+	struct ftrace_func_entry *del, *entry;
+	unsigned long size, i;
+	int err = -EINVAL;
+
+	if (!hash_count(hash))
+		return 0;
+	if (check_direct_multi(ops))
+		return -EINVAL;
+	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
+		return -EINVAL;
+	if (direct_functions == EMPTY_HASH)
+		return -EINVAL;
+
+	mutex_lock(&direct_mutex);
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
+	filter_hash = hash_sub(ops->func_hash->filter_hash, hash);
+	if (!filter_hash)
+		goto out_unlock;
+
+	new_hash = hash_sub(direct_functions, hash);
+	if (!new_hash)
+		goto out_unlock;
+
+	/* If there's nothing left, we need to unregister the ops. */
+	if (ftrace_hash_empty(filter_hash)) {
+		err = unregister_ftrace_function(ops);
+		/* cleanup for possible another register call */
+		ops->func = NULL;
+		ops->trampoline = 0;
+		ftrace_free_filter(ops);
+		ops->func_hash->filter_hash = NULL;
+	} else {
+		err = ftrace_update_ops(ops, filter_hash, EMPTY_HASH);
+	}
+
+	free_hash = direct_functions;
+	rcu_assign_pointer(direct_functions, new_hash);
+
+ out_unlock:
+	mutex_unlock(&direct_mutex);
+
+	if (free_hash && free_hash != EMPTY_HASH)
+		call_rcu_tasks(&free_hash->rcu, register_ftrace_direct_cb);
+	if (filter_hash)
+		free_ftrace_hash(filter_hash);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(unregister_ftrace_direct_hash);
+
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 
 /**
-- 
2.51.0


