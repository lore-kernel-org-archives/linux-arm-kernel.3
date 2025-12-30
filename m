Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCA0EE0205
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2F4G11x+D83Kwbp972H0KtwiYYiznLpfTZsLQ/AfHI=; b=EiN3tjU55zvPixREFwZenw1AZZ
	l9cNk0Uiv+MpPxAQILgU+J+1pFF43rPyzeh7V1hL8nRafzwMdVJgQjWOyMAPheO3FS7J7EiN5S6H5
	+jNvIrdJ9mmbHb5Kke4zg3cAIVvEPcvxvPIPGHyS/jMAOwAY/d0CmYWAX0o5WgC0S8+0JTMTTvkmw
	s82IVVRVOIUT8UoNBIS6jzC5Si/C/txRMq3pDqyzxve5fjN6MGPHp+PMkbe/D6vs0jkC4H7nx573t
	GFTqmkVGS+EEBYG2Xd4Im0cNdsLHyR2n831SVYUvu9n0JN8iWallH9q7kCzkZjsLNxMJDgx1Jpmjj
	L0ZmdEww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vab3n-00000004xCW-2a7Z;
	Tue, 30 Dec 2025 14:50:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vab3k-00000004xBF-2utR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 14:50:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7D1740139;
	Tue, 30 Dec 2025 14:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC971C4CEFB;
	Tue, 30 Dec 2025 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767106251;
	bh=xAdRIPxz2/hvjSXbuibVtNtw7JeJSHCTtXeA/1xe6eY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SsHpaNMQWKuuIMXh4V+Y9C2r9oS3M/R/Yq/heDyjybhBN2ZZXIyBXDrbkUT6AIToF
	 Wg1WA0Jbw5rP8B3ZoKYbDkdnZ6arZNZEMAZdZ41GDmcEmUUDNWi6dsFYC4Bgy55ocf
	 qv6dRvAELINeaE9hnXrOwyyKvlnNAng6DDUEHmhCMvJIXpw19/zVEcSB/IkEhUE8RV
	 goOxorFxmZjVj3bC8T1xjsB8a1azak73xL/vbLy2YwWgGQVubsip1l1GKzz4UZLOsE
	 fEBI99K5BWwSgep2cOOsD2BW8OFhiW70ezEzPJtjwp4Fn7kntiH5PydEQoG2UHHoEY
	 tIBmoNbTwOeog==
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
Subject: [PATCHv6 bpf-next 3/9] ftrace: Export some of hash related functions
Date: Tue, 30 Dec 2025 15:50:04 +0100
Message-ID: <20251230145010.103439-4-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230145010.103439-1-jolsa@kernel.org>
References: <20251230145010.103439-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_065052_774724_2FDEECF1 
X-CRM114-Status: GOOD (  12.70  )
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
 include/linux/ftrace.h |  9 +++++++++
 kernel/trace/ftrace.c  | 13 ++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 41c9bb08d4e4..472f2d8a4c0f 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -82,6 +82,7 @@ static inline void early_trace_init(void) { }
 
 struct module;
 struct ftrace_hash;
+struct ftrace_func_entry;
 
 #if defined(CONFIG_FUNCTION_TRACER) && defined(CONFIG_MODULES) && \
 	defined(CONFIG_DYNAMIC_FTRACE)
@@ -405,6 +406,14 @@ enum ftrace_ops_cmd {
 typedef int (*ftrace_ops_func_t)(struct ftrace_ops *op, enum ftrace_ops_cmd cmd);
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+
+#define FTRACE_HASH_DEFAULT_BITS 10
+
+struct ftrace_hash *alloc_ftrace_hash(int size_bits);
+void free_ftrace_hash(struct ftrace_hash *hash);
+struct ftrace_func_entry *add_ftrace_hash_entry_direct(struct ftrace_hash *hash,
+						       unsigned long ip, unsigned long direct);
+
 /* The hash used to know what functions callbacks trace */
 struct ftrace_ops_hash {
 	struct ftrace_hash __rcu	*notrace_hash;
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 409271aa8dad..3ca3aee5f886 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -68,7 +68,6 @@
 	})
 
 /* hash bits for specific function selection */
-#define FTRACE_HASH_DEFAULT_BITS 10
 #define FTRACE_HASH_MAX_BITS 12
 
 #ifdef CONFIG_DYNAMIC_FTRACE
@@ -1211,8 +1210,8 @@ static void __add_hash_entry(struct ftrace_hash *hash,
 	hash->count++;
 }
 
-static struct ftrace_func_entry *
-add_hash_entry_direct(struct ftrace_hash *hash, unsigned long ip, unsigned long direct)
+struct ftrace_func_entry *
+add_ftrace_hash_entry_direct(struct ftrace_hash *hash, unsigned long ip, unsigned long direct)
 {
 	struct ftrace_func_entry *entry;
 
@@ -1230,7 +1229,7 @@ add_hash_entry_direct(struct ftrace_hash *hash, unsigned long ip, unsigned long
 static struct ftrace_func_entry *
 add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
 {
-	return add_hash_entry_direct(hash, ip, 0);
+	return add_ftrace_hash_entry_direct(hash, ip, 0);
 }
 
 static void
@@ -1291,7 +1290,7 @@ static void clear_ftrace_mod_list(struct list_head *head)
 	mutex_unlock(&ftrace_lock);
 }
 
-static void free_ftrace_hash(struct ftrace_hash *hash)
+void free_ftrace_hash(struct ftrace_hash *hash)
 {
 	if (!hash || hash == EMPTY_HASH)
 		return;
@@ -1331,7 +1330,7 @@ void ftrace_free_filter(struct ftrace_ops *ops)
 }
 EXPORT_SYMBOL_GPL(ftrace_free_filter);
 
-static struct ftrace_hash *alloc_ftrace_hash(int size_bits)
+struct ftrace_hash *alloc_ftrace_hash(int size_bits)
 {
 	struct ftrace_hash *hash;
 	int size;
@@ -1405,7 +1404,7 @@ alloc_and_copy_ftrace_hash(int size_bits, struct ftrace_hash *hash)
 	size = 1 << hash->size_bits;
 	for (i = 0; i < size; i++) {
 		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
-			if (add_hash_entry_direct(new_hash, entry->ip, entry->direct) == NULL)
+			if (add_ftrace_hash_entry_direct(new_hash, entry->ip, entry->direct) == NULL)
 				goto free_hash;
 		}
 	}
-- 
2.52.0


