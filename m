Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC7FFED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrOtzuwVN6RWPW6TTmDUTLQMcqFhVn6oMvqDY03YPaY=; b=zInbptAxQHLbCBeSt6bQDmH20z
	aZQMsBJ/SkcSkmKx0QNOQ/5am1ZaCiaEiLm4pf1jQVM5TpqQMbmNLuqo6Ye3521kNZxXS+fmHS+DN
	xnn0y/s0pjqRnrqaWoQHHXsSK+UUmfsiAQtLwUSMe01qSPcJo+SCARqj1EVQZsiT+df4gB3nWZpR1
	5hXSK/6NsWJoDTMU9QZU1+bxyGK+DReiJ7xSo+/ES65RE5Y1p8LMXE/WCYlpO4ScOQNbjyfzDSUJg
	xRvWv1VduU7n2RO7+ysOQXf3/YKmE3gkncg6aX8G3aN+b75z1RQIPUjDxQqB1V2R5JYb3F6MWJOjM
	ex/4GfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLhZ-0000000Dfdm-1IUE;
	Fri, 24 Apr 2026 18:56:33 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLhW-0000000Dfcf-161h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 18:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HrOtzuwVN6RWPW6TTmDUTLQMcqFhVn6oMvqDY03YPaY=; b=IovrkPcHZ0yhXJG7v17Wc5r3zb
	i84DwmAYbQut4qe7Am4tdaVdSCgwQdEydU0pYXlD7xT4I2tlrVrBrXbmk11LS+Wz7PDp1Pdwclv1O
	2JGOReVskCcsSmoaEi2i2xQSRMdpI9u8xaswtxPG8e8/bPKBJgRAQzCqPXvvXCV8CBkNi0wpjHGof
	zrw7eGxSKUVBJjZi6g+Mq51U4V+M+rTuhH1vcPGOPdRMIO2Z6ftzAjpMhzH7tdPcc32Z1mWwLfK+k
	Li+lfb5/QNB0cZNKG2eqJWMew6/OYCZmcqi0NSxHH7L3hHsC3Zk9FWxw3mk3DAoq/n+Clz9+qejK/
	1mKMtwUg==;
Received: from [187.57.76.96] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wGLhP-001j1m-52; Fri, 24 Apr 2026 20:56:22 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 24 Apr 2026 15:56:00 -0300
Subject: [PATCH RFC v2 1/2] arm64: vdso: Prepare for robust futex unlock
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260424-tonyk-robust_arm-v2-1-db4e46f752cf@igalia.com>
References: <20260424-tonyk-robust_arm-v2-0-db4e46f752cf@igalia.com>
In-Reply-To: <20260424-tonyk-robust_arm-v2-0-db4e46f752cf@igalia.com>
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
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_115630_302077_E3A235A4 
X-CRM114-Status: GOOD (  15.38  )
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
Changes from v1:
 - Fixed linker not finding VDSO symbols
---
 arch/arm64/kernel/vdso.c          | 30 ++++++++++++++++++++++++++++++
 arch/arm64/kernel/vdso/vdso.lds.S |  7 +++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 592dd8668de4..f9c520a1c942 100644
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
@@ -57,6 +58,33 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
 #endif /* CONFIG_COMPAT_VDSO */
 };
 
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+static void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm)
+{
+	unsigned long vdso = (unsigned long) mm->context.vdso;
+	struct futex_mm_data *fd = &mm->futex;
+	uintptr_t success, end;
+
+	if (abi == VDSO_ABI_AA64) {
+		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_success);
+		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_end);
+
+		futex_set_vdso_cs_range(fd, 0, vdso, success, end, false);
+	}
+
+#ifdef CONFIG_COMPAT_VDSO
+	if (abi == VDSO_ABI_AA32) {
+		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_success);
+		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_end);
+
+		futex_set_vdso_cs_range(fd, 1, vdso, success, end, true);
+	}
+#endif
+}
+#else
+static inline void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm) { }
+#endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
+
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		struct vm_area_struct *new_vma)
 {
@@ -134,6 +162,8 @@ static int __setup_additional_pages(enum vdso_abi abi,
 	if (IS_ERR(ret))
 		goto up_fail;
 
+	vdso_futex_robust_unlock_update_ips(abi, mm);
+
 	return 0;
 
 up_fail:
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 52314be29191..c532dae6ac8e 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -112,3 +112,10 @@ VERSION
  * Make the sigreturn code visible to the kernel.
  */
 VDSO_sigtramp		= __kernel_rt_sigreturn;
+
+VDSO_futex_list64_try_unlock_cs_success = __futex_list64_try_unlock_cs_success;
+VDSO_futex_list64_try_unlock_cs_end = __futex_list64_try_unlock_cs_end;
+#ifdef CONFIG_COMPAT_VDSO
+VDSO_futex_list32_try_unlock_cs_success = __futex_list32_try_unlock_cs_success;
+VDSO_futex_list32_try_unlock_cs_end = __futex_list32_try_unlock_cs_end;
+#endif

-- 
2.53.0


