Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66BBD1CA26
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 04:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+tvdoH4uVpb+YaaI111ywFHqzEZz8wdnFE5X7H0r73k=; b=lF7vq0z7Nu8C6RCvy0F65BTDpi
	TV+tL0opejwjwT7po+eVUkV2fgWFh2EhDxhDtC0EWY26av5ZePFeHERJGbn7jNSb5+o99uS813+9r
	4WpepJHNeX3WuuZWSSLiEUi6Nx/a0U4M5BpJskmBXR03wHBXSNRpW+YzOnEJHYVCmTLGgPYOzpE3u
	jRabi8v30FnxvLjQpi1AKFbAt4NU7iuVEzmu1VtFdYxf6IZTJIJadZv0XSIyC9qmk+L776YkZFF8L
	wwCtob3SdeN4kRQrkrCRVHSv439dDceUthwR6TZIgpQW+FkQq7BjaCeGzkE/4z9x5cHBguM+1fnNf
	W8XjyvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8BQ5-0000000Ft39-47uS;
	Tue, 05 Nov 2024 04:43:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8BON-0000000FstD-1PEr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 04:42:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8F5DFEC;
	Mon,  4 Nov 2024 20:42:35 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.45.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F5073F66E;
	Mon,  4 Nov 2024 20:42:00 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/ptdump: Test both PTE_TABLE_BIT and PTE_VALID for block mappings
Date: Tue,  5 Nov 2024 10:11:54 +0530
Message-Id: <20241105044154.4064181-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_204211_435666_D8088CDB 
X-CRM114-Status: GOOD (  10.40  )
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

Test both PTE_TABLE_BIT and PTE_VALID for block mappings, similar to KVM S2
ptdump. This ensures consistency in identifying block mappings, both in the
S1 and the S2 page tables. Besides being kernel page tables, there will not
be any unmapped (!PTE_VALID) block mappings.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.12-rc6

 arch/arm64/mm/ptdump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 264c5f9b97d8..688fbe0271ca 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -80,10 +80,10 @@ static const struct ptdump_prot_bits pte_bits[] = {
 		.set	= "CON",
 		.clear	= "   ",
 	}, {
-		.mask	= PTE_TABLE_BIT,
-		.val	= PTE_TABLE_BIT,
-		.set	= "   ",
-		.clear	= "BLK",
+		.mask	= PTE_TABLE_BIT | PTE_VALID,
+		.val	= PTE_VALID,
+		.set	= "BLK",
+		.clear	= "   ",
 	}, {
 		.mask	= PTE_UXN,
 		.val	= PTE_UXN,
-- 
2.30.2


