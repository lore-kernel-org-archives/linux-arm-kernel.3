Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D8BC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCl0v/SQs8S1/zbZay0y7IOgvIuSt+UtloqYKreQGbc=; b=bBb9RtG6/Z+YK+
	IZbMav5m88v1DPcP/E4IF7do+FFmW/UPLl+TR0RH+ItAUGjQvfYCBUUiu/PMBwMJw7vvAso/woGQj
	C7XxysovWrc9RSs2xuwHrc09CDs5JX5WovtmbEhDeHNcD6V1wX4aMpYFuaKRm4fV2wXuf71F1GkRp
	Wy+8N7WlZfyjQ5PG+fUftKl87+2L26jr2X6iH1fuUIlDef+IPk8ph6+GAJGiQSTdAWA+qSaesUvUc
	idO81g9LkSgTs4FA1Mkpeot36dLBRQxVtVFbOwwe+xw5o6V98etM4Xbzr0gpy3hjPSY5ofxNxvdjF
	Q8yIYHgc7rz0ROz6xttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xd2-00000009SNf-1hrg;
	Tue, 08 Sep 2026 15:20:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xcx-00000009SM7-3JM0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:20:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FCCE1C14;
	Tue,  8 Sep 2026 08:20:47 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E9CF3F7B4;
	Tue,  8 Sep 2026 08:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788880851; bh=akjiP9r6aGZFVaFuTV4xO4inC06yx1CbzVLMerEToh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=juyitk4rXxH7QunLguaLvhOqTlsgRMEYc3j1VnBt5kKETZe5FTe6EfrUQoqJ2T75+
	 FXd2iMiSOzgd6vcnXSOtyskCWPPHmZ6ZFKxbsB5uUVrRvKMjcAhDl5ahacSYuTnm6d
	 9+bNUN96WU/QS+D+2PpicZEDhohlxT1J/w0ZlJDA=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 09/21] arm64: percpu: Factor out percpu offset asm
Date: Tue,  8 Sep 2026 16:17:29 +0100
Message-Id: <20260908151741.394589-10-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_082051_869979_BA88076F 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Depending on whether the kernel runs at EL1 or EL2, the percpu offset is
stored in either TPIDR_EL1 or TPIDR_EL2, and __kern_my_cpu_offset() uses
an ALTERNATIVE() sequence to read the relevant TPIDR_ELx.

In subsequent patches we'll need to read the percpu offset in other
assembly sequences. Factor the ALTERNATIVE sequence out of
__kern_my_cpu_offset() into a new __KERN_ASM_CPU_OFFSET() macro so that
we can share the code sequence.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/percpu.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 8cf4068ce1b56..746d2a56f48bb 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -29,6 +29,11 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 	return read_sysreg(tpidr_el2);
 }
 
+#define __KERN_ASM_CPU_OFFSET(dst)					\
+	ALTERNATIVE("mrs " dst ", tpidr_el1",				\
+		    "mrs " dst ", tpidr_el2",				\
+		       ARM64_HAS_VIRT_HOST_EXTN)
+
 static inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
@@ -37,11 +42,11 @@ static inline unsigned long __kern_my_cpu_offset(void)
 	 * We want to allow caching the value, so avoid using volatile and
 	 * instead use a fake stack read to hazard against barrier().
 	 */
-	asm(ALTERNATIVE("mrs %0, tpidr_el1",
-			"mrs %0, tpidr_el2",
-			ARM64_HAS_VIRT_HOST_EXTN)
-		: "=r" (off) :
-		"Q" (*(const unsigned long *)current_stack_pointer));
+	asm(
+	__KERN_ASM_CPU_OFFSET("%0")
+	: "=r" (off)
+	: "Q" (*(const unsigned long *)current_stack_pointer)
+	);
 
 	return off;
 }
-- 
2.30.2


