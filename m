Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEFEF46101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEzLunftLQ4lcxC/KKn/gZA1wrLADhvcv5e1Vq/XxcI=; b=kJKr8IJaMxncOIdDWV6uhQDpry
	/H7b4NLdyW4OUCYUqsGOl/XGXmctzBNBsaTL/yMni8eanJBVLFmkkG8V5l7TduR3x+30hloWJyFqK
	W5AfngMzHJ+ciwqay9wDBJEUQ+do3Ra6CCQC00LuOU1CPUHmxZtlwUbyVu4BDTNQS+RgnlPSg6LVY
	OZcuLjt0tDFGlRGS9gg2ZMoHhQf/7xhwTZ6BlaUvULKKwVgM56jMmDQ3WKVheWoaa0nMd8qTas0HR
	fdOmeAJsMVXI8pzckfVNJsqGYK2TuxiPPYvl5sZ1/KV56e1zcOM0DB84ZMGuEQnaTiuZXpGPqTyz4
	L90wYX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ewT-0000000Gk6J-0o8K;
	Mon, 23 Mar 2026 13:03:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ewQ-0000000Gk4N-3QoD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:03:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3710B1516;
	Mon, 23 Mar 2026 06:03:25 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 770CD3F885;
	Mon, 23 Mar 2026 06:03:29 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 1/3] arm64: mm: Fix rodata=full block mapping support for realm guests
Date: Mon, 23 Mar 2026 13:03:13 +0000
Message-ID: <20260323130317.1737522-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323130317.1737522-1-ryan.roberts@arm.com>
References: <20260323130317.1737522-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_060334_941375_3A995738 
X-CRM114-Status: GOOD (  26.17  )
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

Commit a166563e7ec37 ("arm64: mm: support large block mapping when
rodata=full") enabled the linear map to be mapped by block/cont while
still allowing granular permission changes on BBML2_NOABORT systems by
lazily splitting the live mappings. This mechanism was intended to be
usable by realm guests since they need to dynamically share dma buffers
with the host by "decrypting" them - which for Arm CCA, means marking
them as shared in the page tables.

However, it turns out that the mechanism was failing for realm guests
because realms need to share their dma buffers (via
__set_memory_enc_dec()) much earlier during boot than
split_kernel_leaf_mapping() was able to handle. The report linked below
showed that GIC's ITS was one such user. But during the investigation I
found other callsites that could not meet the
split_kernel_leaf_mapping() constraints.

The problem is that we block map the linear map based on the boot CPU
supporting BBML2_NOABORT, then check that all the other CPUs support it
too when finalizing the caps. If they don't, then we stop_machine() and
split to ptes. For safety, split_kernel_leaf_mapping() previously
wouldn't permit splitting until after the caps were finalized. That
ensured that if any secondary cpus were running that didn't support
BBML2_NOABORT, we wouldn't risk breaking them.

I've fix this problem by reducing the black-out window where we refuse
to split; there are now 2 windows. The first is from T0 until the page
allocator is inititialized. Splitting allocates memory for the page
allocator so it must be in use. The second covers the period between
starting to online the secondary cpus until the system caps are
finalized (this is a very small window).

All of the problematic callers are calling __set_memory_enc_dec() before
the secondary cpus come online, so this solves the problem. However, one
of these callers, swiotlb_update_mem_attributes(), was trying to split
before the page allocator was initialized. So I have moved this call
from arch_mm_preinit() to mem_init(), which solves the ordering issue.

I've added warnings and return an error if any attempt is made to split
in the black-out windows.

Note there are other issues which prevent booting all the way to user
space, which will be fixed in subsequent patches.

Reported-by: Jinjiang Tu <tujinjiang@huawei.com>
Closes: https://lore.kernel.org/all/0b2a4ae5-fc51-4d77-b177-b2e9db74f11d@huawei.com/
Fixes: a166563e7ec37 ("arm64: mm: support large block mapping when rodata=full")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/init.c |  9 ++++++++-
 arch/arm64/mm/mmu.c  | 35 +++++++++++++++++++++++++++--------
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 96711b8578fd0..b9b248d24fd10 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -350,7 +350,6 @@ void __init arch_mm_preinit(void)
 	}
 
 	swiotlb_init(swiotlb, flags);
-	swiotlb_update_mem_attributes();
 
 	/*
 	 * Check boundaries twice: Some fundamental inconsistencies can be
@@ -377,6 +376,14 @@ void __init arch_mm_preinit(void)
 	}
 }
 
+bool page_alloc_available __ro_after_init;
+
+void __init mem_init(void)
+{
+	page_alloc_available = true;
+	swiotlb_update_mem_attributes();
+}
+
 void free_initmem(void)
 {
 	void *lm_init_begin = lm_alias(__init_begin);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a6a00accf4f93..5b6a8d53e64b7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -773,14 +773,33 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
 {
 	int ret;
 
-	/*
-	 * !BBML2_NOABORT systems should not be trying to change permissions on
-	 * anything that is not pte-mapped in the first place. Just return early
-	 * and let the permission change code raise a warning if not already
-	 * pte-mapped.
-	 */
-	if (!system_supports_bbml2_noabort())
-		return 0;
+	if (!system_supports_bbml2_noabort()) {
+		/*
+		 * !BBML2_NOABORT systems should not be trying to change
+		 * permissions on anything that is not pte-mapped in the first
+		 * place. Just return early and let the permission change code
+		 * raise a warning if not already pte-mapped.
+		 */
+		if (system_capabilities_finalized() ||
+		    !cpu_supports_bbml2_noabort())
+			return 0;
+
+		/*
+		 * Boot-time: split_kernel_leaf_mapping_locked() allocates from
+		 * page allocator. Can't split until it's available.
+		 */
+		extern bool page_alloc_available;
+		if (WARN_ON(!page_alloc_available))
+			return -EBUSY;
+
+		/*
+		 * Boot-time: Started secondary cpus but don't know if they
+		 * support BBML2_NOABORT yet. Can't allow splitting in this
+		 * window in case they don't.
+		 */
+		if (WARN_ON(num_online_cpus() > 1))
+			return -EBUSY;
+	}
 
 	/*
 	 * If the region is within a pte-mapped area, there is no need to try to
-- 
2.43.0


