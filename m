Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A143BD1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f42YTaGthWxA3tl72OLTyur26q8KLYwPP+rVSWdVK/Y=; b=nmdSlyF7QiVz7/yf4tKztoblHv
	xGrTvhsQQWt+SiIh0aOFFgL7GZbJsrHRItXYlo0XBm1j2oe7YfFNszNR243Q1KWH8s9a7+1bpBUSP
	MftJP1LkyW6aVda2k5GAs+In8vP7sK6Btt2BkyStQikww9FWvNWVRFILtEWenKBIgkxYKXFB8BlHR
	j+c3el6mS7SwN+aXGQTvjPoH2iV7leRBL5Eh6rQ3InyB10gMqKgcTvbk3BPJKtMe6Mi5SNpdXRIVz
	CvyKZ1y8N9EfsJL+oW/VtfA6vyV1uSBI+o045jjg0+YfAMVeG/7nDu6Vv6udeLm0qEc/4jRnbDvSk
	3Ih3YOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiAI-00000006IZ2-1X0o;
	Wed, 03 Dec 2025 08:24:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiAH-00000006IYZ-1K0H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BCAEF6019B;
	Wed,  3 Dec 2025 08:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C68AC4CEFB;
	Wed,  3 Dec 2025 08:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764750284;
	bh=qzSU7P/h2A+9c5oHsCS4glXg/cUYxo9v5c2ips0x2Yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fNfZuhJNaBFBy/E3xge+z6kXPUGnKw3UNQehHnhpG7M2QMShfTlHyhCglDx+cpcrW
	 RtkPiJokeMDrYSE2l4hodZYu7mh/XWpsBw61HoiujSO+hnYBgEeArklgDE6jcT9yBY
	 a0GyoijzavtfZVwIMRyOdsxzkC6zRY3e25bZKgSgjkBMOp/8Y+TmrASnPCGBatfYg4
	 M17Q7wAEg/0UF/iqbqG8dKaSDWRCNMXZj6gsva6Dj7ILyEsuuUOZdS27O82jpU4Zt1
	 caJ6S3fWK3JeqUvfs+SFHOdr8UYC9+h+1S1YGJMWO4E9UuAcdEnOtTJO6vSQJdYGW6
	 TFFnPfA0KDa3w==
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
Subject: [PATCHv4 bpf-next 3/9] ftrace: Export some of hash related functions
Date: Wed,  3 Dec 2025 09:23:56 +0100
Message-ID: <20251203082402.78816-4-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203082402.78816-1-jolsa@kernel.org>
References: <20251203082402.78816-1-jolsa@kernel.org>
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

We are going to use these functions in following changes.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h | 16 ++++++++++++++++
 kernel/trace/ftrace.c  |  7 +++----
 kernel/trace/trace.h   |  8 --------
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 505b7d3f5641..8c034b028af4 100644
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
index 7e3a81bd6f1e..84aee9096a9e 100644
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
2.52.0


