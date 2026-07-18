Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A846C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 19:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uGi/dAnT42Y/IdcWpc+2iKl0ZKD5ISQO2gm0GJ6Um5Y=; b=aGiaGS4BwlS0d7
	Ci0eosy50fiXOncmse7lUb4Q7cTxVb+RktjMB7gk9gBXk3RDcQuFvIeURVmd9xNtw7tSJWZuevgMM
	bCLJGooB+gZrO/rOGsG28FLvltOMNIFjIuZUXMCFNrljA99QY01F8Uc5HulwpYP58n/sRIsi7/zYO
	gEDf12+VdKVUfa1YBjh3ruSby+LFx9Ea/biCVxTzFJaZBo9i4dEni1871MZV4CRf7gFt50yH6GIpZ
	zxwhSP9+typt/s8dxnz2/8lravUKkTdR6HN+kKf5DvGCp3bzd83d1oOeD45+8IVrz5IMInU+Zwp+S
	Y3knW7XvRPJNdyfChDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlAIg-00000004T0f-1myy;
	Sat, 18 Jul 2026 19:02:14 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlAIb-00000004SzE-30wp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 19:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1784400888;
	bh=uGi/dAnT42Y/IdcWpc+2iKl0ZKD5ISQO2gm0GJ6Um5Y=;
	h=From:To:Cc:Subject:Date:From;
	b=SIMJ5TXsYdMQhemYBUGlsLAyrB1EsjE7UdsbxU+YtufYJ7qGfoOOAlc718w8H95oF
	 UQnx1BwXb56u75YJxnCZyQxypBzojWZpp25ttn6JiPHiOWsd+f9sZFhgHRMd2vfERD
	 zvkCfqMtPLUfl9G3gDC0i/AFqsW8BvC0J/zR5+8s=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4h2bYh2XGLz10yH;
	Sat, 18 Jul 2026 18:54:48 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4h2bYg5q7cz10yF;
	Sat, 18 Jul 2026 18:54:47 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: entry: dedup SDEI event priority selection
Date: Sat, 18 Jul 2026 18:54:47 +0000
Message-ID: <20260718185447.25706-1-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_120210_402212_254D5D6E 
X-CRM114-Status: GOOD (  12.97  )
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
Cc: kees@kernel.org, Bradley Morgan <include@grrlz.net>, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

__sdei_asm_handler open codes the same branch ladder four times to pick
the normal or critical variant of a per CPU variable based on the SDEI
event priority: when recording the active event, when selecting the
SDEI stack, when selecting the shadow call stack, and when clearing the
active-event record on exit.

Add a sdei_choose macro, using \@ local labels like the files existing
macros, and replace the four open coded copies with it. This also drops
the repeated reuse of the 1:/2:/3:/4: numeric labels in this handler.

No functional change intended.

Signed-off-by: Bradley Morgan <include@grrlz.net>
---
 arch/arm64/kernel/entry.S | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index e0db14e9c843..29ef4a0d28a8 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -916,6 +916,15 @@ NOKPROBE(call_on_irq_stack)
 	b	.
 .endm
 
+/* Set \dst using \op and the \normal or \critical sym, based on \prio */
+.macro sdei_choose op:req, dst:req, prio:req, normal:req, critical:req, tmp:req
+	cbnz	\prio, .Lcritical\@
+	\op dst=\dst, sym=\normal, tmp=\tmp
+	b	.Ldone\@
+.Lcritical\@:	\op dst=\dst, sym=\critical, tmp=\tmp
+.Ldone\@:
+.endm
+
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
 /*
  * The regular SDEI entry point may have been unmapped along with the rest of
@@ -997,32 +1006,24 @@ SYM_CODE_START(__sdei_asm_handler)
 
 	/* Store the registered-event for crash_smp_send_stop() */
 	ldrb	w4, [x19, #SDEI_EVENT_PRIORITY]
-	cbnz	w4, 1f
-	adr_this_cpu dst=x5, sym=sdei_active_normal_event, tmp=x6
-	b	2f
-1:	adr_this_cpu dst=x5, sym=sdei_active_critical_event, tmp=x6
-2:	str	x19, [x5]
+	sdei_choose adr_this_cpu, x5, w4, sdei_active_normal_event, \
+		    sdei_active_critical_event, x6
+	str	x19, [x5]
 
 	/*
 	 * entry.S may have been using sp as a scratch register, find whether
 	 * this is a normal or critical event and switch to the appropriate
 	 * stack for this CPU.
 	 */
-	cbnz	w4, 1f
-	ldr_this_cpu dst=x5, sym=sdei_stack_normal_ptr, tmp=x6
-	b	2f
-1:	ldr_this_cpu dst=x5, sym=sdei_stack_critical_ptr, tmp=x6
-2:	mov	x6, #SDEI_STACK_SIZE
+	sdei_choose ldr_this_cpu, x5, w4, sdei_stack_normal_ptr, sdei_stack_critical_ptr, x6
+	mov	x6, #SDEI_STACK_SIZE
 	add	x5, x5, x6
 	mov	sp, x5
 
 #ifdef CONFIG_SHADOW_CALL_STACK
 	/* Use a separate shadow call stack for normal and critical events */
-	cbnz	w4, 3f
-	ldr_this_cpu dst=scs_sp, sym=sdei_shadow_call_stack_normal_ptr, tmp=x6
-	b	4f
-3:	ldr_this_cpu dst=scs_sp, sym=sdei_shadow_call_stack_critical_ptr, tmp=x6
-4:
+	sdei_choose ldr_this_cpu, scs_sp, w4, sdei_shadow_call_stack_normal_ptr, \
+		    sdei_shadow_call_stack_critical_ptr, x6
 #endif
 
 	/*
@@ -1068,11 +1069,9 @@ SYM_CODE_START(__sdei_asm_handler)
 
 	/* Clear the registered-event seen by crash_smp_send_stop() */
 	ldrb	w3, [x4, #SDEI_EVENT_PRIORITY]
-	cbnz	w3, 1f
-	adr_this_cpu dst=x5, sym=sdei_active_normal_event, tmp=x6
-	b	2f
-1:	adr_this_cpu dst=x5, sym=sdei_active_critical_event, tmp=x6
-2:	str	xzr, [x5]
+	sdei_choose adr_this_cpu, x5, w3, sdei_active_normal_event, \
+		    sdei_active_critical_event, x6
+	str	xzr, [x5]
 
 alternative_if_not ARM64_UNMAP_KERNEL_AT_EL0
 	sdei_handler_exit exit_mode=x2
-- 
2.53.0


