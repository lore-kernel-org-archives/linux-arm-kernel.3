Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40142C55ABE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=084TblpdN2KUOwJ3LunzqOQwaf+CoVtAlj7nsbQNgoI=; b=wfAWyTbsXY1ASk6UaTsjPSIktB
	lbHcgc/gkeLbOsXtB6Fd9AlIaSvoDqRmzZlnHPKQgDHkqiAyNoZRo7+hvhpvecn0DsSznbPAfJJWd
	wszLcrjA5FlqX5mqr9dvMvELQ+AJdnp0+6efObFf6PwS952GARxl6mrT/av9PQub9rgAOUxDLOlZC
	lDSBl1Gcldb29Cc2qXwfQeY0x8zhlgPp2nrxBE6SvEJzQaZ0wcax7bldhXNUJsX/0RzeuAaCbdRgS
	7Vz79PAKbaGZ1wq3D+Jn7dbyjQGOfpqotjVXubYQ++m7SOTOjUSgRTTUegYSKk+E7LdhBZdPTgnFq
	Ofd5Yopw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtR8b-0000000EhIU-11z1;
	Fri, 20 Feb 2026 14:05:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtR8X-0000000EhF4-1ZfH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:05:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CBAE41988;
	Fri, 20 Feb 2026 14:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A975CC19421;
	Fri, 20 Feb 2026 14:05:37 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/3] arm64: gcs: Do not set PTE_SHARED on GCS mappings if FEAT_LPA2 is enabled
Date: Fri, 20 Feb 2026 14:05:29 +0000
Message-ID: <20260220140532.285011-2-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220140532.285011-1-catalin.marinas@arm.com>
References: <20260220140532.285011-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_060541_456484_3F9400C5 
X-CRM114-Status: GOOD (  13.80  )
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
_PAGE_GCS{,_RO} definitions include the PTE_SHARED bits as 0b11 and they
match the other user _PAGE_* prot macros. However, the difference is
that all the classic prot values are accessed via protection_map[] and
have the PTE_SHARED bits removed when LPA2 is enabled.

Ensure that PAGE_GCS{,RO} use the dynamic PTE_MAYBE_SHARED instead of
the static PTE_SHARED.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Fixes: 6497b66ba694 ("arm64/mm: Map pages for guarded control stack")
Reported-by: Emanuele Rocca <emanuele.rocca@arm.com>
Cc: <stable@vger.kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/pgtable-prot.h | 4 ++--
 arch/arm64/mm/mmap.c                  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 161e8660eddd..a65f2c50e9ca 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -164,8 +164,8 @@ static inline bool __pure lpa2_is_enabled(void)
 #define _PAGE_GCS	(_PAGE_DEFAULT | PTE_NG | PTE_UXN | PTE_WRITE | PTE_USER)
 #define _PAGE_GCS_RO	(_PAGE_DEFAULT | PTE_NG | PTE_UXN | PTE_USER)
 
-#define PAGE_GCS	__pgprot(_PAGE_GCS)
-#define PAGE_GCS_RO	__pgprot(_PAGE_GCS_RO)
+#define PAGE_GCS	__pgprot((_PAGE_GCS & ~PTE_SHARED) | PTE_MAYBE_SHARED)
+#define PAGE_GCS_RO	__pgprot((_PAGE_GCS_RO & ~PTE_SHARED) | PTE_MAYBE_SHARED)
 
 #define PIE_E0	( \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_GCS)  | \
diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 08ee177432c2..2e404441063b 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -87,7 +87,7 @@ pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
 
 	/* Short circuit GCS to avoid bloating the table. */
 	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
-		prot = _PAGE_GCS_RO;
+		prot = pgprot_val(PAGE_GCS_RO);
 	} else {
 		prot = pgprot_val(protection_map[vm_flags &
 				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);

