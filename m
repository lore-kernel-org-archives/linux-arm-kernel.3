Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F6C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fo5GoDaPm0gIjYVqCGzA2mr+USoIG153jiLEzNpCVDE=; b=i5tjBlXwACsnJbnhMr0jdQ+ukJ
	f9FC+8WchoXHr5HrNPppdLKhiyNoiuJPeQeCPlKSTWXjvFea8ErSCqjIrnpx3YoMagvK3qOc5Khn2
	Yszyu3WNHael7nm92yi/n1OdcYJMI+VsY7hpnYsZ+ZAfmkHlggcX2N/ecn6T7n3mEcgyMLL1srVsl
	h/h9HRaym57HK3ZAlE4nbTqj2dkoRc+XpCOsARmXMtE93LmOi48bEGv1i/xPklTJ51qrkd0SOyhqg
	R7Uskr51Q+xNhO1jN8numYWccVl44YYfgwn9tu8VzcqVnKSWBDvI/gek35Rb3haHncveJc7ETQFN1
	6aSH/HBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBXF-00000002yHl-3s8l;
	Mon, 17 Mar 2025 14:33:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBLq-00000002uWR-2ej1;
	Mon, 17 Mar 2025 14:21:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24CC326BE;
	Mon, 17 Mar 2025 07:22:07 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F102B3F63F;
	Mon, 17 Mar 2025 07:21:53 -0700 (PDT)
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
	sparclinux@vger.kernel.org
Subject: [PATCH 06/11] mm: Skip ptlock_init() for kernel PMDs
Date: Mon, 17 Mar 2025 14:16:55 +0000
Message-ID: <20250317141700.3701581-7-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250317141700.3701581-1-kevin.brodsky@arm.com>
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_072158_716191_7903496C 
X-CRM114-Status: GOOD (  13.56  )
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

Split page table locks are not used for pgtables associated to
init_mm, at any level. pte_alloc_kernel() does not call
ptlock_init() as a result. There is however no separate alloc/free
functions for kernel PMDs, and pmd_ptlock_init() is called
unconditionally. When ALLOC_SPLIT_PTLOCKS is true (e.g. 32-bit
architectures or if CONFIG_PREEMPT_RT is selected), this results in
unnecessary dynamic memory allocation every time a kernel PMD is
allocated.

Now that pagetable_pmd_ctor() is passed the associated mm, we can
easily remove this overhead by skipping pmd_ptlock_init() if the
pgtable is associated to init_mm. No special-casing is needed on the
dtor path, as ptlock_free() is already called unconditionally for
all levels. (ptlock_free() is a no-op unless a ptlock was allocated
for the given PTP.)

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ee31ffd7ead2..4759da9cd633 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3125,7 +3125,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 static inline bool pagetable_pmd_ctor(struct mm_struct *mm,
 				      struct ptdesc *ptdesc)
 {
-	if (!pmd_ptlock_init(ptdesc))
+	if (mm != &init_mm && !pmd_ptlock_init(ptdesc))
 		return false;
 	ptdesc_pmd_pts_init(ptdesc);
 	__pagetable_ctor(ptdesc);
-- 
2.47.0


