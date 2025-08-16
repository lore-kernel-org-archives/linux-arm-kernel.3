Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EE2CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcscL70uZTlUf/b3JAg8jASBXLUJWGySI2TLcEAaAvw=; b=gXSaYrCEqzEr3OfZCc6vKXT/KB
	Fa7M2U+zh0XjMt65DOHN30/SiGJuDetuXQLrE3OqHPNNdHg7l6712FbdWjBOTLtFubThNxtGeGBAn
	BNaQzEuGFvmU2LYoTWiMRMQWR8DVKfU4ZbnX5/Ek1HEUzeEEaMteKEGR+B6TqcO6PXf6JaO3Nebut
	UJztLXFx7mg5woxb3sR0qpdGCwVOTRZsQZeVjxfS8akGK7Lt7u8IMpAihKgdg4E5PQZVk7MaRCw9k
	bJBE9UzJGrNo0F2SJcRn9qyhAV+2pz7edP6RekMDAT4ULQzahamx2Glphk3MyEWfRidqpKrjxxQ7F
	g0iL1eIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unJDV-00000004rwB-1gls;
	Sat, 16 Aug 2025 15:53:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unIh9-00000004pJv-30In
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 15:19:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 014491691;
	Sat, 16 Aug 2025 08:19:39 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED2793F5A1;
	Sat, 16 Aug 2025 08:19:44 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	james.morse@arm.com,
	ardb@kernel.org,
	scott@os.amperecomputing.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v7 RESEND 5/6] arm64: futex: small optimisation for __llsc_futex_atomic_set()
Date: Sat, 16 Aug 2025 16:19:28 +0100
Message-Id: <20250816151929.197589-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250816151929.197589-1-yeoreum.yun@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_081947_798043_49040851 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

__llsc_futex_atomic_set() is implmented using
LLSC_FUTEX_ATOMIC_OP() macro with "mov  %w3, %w5".
But this instruction isn't required to implement fux_atomic_set()
so make a small optimisation by implementing __llsc_futex_atomic_set()
as separate function.

This will make usage of LLSC_FUTEX_ATOMIC_OP() macro more simple.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/futex.h | 43 ++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index ab7003cb4724..22a6301a9f3d 100644
--- a/arch/arm64/include/asm/futex.h
+++ b/arch/arm64/include/asm/futex.h
@@ -13,7 +13,7 @@

 #define LLSC_MAX_LOOPS	128 /* What's the largest number you can think of? */

-#define LLSC_FUTEX_ATOMIC_OP(op, insn)					\
+#define LLSC_FUTEX_ATOMIC_OP(op, asm_op)				\
 static __always_inline int						\
 __llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
 {									\
@@ -24,7 +24,7 @@ __llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
 	asm volatile("// __llsc_futex_atomic_" #op "\n"			\
 "	prfm	pstl1strm, %2\n"					\
 "1:	ldxr	%w1, %2\n"						\
-	insn "\n"							\
+"	" #asm_op "	%w3, %w1, %w5\n"				\
 "2:	stlxr	%w0, %w3, %2\n"						\
 "	cbz	%w0, 3f\n"						\
 "	sub	%w4, %w4, %w0\n"					\
@@ -46,11 +46,40 @@ __llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
 	return ret;							\
 }

-LLSC_FUTEX_ATOMIC_OP(add, "add	%w3, %w1, %w5")
-LLSC_FUTEX_ATOMIC_OP(or, "orr	%w3, %w1, %w5")
-LLSC_FUTEX_ATOMIC_OP(and, "and	%w3, %w1, %w5")
-LLSC_FUTEX_ATOMIC_OP(eor, "eor	%w3, %w1, %w5")
-LLSC_FUTEX_ATOMIC_OP(set, "mov	%w3, %w5")
+LLSC_FUTEX_ATOMIC_OP(add, add)
+LLSC_FUTEX_ATOMIC_OP(or, orr)
+LLSC_FUTEX_ATOMIC_OP(and, and)
+LLSC_FUTEX_ATOMIC_OP(eor, eor)
+
+static __always_inline int
+__llsc_futex_atomic_set(int oparg, u32 __user *uaddr, int *oval)
+{
+	unsigned int loops = LLSC_MAX_LOOPS;
+	int ret, oldval;
+
+	uaccess_enable_privileged();
+	asm volatile("//__llsc_futex_xchg\n"
+"	prfm	pstl1strm, %2\n"
+"1:	ldxr	%w1, %2\n"
+"2:	stlxr	%w0, %w4, %2\n"
+"	cbz	%w3, 3f\n"
+"	sub	%w3, %w3, %w0\n"
+"	cbnz	%w3, 1b\n"
+"	mov	%w0, %w5\n"
+"3:\n"
+"	dmb	ish\n"
+	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)
+	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w0)
+	: "=&r" (ret), "=&r" (oldval), "+Q" (*uaddr), "+r" (loops)
+	: "r" (oparg), "Ir" (-EAGAIN)
+	: "memory");
+	uaccess_disable_privileged();
+
+	if (!ret)
+		*oval = oldval;
+
+	return ret;
+}

 static __always_inline int
 __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


