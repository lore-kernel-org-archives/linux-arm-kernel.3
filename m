Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47460CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3eUCNATmR45EHWbflje680/+PAcCJejlui61CBPKtrs=; b=rbV4/0BkvNITkzKfgG+EQk6OJB
	2NVTo4iP5JBjpfEvAbe7l/V0auy3k3b/klt6j3KRGAZdSo8zd6vApAGQoBcM648XlEqOpM2XozhBa
	bisWGeN+KScG8Rlci0nW5ihCoJ5Pnsuu8H/K7KHsFlfRGuzw3NOsTUwLRXqHrqGTt9UZQW/NPGbB3
	YUYXz/Gr3OvPn5uQp2iWy11lyyr2LdjYJOn6vlGGaRVarmtIw/EAP7e511Q4wlmUMNP9Xp2uW5fR0
	LtIcRjss+j8oHEW3tSB93g9QqWSjBY6kKfUcMYbccQ5rp+q/bfvfTlj828ltpwJZ52sH72F1wEz/B
	iTsrrlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cre-0000000G1lC-1mgI;
	Tue, 14 Oct 2025 11:06:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8crc-0000000G1jl-2Tdf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:06:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4E971A9A;
	Tue, 14 Oct 2025 04:06:33 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B5033F66E;
	Tue, 14 Oct 2025 04:06:40 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Add a fallback stub for pgd_page_paddr()
Date: Tue, 14 Oct 2025 12:06:33 +0100
Message-Id: <20251014110633.304961-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_040644_672297_D8622CB3 
X-CRM114-Status: UNSURE (   7.61  )
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

Add a fallback stub for pgd_page_paddr() when (PGTBALE_LEVELS <= 4) which
helps in intercepting any unintended usage and which is also in line with
existing stubs for similar [pud|p4d]_page_paddr() helpers.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index aa89c2e67ebc..fb34df92d159 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1212,6 +1212,8 @@ static inline p4d_t *p4d_offset_kimg(pgd_t *pgdp, u64 addr)
 
 static inline bool pgtable_l5_enabled(void) { return false; }
 
+#define pgd_page_paddr(pgd)	({ BUILD_BUG(); 0; })
+
 #define p4d_index(addr)		(((addr) >> P4D_SHIFT) & (PTRS_PER_P4D - 1))
 
 /* Match p4d_offset folding in <asm/generic/pgtable-nop4d.h> */
-- 
2.30.2


