Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC33FEE0209
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/2IPZzzk3idTOh/fXhVZim3B9qOFRLkemWqIX3yYX8=; b=WEl25wb1ybu3Y+ryzkCqbb3cZU
	rl2iLVBsNyn/jmUV4LRK0p3WDPHnAZtWeLryiZ9aEzta2d1E6cux5j+30r4L8VybxN7oWkEO1ZT3t
	w0AmlFaP/etUDZIBAJdW33fv4EkTr9EG36k2isLgaryyRQzJyDm9i4mGcUaDhvc4HImJ0QPrms/Z9
	OO3jFRfR7rq8Daf3E4CkBx/3ygVMY+p3k7RuEnjeKgoUa3kleA/Dp9t5SxK3OerwLXXq1um5fo+M9
	7amrjTYSzCLHWdrX8g6N5lx2nsjG402BabXWvYa2hxsg3gdul6Jo9Zpida3j1Yicaeys608r4shmd
	kIvpDHuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vab3S-00000004x6m-4Baq;
	Tue, 30 Dec 2025 14:50:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vab3Q-00000004x68-0Zxa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 14:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39AE160010;
	Tue, 30 Dec 2025 14:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB42FC4CEFB;
	Tue, 30 Dec 2025 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767106230;
	bh=1PgfFQ0QPBJwuDSRx9cjHAtf7RHxjT8iELpalqbU8mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PgB5TIbjctDmru5Rfs7JzWSZdGSt3el+wwFWGvPDmC/+wgs14+jhgesuliQYRHqmy
	 Ud7aAJKzNUYj2jfk+LEhhxIPt67JaGZQB+SuHs/QAMH4KyLgEHdm9IaGKBhOxV01cV
	 eiqBvNmyEIB/i2GbOvlSd6nBrqGEOso72Cj9rpdO2b/cU1u4Isv4fzJ2dBl2djM6SC
	 F1oPyfNlD1cXV9VSwYnnIzf62XB+IWC87AKYf77NcHTcraXEPWGGFehVWa7hrKSZHA
	 6dfQ7lOYp8v+F9OSqUoZWeMoBpM/8Os9gngRq+fnV1BJr4onMcb9wrVdCUy8ig8tYJ
	 ZthaqSq2Ony7w==
From: Jiri Olsa <jolsa@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: [PATCHv6 bpf-next 1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP ftrace_ops flag
Date: Tue, 30 Dec 2025 15:50:02 +0100
Message-ID: <20251230145010.103439-2-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230145010.103439-1-jolsa@kernel.org>
References: <20251230145010.103439-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

At the moment the we allow the jmp attach only for ftrace_ops that
has FTRACE_OPS_FL_JMP set. This conflicts with following changes
where we use single ftrace_ops object for all direct call sites,
so all could be be attached via just call or jmp.

We already limit the jmp attach support with config option and bit
(LSB) set on the trampoline address. It turns out that's actually
enough to limit the jmp attach for architecture and only for chosen
addresses (with LSB bit set).

Each user of register_ftrace_direct or modify_ftrace_direct can set
the trampoline bit (LSB) to indicate it has to be attached by jmp.

The bpf trampoline generation code uses trampoline flags to generate
jmp-attach specific code and ftrace inner code uses the trampoline
bit (LSB) to handle return from jmp attachment, so there's no harm
to remove the FTRACE_OPS_FL_JMP bit.

The fexit/fmodret performance stays the same (did not drop),
current code:

  fentry         :   77.904 ± 0.546M/s
  fexit          :   62.430 ± 0.554M/s
  fmodret        :   66.503 ± 0.902M/s

with this change:

  fentry         :   80.472 ± 0.061M/s
  fexit          :   63.995 ± 0.127M/s
  fmodret        :   67.362 ± 0.175M/s

Fixes: 25e4e3565d45 ("ftrace: Introduce FTRACE_OPS_FL_JMP")
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h  |  1 -
 kernel/bpf/trampoline.c | 32 ++++++++++++++------------------
 kernel/trace/ftrace.c   | 14 --------------
 3 files changed, 14 insertions(+), 33 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 770f0dc993cc..41c9bb08d4e4 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -359,7 +359,6 @@ enum {
 	FTRACE_OPS_FL_DIRECT			= BIT(17),
 	FTRACE_OPS_FL_SUBOP			= BIT(18),
 	FTRACE_OPS_FL_GRAPH			= BIT(19),
-	FTRACE_OPS_FL_JMP			= BIT(20),
 };
 
 #ifndef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 2a125d063e62..789ff4e1f40b 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -214,10 +214,15 @@ static int modify_fentry(struct bpf_trampoline *tr, u32 orig_flags,
 	int ret;
 
 	if (tr->func.ftrace_managed) {
+		unsigned long addr = (unsigned long) new_addr;
+
+		if (bpf_trampoline_use_jmp(tr->flags))
+			addr = ftrace_jmp_set(addr);
+
 		if (lock_direct_mutex)
-			ret = modify_ftrace_direct(tr->fops, (long)new_addr);
+			ret = modify_ftrace_direct(tr->fops, addr);
 		else
-			ret = modify_ftrace_direct_nolock(tr->fops, (long)new_addr);
+			ret = modify_ftrace_direct_nolock(tr->fops, addr);
 	} else {
 		ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr,
 						   new_addr);
@@ -240,10 +245,15 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
 	}
 
 	if (tr->func.ftrace_managed) {
+		unsigned long addr = (unsigned long) new_addr;
+
+		if (bpf_trampoline_use_jmp(tr->flags))
+			addr = ftrace_jmp_set(addr);
+
 		ret = ftrace_set_filter_ip(tr->fops, (unsigned long)ip, 0, 1);
 		if (ret)
 			return ret;
-		ret = register_ftrace_direct(tr->fops, (long)new_addr);
+		ret = register_ftrace_direct(tr->fops, addr);
 	} else {
 		ret = bpf_trampoline_update_fentry(tr, 0, NULL, new_addr);
 	}
@@ -499,13 +509,6 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
 	if (err)
 		goto out_free;
 
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_JMP
-	if (bpf_trampoline_use_jmp(tr->flags))
-		tr->fops->flags |= FTRACE_OPS_FL_JMP;
-	else
-		tr->fops->flags &= ~FTRACE_OPS_FL_JMP;
-#endif
-
 	WARN_ON(tr->cur_image && total == 0);
 	if (tr->cur_image)
 		/* progs already running at this address */
@@ -533,15 +536,8 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
 	tr->cur_image = im;
 out:
 	/* If any error happens, restore previous flags */
-	if (err) {
+	if (err)
 		tr->flags = orig_flags;
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_JMP
-		if (bpf_trampoline_use_jmp(tr->flags))
-			tr->fops->flags |= FTRACE_OPS_FL_JMP;
-		else
-			tr->fops->flags &= ~FTRACE_OPS_FL_JMP;
-#endif
-	}
 	kfree(tlinks);
 	return err;
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 3ec2033c0774..f5f042ea079e 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6043,15 +6043,8 @@ int register_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 	if (ftrace_hash_empty(hash))
 		return -EINVAL;
 
-	/* This is a "raw" address, and this should never happen. */
-	if (WARN_ON_ONCE(ftrace_is_jmp(addr)))
-		return -EINVAL;
-
 	mutex_lock(&direct_mutex);
 
-	if (ops->flags & FTRACE_OPS_FL_JMP)
-		addr = ftrace_jmp_set(addr);
-
 	/* Make sure requested entries are not already registered.. */
 	size = 1 << hash->size_bits;
 	for (i = 0; i < size; i++) {
@@ -6172,13 +6165,6 @@ __modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 
 	lockdep_assert_held_once(&direct_mutex);
 
-	/* This is a "raw" address, and this should never happen. */
-	if (WARN_ON_ONCE(ftrace_is_jmp(addr)))
-		return -EINVAL;
-
-	if (ops->flags & FTRACE_OPS_FL_JMP)
-		addr = ftrace_jmp_set(addr);
-
 	/* Enable the tmp_ops to have the same functions as the direct ops */
 	ftrace_ops_init(&tmp_ops);
 	tmp_ops.func_hash = ops->func_hash;
-- 
2.52.0


