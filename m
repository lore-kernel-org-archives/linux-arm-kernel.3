Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60521C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pn/rhA/IYEX24VjX/Og1WVaxaSwymWZIsjxakcricag=; b=yxaJVrXsmPgIcTNcEkc+SOo5Wg
	9LaZOxUm1yuiPvjeFAU8QGqjCzR/dtAfaBaErBszQ+KTXSyCAqw9aV2F2/e4kVkMmnKuyz/ZANEiq
	ugJQQpNl1VOp82PY9s4CMx/xGHc+y33zgkatgyxG69G2SuQ/PZItIn3I4zw3zk2tqn1UmlIv7Pz1K
	GODnAtxK0vH/1gjUWATFnlW4Z5bv4zxm3C/H//hpe+AwSPGet9/3Xdd7DpmvVDBeZP1CO+Grjb5ba
	Y+r9QBnNuIVUs1TCLM9tgSpwGDlON91dLF3mFVHO4s1V51HZKAt4ZkRQ++YJvUDvG7sdxUHVRjUXm
	v82BedTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRbNv-00000008BPv-1fdQ;
	Tue, 17 Jun 2025 18:50:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRbAv-000000089e2-2uDb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 18:36:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF3D1688;
	Tue, 17 Jun 2025 11:36:28 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 518FE3F58B;
	Tue, 17 Jun 2025 11:36:47 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	ardb@kernel.org,
	frederic@kernel.org,
	james.morse@arm.com,
	joey.gouly@arm.com,
	scott@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 5/7] arm64/futex: add futex atomic operation with FEAT_LSUI
Date: Tue, 17 Jun 2025 19:36:33 +0100
Message-Id: <20250617183635.1266015-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617183635.1266015-1-yeoreum.yun@arm.com>
References: <20250617183635.1266015-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_113649_824040_87473C98 
X-CRM114-Status: GOOD (  14.62  )
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

Current futex atomic operations are implemented with ll/sc instructions and
clearing PSTATE.PAN.

Since Armv9.6, FEAT_LSUI supplies not only load/store instructions but
also atomic operation for user memory access in kernel it doesn't need
to clear PSTATE.PAN bit anymore.

With theses instructions some of futex atomic operations don't need to
be implmented with ldxr/stlxr pair instead can be implmented with
one atomic operation supplied by FEAT_LSUI.

However, some of futex atomic operations still need to use ll/sc way
via ldtxr/stltxr supplied by FEAT_LSUI since there is no correspondant
atomic instruction or doesn't support word size operation
(i.e) eor, cas{mb}t But It's good to work without clearing PSTATE.PAN bit.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/futex_lsui.h | 132 ++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 arch/arm64/include/asm/futex_lsui.h

diff --git a/arch/arm64/include/asm/futex_lsui.h b/arch/arm64/include/asm/futex_lsui.h
new file mode 100644
index 000000000000..0dc7dca91cdb
--- /dev/null
+++ b/arch/arm64/include/asm/futex_lsui.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Arm Ltd.
+ */
+
+#ifndef __ASM_FUTEX_LSUI_H
+#define __ASM_FUTEX_LSUI_H
+
+#include <linux/uaccess.h>
+#include <linux/stringify.h>
+
+#define FUTEX_ATOMIC_OP(op, asm_op, mb)					\
+static __always_inline int						\
+__lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
+{									\
+	int ret = 0;							\
+	int val;							\
+									\
+	mte_enable_tco();						\
+	uaccess_ttbr0_enable();						\
+									\
+	asm volatile("// __lsui_futex_atomic_" #op "\n"			\
+	__LSUI_PREAMBLE							\
+	"1:	" #asm_op #mb "	%w3, %w2, %1\n"				\
+	"2:\n"								\
+	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)				\
+	: "+r" (ret), "+Q" (*uaddr), "=r" (val)				\
+	: "r" (oparg)							\
+	: "memory");							\
+									\
+	mte_disable_tco();						\
+	uaccess_ttbr0_disable();					\
+									\
+	if (!ret)							\
+		*oval = val;						\
+									\
+	return ret;							\
+}
+
+FUTEX_ATOMIC_OP(add, ldtadd, al)
+FUTEX_ATOMIC_OP(or, ldtset, al)
+FUTEX_ATOMIC_OP(andnot, ldtclr, al)
+FUTEX_ATOMIC_OP(set, swpt, al)
+
+#undef FUTEX_ATOMIC_OP
+
+static __always_inline int
+__lsui_futex_atomic_and(int oparg, u32 __user *uaddr, int *oval)
+{
+	return __lsui_futex_atomic_andnot(~oparg, uaddr, oval);
+}
+
+static __always_inline int
+__lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
+{
+	unsigned int loops = LL_SC_MAX_LOOPS;
+	int ret, val, tmp;
+
+	mte_enable_tco();
+	uaccess_ttbr0_enable();
+
+	asm volatile("// __lsui_futex_atomic_eor\n"
+	__LSUI_PREAMBLE
+	"	prfm	pstl1strm, %2\n"
+	"1:	ldtxr	%w1, %2\n"
+	"	eor	%w3, %w1, %w5\n"
+	"2:	stltxr	%w0, %w3, %2\n"
+	"	cbz	%w0, 3f\n"
+	"	sub	%w4, %w4, %w0\n"
+	"	cbnz	%w4, 1b\n"
+	"	mov	%w0, %w6\n"
+	"3:\n"
+	"	dmb	ish\n"
+	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)
+	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w0)
+	: "=&r" (ret), "=&r" (val), "+Q" (*uaddr), "=&r" (tmp),
+	  "+r" (loops)
+	: "r" (oparg), "Ir" (-EAGAIN)
+	: "memory");
+
+	mte_disable_tco();
+	uaccess_ttbr0_disable();
+
+	if (!ret)
+		*oval = val;
+
+	return ret;
+}
+
+static __always_inline int
+__lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
+{
+	int ret = 0;
+	unsigned int loops = LL_SC_MAX_LOOPS;
+	u32 val, tmp;
+
+	mte_enable_tco();
+	uaccess_ttbr0_enable();
+
+	/*
+	 * cas{al}t doesn't support word size...
+	 */
+	asm volatile("//__lsui_futex_cmpxchg\n"
+	__LSUI_PREAMBLE
+	"	prfm	pstl1strm, %2\n"
+	"1:	ldtxr	%w1, %2\n"
+	"	eor	%w3, %w1, %w5\n"
+	"	cbnz	%w3, 4f\n"
+	"2:	stltxr	%w3, %w6, %2\n"
+	"	cbz	%w3, 3f\n"
+	"	sub	%w4, %w4, %w3\n"
+	"	cbnz	%w4, 1b\n"
+	"	mov	%w0, %w7\n"
+	"3:\n"
+	"	dmb	ish\n"
+	"4:\n"
+	_ASM_EXTABLE_UACCESS_ERR(1b, 4b, %w0)
+	_ASM_EXTABLE_UACCESS_ERR(2b, 4b, %w0)
+	: "+r" (ret), "=&r" (val), "+Q" (*uaddr), "=&r" (tmp), "+r" (loops)
+	: "r" (oldval), "r" (newval), "Ir" (-EAGAIN)
+	: "memory");
+
+	mte_disable_tco();
+	uaccess_ttbr0_disable();
+
+	if (!ret)
+		*oval = oldval;
+
+	return ret;
+}
+
+#endif /* __ASM_FUTEX_LSUI_H */
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


