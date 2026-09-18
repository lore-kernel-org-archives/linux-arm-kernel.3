Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51941C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfG+kuuPyslNrsAkX7LF5I0fyep8WFQ1NzuAK6CzMzQ=; b=MfAXNcVleTNv5q
	Ts5OOhJCqdDw/U58HEFEzV+Xrs6J+ZOToEixec5MKWKNHVBrdWiLbV/3me6pB5ixESWClcXqu+XT5
	RLuDidHfeLIO/I6ZjEoJgb25SZykSMdV+1qbRFZefNSbF4VwulWkZSCzBauenQW1LHJjEIDQwh3HE
	PkaZiAyJ6u1sRT5qogGYPzVHkX/K5CFL3ptHXOJfczKWjdk1069gXH7xWrDnKLhmStQjYojxN1Jwd
	TmJRKf4XUPXd8vek1cn2MMC7eVm99RIUo68UzN/1WFqBnrTNUVcP1t47FFsMN+gnwNRNQ2wrVQtDh
	Qc/6Ifde/WY/Hbc7TJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bFa-0000000EztQ-10Kb;
	Fri, 18 Sep 2026 16:15:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bF9-0000000EzTm-3Oym
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:15:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3418E602CC;
	Fri, 18 Sep 2026 16:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2ECA1F00898;
	Fri, 18 Sep 2026 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748118;
	bh=kfG+kuuPyslNrsAkX7LF5I0fyep8WFQ1NzuAK6CzMzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g5rqkejVYdUdMoiDminapFdGn8UZKRPghhfEdAHDNIIJh8mQeEPS90eBpC77m7Vl5
	 V5EgImJ3N50lroLBZoIL0lJdlmM6OUeMx6vMGUande27V3lnZd4H3iM+qlwcVwns92
	 5gF6y38Fh2Cj/ALk7KmMjRaQBbHQCz9tMsLnsTt8wTpM0N8GyAwXD1aiRNKzNAJqYy
	 4eVsD95h7xLGCQOzFjXSyyCWtBalX3hC5LKV4AcqW4LAYZVMGZdZICzWjKFKPtrDOm
	 366L3FJ1BPQWP+5zkwN0JP+lMTvDAvbFRYTSamQP0TJ911vcoEZPuwvDiS5H3WRDyV
	 wdoknujOpAGJA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 18/21] arm64: entry: Split up kernel_ventry macro into separate helper macros
Date: Fri, 18 Sep 2026 17:14:02 +0100
Message-ID: <20260918161407.2300-19-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Handling entry from EL0, EL1h and EL1t in the 'kernel_ventry' assembly
macro is getting a bit unwieldy as the control flow becomes increasingly
dependent on the macro arguments.

Split 'kernel_ventry' into three leaf helper macros for EL0, EL1h and
EL1t, which are then dispatched by simple wrappers.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry.S | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index b4df2f23ebe7..38f9327e6a0a 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -36,10 +36,7 @@
 	.endr
 	.endm
 
-	.macro kernel_ventry, el:req, ht:req, regsize:req, label:req
-	.align 7
-.Lventry_start\@:
-	.if	\el == 0
+	.macro kernel_ventry_el0, ht:req, regsize:req, label:req
 	/*
 	 * This must be the first instruction of the EL0 vector entries. It is
 	 * skipped by the trampoline vectors, to trigger the cleanup.
@@ -52,8 +49,10 @@
 	.endif
 .Lskip_tramp_vectors_cleanup\@:
 	sub	sp, sp, #PT_REGS_SIZE
-	.else	/* \el == 1 */
-	.ifc	\ht, h
+	b	el0\ht\()_\regsize\()_\label
+	.endm
+
+	.macro kernel_ventry_el1h, regsize:req, label:req
 	sub	sp, sp, #PT_REGS_SIZE
 
 	/*
@@ -66,13 +65,23 @@
 	tbnz	x0, #THREAD_SHIFT, __bad_stack
 	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
 	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
-	.else	/* EL1t */
+	b	el1h_\regsize\()_\label
+	.endm
+
+	.macro kernel_ventry_el1t, regsize:req, label:req
 	msr	spsel, #0			// Stay on the overflow stack
 	sub	sp, sp, #PT_REGS_SIZE
-	.endif
-	.endif
+	b	el1t_\regsize\()_\label
+	.endm
 
-	b	el\el\ht\()_\regsize\()_\label
+	.macro kernel_ventry, el:req, ht:req, regsize:req, label:req
+	.align 7
+.Lventry_start\@:
+	.if	\el == 0
+	kernel_ventry_el0	\ht, \regsize, \label
+	.else
+	kernel_ventry_el1\ht	\regsize, \label
+	.endif
 .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
 	.endm
 
-- 
2.55.0.1082.g2b9226bbc0-goog


