Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84941F357C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 06:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jiaoAkYnFIfav8MQS/Ep4+JlGC7BXoSWGRABnmAUPqo=; b=AcJaYkbjuiUfsWLtse79fHXZKS
	ewsQOcFMAcQ6ZNbU+5pjqAArAcdbBPSRiWPaeIqSOpeZYnzVodX0Ey31b/ptN8bDfQClCNioqCGkL
	5mgqqyeHQ1YF+UjLA7lisLV9aAbPT/3/PIgwQ05L+rfqInvIgtRHLjSD2ebky0KvbEq9gd4wyqN8j
	d/cL1d6NKxa23QI5ya8yG2cStQ5q7MSyI3E3faKuK8XAt0O2vff2Nu3lkGNDIUd9zxddVGUhemCtp
	3Fjpx3kR90SLZOCv+Dtc06a8viGXai3lP/ZMFhxWwSiFYKpZgsU/VAm25iD2fISiWEuCiFbMVKAXK
	CoKKelNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8Zd-00000003M2v-10Jb;
	Wed, 25 Feb 2026 06:40:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8Za-00000003M1w-3CZR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 06:40:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A56B165C;
	Tue, 24 Feb 2026 22:40:29 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78BD83F59E;
	Tue, 24 Feb 2026 22:40:34 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Describe TTBR1_BADDR_4852_OFFSET
Date: Wed, 25 Feb 2026 06:40:28 +0000
Message-Id: <20260225064028.1525192-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_224038_842879_E0618C60 
X-CRM114-Status: UNSURE (   8.56  )
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

TTBR1_BADDR_4852_OFFSET is a constant offset which gets added into kernel
page table physical address for TTBR1_EL1 when kernel is build for 52 bit
VA but found to be running on 48 bit VA capable system. Although there is
no explanation on how the macro is computed.

Describe TTBR1_BADDR_4852_OFFSET computation in detail via deriving from
all required parameters involved thus improving clarity and readability.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This applies on v7.0-rc1

Earlier context can be found here.

https://lore.kernel.org/linux-arm-kernel/aRb8ezhQd0c0jp9G@J2N7QTR9R3/

 arch/arm64/include/asm/pgtable-hwdef.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index 5e6809a462c7..72f31800c703 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -285,9 +285,12 @@
 #endif
 
 #ifdef CONFIG_ARM64_VA_BITS_52
+#define PTRS_PER_PGD_52_VA (UL(1) << (52 - PGDIR_SHIFT))
+#define PTRS_PER_PGD_48_VA (UL(1) << (48 - PGDIR_SHIFT))
+#define PTRS_PER_PGD_EXTRA (PTRS_PER_PGD_52_VA - PTRS_PER_PGD_48_VA)
+
 /* Must be at least 64-byte aligned to prevent corruption of the TTBR */
-#define TTBR1_BADDR_4852_OFFSET	(((UL(1) << (52 - PGDIR_SHIFT)) - \
-				 (UL(1) << (48 - PGDIR_SHIFT))) * 8)
+#define TTBR1_BADDR_4852_OFFSET (PTRS_PER_PGD_EXTRA << PTDESC_ORDER)
 #endif
 
 #endif
-- 
2.30.2


