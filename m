Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7534CCFD314
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY46cQrPrx5lrDM05DzCxGz7iFm3c0BXVEQVjIh9mB4=; b=3BPdJ6wAZBiOQoo3IYocD9AYwJ
	xJ9W1FQh/3ey0SE3XUisTuWApphuBR45aVLt6lMs3tw3MT5F3EFdVy6yKseafq3nF5FijqHDyc4TX
	oRvVg/vAc3/7Wa8wyqAjq1ijEyxPC+lqfUE3GhaaPQhGcx5ZnX85Kq7VRLdidfVhKR4IrOQjGeCks
	7zpY+LcCKZ5bNxEAAU5lghzNaiFsM98WHq2InfXxVMcXKgV3Y2TeR1YGm5ahG7QGfzKICToPO8CFc
	LysJ2VEq+8IOXyudbVMMA3hhFf3njWtWcJT91DbxmcSJwwePyVFm86zjjp7LjUliALk/CD/Hqc54F
	hPe0MPpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUkCK-00000002PEq-2bpm;
	Sun, 14 Dec 2025 11:23:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUkCG-00000002P9h-1cxh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 11:23:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49B1B16F3;
	Sun, 14 Dec 2025 03:23:20 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 31B933F73B;
	Sun, 14 Dec 2025 03:23:24 -0800 (PST)
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
	mark.rutland@arm.com,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v11 RESEND 9/9] arm64: armv8_deprecated: apply FEAT_LSUI for swpX emulation.
Date: Sun, 14 Dec 2025 11:22:48 +0000
Message-Id: <20251214112248.901769-10-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251214112248.901769-1-yeoreum.yun@arm.com>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_032328_561157_93F9F72D 
X-CRM114-Status: GOOD (  13.75  )
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

Apply the FEAT_LSUI instruction to emulate the deprecated swpX
instruction, so that toggling of the PSTATE.PAN bit can be removed when
LSUI-related instructions are used.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kernel/armv8_deprecated.c | 77 +++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/armv8_deprecated.c b/arch/arm64/kernel/armv8_deprecated.c
index d15e35f1075c..b8e6d71f766d 100644
--- a/arch/arm64/kernel/armv8_deprecated.c
+++ b/arch/arm64/kernel/armv8_deprecated.c
@@ -13,6 +13,7 @@
 #include <linux/uaccess.h>

 #include <asm/cpufeature.h>
+#include <asm/lsui.h>
 #include <asm/insn.h>
 #include <asm/sysreg.h>
 #include <asm/system_misc.h>
@@ -86,13 +87,77 @@ static unsigned int __maybe_unused aarch32_check_condition(u32 opcode, u32 psr)
  *	   Rn  = address
  */

+/* Arbitrary constant to ensure forward-progress of the loop */
+#define __SWP_LOOPS	4
+
+#ifdef CONFIG_AS_HAS_LSUI
+static __always_inline int
+__lsui_user_swp_asm(unsigned int *data, unsigned int addr)
+{
+	int err = 0;
+	unsigned int temp;
+
+	asm volatile("// __lsui_user_swp_asm\n"
+	__LSUI_PREAMBLE
+	"1:	swpt		%w1, %w2, [%3]\n"
+	"	mov		%w1, %w2\n"
+	"2:\n"
+	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
+	: "+r" (err), "+r" (*data), "=&r" (temp)
+	: "r" ((unsigned long)addr)
+	: "memory");
+
+	return err;
+}
+
+static __always_inline int
+__lsui_user_swpb_asm(unsigned int *data, unsigned int addr)
+{
+	u8 i, idx;
+	int err = -EAGAIN;
+	u64 __user *addr_al;
+	u64 oldval;
+	union {
+		u64 var;
+		u8 raw[sizeof(u64)];
+	} newval, curval;
+
+	idx = addr & (sizeof(u64) - 1);
+	addr_al = (u64 __user *)ALIGN_DOWN(addr, sizeof(u64));
+
+	for (i = 0; i < __SWP_LOOPS; i++) {
+		if (get_user(oldval, addr_al))
+			return -EFAULT;
+
+		curval.var = newval.var = oldval;
+		newval.raw[idx] = *data;
+
+		asm volatile("// __lsui_user_swpb_asm\n"
+		__LSUI_PREAMBLE
+		"1: cast	%x2, %x3, %1\n"
+		"2:\n"
+		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
+		: "+r" (err), "+Q" (*addr_al), "+r" (curval.var)
+		: "r" (newval.var)
+		: "memory");
+
+		if (curval.var == oldval) {
+			err = 0;
+			break;
+		}
+	}
+
+	if (!err)
+		*data = curval.raw[idx];
+
+	return err;
+}
+#endif /* CONFIG_AS_HAS_LSUI */
+
 /*
  * Error-checking SWP macros implemented using ldxr{b}/stxr{b}
  */

-/* Arbitrary constant to ensure forward-progress of the LL/SC loop */
-#define __SWP_LL_SC_LOOPS	4
-
 #define LLSC_USER_SWPX(B)					\
 static __always_inline int					\
 __llsc_user_swp##B##_asm(unsigned int *data, unsigned int addr)	\
@@ -117,7 +182,7 @@ __llsc_user_swp##B##_asm(unsigned int *data, unsigned int addr)	\
 	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)			\
 	: "=&r" (err), "+r" (*data), "=&r" (temp), "=&r" (temp2)\
 	: "r" ((unsigned long)addr), "i" (-EAGAIN),		\
-	  "i" (__SWP_LL_SC_LOOPS)				\
+	  "i" (__SWP_LOOPS)					\
 	: "memory");						\
 	uaccess_disable_privileged();				\
 								\
@@ -128,9 +193,9 @@ LLSC_USER_SWPX()
 LLSC_USER_SWPX(b)

 #define __user_swp_asm(data, addr) \
-	__llsc_user_swp_asm(data, addr)
+	__lsui_llsc_body(user_swp_asm, data, addr)
 #define __user_swpb_asm(data, addr) \
-	__llsc_user_swpb_asm(data, addr)
+	__lsui_llsc_body(user_swpb_asm, data, addr)

 /*
  * Bit 22 of the instruction encoding distinguishes between
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


