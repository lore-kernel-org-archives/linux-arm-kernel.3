Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52013C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZ/12hBfiNA+ef7wf7pGi2LbWSbCG67Kisyn4R6l8cc=; b=gYTOAZcpIIyb1DK3swLt4ZIWir
	xUsabREk6f+tKFTnsaXp+FYkTS7ACQW5qkXKibnS8TtPUqdBprPrfQnJxvHiVVZBci7AHhp1SOi8a
	fuQIwWs7hLK07NdLRVddhgS1g4vZTfNrO5sRt/Ab1YMg/1eUf9cXkWbNCiKZiZj8Wsv03h62+IVkb
	ZwtGaPG9Xm4B9AWzqAI09XCf3GuQ0t0tzedxlv0kpDfyFuxPurSkG/q1F9EJCWepsLSQSc1nLMpyH
	UWBk8ir5X3z+Pzjo9JDIUBZ8I5QNJ2TZsoCXZAU6Gj7x1OdzHNCR0EGFalrriSfJA4r3+PuQ3qFG6
	XvsYFgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFO0-00000002vz7-1tgM;
	Tue, 22 Jul 2025 15:58:36 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueE6q-00000002jJb-35uD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:36:49 +0000
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 07119C03E0;
	Tue, 22 Jul 2025 14:36:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 453A040;
	Tue, 22 Jul 2025 14:36:42 +0000 (UTC)
Date: Tue, 22 Jul 2025 10:37:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>,
 Nicolas Pitre <nico@fluxnic.net>, Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] tracing: arm: arm64: Hide trace events ipi_raise, ipi_entry
 and ipi_exit
Message-ID: <20250722103714.64eba013@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 6ktp76e7ym1dtny3k5r5zy6o536nog3p
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 453A040
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18HeXsKfKa6DOY2kst9FtohhJJ4c6jfuKQ=
X-HE-Tag: 1753195002-979874
X-HE-Meta: U2FsdGVkX1/C7DoKNVwGVKuc/nG3UGqBcstBGU+veKqTtMQfq4csxcDB0KegYzvIKJVnFY2HooHGv+jVbIgZ6KP6z0BxwduUzfsQ4/v05Wk1pLlBmfiUeEX9yu30HCZ2N61WyXNsI3HR6hEvX2KZd2ZgilhaSFueiZnkYsV2KzoAMH4tDjw1y8/GieFuccP8XztDlhF7sQiKdMprZtlUlgqPmQo779H7kDaGVN6yAPGkt4h7M7zCLL5v4t5fvAR4kxlhwpOiRqW4ofcRGEKHMbSFhK3VspYID80jkKY9a2h+wUB8MSzY6A4cg/9S8XRJxsjWbZkZ3MXNGmG/CC0kR1u3WKFJE/emO7HmQBoqPXNBR10K0KCKa12hZsVWRSVu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_073648_826920_EAEB3678 
X-CRM114-Status: GOOD (  17.26  )
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

The ipi tracepoints are mostly generic, but the tracepoints ipi_raise,
ipi_entry and ipi_exit are only used by arm and arm64. This means these
trace events are wasting memory in all the other architectures that do not
use them.

Add CONFIG_HAVE_EXTRA_IPI_TRACEPOINTS and have arm and arm64 select it to
enable these trace events. The config makes it easy if other architectures
decide to trace these as well.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 arch/arm/Kconfig           |  1 +
 arch/arm64/Kconfig         |  1 +
 include/trace/events/ipi.h | 58 ++++++++++++++++++++------------------
 kernel/trace/Kconfig       |  6 ++++
 4 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index c531b49aa98e..33c8ce986ea6 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -100,6 +100,7 @@ config ARM
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_DEBUG_KMEMLEAK if !XIP_KERNEL
 	select HAVE_DMA_CONTIGUOUS if MMU
+	select HAVE_EXTRA_IPI_TRACEPOINTS
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if (CPU_V6 || CPU_V6K || CPU_V7) && MMU
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c58fe08d2897..68a8246d9fb3 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -134,6 +134,7 @@ config ARM64
 	select CPU_PM if (SUSPEND || CPU_IDLE)
 	select CPUMASK_OFFSTACK if NR_CPUS > 256
 	select DCACHE_WORD_ACCESS
+	select HAVE_EXTRA_IPI_TRACEPOINTS
 	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select DMA_BOUNCE_UNALIGNED_KMALLOC
 	select DMA_DIRECT_REMAP
diff --git a/include/trace/events/ipi.h b/include/trace/events/ipi.h
index 3de9bfc982ce..9912f0ded81d 100644
--- a/include/trace/events/ipi.h
+++ b/include/trace/events/ipi.h
@@ -7,34 +7,6 @@
 
 #include <linux/tracepoint.h>
 
-/**
- * ipi_raise - called when a smp cross call is made
- *
- * @mask: mask of recipient CPUs for the IPI
- * @reason: string identifying the IPI purpose
- *
- * It is necessary for @reason to be a static string declared with
- * __tracepoint_string.
- */
-TRACE_EVENT(ipi_raise,
-
-	TP_PROTO(const struct cpumask *mask, const char *reason),
-
-	TP_ARGS(mask, reason),
-
-	TP_STRUCT__entry(
-		__bitmask(target_cpus, nr_cpumask_bits)
-		__field(const char *, reason)
-	),
-
-	TP_fast_assign(
-		__assign_bitmask(target_cpus, cpumask_bits(mask), nr_cpumask_bits);
-		__entry->reason = reason;
-	),
-
-	TP_printk("target_mask=%s (%s)", __get_bitmask(target_cpus), __entry->reason)
-);
-
 TRACE_EVENT(ipi_send_cpu,
 
 	TP_PROTO(const unsigned int cpu, unsigned long callsite, void *callback),
@@ -79,6 +51,35 @@ TRACE_EVENT(ipi_send_cpumask,
 		  __get_cpumask(cpumask), __entry->callsite, __entry->callback)
 );
 
+#ifdef CONFIG_HAVE_EXTRA_IPI_TRACEPOINTS
+/**
+ * ipi_raise - called when a smp cross call is made
+ *
+ * @mask: mask of recipient CPUs for the IPI
+ * @reason: string identifying the IPI purpose
+ *
+ * It is necessary for @reason to be a static string declared with
+ * __tracepoint_string.
+ */
+TRACE_EVENT(ipi_raise,
+
+	TP_PROTO(const struct cpumask *mask, const char *reason),
+
+	TP_ARGS(mask, reason),
+
+	TP_STRUCT__entry(
+		__bitmask(target_cpus, nr_cpumask_bits)
+		__field(const char *, reason)
+	),
+
+	TP_fast_assign(
+		__assign_bitmask(target_cpus, cpumask_bits(mask), nr_cpumask_bits);
+		__entry->reason = reason;
+	),
+
+	TP_printk("target_mask=%s (%s)", __get_bitmask(target_cpus), __entry->reason)
+);
+
 DECLARE_EVENT_CLASS(ipi_handler,
 
 	TP_PROTO(const char *reason),
@@ -127,6 +128,7 @@ DEFINE_EVENT(ipi_handler, ipi_exit,
 
 	TP_ARGS(reason)
 );
+#endif /* CONFIG_HAVE_EXTRA_IPI_TRACEPOINTS */
 
 #endif /* _TRACE_IPI_H */
 
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 6c28b06c9231..187318802fc5 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -53,6 +53,12 @@ config HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 config HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
 	bool
 
+config HAVE_EXTRA_IPI_TRACEPOINTS
+	bool
+	help
+	 For architectures that use ipi_raise, ipi_entry and ipi_exit
+	 tracepoints.
+
 config HAVE_DYNAMIC_FTRACE_WITH_ARGS
 	bool
 	help
-- 
2.47.2


