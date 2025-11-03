Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57751CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6QdzGx04q/4iS5IQmgqo/pb0Pv6Xdu3mAan98oYwx0=; b=islhIV1XmH01faNJjyz6eg6yau
	zBF2zLJtdI4I/oUDVVfaT5ZBTQJX6ZLmAXbGi/p511tUDY7oyYCW6Nm7oBs9rR3sYZojpggFfDLGh
	sYr8U7mCqu/F4p9X1+jDb/A3Rt3vIQ4vtt8DdGbwY3FqtKXnQwvEE8uSKDbBlB61133nzZep5hTNj
	n7fsrGQBRpNEgIRcjJ9tY4SLyvau5kviX20J4ChIou2zy7c8CXX3UWVyRZNXyqTJrtcqTuh2MfstW
	87ulN/KlzeLZaF+dh0u8TJvJz6pfNoC/Wzi0rbiPWYwXjdEX/PGLDr6056a/NyaKadfXpODQ9jeb9
	c4Ics+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxUL-0000000AGwT-14wD;
	Mon, 03 Nov 2025 16:33:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxUH-0000000AGsn-3bhP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:32:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95FD3315F;
	Mon,  3 Nov 2025 08:32:49 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 422503F694;
	Mon,  3 Nov 2025 08:32:54 -0800 (PST)
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
Subject: [PATCH v10 8/9] arm64: armv8_deprecated: convert user_swpX to inline function
Date: Mon,  3 Nov 2025 16:32:23 +0000
Message-Id: <20251103163224.818353-9-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103163224.818353-1-yeoreum.yun@arm.com>
References: <20251103163224.818353-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_083258_026692_5077D95C 
X-CRM114-Status: UNSURE (   9.99  )
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

This is preparation patch to apply FEAT_LSUI in
user_swpX operation.
For this, convert user_swpX macro into inline function.
No functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kernel/armv8_deprecated.c | 38 +++++++++++++++++-----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kernel/armv8_deprecated.c b/arch/arm64/kernel/armv8_deprecated.c
index e737c6295ec7..d15e35f1075c 100644
--- a/arch/arm64/kernel/armv8_deprecated.c
+++ b/arch/arm64/kernel/armv8_deprecated.c
@@ -93,13 +93,18 @@ static unsigned int __maybe_unused aarch32_check_condition(u32 opcode, u32 psr)
 /* Arbitrary constant to ensure forward-progress of the LL/SC loop */
 #define __SWP_LL_SC_LOOPS	4
 
-#define __user_swpX_asm(data, addr, res, temp, temp2, B)	\
-do {								\
+#define LLSC_USER_SWPX(B)					\
+static __always_inline int					\
+__llsc_user_swp##B##_asm(unsigned int *data, unsigned int addr)	\
+{								\
+	int err = 0;						\
+	unsigned int temp, temp2;				\
+								\
 	uaccess_enable_privileged();				\
 	__asm__ __volatile__(					\
 	"	mov		%w3, %w6\n"			\
-	"0:	ldxr"B"		%w2, [%4]\n"			\
-	"1:	stxr"B"		%w0, %w1, [%4]\n"		\
+	"0:	ldxr"#B"	%w2, [%4]\n"			\
+	"1:	stxr"#B"	%w0, %w1, [%4]\n"		\
 	"	cbz		%w0, 2f\n"			\
 	"	sub		%w3, %w3, #1\n"			\
 	"	cbnz		%w3, 0b\n"			\
@@ -110,17 +115,22 @@ do {								\
 	"3:\n"							\
 	_ASM_EXTABLE_UACCESS_ERR(0b, 3b, %w0)			\
 	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)			\
-	: "=&r" (res), "+r" (data), "=&r" (temp), "=&r" (temp2)	\
+	: "=&r" (err), "+r" (*data), "=&r" (temp), "=&r" (temp2)\
 	: "r" ((unsigned long)addr), "i" (-EAGAIN),		\
 	  "i" (__SWP_LL_SC_LOOPS)				\
 	: "memory");						\
 	uaccess_disable_privileged();				\
-} while (0)
+								\
+	return err;						\
+}
+
+LLSC_USER_SWPX()
+LLSC_USER_SWPX(b)
 
-#define __user_swp_asm(data, addr, res, temp, temp2) \
-	__user_swpX_asm(data, addr, res, temp, temp2, "")
-#define __user_swpb_asm(data, addr, res, temp, temp2) \
-	__user_swpX_asm(data, addr, res, temp, temp2, "b")
+#define __user_swp_asm(data, addr) \
+	__llsc_user_swp_asm(data, addr)
+#define __user_swpb_asm(data, addr) \
+	__llsc_user_swpb_asm(data, addr)
 
 /*
  * Bit 22 of the instruction encoding distinguishes between
@@ -131,7 +141,7 @@ do {								\
 static int emulate_swpX(unsigned int address, unsigned int *data,
 			unsigned int type)
 {
-	unsigned int res = 0;
+	unsigned int res;
 
 	if ((type != TYPE_SWPB) && (address & 0x3)) {
 		/* SWP to unaligned address not permitted */
@@ -140,12 +150,10 @@ static int emulate_swpX(unsigned int address, unsigned int *data,
 	}
 
 	while (1) {
-		unsigned long temp, temp2;
-
 		if (type == TYPE_SWPB)
-			__user_swpb_asm(*data, address, res, temp, temp2);
+			res = __user_swpb_asm(data, address);
 		else
-			__user_swp_asm(*data, address, res, temp, temp2);
+			res = __user_swp_asm(data, address);
 
 		if (likely(res != -EAGAIN) || signal_pending(current))
 			break;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


