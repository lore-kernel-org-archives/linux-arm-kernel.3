Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8861CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5B3Px7omDUQ9G1QzTgcV/gF7kzvl8IrHAUPQM6iNXT8=; b=U9M5O5oGHemdhO+bybeHoDNUW/
	7ZvsvEPfdc4/BdMuEdEU3nraFqos+LxxRa28ycU1Wp7xhT0uPF6T3s7s7kDdDzUdMrqWL1XuZOdI7
	oz/CDXuBCXgrZvrsYquK5juF8c2Sc7jnymZWGEhrx5y1OdzC6EZV2r7CCLZezEll9EdbrZUZtNYlw
	2MUmfD29W6C47FgOO3WwIlMxjmnrxbEaqtKuhProC81Edq7SMNsAl3/XNJzjIAzmJRPQlDjjUPU0x
	06RUuKzhu7MbtZ6ttK66XeAzCmtt7LoYRWwCxJAMDbiTVkEBiFxuMTbHOYqAY7sDgY9M8XQqyai2z
	mACtk8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGd6w-0000000Diom-3Rtt;
	Wed, 05 Nov 2025 12:59:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGd6v-0000000Diog-3pV3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 12:59:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2110560206;
	Wed,  5 Nov 2025 12:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96201C4CEFB;
	Wed,  5 Nov 2025 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762347576;
	bh=jpnJ48qhdCzZWVaUVk/6Kd9usKKrMZGpmnLRffFITaM=;
	h=From:To:Cc:Subject:Date:From;
	b=dh8V1JzxYunjByCIMP+bNdUc23uJ97cuIrGZSn9GTuEHit1ac7nDZMSTF0o7nLDyT
	 zi5k+dp6JSjiZ5z/Fym3Abmcx/xTrMR5h+ztIPXGpdwWS8Ni5/KhQ7Q1mZkjn0xdQN
	 VMn7yqnBYIJXnN7jIyE+fq1hx/tSADE9h7nAbMBgyknti7l7ST/JaQHsvIu8eEQ1aV
	 FUhy1bnP11BOdizIZWdnrXJ+WHWjqtjw7CaOZ9p1y7SyJtlfMU6dpG/WzLRGBSIu6v
	 BN3ge8M+q5I/7QempGWXqY1/qAwkRpWkkp72J8Axv1SRI/0IT0jQ6CDTQTb5Gkvbkl
	 YflHEy4uz4Sww==
From: Jiri Olsa <jolsa@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Yonghong Song <yhs@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mahe Tardy <mahe.tardy@gmail.com>
Subject: [BUG/RFC 1/2] arm64/ftrace,bpf: Fix partial regs after bpf_prog_run
Date: Wed,  5 Nov 2025 13:59:23 +0100
Message-ID: <20251105125924.365205-1-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
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

hi,
Mahe reported issue with bpf_override_return helper not working
when executed from kprobe.multi bpf program on arm.

The problem seems to be that on arm we use alternate storage for
pt_regs object that is passed to bpf_prog_run and if any register
is changed (which is the case of bpf_override_return) it's not
propagated back to actual pt_regs object.

The change below seems to fix the issue, but I have no idea if
that's proper fix for arm, thoughts?

I'm attaching selftest to actually test bpf_override_return helper
functionality, because currently we only test that we are able to
attach a program with it, but not the override itself.

thanks,
jirka


---
 arch/arm64/include/asm/ftrace.h | 11 +++++++++++
 include/linux/ftrace.h          |  3 +++
 kernel/trace/bpf_trace.c        |  1 +
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index ba7cf7fec5e9..ad6cf587885c 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -157,6 +157,17 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
 	return regs;
 }
 
+static __always_inline void
+ftrace_partial_regs_fix(const struct ftrace_regs *fregs, struct pt_regs *regs)
+{
+	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
+
+	if (afregs->pc != regs->pc) {
+		afregs->pc = regs->pc;
+		afregs->regs[0] = regs->regs[0];
+	}
+}
+
 #define arch_ftrace_fill_perf_regs(fregs, _regs) do {		\
 		(_regs)->pc = arch_ftrace_regs(fregs)->pc;			\
 		(_regs)->regs[29] = arch_ftrace_regs(fregs)->fp;		\
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 7ded7df6e9b5..4cb1315522bb 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -205,6 +205,9 @@ ftrace_partial_regs(struct ftrace_regs *fregs, struct pt_regs *regs)
 	return &arch_ftrace_regs(fregs)->regs;
 }
 
+static __always_inline void
+ftrace_partial_regs_fix(struct ftrace_regs *fregs, struct pt_regs *regs) { }
+
 #endif /* !CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS || CONFIG_HAVE_FTRACE_REGS_HAVING_PT_REGS */
 
 #ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index a795f7afbf3d..7b5768ced9b3 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -2564,6 +2564,7 @@ kprobe_multi_link_prog_run(struct bpf_kprobe_multi_link *link,
 	old_run_ctx = bpf_set_run_ctx(&run_ctx.session_ctx.run_ctx);
 	err = bpf_prog_run(link->link.prog, regs);
 	bpf_reset_run_ctx(old_run_ctx);
+	ftrace_partial_regs_fix(fregs, bpf_kprobe_multi_pt_regs_ptr());
 	rcu_read_unlock();
 
  out:
-- 
2.51.1


