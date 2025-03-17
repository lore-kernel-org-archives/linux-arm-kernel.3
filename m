Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEF4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEBbZMuK7OXxaJSao4EKWfZ44UXf7uN/ZmWU7nnmgv8=; b=k3RH6GSW+7pDJoZvOTqFNJRYeL
	bP8nTGBKt99ubu259apQlTcgGlsTqmUrm4DvXxHhIX9Mkks+9Ej8nHhQyN1dTRj/S9OIP+Md7eouJ
	lgYonchJcQXBsi0+Z767zVAGJW3QJODVp0Bxdm6HiiMmDWEG4tfLFFuWHi1ZFpyFrPesuymExkJPt
	nNXvg+5G35wBtdWJe2GrPvZ7uSVHvDZ+aZCJWGL9HIiwYjwfOVIzWflor9XbzlPG0uBg3pm0UiQmB
	LGhSwAIZYka814EEeynN1f6eJlboEHO0cf3qaJFe1IO3UCVBqdgr5VIJPi+DlFf8T5UxoJj1Q67E5
	Hzk/1xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBSG-00000002wsw-3zoF;
	Mon, 17 Mar 2025 14:28:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBLc-00000002uKq-3Zuh;
	Mon, 17 Mar 2025 14:21:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67A932573;
	Mon, 17 Mar 2025 07:21:53 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FEA43F63F;
	Mon, 17 Mar 2025 07:21:40 -0700 (PDT)
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
Subject: [PATCH 03/11] m68k: mm: Call ctor/dtor for kernel PTEs
Date: Mon, 17 Mar 2025 14:16:52 +0000
Message-ID: <20250317141700.3701581-4-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250317141700.3701581-1-kevin.brodsky@arm.com>
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_072144_933584_9F20D593 
X-CRM114-Status: GOOD (  10.13  )
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

The generic implementation of pte_{alloc_one,free}_kernel now calls
the [cd]tor. Align the m68k/ColdFire implementation of those
functions by calling the [cd]tor explicitly.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/m68k/include/asm/mcf_pgalloc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
index 465a71101b7d..fc5454d37da3 100644
--- a/arch/m68k/include/asm/mcf_pgalloc.h
+++ b/arch/m68k/include/asm/mcf_pgalloc.h
@@ -7,7 +7,7 @@
 
 static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 {
-	pagetable_free(virt_to_ptdesc(pte));
+	pagetable_dtor_free(virt_to_ptdesc(pte));
 }
 
 extern const char bad_pmd_string[];
@@ -19,6 +19,10 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 	if (!ptdesc)
 		return NULL;
+	if (!pagetable_pte_ctor(mm, ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
+	}
 
 	return ptdesc_address(ptdesc);
 }
-- 
2.47.0


