Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E94ECCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ny/UlhGev9XIffWapemFIDNW2b3XExjC6+A948Cl3+s=; b=cw8MMcpIGyH4XWG/B39h+EvXJC
	ZkH/0G0Tzy1xAr6aoPutRRIhFqOPwW2iJNkJdvW0l3UuHZ0fMV+NYa5ToGoEysNBbnMDeu1xvPDCT
	IK6i5JDdh2VrKbytzhx/hJvB8rKAp467K1Fq7xDrJ9iHP4F4UNZ3OpJ5VY2/fhgBBKThVuUs0fL03
	W3cxiPytXM2qCFMj/WU/+Qh+C3YUOOQC+gYMQ5rmOXZyLh9CKj+PTOYhUMsbpkDaQeom3GEiGfUV5
	UMkSogs09y+lrDROpaAUJxhNIRnzD/MVBtaBS01lH66UnwsQyClJUcWfcGOn5fT1CcuPCX9YqDz/m
	YhG2QJrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5T-00000009Dxn-0Ezj;
	Mon, 03 Nov 2025 05:26:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5Q-00000009Dwc-3BAi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 05:26:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C7F228FA;
	Sun,  2 Nov 2025 21:26:28 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 037DA3F63F;
	Sun,  2 Nov 2025 21:26:34 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64/mm: Describe TTBR1_BADDR_4852_OFFSET
Date: Mon,  3 Nov 2025 05:26:18 +0000
Message-Id: <20251103052618.586763-7-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20251103052618.586763-1-anshuman.khandual@arm.com>
References: <20251103052618.586763-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_212636_840416_96843AF7 
X-CRM114-Status: UNSURE (   8.62  )
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
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index fb9f651375a9..e3d070fdae6a 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -350,9 +350,12 @@
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


