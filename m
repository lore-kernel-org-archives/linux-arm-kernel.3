Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5627CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zm+r2dDgV4nMUmEMJT0HcwYEH/ZhjmjJBBhbxhrMJ8Y=; b=C0+3jVyJBuDUX5R4chPcTa6FfA
	0n/bI75vGL+W35F0ZUwZZAJHOZFiwISNPP5uZDeR7EwVXM6JQuFz7T3/lpJmObzx2/ogziArT03O4
	Y7ROfR57gqiquz+tOFd+yvdJpHqMJGs3PX4ZnZq2f2MY0gFGgqC8JVnUvrY7jBN9AmWUQTqnyqmin
	SjvOr0JIwxB4ULy51Vnayq8bYn2Y8QQrqOv3039sYvv+mgpRf3gwMbxdBO+25vMqcJsUKJ/g6lBrw
	SBu14CkZbtPGnZjyCLj9LP8rsQyAy+9guXnD277wl9/mxnqKAXkmQrsz8WyrDp7e3Cw9bJOAJ5QvA
	QIbP6B0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGalV-00000006yYd-23YS;
	Sun, 18 May 2025 09:57:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGajV-00000006yQG-2OxH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 09:55:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C250E169C;
	Sun, 18 May 2025 02:54:47 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.82.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DF0613F5A1;
	Sun, 18 May 2025 02:54:56 -0700 (PDT)
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
Subject: [PATCH v2] arm64: Restrict pagetable teardown to avoid false warning
Date: Sun, 18 May 2025 15:24:45 +0530
Message-Id: <20250518095445.31044-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_025501_660373_1130CFB5 
X-CRM114-Status: UNSURE (   9.51  )
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

This patch is based on 6.15-rc6.

Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table())

Cc: <stable@vger.kernel.org>
Reported-by: Ryan Roberts <ryan.roberts@arm.com> 
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
v1->v2:
 - Enforce check in caller

 arch/arm64/mm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index ea6695d53fb9..5b1f4cd238ca 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1286,7 +1286,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 	next = addr;
 	end = addr + PUD_SIZE;
 	do {
-		pmd_free_pte_page(pmdp, next);
+		if (pmd_present(*pmdp))
+			pmd_free_pte_page(pmdp, next);
 	} while (pmdp++, next += PMD_SIZE, next != end);
 
 	pud_clear(pudp);
-- 
2.30.2


