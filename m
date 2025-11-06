Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A55CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0LEf7zp/iKfrkXPc3OwJ8bF0F0/pGYCiv2RrgBGv9s=; b=W0U1XmCB/x1G3aPM8Z4v4Z4BVq
	+InwDFx/CxrPVPx25pMzVO6U9rIJLj6VI0ImlB+6D415R/CtmNrAKWrVaLLgU1RusKTJJRcj2PNzJ
	EwQxIeVMwuMkNvPq3uT4qzPSSic89QiV2LBU83erFYi8NCT71NNBKgX0Vd7SB1+++yDoC1dyTfU6a
	yR6m1qEwF1u9xWEBBhzdS7VLsFgU8rI/KRmH6s28u2eZTO5tMGpBW5KLY18xCVhNVyjEqTSmmn9D+
	U9ttbaLcWXJqV/d5gvMo2579OVFtKy1FvPtRiztmvClbO4o6dXMZhi4lvyXPQw6DE+6otl4AubULD
	dtmHe6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwUC-0000000FAVj-0nVt;
	Thu, 06 Nov 2025 09:40:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwUA-0000000FATt-1x2X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 09:40:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46B2515A1;
	Thu,  6 Nov 2025 01:40:46 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F2063F63F;
	Thu,  6 Nov 2025 01:40:50 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	miko.lenczewski@arm.com,
	kevin.brodsky@arm.com,
	ardb@kernel.org,
	suzuki.poulose@arm.com,
	lpieralisi@kernel.org,
	yangyicong@hisilicon.com,
	scott@os.amperecomputing.com,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	pbonzini@redhat.com,
	shuah@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v11 7/9] arm64: separate common LSUI definitions into lsui.h
Date: Thu,  6 Nov 2025 09:40:21 +0000
Message-Id: <20251106094023.1371246-8-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106094023.1371246-1-yeoreum.yun@arm.com>
References: <20251106094023.1371246-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_014054_567735_FA7B7F40 
X-CRM114-Status: GOOD (  12.70  )
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

This patch prepares for applying LSUI to the armv8_deprecated
SWP instruction.
Some LSUI-related definitions can be reused by armv8_deprecated.c,
so move the common definitions into a separate header file, lsui.h.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/futex.h | 15 +--------------
 arch/arm64/include/asm/lsui.h  | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/include/asm/lsui.h

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index 6778ff7e1c0e..ca9487219102 100644
--- a/arch/arm64/include/asm/futex.h
+++ b/arch/arm64/include/asm/futex.h
@@ -9,9 +9,8 @@
 #include <linux/uaccess.h>
 #include <linux/stringify.h>
 
-#include <asm/alternative.h>
-#include <asm/alternative-macros.h>
 #include <asm/errno.h>
+#include <asm/lsui.h>
 
 #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
 
@@ -97,8 +96,6 @@ __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
  * operation.
  */
 
-#define __LSUI_PREAMBLE	".arch_extension lsui\n"
-
 #define LSUI_FUTEX_ATOMIC_OP(op, asm_op, mb)				\
 static __always_inline int						\
 __lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
@@ -249,16 +246,6 @@ __lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
 	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
 }
 
-#define __lsui_llsc_body(op, ...)					\
-({									\
-	alternative_has_cap_likely(ARM64_HAS_LSUI) ?			\
-		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
-})
-
-#else	/* CONFIG_AS_HAS_LSUI */
-
-#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
-
 #endif	/* CONFIG_AS_HAS_LSUI */
 
 
diff --git a/arch/arm64/include/asm/lsui.h b/arch/arm64/include/asm/lsui.h
new file mode 100644
index 000000000000..1a2ad408a47b
--- /dev/null
+++ b/arch/arm64/include/asm/lsui.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_LSUI_H
+#define __ASM_LSUI_H
+
+#ifdef CONFIG_AS_HAS_LSUI
+
+#define __LSUI_PREAMBLE	".arch_extension lsui\n"
+
+#include <linux/stringify.h>
+#include <asm/alternative.h>
+#include <asm/alternative-macros.h>
+#include <asm/cpucaps.h>
+
+#define __lsui_llsc_body(op, ...)					\
+({									\
+	alternative_has_cap_likely(ARM64_HAS_LSUI) ?			\
+		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
+})
+
+#else	/* CONFIG_AS_HAS_LSUI */
+
+#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
+
+#endif	/* CONFIG_AS_HAS_LSUI */
+#endif	/* __ASM_LSUI_H */
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


