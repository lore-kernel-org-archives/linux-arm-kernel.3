Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C50C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4hdF8NSlNiDKSW4k5s5KQn7s29HVgOVY53XC8RjHPXc=; b=Krlbu1EI5EUvCmMS43lJvgKKng
	m4QY5brNHLjMYnjV7lt3GBU6s+V3YlYarAwb+1aJl48NjLRAqP0ZE+IenILFw8dsJD8n4rGCF1vnV
	uf2R3XUAkl1ybewgKRhDAKO4dacsM7n2tihCqVJDyTt6FzwMGLEyXeznBIfHbhxTqdxjtIqgrkQ80
	5nofqC6nTM5KkMUW0vqZZep/6CiKc4ZG7Nm0fnfDBXfBlTFN+sG9nS80pPg5jhyouCHabw78mWu32
	Mzs4uPFVkF9G8Z0aZGxQsksVVw5LBWTSiozWi1tLFdRyx+jnYVxYmn8DJULiERirhRel4Wzo27+6B
	9C2Jow1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpvi-0000000AHhD-3XxV;
	Tue, 27 May 2025 08:45:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpdy-0000000AFZc-1Mhe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 08:26:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C34E14BF;
	Tue, 27 May 2025 01:26:25 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.85.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C2C23F5A1;
	Tue, 27 May 2025 01:26:37 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: david@redhat.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	mark.rutland@arm.com,
	yang@os.amperecomputing.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dev Jain <dev.jain@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] arm64: Restrict pagetable teardown to avoid false warning
Date: Tue, 27 May 2025 13:56:33 +0530
Message-Id: <20250527082633.61073-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_012642_406630_9E891125 
X-CRM114-Status: UNSURE (   9.69  )
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

Commit 9c006972c3fe removes the pxd_present() checks because the caller
checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
checks pud_present(); pud_free_pmd_page() recurses on each pmd through
pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
a pmd_present() check in pud_free_pmd_page().

This problem was found by code inspection.

Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table())
Cc: <stable@vger.kernel.org>
Reported-by: Ryan Roberts <ryan.roberts@arm.com> 
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
This patch is based on 6.15-rc6.

v2->v3:
 - Use pmdp_get()

v1->v2:
 - Enforce check in caller

 arch/arm64/mm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index ea6695d53fb9..5a9bf291c649 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1286,7 +1286,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 	next = addr;
 	end = addr + PUD_SIZE;
 	do {
-		pmd_free_pte_page(pmdp, next);
+		if (pmd_present(pmdp_get(pmdp)))
+			pmd_free_pte_page(pmdp, next);
 	} while (pmdp++, next += PMD_SIZE, next != end);
 
 	pud_clear(pudp);
-- 
2.30.2


