Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF56DC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCl0v/SQs8S1/zbZay0y7IOgvIuSt+UtloqYKreQGbc=; b=jIco/g6g3jaeK0
	TCej0TrouyCauvftOuIoBmuOvnxZK5KrkosM9Y7fjp7yh5gLAN+eOkCkQYThjET7QF1woRzkmyuDS
	bBLoGhHAx0VK4EEydiI1s8jwe7uGH7eC8xA5RHLPQvsFM9ORaIgAtQVxO+otf8gc2ppkdGRYdr+OQ
	r1ZKC1V9mlZpKdafaQEC8mj1SCKORAXOjHz1OiST0EiPBsp6UKyPrBlIlYhrMDDhrLjZlCpzh0ONV
	k2YDu+GN+P+cE2SmsZhc/ez4XdOMExFilPAYGXVJKfQqkR+ubz8s/TaqRFuaLraLm/gI/tVEtWJWl
	5feYPnFh72M2VxtgZQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wd5-00000002hGb-1BI9;
	Fri, 04 Sep 2026 16:19:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wd2-00000002hCe-1ndc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:19:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDD46152B;
	Fri,  4 Sep 2026 09:18:45 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 893413F8D6;
	Fri,  4 Sep 2026 09:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788538729; bh=akjiP9r6aGZFVaFuTV4xO4inC06yx1CbzVLMerEToh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IjdEbgOLb1z6qV8YYTmdsm+bm7XWNTXJFFp0fWlsypZJknlxUCCUXWa9ykBtweIl1
	 XcQ+vTcX/ul1/P5HDnUHxsgEU98gdeDDwnBUJHtQ62Tngwss/4Y+v0KKsV9A/YmJE0
	 ug1mFV7/tOysivevkM947WV/GNR89Ch51b0pu7yw=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 09/21] arm64: percpu: Factor out percpu offset asm
Date: Fri,  4 Sep 2026 17:17:46 +0100
Message-Id: <20260904161758.376504-10-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260904161758.376504-1-mark.rutland@arm.com>
References: <20260904161758.376504-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_091900_503655_4A9EE92C 
X-CRM114-Status: GOOD (  11.52  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, will@kernel.org, ardb@kernel.org
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


