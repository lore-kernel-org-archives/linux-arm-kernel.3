Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47B0CD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3n7VgvFCLSz8JV7XPuzRdpY4FKOAm8fRWH1je80ytA=; b=Lwy0YV+aGtOuzUAJzmFZpRr0qu
	YzGfBIqNXbi4p3vAnE0eZIqwMIuBp7snoOfFkWv1z1Ege/eDeSH8j2SKRsPuflKhSS9AOgkV7HSaq
	51urHOvcBCCUNEZkHqgUrz2kw0H+SYQZ43LCdMHFKBlne8VtTOjJ9o2VPAOdwycLRhMVxtyxhRNVs
	wWFuRjAKbSKYII9y1mID/Iepgm1qZd9Iz7547Qw2NzTOc/ABt/0FQCv5AzDWb21EIfFL9Z6ZQ1YWq
	Ti8E1qYBHBy3yrAsIxBqd3rc26+GjpA6Qx81aRVweLPnYv0MBweVqpDFIK9m9UdjQYyVaEzOe42dG
	Ln2UlS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWar-0000000ATMh-3yr6;
	Thu, 13 Nov 2025 12:38:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWap-0000000ATLs-0Sr3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 12:38:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C95B8406D2;
	Thu, 13 Nov 2025 12:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E0DC19424;
	Thu, 13 Nov 2025 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763037506;
	bh=YnnW7zN+aKxuUBmWBuWqRRKoptp3OePRxKnEM6fAzmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eakqP6OLvQySInHmGJPnCvI6x0YzqEvAB/m/d5qTanF1B1Z93+W8G3F71AxCBLLpu
	 Q3QuVL6855HtTW4TzGMdkJgXyCn3vGgFRgqJhAzSluxdOhy8Cpz+Ik3VcY+LLxOzZB
	 ZhBygtK0ivDcM4L8GU+XRZB6mmaQEtwwWc2iSXdp/NmvV7KVrBRBb31Wvp2Z2dKBPo
	 oYb2jpNBnuKPNb/Atl07i9GOgCdI9cw0IovQQbB2l/cm8bcqDzwe/Fk0uqakxrf0c3
	 xQ05qt2TZhhzfqUebUeGBbWnfItTZPFJiO0+jdQDEF5Vuk7eZVT2wz3pNY/j/58MYr
	 cSdhPzu7v6z5Q==
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
Subject: [PATCHv2 bpf-next 1/8] ftrace: Make alloc_and_copy_ftrace_hash direct friendly
Date: Thu, 13 Nov 2025 13:37:43 +0100
Message-ID: <20251113123750.2507435-2-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113123750.2507435-1-jolsa@kernel.org>
References: <20251113123750.2507435-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_043827_168960_14FE6C3D 
X-CRM114-Status: GOOD (  10.58  )
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
index 59cfacb8a5bb..0e3714b796d9 100644
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
2.51.1


