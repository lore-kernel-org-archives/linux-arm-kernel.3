Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4B8CF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 06:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0qjYSOxsn6TWzvyJ7x55MZr6amw58Vpc0RF4IQkKW90=; b=QGJlzA94N2fZLWYMUiH7stqwKm
	bopT1qSaoqxETRUj7dNEkVnu6Pgr1SKybGRRcoiYCelPYZCt/ZQQ3QqXL4m7spXAb6BZcprhrhrG0
	QoFc/DyOxz1nRFoMamWVyabDZdlj2gb4lrrIYBvamQH6SNYY6XlmAnTjmk8Sl+OS+EXLY7m5at5MF
	M3cV731en20OHVH0ECBiKyMx79MrF7uy9V8+Z7ZtYSbgUpQlwlW84FR6YsFyMpOhrCOEg+l9E1Hlx
	evFOQlnPGamSwuxJADNO1tVD/7hc6whL+G+AbjPvLVDMiz8qcP7DyKoCfB9VyWwa032hplzc4KLSB
	jzoThmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdMqC-0000000ECib-24ey;
	Wed, 07 Jan 2026 06:16:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdMq9-0000000ECiE-03bF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 06:16:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 441C6497;
	Tue,  6 Jan 2026 22:16:06 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04FD43F694;
	Tue,  6 Jan 2026 22:16:11 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Assert NR_BM_PUD_TABLES for bm_pud[]
Date: Wed,  7 Jan 2026 06:16:06 +0000
Message-Id: <20260107061606.3160088-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_221617_117979_05A7FC17 
X-CRM114-Status: UNSURE (   8.09  )
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

There is an implicit assumption about bm_pud[] being single entry PUD table
just like bp_pmd[] which is a single entry PMD table. Though only the later
gets asserted via NR_BM_PMD_TABLES. Hence let's add a similar check for PUD
table as well.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/fixmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index c5c5425791da..e02594be8b8e 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -23,8 +23,11 @@ static_assert(FIXADDR_TOT_START > PCI_IO_END);
 	SPAN_NR_ENTRIES(FIXADDR_TOT_START, FIXADDR_TOP, PMD_SHIFT)
 #define NR_BM_PMD_TABLES \
 	SPAN_NR_ENTRIES(FIXADDR_TOT_START, FIXADDR_TOP, PUD_SHIFT)
+#define NR_BM_PUD_TABLES \
+	SPAN_NR_ENTRIES(FIXADDR_TOT_START, FIXADDR_TOP, P4D_SHIFT)
 
 static_assert(NR_BM_PMD_TABLES == 1);
+static_assert(NR_BM_PUD_TABLES == 1);
 
 #define __BM_TABLE_IDX(addr, shift) \
 	(((addr) >> (shift)) - (FIXADDR_TOT_START >> (shift)))
-- 
2.30.2


