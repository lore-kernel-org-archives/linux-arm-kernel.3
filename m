Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376A1C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEbQ7HaKthnkMylW+2jSP54OBQRYCmZCNDvb89+sBRw=; b=LY/+VpA4a16J22icjpBOdyc/hD
	hL5Jm4MvR5nVRzIwhSit+48e/7SA8crOqt7CjdisoLyVU7YyC0kljZ4X/7Gil28xVpo0bXlWfipt2
	5ko0fZ7OQTuB938pQryEU3DGtDwleXZPJYBW4GgPf8kPuSTrtG/fjIKhiKtKF0fKjlJFzH5hvqbIc
	WzxKiDTulHQFM9E/5UGJDU0Q7dIKzTx87CNLlWISRexMULCtlvDs9uzkPYOtau2wPvnmQpB/kiTbN
	0H7fTPJlu0B4iQjsQ2Oacja4RO3O/n8i+43zv0xw9W5evQozf/3I7zzaiP/ohmKRJV2uUu1g1jIdP
	edjc0Tig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKZ7-000000088Hk-1bNy;
	Tue, 18 Aug 2026 14:13:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKYt-0000000883i-0olX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:13:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B82BD19F0;
	Tue, 18 Aug 2026 07:13:02 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 047FF3F85F;
	Tue, 18 Aug 2026 07:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062386; bh=3t05Fw3A+f9MIyDqdvDITJQvHNjExASbPyfBJcI1LuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pwLkjCs/AMgJE4mllrRzROMnSh51AWur/Cz8aO9KEJaEvhRykqmxkrolfnlet/wDl
	 Jixap6kmpzZqUUqudL01g7v3AlITmPn3FpaeDVEJ41r+Q+6VYINlnMjYEGaR5D73IF
	 2nvDbZG7GwFeyOlA4XC/9+Kjq6eWiKgdjrhQluoY=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 18 Aug 2026 15:09:03 +0100
Subject: [PATCH RFC v9 21/25] arm64: kpkeys: Protect init_pg_dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-kpkeys-v9-21-743ad31b2c8f@arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
In-Reply-To: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787062277; l=1908;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=3t05Fw3A+f9MIyDqdvDITJQvHNjExASbPyfBJcI1LuQ=;
 b=py/irnu2oGc01DHweeRBIz5AEoTp+/gX9Q3vCQ9t0ecqfHJqabMsorRVFPwluZkU7iTiQ7nbh
 0CbEMDQ0cTUAUua6Gls52MN+1metgXlLMKlCJsb1Z8NO6zAvEFvZ6P/
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071307_364827_F6752BB1 
X-CRM114-Status: GOOD (  12.91  )
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

When kpkeys_hardened_pgtables is enabled, protect the page tables
that map the kernel image by setting the appropriate pkey for the
linear mapping of those pages.

Most other static page tables (e.g. swapper_pg_dir) should be
read-only both in the kernel image mapping and the linear mapping,
so there is no need to change their pkey.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/kpkeys.h |  7 +++++++
 arch/arm64/mm/mmu.c             | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
index 00e7e5956794..7747af54fd38 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -72,6 +72,13 @@ void arch_kpkeys_leave_context(const struct kpkeys_state *state)
 
 #endif /* CONFIG_ARM64_POE */
 
+#ifdef CONFIG_KPKEYS_HARDENED_PGTABLES
+
+#define arch_kpkeys_protect_static_pgtables arch_kpkeys_protect_static_pgtables
+void arch_kpkeys_protect_static_pgtables(void);
+
+#endif /* CONFIG_KPKEYS_HARDENED_PGTABLES */
+
 #endif	/* __ASSEMBLY__ */
 
 #endif	/* __ASM_KPKEYS_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index ee972c78e45c..472ad0f8f002 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1073,6 +1073,18 @@ void __init mark_linear_text_alias_ro(void)
 			    PAGE_KERNEL_RO);
 }
 
+#ifdef CONFIG_KPKEYS_HARDENED_PGTABLES
+void __init arch_kpkeys_protect_static_pgtables(void)
+{
+	unsigned long addr = (unsigned long)lm_alias(__pi_init_pg_dir);
+	unsigned long size = __pi_init_pg_end - __pi_init_pg_dir;
+	int ret;
+
+	ret = set_memory_pkey(addr, size / PAGE_SIZE, KPKEYS_PKEY_PGTABLES);
+	WARN_ON(ret);
+}
+#endif /* CONFIG_KPKEYS_HARDENED_PGTABLES */
+
 #ifdef CONFIG_KFENCE
 
 bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;

-- 
2.51.2


