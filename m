Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9646CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oGO4aInOMwcJBlubD1n7JsDeE5pzNp/br2DL9wDgp8=; b=rtZbJrVUgYdpVNnOwrWpn1tjN3
	dw24IvccDGnIgee62tLzUdNJoQti92qAx8Kk++VuuseJVIDTLvpQwsslC2UyoR5kRohnAsYS3gTxq
	LC+oOQzY96Nr0lVbUKDKN0FXO0y47lWP3jEUMazOH7ty/gjXy67So+CbPXSXdZ/In6WPZ5I9TRdQY
	6stn9/95PPPoRq8bRYykw4SqbhTOkOHXJisgxnFOFq0PUxXxb6TTbEJS0wPDiz/k0wDT2oz/v0z0v
	f6qf0i1zSEo2XMYBdJWopfunCf6nJB0s5vAv4EjUj+xX1riWL2cE88hau3gtFAFreBsA9hXoMxBsd
	ZTG95RHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwUK-0000000FAdh-2Gf2;
	Thu, 06 Nov 2025 09:41:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwUH-0000000FAaF-1y0A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 09:41:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AE981764;
	Thu,  6 Nov 2025 01:40:53 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C20953F63F;
	Thu,  6 Nov 2025 01:40:57 -0800 (PST)
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
Subject: [PATCH v11 9/9] arm64: armv8_deprecated: apply FEAT_LSUI for swpX emulation.
Date: Thu,  6 Nov 2025 09:40:23 +0000
Message-Id: <20251106094023.1371246-10-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106094023.1371246-1-yeoreum.yun@arm.com>
References: <20251106094023.1371246-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_014101_676822_13AADFF9 
X-CRM114-Status: GOOD (  14.00  )
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

apply FEAT_LSUI instruction to emulate deprecated swpX instruction.

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


