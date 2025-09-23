Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD855CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOVC/UQpTK1E4ihSOpvRI521d8KgbW/p5uRWUs5NWpY=; b=m6OwmfJVTfd7zJfp6QcWd2iFYc
	JPQ/h+mNTMJWXjnIaLLorFhRpkfbBJSmk51vqTHj1v4tZkv8+iTUxFiziunCBeAx4wo89hUkIBFIa
	BWjaZAeekfWl3PJu9OdLBRsevgIeoTgyZ0WhGD3EY3jlcaxVrlFyydvm5PcWuDFv8/k+c9+fo6VK3
	wEVyMPfLhMTOW8YXglJyUGcVlMWVHPRCxtDPZeqsgOHuPtzHB/9rBxbgxOiNbcSwtYbTr5rA/gWRo
	d14ad3rudqdIRtc8kyvWV5+J1r6YeYCxtL3DrKZvXLNtWWZX3flMLjEXFLgKaBJWfY0YkH6l7NDxe
	cKIoUxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1AwG-0000000F14v-2fU6;
	Tue, 23 Sep 2025 21:52:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1AwE-0000000F13M-0KNQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 21:52:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD46B43263;
	Tue, 23 Sep 2025 21:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F2BC4CEF5;
	Tue, 23 Sep 2025 21:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758664361;
	bh=pmgvSXZ8M3DblJ5mReSvIJZRwy/X4JecZikM42Xh1AE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bWaFgWqA0PP9vYEvVPItBeOobenZz3qoM+P2SNYzAZs15aInDppLM96GRRkH+GaAr
	 2ErT/bv9j+Tay0R7AfvXMWXQbds/ipp02jc51MKsd+U6FSdeb8UDwWZJ1B7OyO4tpd
	 kvY1LAknkNHDrCMSWzTGcJvTOUpP7u+mZ353V7y/qut2do2VpvOmGz8btOj03VgA7X
	 1mgrQLbs7OX7QiHzZTAiRJGevmLXX9r6kPEywUJ2P5L9Rnnz6TRMicB1ABf1zjVijp
	 TzniDmpUdBRpNclKKUpFaF8Rk/hIDSY97XXPYHZMMbiVM29BxgE2MVUuoMg+UPK7kg
	 ycdOUo9yrhCoQ==
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
Subject: [PATCH 4/9] ftrace: Add modify_ftrace_direct_hash function
Date: Tue, 23 Sep 2025 23:51:42 +0200
Message-ID: <20250923215147.1571952-5-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923215147.1571952-1-jolsa@kernel.org>
References: <20250923215147.1571952-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_145242_170744_5686529D 
X-CRM114-Status: GOOD (  17.60  )
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
index 55f5ead5d4ff..1cf6d0bb9a81 100644
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
index ab5739f72933..4eb08817e4ee 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6427,6 +6427,64 @@ int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *ha
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
2.51.0


