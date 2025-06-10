Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D58BC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1QXmOyiY0LSh/xrauQefKLNjjRX7A1pCRathtoFzos=; b=EKM0anuQRzIgM59b61U2PbO36e
	dlAD+mGeameo+znMsbRWm0WOlHHu+S5xO5+5tiHvh9VXr0M7F/rXaiWFE/ozgu72L2QXEM3Yjgjp9
	rqPIBCRhwq4hm+m3e487mYLXfd4Sgy/F8DdOGwD0uxrX1vdnxollGLgC7CeKBNnNpVYQFNpDve7An
	R0PlPkKwRB/JvRegInW7HLs2aphM0vSDL0rPPrMwdutJpy07bpIUAyOy4fACPPv3fJHC6rP3eyNXA
	TyHr3i92kbTLA8kqpmIZmLT0NF3Yz7aRh8+pcLyDOEhjcms7qitRAPjXbHuZ8NNSv0LuEvL+c7AAp
	m1qqqHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3KB-00000007k94-2x7G;
	Tue, 10 Jun 2025 18:03:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0UB-00000007DNR-32Bm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:02:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3191916F8;
	Tue, 10 Jun 2025 08:01:35 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14AC03F59E;
	Tue, 10 Jun 2025 08:01:51 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 2/6] arm64: report address tag when FEAT_MTE_TAGGED_FAR is supported
Date: Tue, 10 Jun 2025 16:01:40 +0100
Message-Id: <20250610150144.2523945-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610150144.2523945-1-yeoreum.yun@arm.com>
References: <20250610150144.2523945-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_080159_848593_D058EB21 
X-CRM114-Status: GOOD (  17.51  )
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

If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault address
are preserved in response to synchronous tag check faults (SEGV_MTESERR).

This patch modifies below to support this feature:
  - Use the original FAR_EL1 value when an MTE tag check fault occurs,
    if ARM64_MTE_FAR is supported so that not only logical tag
    (bits 59:56) but also address tag (bits 63:60] being reported too.

  - Add HWCAP for mtefar to let user know bits 63:60 includes
    address tag information when when FEAT_MTE_TAGGED_FAR is supported.

Applications that require this information should install
a signal handler with the SA_EXPOSE_TAGBITS flag.
While this introduces a minor ABI change,
most applications do not set this flag and therefore will not be affected.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 Documentation/arch/arm64/elf_hwcaps.rst      |  3 +++
 Documentation/arch/arm64/tagged-pointers.rst | 11 ++++++-----
 arch/arm64/include/asm/hwcap.h               |  1 +
 arch/arm64/include/uapi/asm/hwcap.h          |  1 +
 arch/arm64/kernel/cpufeature.c               |  1 +
 arch/arm64/kernel/cpuinfo.c                  |  1 +
 arch/arm64/mm/fault.c                        |  7 +++++--
 7 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 69d7afe56853..358f5af035ff 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -435,6 +435,9 @@ HWCAP2_SME_SF8DP4
 HWCAP2_POE
     Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
 
+HWCAP3_MTE_FAR
+    Functionality implied by ID_AA64PFR2_EL1.MTEFAR == 0b0001.
+
 4. Unused AT_HWCAP bits
 -----------------------
 
diff --git a/Documentation/arch/arm64/tagged-pointers.rst b/Documentation/arch/arm64/tagged-pointers.rst
index 81b6c2a770dd..73c59a9c7a63 100644
--- a/Documentation/arch/arm64/tagged-pointers.rst
+++ b/Documentation/arch/arm64/tagged-pointers.rst
@@ -60,11 +60,12 @@ that signal handlers in applications making use of tags cannot rely
 on the tag information for user virtual addresses being maintained
 in these fields unless the flag was set.
 
-Due to architecture limitations, bits 63:60 of the fault address
-are not preserved in response to synchronous tag check faults
-(SEGV_MTESERR) even if SA_EXPOSE_TAGBITS was set. Applications should
-treat the values of these bits as undefined in order to accommodate
-future architecture revisions which may preserve the bits.
+If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault address
+are preserved in response to synchronous tag check faults (SEGV_MTESERR)
+otherwise not preserved even if SA_EXPOSE_TAGBITS was set.
+Applications should interpret the values of these bits based on
+the support for the 'mte_far' hwcap. If the support is not present,
+the values of these bits should be considered as undefined otherwise valid.
 
 For signals raised in response to watchpoint debug exceptions, the
 tag information will be preserved regardless of the SA_EXPOSE_TAGBITS
diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
index 1c3f9617d54f..28dd1ac29ecc 100644
--- a/arch/arm64/include/asm/hwcap.h
+++ b/arch/arm64/include/asm/hwcap.h
@@ -176,6 +176,7 @@
 #define KERNEL_HWCAP_POE		__khwcap2_feature(POE)
 
 #define __khwcap3_feature(x)		(const_ilog2(HWCAP3_ ## x) + 128)
+#define KERNEL_HWCAP_MTE_FAR		__khwcap3_feature(MTE_FAR)
 
 /*
  * This yields a mask that user programs can use to figure out what
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 705a7afa8e58..7d22527a7975 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -143,5 +143,6 @@
 /*
  * HWCAP3 flags - for AT_HWCAP3
  */
+#define HWCAP3_MTE_FAR		(1UL << 0)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index af6a6924a3e8..8a5284c733b7 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3219,6 +3219,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 #ifdef CONFIG_ARM64_MTE
 	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE2, CAP_HWCAP, KERNEL_HWCAP_MTE),
 	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE3, CAP_HWCAP, KERNEL_HWCAP_MTE3),
+	HWCAP_CAP(ID_AA64PFR2_EL1, MTEFAR, IMP, CAP_HWCAP, KERNEL_HWCAP_MTE_FAR),
 #endif /* CONFIG_ARM64_MTE */
 	HWCAP_CAP(ID_AA64MMFR0_EL1, ECV, IMP, CAP_HWCAP, KERNEL_HWCAP_ECV),
 	HWCAP_CAP(ID_AA64MMFR1_EL1, AFP, IMP, CAP_HWCAP, KERNEL_HWCAP_AFP),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index c1f2b6b04b41..e552cb305641 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -160,6 +160,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_SME_SFEXPA]	= "smesfexpa",
 	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
 	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
+	[KERNEL_HWCAP_MTE_FAR]		= "mtefar",
 };
 
 #ifdef CONFIG_COMPAT
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ec0a337891dd..f21d972f99b1 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -837,9 +837,12 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
 	/*
 	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
 	 * for tag check faults. Set them to corresponding bits in the untagged
-	 * address.
+	 * address if ARM64_MTE_FAR isn't supported.
+	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.
 	 */
-	far = (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
+	if (!cpus_have_cap(ARM64_MTE_FAR))
+		far = (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
+
 	do_bad_area(far, esr, regs);
 	return 0;
 }
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


