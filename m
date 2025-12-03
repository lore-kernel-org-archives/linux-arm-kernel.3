Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC8AD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKA+xfjwefFUUvJTmjZaRE6tZ2usyXzS031PlcTstds=; b=PQYhAscH+Du1EJty7sNbX3Dh0n
	seqA6oUAVFDlOLJZd2MKBeMXgtFYYQHGNcMFRdhRxHZ9++7BKuRB4Sbr+Mc/mbVgwmauqHGDMh6dn
	QaJxUlRXeDw43ShYrqIM9UPrqtPzaCRSfPWpOx2XGDTC4dOPLaKvC4XBkAtkvmQLcwsw4yH4LreB5
	5g9FMeIMsWS2kbc1Bx5Eecq+/KLWASmEtQeQtxgpSrgxxbXHSDH9e7JgngRNmaZeuNYYYZx1nIX6D
	nIurm/NhaGHbqpV0MUwHz7lGs4cZR0dx+hJb4yZhW4piqpGtBogp8KLDNoNodsnu6r/LyM71hbv5N
	v/Ug9yaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiAr-00000006IrE-27PW;
	Wed, 03 Dec 2025 08:25:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiAl-00000006Iog-3uSP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98B3440945;
	Wed,  3 Dec 2025 08:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6150DC4CEFB;
	Wed,  3 Dec 2025 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764750315;
	bh=pLgdjqwxCmhdWC6Ct/H1SR3MVjIRGtL9kTHwK/vSQVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zn8G+9ZKr+LfhPle/3GxYOBDUz5mKUF0Mk1s4FShEHpgZeVYHOL6VOMlWE22IG9G/
	 B/g7mAdFI2/PcqVDaurUoITlvirqRV7SiEoP1SR+d6MkLOegg97QTxRcjpP2cE2xKy
	 2ZUpSYz5ipWao2WmDEj54jLdc29c+5DGLib6QARHRvaRCIQKiVEyYBcSOsyWbRl8Fr
	 MT/Mxa2X61YnLEk0mxRsa0cYLfSiR0VX5faFFUGlWukljC7DRZvtlK0tG/5iFhwOCw
	 oGcSeLbidHqlFTcOXNiuXIqhpmuOez/zsQF5FjdF+slLyq7HdoX330uERIfaUywGU4
	 7t3UOHMKvV/Fw==
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
Subject: [PATCHv4 bpf-next 6/9] ftrace: Add update_ftrace_direct_mod function
Date: Wed,  3 Dec 2025 09:23:59 +0100
Message-ID: <20251203082402.78816-7-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203082402.78816-1-jolsa@kernel.org>
References: <20251203082402.78816-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_002516_022284_F6E6D5F9 
X-CRM114-Status: GOOD (  18.01  )
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

Adding update_ftrace_direct_mod function that modifies all entries
(ip -> direct) provided in hash argument to direct ftrace ops and
updates its attachments.

The difference to current modify_ftrace_direct is:
- hash argument that allows to modify multiple ip -> direct
  entries at once

This change will allow us to have simple ftrace_ops for all bpf
direct interface users in following changes.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h |  6 ++++
 kernel/trace/ftrace.c  | 72 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index bac9dd784826..c27b7381c5f1 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -552,6 +552,7 @@ int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
 
 int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash);
 int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash);
+int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock);
 
 void ftrace_stub_direct_tramp(void);
 
@@ -589,6 +590,11 @@ static inline int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace
 	return -ENODEV;
 }
 
+static inline int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
+{
+	return -ENODEV;
+}
+
 /*
  * This must be implemented by the architecture.
  * It is the way the ftrace direct_ops helper, when called
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 01e830be20e3..c77f620b3eb3 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6490,6 +6490,78 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
 	return err;
 }
 
+int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
+{
+	struct ftrace_func_entry *entry, *tmp;
+	static struct ftrace_ops tmp_ops = {
+		.func		= ftrace_stub,
+		.flags		= FTRACE_OPS_FL_STUB,
+	};
+	struct ftrace_hash *orig_hash;
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
+	if (do_direct_lock)
+		mutex_lock(&direct_mutex);
+
+	orig_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
+	if (!orig_hash)
+		goto unlock;
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
+	 * Call __ftrace_hash_update_ipmodify() here, so that we can call
+	 * ops->ops_func for the ops. This is needed because the above
+	 * register_ftrace_function_nolock() worked on tmp_ops.
+	 */
+	err = __ftrace_hash_update_ipmodify(ops, orig_hash, orig_hash, true);
+	if (err)
+		goto out;
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
+out:
+	/* Removing the tmp_ops will add the updated direct callers to the functions */
+	unregister_ftrace_function(&tmp_ops);
+
+unlock:
+	if (do_direct_lock)
+		mutex_unlock(&direct_mutex);
+	return err;
+}
+
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 
 /**
-- 
2.52.0


