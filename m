Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305D0CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 03:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwnH4REHQWojpN3UWW0BIegXcYIkk6GNem6+rvsD5LI=; b=c8laQ4Sr/pMYPo3Iw2555JBpfs
	j4TJ2QIqO4Z6PgSJBgI4PxrfWTxuybyw0fKUj8ra7dwelvtb6npmqkQ1YgEDOx45pW2IF8oZI7kVM
	GQneY+wdOSZSKcTAOHZvlZFhm422xXCCHfqas84QcCDRu392GHHbmsW6+iNKH4UBdzegKigmRQ6oI
	14z8HJmF5nJlZDJS9Y07q33DIYeaAMuM5jkBouY1QCmkw2Jlp0C+dcFuD/xSRHXrMV/xYkQFlW6yJ
	HexnDJvTi/DnoFauvvJIdnybzjCuFNv9uqvRJDDLM40Kc8i8DUxLqx1yDxhXl1Xpd/+Hun8wyVt9v
	+ClUPCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJJk-00000003Phg-3v56;
	Thu, 30 Oct 2025 03:27:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJJj-00000003PhO-0QP1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 03:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E39E7602F2;
	Thu, 30 Oct 2025 03:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6686C4CEFF;
	Thu, 30 Oct 2025 03:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761794833;
	bh=cfhICDAycpdcZ0C2xlkyCdUlNHCGdRQjBFptHTiR07c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q3leZ3EQv52ijoBcpC1BDyWPH5QcmZcnGd0YsDnPcBk8E4QDQXA1B4Iny+PMY0mNF
	 evV8c9vtjwD693qQKwKaiueOvg2jyFVsgl53UpUzbdv8fFHjdXrQUQ2dsFm4ohwRfs
	 AQUa/IPdbPamjlgf2YNgY0LZ5mWDnQ9n/UuuV3XEyPcbqt/DPrdJwmHHbz77nHJctX
	 YBH0qaEA9otp/en9y/CiPWivt6DjAJh+MNhI9Xu9+fOjpeslkEh8PyvjE7WnMjHrVe
	 eRTvWTFNvkQ/rMxLnksAkgvoFu53//RxqInaxN/RM2V/lQpn5Vp43T8n/CCmy3zRsX
	 vMuVJZ5sIBsTw==
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
Subject: [PATCH 1/2] perf: Introduce default_overflow_compatible flag
Date: Thu, 30 Oct 2025 12:27:07 +0900
Message-ID: <176179482721.959775.9568162681903659824.stgit@devnote2>
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

Instead of checking whether event->overflow_handler everytime in
is_default_overflow_handler(), just use a flag to check it once when
registering the handler.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 include/linux/perf_event.h |    9 ++-------
 kernel/events/core.c       |    2 ++
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index fd1d91017b99..40dd897e26b0 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -902,6 +902,7 @@ struct perf_event {
 	u64				(*clock)(void);
 	perf_overflow_handler_t		overflow_handler;
 	void				*overflow_handler_context;
+	bool				default_overflow_compatible;
 	struct bpf_prog			*prog;
 	u64				bpf_cookie;
 
@@ -1505,13 +1506,7 @@ extern int perf_event_output(struct perf_event *event,
 static inline bool
 is_default_overflow_handler(struct perf_event *event)
 {
-	perf_overflow_handler_t overflow_handler = event->overflow_handler;
-
-	if (likely(overflow_handler == perf_event_output_forward))
-		return true;
-	if (unlikely(overflow_handler == perf_event_output_backward))
-		return true;
-	return false;
+	return event->default_overflow_compatible;
 }
 
 extern void
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 177e57c1a362..6bbbde82cb21 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -12946,9 +12946,11 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	} else if (is_write_backward(event)){
 		event->overflow_handler = perf_event_output_backward;
 		event->overflow_handler_context = NULL;
+		event->default_overflow_compatible = true;
 	} else {
 		event->overflow_handler = perf_event_output_forward;
 		event->overflow_handler_context = NULL;
+		event->default_overflow_compatible = true;
 	}
 
 	perf_event__state_init(event);


