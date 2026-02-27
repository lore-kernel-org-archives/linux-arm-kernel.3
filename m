Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00863FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCfQxddkyDwE/ZVIAKmmYVcFHnwdOp0PPR0xfQ+Nrn4=; b=gAPwJkt9eZWEDf15RjQIU2XU+5
	3jZKaWAWUXp77bJX0w6Sl097c/1BJzIZSfvpmAohlZO0KWTpWIbDKg/Znf5nSCVuWuwQp1vviHdEk
	rYP0DMsJ9iCu/7CgtPENVuKfjZ25NJ9Cc6pL3fATv0AQ/pe8UQP0ExYZPLSwJu1Iz5gT3jEmNa6DT
	7LtrzhDHUgN0BAcnQjWewlRirepbl3GpY1qY0THjHE+vwugcW57MLqzd3dNZNdFnQxCnvTZkSmmwN
	pDd+VojdjTOjZWfOZxwfgoz+aVpnh6SUYXWao3R2jF0mxHapgc66w+J0+EJ1Scsol5M0gJMZbRZSZ
	TRee4Fwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcc-00000008aqi-2mKS;
	Fri, 27 Feb 2026 15:19:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcc-00000008aq8-0IeS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=yCfQxddkyDwE/ZVIAKmmYVcFHnwdOp0PPR0xfQ+Nrn4=; b=ZNtHa95LBgHzpB9G8ZAF0cah6u
	UkReIgbeROYI7NCKuLN0Eco0MjEep9KFQCIf6wsQqq3t68G8nyE4Qj0h4LsxSDodQjSiu5bgfKZK8
	N7MivoPX0p2FgrMZYxmijP35RHKAD+8PKHNmGTJI4W9t2fmLKkV81pJU82ypKT5aX+rlvK1yZopaC
	74rTULkicz2R2SnKQbEEXjamqE9fL1/r2Gwi1TgGcZ9uN+B4LtaoG+UTHet9T4+//5bI/5/Rl3AFe
	BFYc56wRXvHqU0wiIlynGfWdpXgqnTOrcD+Ae/hk0kVQCQ/lMUWtK6nkOtIcYSjVZe5zuQ038O8Ga
	qpwXXGVQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcY-0000000DL60-3ZhD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yCfQxddkyDwE/ZVIAKmmYVcFHnwdOp0PPR0xfQ+Nrn4=; b=WQCDPmEvC8TF/7AdOjv8/t2Nzf
	CiIsqCkRC6N7ia/xF4vLs0eEKQGTZ1QUL9645Ec9A9uYj+isHuk+wGVbN9JqMgtOv/YDeAAHsEauc
	dDtzzzZbOcDkOddAnnFSAutU3k5/EAAAAzg4bz+IJacG/1dvgbb21Wka3oo23yjOO047HuGZ5TbE5
	FqULwabtYk1hyPAMKo+BFexIiaOr+LxA32MzaEToOfAnBZIjPmps0RYM6ds/VCGYt9Tftss6OzuKW
	7CFp8o8Fbb0qmVNy4ubhgcEEjkv/lAzzw7dRovqoGK0oVFUjLv/2kp+O6LDubdyshnXtVdtT9FUCF
	U5PUfkiA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52946 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvzcT-000000000xs-0X4G;
	Fri, 27 Feb 2026 15:19:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvzcS-0000000Awnu-1u0H;
	Fri, 27 Feb 2026 15:19:08 +0000
In-Reply-To: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: linux-arm-kernel@lists.infradead.org
Cc: Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 1/6] ARM: ensure interrupts are enabled in __do_user_fault()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvzcS-0000000Awnu-1u0H@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 15:19:08 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_151915_099973_D0EC187C 
X-CRM114-Status: GOOD (  13.60  )
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

__do_user_fault() may be called from fault handling paths where the
interrupts are enabled or disabled. E.g. do_page_fault() calls this
with interrupts enabled, whereas do_sect_fault()->do_bad_area()
will call this with interrupts disabled. Since this is a userspace
fault, we know that interrupts were enabled in the parent context,
so call local_irq_enable() here to give a consistent interrupt state.

This is necessary for force_sig_info() when PREEMPT_RT is enabled.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm/mm/fault.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ed4330cc3f4e..6c27ebd49093 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -190,7 +190,8 @@ __do_kernel_fault(struct mm_struct *mm, unsigned long addr, unsigned int fsr,
 
 /*
  * Something tried to access memory that isn't in our memory map..
- * User mode accesses just cause a SIGSEGV
+ * User mode accesses just cause a SIGSEGV. Ensure interrupts are enabled
+ * for preempt RT.
  */
 static void
 __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
@@ -198,6 +199,8 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 {
 	struct task_struct *tsk = current;
 
+	local_irq_enable();
+
 #ifdef CONFIG_DEBUG_USER
 	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
 	    ((user_debug & UDBG_BUS)  && (sig == SIGBUS))) {
@@ -268,6 +271,7 @@ do_kernel_address_page_fault(struct mm_struct *mm, unsigned long addr,
 		 * should not be faulting in kernel space, which includes the
 		 * vector/khelper page. Handle the branch predictor hardening
 		 * while interrupts are still disabled, then send a SIGSEGV.
+		 * Note that __do_user_fault() will enable interrupts.
 		 */
 		harden_branch_predictor();
 		__do_user_fault(addr, fsr, SIGSEGV, SEGV_MAPERR, regs);
-- 
2.47.3


