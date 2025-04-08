Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A46C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xCdomzVQ9UKIUqSV0nOR1Orsi3U0kam6TrHTVmoiR4=; b=X0vneST8xjO2IRzlUqS8dsNF2w
	xMDIQC35Y02F8jnGHat3RjHEprz/Uqycjke2C51pQWarjp0GCcDNc+dLeAvfXAFjPD1BRT6glWhkv
	meRyyWhmSlbiir0+VWeWfyO/Cx6nO5KW8Iz4xevoJmD/1TADfjoGipCpX1u5mYkBtAhBv4xnuCxLg
	FTL/sglsSit33dXnEOybV+NJs3kmzIJrln9Y1LrCnjVogAC1jN+pouu9b3vWo4IKXaweqYD8NEz3w
	cEUtT050iXsRvnYPPmv4zUzNjEo6RYa+AAv3W8YrMNPmGPr+vMnvQzKX7aq0/kok8M1YIzQB0d/nT
	bn8I6M1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27aN-00000003urJ-1h97;
	Tue, 08 Apr 2025 11:57:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25eX-00000003WpA-3bGU;
	Tue, 08 Apr 2025 09:53:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D48D16A3;
	Tue,  8 Apr 2025 02:53:58 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DCDA3F6A8;
	Tue,  8 Apr 2025 02:53:52 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 10/12] riscv: mm: Clarify ctor mm argument in alloc_{pte,pmd}_late
Date: Tue,  8 Apr 2025 10:52:20 +0100
Message-ID: <20250408095222.860601-11-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250408095222.860601-1-kevin.brodsky@arm.com>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025357_953760_95240E6B 
X-CRM114-Status: GOOD (  15.14  )
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

pagetable_{pte,pmd}_ctor(mm, ptdesc) skip the ptlock initialisation
if mm is &init_mm. To avoid unnecessary overhead, it is therefore
preferable to pass the actual mm associated to the PTE/PMD.

Unfortunately, this proves challenging for alloc_{pte,pmd}_late() as
the associated mm is not available at the point where they are
called - in fact not even top-level functions like
create_pgd_mapping() are passed the mm. As a result they both call
the ctor with NULL as mm; this is safe but potentially wasteful.

This is not a new situation, but let's add a couple of comments to
clarify it.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/riscv/mm/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e5ef693fc778..59a982f88908 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -442,6 +442,11 @@ static phys_addr_t __meminit alloc_pte_late(uintptr_t va)
 {
 	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
+	/*
+	 * We do not know which mm the PTE page is associated to at this point.
+	 * Passing NULL to the ctor is the safe option, though it may result
+	 * in unnecessary work (e.g. initialising the ptlock for init_mm).
+	 */
 	BUG_ON(!ptdesc || !pagetable_pte_ctor(NULL, ptdesc));
 	return __pa((pte_t *)ptdesc_address(ptdesc));
 }
@@ -522,6 +527,7 @@ static phys_addr_t __meminit alloc_pmd_late(uintptr_t va)
 {
 	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
+	/* See comment in alloc_pte_late() regarding NULL passed the ctor */
 	BUG_ON(!ptdesc || !pagetable_pmd_ctor(NULL, ptdesc));
 	return __pa((pmd_t *)ptdesc_address(ptdesc));
 }
-- 
2.47.0


