Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608EDC9EC7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wZ8JadAnhhLLDN9rl15tWSDMysc6I539TMUK/8bBn6U=; b=gjrMXco4K2RMa+wuJasf0NY99w
	2YdmqN1lScKOG+srNUgg4uhPVF9Hn61pA5OtzlB5pNBeArkjFF6F7yXaF03sbzTZyZJZhHiHi4vAv
	hgfyOSPJnLRxxcmNeSOF6sSaQpOL/w9P+me2e0FoTATM2/X9zGC/MajhP33+zxy5mWcmCFcrfImhh
	Hp1BojOKjqIz4CnaYEaIIUAUirJj/N3OCsVR7kpu8Lsk+is2eO3NdCb6UDEddWBxSKtFNNzIBSPiY
	L/355vuJETtPuPjG5bFTcU3E0mvPef97jPEtGTsy6BWCztClI8sDGcOuMUsG8lG7bAWCHh9Bq/sCC
	JVLu4F9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGmN-00000005JMf-1Vlq;
	Mon, 12 Jan 2026 12:12:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGmL-00000005JLz-0yNd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 12:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D035740045;
	Mon, 12 Jan 2026 12:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B428C16AAE;
	Mon, 12 Jan 2026 12:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768219930;
	bh=n+svx5fkeE5YImMc49W7xxRF+Ubqh9i7V5UVorUcq94=;
	h=From:To:Cc:Subject:Date:From;
	b=DCoYWzDbQQzHfOsVALDJjNFMowUJNh7cvrpEsY0T9IpSPIfHsFho8xvAiLZ9uRiT/
	 UJlAvjbepq7i4omK1vVk5jfn2m52M3fi0MgOY+7ViRz3edRwnX+sta1ja5/Z/PYSv4
	 PqfXZhDz5unC5AyZCGlZfQopW/qcG6wMhQ7LQC0Sq4wgzljF37WtjxIJpktRIRKK3h
	 o5ChMZGCdQPqK7S6RBYkx2SJogqNJcPNFf0+ji0BQehLIuxHjoEOBRxn1m0m3+n+sN
	 fto4I1Q1xJDehojU8Jo6r3LbJgEYnmuCD8rVtv14TdlaJoBm1kEawKulzTuPvQ3Mcz
	 DYz1jXU9w0ehg==
From: Jiri Olsa <jolsa@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will Deacon <will@kernel.org>
Cc: Mahe Tardy <mahe.tardy@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Yonghong Song <yhs@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCHv3 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after bpf_prog_run
Date: Mon, 12 Jan 2026 13:11:56 +0100
Message-ID: <20260112121157.854473-1-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_041213_312236_0097544C 
X-CRM114-Status: GOOD (  15.54  )
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

Mahe reported issue with bpf_override_return helper not working when
executed from kprobe.multi bpf program on arm.

The problem is that on arm we use alternate storage for pt_regs object
that is passed to bpf_prog_run and if any register is changed (which
is the case of bpf_override_return) it's not propagated back to actual
pt_regs object.

Fixing this by introducing and calling ftrace_partial_regs_update function
to propagate the values of changed registers (ip and stack).

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Acked-by: Will Deacon <will@kernel.org>
Reported-by: Mahe Tardy <mahe.tardy@gmail.com>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
v3 changes:
- drop const from fregs argument [ci]
- added acks

 include/linux/ftrace_regs.h | 25 +++++++++++++++++++++++++
 kernel/trace/bpf_trace.c    |  1 +
 2 files changed, 26 insertions(+)

diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
index 15627ceea9bc..386fa48c4a95 100644
--- a/include/linux/ftrace_regs.h
+++ b/include/linux/ftrace_regs.h
@@ -33,6 +33,31 @@ struct ftrace_regs;
 #define ftrace_regs_get_frame_pointer(fregs) \
 	frame_pointer(&arch_ftrace_regs(fregs)->regs)
 
+static __always_inline void
+ftrace_partial_regs_update(struct ftrace_regs *fregs, struct pt_regs *regs) { }
+
+#else
+
+/*
+ * ftrace_partial_regs_update - update the original ftrace_regs from regs
+ * @fregs: The ftrace_regs to update from @regs
+ * @regs: The partial regs from ftrace_partial_regs() that was updated
+ *
+ * Some architectures have the partial regs living in the ftrace_regs
+ * structure, whereas other architectures need to make a different copy
+ * of the @regs. If a partial @regs is retrieved by ftrace_partial_regs() and
+ * if the code using @regs updates a field (like the instruction pointer or
+ * stack pointer) it may need to propagate that change to the original @fregs
+ * it retrieved the partial @regs from. Use this function to guarantee that
+ * update happens.
+ */
+static __always_inline void
+ftrace_partial_regs_update(struct ftrace_regs *fregs, struct pt_regs *regs)
+{
+	ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
+	ftrace_regs_set_return_value(fregs, regs_return_value(regs));
+}
+
 #endif /* HAVE_ARCH_FTRACE_REGS */
 
 /* This can be overridden by the architectures */
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 6e076485bf70..3a17f79b20c2 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -2564,6 +2564,7 @@ kprobe_multi_link_prog_run(struct bpf_kprobe_multi_link *link,
 	old_run_ctx = bpf_set_run_ctx(&run_ctx.session_ctx.run_ctx);
 	err = bpf_prog_run(link->link.prog, regs);
 	bpf_reset_run_ctx(old_run_ctx);
+	ftrace_partial_regs_update(fregs, bpf_kprobe_multi_pt_regs_ptr());
 	rcu_read_unlock();
 
  out:
-- 
2.52.0


