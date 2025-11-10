Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249ACCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynPbA00EHBUjDvPWf7RgfREeAWmSK7c/wyN3Y0W7m1A=; b=BwGk+ahZbAhM0Ti1t+Th1IHRf/
	kZs1ukyOp2eSs5s0Hg460V5xr7eiUOl4IPXVRXDk0tDAPyyq3GFOyLRxAaqSlcFpcRvKB/annIFmj
	pQ2xxnwaXhOHF4WMz34D1c6wLsBrZxt/ryS+rGrzTr086uWOaIde+/AczS4kgYyapOSLD6DnjcCbh
	9TmHk1GZ9jVllhq3Bh37VKamWV3v8IwPgKrE0yHuJgs2n4bEdLmMNp/v0gk05fs6cbxBRCLl+nkOL
	2QN6Lj8SzxElaKP96kXC5KpP4AB4wl3l6qYIOXZxSkFuYJc8VcGbkkQvqMrRNk+DZUqoqbpz+OGMM
	ZWzwX5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJi-00000005dLU-47Hj;
	Mon, 10 Nov 2025 14:56:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJg-00000005dJx-26lL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:56:26 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762786580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ynPbA00EHBUjDvPWf7RgfREeAWmSK7c/wyN3Y0W7m1A=;
	b=39hbm44wS0rb4FCBQ3nPVwxyFC/HgpKTY/WGxCL3GtQm0YmCDRmjPNxcB1SX+JK/gTErxV
	prMB8xEGxTfnkaUHpnmba39hNhnqbPLdcbgrCpKrtnhrFeWyGVUF5/ZhlZkv/bXT8eVXQQ
	Fu5Dlxde9CjXjIjMwAK1lAJxJ/KHNI5Sgn0jRQ00WRGED8SRkE7gMh6ammR4hfmIScif7k
	7wWQUYsgcT+lLXsawFUWjv/TGmevjWQlzLPFQbBUwAgsrP52Ol2twF5HrYKAWD4ec7RuXJ
	Td0TWRbBjdGgnJHZAUwFF+/WMhtORA6efvtpdS6pwqqkE+k1Q7GJY8HLiR4CIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762786580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ynPbA00EHBUjDvPWf7RgfREeAWmSK7c/wyN3Y0W7m1A=;
	b=62yaiWmndfz0hWiAHf7jnUvbO2g0Q1DDSRtQXrSbCI8VXNQaN6GTl00/QreaPAm+XQFVok
	egnyScVmqbnpipBw==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v3 1/5] ARM: mm: fault: Move harden_branch_predictor() before interrupts are enabled
Date: Mon, 10 Nov 2025 15:55:51 +0100
Message-ID: <20251110145555.2555055-2-bigeasy@linutronix.de>
In-Reply-To: <20251110145555.2555055-1-bigeasy@linutronix.de>
References: <20251110145555.2555055-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_065624_679337_E5EAB201 
X-CRM114-Status: GOOD (  17.87  )
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

In the LPAE case, interrupts are enabled early in do_page_fault(). If
the user attempts to access a pointer > TASK_SIZE then is invoked
harden_branch_predictor(). The function will complain that CPU migration
is enabled due to its smp_processor_id() usage.

The intention is invoke harden_branch_predictor() on the CPU which
triggered the page fault. It is only invoked for user access of pointer
> TASK_SIZE. This always generate a fault for the user because this area
is restricted to the kernel.

Move the invocation of harden_branch_predictor() up in the call chain to
the two callers do_bad_area() and do_page_fault().
Invoke it if the user accesses the >=3D TASK_SIZE area.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/mm/fault.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 2bc828a1940c0..5d28c28e877c1 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -183,9 +183,6 @@ __do_user_fault(unsigned long addr, unsigned int fsr, u=
nsigned int sig,
 {
 	struct task_struct *tsk =3D current;
=20
-	if (addr > TASK_SIZE)
-		harden_branch_predictor();
-
 #ifdef CONFIG_DEBUG_USER
 	if (((user_debug & UDBG_SEGV) && (sig =3D=3D SIGSEGV)) ||
 	    ((user_debug & UDBG_BUS)  && (sig =3D=3D SIGBUS))) {
@@ -218,10 +215,13 @@ void do_bad_area(unsigned long addr, unsigned int fsr=
, struct pt_regs *regs)
 	 * If we are in kernel mode at this point, we
 	 * have no context to handle this fault with.
 	 */
-	if (user_mode(regs))
+	if (user_mode(regs)) {
+		if (addr >=3D TASK_SIZE)
+			harden_branch_predictor();
 		__do_user_fault(addr, fsr, SIGSEGV, SEGV_MAPERR, regs);
-	else
+	} else {
 		__do_kernel_fault(mm, addr, fsr, regs);
+	}
 }
=20
 #ifdef CONFIG_MMU
@@ -274,8 +274,11 @@ do_page_fault(unsigned long addr, unsigned int fsr, st=
ruct pt_regs *regs)
=20
=20
 	/* Enable interrupts if they were enabled in the parent context. */
-	if (interrupts_enabled(regs))
+	if (interrupts_enabled(regs)) {
+		if (user_mode(regs) && addr >=3D TASK_SIZE)
+			harden_branch_predictor();
 		local_irq_enable();
+	}
=20
 	/*
 	 * If we're in an interrupt or have no user
--=20
2.51.0


