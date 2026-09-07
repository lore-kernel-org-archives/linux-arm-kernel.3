Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805E9C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 03:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lVshiSVFZ9Y82hpOELbFUOQ47Aud6N74VG1d7Ctjwk=; b=rCdYFeN/nIRcT270nqsKyVoEIG
	/K0MzP5DKDGm8wgal05MtgvrOQGvoDocYZW+PAY+BAkFT8gIceSgr7bYC03RnwpLuyzQhOYoksIdQ
	QXC54QNlObumsQzCgXcIKadFBexZIwEqRJ73D6nvbKRtAND9dU1qKetbFHU8bT20szV42dSz8ISli
	vLRzt7cRgCoD3a73YG3vjr8GBLnta6Hcob+p3GvxgleC9gofaVTSBbnE663KL919LLEi7yYtuE41v
	kusDctxbZJd93qpDkl3frh+RFE6yQdu6U/qKlym08NN4SKUfb9NWS5GiAgKNuadxaUhKk5O/VRMMq
	Tklflh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QNm-00000005nek-0erO;
	Mon, 07 Sep 2026 03:50:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QNj-00000005nd0-35K9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 03:50:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5DE61477;
	Sun,  6 Sep 2026 20:50:49 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB6B53F7B4;
	Sun,  6 Sep 2026 20:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753053; bh=/rjGzAt748dsaT36LBnwBIEZW4gfjkEspNbbmVlfxKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sMy811HEo7xsqsm1p6JcAzLBb1J9PIdm3/h3H35Mn7WqMv0uYuDIVHpZ3IQqhy+bA
	 sWeT+NJFvEID6NFJBlSkLv1xwq/uGZiqo3RpydBbivEGHiwYUfOgUUsd4NohfsU0vo
	 apZdfIn31OFzbtwwAWTrajkO9WPqqLFAmPjA/4BU=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V2 05/14] arm64/mm: Override read-write accessors for vm_page_prot
Date: Mon,  7 Sep 2026 09:20:20 +0530
Message-ID: <20260907035030.2839978-6-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907035030.2839978-1-anshuman.khandual@arm.com>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_205055_977737_EFEAABA5 
X-CRM114-Status: UNSURE (   8.76  )
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

Override pgprot_[read|write]() accessors using ptval_[get|set]() providing
required single copy atomic operation for vma->vm_page_prot.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 66bf5bbe484e..2b457db19be0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -122,6 +122,18 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
 	return ptval_get(*pgdp);
 }
 
+#define pgprot_read pgprot_read
+static inline pgprot_t pgprot_read(pgprot_t *prot)
+{
+	return ptval_get(*prot);
+}
+
+#define pgprot_write pgprot_write
+static inline void pgprot_write(pgprot_t *prot, pgprot_t val)
+{
+	ptval_set(*prot, val);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 
-- 
2.43.0


