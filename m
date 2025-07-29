Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635A4C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qgzy6iwxohGdtifggVtmc58gMZbgfkT4+Q+nzZ4nRM=; b=1H3eAY+6G4j8j7DpyLRdGwtBV+
	Fy/Qi3wSknFgc6NRE3VubOsMUlrLxYI3zgBlx3RRjcH+Dt9ghSwqpMtvwMTRc5QlWlMj5aTX5+7Vm
	o7VJpGq22l2nzIzPpQMydHd3pgdUtYHDKvSYK7BOG2iaeg7/dgUOU2fWi1m5mLJLuTtssHjcTgywb
	a9z65FlACgWEUpB3/0WpBemTJYKsGANdbAcHPS6oOohhY6VSLAeonqG0622DCbcMEJaA/J0CLiXrs
	mfwj0DWdIlW4BarnyvmvjKOcEy5QL1UyiR3FgC3pWK0PPY5gGcJ2kDn5En++ByRaW2p9BOCFT5GJu
	LaMXM12w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugheu-0000000GXgg-3WV8;
	Tue, 29 Jul 2025 10:34:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughZP-0000000GWeY-0DmM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 10:28:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1961D44E99;
	Tue, 29 Jul 2025 10:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B207C4CEEF;
	Tue, 29 Jul 2025 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753784909;
	bh=Sm7jV+tRKsytGK5LOleOia6QLTmymRlF5GUTJcd927I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fa94HDatVkSI/VlhVI0V22z6g6CxlV/NoPqz+yc+zjKjJUkB+9QSzWB1X4RMqR+6s
	 Kc0V7nU/Nx4KMQirEt6DddN50VwYea+QdtZTQcYRJY0zya2q7v5M6F41xdT5ci2E33
	 xaAbUYW8p/b6ucLEhs5YXr9CUn9woOz/6ta/GtW/Qz3MwKnAaBUeBxbeRNK5JM+pcT
	 aRlY4mh7bvXmj3bAbFZwUxmVr8waN3MscHIRtxQJCfcGrV20eB+zjLCAk3GobxLkxF
	 5d01W12qAJdZsNr6RRUa6XvJ4TO3iN2Zw5+3TVtiLMiW4vELhmAlZeaSX2zNelYDLN
	 nS4YoTPAtwL0Q==
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
Subject: [RFC 01/10] ftrace: Make alloc_and_copy_ftrace_hash direct friendly
Date: Tue, 29 Jul 2025 12:28:04 +0200
Message-ID: <20250729102813.1531457-2-jolsa@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729102813.1531457-1-jolsa@kernel.org>
References: <20250729102813.1531457-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_032831_108328_8B1A5579 
X-CRM114-Status: GOOD (  10.95  )
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
index 4203fad56b6c..5b8f565a1258 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1190,7 +1190,7 @@ static void __add_hash_entry(struct ftrace_hash *hash,
 }
 
 static struct ftrace_func_entry *
-add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
+add_hash_entry_direct(struct ftrace_hash *hash, unsigned long ip, unsigned long direct)
 {
 	struct ftrace_func_entry *entry;
 
@@ -1199,11 +1199,18 @@ add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
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
@@ -1376,7 +1383,7 @@ alloc_and_copy_ftrace_hash(int size_bits, struct ftrace_hash *hash)
 	size = 1 << hash->size_bits;
 	for (i = 0; i < size; i++) {
 		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
-			if (add_hash_entry(new_hash, entry->ip) == NULL)
+			if (add_hash_entry_direct(new_hash, entry->ip, entry->direct) == NULL)
 				goto free_hash;
 		}
 	}
-- 
2.50.1


