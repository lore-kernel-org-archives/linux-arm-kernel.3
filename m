Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB535C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=dor0GCQpDJiIiZLkdo5/Mz1qqle8mYzzA6GzARE0hz8=; b=g7XnyTUlBAWy1l
	6Ls7VwitRbYdqTcz4ro9wztPG5Y1B25OFoD+lNIKiOQ4UQGZ0uWYJH+8BqOIU9C3dhm+4OscjSjEF
	qeWivFfVA6V/oEPhSDDSCPTtsYAOn73I0qdi/sYx+JK2DN4BfLW6pU9VNYZCNSnCfsHUGzsBxwQ+z
	V6h5vAVkWliiJ8eoqNhOsu5JrKBzw0VStOoY/SGrR0xzdPnMih6HYRYnU8sCygg/Pk7+1rhtHz3nS
	40jAXVnRm8+zjJQo/SKT7dBPsqvKyVPuQGU67AgG09iqVxVo9pe2F+XUu8Dhsmxk9rTmALTQpIVRC
	Y3exQi7+jQg+wbk+0kKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUGn-00000009mpo-3bVf;
	Tue, 18 Feb 2025 20:32:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTlC-00000009fnF-0ewP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13E0B5C6273;
	Tue, 18 Feb 2025 19:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA4DC4CEEA;
	Tue, 18 Feb 2025 20:00:00 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tkTlX-00000004Arp-1YRM;
	Tue, 18 Feb 2025 15:00:23 -0500
Message-ID: <20250218200023.221100846@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 18 Feb 2025 14:59:24 -0500
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
Subject: [PATCH v5 6/6] ftrace: Have ftrace pages output reflect freed pages
References: <20250218195918.255228630@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_120002_287341_ADC757D5 
X-CRM114-Status: GOOD (  16.86  )
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
index e657013424aa..27c8def2139d 100644
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
@@ -7124,6 +7127,8 @@ static int ftrace_process_locs(struct module *mod,
 			for (pg = pg_unuse; pg; pg = pg->next)
 				remaining += 1 << pg->order;
 
+			pages -= remaining;
+
 			skip = DIV_ROUND_UP(skip, ENTRIES_PER_PAGE);
 
 			/*
@@ -7137,6 +7142,13 @@ static int ftrace_process_locs(struct module *mod,
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
 
@@ -7782,9 +7794,6 @@ void __init ftrace_init(void)
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



