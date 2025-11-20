Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5890BCFA446
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5C8F2R2Xjnq7K2JhN/g6xQ7N7CW0aoyg31A3JTRXN1s=; b=lu1drvN7GK6hdG0186ca6Q1jUX
	YOyuNjRjqVuAwxZ2YdTwN5qtBpXiKyQKFg5irISLAI3RBmWi1jayWYFiQreGzQOSKFa1b4xztSF8r
	pcMseXMDYaQnwfzACvLcuZ2/M3mfUPiI4ueqwDZp669h8j1WkyZxjcxMW1YGs5Vh2AXqRU6v0kv8e
	DXKouRWWMv7woYs4x2ytlE51OziPkAe79uLXdesBA5O251sE6IkCyFHmi15KH+c/Fmyg5cbVAkWNU
	jfEd3yUn7ycWUSyb5Xlmeed7XmlkmpBPmP+cj0O7+16fNC/qZcnmkNpI3Inhf3CPCJFgEsWsqeNq1
	EDcGduDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMC9W-00000007RtX-2WUc;
	Thu, 20 Nov 2025 21:25:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMC9U-00000007Rs3-1F9y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CFD344339;
	Thu, 20 Nov 2025 21:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E85C4CEF1;
	Thu, 20 Nov 2025 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763673915;
	bh=iykBhG4b2o2xbV0/ykgJE+6aevyvXReLas2ZH30xEX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/LXjUSJDXrV3FKgcr7yr/lvJ7wQMpxSVnZfG2VfhpUDczFVtjgmFIQhWaHKJlLui
	 wqeyBeLajzWJK926gPWVX14J97ZvKfL55wNtYIZ/iAkzS4VZH3QxdGf/d/J7fo3qFT
	 p7yjX8xo8+5alfByJ+V0ilgrCQjbAxDdg6U0DU0Y5HAKr5N/U8saYygOBkExOBzX3q
	 nmdZNlCWvmNOs9nyZcc8V1u+iTYNf/owlWILQLzxCQ32U2wPh5IoRAJysGZb7uRY8p
	 xlja37iv4AnQeWYbyipsy1RiudlSs0wEqUks4XmyrY4527liBqYZ2kMo/cvENntCtS
	 xbfafu2gPrsSQ==
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
Subject: [PATCHv3 bpf-next 6/8] bpf: Add trampoline ip hash table
Date: Thu, 20 Nov 2025 22:24:00 +0100
Message-ID: <20251120212402.466524-7-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251120212402.466524-1-jolsa@kernel.org>
References: <20251120212402.466524-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_132516_372962_9C322ABD 
X-CRM114-Status: GOOD (  15.19  )
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

Following changes need to lookup trampoline based on its ip address,
adding hash table for that.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/bpf.h     |  7 +++++--
 kernel/bpf/trampoline.c | 30 +++++++++++++++++++-----------
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 09d5dc541d1c..ad86857a8562 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1295,14 +1295,17 @@ struct bpf_tramp_image {
 };
 
 struct bpf_trampoline {
-	/* hlist for trampoline_table */
-	struct hlist_node hlist;
+	/* hlist for trampoline_key_table */
+	struct hlist_node hlist_key;
+	/* hlist for trampoline_ip_table */
+	struct hlist_node hlist_ip;
 	struct ftrace_ops *fops;
 	/* serializes access to fields of this trampoline */
 	struct mutex mutex;
 	refcount_t refcnt;
 	u32 flags;
 	u64 key;
+	unsigned long ip;
 	struct {
 		struct btf_func_model model;
 		void *addr;
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 04104397c432..f33693061c2e 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -24,9 +24,10 @@ const struct bpf_prog_ops bpf_extension_prog_ops = {
 #define TRAMPOLINE_HASH_BITS 10
 #define TRAMPOLINE_TABLE_SIZE (1 << TRAMPOLINE_HASH_BITS)
 
-static struct hlist_head trampoline_table[TRAMPOLINE_TABLE_SIZE];
+static struct hlist_head trampoline_key_table[TRAMPOLINE_TABLE_SIZE];
+static struct hlist_head trampoline_ip_table[TRAMPOLINE_TABLE_SIZE];
 
-/* serializes access to trampoline_table */
+/* serializes access to trampoline tables */
 static DEFINE_MUTEX(trampoline_mutex);
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
@@ -135,15 +136,15 @@ void bpf_image_ksym_del(struct bpf_ksym *ksym)
 			   PAGE_SIZE, true, ksym->name);
 }
 
-static struct bpf_trampoline *bpf_trampoline_lookup(u64 key)
+static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
 {
 	struct bpf_trampoline *tr;
 	struct hlist_head *head;
 	int i;
 
 	mutex_lock(&trampoline_mutex);
-	head = &trampoline_table[hash_64(key, TRAMPOLINE_HASH_BITS)];
-	hlist_for_each_entry(tr, head, hlist) {
+	head = &trampoline_key_table[hash_64(key, TRAMPOLINE_HASH_BITS)];
+	hlist_for_each_entry(tr, head, hlist_key) {
 		if (tr->key == key) {
 			refcount_inc(&tr->refcnt);
 			goto out;
@@ -164,8 +165,12 @@ static struct bpf_trampoline *bpf_trampoline_lookup(u64 key)
 #endif
 
 	tr->key = key;
-	INIT_HLIST_NODE(&tr->hlist);
-	hlist_add_head(&tr->hlist, head);
+	tr->ip = ftrace_location(ip);
+	INIT_HLIST_NODE(&tr->hlist_key);
+	INIT_HLIST_NODE(&tr->hlist_ip);
+	hlist_add_head(&tr->hlist_key, head);
+	head = &trampoline_ip_table[hash_64(tr->ip, TRAMPOLINE_HASH_BITS)];
+	hlist_add_head(&tr->hlist_ip, head);
 	refcount_set(&tr->refcnt, 1);
 	mutex_init(&tr->mutex);
 	for (i = 0; i < BPF_TRAMP_MAX; i++)
@@ -801,7 +806,7 @@ void bpf_trampoline_unlink_cgroup_shim(struct bpf_prog *prog)
 					 prog->aux->attach_btf_id);
 
 	bpf_lsm_find_cgroup_shim(prog, &bpf_func);
-	tr = bpf_trampoline_lookup(key);
+	tr = bpf_trampoline_lookup(key, 0);
 	if (WARN_ON_ONCE(!tr))
 		return;
 
@@ -821,7 +826,7 @@ struct bpf_trampoline *bpf_trampoline_get(u64 key,
 {
 	struct bpf_trampoline *tr;
 
-	tr = bpf_trampoline_lookup(key);
+	tr = bpf_trampoline_lookup(key, tgt_info->tgt_addr);
 	if (!tr)
 		return NULL;
 
@@ -857,7 +862,8 @@ void bpf_trampoline_put(struct bpf_trampoline *tr)
 	 * fexit progs. The fentry-only trampoline will be freed via
 	 * multiple rcu callbacks.
 	 */
-	hlist_del(&tr->hlist);
+	hlist_del(&tr->hlist_key);
+	hlist_del(&tr->hlist_ip);
 	if (tr->fops) {
 		ftrace_free_filter(tr->fops);
 		kfree(tr->fops);
@@ -1130,7 +1136,9 @@ static int __init init_trampolines(void)
 	int i;
 
 	for (i = 0; i < TRAMPOLINE_TABLE_SIZE; i++)
-		INIT_HLIST_HEAD(&trampoline_table[i]);
+		INIT_HLIST_HEAD(&trampoline_key_table[i]);
+	for (i = 0; i < TRAMPOLINE_TABLE_SIZE; i++)
+		INIT_HLIST_HEAD(&trampoline_ip_table[i]);
 	return 0;
 }
 late_initcall(init_trampolines);
-- 
2.51.1


