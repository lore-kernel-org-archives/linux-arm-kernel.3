Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B36CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yyvNGJmVN2kSFuq6ux0l5UbSPSuEETfXDjFUJLCe2hA=; b=nBk22iTm/iYoa1sc9L3zV42q38
	8CS/9gA2A0FArp39sjrbv+CX0W5dM03jE2RTtbNAoxpy8PKafiAXIHvrYqosZPJ8QZgFt0SKnGB47
	vkE+Pql5Z2rADn41v9qfPpUMBav8lkfexMqoYkE2I7QCcmp6cgPzkhSsIvnxZU9SMlbEyj8eKZ8x8
	VDsioxesU8wh2D28rVQi7Gw8cjo8Nke8AJF7tca4DE5QDkkDTY/sE1dI9mSfsDC+afeJ99NjmZT4c
	Ewxjt+yIagkHAthShATtSXU8WBNl5sf4kJ016dyhdzQQ5S18fgvLg1CXSqly4/lYY3DaDRd6OOTqi
	oQ2pM7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9jt-000000078eo-26Zo;
	Sat, 30 Aug 2025 00:46:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1M2-00000006IAY-1mJy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:49:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5299601BD;
	Fri, 29 Aug 2025 15:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F006C4CEF0;
	Fri, 29 Aug 2025 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756482569;
	bh=uc8p3aC/orxSrazIUkCslXAzTEufeR3tXSYzllXV/hY=;
	h=From:To:Cc:Subject:Date:From;
	b=cwkIXzN/v/E28su3XbViCIg82IG8EBxEz6WDxN3oZFfyf7EVSxZr/TyphDZKeu2T9
	 QMnkognR3FjzfCLA8N7zxaqGSERlbOmtMyPqe3Xefro81sucFwSSPd4ZnVFnLnLwC2
	 5pM4IOI2TcnqeB/EQiwEr82VGFu+OOfYoK+PcvfWSQZf/gE3SeU4Zc/Z3tLY5ujnVk
	 bL2qSRSqmTJ1/gdStZxE7zU4x0VyDfs+DTQbZ1Mpu28AQFwhNqOySN/xTswdAxqvsg
	 QziFUHKRr/zZnBUP7vSoV5EN8Rl+W5mHH+fX+AgngXd0v6VSM0tL0x5EvMuEm9et20
	 V2fa/biAaOZzQ==
From: Kees Cook <kees@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	James Morse <james.morse@arm.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dev Jain <dev.jain@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc function signature
Date: Fri, 29 Aug 2025 08:49:21 -0700
Message-Id: <20250829154913.work.943-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4495; i=kees@kernel.org; h=from:subject:message-id; bh=uc8p3aC/orxSrazIUkCslXAzTEufeR3tXSYzllXV/hY=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkbzzAc3+vq1b5NWP+dObefBodGiciG5X4tDNs7lFn9d /y6onOjo5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCJiZxn+meW6V0ySW7lJWoJ5 9Zs/fq1fPles32HruLLzkV6DWOF7TUaGtZKf/RL2THeRX7oi3vGtU0/ghwP8e8I6bG7OLV6ce3U dPwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

Seen during KPTI initialization:

  CFI failure at create_kpti_ng_temp_pgd+0x124/0xce8 (target: kpti_ng_pgd_alloc+0x0/0x14; expected type: 0xd61b88b6)

The call site is alloc_init_pud() at arch/arm64/mm/mmu.c:

  pud_phys = pgtable_alloc(TABLE_PUD);

alloc_init_pud() has the prototype:

  static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
                             phys_addr_t phys, pgprot_t prot,
                             phys_addr_t (*pgtable_alloc)(enum pgtable_type),
                             int flags)

where the pgtable_alloc() prototype is declared.

The target (kpti_ng_pgd_alloc) is used in arch/arm64/kernel/cpufeature.c:

  create_kpti_ng_temp_pgd(kpti_ng_temp_pgd, __pa(alloc), KPTI_NG_TEMP_VA,
                          PAGE_SIZE, PAGE_KERNEL, kpti_ng_pgd_alloc, 0);

which is an alias for __create_pgd_mapping_locked() with prototype:

  extern __alias(__create_pgd_mapping_locked)
  void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys,
                               unsigned long virt,
                               phys_addr_t size, pgprot_t prot,
                               phys_addr_t (*pgtable_alloc)(enum pgtable_type),
                               int flags);

__create_pgd_mapping_locked() passes the function pointer down:

  __create_pgd_mapping_locked() -> alloc_init_p4d() -> alloc_init_pud()

But the target function (kpti_ng_pgd_alloc) has the wrong signature:

  static phys_addr_t __init kpti_ng_pgd_alloc(int shift);

The "int" should be "enum pgtable_type".

To make "enum pgtable_type" available to cpufeature.c, move
enum pgtable_type definition from arch/arm64/mm/mmu.c to
arch/arm64/include/asm/mmu.h.

Adjust kpti_ng_pgd_alloc to use "enum pgtable_type" instead of "int".
The function behavior remains identical (parameter is unused).

Fixes: 47546a1912fc ("arm64: mm: install KPTI nG mappings with MMU enabled")
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yue Haibing <yuehaibing@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
---
 arch/arm64/include/asm/mmu.h   | 7 +++++++
 arch/arm64/kernel/cpufeature.c | 5 +++--
 arch/arm64/mm/mmu.c            | 7 -------
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 6e8aa8e72601..49f1a810df16 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -17,6 +17,13 @@
 #include <linux/refcount.h>
 #include <asm/cpufeature.h>
 
+enum pgtable_type {
+	TABLE_PTE,
+	TABLE_PMD,
+	TABLE_PUD,
+	TABLE_P4D,
+};
+
 typedef struct {
 	atomic64_t	id;
 #ifdef CONFIG_COMPAT
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9ad065f15f1d..e49d142a281f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -84,6 +84,7 @@
 #include <asm/hwcap.h>
 #include <asm/insn.h>
 #include <asm/kvm_host.h>
+#include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/mte.h>
 #include <asm/hypervisor.h>
@@ -1945,11 +1946,11 @@ static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
 extern
 void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
 			     phys_addr_t size, pgprot_t prot,
-			     phys_addr_t (*pgtable_alloc)(int), int flags);
+			     phys_addr_t (*pgtable_alloc)(enum pgtable_type), int flags);
 
 static phys_addr_t __initdata kpti_ng_temp_alloc;
 
-static phys_addr_t __init kpti_ng_pgd_alloc(int shift)
+static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
 {
 	kpti_ng_temp_alloc -= PAGE_SIZE;
 	return kpti_ng_temp_alloc;
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 34e5d78af076..183801520740 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -47,13 +47,6 @@
 #define NO_CONT_MAPPINGS	BIT(1)
 #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
 
-enum pgtable_type {
-	TABLE_PTE,
-	TABLE_PMD,
-	TABLE_PUD,
-	TABLE_P4D,
-};
-
 u64 kimage_voffset __ro_after_init;
 EXPORT_SYMBOL(kimage_voffset);
 
-- 
2.34.1


