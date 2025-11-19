Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE86DCF34A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hysjSjfWWHz/H/4EH0hiRMEmuExmjbA+v4tncEI2WdA=; b=DvPsc339Hlqmlrwi+bEYq/u0eU
	wBozByE+Tb1HJWNXklL7vVLhDRz8A8ZyglTdMJSBIEUXwVoXroOCJ9bvbg0AJKdSBA5/ZyX5808RU
	PstbkTOaI6+784yh0RDK2q3u5toMTvwWWk8Veysf/Twcpw36VvTb7TpXhlEOJrBiXsTK1HrrLNBHq
	ABwMt8Td5mhpSnXVEUJriHax4HqBc1jTAk0rco9eS2WI6m3IZzxijps0RyopRVQrOrLq0WIxJDbGM
	stLi//bxiXKrw5p6mTqBr1rcv3z1ibHf1/ygvqBqGbjoS3CPRZe+REXsJbAVS7nJAVfqeq1RQjUyp
	/L4DF3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhnU-00000003DBh-2q1P;
	Wed, 19 Nov 2025 13:00:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhnS-00000003DB8-0ZCD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:00:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13E93FEC;
	Wed, 19 Nov 2025 05:00:21 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D6143F66E;
	Wed, 19 Nov 2025 05:00:26 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	David Hildenbrand <david@redhat.com>,
	Dev Jain <dev.jain@arm.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing>
Subject: [PATCH] arm64: mm: Simplify check in arch_kfence_init_pool()
Date: Wed, 19 Nov 2025 13:00:16 +0000
Message-ID: <20251119130016.283216-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_050030_253595_43B133BC 
X-CRM114-Status: GOOD (  20.07  )
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

TL;DR: checking force_pte_mapping() in arch_kfence_init_pool() is
sufficient

Commit ce2b3a50ad92 ("arm64: mm: Don't sleep in
split_kernel_leaf_mapping() when in atomic context") recently added
an arm64 implementation of arch_kfence_init_pool() to ensure that
the KFENCE pool is PTE-mapped. Assuming that the pool was not
initialised early, block splitting is necessary if the linear
mapping is not fully PTE-mapped, in other words if
force_pte_mapping() is false.

arch_kfence_init_pool() currently makes another check: whether
BBML2-noabort is supported, i.e. whether we are *able* to split
block mappings. This check is however unnecessary, because
force_pte_mapping() is always true if KFENCE is enabled and
BBML2-noabort is not supported. This must be the case by design,
since KFENCE requires PTE-mapped pages in all cases. We can
therefore remove that check.

The situation is different in split_kernel_leaf_mapping(), as that
function is called unconditionally regardless of the configuration.
If BBML2-noabort is not supported, it cannot do anything and bails
out. If force_pte_mapping() is true, there is nothing to do and it
also bails out, but these are independent checks.

Commit 53357f14f924 ("arm64: mm: Tidy up force_pte_mapping()")
grouped these checks into a helper, split_leaf_mapping_possible().
This isn't so helpful as only split_kernel_leaf_mapping() should
check both. Revert the parts of that commit that introduced the
helper, reintroducing the more accurate comments in
split_kernel_leaf_mapping().

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
Apologies for not suggesting this during the review cycle of [1], I'm
late to the party...

[1] https://lore.kernel.org/all/20251106160945.3182799-1-ryan.roberts@arm.com/
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christoph Lameter (Ampere) <cl@gentwo.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: D Scott Phillips <scott@os.amperecomputing.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing>
---
 arch/arm64/mm/mmu.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 2ba01dc8ef82..866cc889bb61 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -720,18 +720,6 @@ static inline bool force_pte_mapping(void)
 	return rodata_full || arm64_kfence_can_set_direct_map() || is_realm_world();
 }
 
-static inline bool split_leaf_mapping_possible(void)
-{
-	/*
-	 * !BBML2_NOABORT systems should never run into scenarios where we would
-	 * have to split. So exit early and let calling code detect it and raise
-	 * a warning.
-	 */
-	if (!system_supports_bbml2_noabort())
-		return false;
-	return !force_pte_mapping();
-}
-
 static DEFINE_MUTEX(pgtable_split_lock);
 
 int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
@@ -739,11 +727,22 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
 	int ret;
 
 	/*
-	 * Exit early if the region is within a pte-mapped area or if we can't
-	 * split. For the latter case, the permission change code will raise a
-	 * warning if not already pte-mapped.
+	 * !BBML2_NOABORT systems should not be trying to change permissions on
+	 * anything that is not pte-mapped in the first place. Just return early
+	 * and let the permission change code raise a warning if not already
+	 * pte-mapped.
 	 */
-	if (!split_leaf_mapping_possible() || is_kfence_address((void *)start))
+	if (!system_supports_bbml2_noabort())
+		return 0;
+
+	/*
+	 * If the region is within a pte-mapped area, there is no need to try to
+	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
+	 * change permissions from atomic context so for those cases (which are
+	 * always pte-mapped), we must not go any further because taking the
+	 * mutex below may sleep.
+	 */
+	if (force_pte_mapping() || is_kfence_address((void *)start))
 		return 0;
 
 	/*
@@ -1042,7 +1041,7 @@ bool arch_kfence_init_pool(void)
 	int ret;
 
 	/* Exit early if we know the linear map is already pte-mapped. */
-	if (!split_leaf_mapping_possible())
+	if (force_pte_mapping())
 		return true;
 
 	/* Kfence pool is already pte-mapped for the early init case. */

base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
-- 
2.51.2


