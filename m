Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67859C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fBNFa7tAuwoEikRXlQI2xNYHRtLHUhDVeClGyKJ/EBI=; b=mFUFCHUWtwTDDR+oEM0oXPJdwo
	G8uOCdpQkPI2/wIglJlmMdGOPVU+qgDXELzZQQOFkRUs8maRz2G/q4L2fODpcKg1+bODFjGGPrzRB
	Sf2qEoUBaB9BlRaEASKPt+pjUphYwumz9olLTgLE1RYnJ/urD5wBxCsjHZNy0NHWUlky0h4vlIuhs
	GVEebFqCbF37crls69bsroAChP2K5oOL60gUVU8ENsD8UNM48tLCWXhoymw+Yn4MIonguW16ZLVWi
	4sKtfdxJwNGuJuKoxwMAh4vKZ7OAP1DpGQwwKN+skZpsexjpO5QCnHmXA6QUM85AiUSPRPvn6tFkL
	JA+JaMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMGG-000000083UK-1YYm;
	Tue, 18 Feb 2025 11:59:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLuB-00000007zFw-2tPY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:36:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58251152B;
	Tue, 18 Feb 2025 03:37:05 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.37.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C0A63F6A8;
	Tue, 18 Feb 2025 03:36:43 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64/hugetlb: Consistently use pud_sect_supported()
Date: Tue, 18 Feb 2025 17:06:39 +0530
Message-Id: <20250218113639.475947-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_033647_771488_19711A44 
X-CRM114-Status: UNSURE (   9.13  )
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

Let's be consistent in using pud_sect_supported() for PUD_SIZE sized pages.
Hence change hugetlb_mask_last_page() and arch_make_huge_pte() as required.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.14-rc3

Changes in V2:

- Added an warning when PUD_SIZE is requested but not supported per Ryan

Changes in V1:

https://lore.kernel.org/all/20250217065414.49489-1-anshuman.khandual@arm.com/

 arch/arm64/mm/hugetlbpage.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 98a2a0e64e25..1d89599a20d7 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -342,7 +342,9 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
 	switch (hp_size) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		return PGDIR_SIZE - PUD_SIZE;
+		if (pud_sect_supported())
+			return PGDIR_SIZE - PUD_SIZE;
+		break;
 #endif
 	case CONT_PMD_SIZE:
 		return PUD_SIZE - CONT_PMD_SIZE;
@@ -364,7 +366,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	switch (pagesize) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		entry = pud_pte(pud_mkhuge(pte_pud(entry)));
+		if (pud_sect_supported())
+			entry = pud_pte(pud_mkhuge(pte_pud(entry)));
+		else
+			pr_warn("%s: pud huge page not supported\n", __func__);
 		break;
 #endif
 	case CONT_PMD_SIZE:
-- 
2.30.2


