Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2055FC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4wkIprMPWfEyRTHGe+w4wBJq5uToyTtco76d73GX28=; b=jL6O732+MV7iWZCdFqryArtLBm
	ln3i/XE6H5lVjhYxlfLQ3ORUxY44i3Fzjg3FClFpCH7AY92f/1RkKVxYIzN6VFMlVMJEhxaVQvBWo
	oWGyio8qSOgMxN4CLj362P7YvnEbVEAYmwqWzXwskcsOrSn6YRaFEXkzLNrvPR2kLBwwmvi2Fz60m
	UZCxjnuTncafAWop0P1GHGljxakbV8QdCFvPolaRqaIG8SaI/QfB39Xlh3w37Nc6mvhbXh77ddsBi
	iRV98b0MGITIFDdkMz2LLKCnaTHIWdVySmLZwqIF/2pazY9rCr9yI8Oibl8F2je5/0GomHRO9FqBL
	ca9dnLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughmD-0000000GYhr-0hXH;
	Tue, 29 Jul 2025 10:41:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughZu-0000000GWmV-39xF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 10:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D3C6601EC;
	Tue, 29 Jul 2025 10:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F78DC4CEEF;
	Tue, 29 Jul 2025 10:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753784941;
	bh=oE3MjIoq7PdzWxxy/FqOc+ixaBdp6bBF/6oQYdRPSBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a42U5aG5a3fObGpx09e13vzlH8lWFxPtU3jQ9W6k96sXIjw38o+IqjNYzqZtTENk6
	 yGK+6RAQOaU4nKzQ8pDHasG6tqGANgcWrLG+oRde7haZ38J9LxP9Z0HzJ3cMwiqLBQ
	 y015CVcacFqd+j0OOXXZ71fgADmsb2NCF+wl/rwk2ezbaERYPFre5ILI3eHdmKE17r
	 EaIfP/zvGSgNXsyfmJST6LXZcQnHaYceMqDsGo3yO/NT2qEm0LoMCHQ+XYVlmJAnHu
	 4KKz+3+HaC1aiuNdFnlZsGi3VIUzZ8j2Q+bdgQcMDkwRGweiyIkrjlbxRGyAZTPPVb
	 kdInU15FKBnNw==
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
Subject: [RFC 04/10] ftrace: Add modify_ftrace_direct_hash function
Date: Tue, 29 Jul 2025 12:28:07 +0200
Message-ID: <20250729102813.1531457-5-jolsa@kernel.org>
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

Adding modify_ftrace_direct_hash function that modifies
all entries (ip -> direct) provided in hash argument.

The difference to current unregister_ftrace_direct is
- hash argument that allows to modify multiple ip -> direct
  entries at once

This change will allow us to have simple ftrace_ops for all bpf
direct interface users in following changes.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h |  6 +++++
 kernel/trace/ftrace.c  | 58 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 7ff6004498c0..8761765d9abc 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -528,6 +528,7 @@ int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
 
 int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash);
 int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash);
+int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock);
 
 void ftrace_stub_direct_tramp(void);
 
@@ -565,6 +566,11 @@ int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *ha
 	return -ENODEV;
 }
 
+int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
+{
+	return -ENODEV;
+}
+
 /*
  * This must be implemented by the architecture.
  * It is the way the ftrace direct_ops helper, when called
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index d761237ec70f..755d5550ac44 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6440,6 +6440,64 @@ int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *ha
 }
 EXPORT_SYMBOL_GPL(unregister_ftrace_direct_hash);
 
+int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
+{
+	struct ftrace_func_entry *entry, *tmp;
+	static struct ftrace_ops tmp_ops = {
+		.func		= ftrace_stub,
+		.flags		= FTRACE_OPS_FL_STUB,
+	};
+	unsigned long size, i;
+	int err;
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
+	if (do_direct_lock)
+		mutex_lock(&direct_mutex);
+
+	/* Enable the tmp_ops to have the same functions as the direct ops */
+	ftrace_ops_init(&tmp_ops);
+	tmp_ops.func_hash = ops->func_hash;
+
+	err = register_ftrace_function_nolock(&tmp_ops);
+	if (err)
+		goto unlock;
+
+	/*
+	 * Now the ftrace_ops_list_func() is called to do the direct callers.
+	 * We can safely change the direct functions attached to each entry.
+	 */
+	mutex_lock(&ftrace_lock);
+
+	size = 1 << hash->size_bits;
+	for (i = 0; i < size; i++) {
+		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
+			tmp = __ftrace_lookup_ip(direct_functions, entry->ip);
+			if (!tmp)
+				continue;
+			tmp->direct = entry->direct;
+		}
+	}
+
+	mutex_unlock(&ftrace_lock);
+
+	/* Removing the tmp_ops will add the updated direct callers to the functions */
+	unregister_ftrace_function(&tmp_ops);
+
+unlock:
+	if (do_direct_lock)
+		mutex_unlock(&direct_mutex);
+	return err;
+}
+EXPORT_SYMBOL_GPL(modify_ftrace_direct_hash);
+
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 
 /**
-- 
2.50.1


