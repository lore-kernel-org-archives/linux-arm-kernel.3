Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAFBEC1112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSmL5hZ/EpMyyGhPASL3gLo2jyEHZ13z4kEd0wL/Gls=; b=ab9j/RkHdVmAnOYKd9yUTKwS43
	7NMDeInF0hC/S01n4wcZ39WIHEM74OkVdc3/x6C+YEuWt1EyTXXql+5iSbUWG1mhvzjfuFsu4M5ab
	K43FY1gBYsES/V2h/uiJ+jsYPuy866S+IhuhPXZsubkSjH5CjzgEyMqV331zeVGrZDGVDXF/BdRAu
	grPPDax1wSzpXEOJG83Mnw52Cah0cKLzEiBv95lEBOT5HNf87yAlOi/oQcXmBy7UJ0bYKE/sATdBl
	UfTAJTbVcdVSobqZI6hBUjycoKN9e2Jf/RnznmbAkrI+5RjzKDG1YSExihUNfKdPIVOY/Hl1qRXW8
	voK35hlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua09-00000000oM3-2Olh;
	Mon, 23 Feb 2026 17:45:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua05-00000000oKU-0yma
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:45:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C10360145;
	Mon, 23 Feb 2026 17:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFE8C116D0;
	Mon, 23 Feb 2026 17:45:38 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 1/3] arm64: gcs: Do not set PTE_SHARED on GCS mappings if FEAT_LPA2 is enabled
Date: Mon, 23 Feb 2026 17:45:30 +0000
Message-ID: <20260223174533.1478164-2-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223174533.1478164-1-catalin.marinas@arm.com>
References: <20260223174533.1478164-1-catalin.marinas@arm.com>
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

When FEAT_LPA2 is enabled, bits 8-9 of the PTE replace the
shareability attribute with bits 50-51 of the output address. The
_PAGE_GCS{,_RO} definitions include the PTE_SHARED bits as 0b11 (this
matches the other _PAGE_* definitions) but using this macro directly
leads to the following panic when enabling GCS on a system/model with
LPA2:

  Unable to handle kernel paging request at virtual address fffff1ffc32d8008
  Mem abort info:
    ESR = 0x0000000096000004
    EC = 0x25: DABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
    FSC = 0x04: level 0 translation fault
  Data abort info:
    ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
    CM = 0, WnR = 0, TnD = 0, TagAccess = 0
    GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
  swapper pgtable: 4k pages, 52-bit VAs, pgdp=0000000060f4d000
  [fffff1ffc32d8008] pgd=100000006184b003, p4d=0000000000000000
  Internal error: Oops: 0000000096000004 [#1]  SMP
  CPU: 0 UID: 0 PID: 513 Comm: gcs_write_fault Tainted: G   M                7.0.0-rc1 #1 PREEMPT
  Tainted: [M]=MACHINE_CHECK
  Hardware name: QEMU QEMU Virtual Machine, BIOS 2025.02-8+deb13u1 11/08/2025
  pstate: 03402005 (nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
  pc : zap_huge_pmd+0x168/0x468
  lr : zap_huge_pmd+0x2c/0x468
  sp : ffff800080beb660
  x29: ffff800080beb660 x28: fff00000c2058180 x27: ffff800080beb898
  x26: fff00000c2058180 x25: ffff800080beb820 x24: 00c800010b600f41
  x23: ffffc1ffc30af1a8 x22: fff00000c2058180 x21: 0000ffff8dc00000
  x20: fff00000c2bc6370 x19: ffff800080beb898 x18: ffff800080bebb60
  x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000007
  x14: 000000000000000a x13: 0000aaaacbbbffff x12: 0000000000000000
  x11: 0000ffff8ddfffff x10: 00000000000001fe x9 : 0000ffff8ddfffff
  x8 : 0000ffff8de00000 x7 : 0000ffff8da00000 x6 : fff00000c2bc6370
  x5 : 0000ffff8da00000 x4 : 000000010b600000 x3 : ffffc1ffc0000000
  x2 : fff00000c2058180 x1 : fffff1ffc32d8000 x0 : 000000c00010b600
  Call trace:
   zap_huge_pmd+0x168/0x468 (P)
   unmap_page_range+0xd70/0x1560
   unmap_single_vma+0x48/0x80
   unmap_vmas+0x90/0x180
   unmap_region+0x88/0xe4
   vms_complete_munmap_vmas+0xf8/0x1e0
   do_vmi_align_munmap+0x158/0x180
   do_vmi_munmap+0xac/0x160
   __vm_munmap+0xb0/0x138
   vm_munmap+0x14/0x20
   gcs_free+0x70/0x80
   mm_release+0x1c/0xc8
   exit_mm_release+0x28/0x38
   do_exit+0x190/0x8ec
   do_group_exit+0x34/0x90
   get_signal+0x794/0x858
   arch_do_signal_or_restart+0x11c/0x3e0
   exit_to_user_mode_loop+0x10c/0x17c
   el0_da+0x8c/0x9c
   el0t_64_sync_handler+0xd0/0xf0
   el0t_64_sync+0x198/0x19c
  Code: aa1603e2 d34cfc00 cb813001 8b011861 (f9400420)

Similarly to how the kernel handles protection_map[], use a
gcs_page_prot variable to store the protection bits and clear PTE_SHARED
if LPA2 is enabled.

Also remove the unused PAGE_GCS{,_RO} macros.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Fixes: 6497b66ba694 ("arm64/mm: Map pages for guarded control stack")
Reported-by: Emanuele Rocca <emanuele.rocca@arm.com>
Cc: <stable@vger.kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/pgtable-prot.h | 3 ---
 arch/arm64/mm/mmap.c                  | 8 ++++++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index d27e8872fe3c..2b32639160de 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -164,9 +164,6 @@ static inline bool __pure lpa2_is_enabled(void)
 #define _PAGE_GCS	(_PAGE_DEFAULT | PTE_NG | PTE_UXN | PTE_WRITE | PTE_USER)
 #define _PAGE_GCS_RO	(_PAGE_DEFAULT | PTE_NG | PTE_UXN | PTE_USER)
 
-#define PAGE_GCS	__pgprot(_PAGE_GCS)
-#define PAGE_GCS_RO	__pgprot(_PAGE_GCS_RO)
-
 #define PIE_E0	( \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_GCS)  | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_R)   | \
diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 08ee177432c2..75f343009b4b 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -34,6 +34,8 @@ static pgprot_t protection_map[16] __ro_after_init = {
 	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_EXEC
 };
 
+static ptdesc_t gcs_page_prot __ro_after_init = _PAGE_GCS_RO;
+
 /*
  * You really shouldn't be using read() or write() on /dev/mem.  This might go
  * away in the future.
@@ -73,9 +75,11 @@ static int __init adjust_protection_map(void)
 		protection_map[VM_EXEC | VM_SHARED] = PAGE_EXECONLY;
 	}
 
-	if (lpa2_is_enabled())
+	if (lpa2_is_enabled()) {
 		for (int i = 0; i < ARRAY_SIZE(protection_map); i++)
 			pgprot_val(protection_map[i]) &= ~PTE_SHARED;
+		gcs_page_prot &= ~PTE_SHARED;
+	}
 
 	return 0;
 }
@@ -87,7 +91,7 @@ pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
 
 	/* Short circuit GCS to avoid bloating the table. */
 	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
-		prot = _PAGE_GCS_RO;
+		prot = gcs_page_prot;
 	} else {
 		prot = pgprot_val(protection_map[vm_flags &
 				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);

