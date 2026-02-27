Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57923FEFB70
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZX8I/q1t8yqJeNG06r60YCkcLH88/apttDYAFu7OYyY=; b=wZ+PCGEvPEub2MIymBRaM0JV2A
	+Jr1UyQAcTdXeTmkjYyGbKozDheJgr01EVe8+mo6ubwb5i1/mKh427rKkTbCakfrCzF399m31cIO4
	PuuLFR/K13FiayFmTOJD+we0TyoRQDOqmGtwJUpn7JwdJS3frvSt5GJIlYSToqzmxQ2Vpksn3n5r+
	ow6SGHIH483NBrm0b4AiSgy+ZrCaxe5GgarKmUdLSjh62i9kkpDZ9PwD/7p0iLG9ZMTXuMVdwWwBl
	50btZ8R5b/NIQeNvYpeKZUPFxVpLelfDMhtaXEMJFPynyEHUTNO2/Au3DpzaNLjsnOP4FVl0/N3hw
	c0fp5qJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw25g-00000008rg3-45dO;
	Fri, 27 Feb 2026 17:57:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw25e-00000008rcd-1k9I
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 17:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZX8I/q1t8yqJeNG06r60YCkcLH88/apttDYAFu7OYyY=; b=nOEMgExxDcGPWT1T1Oih8qT9pC
	BhF35attd++sQ5VT2xJRUru2ROwDEVRjtb8nZa/WutccSrdohLoeBSuTwJfgCWQ+kuM4uZ42f2dUM
	ZMvf9SPBoRpwsnyB0JsFDpnsteHGY94+XEpHvWn3KQBRu1dD+Rusz9YeB3X35I5wB3axTlxDPGdH8
	/gS2NZFDACY2SZhfLIiIqgjclMs657bdBqhAxyGESzPl5pt3MHxXK1xME576v5kXpztC1LN+QvEK+
	tbwJigRX2AdNRlG6LNlPAkfw8W5ZDSR7QNeoqrpxHRqDPjhbwRaAdUhHh8A1t98VDLCjk56mTy7fd
	IjQemI0A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw25R-0000000DdJZ-2cG1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:57:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 621D814BF;
	Fri, 27 Feb 2026 09:57:06 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C5903F73B;
	Fri, 27 Feb 2026 09:57:08 -0800 (PST)
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
Subject: [PATCH v6 19/30] mm: kpkeys: Introduce hook for protecting static page tables
Date: Fri, 27 Feb 2026 17:55:07 +0000
Message-ID: <20260227175518.3728055-20-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227175518.3728055-1-kevin.brodsky@arm.com>
References: <20260227175518.3728055-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_175723_547794_FF7A39C4 
X-CRM114-Status: GOOD (  11.15  )
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

The kpkeys_hardened_pgtables infrastructure introduced so far allows
compatible architectures to protect all page table pages (PTPs)
allocated at runtime (first via memblock, then the buddy allocator).
Some PTPs are however required even earlier, before any allocator is
available. This is typically needed for mapping the kernel image
itself.

These PTPs are at least as sensitive as those allocated later on,
and should be protected by mapping them with the privileged pkey.
Exactly how these pages are obtained is entirely arch-specific, so
we introduce a hook to let architectures that implement
kpkeys_hardened_pgtables do the right thing.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/kpkeys.h        | 4 ++++
 mm/kpkeys_hardened_pgtables.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
index 73b456ecec65..cf2f7735ce03 100644
--- a/include/linux/kpkeys.h
+++ b/include/linux/kpkeys.h
@@ -141,6 +141,10 @@ void kpkeys_hardened_pgtables_init_late(void);
 
 phys_addr_t kpkeys_physmem_pgtable_alloc(void);
 
+#ifndef arch_kpkeys_protect_static_pgtables
+static inline void arch_kpkeys_protect_static_pgtables(void) {}
+#endif
+
 #else /* CONFIG_KPKEYS_HARDENED_PGTABLES */
 
 static inline bool kpkeys_hardened_pgtables_enabled(void)
diff --git a/mm/kpkeys_hardened_pgtables.c b/mm/kpkeys_hardened_pgtables.c
index 1b649812f474..cc1dc44335c3 100644
--- a/mm/kpkeys_hardened_pgtables.c
+++ b/mm/kpkeys_hardened_pgtables.c
@@ -125,6 +125,7 @@ void __init kpkeys_hardened_pgtables_init_late(void)
 		pba_init_late();
 
 	ppa_finalize();
+	arch_kpkeys_protect_static_pgtables();
 }
 
 /*
-- 
2.51.2


