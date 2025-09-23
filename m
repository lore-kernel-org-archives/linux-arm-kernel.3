Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE08CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0fsRj8Kbg0YwDCGy1uaBJYcA0zy5gcj8RY7k0/Au4A=; b=BeYlY7QSzHtSDF
	CV1dEGyxrNgTjdfAWqMnRnoIAIcfW9f3dqhXbgwWWMCtd/uEmE19BITKFAVafeFRQcn7eXTPRcuNd
	blPaLrhaR0CZUdgm8ZqKLEdxH/bJWKOpwT6WhjShivMrXQjdN4gkeifIQKkzvJJg9QRScBPNaSR1Y
	vJZZq0DD4NkGV8EmiyRr7S/sCTNQBL2tMHvmG179Z224AxrEYE91dJBrPow2sT2rGcuYyqHUGJLM4
	qQz8bvxUnqu8mFhyVdO3zsiEWhtKqmhewCqiF518x47CpB3FRanOyA7Xz0e1YtCglneadKXt5Bppu
	k5m6CjVgo40xNxwS/Qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v17AH-0000000EStZ-2ZGY;
	Tue, 23 Sep 2025 17:50:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179l-0000000ESMw-39XD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:50:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E32FCFEC;
	Tue, 23 Sep 2025 10:50:11 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0FD563F5A1;
	Tue, 23 Sep 2025 10:50:15 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 16/16] arm64/io: rework Cortex-A57 erratum 832075 to use callback
Date: Tue, 23 Sep 2025 18:49:03 +0100
Message-ID: <20250923174903.76283-17-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_105025_891608_3520C2F9 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kasan-dev@googlegroups.com, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Cortex-A57 erratum 832075 fix implemented by the kernel
replaces all device memory loads with their load-acquire versions.
By using simple instruction-level alternatives to replace the 13k+
instances of such loads, we add more than 50kB of data
to the `.altinstructions` section, and thus the kernel image.

Implement `alt_cb_patch_ldr_to_ldar()` as the alternative callback
to patch LDRs to device memory into LDARs and use it instead
of the alternative instructions.

This lightens the image by around 50kB as predicted, with the same result.

The new callback is safe to be used for alternatives as it is `noinstr`
and the `aarch64_insn_...` functions it uses have been made safe
in previous commits.

Add `alt_cb_patch_ldr_to_ldar()` to the nVHE namespace as
`__vgic_v2_perform_cpuif_access()` uses one of the patched functions.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/io.h    | 27 +++++++++++++++------------
 arch/arm64/kernel/image-vars.h |  1 +
 arch/arm64/kernel/io.c         | 21 +++++++++++++++++++++
 3 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 9b96840fb979..ec75bd0a9d76 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -50,13 +50,16 @@ static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 	asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
 }
 
+void noinstr alt_cb_patch_ldr_to_ldar(struct alt_instr *alt,
+			       __le32 *origptr, __le32 *updptr, int nr_inst);
+
 #define __raw_readb __raw_readb
 static __always_inline u8 __raw_readb(const volatile void __iomem *addr)
 {
 	u8 val;
-	asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
-				 "ldarb %w0, [%1]",
-				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+	asm volatile(ALTERNATIVE_CB("ldrb %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
+				 alt_cb_patch_ldr_to_ldar)
 		     : "=r" (val) : "r" (addr));
 	return val;
 }
@@ -66,9 +69,9 @@ static __always_inline u16 __raw_readw(const volatile void __iomem *addr)
 {
 	u16 val;
 
-	asm volatile(ALTERNATIVE("ldrh %w0, [%1]",
-				 "ldarh %w0, [%1]",
-				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+	asm volatile(ALTERNATIVE_CB("ldrh %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
+				 alt_cb_patch_ldr_to_ldar)
 		     : "=r" (val) : "r" (addr));
 	return val;
 }
@@ -77,9 +80,9 @@ static __always_inline u16 __raw_readw(const volatile void __iomem *addr)
 static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
 {
 	u32 val;
-	asm volatile(ALTERNATIVE("ldr %w0, [%1]",
-				 "ldar %w0, [%1]",
-				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+	asm volatile(ALTERNATIVE_CB("ldr %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
+				 alt_cb_patch_ldr_to_ldar)
 		     : "=r" (val) : "r" (addr));
 	return val;
 }
@@ -88,9 +91,9 @@ static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
 static __always_inline u64 __raw_readq(const volatile void __iomem *addr)
 {
 	u64 val;
-	asm volatile(ALTERNATIVE("ldr %0, [%1]",
-				 "ldar %0, [%1]",
-				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+	asm volatile(ALTERNATIVE_CB("ldr %0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
+				 alt_cb_patch_ldr_to_ldar)
 		     : "=r" (val) : "r" (addr));
 	return val;
 }
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 714b0b5ec5ac..43ac41f87229 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -91,6 +91,7 @@ KVM_NVHE_ALIAS(spectre_bhb_patch_loop_mitigation_enable);
 KVM_NVHE_ALIAS(spectre_bhb_patch_wa3);
 KVM_NVHE_ALIAS(spectre_bhb_patch_clearbhb);
 KVM_NVHE_ALIAS(alt_cb_patch_nops);
+KVM_NVHE_ALIAS(alt_cb_patch_ldr_to_ldar);
 
 /* Global kernel state accessed by nVHE hyp code. */
 KVM_NVHE_ALIAS(kvm_vgic_global_state);
diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
index fe86ada23c7d..d4dff119f78c 100644
--- a/arch/arm64/kernel/io.c
+++ b/arch/arm64/kernel/io.c
@@ -9,6 +9,27 @@
 #include <linux/types.h>
 #include <linux/io.h>
 
+noinstr void alt_cb_patch_ldr_to_ldar(struct alt_instr *alt,
+			       __le32 *origptr, __le32 *updptr, int nr_inst)
+{
+	u32 rt, rn, size, orinst, altinst;
+
+	BUG_ON(nr_inst != 1);
+
+	orinst = le32_to_cpu(origptr[0]);
+
+	rt = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RT, orinst);
+	rn = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RN, orinst);
+	/* The size field (31,30) matches the enum used in gen_load_acq below. */
+	size = orinst >> 30;
+
+	altinst = aarch64_insn_gen_load_acq_store_rel(rt, rn, size,
+		AARCH64_INSN_LDST_LOAD_ACQ);
+
+	updptr[0] = cpu_to_le32(altinst);
+}
+EXPORT_SYMBOL(alt_cb_patch_ldr_to_ldar);
+
 /*
  * This generates a memcpy that works on a from/to address which is aligned to
  * bits. Count is in terms of the number of bits sized quantities to copy. It
-- 
2.43.0


