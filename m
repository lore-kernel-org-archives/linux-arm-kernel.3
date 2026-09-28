Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9D5CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Brt8hvPkf7IHXXZV4pMIw31kWoDxpKyzPytGTZtsH+4=; b=0W2EjHcbvX5HBo
	ZzGzwfYo0cGd6F1/DUMR9knjVBim09pAQTgM/dmY2gEQg+HGYpHyt7zMLCGxeuWJQnH6HRKtR+Wu9
	a79MKD+TuDlHNp0XzlLNaefFQ8UVmeCKRjC+RGq0KChuqClckuSS8aiPcFyEvEeGaQDnxnc24oDNa
	2BEGfxds4jN8CbB6WfRrFy8dP1TljZPhM3Yq+EER94yOVPq6xDYdeVP7pnnoOi9KvNHNHA4cmox+p
	+naXplDSKdMS9t+MTN4JezcpEQ75daE+HWwJCHxpnS0yhh445NoylBsfRiQyO5qcawsqEZdBdZciQ
	4xWtSxF83fljqS15pX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBS0-00000000edt-1HDv;
	Mon, 28 Sep 2026 13:31:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRb-00000000eTh-3LkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:31:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D143C1655;
	Mon, 28 Sep 2026 06:30:55 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.11.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6C6863F763;
	Mon, 28 Sep 2026 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790602259; bh=0HyXorrQkwj20u8ycSjiXbiSUGovZ1I8bUCuooXhEvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t1h5telcLy6fobKsgtHhKZwrcPJ9Ln9fQBo5oru6YYcHZPLtYwC84ATiCPZLl6fz7
	 AMrG2pCFvHTkB1i0G975hlc9aH6C922x3Lk1TCUDb6m6M5OX1hlFLkhHRam/+0VZOP
	 Y7Gj8f1J+0ou3I9no26zzNz9rZ4a9kVzzY0118DE=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] arm64: io: replace ARM erratum 832075 alternative with callback
Date: Mon, 28 Sep 2026 14:30:32 +0100
Message-ID: <20260928133034.243541-5-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928133034.243541-1-ada.coupriediaz@arm.com>
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_063059_936839_DFBC88E0 
X-CRM114-Status: GOOD (  15.01  )
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
Commit 5afaa1fc1b32 ("arm64: add Cortex-A57 erratum 832075 workaround")
implements its workaround with alternative instructions,
adding 10k extra instructions growing the size of the image.

Implement and use `__io_arm_a57_patch_ladr()` as a callback alternative
instead, saving close to 40kB of image size with a defconfig.

Unsigned offset loads and ordered loads encode the size of the load and
the operand registers identically, but ordered loads cannot offset
the base address.
As the alternatives in device loads do not have offsets, we can safely
bitmask the loads and convert them to ordered load as per the erratum fix.

The callback needs to be added to the KVM NVHE namespace as `readl()`
is used in the vgic-v2 driver.

Cc: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/io.h    | 27 +++++++++++++++------------
 arch/arm64/kernel/image-vars.h |  1 +
 arch/arm64/kernel/io.c         | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 0f1ca651c5c79..1791081d97dcb 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -22,6 +22,9 @@
 /* IO-specific callbacks for alternative patching. */
 void __io_nvidia_olympus_patch_dmb(struct alt_instr *alt, __le32 *origptr,
 				   __le32 *updptr, int nr_inst);
+void __io_arm_a57_patch_ladr(struct alt_instr *alt, __le32 *origptr,
+			     __le32 *updptr, int nr_inst);
+
 
 /*
  * Generic IO read/write.  These perform native-endian accesses.
@@ -61,9 +64,9 @@ static __always_inline u8 __raw_readb(const volatile void __iomem *addr)
 	asm volatile(ALTERNATIVE_CB("nop",
 				    ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027,
 				    __io_nvidia_olympus_patch_dmb)
-		     ALTERNATIVE("ldrb %w0, [%1]",
-				 "ldarb %w0, [%1]",
-				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+		     ALTERNATIVE_CB("ldrb %w0, [%1]",
+				    ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
+				    __io_arm_a57_patch_ladr)
 		     : "=r" (val) : "r" (addr));
 	return val;
 }
@@ -76,9 +79,9 @@ static __always_inline u16 __raw_readw(const volatile void __iomem *addr)
 	asm volatile(ALTERNATIVE_CB("nop",
 				    ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027,
 				    __io_nvidia_olympus_patch_dmb)
-		     ALTERNATIVE("ldrh %w0, [%1]",
-				 "ldarh %w0, [%1]",
-				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+		     ALTERNATIVE_CB("ldrh %w0, [%1]",
+				    ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
+				    __io_arm_a57_patch_ladr)
 		     : "=r" (val) : "r" (addr));
 	return val;
 }
@@ -90,9 +93,9 @@ static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
 	asm volatile(ALTERNATIVE_CB("nop",
 				    ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027,
 				    __io_nvidia_olympus_patch_dmb)
-		     ALTERNATIVE("ldr %w0, [%1]",
-				 "ldar %w0, [%1]",
-				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+		     ALTERNATIVE_CB("ldr %w0, [%1]",
+				    ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
+				    __io_arm_a57_patch_ladr)
 		     : "=r" (val) : "r" (addr));
 	return val;
 }
@@ -104,9 +107,9 @@ static __always_inline u64 __raw_readq(const volatile void __iomem *addr)
 	asm volatile(ALTERNATIVE_CB("nop",
 				    ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027,
 				    __io_nvidia_olympus_patch_dmb)
-		     ALTERNATIVE("ldr %0, [%1]",
-				 "ldar %0, [%1]",
-				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+		     ALTERNATIVE_CB("ldr %0, [%1]",
+				    ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
+				    __io_arm_a57_patch_ladr)
 		     : "=r" (val) : "r" (addr));
 	return val;
 }
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index a22519c5223b4..615b77ef403fe 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -95,6 +95,7 @@ KVM_NVHE_ALIAS(alt_cb_patch_nops);
 KVM_NVHE_ALIAS(kvm_compute_ich_hcr_trap_bits);
 KVM_NVHE_ALIAS(kvm_patch_ich_vtr_el2);
 KVM_NVHE_ALIAS(__io_nvidia_olympus_patch_dmb);
+KVM_NVHE_ALIAS(__io_arm_a57_patch_ladr);
 
 /* Global kernel state accessed by nVHE hyp code. */
 KVM_NVHE_ALIAS(kvm_vgic_global_state);
diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
index 8ad3cd1773d20..f56bdf0a70822 100644
--- a/arch/arm64/kernel/io.c
+++ b/arch/arm64/kernel/io.c
@@ -66,3 +66,36 @@ noinstr void __io_nvidia_olympus_patch_dmb(struct alt_instr *alt, __le32 *origpt
 	updptr[0] = cpu_to_le32(aarch64_insn_gen_dmb(AARCH64_INSN_MB_OSH));
 }
 EXPORT_SYMBOL(__io_nvidia_olympus_patch_dmb);
+
+/*
+ * Patch unsigned immediate loads to ordered loads for Arm erratum 832075.
+ * The immediate offset of the load MUST BE 0 for this to make any sense,
+ * as ordered loads do not encode any offset.
+ *
+ * This can patch 8, 16, 32 and 64 bits loads as they share the same encoding,
+ * with the two highest bits encoding size.
+ * See Arm ARM DDI 0487 C4.1 "Load/store register (unsigned immediate)" and
+ * "Load/store ordered" for the complete encodings.
+ */
+noinstr void __io_arm_a57_patch_ladr(struct alt_instr *alt, __le32 *origptr,
+				     __le32 *updptr, int nr_inst)
+{
+	u32 orinst, altinst;
+
+	BUG_ON(nr_inst != 1);
+
+	orinst = le32_to_cpu(origptr[0]);
+	BUG_ON(!aarch64_insn_is_load_imm(orinst));
+	BUG_ON((orinst & GENMASK(21, 10)) != 0);
+
+	/*
+	 * Preserve the size (31, 30) and registers (9,0) of the immediate load,
+	 * as they are encoded identically for ordered loads.
+	 */
+	altinst = orinst & ~GENMASK(29, 10);
+	/* The value defined in insn.h includes the RES1 bits and o0. */
+	altinst |= aarch64_insn_get_load_acq_value();
+
+	updptr[0] = cpu_to_le32(altinst);
+}
+EXPORT_SYMBOL(__io_arm_a57_patch_ladr);
-- 
2.43.0


