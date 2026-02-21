Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DABC61DE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 14:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gjPmLJd+jraD7qlSsVebR/kbml+Di1mwwU/8aRjOLf8=; b=BPLcX1sQrtaK1xdnS7MhDXFgNY
	VaxJWH2J7ClUSteX6o/U2SC7BJ9uvObsdPSlCJmlxtSS7/fUbsNMxa/AEWVnSR+NKIZBwmeynEKwS
	WeSp+xEVoXWMgjm51cVqay13025W177X2i4ggT4vT8PlwtSMIK+O7IpWAdV5/EVTrQcrvTXpYYQQH
	75EVozdj5jHuKKy4+KUlWXJEKtCRN6OyitsFoY7XZmA71mHK8mQuwmQ0KVKAbXZzMsV7feai/xwHR
	lCBofYvxh/scN1OtGVYX3+9Fz2RIfcAVU4FtERdW94j6pSM8qQYXDy3dH+xY4YCTimQRs2042ND6h
	wwP7kawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vto6S-0000000G6bS-4A9p;
	Sat, 21 Feb 2026 14:37:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vto6R-0000000G6bD-0xj6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 14:37:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15DD36001D;
	Sat, 21 Feb 2026 14:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0332C4CEF7;
	Sat, 21 Feb 2026 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771684620;
	bh=sRapExpB2i3CFisLm3IxOn3vqYVl2ysR1xFZfZZHINc=;
	h=From:To:Cc:Subject:Date:From;
	b=e33k54blChfrldzIYzZ+zCCNRWnjEbBwe11/1IjDP+YLR3gwMXsUvo07AAWpFrq0J
	 dUWUrBhu3/5pcarU0uyLMZeRA6l5Vj3l08s4eiYzUA76TDdrAmWHFMBhxq5e5ziBR2
	 JWi++Ytnj3OgzNVW+StY63VMRA9jOdbTBqLE6gSml+cFvaVH+es9HueI+tPXMh0TYJ
	 YxYXJyMQZKic02Qiv6mXUdoNS5wjvwK/hivDesC+uQr8vWrqAflHKETgbeyuzcpS9/
	 TJiHDUhBwackQHhxRrwzZLw+5Xy/mZkn/FO6954DTNzSDKZ1VFHdEK+DwZDaPvNJPO
	 MwvyYs+gTGSnw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: Add runtime constant support for armv7 and !THUMB2_KERNEL
Date: Sat, 21 Feb 2026 22:18:31 +0800
Message-ID: <20260221141831.16136-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Implement the runtime constant infrastructure for
armv7 && !THUMB2_KERNEL. So that armv7 can use this infrastructure
to generate constants to be used by the d_hash(), dentry_cache(),
names_cache() and so on.

This is the armv7 variant of commit 94a2bc0f611c ("arm64: add 'runtime
constant' support") and commit e3c92e81711d ("runtime constants: add
x86 architecture support").

As for < armv7 or THUMB2_KERNEL, we fall back to the generic
runtime-constant.h, no functionality changes.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm/include/asm/runtime-const.h | 102 +++++++++++++++++++++++++++
 arch/arm/kernel/vmlinux.lds.S        |   2 +
 2 files changed, 104 insertions(+)
 create mode 100644 arch/arm/include/asm/runtime-const.h

diff --git a/arch/arm/include/asm/runtime-const.h b/arch/arm/include/asm/runtime-const.h
new file mode 100644
index 000000000000..c1a14f71dd5e
--- /dev/null
+++ b/arch/arm/include/asm/runtime-const.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM_RUNTIME_CONST_H
+#define _ASM_ARM_RUNTIME_CONST_H
+
+#ifdef MODULE
+  #error "Cannot use runtime-const infrastructure from modules"
+#endif
+
+#if __LINUX_ARM_ARCH__ >= 7 && !defined(CONFIG_THUMB2_KERNEL)
+#include <asm/cacheflush.h>
+
+/* Sigh. You can still run arm in BE mode */
+#include <asm/byteorder.h>
+
+#define runtime_const_ptr(sym) ({				\
+	typeof(sym) __ret;					\
+	asm_inline("1:\n"					\
+		"movw %0, #0x4567\n"				\
+		"movt %0, #0x0123\n"				\
+		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
+		".long 1b - .\n"				\
+		".popsection"					\
+		: "=r" (__ret));				\
+	__ret; })
+
+#define runtime_const_shift_right_32(val, sym) ({		\
+	unsigned long __ret;					\
+	asm_inline("1:\n"					\
+		"lsr %0,%1,#12\n"				\
+		".pushsection runtime_shift_" #sym ",\"a\"\n\t"	\
+		".long 1b - .\n"				\
+		".popsection"					\
+		: "=r" (__ret)					\
+		: "r" (0u+(val)));				\
+	__ret; })
+
+#define runtime_const_init(type, sym) do {			\
+	extern s32 __start_runtime_##type##_##sym[];		\
+	extern s32 __stop_runtime_##type##_##sym[];		\
+								\
+	runtime_const_fixup(__runtime_fixup_##type,		\
+			    (unsigned long)(sym),		\
+			    __start_runtime_##type##_##sym,	\
+			    __stop_runtime_##type##_##sym);	\
+} while (0)
+
+/*
+ * 16-bit immediate for wide move (movw and movt) is encoded in
+ * bits 19:16, 11:0
+ */
+static inline void __runtime_fixup_16(__le32 *p, unsigned int val)
+{
+	u32 insn = le32_to_cpu(*p);
+
+	insn &= 0xfff0f000;
+	insn |= val & 0xfff;
+	insn |= ((val & 0xf000) >> 12) << 16;
+	*p = cpu_to_le32(insn);
+}
+
+static inline void __runtime_fixup_caches(void *where, unsigned int insns)
+{
+	unsigned long va = (unsigned long)where;
+
+	flush_icache_range(va, va + 4 * insns);
+}
+
+static inline void __runtime_fixup_ptr(void *where, unsigned long val)
+{
+	__le32 *p = where;
+
+	__runtime_fixup_16(p, val);
+	__runtime_fixup_16(p + 1, val >> 16);
+	__runtime_fixup_caches(where, 2);
+}
+
+/* Immediate value is 5 bits starting at bit #7 */
+static inline void __runtime_fixup_shift(void *where, unsigned long val)
+{
+	__le32 *p = where;
+	u32 insn = le32_to_cpu(*p);
+
+	insn &= 0xfffff07f;
+	insn |= (val & 0x1f) << 7;
+	*p = cpu_to_le32(insn);
+	__runtime_fixup_caches(where, 1);
+}
+
+static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
+	unsigned long val, s32 *start, s32 *end)
+{
+	while (start < end) {
+		fn(*start + (void *)start, val);
+		start++;
+	}
+}
+
+#else
+#include <asm-generic/runtime-const.h>
+#endif /* __LINUX_ARM_ARCH__ >= 7 && !defined(CONFIG_THUMB2_KERNEL) */
+
+#endif /* _ASM_ARM_RUNTIME_CONST_H */
diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
index d592a203f9c6..5d90cd16e538 100644
--- a/arch/arm/kernel/vmlinux.lds.S
+++ b/arch/arm/kernel/vmlinux.lds.S
@@ -126,6 +126,8 @@ SECTIONS
 		ARM_EXIT_KEEP(EXIT_DATA)
 	}
 
+	RUNTIME_CONST_VARIABLES
+
 #ifdef CONFIG_SMP
 	PERCPU_SECTION(L1_CACHE_BYTES)
 #endif
-- 
2.51.0


