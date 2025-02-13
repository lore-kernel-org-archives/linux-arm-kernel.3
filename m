Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6479C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=5GzUE8+22PDvx9TU35PcoTRaUTTz7IbxNCev5oEIp2I=; b=Z3ZDN7eoXzeCr5
	FZxr1vpJe5fKr+UPbiXk/66+NEXwhV7KCJQ2F9L6EWn2ek6GM4vPd5jNdVDmR+sruuXN8hGIrYkAZ
	gD2RcCDS/I3GySDiSwQzRhnQ8pTDSZ/2vrL1ffZFk8A0m3elj2700gbIBUHo7h9EKXrREdWSo37aj
	oz7ikwkNvEnobaFZJ7WKcn0czb7I8xi4HDw17QAsMMq1I65C4rwGdv0kJwag+MUtitn16HAY7w9PB
	jMpfBp4CDKLvl322NkjSq7oymJEWNeRRu1rMCCX55udAoIZqzs8gU/yAbdy0jKgfvf4gOqXZNvK73
	kojDby6DgtDm2B2z91DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidIy-0000000C4XK-2IHY;
	Thu, 13 Feb 2025 17:47:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiby6-0000000BkBN-1LMP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:21:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 977BB5C5854;
	Thu, 13 Feb 2025 16:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2A0C4CED1;
	Thu, 13 Feb 2025 16:21:35 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tibyE-00000001qcT-1IiE;
	Thu, 13 Feb 2025 11:21:46 -0500
Message-ID: <20250213162146.158076547@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 13 Feb 2025 11:20:52 -0500
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
Subject: [PATCH v3 5/6] ftrace: Update the mcount_loc check of skipped entries
References: <20250213162047.306074881@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_082138_431226_21405D53 
X-CRM114-Status: GOOD (  14.14  )
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

Now that weak functions turn into skipped entries, update the check to
make sure the amount that was allocated would fit both the entries that
were allocated as well as those that were skipped.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index e3f89924f603..55d28c060784 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7111,7 +7111,29 @@ static int ftrace_process_locs(struct module *mod,
 
 	/* We should have used all pages unless we skipped some */
 	if (pg_unuse) {
-		WARN_ON(!skipped);
+		unsigned long pg_remaining, remaining;
+		unsigned long skip;
+
+		/* Count the number of entries unused and compare it to skipped. */
+		pg_remaining = (ENTRIES_PER_PAGE << pg->order) - pg->index;
+
+		if (!WARN(skipped < pg_remaining, "Extra allocated pages for ftrace")) {
+
+			skip = skipped - pg_remaining;
+
+			for (pg = pg_unuse; pg; pg = pg->next) {
+				remaining += 1 << pg->order;
+			}
+
+			skip = DIV_ROUND_UP(skip, ENTRIES_PER_PAGE);
+
+			/*
+			 * Check to see if the number of pages remaining would
+			 * just fit the number of entries skipped.
+			 */
+			WARN(skip != remaining, "Extra allocated pages for ftrace: %lu with %lu skipped",
+			     remaining, skipped);
+		}
 		/* Need to synchronize with ftrace_location_range() */
 		synchronize_rcu();
 		ftrace_free_pages(pg_unuse);
-- 
2.47.2



