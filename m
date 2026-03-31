Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A9DFF60EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wT8Lt0Qifc0rLe95oyUk5QX00dUyp0unL1Tpdln4HkE=; b=ak/PVLhKhWKF4/2ZaRHHIXytqp
	VuH4gDrXUQewWphlOSuF0mFaPygVzfj08xkf8kNVWZeVbMQ08sGvdX7eu+Xb2mhmY0dzIWDNtBSDk
	y7jV4Z640DDbhn40l1YSP/rWQiwdMEbBS4CRfCpv9nI2bv7jwnPjE4RfFOp55SdhLKGc5+lzmZApe
	u2zgYM9uHqkcnQIEjLuQPi3N84qQ0WkY2+7sEHKo+g6k9UTv77i2D7CcvltHbi84CDQmCczLQeu9S
	d5n3gFoB5zOwTHMUi6eniG1Ii7c1EL0YwNwb05oJb3At0McLuL7QdaubUno7b1upMnz4G5nn4QOM+
	V1KiXoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UaA-0000000Cbmp-2p8y;
	Tue, 31 Mar 2026 08:36:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UaA-0000000CbmP-0kjE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:36:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E9576012A;
	Tue, 31 Mar 2026 08:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC38C2BCB2;
	Tue, 31 Mar 2026 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946177;
	bh=6/MoLqXEyufxVd4wnuy+z73wsboIpscHH90SfE6Az5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bKKs7mMOGN7rez9gympxuJFxkIavIkspQlDevHlagLKqE6TKrGWMW8Y2Tvf03wcVz
	 1jKlBr4fxcfiYvGpu080C+3EKbmGp3XFLZYXshk8xAlxAH7bLXyu1Mbyct2oL+9Cp7
	 aAB2Px9zykFuLVgRIUeqSzb9fZ7EPbmX3+giU1z8DZsZ3BLWkSCjVWZnkVnPpdDn98
	 1iskb7OiY86kqMEBuXRgUfD4lAyf119nyhgMWlKqeisWEaJ2wMAUZph3AYcmX/ZMoi
	 n1IUFIrWDPSYi0TEF6CZ7UQDzv69Drc8uIQm+uBDaUZ7h2jcjQVcHfm/Ceeltek/gG
	 7mafN4o0YCNkQ==
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
Subject: [PATCH v15 2/5] ring-buffer: Skip invalid sub-buffers when validating persistent ring buffer
Date: Tue, 31 Mar 2026 17:36:14 +0900
Message-ID: <177494617443.71933.4774978551495540891.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
In-Reply-To: <177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com>
References: <177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Skip invalid sub-buffers when validating the persistent ring buffer
instead of discarding the entire ring buffer. Only skipped buffers
are invalidated (cleared).

If the cache data in memory fails to be synchronized during a reboot,
the persistent ring buffer may become partially corrupted, but other
sub-buffers may still contain readable event data. Only discard the
subbuffers that are found to be corrupted.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
  Changes in v15:
  - Skip reader_page loop check on persistent ring buffer because
    there can be contiguous empty(invalidated) pages.
  - Do not show discarded page number information if it is 0.
  Changes in v11:
  - Fix a typo.
  Changes in v9:
  - Add meta->subbuf_size check.
  - Fix a typo.
  - Handle invalid reader_page case.
  Changes in v8:
  - Add comment in rb_valudate_buffer()
  - Clear the RB_MISSED_* flags in rb_valudate_buffer() instead of
    skipping subbuf.
  - Remove unused subbuf local variable from rb_cpu_meta_valid().
  Changes in v7:
  - Combined with Handling RB_MISSED_* flags patch, focus on validation at boot.
  - Remove checking subbuffer data when validating metadata, because it should be done
    later.
  - Do not mark the discarded sub buffer page but just reset it.
  Changes in v6:
  - Show invalid page detection message once per CPU.
  Changes in v5:
  - Instead of showing errors for each page, just show the number
    of discarded pages at last.
  Changes in v3:
  - Record missed data event on commit.
---
 kernel/trace/ring_buffer.c |  109 ++++++++++++++++++++++++++------------------
 1 file changed, 65 insertions(+), 44 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 3e793bd1c134..2a6254edae5f 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -370,6 +370,12 @@ static __always_inline unsigned int rb_page_commit(struct buffer_page *bpage)
 	return local_read(&bpage->page->commit);
 }
 
+/* Size is determined by what has been committed */
+static __always_inline unsigned int rb_page_size(struct buffer_page *bpage)
+{
+	return rb_page_commit(bpage) & ~RB_MISSED_MASK;
+}
+
 static void free_buffer_page(struct buffer_page *bpage)
 {
 	/* Range pages are not to be freed */
@@ -1762,7 +1768,6 @@ static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
 			      unsigned long *subbuf_mask)
 {
 	int subbuf_size = PAGE_SIZE;
-	struct buffer_data_page *subbuf;
 	unsigned long buffers_start;
 	unsigned long buffers_end;
 	int i;
@@ -1770,6 +1775,11 @@ static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
 	if (!subbuf_mask)
 		return false;
 
+	if (meta->subbuf_size != PAGE_SIZE) {
+		pr_info("Ring buffer boot meta [%d] invalid subbuf_size\n", cpu);
+		return false;
+	}
+
 	buffers_start = meta->first_buffer;
 	buffers_end = meta->first_buffer + (subbuf_size * meta->nr_subbufs);
 
@@ -1786,11 +1796,12 @@ static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
 		return false;
 	}
 
-	subbuf = rb_subbufs_from_meta(meta);
-
 	bitmap_clear(subbuf_mask, 0, meta->nr_subbufs);
 
-	/* Is the meta buffers and the subbufs themselves have correct data? */
+	/*
+	 * Ensure the meta::buffers array has correct data. The data in each subbufs
+	 * are checked later in rb_meta_validate_events().
+	 */
 	for (i = 0; i < meta->nr_subbufs; i++) {
 		if (meta->buffers[i] < 0 ||
 		    meta->buffers[i] >= meta->nr_subbufs) {
@@ -1798,18 +1809,12 @@ static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
 			return false;
 		}
 
-		if ((unsigned)local_read(&subbuf->commit) > subbuf_size) {
-			pr_info("Ring buffer boot meta [%d] buffer invalid commit\n", cpu);
-			return false;
-		}
-
 		if (test_bit(meta->buffers[i], subbuf_mask)) {
 			pr_info("Ring buffer boot meta [%d] array has duplicates\n", cpu);
 			return false;
 		}
 
 		set_bit(meta->buffers[i], subbuf_mask);
-		subbuf = (void *)subbuf + subbuf_size;
 	}
 
 	return true;
@@ -1873,13 +1878,22 @@ static int rb_read_data_buffer(struct buffer_data_page *dpage, int tail, int cpu
 	return events;
 }
 
-static int rb_validate_buffer(struct buffer_data_page *dpage, int cpu)
+static int rb_validate_buffer(struct buffer_data_page *dpage, int cpu,
+			      struct ring_buffer_cpu_meta *meta)
 {
 	unsigned long long ts;
+	unsigned long tail;
 	u64 delta;
-	int tail;
 
-	tail = local_read(&dpage->commit);
+	/*
+	 * When a sub-buffer is recovered from a read, the commit value may
+	 * have RB_MISSED_* bits set, as these bits are reset on reuse.
+	 * Even after clearing these bits, a commit value greater than the
+	 * subbuf_size is considered invalid.
+	 */
+	tail = local_read(&dpage->commit) & ~RB_MISSED_MASK;
+	if (tail > meta->subbuf_size)
+		return -1;
 	return rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
 }
 
@@ -1890,6 +1904,7 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 	struct buffer_page *head_page, *orig_head;
 	unsigned long entry_bytes = 0;
 	unsigned long entries = 0;
+	int discarded = 0;
 	int ret;
 	u64 ts;
 	int i;
@@ -1900,14 +1915,19 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 	orig_head = head_page = cpu_buffer->head_page;
 
 	/* Do the reader page first */
-	ret = rb_validate_buffer(cpu_buffer->reader_page->page, cpu_buffer->cpu);
+	ret = rb_validate_buffer(cpu_buffer->reader_page->page, cpu_buffer->cpu, meta);
 	if (ret < 0) {
-		pr_info("Ring buffer reader page is invalid\n");
-		goto invalid;
+		pr_info("Ring buffer meta [%d] invalid reader page detected\n",
+			cpu_buffer->cpu);
+		discarded++;
+		/* Instead of discard whole ring buffer, discard only this sub-buffer. */
+		local_set(&cpu_buffer->reader_page->entries, 0);
+		local_set(&cpu_buffer->reader_page->page->commit, 0);
+	} else {
+		entries += ret;
+		entry_bytes += rb_page_size(cpu_buffer->reader_page);
+		local_set(&cpu_buffer->reader_page->entries, ret);
 	}
-	entries += ret;
-	entry_bytes += local_read(&cpu_buffer->reader_page->page->commit);
-	local_set(&cpu_buffer->reader_page->entries, ret);
 
 	ts = head_page->page->time_stamp;
 
@@ -1935,7 +1955,7 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 			break;
 
 		/* Stop rewind if the page is invalid. */
-		ret = rb_validate_buffer(head_page->page, cpu_buffer->cpu);
+		ret = rb_validate_buffer(head_page->page, cpu_buffer->cpu, meta);
 		if (ret < 0)
 			break;
 
@@ -2014,21 +2034,24 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 		if (head_page == cpu_buffer->reader_page)
 			continue;
 
-		ret = rb_validate_buffer(head_page->page, cpu_buffer->cpu);
+		ret = rb_validate_buffer(head_page->page, cpu_buffer->cpu, meta);
 		if (ret < 0) {
-			pr_info("Ring buffer meta [%d] invalid buffer page\n",
-				cpu_buffer->cpu);
-			goto invalid;
-		}
-
-		/* If the buffer has content, update pages_touched */
-		if (ret)
-			local_inc(&cpu_buffer->pages_touched);
-
-		entries += ret;
-		entry_bytes += local_read(&head_page->page->commit);
-		local_set(&head_page->entries, ret);
+			if (!discarded)
+				pr_info("Ring buffer meta [%d] invalid buffer page detected\n",
+					cpu_buffer->cpu);
+			discarded++;
+			/* Instead of discard whole ring buffer, discard only this sub-buffer. */
+			local_set(&head_page->entries, 0);
+			local_set(&head_page->page->commit, 0);
+		} else {
+			/* If the buffer has content, update pages_touched */
+			if (ret)
+				local_inc(&cpu_buffer->pages_touched);
 
+			entries += ret;
+			entry_bytes += rb_page_size(head_page);
+			local_set(&head_page->entries, ret);
+		}
 		if (head_page == cpu_buffer->commit_page)
 			break;
 	}
@@ -2042,7 +2065,10 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 	local_set(&cpu_buffer->entries, entries);
 	local_set(&cpu_buffer->entries_bytes, entry_bytes);
 
-	pr_info("Ring buffer meta [%d] is from previous boot!\n", cpu_buffer->cpu);
+	pr_info("Ring buffer meta [%d] is from previous boot!", cpu_buffer->cpu);
+	if (discarded)
+		pr_cont(" (%d pages discarded)", discarded);
+	pr_cont("\n");
 	return;
 
  invalid:
@@ -3329,12 +3355,6 @@ rb_iter_head_event(struct ring_buffer_iter *iter)
 	return NULL;
 }
 
-/* Size is determined by what has been committed */
-static __always_inline unsigned rb_page_size(struct buffer_page *bpage)
-{
-	return rb_page_commit(bpage) & ~RB_MISSED_MASK;
-}
-
 static __always_inline unsigned
 rb_commit_index(struct ring_buffer_per_cpu *cpu_buffer)
 {
@@ -5647,11 +5667,12 @@ __rb_get_reader_page(struct ring_buffer_per_cpu *cpu_buffer)
  again:
 	/*
 	 * This should normally only loop twice. But because the
-	 * start of the reader inserts an empty page, it causes
-	 * a case where we will loop three times. There should be no
-	 * reason to loop four times (that I know of).
+	 * start of the reader inserts an empty page, it causes a
+	 * case where we will loop three times. There should be no
+	 * reason to loop four times unless the ring buffer is a
+	 * recovered persistent ring buffer.
 	 */
-	if (RB_WARN_ON(cpu_buffer, ++nr_loops > 3)) {
+	if (RB_WARN_ON(cpu_buffer, ++nr_loops > 3 && !cpu_buffer->ring_meta)) {
 		reader = NULL;
 		goto out;
 	}


