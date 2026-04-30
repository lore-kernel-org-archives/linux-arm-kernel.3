Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9C5FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 05:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jThLlSSXsylQBGgxGqp7bsPLq7wPVT1zS0ww5DZkl7c=; b=ldvttQQs/qM4x/WcS/4BtqElyP
	HG+PZsSy88IPz5QfgcdhREbxxT6Lfv78w4+2dxsq/XdZPfbVcbtFGFEyKo7GMUCIsSS5iKB0qD3U0
	eJ42YRbr05OqgdJW7hyUcmIXkpKKvHKml8mcL9Otwjbywf+iGyN8AgkHcAfDvHk0NsVQIcdMcuf0p
	8FZSZr4/SB9SkoajpD6E1hM3K2LXcV7CJ4nYiV+6MUW5YL7BCIiair0etgIuBAxWou2CPOR85gl9F
	M8A1JtWaJ62Zk5Rt7KDMdl6Ev9nTJKtZiAsbyPK1QB7v4DvppaDPwl6w7WT91N2qSip23SknpQv0z
	76Na1Wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIK7P-00000004imh-12vz;
	Thu, 30 Apr 2026 05:39:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIK7N-00000004imC-3RkV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 05:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jThLlSSXsylQBGgxGqp7bsPLq7wPVT1zS0ww5DZkl7c=; b=klQiIfmLoTfTI5x2okDzzqMV6V
	v/9+QfE0r74L5xQ5NbUZ3eVXbBw+epkus2JmjOlTgYHrqq/S7Nx2t8sW2Vd0N0aWPXXKfvJlhbEqP
	3DhHJPCwz2tRZ5OD/xaIkd2eBx+MlPUJTZAC5V3aIaHgdPLFYfZqg4yj6AofARMD0PWXsZ9ikyV3P
	WiACmy1iiXQUP6b16rBZnXvSAP0KYFlMuh8MvXYMncmsG1nL4OrEWtd6LQvviZO35MsgU73AYIw/4
	o3IQLuLMUarHhGh3SS3KMFSxbikOdo194ICAoTTltDiRVWdJp59cvkZYrAZUY4bpKZr/6SDXj/m+F
	XH0wdXXQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIK7J-00000006g7J-0rZz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 05:39:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3594B1A9A;
	Wed, 29 Apr 2026 22:39:07 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 786513F7B4;
	Wed, 29 Apr 2026 22:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777527552; bh=0bDVVElDdvtEASTlGqfKLB6MoSbVkPd+QhrYWN30FUs=;
	h=From:To:Cc:Subject:Date:From;
	b=SRdqVSHc4t46OQaHLg5HaRP57PpGqi6+1RpTZ/+OQGtVLltLy/8g1cxER/T81IGsM
	 K94t2UCG8JsjKcOf/jqDwQRItStYgtXE8rTh9iwdmd7aiR5IEhv2USNX9d9tSJkFXB
	 kIPmTZCnjMNs5cSQv7kqqB/SHrdisD51OZQQdsPI=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Replace BUG_ON() with VM_WARN_ON_ONCE()
Date: Thu, 30 Apr 2026 06:38:59 +0100
Message-Id: <20260430053859.890613-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_063918_131318_8EF9C0CB 
X-CRM114-Status: GOOD (  10.69  )
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

Avoid BUG_ON() while checking for inconsistent page table state conditions
and instead replace them with VM_WARN_ON_ONCE().

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v7.1-rc1

Took the liberty in including David's tag from an internal discussion.

Earlier context during D128 RFC review.

https://lore.kernel.org/all/d61a8e11-5b8c-4cea-a7f4-a890f65d62f4@kernel.org/

 arch/arm64/include/asm/pgtable.h |  4 ++--
 arch/arm64/mm/mmu.c              | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4dfa42b7d053..c9e4e00a9af2 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1007,7 +1007,7 @@ static inline pud_t *p4d_pgtable(p4d_t p4d)
 
 static inline phys_addr_t pud_offset_phys(p4d_t *p4dp, unsigned long addr)
 {
-	BUG_ON(!pgtable_l4_enabled());
+	VM_WARN_ON_ONCE(!pgtable_l4_enabled());
 
 	return p4d_page_paddr(READ_ONCE(*p4dp)) + pud_index(addr) * sizeof(pud_t);
 }
@@ -1130,7 +1130,7 @@ static inline p4d_t *pgd_to_folded_p4d(pgd_t *pgdp, unsigned long addr)
 
 static inline phys_addr_t p4d_offset_phys(pgd_t *pgdp, unsigned long addr)
 {
-	BUG_ON(!pgtable_l5_enabled());
+	VM_WARN_ON_ONCE(!pgtable_l5_enabled());
 
 	return pgd_page_paddr(READ_ONCE(*pgdp)) + p4d_index(addr) * sizeof(p4d_t);
 }
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dd85e093ffdb..4c8959153ac4 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -273,8 +273,8 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			if (ret)
 				return ret;
 
-			BUG_ON(pmd_val(old_pmd) != 0 &&
-			       pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
+			VM_WARN_ON_ONCE(pmd_val(old_pmd) != 0 &&
+					pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
 		}
 		phys += next - addr;
 	} while (pmdp++, addr = next, addr != end);
@@ -394,8 +394,8 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 			if (ret)
 				goto out;
 
-			BUG_ON(pud_val(old_pud) != 0 &&
-			       pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
+			VM_WARN_ON_ONCE(pud_val(old_pud) != 0 &&
+					pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
 		}
 		phys += next - addr;
 	} while (pudp++, addr = next, addr != end);
@@ -445,8 +445,8 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 		if (ret)
 			goto out;
 
-		BUG_ON(p4d_val(old_p4d) != 0 &&
-		       p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
+		VM_WARN_ON_ONCE(p4d_val(old_p4d) != 0 &&
+				p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
 
 		phys += next - addr;
 	} while (p4dp++, addr = next, addr != end);
-- 
2.30.2


