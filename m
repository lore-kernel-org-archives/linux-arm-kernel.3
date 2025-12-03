Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B217D1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxWQWcPnYrsJ1U/G0OBQanAnVF+AAx0tOiCO+Io60oM=; b=IVmveIa/Qr+beeYm8LfRDv+gAh
	fQPuNJWgEtfvLenvaU2Wu028IoW4AWgXAAczOMzctInVulcFI9c9SwYLXVs/wKxM4lY5clqMgiyu1
	IUJRClk4Wf7svI2fUQ8EE0ofZLQKLN/QZwDT93Qid3vjdQuGzfC4uaxLa+Em4HI7HRTaqObsowl2b
	lMvAfS64x+d2IuuUoWKrQH31fLYs+F4McSmT7vvaN0OgWFmNG5OT6TQqx8jduKO2I9PbcSSvmAf3V
	WFLJ9X20/PZC0QhW58xKPMOMeLiziwNvTjv+a6Hd82I6dYceRbA9yxq9or2XkIzlYZ4ppkSI3OHTs
	/iVv+Rhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiA7-00000006IUs-3A7z;
	Wed, 03 Dec 2025 08:24:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiA6-00000006IUa-3opM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:24:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D77560172;
	Wed,  3 Dec 2025 08:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10F9C4CEFB;
	Wed,  3 Dec 2025 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764750273;
	bh=wjKeRmILuEv3XhFbvkHTofLX7c9w7rQEYLqUWe4Qoek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WxUJfuJPyPpworw3v/WLpFY416v3SYtgNevvykumUYKWYbHWCIKX73mSlUDOEDAb0
	 TVdVlaXQjrSS4mRrg8WDIXOFL1y/7XVw30DvGZnWefyFAHWnS8ELvSOZqGjRjV9t0+
	 tqGMmqoQogZGf9+tjbvIT8TTzkxWTAyc82Q5nEQngMrJDhIYn5XvIjaUUdIMDd0si+
	 lz9vFDiW99tuVzl94LayvsW+YZLTy7kM2nEPz2PuXjeULezuWgw0eBL/N6bn+V3M6i
	 rB7177AyPub7QnvbUc7IBKjXXyKpqtBIclScPrnP1jgXmU7PfQyhaRvu/VrYtyx1TQ
	 pkntOn4XjWBvw==
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
Subject: [PATCHv4 bpf-next 2/9] ftrace: Make alloc_and_copy_ftrace_hash direct friendly
Date: Wed,  3 Dec 2025 09:23:55 +0100
Message-ID: <20251203082402.78816-3-jolsa@kernel.org>
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

Make alloc_and_copy_ftrace_hash to copy also direct address
for each hash entry.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 kernel/trace/ftrace.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index b0dc911411f1..7e3a81bd6f1e 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1186,7 +1186,7 @@ static void __add_hash_entry(struct ftrace_hash *hash,
 }
 
 static struct ftrace_func_entry *
-add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
+add_hash_entry_direct(struct ftrace_hash *hash, unsigned long ip, unsigned long direct)
 {
 	struct ftrace_func_entry *entry;
 
@@ -1195,11 +1195,18 @@ add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
 		return NULL;
 
 	entry->ip = ip;
+	entry->direct = direct;
 	__add_hash_entry(hash, entry);
 
 	return entry;
 }
 
+static struct ftrace_func_entry *
+add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
+{
+	return add_hash_entry_direct(hash, ip, 0);
+}
+
 static void
 free_hash_entry(struct ftrace_hash *hash,
 		  struct ftrace_func_entry *entry)
@@ -1372,7 +1379,7 @@ alloc_and_copy_ftrace_hash(int size_bits, struct ftrace_hash *hash)
 	size = 1 << hash->size_bits;
 	for (i = 0; i < size; i++) {
 		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
-			if (add_hash_entry(new_hash, entry->ip) == NULL)
+			if (add_hash_entry_direct(new_hash, entry->ip, entry->direct) == NULL)
 				goto free_hash;
 		}
 	}
-- 
2.52.0


