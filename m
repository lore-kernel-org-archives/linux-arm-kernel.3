Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0622CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afI9566zMx8Jqqvpy60+a1c81Yt4VR1PjHkHqqBkZGw=; b=EcTGNmNb3fqUCO
	I1sxKSqKx2AUjaNYt+NLlhOvr/4YMncHWjnHiIyrjdLDgS+oBVxvq/mX8qwA5XrN5K+u4t5wa86UV
	7Bd/HIu4Z3yzNXvXeoBX4ueBe5FwdVTmVYOm30soiV2o7vzx4gydLL3Vn9HeQ/GD8w2IPlh2TxR3H
	/lHA13AbdFg8Y4v5hr5ZZJbULF5yj7XTrQ0S3Lnkmx9GqVvGBuo1pKCgwXdZTCAXPbGmcW0O0/PYy
	I2r/yrcJrtAt9cQTMYkdBkjwvOaOXOi4aJx9dSwzr/KOHIjwwYBoO1G6mfCcht/YLrVcP78oXz6Bo
	2fhNvX+XIxsgVzW8C2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRd-00000000eUw-0i2M;
	Mon, 28 Sep 2026 13:31:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRY-00000000eSR-2jLR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:30:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2F9D1A00;
	Mon, 28 Sep 2026 06:30:52 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.11.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D73C03F763;
	Mon, 28 Sep 2026 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790602256; bh=iwkg+99SoyYEWJxl34GMzS72W7K0Sjbrxy9MJAfaS/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WY5cUQK62IW/N4jnSzmin866+Q3OpxFHZZi010V0w6DfkvRW3WJtyhnNJIkkRIpa9
	 5vvw9HnL97LLnwnHMXZx3CC0DvInf5LMovzwK8BpEJ3kmlb1HsfNyWNz3vvOY+BCjI
	 NPL9I5UgSodkHVm8nZ72hyWwVSgIsUOYSggP/OSg=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/6] arm64: io: replace NVIDIA Olympus erratum alternative with callback
Date: Mon, 28 Sep 2026 14:30:31 +0100
Message-ID: <20260928133034.243541-4-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928133034.243541-1-ada.coupriediaz@arm.com>
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_063056_765075_902386B9 
X-CRM114-Status: GOOD (  15.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Oliver Upton <oupton@kernel.org>, James Morse <james.morse@arm.com>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Lucas Wei <lucaswei@google.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

`__raw_read{b,w,l,q}()` represent about 10k call sites
that need to be patched.
Commit 12aab25ca56e ("arm64: errata: work around NVIDIA Olympus
device store/load ordering") implements its workaround with alternative
instructions, adding 10k extra instructions growing the size of the image.

Implement and use `__io_nvidia_olympus_patch_dmb()` as
a callback alternative instead, saving close to 40kB of image size
with a defconfig.

As the alternative fix replaced a NOP with a DMB in all cases,
make use of `aarch64_insn_gen_dmb()` which was made alternative-safe
in previous commits.

The callback needs to be added to the KVM NVHE namespace as `readl()`
is used in the vgic-v2 driver.

Cc: Vikram Sethi <vsethi@nvidia.com>
Cc: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/io.h    | 24 ++++++++++++++++--------
 arch/arm64/kernel/image-vars.h |  1 +
 arch/arm64/kernel/io.c         | 16 ++++++++++++++++
 3 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 49a7002661a92..0f1ca651c5c79 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -19,6 +19,10 @@
 #include <asm/cpufeature.h>
 #include <asm/rsi.h>
 
+/* IO-specific callbacks for alternative patching. */
+void __io_nvidia_olympus_patch_dmb(struct alt_instr *alt, __le32 *origptr,
+				   __le32 *updptr, int nr_inst);
+
 /*
  * Generic IO read/write.  These perform native-endian accesses.
  */
@@ -54,8 +58,9 @@ static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 static __always_inline u8 __raw_readb(const volatile void __iomem *addr)
 {
 	u8 val;
-	asm volatile(ALTERNATIVE("nop", "dmb osh",
-				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
+	asm volatile(ALTERNATIVE_CB("nop",
+				    ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027,
+				    __io_nvidia_olympus_patch_dmb)
 		     ALTERNATIVE("ldrb %w0, [%1]",
 				 "ldarb %w0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
@@ -68,8 +73,9 @@ static __always_inline u16 __raw_readw(const volatile void __iomem *addr)
 {
 	u16 val;
 
-	asm volatile(ALTERNATIVE("nop", "dmb osh",
-				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
+	asm volatile(ALTERNATIVE_CB("nop",
+				    ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027,
+				    __io_nvidia_olympus_patch_dmb)
 		     ALTERNATIVE("ldrh %w0, [%1]",
 				 "ldarh %w0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
@@ -81,8 +87,9 @@ static __always_inline u16 __raw_readw(const volatile void __iomem *addr)
 static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
 {
 	u32 val;
-	asm volatile(ALTERNATIVE("nop", "dmb osh",
-				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
+	asm volatile(ALTERNATIVE_CB("nop",
+				    ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027,
+				    __io_nvidia_olympus_patch_dmb)
 		     ALTERNATIVE("ldr %w0, [%1]",
 				 "ldar %w0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
@@ -94,8 +101,9 @@ static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
 static __always_inline u64 __raw_readq(const volatile void __iomem *addr)
 {
 	u64 val;
-	asm volatile(ALTERNATIVE("nop", "dmb osh",
-				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
+	asm volatile(ALTERNATIVE_CB("nop",
+				    ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027,
+				    __io_nvidia_olympus_patch_dmb)
 		     ALTERNATIVE("ldr %0, [%1]",
 				 "ldar %0, [%1]",
 				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 14beb7b9d304c..a22519c5223b4 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -94,6 +94,7 @@ KVM_NVHE_ALIAS(spectre_bhb_patch_clearbhb);
 KVM_NVHE_ALIAS(alt_cb_patch_nops);
 KVM_NVHE_ALIAS(kvm_compute_ich_hcr_trap_bits);
 KVM_NVHE_ALIAS(kvm_patch_ich_vtr_el2);
+KVM_NVHE_ALIAS(__io_nvidia_olympus_patch_dmb);
 
 /* Global kernel state accessed by nVHE hyp code. */
 KVM_NVHE_ALIAS(kvm_vgic_global_state);
diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
index fe86ada23c7d4..8ad3cd1773d20 100644
--- a/arch/arm64/kernel/io.c
+++ b/arch/arm64/kernel/io.c
@@ -9,6 +9,8 @@
 #include <linux/types.h>
 #include <linux/io.h>
 
+#include <asm/insn.h>
+
 /*
  * This generates a memcpy that works on a from/to address which is aligned to
  * bits. Count is in terms of the number of bits sized quantities to copy. It
@@ -50,3 +52,17 @@ void __iowrite32_copy_full(void __iomem *to, const void *from, size_t count)
 	dgh();
 }
 EXPORT_SYMBOL(__iowrite32_copy_full);
+
+noinstr void __io_nvidia_olympus_patch_dmb(struct alt_instr *alt, __le32 *origptr,
+					   __le32 *updptr, int nr_inst)
+{
+	u32 orinst;
+
+	BUG_ON(nr_inst != 1);
+
+	orinst = le32_to_cpu(origptr[0]);
+	BUG_ON(!aarch64_insn_is_nop(orinst));
+
+	updptr[0] = cpu_to_le32(aarch64_insn_gen_dmb(AARCH64_INSN_MB_OSH));
+}
+EXPORT_SYMBOL(__io_nvidia_olympus_patch_dmb);
-- 
2.43.0


