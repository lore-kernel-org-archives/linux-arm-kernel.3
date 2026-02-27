Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B196FEFB72
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZAY8PrMrhuZaUeuchgM/SkRiM1r6YDBw5eo9d2XljY=; b=p7aaAVWml3o8yx+rduGmO9gGcf
	myp3d2/TCLzzdc7901elTN+p238UDeyZfiXBiVTSwuBGidd0MnaPgyyKbyxPZoH278trtypFWVbSr
	x4tMBz3aGaRthP3rJftAS5zmWKHKtY3ZNyEKNlVT9AqrIa44mTXbLeXOTfmFjrbWQkguhq4uoxdzZ
	+2mgcOv2IhXMvr2qJ5Ltm8jlaopVe/yrK8MLGrwULS80yFc+PFqwSxV9JT6nK9AgX8snZUOA5wvY6
	wF7IoTEVfzX+HroEM3jkrrUFbE90VB0GizAoiHZZF4OlJR4EHraJ2Sa0D5Y65Mwog7XDr1qtKLC6T
	iEeOW4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw26G-00000008sFe-0Tqx;
	Fri, 27 Feb 2026 17:58:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw26E-00000008sCY-27dT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 17:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YZAY8PrMrhuZaUeuchgM/SkRiM1r6YDBw5eo9d2XljY=; b=KAVWvNvuYNILOlnDEJBUWva3hK
	dE0p2XJCj3vMMLKKWLkWse7JPyHnE0Q0yZUHp+VA1O++/QKpBnTW1y9xtDlbYE8kEN41zDEMkbL8B
	HSKtpdIX2upP1Pj/uGW1brTaXQrc+QigWTeStUbgklprFh0wszWa3wNmHbcaipS85LTojEjpCu8fC
	k6CV/+7XZi/FSDNiRBavCEc1P0XLpRkHxGZUsSWehU3Jna8turFs8IIfSphaIKVe0g4ed9GXmnKZk
	fRg3kWEZP3a4EjON39yZ7sJSXhWyPhhcWbuf0wmvIP0gM3ubWZ/XJOfr3UMqWIN/uuIalmPwcs5dk
	aoDilzWg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw25u-0000000DdSd-1m0q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:57:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F69A176B;
	Fri, 27 Feb 2026 09:57:34 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C9833F73B;
	Fri, 27 Feb 2026 09:57:36 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v6 25/30] arm64: kpkeys: Protect early page tables
Date: Fri, 27 Feb 2026 17:55:13 +0000
Message-ID: <20260227175518.3728055-26-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227175518.3728055-1-kevin.brodsky@arm.com>
References: <20260227175518.3728055-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_175755_702157_A2272C6F 
X-CRM114-Status: GOOD (  12.70  )
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

Use the dedicated kpkeys allocator for early page tables (used to create
the linear map) when the kpkeys_hardened_pgtables feature is enabled.

CPU features have not been detected at this stage so we use the
early helper arm64_supports_kpkeys_hardened_pgtables(). This is not
a concern as kpkeys_physmem_pgtable_alloc() does not itself use POE
or set_memory_pkey().

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/mm/mmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 2cee0b7f8a56..7072d5ac0579 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -116,8 +116,11 @@ static phys_addr_t __init early_pgtable_alloc(enum pgtable_type pgtable_type)
 {
 	phys_addr_t phys;
 
-	phys = memblock_phys_alloc_range(PAGE_SIZE, PAGE_SIZE, 0,
-					 MEMBLOCK_ALLOC_NOLEAKTRACE);
+	if (arm64_supports_kpkeys_hardened_pgtables())
+		phys = kpkeys_physmem_pgtable_alloc();
+	else
+		phys = memblock_phys_alloc_range(PAGE_SIZE, PAGE_SIZE, 0,
+						 MEMBLOCK_ALLOC_NOLEAKTRACE);
 	if (!phys)
 		panic("Failed to allocate page table page\n");
 
-- 
2.51.2


