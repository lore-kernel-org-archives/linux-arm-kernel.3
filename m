Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F5CCFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2ENU1+BuzMMRdvmKeXsmAm2o48QPMarMlIVdp73wtQ=; b=tIigaZjrsQCFGSGBcnojwh5vfF
	SvsNBMTSxowL2rCjOMveUeAuRvqtT5UgeLhKahm0Pj5Vm+qAofh7RnBDxGP6PQPR/jK09yZAGTxIU
	GntZmJUFAFG6ZcFt+/pB4L+7cRfeYTK5Pf7oF/HHBckgwwbU3MlMKqA+ylERWZcSxgH5QyEfjrJ1W
	PO20w2oAuEOnVbJA/VNXRWqAKnEngWmSIIoftdbN6kKO0dnOKL2f69qUiEspbN679r0hKDUI+9uvJ
	Fe6xtr/pnuvORKxB1Xk2w42bZsYK+x0LS1WEbDZUEu3eqE9Pm8NJ5Iy6jj3faJzNojs3wSEndAwXO
	lUKJlgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMC8q-00000007Rby-3AGd;
	Thu, 20 Nov 2025 21:24:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMC8o-00000007RbN-3xac
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:24:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17BF94361B;
	Thu, 20 Nov 2025 21:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB15C4CEF1;
	Thu, 20 Nov 2025 21:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763673874;
	bh=oeNb+XAyf1viA+5+4m2jeQ8qke3jBIhnjww7lRhsWv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HzgihrQWD4WHooWmm+FJzIEL3hm6gaK8lRcUGxAH0J8CuTrGQojVLXZD7fPAO2Y6+
	 /LSMQLhi6SHh1HwO/08tYGsdNQIYyb9uuuE/OU3+PCUFYGHQ8RshxAGxgmzc+rRpLc
	 3T+eT6rHvLU4M5Z/pHBoLr+LCQUdXDGmmijD4dTWAHQ4YosUiIaGQFVK6Y7cazPdXi
	 5TQ0mtlyuWGDdCocmw6xH9df1xI9yPLDhKfWjzuturwoJv3eqrp/1kg3XAv+3dJs7K
	 U0M8xoSei1I9KZ+uaZ+tCnZE+CWntUV58ZpX3o06xXftmMKpKTHbuVpMaVvGKaXrmL
	 d/V9nhYpeaJAw==
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
Subject: [PATCHv3 bpf-next 2/8] ftrace: Export some of hash related functions
Date: Thu, 20 Nov 2025 22:23:56 +0100
Message-ID: <20251120212402.466524-3-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251120212402.466524-1-jolsa@kernel.org>
References: <20251120212402.466524-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_132435_027419_5227870F 
X-CRM114-Status: GOOD (  11.82  )
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

We are going to use these functions in following changes.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h | 16 ++++++++++++++++
 kernel/trace/ftrace.c  |  7 +++----
 kernel/trace/trace.h   |  8 --------
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 07f8c309e432..5752553bff60 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -405,6 +405,22 @@ enum ftrace_ops_cmd {
 typedef int (*ftrace_ops_func_t)(struct ftrace_ops *op, enum ftrace_ops_cmd cmd);
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+
+#define FTRACE_HASH_DEFAULT_BITS 10
+
+struct ftrace_hash {
+	unsigned long		size_bits;
+	struct hlist_head	*buckets;
+	unsigned long		count;
+	unsigned long		flags;
+	struct rcu_head		rcu;
+};
+
+struct ftrace_hash *alloc_ftrace_hash(int size_bits);
+void free_ftrace_hash(struct ftrace_hash *hash);
+struct ftrace_func_entry *add_hash_entry_direct(struct ftrace_hash *hash,
+						unsigned long ip, unsigned long direct);
+
 /* The hash used to know what functions callbacks trace */
 struct ftrace_ops_hash {
 	struct ftrace_hash __rcu	*notrace_hash;
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 0e3714b796d9..e6ccf572c5f6 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -68,7 +68,6 @@
 	})
 
 /* hash bits for specific function selection */
-#define FTRACE_HASH_DEFAULT_BITS 10
 #define FTRACE_HASH_MAX_BITS 12
 
 #ifdef CONFIG_DYNAMIC_FTRACE
@@ -1185,7 +1184,7 @@ static void __add_hash_entry(struct ftrace_hash *hash,
 	hash->count++;
 }
 
-static struct ftrace_func_entry *
+struct ftrace_func_entry *
 add_hash_entry_direct(struct ftrace_hash *hash, unsigned long ip, unsigned long direct)
 {
 	struct ftrace_func_entry *entry;
@@ -1265,7 +1264,7 @@ static void clear_ftrace_mod_list(struct list_head *head)
 	mutex_unlock(&ftrace_lock);
 }
 
-static void free_ftrace_hash(struct ftrace_hash *hash)
+void free_ftrace_hash(struct ftrace_hash *hash)
 {
 	if (!hash || hash == EMPTY_HASH)
 		return;
@@ -1305,7 +1304,7 @@ void ftrace_free_filter(struct ftrace_ops *ops)
 }
 EXPORT_SYMBOL_GPL(ftrace_free_filter);
 
-static struct ftrace_hash *alloc_ftrace_hash(int size_bits)
+struct ftrace_hash *alloc_ftrace_hash(int size_bits)
 {
 	struct ftrace_hash *hash;
 	int size;
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 85eabb454bee..62e0ac625f65 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -899,14 +899,6 @@ enum {
 	FTRACE_HASH_FL_MOD	= (1 << 0),
 };
 
-struct ftrace_hash {
-	unsigned long		size_bits;
-	struct hlist_head	*buckets;
-	unsigned long		count;
-	unsigned long		flags;
-	struct rcu_head		rcu;
-};
-
 struct ftrace_func_entry *
 ftrace_lookup_ip(struct ftrace_hash *hash, unsigned long ip);
 
-- 
2.51.1


