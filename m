Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B0FD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 07:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rW8ISgpnd9ZWA0vom3O7SNTQxEqhWwsEWPKjvno/BVo=; b=ZN37AEt+34elgUmO58CsEE1CDG
	KgIUs23sQfzs0oHq5xEWnfABilyAKTcivr49ZpD0DaPLidGy6Yc7yeMtvxUsPHEEpOIQFMSs8gRon
	7LF5JqWNa2Rnq72dvf4nbC5eXxkaI2ZIuLn/+CbCU444xC9Tm9eHbX5IApaORx4Owi+kmFmqwfi76
	M4bTwkxLjDoOgl9Wb6tJREo36K0RQI7cHbtHQ4NhbtBCsM01VLutgVteeCULQDOXMNbwjrRaHwZrB
	OqE1jl56t2YPLwEs9XsaZZEPtZNtwa/M6vi3nmxc27quMv3AfjrIx8a+pKHffaCikC+qHC1/wkRlt
	SSzHFRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPEwO-00000001Kl0-1hXo;
	Sat, 29 Nov 2025 07:00:20 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPEwL-00000001Kjo-22he
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 07:00:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rW8ISgpnd9ZWA0vom3O7SNTQxEqhWwsEWPKjvno/BVo=;
	b=PzYdT/SpzEBgnXFLAJRNDDN+2MLxAI2qp3w4sHXhKT9vTr8wH/ypMBjbKL+AUOEuEZF2F4JzA
	xJXyCUfv9kPjUFa7Z6yUW8nxWbf5poIdS7LEa3y11XkfYOk8Vp0JNARCWLGN4HkGidKr7AmkgOg
	0e3VisN4egyOKoPjmExzr3M=
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dJLbT36lwz1T4Fk;
	Sat, 29 Nov 2025 14:58:13 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B7C21402C1;
	Sat, 29 Nov 2025 15:00:00 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 29 Nov
 2025 14:59:59 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<kristina.martsenko@arm.com>, <broonie@kernel.org>, <jeremy.linton@arm.com>,
	<mark.rutland@arm.com>, <ardb@kernel.org>, <ebiggers@kernel.org>,
	<martin.petersen@oracle.com>, <sohil.mehta@intel.com>,
	<herbert@gondor.apana.org.au>
CC: <linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<sunnanyong@huawei.com>, <wuchangye@huawei.com>, <huangliming5@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [RFC PATCH] arm64: introduce NEON based copy to/from user
Date: Sat, 29 Nov 2025 14:58:45 +0800
Message-ID: <20251129065846.1656987-1-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.85.135]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_230018_230073_8BC5A262 
X-CRM114-Status: GOOD (  29.09  )
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

From: Alexander Kozhevnikov <alexander.kozhevnikov@huawei-partners.com>

This implementation use st1/ld1 4-vector instrutions which allow to copy
64 bytes at once, and can be used on any ARMv8 variant.

During NEON instructions accessing user address, we must disable PAN
temporarily, mark FPSIMD in use, and save FPSIMD context.
1) We only save the used FPSIMD registers context instead of all registers.
2) Trapped in FPSIMD context does not support user address page fault.
   fallback to retry copy left at this point.
3) We find that although we have disabled PAN temporarily, performance will
   decrease if copy size is below 4KB under CONFIG_ARM64_PAN=y, so use NEON
   copy when not less than 4K bytes.
4) Add a /proc/sys/kernel/neon_copy_user switch that users can turn on as
   needed.

The following table shows the performance testing of the copy_to/from_user
based on Kunpeng platform. In addition, copy_to_user 1024KB has
deteriorated, and the cause is still being investigated.

--------------------------------------------------------------------------
          |           copy_from_user      |           copy_to_user
          |           nsecs/call          |           nsecs/call
--------------------------------------------------------------------------
   size   | baseline  neon_copy  increase | baseline  neon_copy  increase
--------------------------------------------------------------------------
    1 KB  |     161      162     -0.62%   |    156       155      0.64%
   16 KB  |     613      326     46.82%   |    549       325     40.80%
   32 KB  |    1057      491     53.55%   |    991       486     50.96%
   64 KB  |    2017      976     51.61%   |   1854       959     48.27%
  128 KB  |    3737     1885     49.56%   |   3520      1870     46.88%
  256 KB  |    7667     3744     51.17%   |   7106      3714     47.73%
  512 KB  |   16518     9972     39.63%   |  14102     10583     24.95%
 1024 KB  |   49843    46409      6.89%   |  32264     37082    -14.93%
 1536 KB  |   94641    80999     14.41%   |  56756     57202     -0.79%
 2048 KB  |  134955   116348     13.79%   |  81314     76292      6.18%
 3072 KB  |  215230   188738     12.31%   | 123061    116767      5.11%
 4096 KB  |  302353   264942     12.37%   | 167716    158134      5.71%
 5120 KB  |  444801   348909     21.56%   | 213730    206918      3.19%
 6144 KB  |  561146   428615     23.62%   | 271235    255034      5.97%
 7168 KB  |  624656   521106     16.58%   | 326677    307703      5.81%
 8192 KB  |  766439   603728     21.23%   | 391038    365387      6.56%
--------------------------------------------------------------------------

Signed-off-by: Alexander Kozhevnikov <alexander.kozhevnikov@huawei-partners.com>
Signed-off-by: Lemmy Huang <huangliming5@huawei.com>
---
 arch/arm64/Kconfig                   | 10 +++
 arch/arm64/include/asm/asm-uaccess.h | 17 +++++
 arch/arm64/include/asm/neon.h        |  7 ++
 arch/arm64/include/asm/uaccess.h     | 65 +++++++++++++++++++
 arch/arm64/kernel/fpsimd.c           | 91 ++++++++++++++++++++++++++
 arch/arm64/lib/Makefile              |  2 +
 arch/arm64/lib/copy_from_user.S      | 13 ++++
 arch/arm64/lib/copy_from_user_neon.S | 96 ++++++++++++++++++++++++++++
 arch/arm64/lib/copy_template.S       | 52 ++++++++++++++-
 arch/arm64/lib/copy_to_user.S        | 13 ++++
 arch/arm64/lib/copy_to_user_neon.S   | 96 ++++++++++++++++++++++++++++
 11 files changed, 459 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/lib/copy_from_user_neon.S
 create mode 100644 arch/arm64/lib/copy_to_user_neon.S

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f..cf8f1d4d57 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -388,6 +388,16 @@ config SMP
 config KERNEL_MODE_NEON
 	def_bool y
 
+config NEON_COPY_USER
+	bool "Use NEON instructions in copy_to/from_user"
+	depends on KERNEL_MODE_NEON
+	default n
+	help
+	  This option turns on using NEON instructions to speed up copy_to/from_user
+	  routines. This implementation use st1/ld1 4-vector instrutions which allow
+	  to copy 64 bytes at once, and is used only if size of data block to copy
+	  is more than 4096 bytes.
+
 config FIX_EARLYCON_MEM
 	def_bool y
 
diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
index 9148f5a319..b2657d31cc 100644
--- a/arch/arm64/include/asm/asm-uaccess.h
+++ b/arch/arm64/include/asm/asm-uaccess.h
@@ -94,4 +94,21 @@ alternative_else_nop_endif
 
 		_asm_extable_uaccess	8888b, \l;
 	.endm
+
+#ifdef CONFIG_NEON_COPY_USER
+	.macro user_ldneon l, reg1, reg2, reg3, reg4, ptr, post_inc
+8888 :		ld1 {\reg1, \reg2, \reg3, \reg4}, [\ptr];
+		add		\ptr, \ptr, \post_inc;
+
+		_asm_extable_uaccess	8888b, \l;
+	.endm
+
+	.macro user_stneon l, reg1, reg2, reg3, reg4, ptr, post_inc
+8888 :		st1 {\reg1, \reg2, \reg3, \reg4}, [\ptr];
+		add		\ptr, \ptr, \post_inc;
+
+		_asm_extable_uaccess	8888b, \l;
+	.endm
+#endif
+
 #endif
diff --git a/arch/arm64/include/asm/neon.h b/arch/arm64/include/asm/neon.h
index d4b1d172a7..0c75baeba8 100644
--- a/arch/arm64/include/asm/neon.h
+++ b/arch/arm64/include/asm/neon.h
@@ -16,4 +16,11 @@
 void kernel_neon_begin(void);
 void kernel_neon_end(void);
 
+#ifdef CONFIG_NEON_COPY_USER
+bool kernel_neon_copy_enabled(void);
+
+void kernel_neon_copy_begin(void);
+void kernel_neon_copy_end(void);
+#endif
+
 #endif /* ! __ASM_NEON_H */
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 1aa4ecb734..c6e0f9adba 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -25,6 +25,10 @@
 #include <asm/ptrace.h>
 #include <asm/memory.h>
 #include <asm/extable.h>
+#ifdef CONFIG_NEON_COPY_USER
+#include <asm/neon.h>
+#include <asm/simd.h>
+#endif
 
 static inline int __access_ok(const void __user *ptr, unsigned long size);
 
@@ -391,6 +395,66 @@ do {									\
 	} while (0);							\
 } while(0)
 
+
+#ifdef CONFIG_NEON_COPY_USER
+extern unsigned long __must_check __arch_copy_from_user(
+	void *to, const void __user *from, unsigned long n);
+extern unsigned long __must_check __arch_copy_from_user_neon(
+	void *to, const void __user *from, unsigned long n);
+#define raw_copy_from_user(to, from, n)					\
+({										\
+	unsigned long __acfu_ret = n;		\
+	if ((n) >= 4096 && kernel_neon_copy_enabled()) {	\
+		if (may_use_simd()) {			\
+			kernel_neon_copy_begin();		\
+			uaccess_enable_privileged();	\
+			__acfu_ret = __arch_copy_from_user_neon((to),	\
+							__uaccess_mask_ptr(from), (n));	\
+			uaccess_disable_privileged();	\
+			kernel_neon_copy_end();			\
+		}							\
+	}								\
+	/* fallback to retry copy left */	\
+	if (__acfu_ret) {				\
+		uaccess_ttbr0_enable();		\
+		__acfu_ret = __arch_copy_from_user((u8 *)(to) + (n) - __acfu_ret,	\
+			__uaccess_mask_ptr((u8 __user *)(from) + (n) - __acfu_ret),	\
+			__acfu_ret);			\
+		uaccess_ttbr0_disable();	\
+	}								\
+	__acfu_ret;						\
+})
+
+extern unsigned long __must_check __arch_copy_to_user(
+	void __user *to, const void *from, unsigned long n);
+extern unsigned long __must_check __arch_copy_to_user_neon(
+	void __user *to, const void *from, unsigned long n);
+#define raw_copy_to_user(to, from, n)					\
+({										\
+	unsigned long __actu_ret = n;		\
+	if ((n) >= 4096 && kernel_neon_copy_enabled()) {	\
+		if (may_use_simd()) {			\
+			kernel_neon_copy_begin();		\
+			uaccess_enable_privileged();	\
+			__actu_ret = __arch_copy_to_user_neon(__uaccess_mask_ptr(to),	\
+							(from), (n));	\
+			uaccess_disable_privileged();	\
+			kernel_neon_copy_end();			\
+		}							\
+	}								\
+	/* fallback to retry copy left */	\
+	if (__actu_ret) {				\
+		uaccess_ttbr0_enable();		\
+		__actu_ret = __arch_copy_to_user(	\
+			__uaccess_mask_ptr((u8 __user *)(to) + (n) - __actu_ret),	\
+			(u8 *)(from)  + (n) - __actu_ret, __actu_ret);	\
+		uaccess_ttbr0_disable();	\
+	}								\
+	__actu_ret;						\
+})
+
+#else  /* CONFIG_NEON_COPY_USER */
+
 extern unsigned long __must_check __arch_copy_from_user(void *to, const void __user *from, unsigned long n);
 #define raw_copy_from_user(to, from, n)					\
 ({									\
@@ -412,6 +476,7 @@ extern unsigned long __must_check __arch_copy_to_user(void __user *to, const voi
 	uaccess_ttbr0_disable();					\
 	__actu_ret;							\
 })
+#endif  /* CONFIG_NEON_COPY_USER */
 
 static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
 {
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e3f8f51748..ab71ffe5c7 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1905,6 +1905,97 @@ void kernel_neon_end(void)
 }
 EXPORT_SYMBOL_GPL(kernel_neon_end);
 
+#ifdef CONFIG_NEON_COPY_USER
+DEFINE_STATIC_KEY_FALSE(kernel_neon_copy_user_used);
+bool kernel_neon_copy_enabled(void)
+{
+	return static_key_enabled(&kernel_neon_copy_user_used);
+}
+EXPORT_SYMBOL_GPL(kernel_neon_copy_enabled);
+
+/*
+ * kernel_neon_copy_begin(): only set FPSIMD context busy
+ *
+ * The caller must save the used FPSIMD registers to stack and restore registers
+ */
+void kernel_neon_copy_begin(void)
+{
+	get_cpu_fpsimd_context();
+}
+EXPORT_SYMBOL_GPL(kernel_neon_copy_begin);
+
+/*
+ * kernel_neon_copy_end(): relase FPSIMD context
+ *
+ * Must be called from a context in which kernel_neon_copy_begin() was previously
+ * called.
+ */
+void kernel_neon_copy_end(void)
+{
+	put_cpu_fpsimd_context();
+}
+EXPORT_SYMBOL_GPL(kernel_neon_copy_end);
+
+static int neon_copy_sysctl_handler(const struct ctl_table *table, int write,
+	void *buffer, size_t *lenp, loff_t *ppos)
+{
+	int ret, val;
+	const struct ctl_table tmp = {
+		.data	= &val,
+		.maxlen	= sizeof(val),
+		.mode	= table->mode,
+		.extra1	= SYSCTL_ZERO,
+		.extra2	= SYSCTL_ONE,
+	};
+	/* List of CPUs that support NEON copy */
+	static const struct midr_range hip12_cpus[] = {
+		MIDR_ALL_VERSIONS(MIDR_HISI_HIP12),
+		{ }
+	};
+
+	if (write && !capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!system_supports_fpsimd())
+		return -EPERM;
+
+	if (!is_midr_in_range_list(hip12_cpus))
+		return -EPERM;
+
+	if (!write) {
+		if (static_key_enabled(&kernel_neon_copy_user_used))
+			val = 1;
+		else
+			val = 0;
+	}
+	ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
+	if (write && !ret) {
+		if (val)
+			static_branch_enable(&kernel_neon_copy_user_used);
+		else
+			static_branch_disable(&kernel_neon_copy_user_used);
+	}
+	return 0;
+}
+
+static const struct ctl_table neon_copy_sysctl_table[] = {
+	{
+		.procname = "neon_copy_user",
+		.mode = 0644,
+		.proc_handler = neon_copy_sysctl_handler,
+	},
+	{ }
+};
+
+static int __init neon_copy_sysctl_init(void)
+{
+	if (!register_sysctl("kernel", neon_copy_sysctl_table))
+		return -EINVAL;
+	return 0;
+}
+core_initcall(neon_copy_sysctl_init);
+#endif
+
 #ifdef CONFIG_EFI
 
 static struct user_fpsimd_state efi_fpsimd_state;
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 633e5223d9..2a92ae7bd7 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -13,6 +13,8 @@ endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
+lib-$(CONFIG_NEON_COPY_USER) += copy_to_user_neon.o copy_from_user_neon.o
+
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_ARM64_MTE) += mte.o
diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
index 400057d607..db861eff78 100644
--- a/arch/arm64/lib/copy_from_user.S
+++ b/arch/arm64/lib/copy_from_user.S
@@ -59,11 +59,24 @@
 	USER_CPY(9996f, 0, cpyfert [\dst]!, [\src]!, \count!)
 	.endm
 
+#ifdef CONFIG_NEON_COPY_USER
+	.macro ldneon reg1, reg2, reg3, reg4, ptr, val
+	b	9997f
+	.endm
+
+	.macro stneon reg1, reg2, reg3, reg4, ptr, val
+	b	9997f
+	.endm
+#endif
+
 end	.req	x5
 srcin	.req	x15
 SYM_FUNC_START(__arch_copy_from_user)
 	add	end, x0, x2
 	mov	srcin, x1
+#ifdef CONFIG_NEON_COPY_USER
+	mov	x3, #0		/* disable neon copy */
+#endif
 #include "copy_template.S"
 	mov	x0, #0				// Nothing to copy
 	ret
diff --git a/arch/arm64/lib/copy_from_user_neon.S b/arch/arm64/lib/copy_from_user_neon.S
new file mode 100644
index 0000000000..4dc2b3dfdd
--- /dev/null
+++ b/arch/arm64/lib/copy_from_user_neon.S
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2025 Huawei Ltd.
+ */
+
+#include <linux/linkage.h>
+
+#include <asm/asm-uaccess.h>
+#include <asm/assembler.h>
+#include <asm/cache.h>
+
+/*
+ * Copy from user space to a kernel buffer (alignment handled by the hardware)
+ *
+ * Parameters:
+ *	x0 - to
+ *	x1 - from
+ *	x2 - n
+ * Returns:
+ *	x0 - bytes not copied
+ */
+
+	.macro ldrb1 reg, ptr, val
+	user_ldst 9998f, ldtrb, \reg, \ptr, \val
+	.endm
+
+	.macro strb1 reg, ptr, val
+	strb \reg, [\ptr], \val
+	.endm
+
+	.macro ldrh1 reg, ptr, val
+	user_ldst 9997f, ldtrh, \reg, \ptr, \val
+	.endm
+
+	.macro strh1 reg, ptr, val
+	strh \reg, [\ptr], \val
+	.endm
+
+	.macro ldr1 reg, ptr, val
+	user_ldst 9997f, ldtr, \reg, \ptr, \val
+	.endm
+
+	.macro str1 reg, ptr, val
+	str \reg, [\ptr], \val
+	.endm
+
+	.macro ldp1 reg1, reg2, ptr, val
+	user_ldp 9997f, \reg1, \reg2, \ptr, \val
+	.endm
+
+	.macro stp1 reg1, reg2, ptr, val
+	stp \reg1, \reg2, [\ptr], \val
+	.endm
+
+	.macro cpy1 dst, src, count
+	.arch_extension mops
+	USER_CPY(9997f, 0, cpyfprt [\dst]!, [\src]!, \count!)
+	USER_CPY(9996f, 0, cpyfmrt [\dst]!, [\src]!, \count!)
+	USER_CPY(9996f, 0, cpyfert [\dst]!, [\src]!, \count!)
+	.endm
+
+	.macro ldneon reg1, reg2, reg3, reg4, ptr, val
+	user_ldneon 9987f, \reg1, \reg2, \reg3, \reg4, \ptr, \val
+	.endm
+
+	.macro stneon reg1, reg2, reg3, reg4, ptr, val
+	st1 {\reg1, \reg2, \reg3, \reg4}, [\ptr]
+	add \ptr, \ptr, \val
+	.endm
+
+end	.req	x5
+srcin	.req	x15
+SYM_FUNC_START(__arch_copy_from_user_neon)
+	add	end, x0, x2
+	mov	srcin, x1
+	mov	x3, #1		/* enable neon copy */
+#include "copy_template.S"
+	mov	x0, #0				// Nothing to copy
+	ret
+
+	// Exception fixups
+9987:	ld1	{V_a.16b, V_b.16b, V_c.16b, V_d.16b}, [sp]  /* restore current regs */
+	add	sp, sp, #64
+9996:	b.cs	9997f
+	// Registers are in Option A format
+	add	dst, dst, count
+9997:	cmp	dst, dstin
+	b.ne	9998f
+	// Before being absolutely sure we couldn't copy anything, try harder
+USER(9998f, ldtrb tmp1w, [srcin])
+	strb	tmp1w, [dst], #1
+9998:	sub	x0, end, dst			// bytes not copied
+	ret
+SYM_FUNC_END(__arch_copy_from_user_neon)
+EXPORT_SYMBOL(__arch_copy_from_user_neon)
diff --git a/arch/arm64/lib/copy_template.S b/arch/arm64/lib/copy_template.S
index 7f2f5a0e2f..c92f967f96 100644
--- a/arch/arm64/lib/copy_template.S
+++ b/arch/arm64/lib/copy_template.S
@@ -18,14 +18,16 @@
  *	x0 - dest
  *	x1 - src
  *	x2 - n
+ *	x3 - useneon
  * Returns:
  *	x0 - dest
  */
 dstin	.req	x0
 src	.req	x1
 count	.req	x2
-tmp1	.req	x3
-tmp1w	.req	w3
+useneon	.req	x3
+tmp1	.req	x16
+tmp1w	.req	w16
 tmp2	.req	x4
 tmp2w	.req	w4
 dst	.req	x6
@@ -38,6 +40,12 @@ C_l	.req	x11
 C_h	.req	x12
 D_l	.req	x13
 D_h	.req	x14
+#ifdef CONFIG_NEON_COPY_USER
+V_a	.req	v20
+V_b	.req	v21
+V_c	.req	v22
+V_d	.req	v23
+#endif
 
 	mov	dst, dstin
 
@@ -155,12 +163,16 @@ alternative_else_nop_endif
 	b.ne	.Ltail63
 	b	.Lexitfunc
 
+.Lcpy_body_large:
+#ifdef CONFIG_NEON_COPY_USER
+	tbnz	useneon, #0, .Lcpy_body_large_useneon
+#endif
 	/*
 	* Critical loop.  Start at a new cache line boundary.  Assuming
 	* 64 bytes per line this ensures the entire loop is in one line.
 	*/
 	.p2align	L1_CACHE_SHIFT
-.Lcpy_body_large:
+.Lcpy_body_large_usex:
 	/* pre-get 64 bytes data. */
 	ldp1	A_l, A_h, src, #16
 	ldp1	B_l, B_h, src, #16
@@ -188,4 +200,38 @@ alternative_else_nop_endif
 
 	tst	count, #0x3f
 	b.ne	.Ltail63
+
+#ifdef CONFIG_NEON_COPY_USER
+	b	.Lexitfunc
+
+.Lcpy_body_large_useneon:
+	/*
+	* Critical loop.  Start at a new cache line boundary.  Assuming
+	* 64 bytes per line this ensures the entire loop is in one line.
+	*/
+	.p2align	L1_CACHE_SHIFT
+	sub	sp, sp, #64
+	st1	{V_a.16b, V_b.16b, V_c.16b, V_d.16b}, [sp]  /* save current regs */
+	/* pre-get 64 bytes data. */
+	ldneon	V_a.16b, V_b.16b, V_c.16b, V_d.16b, src, #64
+
+1:
+	/*
+	* interlace the load of next 64 bytes data block with store of the last
+	* loaded 64 bytes data.
+	*/
+	stneon	V_a.16b, V_b.16b, V_c.16b, V_d.16b, dst, #64
+	ldneon	V_a.16b, V_b.16b, V_c.16b, V_d.16b, src, #64
+
+	subs	count, count, #64
+	b.ge	1b
+
+	stneon	V_a.16b, V_b.16b, V_c.16b, V_d.16b, dst, #64
+
+	ld1	{V_a.16b, V_b.16b, V_c.16b, V_d.16b}, [sp]  /* restore current regs */
+	add	sp, sp, #64
+
+	tst	count, #0x3f
+	b.ne	.Ltail63
+#endif
 .Lexitfunc:
diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
index 819f2e3fc7..fbf058dfd5 100644
--- a/arch/arm64/lib/copy_to_user.S
+++ b/arch/arm64/lib/copy_to_user.S
@@ -58,11 +58,24 @@
 	USER_CPY(9996f, 1, cpyfewt [\dst]!, [\src]!, \count!)
 	.endm
 
+#ifdef CONFIG_NEON_COPY_USER
+	.macro ldneon reg1, reg2, reg3, reg4, ptr, val
+	b	9997f
+	.endm
+
+	.macro stneon reg1, reg2, reg3, reg4, ptr, val
+	b	9997f
+	.endm
+#endif
+
 end	.req	x5
 srcin	.req	x15
 SYM_FUNC_START(__arch_copy_to_user)
 	add	end, x0, x2
 	mov	srcin, x1
+#ifdef CONFIG_NEON_COPY_USER
+	mov	x3, #0		/* disable neon copy */
+#endif
 #include "copy_template.S"
 	mov	x0, #0
 	ret
diff --git a/arch/arm64/lib/copy_to_user_neon.S b/arch/arm64/lib/copy_to_user_neon.S
new file mode 100644
index 0000000000..51c2aba8a6
--- /dev/null
+++ b/arch/arm64/lib/copy_to_user_neon.S
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2025 Huawei Ltd.
+ */
+
+#include <linux/linkage.h>
+
+#include <asm/asm-uaccess.h>
+#include <asm/assembler.h>
+#include <asm/cache.h>
+
+/*
+ * Copy to user space from a kernel buffer (alignment handled by the hardware)
+ *
+ * Parameters:
+ *	x0 - to
+ *	x1 - from
+ *	x2 - n
+ * Returns:
+ *	x0 - bytes not copied
+ */
+	.macro ldrb1 reg, ptr, val
+	ldrb  \reg, [\ptr], \val
+	.endm
+
+	.macro strb1 reg, ptr, val
+	user_ldst 9998f, sttrb, \reg, \ptr, \val
+	.endm
+
+	.macro ldrh1 reg, ptr, val
+	ldrh  \reg, [\ptr], \val
+	.endm
+
+	.macro strh1 reg, ptr, val
+	user_ldst 9997f, sttrh, \reg, \ptr, \val
+	.endm
+
+	.macro ldr1 reg, ptr, val
+	ldr \reg, [\ptr], \val
+	.endm
+
+	.macro str1 reg, ptr, val
+	user_ldst 9997f, sttr, \reg, \ptr, \val
+	.endm
+
+	.macro ldp1 reg1, reg2, ptr, val
+	ldp \reg1, \reg2, [\ptr], \val
+	.endm
+
+	.macro stp1 reg1, reg2, ptr, val
+	user_stp 9997f, \reg1, \reg2, \ptr, \val
+	.endm
+
+	.macro cpy1 dst, src, count
+	.arch_extension mops
+	USER_CPY(9997f, 1, cpyfpwt [\dst]!, [\src]!, \count!)
+	USER_CPY(9996f, 1, cpyfmwt [\dst]!, [\src]!, \count!)
+	USER_CPY(9996f, 1, cpyfewt [\dst]!, [\src]!, \count!)
+	.endm
+
+	.macro stneon reg1, reg2, reg3, reg4, ptr, val
+	user_stneon 9987f, \reg1, \reg2, \reg3, \reg4, \ptr, \val
+	.endm
+
+	.macro ldneon reg1, reg2, reg3, reg4, ptr, val
+	ld1 {\reg1, \reg2, \reg3, \reg4}, [\ptr]
+	add \ptr, \ptr, \val
+	.endm
+
+end	.req	x5
+srcin	.req	x15
+SYM_FUNC_START(__arch_copy_to_user_neon)
+	add	end, x0, x2
+	mov	srcin, x1
+	mov	x3, #1		/* enable neon copy */
+#include "copy_template.S"
+	mov	x0, #0
+	ret
+
+	// Exception fixups
+9987:	ld1	{V_a.16b, V_b.16b, V_c.16b, V_d.16b}, [sp]  /* restore current regs */
+	add	sp, sp, #64
+9996:	b.cs	9997f
+	// Registers are in Option A format
+	add	dst, dst, count
+9997:	cmp	dst, dstin
+	b.ne	9998f
+	// Before being absolutely sure we couldn't copy anything, try harder
+	ldrb	tmp1w, [srcin]
+USER(9998f, sttrb tmp1w, [dst])
+	add	dst, dst, #1
+9998:	sub	x0, end, dst			// bytes not copied
+	ret
+SYM_FUNC_END(__arch_copy_to_user_neon)
+EXPORT_SYMBOL(__arch_copy_to_user_neon)
-- 
2.33.0


