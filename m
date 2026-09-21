Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CACC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgD4D7h4EfSsMTxEOq8ADKWRNeWiq2+KsY/R5C+YQNM=; b=hcIWopDaosdiNB6ZP1UZX+hREi
	1rQS+dAfIstnA+09bcA1WDAn/1BKp2mQWLjJ3jKGwtdZSDV0fftUo1SvA5swpN5LSXmOMTSnmThpP
	KP7NAO+XFRJ5IY1qPud1bYZ1Sro7LnoHccy+8s96Bil8mx0FWv9LR90vLixuh5dpOyyMkXyCShP5Q
	3zROG5Mpmu+N8jqXQGPQtooPIIbAs5M/gqwZsk+MTmAr/X92DMF6fpWvzp1aBYee4HXEF4F+WazdE
	wQEdQ+22RuUQ0W42XOiCqrIS8wG/4g+JkY0QimKNnyDcd+/nPhJy2YCyv571BwYoe42j6lrTXQ8Vh
	H211NP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fKs-00000002SBJ-21wa;
	Mon, 21 Sep 2026 14:49:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fKj-00000002S61-0KTR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:49:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D09B940385;
	Mon, 21 Sep 2026 14:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFFD1F0089A;
	Mon, 21 Sep 2026 14:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002168;
	bh=AgD4D7h4EfSsMTxEOq8ADKWRNeWiq2+KsY/R5C+YQNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=avX+lq+FEOvHDH2Ka+90xabX+/3XfcNlbMJOgo8hQbVT7KtytJirI2WAK3ZkdU+A2
	 dhOvEYZsoG4EK7R7gE/4hye/lvQQedFCROIZN1l6Ld90l61kqkUYnN03fFNFiaYeNw
	 xYhBUCcKknnZvHXKI7GHaDux6pUgVHLc0uY4qpQE1aVbJbF6TcenTqDGPVxMhfNzEU
	 A5n9MGaMcMz9ytuyWSYbK8Q+RhhbKuySFp6CYcloHxaLPeHMEykf8QuR+nfpaHndMC
	 eMeu0po3UwytgA8nKwZWgmhH5E9118kfO7P0hK8BFGlTQZgTXiEdpTbbrdUfSBmXiV
	 vdTOxKBQ5YG6g==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	christian.koenig@amd.com,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v7 03/13] arm64: realm: Expose the CCA shared granule size through mem_encrypt ops
Date: Mon, 21 Sep 2026 20:18:37 +0530
Message-ID: <20260921144847.501151-4-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921144847.501151-1-aneesh.kumar@kernel.org>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

CCA guests must align shared/private memory transitions to the IPA state
change alignment reported by the host. This alignment can be larger than
PAGE_SIZE, so transitioning only a PAGE_SIZE-sized subrange may leave
part of the host-managed granule in the wrong state.

Cache the RHI-reported alignment during Realm initialization and expose
it through the arm64 memory encryption operations. Implement
arch_cc_shared_granule_size() so the common CoCo shared-memory allocator
uses the same constraint. Use PAGE_SIZE when no suitable backend is
registered.

The common cc_make_shared() and cc_make_private() wrappers validate both
the base and size against the architecture's shared granule size. Remove
the PAGE_SIZE-only address checks from the lower-level arm64 transition
hooks so that range validation remains in the common wrappers.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/mem_encrypt.h |  1 +
 arch/arm64/mm/mem_encrypt.c          | 13 +++++++++++--
 drivers/firmware/arm_rmm/rsi.c       | 13 ++++++++++++-
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
index ef8b8463e52b..32064338c9b0 100644
--- a/arch/arm64/include/asm/mem_encrypt.h
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -10,6 +10,7 @@ struct device;
 struct arm64_mem_crypt_ops {
 	int (*encrypt)(unsigned long addr, int numpages);
 	int (*decrypt)(unsigned long addr, int numpages);
+	size_t (*shared_granule_size)(void);
 };
 
 int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops);
diff --git a/arch/arm64/mm/mem_encrypt.c b/arch/arm64/mm/mem_encrypt.c
index ee3c0ab04384..e6c059d20595 100644
--- a/arch/arm64/mm/mem_encrypt.c
+++ b/arch/arm64/mm/mem_encrypt.c
@@ -16,6 +16,7 @@
 #include <linux/bug.h>
 #include <linux/compiler.h>
 #include <linux/err.h>
+#include <linux/cc_shared.h>
 #include <linux/mm.h>
 
 #include <asm/mem_encrypt.h>
@@ -33,7 +34,7 @@ int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops)
 
 int set_memory_encrypted(unsigned long addr, int numpages)
 {
-	if (likely(!crypt_ops) || WARN_ON(!PAGE_ALIGNED(addr)))
+	if (likely(!crypt_ops))
 		return 0;
 
 	return crypt_ops->encrypt(addr, numpages);
@@ -42,9 +43,17 @@ EXPORT_SYMBOL_GPL(set_memory_encrypted);
 
 int set_memory_decrypted(unsigned long addr, int numpages)
 {
-	if (likely(!crypt_ops) || WARN_ON(!PAGE_ALIGNED(addr)))
+	if (likely(!crypt_ops))
 		return 0;
 
 	return crypt_ops->decrypt(addr, numpages);
 }
 EXPORT_SYMBOL_GPL(set_memory_decrypted);
+
+size_t arch_cc_shared_granule_size(void)
+{
+	if (likely(!crypt_ops) || !crypt_ops->shared_granule_size)
+		return PAGE_SIZE;
+
+	return crypt_ops->shared_granule_size();
+}
diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 883f6091ff95..b59099d1f318 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -18,6 +18,7 @@
 #include <asm/pgtable.h>
 
 static struct realm_config config;
+static size_t ipa_state_change_alignment = PAGE_SIZE;
 
 unsigned long prot_ns_shared;
 EXPORT_SYMBOL(prot_ns_shared);
@@ -154,9 +155,17 @@ static int realm_set_memory_decrypted(unsigned long addr, int numpages)
 	return ret;
 }
 
+static size_t realm_shared_granule_size(void)
+{
+	if (is_realm_world())
+		return ipa_state_change_alignment;
+	return PAGE_SIZE;
+}
+
 static const struct arm64_mem_crypt_ops realm_crypt_ops = {
 	.encrypt = realm_set_memory_encrypted,
 	.decrypt = realm_set_memory_decrypted,
+	.shared_granule_size = realm_shared_granule_size,
 };
 
 static int realm_register_memory_enc_ops(void)
@@ -166,7 +175,7 @@ static int realm_register_memory_enc_ops(void)
 
 /* we need an aligned struct for rsi_host_call. slab is not yet ready */
 static struct rsi_host_call hostconf_call __initdata;
-static unsigned long __maybe_unused __init get_ipa_state_change_alignment(void)
+static unsigned long __init get_ipa_state_change_alignment(void)
 {
 	long ret;
 	unsigned long shared_granule_size;
@@ -217,6 +226,8 @@ void __init arm64_rsi_init(void)
 		return;
 	if (WARN_ON(rsi_get_realm_config(lm_alias(&config))))
 		return;
+
+	ipa_state_change_alignment = get_ipa_state_change_alignment();
 	prot_ns_shared = __phys_to_pte_val(BIT(config.ipa_bits - 1));
 
 	if (arm64_ioremap_prot_hook_register(realm_ioremap_hook))
-- 
2.43.0


