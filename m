Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A23CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Fr0FIJepkm+ThFHAEs62pg4ABnNj30rVqosHEqcqeg=; b=ChG4JgCpsUNfv0bmGSA7EAaBbt
	4VqwPhl2fpugJytvycla7eTcE3GBeZU2uzxqxkApOkqNUlkqm3yCgKMUao5guiLlkcSDF8SeIdqWs
	xqmARckMbbfPyX0hoeC9uWKQJsVvkR48GbNKFLSHxSjmC/J6Us6WQ46jJYrwFpixMkeFnrm7FbsDH
	lSE7Vb7HVC/yGjfenUS/LV9CXpX0rwn0Y30oWXfyuigWXo6pXK5szHKV20xW6y39r/VNn6NLOjd/2
	YzKOyImARp3viWpbjV44mgUAe7Unpennb41LB0elZwM7snwimOSSVbucmipEl1/jrmU9g3rQV5oz6
	BK0jmVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbQ-00000009aty-2j9W;
	Mon, 03 Nov 2025 10:15:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbM-00000009akk-0xyX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:15:54 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762164947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Fr0FIJepkm+ThFHAEs62pg4ABnNj30rVqosHEqcqeg=;
	b=1IqWaHbVcL8QjkIz4WveM9GyXjMb2CV1dibCwN0zYIXSWaq9K+ZinxC1zznX6OqTrjJ21r
	rgfZOtPOsEiXoAf5R3Rv86vv9oncyLFCsV1mcngw6Or291vRSPVCejapjf90Pvq53R3506
	OcKQZeUglPdzjDl/PhCEDU0u6H5XeMw9vrOYVlvgU3l8T8nhlZxoBz1a7hqgIStIihpXld
	Lko9FSCBmWYMvaLzZeuCp7eVX90LNWoEfsPkXpAIiYwyXM+o1hYawDyMC9LWVkU2ulg/Vv
	lEwaHrzJkHp4Jnx33ryoIe7cSgGn5qj9OfaavNOiLdobcng5S6yCRfvnAWRFqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762164947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Fr0FIJepkm+ThFHAEs62pg4ABnNj30rVqosHEqcqeg=;
	b=Q3t7HbjmjUv/qrWbmiQ8wFN3q3XcnJwjNTICiIXk1s+8rM0TbTKRL7TdDh/dBMht7XGCLX
	2Il85jj0ZIW4IFCg==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 1/5] ARM: mm: fault: Move harden_branch_predictor() before interrupts are enabled
Date: Mon,  3 Nov 2025 11:15:41 +0100
Message-ID: <20251103101545.760243-2-bigeasy@linutronix.de>
In-Reply-To: <20251103101545.760243-1-bigeasy@linutronix.de>
References: <20251103101545.760243-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_021552_419131_6587DC86 
X-CRM114-Status: GOOD (  16.76  )
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


