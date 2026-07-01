Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C021C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8IvyApca3rIZ+G3IaiQJxW6To6JY2BREwgZjIj25gY=; b=nCZSRUMNiVLq/Ca6e6mrrwWcxp
	sjY5ybgquS5NvWg03z6HjqtNVlbBCVuzjRpkyZCng25rTIFjG1Y/GwnYsUkKhQaw10/YUE+vkx/Yq
	SosPRG9M+0BkVey/dgtHpebNeZw932brpHT8HwMgN5k5iw9KETnIrmmpJRCTcNl2W+cFI7YEdRJ1c
	f2xBudoo2582WCbqz6yXv0Ar0AMS16O2W0lkNq7xlSI/QEb1NJH3647Ewr6uK4l66K+cNc//ljj8v
	eE+X8sBM6Lz2jdNnIZ3WCn2wiNbdi3a4xRz4mIAimZozD8qvG7S+7wYp9HQyET2h0TCPfulnz/hcR
	aR6X4Apw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyTi-00000002gIh-1sxL;
	Wed, 01 Jul 2026 17:12:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyTg-00000002gIY-45vP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 17:12:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C40440BD6;
	Wed,  1 Jul 2026 17:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF191F000E9;
	Wed,  1 Jul 2026 17:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925920;
	bh=N8IvyApca3rIZ+G3IaiQJxW6To6JY2BREwgZjIj25gY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AOZxBODkICJ+Fy6V7cpnDvxOfv/VlHsWrP5biXXMGaDirktH6tiNnaKrHVoOhaEil
	 AYaMPSOBiuJB1diCbMH4rA1njNgEmd4hfd7LQu60RaA1f2AGDPhBx818hFFPYbDWfc
	 PdYGoi1OOt/0lB1MA2phAEN78bvQysvnz0ONvCyeKDZeGD0yxEBQ5Vz+aTBtVM2+xc
	 yzY9EeEWZQzld5AZITQC0EOudFKFdix5RPPE68u9XMTz++ZZwtglK0X1TGgZGCK+QH
	 MC8BffKNEnb7QJz0CZwKRBLC48hXc5F5DPvc5aZyAdSuMwLSuhSj4B/h/JOylSVcl2
	 HuwVOODRaMaUA==
Date: Wed, 1 Jul 2026 13:11:57 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Carlier <devnexen@gmail.com>, linux-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Vineeth Pillai (Google)"
 <vineeth@bitbyteword.org>, Peter Zijlstra <peterz@infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [for-next][PATCH 04/15] tracepoint: Add lockdep
 rcu_is_watching() check to trace_##name##_enabled()
Message-ID: <20260701131157.3fc4c695@robin>
In-Reply-To: <CAMuHMdUdsTHCMnitVEHdZvRFe9xgmLLTjSr=QqvOi0dxFjkTEA@mail.gmail.com>
References: <20260522143508.298439732@kernel.org>
	<20260522143525.551205135@kernel.org>
	<CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com>
	<20260630155318.7db20990@gandalf.local.home>
	<CAMuHMdUdsTHCMnitVEHdZvRFe9xgmLLTjSr=QqvOi0dxFjkTEA@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 1 Jul 2026 11:24:31 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Thanks, it does not trigger with the commit reverted and the "echo 1 > ...".

Ah found the issue;

#define trace(point, args)                                      \
        do {                                                    \
                if (trace_##point##_enabled()) {                \
                        bool exit_rcu = false;                  \
                        if (in_nmi())                           \
                                break;                          \
                        if (!IS_ENABLED(CONFIG_TINY_RCU) &&     \
                            is_idle_task(current)) {            \
                                ct_irq_enter();                 \
                                exit_rcu = true;                \
                        }                                       \
                        trace_##point(args);                    \
                        if (exit_rcu)                           \
                                ct_irq_exit();                  \
                }                                               \
        } while (0)
#endif

The code within the enabled() call checks if RCU is watching, and if
not, it makes it watch. So yeah, this is a special case.

The following patch should fix the issue:

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 4a0c36f40fe2..e0d838c9ce93 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -292,13 +292,18 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	{								\
 	}								\
 	static inline bool						\
+	__trace_##name##_enabled(void)					\
+	{								\
+		return static_branch_unlikely(&__tracepoint_##name.key);\
+	}								\
+	static inline bool						\
 	trace_##name##_enabled(void)					\
 	{								\
 		if (IS_ENABLED(CONFIG_LOCKDEP)) {			\
 			WARN_ONCE(!rcu_is_watching(),			\
 				  "RCU not watching for tracepoint");	\
 		}							\
-		return static_branch_unlikely(&__tracepoint_##name.key);\
+		return __trace_##name##_enabled();			\
 	}
 
 #define __DECLARE_TRACE(name, proto, args, cond, data_proto)			\
@@ -457,6 +462,11 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	{								\
 	}								\
 	static inline bool						\
+	__trace_##name##_enabled(void)					\
+	{								\
+		return false;						\
+	}								\
+	static inline bool						\
 	trace_##name##_enabled(void)					\
 	{								\
 		return false;						\
diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
index 0c42b15c3800..b63e3558948f 100644
--- a/kernel/trace/trace_preemptirq.c
+++ b/kernel/trace/trace_preemptirq.c
@@ -30,7 +30,7 @@
 #else
 #define trace(point, args)					\
 	do {							\
-		if (trace_##point##_enabled()) {		\
+		if (__trace_##point##_enabled()) {		\
 			bool exit_rcu = false;			\
 			if (in_nmi())				\
 				break;				\

