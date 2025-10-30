Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF2BCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 03:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdFr0iiN0cDrz7dKwCKbYY94mR+3PfEEQS0T1DmTZx4=; b=hZknT5JTfBy5cNKk1jf3RVirVg
	FtxMxzbedIkWkk6iWIfv/BZGpUJk1z9icdk6eq0VzMRWwR5kMrAqjV8Mrv8B+C7c8mk16jRKnaTmg
	trNR7NEk8K6ARobbXn3d1wiaWYC81UJGPTPkh1udl7RMTzOs1k77c7N82C3JvYncRUG3v+PEG/WB5
	U7YF8EhRKtoWANIIQfVIzdTtR0Zy+726RYbwdl3xIJOIRreNOHvPX2UsSZ+ZEK/lLTGYKbFGhcs8z
	oz++t30a6gowdoOSIr5gmEiEKFVpqE9gCTb4Pxb01iJGvcH0RxbiX4YG1YGsKn8inU00QXxRM55Sr
	ewbKj5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJJw-00000003Pjg-11op;
	Thu, 30 Oct 2025 03:27:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJJu-00000003PjE-1GCW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 03:27:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14A7660478;
	Thu, 30 Oct 2025 03:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67336C4CEF7;
	Thu, 30 Oct 2025 03:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761794844;
	bh=jJ98GA8lXMZB+PEb4XMuc+DVI+yBUyfVXN3flVjshBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bPhrbrJKxNk4PO3YGKRuaN44F7Ub0QfEnH8eiksF0Qmd1qeAp/bp+iKaa1pcD/lEY
	 umPyzuyB31d/ubl88s5JEMbkoarzZf+ZEYo6jQDoafKfTKOjD44Z6rt0Y5ygQpnuK4
	 u7xolnYjGGpFv3E+2nNZkFROqo4NmRTzcvHA65hpWsJmeGIIE+MIgK9JgF7TBvzA3N
	 LM8lHyfkURqAMHsWD8LAOLEX5NDX3my6BbmsqmEYmcf7KV/DVk4S+K80AKVqhhSUjD
	 DQy64zffDRyTIHq9zO4iQYwS3FR/aYIh3DYB06HDJpPRPBLoF368p/YMsYNwspdUOf
	 uCbSt1wrwDG6Q==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] tracing: wprobe: Make wprobe_handler default overflow_handler compatible
Date: Thu, 30 Oct 2025 12:27:19 +0900
Message-ID: <176179483888.959775.5748906728818431150.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <176179481538.959775.12326313742393696258.stgit@devnote2>
References: <176179481538.959775.12326313742393696258.stgit@devnote2>
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

To fix arm64 repeating watchpoint exception on the same instruction
bug, markthe wprobe handler as compatible with the default overflow
handler.

Since do_watchpoint() on arm64 does not configure the single step
execution correctly if the overflow_handler is not compatible with
default perf overflow handlers, custom handler will loop on the
same instruction by repeating watchpoint exception. But if the
overflow handler is compatible with the default handlers, it
configures the single step. So set the compatible flag since
wprobe_handler will not care arch-dependent case.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk/
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/trace/trace_wprobe.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/trace/trace_wprobe.c b/kernel/trace/trace_wprobe.c
index 98605b207f43..f2c2f26fd668 100644
--- a/kernel/trace/trace_wprobe.c
+++ b/kernel/trace/trace_wprobe.c
@@ -163,6 +163,8 @@ static void wprobe_perf_handler(struct perf_event *bp,
 static int __register_trace_wprobe(struct trace_wprobe *tw)
 {
 	struct perf_event_attr attr;
+	struct perf_event *bp;
+	int cpu;
 
 	if (tw->bp_event)
 		return -EINVAL;
@@ -179,6 +181,11 @@ static int __register_trace_wprobe(struct trace_wprobe *tw)
 		tw->bp_event = NULL;
 		return ret;
 	}
+	/* Mark wprobe_perf_handler is compatible with default one. */
+	for_each_online_cpu(cpu) {
+		bp = per_cpu(*tw->bp_event, cpu);
+		bp->default_overflow_compatible = true;
+	}
 
 	return 0;
 }


