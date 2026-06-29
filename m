Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCF0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGXvov+uJVAShzTplzCC+JuEFiu3SlDoLIs/R8yjRPU=; b=mY6eGUO2ELisonllcS1QVtuOqj
	EWHlPdtiS7TpijAHRTLa5y+Jq/avM/gwBv9itXL917gSDcKBPZeiklv3uOTKKqPCrXh2OZXNTS+dH
	kxXPii1Qb73YTHp1jx4KwtiJD7mz4iGWDAsAwv8+kqp1CE1nqu8Zhv4R7OaGBNMkv/kk3VcffPAId
	dCAMM1JZCUrg2IH9D2eFr4t1cJDZ4sd7pJikNiPx3tR5/JKLtOC72zapvVbdRolfYDsnttEtp2OUn
	KcVp8O25q7ugkF2MjlPSPTzW+1Pds8mqLQUUiquAFSMaUmYSGTy+HFL7bEu7AZGqflxoD+cGqD9dT
	I40aPWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA1F-0000000EPxB-0x5r;
	Mon, 29 Jun 2026 11:19:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA1A-0000000EPtJ-2d4C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:19:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CA0E307A;
	Mon, 29 Jun 2026 04:19:07 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88C803F905;
	Mon, 29 Jun 2026 04:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731951; bh=lJewvoJDgRAUeWkoRNdtBdiHG+qUJ6Z9V/0pehqjb+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FOnapLyXnduUafb9p6/sK/mgEaUYFx/HpOf5rprrqrYC6RNXz8D6JXdPFYoND85tJ
	 NzYlLyl2kUV2Z1DR4SiYipZyLM3mIEC4lXFayAI9zwaKIYbcjvO9nlicKbKBdOZ3qS
	 /w+0ti8WktYRQJOQadycSnlLT55pRkzRLIHnMnVg=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 09/13] KVM: arm64: Dirty-bitmap: avoid splitting previously split blocks
Date: Mon, 29 Jun 2026 12:17:57 +0100
Message-ID: <20260629111820.1873540-10-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629111820.1873540-1-leo.bras@arm.com>
References: <20260629111820.1873540-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190; i=leo.bras@arm.com; h=from:subject; bh=lJewvoJDgRAUeWkoRNdtBdiHG+qUJ6Z9V/0pehqjb+M=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKcQhKd1zM82ekWx5uge27fZO4PZWqWDzsnNGwuSDB7w XfrtqJGRykLgxgXg6yYIovso/mreL5PyThy5ccCmDmsTCBDGLg4BWAiLbMZ/sfNnvlxg8SMUr43 Vb+rP/q3Oqz1dtW6+7/nwh7v81svSL9lZOiWnMRZH6I0faGF3qlwyWlc+5wTix7knu5V+aRxeWW lFC8A
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041912_742493_AD8691A4 
X-CRM114-Status: GOOD (  12.06  )
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

If previous dirty-clean already split a block, then avoid calling the
split helper on that block again.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/dirty_bit.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
index d05af3de78be..6c928677ce12 100644
--- a/arch/arm64/kvm/dirty_bit.c
+++ b/arch/arm64/kvm/dirty_bit.c
@@ -153,20 +153,21 @@ int __kvm_arch_dirty_log_clear(struct kvm *kvm,
 			       bool *flush)
 {
 	int ret = 0;
 	int idx = 0;
 	unsigned long *dirty_bitmap = memslot->dirty_bitmap;
 	u64 *hw_entries;
 	const int entries_sz = PAGE_SIZE / sizeof(*hw_entries);
 	u64 ttwl;
 	u64 start, end;
 	gfn_t base_gfn;
+	gpa_t split_end = 0;
 
 	hw_entries = kmalloc_objs(u64, entries_sz, GFP_KERNEL);
 	if (!hw_entries)
 		return -ENOMEM;
 
 	ttwl = HDBSS_ENTRY_TTWL(KVM_PGTABLE_LAST_LEVEL);
 
 	if (log) {
 		start = log->first_page / BITS_PER_LONG;
 		end = start + DIV_ROUND_UP(log->num_pages, BITS_PER_LONG);
@@ -197,24 +198,28 @@ int __kvm_arch_dirty_log_clear(struct kvm *kvm,
 
 			mask = xchg(&dirty_bitmap[i], 0);
 			bitmap[i] = mask;
 		}
 
 		if (!mask)
 			continue;
 
 		offset = base_gfn + i * BITS_PER_LONG;
 
-		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-			kvm_mmu_split_huge_pages(kvm,
-						 gfn_to_gpa(offset + __ffs(mask)),
-						 gfn_to_gpa(offset + __fls(mask) + 1));
+		if (kvm_dirty_log_manual_protect_and_init_set(kvm) &&
+		    (offset + BITS_PER_LONG > split_end)) {
+			gpa_t start = gfn_to_gpa(offset + __ffs(mask));
+			gpa_t end = gfn_to_gpa(offset + __fls(mask) + 1);
+
+			kvm_mmu_split_huge_pages(kvm, start, end);
+			split_end = gpa_to_gfn(ALIGN_DOWN(end, PMD_SIZE) + PMD_SIZE - 1);
+		}
 
 		do {
 			idx = mask_to_hdbss(&mask, hw_entries, offset, ttwl, idx, entries_sz);
 			if (idx >= entries_sz) {
 				ret = dirty_bit_clear(kvm, hw_entries, idx);
 				*flush = *flush || ret > 0;
 				if (ret != idx) {
 					/* Save bits not converted back to bitmap */
 					atomic_long_or(mask, (atomic_long_t *)&dirty_bitmap[i]);
 					goto out_err;
-- 
2.54.0


