Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F36FF60ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vja8/KZvKfu45kSBafalby/ilVeH76f5bLsgpomH8T0=; b=r9u6ScIVGag7+56f8XDGpxxJai
	Ren20ZojUVJz8zkWMDUlJ9+SBsR6dpzKZk0qtu93qi3myda6ppl8Snyr8RLmVr7V6qcioLp+2KODw
	8/yw/FZoZHXe4ullhyuaAXoqjQ2d695HMhJgGuoOt2QiCDTQXvC3z6LIMhlz3tevgHYZYBzhFS4k3
	H2C2mmixc16AVL/df84xO3UgomTM6i5kahFmYwI8dKa5DKO23W+IJQ43S8srYzNvDusDyqARV9w7g
	4kFtQjBObt8YLnc663+kcV/BVnQJr6uWo2QPakKJkMrukf5/0Ti78cp6YWiN80LcP6ZnQ77Fd9Vus
	7EXzCZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UaY-0000000Cbzy-0iuV;
	Tue, 31 Mar 2026 08:36:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UaQ-0000000Cbvc-1YEj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9EDA60127;
	Tue, 31 Mar 2026 08:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC1DC2BCB0;
	Tue, 31 Mar 2026 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946193;
	bh=DnL/wn8OqAp+2CfNBRsbAhbshuKmA3OfJU3X1O9CUh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HpWe8+HihNBuyeuFMELMNnm2dwwQDMBMfFIj5GrcRQzY1hbilC9Sdwz8XWbToZ/TA
	 0jYaqqPXUYnIPltWNfBWti5hvue6CRPqXA3JQPveC2uj87giG2Ss1YTYmenhUoWuKR
	 ZjmRkmQMTK2gsan+EoCOmpXh4LwuwRb0QZZbpKZlJjyAr1KddjR2c7X6AXKSzGJl6Q
	 99FpnSka1a3l1skFDetdXgW44Q3hxAsvTWGR76zEVReseiJHI3CU/Odm35epfO2ssY
	 bHywj39L4lETi5LGIYQdVEfTY2r2xWKE8lMsoyr4HIHvM+TNoIgPjcWxOc83lFb/cr
	 sWI5H2lYtjP6Q==
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
Subject: [PATCH v15 4/5] ring-buffer: Add persistent ring buffer invalid-page inject test
Date: Tue, 31 Mar 2026 17:36:30 +0900
Message-ID: <177494619065.71933.9842685686800241005.stgit@mhiramat.tok.corp.google.com>
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

Add a self-destractive test for the persistent ring buffer.

This will inject erroneous value to some sub-buffer pages (where
the index is even or multiples of 5) in the persistent ring buffer
when kernel gets panic, and check whether the number of detected
invalid pages and the total entry_bytes are the same as recorded
values after reboot.

This can ensure the kernel correctly recover partially corrupted
persistent ring buffer when boot.

The test only runs on the persistent ring buffer whose name is
"ptracingtest". And user has to fill it up with events before
kernel panics.

To run the test, enable CONFIG_RING_BUFFER_PERSISTENT_INJECT
and you have to setup the kernel cmdline;

 reserve_mem=20M:2M:trace trace_instance=ptracingtest^traceoff@trace
 panic=1

And run following commands after the 1st boot;

 cd /sys/kernel/tracing/instances/ptracingtest
 echo 1 > tracing_on
 echo 1 > events/enable
 sleep 3
 echo c > /proc/sysrq-trigger

After panic message, the kernel will reboot and run the verification
on the persistent ring buffer, e.g.

 Ring buffer meta [2] invalid buffer page detected
 Ring buffer meta [2] is from previous boot! (318 pages discarded)
 Ring buffer testing [2] invalid pages: PASSED (318/318)
 Ring buffer testing [2] entry_bytes: PASSED (1300476/1300476)

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 Changes in v15:
  - Use pr_warn() for test result.
  - Inject errors on the page index is multiples of 5 so that
    this can reproduce contiguous empty pages.
 Changes in v14:
  - Rename config to CONFIG_RING_BUFFER_PERSISTENT_INJECT.
  - Clear meta->nr_invalid/entry_bytes after testing.
  - Add test commands in config comment.
 Changes in v10:
  - Add entry_bytes test.
  - Do not compile test code if CONFIG_RING_BUFFER_PERSISTENT_SELFTEST=n.
 Changes in v9:
  - Test also reader pages.
---
 include/linux/ring_buffer.h |    1 +
 kernel/trace/Kconfig        |   31 ++++++++++++++++++
 kernel/trace/ring_buffer.c  |   74 +++++++++++++++++++++++++++++++++++++++++++
 kernel/trace/trace.c        |    4 ++
 4 files changed, 110 insertions(+)

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 994f52b34344..0670742b2d60 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -238,6 +238,7 @@ int ring_buffer_subbuf_size_get(struct trace_buffer *buffer);
 
 enum ring_buffer_flags {
 	RB_FL_OVERWRITE		= 1 << 0,
+	RB_FL_TESTING		= 1 << 1,
 };
 
 #ifdef CONFIG_RING_BUFFER
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index e130da35808f..07305ed6d745 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1202,6 +1202,37 @@ config RING_BUFFER_VALIDATE_TIME_DELTAS
 	  Only say Y if you understand what this does, and you
 	  still want it enabled. Otherwise say N
 
+config RING_BUFFER_PERSISTENT_INJECT
+	bool "Enable persistent ring buffer error injection test"
+	depends on RING_BUFFER
+	help
+	  Run a selftest on the persistent ring buffer which names
+	  "ptracingtest" (and its backup) when panic_on_reboot by
+	  invalidating ring buffer pages.
+	  To use this, boot kernel with "ptracingtest" persistent
+	  ring buffer, e.g.
+
+	   reserve_mem=20M:2M:trace trace_instance=ptracingtest@trace panic=1
+
+	  And after the 1st boot, run test command, like;
+
+	   cd /sys/kernel/tracing/instances/ptracingtest
+	   echo 1 > events/enable
+	   echo 1 > tracing_on
+	   sleep 3
+	   echo c > /proc/sysrq-trigger
+
+	  After panic message, the kernel reboots and show test results
+	  on the boot log.
+
+	  Note that user has to enable events on the persistent ring
+	  buffer manually to fill up ring buffers before rebooting.
+	  Since this invalidates the data on test target ring buffer,
+	  "ptracingtest" persistent ring buffer must not be used for
+	  actual tracing, but only for testing.
+
+	  If unsure, say N
+
 config MMIOTRACE_TEST
 	tristate "Test module for mmiotrace"
 	depends on MMIOTRACE && m
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 5ff632ca3858..fb098b0b4505 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -64,6 +64,10 @@ struct ring_buffer_cpu_meta {
 	unsigned long	commit_buffer;
 	__u32		subbuf_size;
 	__u32		nr_subbufs;
+#ifdef CONFIG_RING_BUFFER_PERSISTENT_INJECT
+	__u32		nr_invalid;
+	__u32		entry_bytes;
+#endif
 	int		buffers[];
 };
 
@@ -2079,6 +2083,21 @@ static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
 	if (discarded)
 		pr_cont(" (%d pages discarded)", discarded);
 	pr_cont("\n");
+
+#ifdef CONFIG_RING_BUFFER_PERSISTENT_INJECT
+	if (meta->nr_invalid)
+		pr_warn("Ring buffer testing [%d] invalid pages: %s (%d/%d)\n",
+			cpu_buffer->cpu,
+			(discarded == meta->nr_invalid) ? "PASSED" : "FAILED",
+			discarded, meta->nr_invalid);
+	if (meta->entry_bytes)
+		pr_warn("Ring buffer testing [%d] entry_bytes: %s (%ld/%ld)\n",
+			cpu_buffer->cpu,
+			(entry_bytes == meta->entry_bytes) ? "PASSED" : "FAILED",
+			(long)entry_bytes, (long)meta->entry_bytes);
+	meta->nr_invalid = 0;
+	meta->entry_bytes = 0;
+#endif
 	return;
 
  invalid:
@@ -2559,12 +2578,67 @@ static void rb_free_cpu_buffer(struct ring_buffer_per_cpu *cpu_buffer)
 	kfree(cpu_buffer);
 }
 
+#ifdef CONFIG_RING_BUFFER_PERSISTENT_INJECT
+static void rb_test_inject_invalid_pages(struct trace_buffer *buffer)
+{
+	struct ring_buffer_per_cpu *cpu_buffer;
+	struct ring_buffer_cpu_meta *meta;
+	struct buffer_data_page *dpage;
+	u32 entry_bytes = 0;
+	unsigned long ptr;
+	int subbuf_size;
+	int invalid = 0;
+	int cpu;
+	int i;
+
+	if (!(buffer->flags & RB_FL_TESTING))
+		return;
+
+	guard(preempt)();
+	cpu = smp_processor_id();
+
+	cpu_buffer = buffer->buffers[cpu];
+	meta = cpu_buffer->ring_meta;
+	ptr = (unsigned long)rb_subbufs_from_meta(meta);
+	subbuf_size = meta->subbuf_size;
+
+	for (i = 0; i < meta->nr_subbufs; i++) {
+		int idx = meta->buffers[i];
+
+		dpage = (void *)(ptr + idx * subbuf_size);
+		/* Skip unused pages */
+		if (!local_read(&dpage->commit))
+			continue;
+
+		/*
+		 * Invalidate even pages or multiples of 5. This will lead 3
+		 * contiguous invalidated(empty) pages.
+		 */
+		if (!(i & 0x1) || !(i % 5)) {
+			local_add(subbuf_size + 1, &dpage->commit);
+			invalid++;
+		} else {
+			/* Count total commit bytes. */
+			entry_bytes += local_read(&dpage->commit);
+		}
+	}
+
+	pr_info("Inject invalidated %d pages on CPU%d, total size: %ld\n",
+		invalid, cpu, (long)entry_bytes);
+	meta->nr_invalid = invalid;
+	meta->entry_bytes = entry_bytes;
+}
+#else /* !CONFIG_RING_BUFFER_PERSISTENT_INJECT */
+#define rb_test_inject_invalid_pages(buffer)	do { } while (0)
+#endif
+
 /* Stop recording on a persistent buffer and flush cache if needed. */
 static int rb_flush_buffer_cb(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct trace_buffer *buffer = container_of(nb, struct trace_buffer, flush_nb);
 
 	ring_buffer_record_off(buffer);
+	rb_test_inject_invalid_pages(buffer);
 	arch_ring_buffer_flush_range(buffer->range_addr_start, buffer->range_addr_end);
 	return NOTIFY_DONE;
 }
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 4189ec9df6a5..108b0d16badf 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9366,6 +9366,8 @@ static void setup_trace_scratch(struct trace_array *tr,
 	memset(tscratch, 0, size);
 }
 
+#define TRACE_TEST_PTRACING_NAME	"ptracingtest"
+
 static int
 allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, unsigned long size)
 {
@@ -9378,6 +9380,8 @@ allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, unsigned
 	buf->tr = tr;
 
 	if (tr->range_addr_start && tr->range_addr_size) {
+		if (!strcmp(tr->name, TRACE_TEST_PTRACING_NAME))
+			rb_flags |= RB_FL_TESTING;
 		/* Add scratch buffer to handle 128 modules */
 		buf->buffer = ring_buffer_alloc_range(size, rb_flags, 0,
 						      tr->range_addr_start,


