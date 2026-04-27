Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CC4FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PC/mLLWHO99IMZaWrOEGJunagYQ3n8ceLLUKh/8Fgko=; b=RlsNTNwYUgW24ZeciN3jEjyfAg
	SU6cfFkWaMT7Der27brc3yr5DVc/zD41SO3/s+LXXJVRq/lWb6vBPhIsu9EuEg2zwa48mq2tNMy0k
	4oIDXGeSq/B3sDIpKmiLmrdWpIErKsCzULOtFvrACT63PbpXa09+JPty3QOn4CDW2pkBytsOm98zy
	CXZaYT7K70GvMk2s6wty7ncvsarSAqgbHOmwysEfUfz1p4odueGwhHoTTWTj0yKmRAWPzDDcsVqRy
	zWwmRDi4Pyw8D8DmpeWwN51nAqprGbf6wohBTuW0pHSsm71dxdy3r31oDtMsRHd/l0+Zq2eb83t/7
	tLSYxWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFVF-0000000GGaP-3wIc;
	Mon, 27 Apr 2026 06:31:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFVD-0000000GGYs-0iKc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB60843B1E;
	Mon, 27 Apr 2026 06:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90877C19425;
	Mon, 27 Apr 2026 06:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777271490;
	bh=1bqcxu9R7YnbgTaZHZVu0ttmJP1KRUYZN9pbqqHorEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MWOUiYvsW7UUA7byghmQelLUgm0GK2BKJv0t0HsxCIc/sKqvFSw5hCoL/xZuOmrl8
	 ttTFNpYIh+4vkZmleLIgy+Hy4PYZ5Zd87AaGk7Y8dVtKrzs/rhNdZTE4h9Ea2Trhx0
	 2ORQL4736p2lVuzULmOf5fEHM7MPnf2VMj5/Cwu0KDXsvGj+/zevcS1W87WzJsFwds
	 GAA8Uqf/AaNE/6+ZEWcgl5Kvg5NVthffntHpy35fO0U4rq5mz3udE4WKI2A2vwlf5V
	 HNudQpxdnTuiWHAg6q5L/BSLtdaaIZyfE7HBbWNUpsCokGOUHgFEHkff6m1Y56sX0s
	 KOGBu03ml8r5w==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
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
Subject: [PATCH v4 3/3] coco: guest: arm64: Query host IPA-change alignment via RHI
Date: Mon, 27 Apr 2026 12:01:08 +0530
Message-ID: <20260427063108.909019-4-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427063108.909019-1-aneesh.kumar@kernel.org>
References: <20260427063108.909019-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_233131_308372_4E258044 
X-CRM114-Status: GOOD (  23.29  )
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

Add the Realm Host Interface support needed to query host configuration
from a Realm guest. Define the RHI hostconf SMCs, add rsi_host_call(), and
use them during Realm initialization to retrieve the host IPA-change
alignment size.

Expose that alignment through realm_get_hyp_pagesize() and
mem_decrypt_granule_size() so shared-buffer allocation and
encryption/decryption paths can honor the ipa change page-size requirement.

If the host reports an invalid alignment (when alginment value is not
multiple of 4K), do not enable Realm support.

This provides the host alignment information required by the shared buffer
alignment changes.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/mem_encrypt.h |  3 ++
 arch/arm64/include/asm/rhi.h         | 24 +++++++++++++
 arch/arm64/include/asm/rsi.h         |  2 ++
 arch/arm64/include/asm/rsi_cmds.h    | 10 ++++++
 arch/arm64/include/asm/rsi_smc.h     |  7 ++++
 arch/arm64/kernel/Makefile           |  2 +-
 arch/arm64/kernel/rhi.c              | 54 ++++++++++++++++++++++++++++
 arch/arm64/kernel/rsi.c              | 13 +++++++
 arch/arm64/mm/mem_encrypt.c          |  8 +++++
 9 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/rhi.h
 create mode 100644 arch/arm64/kernel/rhi.c

diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
index 314b2b52025f..5541911eb028 100644
--- a/arch/arm64/include/asm/mem_encrypt.h
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -16,6 +16,9 @@ int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops);
 int set_memory_encrypted(unsigned long addr, int numpages);
 int set_memory_decrypted(unsigned long addr, int numpages);
 
+#define mem_decrypt_granule_size mem_decrypt_granule_size
+size_t mem_decrypt_granule_size(void);
+
 int realm_register_memory_enc_ops(void);
 
 static inline bool force_dma_unencrypted(struct device *dev)
diff --git a/arch/arm64/include/asm/rhi.h b/arch/arm64/include/asm/rhi.h
new file mode 100644
index 000000000000..0895dd92ea1d
--- /dev/null
+++ b/arch/arm64/include/asm/rhi.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Ltd.
+ */
+
+#ifndef __ASM_RHI_H_
+#define __ASM_RHI_H_
+
+#include <linux/types.h>
+
+#define SMC_RHI_CALL(func)				\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
+			   ARM_SMCCC_SMC_64,		\
+			   ARM_SMCCC_OWNER_STANDARD_HYP,\
+			   (func))
+
+unsigned long rhi_get_ipa_change_alignment(void);
+#define RHI_HOSTCONF_VER_1_0		0x10000
+#define RHI_HOSTCONF_VERSION		SMC_RHI_CALL(0x004E)
+
+#define __RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT BIT(0)
+#define RHI_HOSTCONF_FEATURES		SMC_RHI_CALL(0x004F)
+#define RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT	SMC_RHI_CALL(0x0050)
+#endif
diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index 88b50d660e85..ae54fb3b1429 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -67,4 +67,6 @@ static inline int rsi_set_memory_range_shared(phys_addr_t start,
 	return rsi_set_memory_range(start, end, RSI_RIPAS_EMPTY,
 				    RSI_CHANGE_DESTROYED);
 }
+
+unsigned long realm_get_hyp_pagesize(void);
 #endif /* __ASM_RSI_H_ */
diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
index 2c8763876dfb..a341ce0eeda1 100644
--- a/arch/arm64/include/asm/rsi_cmds.h
+++ b/arch/arm64/include/asm/rsi_cmds.h
@@ -159,4 +159,14 @@ static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
 	return res.a0;
 }
 
+static inline unsigned long rsi_host_call(struct rsi_host_call *rhi_call)
+{
+	phys_addr_t addr = virt_to_phys(rhi_call);
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RSI_HOST_CALL, addr, &res);
+
+	return res.a0;
+}
+
 #endif /* __ASM_RSI_CMDS_H */
diff --git a/arch/arm64/include/asm/rsi_smc.h b/arch/arm64/include/asm/rsi_smc.h
index e19253f96c94..9ee8b5c7612e 100644
--- a/arch/arm64/include/asm/rsi_smc.h
+++ b/arch/arm64/include/asm/rsi_smc.h
@@ -182,6 +182,13 @@ struct realm_config {
  */
 #define SMC_RSI_IPA_STATE_GET			SMC_RSI_FID(0x198)
 
+struct rsi_host_call {
+	union {
+		u16 imm;
+		u64 padding0;
+	};
+	u64 gprs[31];
+} __aligned(0x100);
 /*
  * Make a Host call.
  *
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index fe627100d199..3e72dd9584ed 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -34,7 +34,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
 			   cpufeature.o alternative.o cacheinfo.o		\
 			   smp.o smp_spin_table.o topology.o smccc-call.o	\
 			   syscall.o proton-pack.o idle.o patching.o pi/	\
-			   rsi.o jump_label.o
+			   rsi.o jump_label.o rhi.o
 
 obj-$(CONFIG_COMPAT)			+= sys32.o signal32.o			\
 					   sys_compat.o
diff --git a/arch/arm64/kernel/rhi.c b/arch/arm64/kernel/rhi.c
new file mode 100644
index 000000000000..7cd6c5102464
--- /dev/null
+++ b/arch/arm64/kernel/rhi.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Ltd.
+ */
+
+#include <linux/mm.h>
+#include <asm/rsi.h>
+#include <asm/rhi.h>
+
+/* we need an aligned rhicall for rsi_host_call. slab is not yet ready */
+static struct rsi_host_call hyp_pagesize_rhicall;
+unsigned long rhi_get_ipa_change_alignment(void)
+{
+	long ret;
+	unsigned long ipa_change_align;
+
+	hyp_pagesize_rhicall.imm = 0;
+	hyp_pagesize_rhicall.gprs[0] = RHI_HOSTCONF_VERSION;
+	ret = rsi_host_call(lm_alias(&hyp_pagesize_rhicall));
+	if (ret != RSI_SUCCESS)
+		goto err_out;
+
+	if (hyp_pagesize_rhicall.gprs[0] != RHI_HOSTCONF_VER_1_0)
+		goto err_out;
+
+	hyp_pagesize_rhicall.imm = 0;
+	hyp_pagesize_rhicall.gprs[0] = RHI_HOSTCONF_FEATURES;
+	ret = rsi_host_call(lm_alias(&hyp_pagesize_rhicall));
+	if (ret != RSI_SUCCESS)
+		goto err_out;
+
+	if (!(hyp_pagesize_rhicall.gprs[0] & __RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT))
+		goto err_out;
+
+	hyp_pagesize_rhicall.imm = 0;
+	hyp_pagesize_rhicall.gprs[0] = RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT;
+	ret = rsi_host_call(lm_alias(&hyp_pagesize_rhicall));
+	if (ret != RSI_SUCCESS)
+		goto err_out;
+
+	ipa_change_align = hyp_pagesize_rhicall.gprs[0];
+	/* This error needs special handling in the caller */
+	if (ipa_change_align & (SZ_4K - 1))
+		return 0;
+
+	return ipa_change_align;
+
+err_out:
+	/*
+	 * For failure condition assume host is built with 4K page size
+	 * and hence ipa change alignment can be guest PAGE_SIZE.
+	 */
+	return PAGE_SIZE;
+}
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index 9e846ce4ef9c..ff735c04e236 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -14,8 +14,10 @@
 #include <asm/mem_encrypt.h>
 #include <asm/pgtable.h>
 #include <asm/rsi.h>
+#include <asm/rhi.h>
 
 static struct realm_config config;
+static unsigned long ipa_change_alignment = PAGE_SIZE;
 
 unsigned long prot_ns_shared;
 EXPORT_SYMBOL(prot_ns_shared);
@@ -139,6 +141,11 @@ static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
 	return 0;
 }
 
+unsigned long realm_get_hyp_pagesize(void)
+{
+	return ipa_change_alignment;
+}
+
 void __init arm64_rsi_init(void)
 {
 	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
@@ -147,6 +154,12 @@ void __init arm64_rsi_init(void)
 		return;
 	if (WARN_ON(rsi_get_realm_config(&config)))
 		return;
+
+	ipa_change_alignment = rhi_get_ipa_change_alignment();
+	/* If we don't get a correct alignment response, don't enable realm */
+	if (!ipa_change_alignment)
+		return;
+
 	prot_ns_shared = __phys_to_pte_val(BIT(config.ipa_bits - 1));
 
 	if (arm64_ioremap_prot_hook_register(realm_ioremap_hook))
diff --git a/arch/arm64/mm/mem_encrypt.c b/arch/arm64/mm/mem_encrypt.c
index 38c62c9e4e74..f5d64bc29c20 100644
--- a/arch/arm64/mm/mem_encrypt.c
+++ b/arch/arm64/mm/mem_encrypt.c
@@ -59,3 +59,11 @@ int set_memory_decrypted(unsigned long addr, int numpages)
 	return crypt_ops->decrypt(addr, numpages);
 }
 EXPORT_SYMBOL_GPL(set_memory_decrypted);
+
+size_t mem_decrypt_granule_size(void)
+{
+	if (is_realm_world())
+		return max(PAGE_SIZE, realm_get_hyp_pagesize());
+	return PAGE_SIZE;
+}
+EXPORT_SYMBOL_GPL(mem_decrypt_granule_size);
-- 
2.43.0


