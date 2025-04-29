Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EC3C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 07:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b+jfmCatuZPjGs0wANLKVtQCA0kETGrMM5KdFtI0Z4s=; b=yxPc9HHsoeSuxjGqVA+V9AjST7
	RnkkHXyP8wR9nPlfGc1+l8S0mXcaCQ4BV2rvLplY1bsoydA7o+DOhV83KvtwVuqa+WqkP9RH3vmWP
	agbrDtkz8m7t5JwIh7A7CKZW+GcXLK+kkm4TuyUyvOS6z5oRG4xgxVjyeQo+sP216emaZilkc9Kh0
	uJB5LB/a1EndC0yoF3NniZSMXmncKzgptTtAsAVhrOg7YwBIXrsgOZ1+Oju/6N2l7kUmsP73XwG8K
	0hKiAv0DoKuJ/UVe7/aEAwZZEPysSb+zRh9yEoyVCbkcqZycDuB5W0J8kL9gV1NeljC/PChNvCErQ
	S2A1GtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fEl-00000008inZ-1f8H;
	Tue, 29 Apr 2025 07:18:39 +0000
Received: from golan.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fC9-00000008iRz-25WI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 07:16:00 +0000
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 08A8C440F8C;
	Tue, 29 Apr 2025 10:14:45 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1745910885;
	bh=uyx9JVf+TCtl3Vpl+O50TwBtR3gJ32jM7iscDmDXCG4=;
	h=From:To:Cc:Subject:Date:From;
	b=LzuV3ACHKq3iauDWApeZZKlWo+AFs9d82rOzjOJGMBZ8cSLAYn1qatPCYfUGniY4q
	 LfLDi4sOGb55qpoAQ4s6CK9EjtIRElu+RvjdE+BtZPQjp7dYcJSQochm9g+ZedrKVY
	 WaqB+L5exV3+MbiOZNTS0XVAouBq0fFv80rqHjT2UctKbpIbuaG2ICf8dNrDq3YkkS
	 v30BeSHjs7BpUqaFSbczeRQ2Zq7Hf3DW6756HxsmW/U+HjwY5heXKpSXMiNT6WHNbT
	 CQfGthN94W4vbaqYRTJZPk5oYhckZ9lqrGenmH/kJzA9bBbCVyEz3lJ3h5eTb1+UD5
	 GkLEaVF5+quxQ==
From: Baruch Siach <baruch@tkos.co.il>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] arm64/traps: show fault address in exception trace
Date: Tue, 29 Apr 2025 10:15:24 +0300
Message-ID: <2a16075bce75fa68450edb16f5712e265d7cc45a.1745910924.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_001558_007481_0978151F 
X-CRM114-Status: GOOD (  10.33  )
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

The FAR (fault address) register provides useful information when
debugging an unhandled exception.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 arch/arm64/kernel/traps.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 4e26bd356a48..14eb598e33a7 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -239,7 +239,7 @@ void die(const char *str, struct pt_regs *regs, long err)
 		make_task_dead(SIGSEGV);
 }
 
-static void arm64_show_signal(int signo, const char *str)
+static void arm64_show_signal(int signo, const char *str, unsigned long far)
 {
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
@@ -256,6 +256,7 @@ static void arm64_show_signal(int signo, const char *str)
 	pr_info("%s[%d]: unhandled exception: ", tsk->comm, task_pid_nr(tsk));
 	if (esr)
 		pr_cont("%s, ESR 0x%016lx, ", esr_get_class_string(esr), esr);
+	pr_cont("FAR 0x%016lx, ", far);
 
 	pr_cont("%s", str);
 	print_vma_addr(KERN_CONT " in ", regs->pc);
@@ -266,7 +267,7 @@ static void arm64_show_signal(int signo, const char *str)
 void arm64_force_sig_fault(int signo, int code, unsigned long far,
 			   const char *str)
 {
-	arm64_show_signal(signo, str);
+	arm64_show_signal(signo, str, far);
 	if (signo == SIGKILL)
 		force_sig(SIGKILL);
 	else
@@ -275,21 +276,21 @@ void arm64_force_sig_fault(int signo, int code, unsigned long far,
 
 void arm64_force_sig_fault_pkey(unsigned long far, const char *str, int pkey)
 {
-	arm64_show_signal(SIGSEGV, str);
+	arm64_show_signal(SIGSEGV, str, far);
 	force_sig_pkuerr((void __user *)far, pkey);
 }
 
 void arm64_force_sig_mceerr(int code, unsigned long far, short lsb,
 			    const char *str)
 {
-	arm64_show_signal(SIGBUS, str);
+	arm64_show_signal(SIGBUS, str, far);
 	force_sig_mceerr(code, (void __user *)far, lsb);
 }
 
 void arm64_force_sig_ptrace_errno_trap(int errno, unsigned long far,
 				       const char *str)
 {
-	arm64_show_signal(SIGTRAP, str);
+	arm64_show_signal(SIGTRAP, str, far);
 	force_sig_ptrace_errno_trap(errno, (void __user *)far);
 }
 
-- 
2.47.2


