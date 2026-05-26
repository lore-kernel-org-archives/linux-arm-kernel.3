Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560B4CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOgGyybA1RFHUYhGBde0hOiuSxoA2CWz/XAXRbLfO+Q=; b=VdEESt7bL/m9xtSAMnvoyWVx6c
	LTovGVKl0GwLGzIe3tg+jYsENeopgM8a8xSY1pd0CddAIeL4n5T2a5wmv4lKeN1/D2dXwCuFOGC+c
	AYJqzkB2sUf7T6vK6tGTFKcAvBso0D8u9x3GtDBlAJlepM9NZWWKKgvXbaVq04vUTbjdU3wOqnsPW
	loM6uFF4VX80HDrN5BXO8A/h9g0KM5a9hmlg90lupuIx3eBMutVtNWZs4C2kpYzTClQ578KIM0Z8O
	jBDqR7mVSFD9Y0sxn9uNKOfFe/O/vgqj+u/RIklHbnoHW3MA05sDBeBL/kDU/WHuX8U3YzGYzTrwo
	8YSWObDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpo5-00000001lQV-2gyI;
	Tue, 26 May 2026 11:18:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpns-00000001lCM-0LE9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:18:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AD62169C;
	Tue, 26 May 2026 04:18:26 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ABD73F7D8;
	Tue, 26 May 2026 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779794311; bh=tdSh+emP90ANDDLr4gHqcl2n9jLxHG0p28D+Gnc4lOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G6Qh4uyOUk14RrgWwvp7BlKMYZOIJVQPQyDyGrJ/wn6FiXKVFkyn0lMuRcFJzfGej
	 DFzV1DszD8XXUocbHQkip3oFVB/VukZmNPLOUC4Fwgsk/4enrFmlAsnPDK1b4vca8o
	 t3Hil7XQ68LyxySvYJaOj8elFG/Qyunte2v8kDGw=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 26 May 2026 12:16:07 +0100
Subject: [PATCH RFC v8 18/24] arm64: kpkeys: Ensure the linear map can be
 modified
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-kpkeys-v8-18-eaaacdacc67c@arm.com>
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
In-Reply-To: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779794212; l=1874;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=tdSh+emP90ANDDLr4gHqcl2n9jLxHG0p28D+Gnc4lOo=;
 b=fr6yZ8zM49YMzbl4pAqvIkdQX/UfKJYoPwtJoio3Jal7ikmbiUIgCdawtO09/ldvib7ULH/Mo
 AAKCsH7PRrcAzXVFFVEK/p3goI1iijinMde8JrGEBNZJcPtBkmoSXNV
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_041832_228870_1C3F0D97 
X-CRM114-Status: GOOD (  14.86  )
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

When the kpkeys_hardened_pgtables feature is enabled, we need to be
able to modify attributes (specifically the pkey/POIndex) in the
linear map at page granularity.

Add the appropriate check to can_set_direct_map() on the same
principle as rodata_full and other features.

kpkeys_hardened_pgtables currently requires the linear map to be
fully PTE-mapped, so we also need to ensure that force_pte_mapping()
returns true, like for DEBUG_PAGEALLOC.

Both functions can be called very early, before POE is actually
detected, so the early_enabled() helper is used.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/mm/mmu.c      | 2 +-
 arch/arm64/mm/pageattr.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dc69553d6326..c67b46592af6 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -760,7 +760,7 @@ static inline bool force_pte_mapping(void)
 	const bool bbml2 = system_capabilities_finalized() ?
 		system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
 
-	if (debug_pagealloc_enabled())
+	if (debug_pagealloc_enabled() || kpkeys_hardened_pgtables_early_enabled())
 		return true;
 	if (bbml2)
 		return false;
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 8f3519400bd1..87543ec660f5 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -101,7 +101,8 @@ bool can_set_direct_map(void)
 	 * Realms need to make pages shared/protected at page granularity.
 	 */
 	return rodata_full || debug_pagealloc_enabled() ||
-		arm64_kfence_can_set_direct_map() || is_realm_world();
+		arm64_kfence_can_set_direct_map() || is_realm_world() ||
+		kpkeys_hardened_pgtables_early_enabled();
 }
 
 static int update_range_prot(unsigned long start, unsigned long size,

-- 
2.51.2


