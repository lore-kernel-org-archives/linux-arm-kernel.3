Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE782D167ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uiR0IsdScMJKJ+fOYzcS8WzhGzf5iPVuPEasIgwQBM4=; b=hsZ/zEhVSgwFegDGUMqnlSDRph
	EkRxEbe0NVTTozPEnUEroScdHNRj8n/pwFPydUHcBpplyqX0P8ktZl8LPoUPHyC/xOmf2OmiDpE1J
	gFIBucUPjUp4fcYnhk5GZb387XxZFv7HGiH+7hfO2Bc5Ir7DH1wq1yA7xsiKQfU7FI9VjPAhgOWld
	DM42RHWrr7ZIWzSz1XMJd46UTcNXlIGVfY2VuAjm3Wegmyq95JHU0yEBvPAI0Mb2LfW5nCyzZBu6m
	wcc2zg5KlSK+FCLT+qTF5vNBxa7fJ82Wi4oPhPDEWDE/UWudvkkeEHdk111+mZWclivr5iKAjIK4U
	q4gwhFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8th-000000021wp-351T;
	Fri, 09 Jan 2026 09:35:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8tg-000000021wb-2KL6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0044260136;
	Fri,  9 Jan 2026 09:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F4AC4CEF1;
	Fri,  9 Jan 2026 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951307;
	bh=pPkYhOhuvx7Qqn/awx2pSNRq1M/gtoJcWz56iO/SzvY=;
	h=From:To:Cc:Subject:Date:From;
	b=DCBq9faDNPiKa+ckMvzFykF7/66rf1wwwECMIdXx5M48fvxUJULot7JPelGaj2FI/
	 snrf8X0KA67Ua1AuU/v2CAjYSv0Vuag/UJR3X9pB1rxb0af0EQ8HmyB5lDO0ihJH1X
	 qzXTG0jsmv1cP4AXrMmNHN6tmMWY5ZkApDNEaRAfOOK8tim6R5ooLvi6aYz03z0SSu
	 EGYI0RhsRIMT0W4Iz6MYhx6tBr/TkSjPixe0Zm2eExIsq9zt7z4WS6OSLXO5rTt9Jd
	 LT8tDThV6Dkv9MC0vW7hCimYJ2KIxzpSuomjB7HfpsaL6E9yMFPAKaKI5lMr0BGklJ
	 IKKxLOCO4CFVg==
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
Subject: [PATCHv2 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after bpf_prog_run
Date: Fri,  9 Jan 2026 10:34:53 +0100
Message-ID: <20260109093454.389295-1-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
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

Mahe reported issue with bpf_override_return helper not working when
executed from kprobe.multi bpf program on arm.

The problem is that on arm we use alternate storage for pt_regs object
that is passed to bpf_prog_run and if any register is changed (which
is the case of bpf_override_return) it's not propagated back to actual
pt_regs object.

Fixing this by introducing and calling ftrace_partial_regs_update function
to propagate the values of changed registers (ip and stack).

Reported-by: Mahe Tardy <mahe.tardy@gmail.com>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
v2 changes:
- moved ftrace_partial_regs_update to generic code [Will]

 include/linux/ftrace_regs.h | 25 +++++++++++++++++++++++++
 kernel/trace/bpf_trace.c    |  1 +
 2 files changed, 26 insertions(+)

diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
index 15627ceea9bc..f9a7c009cdae 100644
--- a/include/linux/ftrace_regs.h
+++ b/include/linux/ftrace_regs.h
@@ -33,6 +33,31 @@ struct ftrace_regs;
 #define ftrace_regs_get_frame_pointer(fregs) \
 	frame_pointer(&arch_ftrace_regs(fregs)->regs)
 
+static __always_inline void
+ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs) { }
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
+ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs)
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


