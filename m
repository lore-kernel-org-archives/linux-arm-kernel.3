Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE26C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 01:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0uHbqZC+hQxjpI8j3d5PlbHEuGuWnyXXe+vZbNe5Dc=; b=f512xjbK8xKah+0t3Ta22aGZOM
	injr2/n8C9WN83qbsr51Q4BvU4fwFLVL5YNI7K0KdLsMknxjEO1iKUfyXs+y8biG+3JyU3E0eCfbu
	AxKtrg1dFzmUwAWy856t1Uh6CmaD7wEX1zJKhBKSzy98mxUvMRh158pB7nEOGbUBimN7/0R3M4cSL
	A+Ph4tBEBQrvdJwn71XsbROU61ekId/lbyMqRhMJW/hAonkRDS1G+LsBP5lW2sDvKkOG/TFIbYTr/
	UAUnkWnXM+ulwQhkX8lhrZICTbhNwdXFTVr/3lzDOsTdwNmpc779gBirMmKv1/fqVRwjk4dTvrK31
	hr6yzwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuhri-00000007iOQ-1Zns;
	Wed, 19 Mar 2025 01:05:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuhq1-00000007i2b-409p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 01:03:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62618615B0;
	Wed, 19 Mar 2025 01:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1882C4CEDD;
	Wed, 19 Mar 2025 01:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742346197;
	bh=tPrURzCRqtqxEz8HWQbXFiAdcY7czjiPvG3bo9E4Fho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZyOaLxBhfGDCCJtlIirn9aUPCbDBxyTUNaDhy3mFW0+3kXQiYQXXWtgJ60HSJoIUM
	 QjUI3Ufrvwho+S+Zj+AGeravryB6jHpN7hKDlru1VfuV7wcx2CbM2dzch0YdBh1Zd2
	 eEpeidvp4//kQJ6oZ/s58fTBgTGSWbL/TnHkY3lFEVZo3JxPm6PnAt9NqvqM8PEkr5
	 C9qwHUIAEjNNiWYTvvUQir+hYNVZ3qOVU/orXdioAkjYcUhSv9R1DrDtqifwmS0V5H
	 bB2AXb2ETODHdWnPjtocTOUoKdtbb+jqpQ3MVGgSRGLLhIxWEuz5A/Gpbmy5D07XdF
	 ZRIwX6gCUeEAA==
Date: Tue, 18 Mar 2025 18:03:13 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, indu.bhagat@oracle.com, 
	puranjay@kernel.org, wnliu@google.com, irogers@google.com, joe.lawrence@redhat.com, 
	mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, will@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <pym6gfbapfy6qlmduszjk6tf2oc2fv4rtxgwjgex7bwlgpfwvs@bkt7qfmf7rc4>
References: <20250308012742.3208215-1-song@kernel.org>
 <20250308012742.3208215-2-song@kernel.org>
 <iajk7zuxy7fun7f7sv52ydhq7siqub3ec2lmguomdd3fhdw4s2@cwyfihj3gvpn>
 <CAPhsuW4A73c0AjpUwSRJ4o-4E6wpA9c5L0xWaxvHkJ3m+BLGVA@mail.gmail.com>
 <ox4c6flgu7mzkvyontbz2budummiu7e6icke7xl3msmuj2q2ii@xb5mvqcst2vg>
 <CAPhsuW4BEDU=ZJavnofZtygGcQ9AJ5F2jJiuV6-nsnbZD+Gg-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4BEDU=ZJavnofZtygGcQ9AJ5F2jJiuV6-nsnbZD+Gg-Q@mail.gmail.com>
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

On Tue, Mar 18, 2025 at 04:38:20PM -0700, Song Liu wrote:
> On Tue, Mar 18, 2025 at 4:00 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >   - even in the -ENOENT case the unreliable bit has already been set
> >     right before the call to kunwind_next_frame_record_meta().
> 
> For this one, do you mean we set state->common.unreliable, but
> failed to propagate it to data.unreliable?

Hm, I hadn't noticed that.  That code is quite the maze.

It's unfortunate there are two separate 'unreliable' variables.  It
looks like consume_state() is the only way they get synced?

How does that work if kunwind_next() returns an error and skips
consume_state()?  Or if kunwind_recover_return_address() returns an
error to kunwind_next()?

What I actually meant was the following:

  do_kunwind()
    kunwind_next()
      kunwind_next_frame_record()
        state->common.unreliable = true;
	kunwind_next_frame_record_meta()
	  return -ENOENT;

Notice that in the success case (-ENOENT), unreliable has already been
set.

Actually I think it would be much simpler to just propagate -ENOENT down
the call chain.  Then no 'unreliable' bits needed.

Like so (instead of original patch):

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c9fe3e7566a6..5713fad567c5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -276,6 +276,7 @@ config ARM64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
+	select HAVE_RELIABLE_STACKTRACE
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
@@ -2509,4 +2510,3 @@ endmenu # "CPU Power Management"
 source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
-
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 1d9d51d7627f..e227da842bc3 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -277,22 +277,28 @@ kunwind_next(struct kunwind_state *state)
 
 typedef bool (*kunwind_consume_fn)(const struct kunwind_state *state, void *cookie);
 
-static __always_inline void
+static __always_inline int
 do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
 	   void *cookie)
 {
-	if (kunwind_recover_return_address(state))
-		return;
+	int ret;
+
+	ret = kunwind_recover_return_address(state);
+	if (ret)
+		return ret;
 
 	while (1) {
 		int ret;
 
 		if (!consume_state(state, cookie))
-			break;
+			return -EINVAL;
+
 		ret = kunwind_next(state);
-		if (ret < 0)
-			break;
+		if (ret)
+			return ret;
 	}
+
+	return -EINVAL;
 }
 
 /*
@@ -324,7 +330,7 @@ do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
 			: stackinfo_get_unknown();		\
 	})
 
-static __always_inline void
+static __always_inline int
 kunwind_stack_walk(kunwind_consume_fn consume_state,
 		   void *cookie, struct task_struct *task,
 		   struct pt_regs *regs)
@@ -352,7 +358,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 
 	if (regs) {
 		if (task != current)
-			return;
+			return -EINVAL;
 		kunwind_init_from_regs(&state, regs);
 	} else if (task == current) {
 		kunwind_init_from_caller(&state);
@@ -360,7 +366,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 		kunwind_init_from_task(&state, task);
 	}
 
-	do_kunwind(&state, consume_state, cookie);
+	return do_kunwind(&state, consume_state, cookie);
 }
 
 struct kunwind_consume_entry_data {
@@ -387,6 +393,25 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
 	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
 }
 
+noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
+			void *cookie, struct task_struct *task)
+{
+	int ret;
+	struct kunwind_consume_entry_data data = {
+		.consume_entry = consume_entry,
+		.cookie = cookie,
+	};
+
+	ret = kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, NULL);
+	if (ret) {
+		if (ret == -ENOENT)
+			return 0;
+		return ret;
+	}
+
+	return -EINVAL;
+}
+
 struct bpf_unwind_consume_entry_data {
 	bool (*consume_entry)(void *cookie, u64 ip, u64 sp, u64 fp);
 	void *cookie;

