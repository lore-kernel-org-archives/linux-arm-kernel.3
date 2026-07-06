Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BDCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0GTpGojCkTLTigXJjUWY8A7Bx3gwP5wr1YCstPCEu8=; b=FZPyainc0oZ+ygy+11nfX/12hE
	tRSVdmW8gkP4UF0LQ3qUS2NWeAttxBYCC0OCmApr2VBlG0F82O3UtYdZSFxoSJpsNeI1iYa5zPgRK
	Jdax4iZ7RoIE780LavYe+HSy3MP5Dc1J2WmXWp0swN1XySK7I1zB7lvIErodEMvLgppLAFFXkn3kl
	XDBHuetWhXy/wXrJjhRgt7iwbgMd+e3DLr+hAjIlvTHbi5O/uEPeUeX7oULswnkcZO/OMBk/bCCD5
	a8qK0VHEJkE3mxo7OEsldcX5Ls1UllpiRVbAPR44lTBVGkWWiI43SdxvJXrd3ihSbm2CThUFOowc0
	p1zErUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcSw-0000000BZfE-0qlX;
	Mon, 06 Jul 2026 06:06:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcSt-0000000BZe2-3OIz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:06:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F5AA40AC0;
	Mon,  6 Jul 2026 06:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425311F000E9;
	Mon,  6 Jul 2026 06:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783317959;
	bh=W0GTpGojCkTLTigXJjUWY8A7Bx3gwP5wr1YCstPCEu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V3zjjBqdcv8eoKzWoxHaUZNJXnhzGnVJ6LDlGEJ0g/uoEjoFlGJF93F7LnFvAzwV1
	 ZBoUn5L0SHty3yrfyEXpodJLyNpLg9ibW1FD6o19jfXV6Mg8PkyG3vA4bDbyRbWl7k
	 aYfp4Y3Gd4HMjFmfHABdZ2ib3xuZGeb219FrxQF6xeTtaBTK5EUv5SlOjZD9KwMrdm
	 9O++XOLGiT8/DkGqOnnMoCJugcTTEiJOuSWAxMqrv/PSfrYbEIBaMAxPoEvPCJZL/j
	 YbdPph+0mAX3ay04g4PWU7ERX+vPDrchXGh8sqfvzNb3hUlOly9QrJ01d/pvD89OWm
	 weNWhxvBWxVkw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 10/10] arm64: realm: Expose the CCA shared granule size through mem_encrypt ops
Date: Mon,  6 Jul 2026 11:34:32 +0530
Message-ID: <20260706060432.1375570-11-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706060432.1375570-1-aneesh.kumar@kernel.org>
References: <20260706060432.1375570-1-aneesh.kumar@kernel.org>
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

CCA guests must align shared/private memory transitions to the size
reported by the host for IPA state changes. This size can be larger than
PAGE_SIZE, so allowing a guest to convert only a PAGE_SIZE-sized subrange
can leave the remaining part of that host-sized range in the wrong state.

Cache the RHI-reported IPA sate change alignment during Realm
initialization and expose it through a new arm64 mem_encrypt callback. Use
PAGE_SIZE as the default shared granule size when no backend callback is
registered.

Validate both the address and byte size passed to set_memory_encrypted()
and set_memory_decrypted() against mem_cc_shared_granule_size() before
calling into the backend. This prevents callers from converting only part
of a host-managed page.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/mem_encrypt.h |  4 ++++
 arch/arm64/kernel/rsi.c              | 13 ++++++++++-
 arch/arm64/mm/mem_encrypt.c          | 32 ++++++++++++++++++++++++----
 3 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
index f6325f30e844..5018581fed87 100644
--- a/arch/arm64/include/asm/mem_encrypt.h
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -9,6 +9,7 @@ struct device;
 struct arm64_mem_crypt_ops {
 	int (*encrypt)(unsigned long addr, int numpages);
 	int (*decrypt)(unsigned long addr, int numpages);
+	size_t (*cc_shared_granule_size)(void);
 };
 
 int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops);
@@ -17,6 +18,9 @@ int set_memory_encrypted(unsigned long addr, int numpages);
 int set_memory_decrypted(unsigned long addr, int numpages);
 int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt);
 
+#define mem_cc_shared_granule_size mem_cc_shared_granule_size
+size_t mem_cc_shared_granule_size(void);
+
 static inline bool force_dma_unencrypted(struct device *dev)
 {
 	return is_realm_world();
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index f52f240bb44c..54fb929067c9 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -20,6 +20,7 @@
 
 static struct realm_config config;
 static struct kobject *cca_kobj;
+static unsigned long ipa_state_change_granule_size;
 
 unsigned long prot_ns_shared;
 EXPORT_SYMBOL(prot_ns_shared);
@@ -168,9 +169,17 @@ static int realm_set_memory_decrypted(unsigned long addr, int numpages)
 	return ret;
 }
 
+static size_t realm_cc_shared_granule_size(void)
+{
+	if (is_realm_world())
+		return ipa_state_change_granule_size;
+	return PAGE_SIZE;
+}
+
 static const struct arm64_mem_crypt_ops realm_crypt_ops = {
 	.encrypt = realm_set_memory_encrypted,
 	.decrypt = realm_set_memory_decrypted,
+	.cc_shared_granule_size = realm_cc_shared_granule_size,
 };
 
 static int realm_register_memory_enc_ops(void)
@@ -180,7 +189,7 @@ static int realm_register_memory_enc_ops(void)
 
 /* we need an aligned struct for rsi_host_call. slab is not yet ready */
 static struct rsi_host_call hostconf_call __initdata;
-static unsigned long __maybe_unused __init get_ipa_state_change_alignment(void)
+static unsigned long __init get_ipa_state_change_alignment(void)
 {
 	long ret;
 	unsigned long shared_granule_size;
@@ -230,6 +239,8 @@ void __init arm64_rsi_init(void)
 		return;
 	if (WARN_ON(rsi_get_realm_config(lm_alias(&config))))
 		return;
+
+	ipa_state_change_granule_size = get_ipa_state_change_alignment();
 	prot_ns_shared = __phys_to_pte_val(BIT(config.ipa_bits - 1));
 
 	if (arm64_ioremap_prot_hook_register(realm_ioremap_hook))
diff --git a/arch/arm64/mm/mem_encrypt.c b/arch/arm64/mm/mem_encrypt.c
index ee3c0ab04384..69783c6a3c08 100644
--- a/arch/arm64/mm/mem_encrypt.c
+++ b/arch/arm64/mm/mem_encrypt.c
@@ -17,8 +17,7 @@
 #include <linux/compiler.h>
 #include <linux/err.h>
 #include <linux/mm.h>
-
-#include <asm/mem_encrypt.h>
+#include <linux/mem_encrypt.h>
 
 static const struct arm64_mem_crypt_ops *crypt_ops;
 
@@ -33,18 +32,43 @@ int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops)
 
 int set_memory_encrypted(unsigned long addr, int numpages)
 {
-	if (likely(!crypt_ops) || WARN_ON(!PAGE_ALIGNED(addr)))
+	unsigned long size = (unsigned long)numpages << PAGE_SHIFT;
+
+	if (likely(!crypt_ops))
 		return 0;
 
+	if (WARN_ON(!IS_ALIGNED(addr, mem_cc_shared_granule_size())))
+		return -EINVAL;
+
+	if (WARN_ON(!IS_ALIGNED(size, mem_cc_shared_granule_size())))
+		return -EINVAL;
+
 	return crypt_ops->encrypt(addr, numpages);
 }
 EXPORT_SYMBOL_GPL(set_memory_encrypted);
 
 int set_memory_decrypted(unsigned long addr, int numpages)
 {
-	if (likely(!crypt_ops) || WARN_ON(!PAGE_ALIGNED(addr)))
+	unsigned long size = (unsigned long)numpages << PAGE_SHIFT;
+
+	if (likely(!crypt_ops))
 		return 0;
 
+	if (WARN_ON(!IS_ALIGNED(addr, mem_cc_shared_granule_size())))
+		return -EINVAL;
+
+	if (WARN_ON(!IS_ALIGNED(size, mem_cc_shared_granule_size())))
+		return -EINVAL;
+
 	return crypt_ops->decrypt(addr, numpages);
 }
 EXPORT_SYMBOL_GPL(set_memory_decrypted);
+
+size_t mem_cc_shared_granule_size(void)
+{
+	if (likely(!crypt_ops) || !crypt_ops->cc_shared_granule_size)
+		return PAGE_SIZE;
+
+	return crypt_ops->cc_shared_granule_size();
+}
+EXPORT_SYMBOL_GPL(mem_cc_shared_granule_size);
-- 
2.43.0


