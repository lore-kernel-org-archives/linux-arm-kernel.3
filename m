Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12577C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8T3SbzD1h+RgSp3yBQ/VbQfpUd/mcH1iQ870xzewBhQ=; b=t5dh6JQ6nH6oxkquS3eIvfMSh5
	2KYIIQ+3UOh7lFQNgqnT+8gk95Yc6s90DLcSeSH2CzdpiLp3H/qD/qIchisSYmbi/fs5LwQR97ZeI
	V3v/qmsETzKOA0hcUV5W2CZyzzbyaN4kXChG1/PF2lMMOH8fPo5MgagCPoFWu5YgsnTpYyfgk8F+3
	FLmXhUEBGBYwn/iCBg5krV0Apu2V0dHyzL6e/mF3hwUjjTLf8KJDj0k+kj88iVqYOyiQRXqZheydO
	m4OcIKVlf/3urqiUk+g4kmgj7+mBZ3T7WNArzYNSQfeKggNkBiGzFuvGVHGcKTFu1Zu1eyAQK6DAI
	uTFeq1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5iF-00000008ngO-3iY6;
	Tue, 21 Jul 2026 08:20:27 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5hF-00000008mdv-1Pps
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:19:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8T3SbzD1h+RgSp3yBQ/VbQfpUd/mcH1iQ870xzewBhQ=;
	b=XNnIFRMhLmbS0Tcl8aE6LZenU8BsoDEY6QOkftUcpa7z7s+VnU17Cr98KYYZhKBoc/TeTLBYJ
	cYKb6NhZyrS/KyaTkTf+1CuzVhHPFiRuYJ8JWHgqegmov+ixGsMN1tOUVymJNqorgoOMFcjMbUw
	o+pE6tIVdpI+Hv9ncW4JRq4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4h495y0V3dz12LDF;
	Tue, 21 Jul 2026 16:09:42 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7DFD040537;
	Tue, 21 Jul 2026 16:19:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Jul
 2026 16:19:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <kees@kernel.org>,
	<oleg@redhat.com>, <luto@amacapital.net>, <wad@chromium.org>,
	<thuth@redhat.com>, <peterz@infradead.org>, <mark.rutland@arm.com>,
	<linusw@kernel.org>, <ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <anshuman.khandual@arm.com>, <james.morse@arm.com>,
	<tglx@kernel.org>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v17 15/15] arm64: vdso: Expose sigreturn address on vdso to the kernel
Date: Tue, 21 Jul 2026 16:18:58 +0800
Message-ID: <20260721081858.1169276-16-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721081858.1169276-1-ruanjinjie@huawei.com>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_011926_180328_E5C80E0B 
X-CRM114-Status: GOOD (  11.98  )
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

Syscall User Dispatch (SUD) must not intercept the signal trampoline
code, otherwise returning from a signal with a locked selector may
cause infinite recursion into the signal handler.

Provide an arm64 implementation of arch_syscall_is_vdso_sigreturn()
to exclude these sigreturn syscalls from dispatch.

For native 64-bit tasks, check whether the current PC matches the 'svc #0'
instruction inside the vDSO sigreturn trampoline (defined in
arch/arm64/kernel/vdso/sigreturn.S as below).

	SYM_CODE_START(__kernel_rt_sigreturn)
		mov     x8, #__NR_rt_sigreturn
		svc     #0
	SYM_CODE_END(__kernel_rt_sigreturn)

For COMPAT tasks, verify that the instruction falls within the dedicated
'sigpage' range, since compat signal handlers use this architecture-
specific page (not the vDSO) for their return trampoline. This prevents
SUD from incorrectly dispatching syscalls issued during signal return.

Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
Suggested-by: kemal <kmal@cock.li>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig                 |  1 +
 arch/arm64/include/asm/elf.h       |  1 +
 arch/arm64/kernel/vdso.c           | 16 ++++++++++++++++
 arch/arm64/kernel/vdso/sigreturn.S |  1 +
 arch/arm64/kernel/vdso/vdso.lds.S  |  1 +
 5 files changed, 20 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index aea686dce3d5..a41d2b593899 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -86,6 +86,7 @@ config ARM64
 	select ARCH_SUPPORTS_SCHED_SMT
 	select ARCH_SUPPORTS_SCHED_CLUSTER
 	select ARCH_SUPPORTS_SCHED_MC
+	select ARCH_SUPPORTS_SYSCALL_USER_DISPATCH
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
diff --git a/arch/arm64/include/asm/elf.h b/arch/arm64/include/asm/elf.h
index d2779d604c7b..a8b232c5c6d9 100644
--- a/arch/arm64/include/asm/elf.h
+++ b/arch/arm64/include/asm/elf.h
@@ -293,6 +293,7 @@ static inline int arch_check_elf(void *ehdr, bool has_interp,
 	return 0;
 }
 
+extern bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs);
 #endif /* !__ASSEMBLER__ */
 
 #endif
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 592dd8668de4..37cdc7c72e15 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -343,3 +343,19 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 	return ret;
 }
+
+bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
+{
+	unsigned long landing_pad;
+
+#ifdef CONFIG_COMPAT
+	if (is_compat_task()) {
+		unsigned long sigpage = (unsigned long)current->mm->context.sigpage;
+
+		return regs->pc >= sigpage && regs->pc < (sigpage + PAGE_SIZE);
+	}
+#endif
+	landing_pad = (unsigned long)VDSO_SYMBOL(current->mm->context.vdso, sigreturn_landing_pad);
+
+	return regs->pc == landing_pad;
+}
diff --git a/arch/arm64/kernel/vdso/sigreturn.S b/arch/arm64/kernel/vdso/sigreturn.S
index 0e18729abc3b..8d2d413ff45e 100644
--- a/arch/arm64/kernel/vdso/sigreturn.S
+++ b/arch/arm64/kernel/vdso/sigreturn.S
@@ -73,6 +73,7 @@ SYM_CODE_START(__kernel_rt_sigreturn)
 	mov	x8, #__NR_rt_sigreturn
 //	PLEASE DO NOT MODIFY
 	svc	#0
+	SYM_INNER_LABEL(__sigreturn_landing_pad, SYM_L_GLOBAL)
 //	PLEASE DO NOT MODIFY
 //	.cfi_endproc
 SYM_CODE_END(__kernel_rt_sigreturn)
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 52314be29191..da61d6fc6fe9 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -112,3 +112,4 @@ VERSION
  * Make the sigreturn code visible to the kernel.
  */
 VDSO_sigtramp		= __kernel_rt_sigreturn;
+VDSO_sigreturn_landing_pad	= __sigreturn_landing_pad;
-- 
2.34.1


