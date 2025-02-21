Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F138C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 04:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XRdM35EWcC6rSKf6kLGDsD5DALec4FQYZaD8wn6BEo=; b=ljWUamCmJLVe1KxKBtzZqFRrlN
	7WMOfaV/S7x/DgYWFkvI+JsB16/RzJ2aE1DMNUvno7PQbU00LNJ8fjdd0PFAnalZCfZg3HZMmU2SA
	f5mQQKCuWH1soR3JGNIwXCxt3A69jF+cHem+G7pxc8M+ZHP+p7FE0DmyOPvREXMmi1vr3t3tuhDdG
	ZwvaqPX9Vb+DGNcrnu7rhkJ5x62jhU6X7c3cFtHOQDMKxXD+ATyWQ+Hv43+xwrP8pcSbzauUA3BW1
	M3SRQo8kuGHXxWgVWpnUHD0iyOFQiqpr9fBVwq93HpWzM98za0XsNosOHq5WKvWwkQFg+rtq0tnFP
	WM/DiyQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlL55-00000004ANI-2Opu;
	Fri, 21 Feb 2025 04:56:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKsj-000000048Mu-2yjz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 04:43:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A1DD271B;
	Thu, 20 Feb 2025 20:43:39 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DCE923F6A8;
	Thu, 20 Feb 2025 20:43:16 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 8/8] arm64/mm: Drop PXD_TABLE_BIT
Date: Fri, 21 Feb 2025 10:12:27 +0530
Message-Id: <20250221044227.1145393-9-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221044227.1145393-1-anshuman.khandual@arm.com>
References: <20250221044227.1145393-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_204321_792651_A26C89B6 
X-CRM114-Status: UNSURE (   8.03  )
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

Drop all PXD_TABLE_BIT macros as they are not used any more.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index a9136cc551cc..d2a13c329702 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -97,7 +97,6 @@
  * Level -1 descriptor (PGD).
  */
 #define PGD_TYPE_TABLE		(_AT(pgdval_t, 3) << 0)
-#define PGD_TABLE_BIT		(_AT(pgdval_t, 1) << 1)
 #define PGD_TYPE_MASK		(_AT(pgdval_t, 3) << 0)
 #define PGD_TABLE_AF		(_AT(pgdval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
 #define PGD_TABLE_PXN		(_AT(pgdval_t, 1) << 59)
@@ -107,7 +106,6 @@
  * Level 0 descriptor (P4D).
  */
 #define P4D_TYPE_TABLE		(_AT(p4dval_t, 3) << 0)
-#define P4D_TABLE_BIT		(_AT(p4dval_t, 1) << 1)
 #define P4D_TYPE_MASK		(_AT(p4dval_t, 3) << 0)
 #define P4D_TYPE_SECT		(_AT(p4dval_t, 1) << 0)
 #define P4D_SECT_RDONLY		(_AT(p4dval_t, 1) << 7)		/* AP[2] */
@@ -119,7 +117,6 @@
  * Level 1 descriptor (PUD).
  */
 #define PUD_TYPE_TABLE		(_AT(pudval_t, 3) << 0)
-#define PUD_TABLE_BIT		(_AT(pudval_t, 1) << 1)
 #define PUD_TYPE_MASK		(_AT(pudval_t, 3) << 0)
 #define PUD_TYPE_SECT		(_AT(pudval_t, 1) << 0)
 #define PUD_SECT_RDONLY		(_AT(pudval_t, 1) << 7)		/* AP[2] */
@@ -133,7 +130,6 @@
 #define PMD_TYPE_MASK		(_AT(pmdval_t, 3) << 0)
 #define PMD_TYPE_TABLE		(_AT(pmdval_t, 3) << 0)
 #define PMD_TYPE_SECT		(_AT(pmdval_t, 1) << 0)
-#define PMD_TABLE_BIT		(_AT(pmdval_t, 1) << 1)
 #define PMD_TABLE_AF		(_AT(pmdval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
 
 /*
@@ -162,7 +158,6 @@
 #define PTE_VALID		(_AT(pteval_t, 1) << 0)
 #define PTE_TYPE_MASK		(_AT(pteval_t, 3) << 0)
 #define PTE_TYPE_PAGE		(_AT(pteval_t, 3) << 0)
-#define PTE_TABLE_BIT		(_AT(pteval_t, 1) << 1)
 #define PTE_USER		(_AT(pteval_t, 1) << 6)		/* AP[1] */
 #define PTE_RDONLY		(_AT(pteval_t, 1) << 7)		/* AP[2] */
 #define PTE_SHARED		(_AT(pteval_t, 3) << 8)		/* SH[1:0], inner shareable */
-- 
2.25.1


