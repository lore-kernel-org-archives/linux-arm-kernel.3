Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F36F9EDC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ok4tU+v42FnBpY0b1zFlcO0nqjgztX7NvVgZzho7yio=; b=l88SD0yTlrd2dqsEkmS9mroGTL
	bjCiTsMZZ6qwf/7oJl19FbnwCDiz5IkakQxtdkCdwDOnu1k9+4tNbgJ1qKpXOMvf5Il9qm7ljweCr
	n+E83Q2GOo1UBM0SDfE3jMQHNMcYCW20JRhhi00ntj4SpDrgvWyNFrMy4uqFEhhMIgAO7O2s3Rv5v
	8PCMm3D6rLZFf+D0Iu3gifNyCOoyJfDY1Ok4zPS79FvoTnIYGYJFw70GsbnbxS9Bsl4Nq/kZSezWQ
	HO8JczlDiOqGj0pF2pELTaP4ipTeXaXdmIBm1MzF3coyCOJfJr7pTHbvmhYmCM5w5F6eOhW28sL8o
	scTcuTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXSl-0000000AHEs-14Q6;
	Wed, 22 Apr 2026 13:17:55 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXSj-0000000AHEH-0sLE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1776863870;
	bh=1C22rigPT2KXHrra2jF9JFPYkfb8rwxFOaD3XoSm4jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VT0yBJQR1p5S9uPQI0a0yXQ+MECx3DqpdB1d0ft8gXrtrOO/WrS/graM7/cM2yb7F
	 WVEw6HbrY8YccqvWCQQ2UZaXshbMnEO9IurjwbMoknt6o95AAd88LWlk0tQazbykbb
	 Cu7nfMno57hsyeSvyXapz8eUhFkjH35XuFXHne9Y=
Date: Wed, 22 Apr 2026 15:17:50 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Carlos O'Donell <carlos@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>, 
	Rich Felker <dalias@aerifal.cx>, Torvald Riegel <triegel@redhat.com>, 
	Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Uros Bizjak <ubizjak@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	kernel-dev@igalia.com
Subject: Re: [PATCH RFC 1/2] arm64: vdso: Prepare for robust futex unlock
 support
Message-ID: <1a06fee7-65ff-4828-85f1-e3ee1e82610f@t-8ch.de>
References: <20260417-tonyk-robust_arm-v1-0-03aa64e2ff1a@igalia.com>
 <20260417-tonyk-robust_arm-v1-1-03aa64e2ff1a@igalia.com>
 <e0ee43e3-725c-4b99-80b3-956d24beb1c7@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0ee43e3-725c-4b99-80b3-956d24beb1c7@t-8ch.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_061753_396570_210168EA 
X-CRM114-Status: GOOD (  22.87  )
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

On 2026-04-22 15:02:45+0200, Thomas Weißschuh wrote:
> On 2026-04-17 11:56:10-0300, André Almeida wrote:
> > There will be a VDSO function to unlock non-contended robust futexes in
> > user space. The unlock sequence is racy vs. clearing the list_pending_op
> > pointer in the task's robust list head. To plug this race the kernel needs
> > to know the critical section window so it can clear the pointer when the
> > task is interrupted within that race window. The window is determined by
> > labels in the inline assembly.
> > 
> > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > ---
> > RFC: Those symbols can't be found by the linker after patch 2/2, it fails with:
> > 
> > ld: arch/arm64/kernel/vdso.o: in function `vdso_futex_robust_unlock_update_ips':
> > arch/arm64/kernel/vdso.c:72:(.text+0x200): undefined reference to `__futex_list64_try_unlock_cs_success'
> > ld: arch/arm64/kernel/vdso.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__futex_list64_try_unlock_cs_success' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > arch/arm64/kernel/vdso.c:72:(.text+0x200): dangerous relocation: unsupported relocation
> 
> arch/arm64/kernel/vdso.o is a kernel object.
> __futex_list64_try_unlock_cs_success is a vDSO symbol.
> They live in wholly different objects, which are never linked together.
> Look at VDSO_SYMBOL() to get the offset of the vDSO symbol in kernel code.
> 
> (...)

The diff below shows the idea. Compat code is not fixed, and I didn't
even try to run it. Also please use CONFIG_COMPAT_VDSO over plain
CONFIG_COMPAT.

diff --git a/arch/arm64/include/asm/vdso.h b/arch/arm64/include/asm/vdso.h
index 182fde1df3dd..232b46969088 100644
--- a/arch/arm64/include/asm/vdso.h
+++ b/arch/arm64/include/asm/vdso.h
@@ -18,10 +18,6 @@
 
 extern char vdso_start[], vdso_end[];
 extern char vdso32_start[], vdso32_end[];
-extern char __futex_list64_try_unlock_cs_success[], __futex_list64_try_unlock_cs_end[];
-#ifdef CONFIG_COMPAT
-extern char __futex_list32_try_unlock_cs_success[], __futex_list32_try_unlock_cs_end[];
-#endif
 
 #endif /* !__ASSEMBLER__ */
 
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 42a82e73a774..45eb1aa627a2 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -64,21 +64,17 @@ static void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_str
 	unsigned long vdso = (unsigned long) mm->context.vdso;
 	struct futex_mm_data *fd = &mm->futex;
 
-	/*
-	 * RFC: won't compile due to undefined reference to `__futex_list64_try_unlock_cs_...`
-
 	if (abi == VDSO_ABI_AA64) {
-		futex_set_vdso_cs_range(fd, 0, vdso, (uintptr_t) __futex_list64_try_unlock_cs_success,
-					(uintptr_t) __futex_list64_try_unlock_cs_end, false);
+		futex_set_vdso_cs_range(fd, 0, vdso, (uintptr_t)VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_success),
+					(uintptr_t)VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_end), false);
 	}
 
-#ifdef CONFIG_COMPAT
+#ifdef CONFIG_COMPAT_VDSO
 	if (abi == VDSO_ABI_AA32) {
 		futex_set_vdso_cs_range(fd, 1, vdso, (uintptr_t) __futex_list32_try_unlock_cs_success,
 					(uintptr_t) __futex_list32_try_unlock_cs_end, true);
 	}
 #endif
-	*/
 }
 #else
 static inline void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm) { }
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 33ce58516580..a17e6eab9d3f 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -116,3 +116,5 @@ VERSION
  * Make the sigreturn code visible to the kernel.
  */
 VDSO_sigtramp		= __kernel_rt_sigreturn;
+VDSO_futex_list64_try_unlock_cs_success = __futex_list64_try_unlock_cs_success;
+VDSO_futex_list64_try_unlock_cs_end = __futex_list64_try_unlock_cs_end;

