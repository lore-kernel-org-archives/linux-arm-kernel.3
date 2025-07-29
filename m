Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4298FC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4ebRnRYbC3v5Mm26ZqBbGr74D6eA+YPuyIxB4rRlAM=; b=24kityrxM2S1fdKjnAZdIssLcE
	M4SFw/RqmRTdxEGSatk2JN/U/1WtHajll5KHgi1EIovAGHjYgGt6NYYQu+AF+YFBRPtgZn7ESVeNj
	MMdJ7nM+egsWMuX4yNfUzhEEav4aM/9hJ1IkzGtKA4Y0Z/r9l4C+/vjdGJeqOYf80U/T0mFkEKdSm
	Itfv8DPlAf1ftpC/kFgRW8/M5bqzOezJTTE1SATjoAKXfO68SnUp7nu6PZ9o31muR2TWkEu3pXg2e
	qiVyRVBgFZwHxmbqJHCjQo6nvxsLpiLTeKhnfhiSxkYFjho8R913SipTpPwsJwYYJIL5lVGsQrPDx
	eP0neGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughoe-0000000GYwm-0GMv;
	Tue, 29 Jul 2025 10:44:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugha5-0000000GWq1-0vS5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 10:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66795A54E6C;
	Tue, 29 Jul 2025 10:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FCFC4CEEF;
	Tue, 29 Jul 2025 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753784952;
	bh=s36VlYHt7rzpyx/CrkVrQ1GGY7J1e5RhRFc94AGzl2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fY1iq88jHx1GrHviGUxlO4tWGmKap18d55ll7NauQ+Mcq2RPpapqthWT85hfQeDn3
	 7yqEphpl+ThJweK0D03HOUAkr8NU31Gqbssej/nk2Zsc82MCTXIv3d/deV/lfbuzoa
	 Tz+xdweZ5lVOsbnekAAAYcsXeoCPp18xQ5bgVMVGFcWKX6M9mPNlJb3HIMXX/twinF
	 aLhy7gMyHR31gfNdf1ktTYnSgBih1tAgdDvnQESrgyvoNfiKMECvxEpSOtGHgyA+Cz
	 QbNFKR/Ue7Qx3CKCTikYs8xeLbPwg+kXXnlg9fSzmXNB5MV6AXVEp5/OFmFJ1cGTgu
	 aJuPWlhNquGIQ==
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
Subject: [RFC 05/10] ftrace: Export some of hash related functions
Date: Tue, 29 Jul 2025 12:28:08 +0200
Message-ID: <20250729102813.1531457-6-jolsa@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729102813.1531457-1-jolsa@kernel.org>
References: <20250729102813.1531457-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_032913_393984_26B00020 
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
index 8761765d9abc..9a6fcdafeda2 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -397,6 +397,22 @@ enum ftrace_ops_cmd {
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
index 755d5550ac44..fcb8f2d3172b 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -68,7 +68,6 @@
 	})
 
 /* hash bits for specific function selection */
-#define FTRACE_HASH_DEFAULT_BITS 10
 #define FTRACE_HASH_MAX_BITS 12
 
 #ifdef CONFIG_DYNAMIC_FTRACE
@@ -1189,7 +1188,7 @@ static void __add_hash_entry(struct ftrace_hash *hash,
 	hash->count++;
 }
 
-static struct ftrace_func_entry *
+struct ftrace_func_entry *
 add_hash_entry_direct(struct ftrace_hash *hash, unsigned long ip, unsigned long direct)
 {
 	struct ftrace_func_entry *entry;
@@ -1269,7 +1268,7 @@ static void clear_ftrace_mod_list(struct list_head *head)
 	mutex_unlock(&ftrace_lock);
 }
 
-static void free_ftrace_hash(struct ftrace_hash *hash)
+void free_ftrace_hash(struct ftrace_hash *hash)
 {
 	if (!hash || hash == EMPTY_HASH)
 		return;
@@ -1309,7 +1308,7 @@ void ftrace_free_filter(struct ftrace_ops *ops)
 }
 EXPORT_SYMBOL_GPL(ftrace_free_filter);
 
-static struct ftrace_hash *alloc_ftrace_hash(int size_bits)
+struct ftrace_hash *alloc_ftrace_hash(int size_bits)
 {
 	struct ftrace_hash *hash;
 	int size;
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index bd084953a98b..74ef7755f361 100644
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
2.50.1


