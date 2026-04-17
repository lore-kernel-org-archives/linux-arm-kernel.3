Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02232F436B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27eU/J0Zc/hAfFBGC44jb/O35+RxI2J909Uggxl8/vg=; b=V4mc1Fm8ozsYug7uxrCEfKqSBC
	+TNxkwHBY3Pxaa6uLWi+UIGYUFJp7DeDj2ft+x8di0YEXzUGYgHrW3wZVkpupygfD2X3ZzQ7+7EhO
	fd7B/jguHIUtKni+xRRiBjaYNQcfOTRAk6Pbt/cexAKfyt2WJvx2TEL+j0hT0F+xRJntqSnZb/MQS
	ynqoC6Ux51O0XzHjMnnGVGgcy7tWdOjhmSBA3tL5jjBijQmviawftl0kvhvRVxhBE2O1jzQ5iaEoN
	KlO06FVGqB1uU5MG8AnXZF2ZTl2/Fh9gVQFK9Aeeb34vVaUY6txPvvwDrNkM71kPA6FE3KTf+IItO
	ezKiz7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkdZ-000000049my-1EPI;
	Fri, 17 Apr 2026 14:57:41 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkdX-000000049ln-0Dyk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 14:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=27eU/J0Zc/hAfFBGC44jb/O35+RxI2J909Uggxl8/vg=; b=mzMy48QVGDIVFYGyu7BE9uQKxQ
	hXAx6ka7Jy+yD96rfP+cZqCaE6kQPSa+DdZJP6Q3MQpkwIJOuqSSNb6LAAaxXZAHCPdebEcpzngvf
	uZrdvuSOUB6llYq77QwXOSu4zylE2OS9OMkB7C7U6kxCLHp5uAD0koERRvZG0XQTxE03cBIs6lXH9
	pMfYyEGkCsZDA9IbHXB2Z3kanJOwM2J4/sA1i+IMs0WF7p1GZMZizstGD1PFXrXFACYjsNqmKM4so
	L7VxytNBzUI4mUP+ktR7XZnYYeYXbpnVlffTFuRxZbV9W9kO5dkWyFKIbXVJ0lK4T3l11czz4ALlQ
	dIAyuxaw==;
Received: from [187.57.76.127] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wDkcy-00HVwL-Ec; Fri, 17 Apr 2026 16:57:04 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 17 Apr 2026 11:56:10 -0300
Subject: [PATCH RFC 1/2] arm64: vdso: Prepare for robust futex unlock
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260417-tonyk-robust_arm-v1-1-03aa64e2ff1a@igalia.com>
References: <20260417-tonyk-robust_arm-v1-0-03aa64e2ff1a@igalia.com>
In-Reply-To: <20260417-tonyk-robust_arm-v1-0-03aa64e2ff1a@igalia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>, 
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>, 
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 Arnd Bergmann <arnd@arndb.de>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uros Bizjak <ubizjak@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_075739_426573_9F3CFF51 
X-CRM114-Status: GOOD (  16.68  )
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

There will be a VDSO function to unlock non-contended robust futexes in
user space. The unlock sequence is racy vs. clearing the list_pending_op
pointer in the task's robust list head. To plug this race the kernel needs
to know the critical section window so it can clear the pointer when the
task is interrupted within that race window. The window is determined by
labels in the inline assembly.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
RFC: Those symbols can't be found by the linker after patch 2/2, it fails with:

ld: arch/arm64/kernel/vdso.o: in function `vdso_futex_robust_unlock_update_ips':
arch/arm64/kernel/vdso.c:72:(.text+0x200): undefined reference to `__futex_list64_try_unlock_cs_success'
ld: arch/arm64/kernel/vdso.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__futex_list64_try_unlock_cs_success' which may bind externally can not be used when making a shared object; recompile with -fPIC
arch/arm64/kernel/vdso.c:72:(.text+0x200): dangerous relocation: unsupported relocation
---
 arch/arm64/include/asm/vdso.h |  4 ++++
 arch/arm64/kernel/vdso.c      | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/include/asm/vdso.h b/arch/arm64/include/asm/vdso.h
index 232b46969088..182fde1df3dd 100644
--- a/arch/arm64/include/asm/vdso.h
+++ b/arch/arm64/include/asm/vdso.h
@@ -18,6 +18,10 @@
 
 extern char vdso_start[], vdso_end[];
 extern char vdso32_start[], vdso32_end[];
+extern char __futex_list64_try_unlock_cs_success[], __futex_list64_try_unlock_cs_end[];
+#ifdef CONFIG_COMPAT
+extern char __futex_list32_try_unlock_cs_success[], __futex_list32_try_unlock_cs_end[];
+#endif
 
 #endif /* !__ASSEMBLER__ */
 
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 592dd8668de4..42a82e73a774 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -11,6 +11,7 @@
 #include <linux/clocksource.h>
 #include <linux/elf.h>
 #include <linux/err.h>
+#include <linux/futex.h>
 #include <linux/errno.h>
 #include <linux/gfp.h>
 #include <linux/kernel.h>
@@ -57,6 +58,32 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
 #endif /* CONFIG_COMPAT_VDSO */
 };
 
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+static void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm)
+{
+	unsigned long vdso = (unsigned long) mm->context.vdso;
+	struct futex_mm_data *fd = &mm->futex;
+
+	/*
+	 * RFC: won't compile due to undefined reference to `__futex_list64_try_unlock_cs_...`
+
+	if (abi == VDSO_ABI_AA64) {
+		futex_set_vdso_cs_range(fd, 0, vdso, (uintptr_t) __futex_list64_try_unlock_cs_success,
+					(uintptr_t) __futex_list64_try_unlock_cs_end, false);
+	}
+
+#ifdef CONFIG_COMPAT
+	if (abi == VDSO_ABI_AA32) {
+		futex_set_vdso_cs_range(fd, 1, vdso, (uintptr_t) __futex_list32_try_unlock_cs_success,
+					(uintptr_t) __futex_list32_try_unlock_cs_end, true);
+	}
+#endif
+	*/
+}
+#else
+static inline void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm) { }
+#endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
+
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		struct vm_area_struct *new_vma)
 {
@@ -134,6 +161,8 @@ static int __setup_additional_pages(enum vdso_abi abi,
 	if (IS_ERR(ret))
 		goto up_fail;
 
+	vdso_futex_robust_unlock_update_ips(abi, mm);
+
 	return 0;
 
 up_fail:

-- 
2.53.0


