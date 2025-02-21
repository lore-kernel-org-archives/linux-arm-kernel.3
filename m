Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DCBC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3ZXKha6TwqOfxYElXEi45MhP72KhDx7Uxc2FuS6SU8=; b=JW/puNQh5/4ZAeNH/PB8oln5eW
	c+eHHGkWQsLgmv5DStdC7JEOXU+CXhtMG3/5NRfAvY4ySKEw6VENF/Rq49BACmxl6SSLmKL39vcvl
	h+qXGkwTI6bu4R4vSpLlrBK87sT67klWT3iW4Poce+OivvH2EEXnQplt2mCvtcY4OOOq2Cozp+5AS
	E6oOpuDNOy5XD+U4368h21PHO7pTj4IKFZZZbTQCa8r+ifjKfIWhM2d9DvJnpKoRXvBSx98y8YGe5
	zNfk4Rif/BveGCc691h58wcBDI2VFOdKixVSH+tXnOqJDaAR/CfiFYlBykJeIMWijBuCPzH5OceUi
	o3p2oTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPvD-000000054E9-0mIw;
	Fri, 21 Feb 2025 10:06:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPag-00000004zg0-0mIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:45:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77981113E;
	Fri, 21 Feb 2025 01:45:19 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 999703F59E;
	Fri, 21 Feb 2025 01:44:58 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64/mm/hotplug: Drop redundant [pgd|p4d]_present()
Date: Fri, 21 Feb 2025 15:14:48 +0530
Message-Id: <20250221094449.1188427-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221094449.1188427-1-anshuman.khandual@arm.com>
References: <20250221094449.1188427-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_014502_269791_1F1942E2 
X-CRM114-Status: UNSURE (   7.78  )
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

[pgd|p4d]_present() are inverse to their corresponding [pgd|p4d]_none(). So
[pgd|p4d]_present() test right after corresponding [pgd|p4d]_none() inverse
test does not make sense. Hence just drop these redundant checks.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/mmu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b4df5bc5b1b8..66906c45c7f6 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -952,7 +952,6 @@ static void unmap_hotplug_p4d_range(pgd_t *pgdp, unsigned long addr,
 		if (p4d_none(p4d))
 			continue;
 
-		WARN_ON(!p4d_present(p4d));
 		unmap_hotplug_pud_range(p4dp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
@@ -978,7 +977,6 @@ static void unmap_hotplug_range(unsigned long addr, unsigned long end,
 		if (pgd_none(pgd))
 			continue;
 
-		WARN_ON(!pgd_present(pgd));
 		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
@@ -1114,7 +1112,6 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
 		if (p4d_none(p4d))
 			continue;
 
-		WARN_ON(!p4d_present(p4d));
 		free_empty_pud_table(p4dp, addr, next, floor, ceiling);
 	} while (addr = next, addr < end);
 
@@ -1153,7 +1150,6 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
 		if (pgd_none(pgd))
 			continue;
 
-		WARN_ON(!pgd_present(pgd));
 		free_empty_p4d_table(pgdp, addr, next, floor, ceiling);
 	} while (addr = next, addr < end);
 }
-- 
2.30.2


