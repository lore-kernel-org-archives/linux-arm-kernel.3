Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69104C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=0/mDtlBikO57slA120u7KN6mjQODM33+MQPnGr4fUrc=; b=dABXJIUdZPvEBJ
	ad1Y5ksAzzMDlsmG+A0ZKP61rLQR8wHvbiZaheGh9uzPb4AKPn46L1LntnHpkAv2bCAppgBw3IygC
	BZi31TVKkbYjgdkgqADVyUY5lJKKESJ904BqcqiJAESBhRAKUNqJir0djhMKty/XdvhsGKC+jlmXM
	LFv+Vk78SHwybDVHUyXA0+tCXun53LoBunoxMlEcjTEwhHm4UXgNA24O5IK0wifFBS2VWXf8wlDXr
	qhgwNe9+nC02aiMdqOjICyTt1f8mOsp+MxOqdjOYNMSeNWk6GJNIVp0rDWRh1vke9wFu6/83k1X3m
	djOVk5dQoEKiqdoApV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidHY-0000000C47K-3Zov;
	Thu, 13 Feb 2025 17:45:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiby5-0000000BkAi-1itk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:21:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C7995C5857;
	Thu, 13 Feb 2025 16:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006D4C4CEE7;
	Thu, 13 Feb 2025 16:21:36 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tibyE-00000001qcx-21Ty;
	Thu, 13 Feb 2025 11:21:46 -0500
Message-ID: <20250213162146.332262157@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 13 Feb 2025 11:20:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Zheng Yejian <zhengyejian1@huawei.com>,
 Martin  Kelly <martin.kelly@crowdstrike.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [PATCH v3 6/6] ftrace: Have ftrace pages output reflect freed pages
References: <20250213162047.306074881@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_082137_533698_8D99A4E1 
X-CRM114-Status: GOOD (  16.65  )
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

From: Steven Rostedt <rostedt@goodmis.org>

The amount of memory that ftrace uses to save the descriptors to manage
the functions it can trace is shown at output. But if there are a lot of
functions that are skipped because they were weak or the architecture
added holes into the tables, then the extra pages that were allocated are
freed. But these freed pages are not reflected in the numbers shown, and
they can even be inconsistent with what is reported:

 ftrace: allocating 57482 entries in 225 pages
 ftrace: allocated 224 pages with 3 groups

The above shows the number of original entries that are in the mcount_loc
section and the pages needed to save them (225), but the second output
reflects the number of pages that were actually used. The two should be
consistent as:

 ftrace: allocating 56739 entries in 224 pages
 ftrace: allocated 224 pages with 3 groups

The above also shows the accurate number of entires that were actually
stored and does not include the entries that were removed.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 55d28c060784..fa7c3417d995 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7006,6 +7006,7 @@ static int ftrace_process_locs(struct module *mod,
 	unsigned long addr;
 	unsigned long kaslr;
 	unsigned long flags = 0; /* Shut up gcc */
+	unsigned long pages;
 	int ret = -ENOMEM;
 
 	count = end - start;
@@ -7013,6 +7014,8 @@ static int ftrace_process_locs(struct module *mod,
 	if (!count)
 		return 0;
 
+	pages = DIV_ROUND_UP(count, ENTRIES_PER_PAGE);
+
 	/*
 	 * Sorting mcount in vmlinux at build time depend on
 	 * CONFIG_BUILDTIME_MCOUNT_SORT, while mcount loc in
@@ -7125,6 +7128,8 @@ static int ftrace_process_locs(struct module *mod,
 				remaining += 1 << pg->order;
 			}
 
+			pages -= remaining;
+
 			skip = DIV_ROUND_UP(skip, ENTRIES_PER_PAGE);
 
 			/*
@@ -7138,6 +7143,13 @@ static int ftrace_process_locs(struct module *mod,
 		synchronize_rcu();
 		ftrace_free_pages(pg_unuse);
 	}
+
+	if (!mod) {
+		count -= skipped;
+		pr_info("ftrace: allocating %ld entries in %ld pages\n",
+			count, pages);
+	}
+
 	return ret;
 }
 
@@ -7783,9 +7795,6 @@ void __init ftrace_init(void)
 		goto failed;
 	}
 
-	pr_info("ftrace: allocating %ld entries in %ld pages\n",
-		count, DIV_ROUND_UP(count, ENTRIES_PER_PAGE));
-
 	ret = ftrace_process_locs(NULL,
 				  __start_mcount_loc,
 				  __stop_mcount_loc);
-- 
2.47.2



