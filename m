Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C6BFB5178
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 01:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sb6SU2JAnLywwuHoyPPQ0ypLXq+TdPrFdKFk2euxSgg=; b=bnQxu81RoUwv7s2PfHVMKjXJzl
	L8QCG26glwgv6Jw95HdTUV0qAxTEzSbHq/tIX67fyca6pxnKmofp3hELnF8J807jhPcXDECYY6mIg
	z+q9HWp8USf8dbfXtb/MejPACtKtH/0UfiGRYmw4jiddTpItCKJNZOvDXJuLuIFbjbKncYXckHEFo
	Oh5SkcpVBEZkQR9T2EQeOwe/LJjxvtwNs+zeVJO8Gq3aAWM3MGeCTx+89BDR+jj90vSBPBZ/rdspi
	/vhRWmnPqyPRMzs9mcRNiBQUqRoI2yALzKenY+rxF61qnXHzsRpTsF2afX0nearfVTiWWjY2MAumV
	dqSkaYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9uzZ-00000005gcz-3qvZ;
	Tue, 07 Apr 2026 01:12:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9uzY-00000005gc0-14fP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 01:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9F1C402F3;
	Tue,  7 Apr 2026 01:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65C2C4CEF7;
	Tue,  7 Apr 2026 01:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775524351;
	bh=IiX3iAIS0Tud3lHL61RRs72AmWZT7+Pt71cqRKLfPd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hZcdwpgd4+UQwkLb4oPo4RxTriBCnx9og0XNkkjzjYkuDFZZPffF6c41BUpwpGMwL
	 neMs7kBXugbHN/vrFDsqyo66WAFdzj5kk/dCVx2v0iW0lFwHeeE5GGCuVuu9nHGPS0
	 gCLlj/OWu2S/+KpEVmsRcSFuI0zZFcOX3yOd+0ecIdeB3s/WFLvdlwBext9uFXHbQ5
	 R9FjuZIqeHjlBOfgNXtV0ZMXeG1y4A266Uu2iwCTcSlHpEjlVdm5nA/bhANn6aMPDz
	 3hk+5DOKG9mFgc5oVhM3uc/Cgg6JbZytoX/m6HPURRcUDnJr4uMBh3lAIoIoUISK+c
	 Wuqa6gAue+ePg==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v16 3/5] ring-buffer: Skip invalid sub-buffers when rewinding persistent ring buffer
Date: Tue,  7 Apr 2026 10:12:29 +0900
Message-ID: <177552434899.853249.11795958354637741486.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <177552432201.853249.5125045538812833325.stgit@mhiramat.tok.corp.google.com>
References: <177552432201.853249.5125045538812833325.stgit@mhiramat.tok.corp.google.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_181232_340511_CCC66A44 
X-CRM114-Status: GOOD (  23.23  )
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

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Skip invalid sub-buffers when rewinding the persistent ring buffer
instead of stopping the rewinding the ring buffer. The skipped
buffers are cleared.

To ensure the rewinding stops at the unused page, this also clears
buffer_data_page::time_stamp when tracing resets the buffer. This
allows us to identify unused pages and empty pages.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 Changes in v12:
   - Fix build error.
 Changes in v11:
   - Reset timestamp when the buffer is invalid.
   - When rewinding, skip subbuf page if timestamp is wrong and
     check timestamp after validating buffer data page.
 Changes in v10:
   - Newly added.
---
 kernel/trace/ring_buffer.c |   76 +++++++++++++++++++++++++-------------------
 1 file changed, 43 insertions(+), 33 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 0c284094f7d0..518a05df6ef7 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -363,6 +363,7 @@ struct buffer_page {
 static void rb_init_page(struct buffer_data_page *bpage)
 {
 	local_set(&bpage->commit, 0);
+	bpage->time_stamp = 0;
 }
 
 static __always_inline unsigned int rb_page_commit(struct buffer_page *bpage)
@@ -1878,12 +1879,14 @@ static int rb_read_data_buffer(struct buffer_data_page *dpage, int tail, int cpu
 	return events;
 }
 
-static int rb_validate_buffer(struct buffer_data_page *dpage, int cpu,
+static int rb_validate_buffer(struct buffer_page *bpage, int cpu,
 			      struct ring_buffer_cpu_meta *meta)
 {
+	struct buffer_data_page *dpage = bpage->page;
 	unsigned long long ts;
 	unsigned long tail;
 	u64 delta;
+	int ret = -1;
 
 	/*
 	 * When a sub-buffer is recovered from a read, the commit value may
@@ -1892,9 +1895,17 @@ static int rb_validate_buffer(struct buffer_data_page *dpage, int cpu,
 	 * subbuf_size is considered invalid.
 	 */
 	tail = local_read(&dpage->commit) & ~RB_MISSED_MASK;
-	if (tail > meta->subbuf_size)
-		return -1;
-	return rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
+	if (tail <= meta->subbuf_size)
+		ret = rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
+
+	if (ret < 0) {
+		local_set(&bpage->entries, 0);
+		local_set(&bpage->page->commit, 0);
+	} else {
+		local_set(&bpage->entries, ret);
+	}
+
+	return ret;
 }
 
 /* If the meta data has been validated, now validate the events */
@@ -1915,18 +1926,14 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 	orig_head = head_page = cpu_buffer->head_page;
 
 	/* Do the reader page first */
-	ret = rb_validate_buffer(cpu_buffer->reader_page->page, cpu_buffer->cpu, meta);
+	ret = rb_validate_buffer(cpu_buffer->reader_page, cpu_buffer->cpu, meta);
 	if (ret < 0) {
 		pr_info("Ring buffer meta [%d] invalid reader page detected\n",
 			cpu_buffer->cpu);
 		discarded++;
-		/* Instead of discard whole ring buffer, discard only this sub-buffer. */
-		local_set(&cpu_buffer->reader_page->entries, 0);
-		local_set(&cpu_buffer->reader_page->page->commit, 0);
 	} else {
 		entries += ret;
 		entry_bytes += rb_page_size(cpu_buffer->reader_page);
-		local_set(&cpu_buffer->reader_page->entries, ret);
 	}
 
 	ts = head_page->page->time_stamp;
@@ -1945,26 +1952,33 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 		if (head_page == cpu_buffer->tail_page)
 			break;
 
-		/* Ensure the page has older data than head. */
-		if (ts < head_page->page->time_stamp)
-			break;
-
-		ts = head_page->page->time_stamp;
-		/* Ensure the page has correct timestamp and some data. */
-		if (!ts || rb_page_commit(head_page) == 0)
-			break;
-
-		/* Stop rewind if the page is invalid. */
-		ret = rb_validate_buffer(head_page->page, cpu_buffer->cpu, meta);
-		if (ret < 0)
+		/* Rewind until unused page (no timestamp, no commit). */
+		if (!head_page->page->time_stamp && rb_page_commit(head_page) == 0)
 			break;
 
-		/* Recover the number of entries and update stats. */
-		local_set(&head_page->entries, ret);
-		if (ret)
-			local_inc(&cpu_buffer->pages_touched);
-		entries += ret;
-		entry_bytes += rb_page_commit(head_page);
+		/*
+		 * Skip if the page is invalid, or its timestamp is newer than the
+		 * previous valid page.
+		 */
+		ret = rb_validate_buffer(head_page, cpu_buffer->cpu, meta);
+		if (ret >= 0 && ts < head_page->page->time_stamp) {
+			local_set(&head_page->entries, 0);
+			local_set(&head_page->page->commit, 0);
+			head_page->page->time_stamp = ts;
+			ret = -1;
+		}
+		if (ret < 0) {
+			if (!discarded)
+				pr_info("Ring buffer meta [%d] invalid buffer page detected\n",
+					cpu_buffer->cpu);
+			discarded++;
+		} else {
+			entries += ret;
+			entry_bytes += rb_page_size(head_page);
+			if (ret > 0)
+				local_inc(&cpu_buffer->pages_touched);
+			ts = head_page->page->time_stamp;
+		}
 	}
 	if (i)
 		pr_info("Ring buffer [%d] rewound %d pages\n", cpu_buffer->cpu, i);
@@ -2034,15 +2048,12 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 		if (head_page == cpu_buffer->reader_page)
 			continue;
 
-		ret = rb_validate_buffer(head_page->page, cpu_buffer->cpu, meta);
+		ret = rb_validate_buffer(head_page, cpu_buffer->cpu, meta);
 		if (ret < 0) {
 			if (!discarded)
 				pr_info("Ring buffer meta [%d] invalid buffer page detected\n",
 					cpu_buffer->cpu);
 			discarded++;
-			/* Instead of discard whole ring buffer, discard only this sub-buffer. */
-			local_set(&head_page->entries, 0);
-			local_set(&head_page->page->commit, 0);
 		} else {
 			/* If the buffer has content, update pages_touched */
 			if (ret)
@@ -2050,7 +2061,6 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 
 			entries += ret;
 			entry_bytes += rb_page_size(head_page);
-			local_set(&head_page->entries, ret);
 		}
 		if (head_page == cpu_buffer->commit_page)
 			break;
@@ -2083,7 +2093,7 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 	/* Reset all the subbuffers */
 	for (i = 0; i < meta->nr_subbufs - 1; i++, rb_inc_page(&head_page)) {
 		local_set(&head_page->entries, 0);
-		local_set(&head_page->page->commit, 0);
+		rb_init_page(head_page->page);
 	}
 }
 


