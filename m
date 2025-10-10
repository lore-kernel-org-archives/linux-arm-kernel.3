Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B08CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZSxQNDyqaqLbPz4fQtAMe+wkuer6c/+cc0bKB75WPM=; b=bK0Bc+QQFkSFp1yqFYNsdMq366
	5f+EFhMqcUjdq5FW5sYisbP0l7qGe7xzGkcdn5VxuN1WCbWRGgqexY8o4Huv+20R4dtrfjAF+URXO
	pcilLxoLdHzRaQpncwDUWqfJLiCH1sRcKHgrJFqqBrw2LTDzbC9uIaCPPIAhsiSBieZM3U0M5BNXC
	9c8d/mHZeVtWgTJwRNZYEY7W5UU2AmWs5Vtf83sWIA19+7JK+dFcWTqttkoWzM1xgpU+xoLYf8GN3
	NhI7X5vNGMc7pjzNheXs7P4gkfc7k6x5A8Joqb0np8Mi0IaExXSQPOZJ6Sr0ne5OFiUNjTW2IOsmQ
	GuBA2zug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FLJ-00000008uMO-3KPb;
	Fri, 10 Oct 2025 15:47:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FLH-00000008uIX-0hqJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZSxQNDyqaqLbPz4fQtAMe+wkuer6c/+cc0bKB75WPM=;
	b=QwaLgr/hvQX1ABeWK0m/ZRAQXS09j5HK8tRmdjBQGJ3NftTIPe7Zd78QCy4h2b8v6m7PxE
	GRNZg/Ys1VKlNk5BlNsRgxarEbB9wqjFCeSB6uTYBbr1QrWNd5JXQgqnDpBqtRoWpudxoo
	6wNuQZWwk2pS55Ybq0rXIH/aMIhZqdw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-384-gHsLeaZYN2q0fujOe0R-ug-1; Fri,
 10 Oct 2025 11:47:35 -0400
X-MC-Unique: gHsLeaZYN2q0fujOe0R-ug-1
X-Mimecast-MFC-AGG-ID: gHsLeaZYN2q0fujOe0R-ug_1760111251
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0A791956096;
	Fri, 10 Oct 2025 15:47:30 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EDAAF180035E;
	Fri, 10 Oct 2025 15:47:15 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>
Subject: [RFC PATCH v6 26/29] x86/mm/pti: Introduce a kernel/user CR3 software signal
Date: Fri, 10 Oct 2025 17:38:36 +0200
Message-ID: <20251010153839.151763-27-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_084739_280461_46CE845B 
X-CRM114-Status: GOOD (  17.15  )
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

Later commits will rely on this information to defer kernel TLB flush
IPIs. Update it when switching to and from the kernel CR3.

This will only be really useful for NOHZ_FULL CPUs, but it should be
cheaper to unconditionally update a never-used per-CPU variable living in
its own cacheline than to check a shared cpumask such as
  housekeeping_cpumask(HK_TYPE_KERNEL_NOISE)
at every entry.

Note that the COALESCE_TLBI config option is introduced in a later commit,
when the whole feature is implemented.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
Per the cover letter, I really hate this, but couldn't come up with
anything better.
---
 arch/x86/entry/calling.h        | 16 ++++++++++++++++
 arch/x86/entry/syscall_64.c     |  4 ++++
 arch/x86/include/asm/tlbflush.h |  3 +++
 3 files changed, 23 insertions(+)

diff --git a/arch/x86/entry/calling.h b/arch/x86/entry/calling.h
index 94519688b0071..813451b1ddecc 100644
--- a/arch/x86/entry/calling.h
+++ b/arch/x86/entry/calling.h
@@ -171,11 +171,24 @@ For 32-bit we have the following conventions - kernel is built with
	andq    $(~PTI_USER_PGTABLE_AND_PCID_MASK), \reg
 .endm

+.macro COALESCE_TLBI
+#ifdef CONFIG_COALESCE_TLBI
+	movl     $1, PER_CPU_VAR(kernel_cr3_loaded)
+#endif // CONFIG_COALESCE_TLBI
+.endm
+
+.macro NOTE_SWITCH_TO_USER_CR3
+#ifdef CONFIG_COALESCE_TLBI
+	movl     $0, PER_CPU_VAR(kernel_cr3_loaded)
+#endif // CONFIG_COALESCE_TLBI
+.endm
+
 .macro SWITCH_TO_KERNEL_CR3 scratch_reg:req
	ALTERNATIVE "jmp .Lend_\@", "", X86_FEATURE_PTI
	mov	%cr3, \scratch_reg
	ADJUST_KERNEL_CR3 \scratch_reg
	mov	\scratch_reg, %cr3
+	COALESCE_TLBI
 .Lend_\@:
 .endm

@@ -183,6 +196,7 @@ For 32-bit we have the following conventions - kernel is built with
	PER_CPU_VAR(cpu_tlbstate + TLB_STATE_user_pcid_flush_mask)

 .macro SWITCH_TO_USER_CR3 scratch_reg:req scratch_reg2:req
+	NOTE_SWITCH_TO_USER_CR3
	mov	%cr3, \scratch_reg

	ALTERNATIVE "jmp .Lwrcr3_\@", "", X86_FEATURE_PCID
@@ -242,6 +256,7 @@ For 32-bit we have the following conventions - kernel is built with

	ADJUST_KERNEL_CR3 \scratch_reg
	movq	\scratch_reg, %cr3
+	COALESCE_TLBI

 .Ldone_\@:
 .endm
@@ -258,6 +273,7 @@ For 32-bit we have the following conventions - kernel is built with
	bt	$PTI_USER_PGTABLE_BIT, \save_reg
	jnc	.Lend_\@

+	NOTE_SWITCH_TO_USER_CR3
	ALTERNATIVE "jmp .Lwrcr3_\@", "", X86_FEATURE_PCID

	/*
diff --git a/arch/x86/entry/syscall_64.c b/arch/x86/entry/syscall_64.c
index b6e68ea98b839..2589d232e0ba1 100644
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -83,6 +83,10 @@ static __always_inline bool do_syscall_x32(struct pt_regs *regs, int nr)
	return false;
 }

+#ifdef CONFIG_COALESCE_TLBI
+DEFINE_PER_CPU(bool, kernel_cr3_loaded) = true;
+#endif
+
 /* Returns true to return using SYSRET, or false to use IRET */
 __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
 {
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 00daedfefc1b0..e39ae95b85072 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -17,6 +17,9 @@
 #include <asm/pgtable.h>

 DECLARE_PER_CPU(u64, tlbstate_untag_mask);
+#ifdef CONFIG_COALESCE_TLBI
+DECLARE_PER_CPU(bool, kernel_cr3_loaded);
+#endif

 void __flush_tlb_all(void);

--
2.51.0


