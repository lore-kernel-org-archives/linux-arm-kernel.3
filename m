Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB92FED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIbREqH51sg/lS7IWJHD9UXPZTB/XCBn3pdwyKtyNu0=; b=ILEOvaKw0Cs/mE427LF6QS5KDY
	lBqGWZ3VQz19ueChdicmDpZFIjAFfvMsm3itXXzNC6GC16S8qW+p7lt7gRKslEOR+17dnCZgyh9gl
	JcUc0btqy2ap3nzrvQOGnA4lXj7jvWCIELodwJK838dJWRheMPKA1SufBmev5OIFIy+mMrZAWFPR9
	/wkJ5lHaVBD/ZmRlae+iG7QWBy+bIzWSZ9NS+zwTXvDc0O9pQAG9vLXgHTlWKmUfqtixZThPraq10
	r0Ca4O2J8eBml9IBdvluC/FPjnBuWBBUg3cYQBs34FAnOOwMpbZt0WuAYbLFBFdpwMeIolkP0vZcQ
	njwngWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b6F-0000000Dc80-3N5G;
	Thu, 12 Mar 2026 08:08:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b6D-0000000Dc5s-26Iw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 377B243D09;
	Thu, 12 Mar 2026 08:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8F0C2BC9E;
	Thu, 12 Mar 2026 08:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302933;
	bh=n2w7TluNhZi5wRDOl+AP0+i4l02rIPnxWFZnl60PaZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hSMZwdoBq+MD8FGZLPL78XZlHbSLkOqWliwfULze5JlyDnvBtzGPjZtnWNalVUyeH
	 nmz4QnK+VntesGJjAn/cIVg3bRd9VF6ng33rted4EaywjGjAPV8NlNi7dcXfLPtnuM
	 UbBs+p7WidNEM8BI7KnNOfsAwp64cwepzWvITkCiBAgwsvFohxL0jsDSdSEB1mlbDX
	 kZrTnXnwghRp05jDAM+8pYoBqgCE1kB7GOLseAjjNBgmj+yXqLn9hldx5BwBDDWTY4
	 Ty/lqu/m7tmofmsOncV8w32aZuD2yEzml9Qepy+p2L7uIVZQHx7kgmC6eNJ9gGbJx9
	 aC1kBFeiJJWRw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Dan Williams <dan.j.williams@intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [RFC PATCH v3 10/12] KVM: arm64: Unmap device mappings when a private granule is destroyed
Date: Thu, 12 Mar 2026 13:37:41 +0530
Message-ID: <20260312080743.3487326-11-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
References: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_010853_830970_4B6B94B1 
X-CRM114-Status: GOOD (  22.74  )
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

Ensure tearing down a private granule also tears down any RMM device
mapping by reading the RTT entry, invoking the new RMI_VDEV_MEM_UNMAP,
and remembering the entry’s RIPAS so we only free RAM pages.

Drive the device-unmap path when RIPAS transitions to EMPTY. Also roll
back partially built device maps when errors occur.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_cmds.h | 15 +++++++
 arch/arm64/include/asm/rmi_smc.h  |  2 +
 arch/arm64/kvm/rmi.c              | 65 +++++++++++++++++++++++++++----
 3 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 53bffaace64c..0c06a4f45346 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -721,4 +721,19 @@ static inline int rmi_vdev_mem_map(unsigned long rd, unsigned long vdev_phys,
 	return res.a0;
 }
 
+static inline int rmi_vdev_mem_unmap(unsigned long rd, unsigned long ipa, unsigned long level,
+				     unsigned long *out_pa, unsigned long *out_ipa)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_VDEV_MEM_UNMAP, rd, ipa, level, &res);
+
+	if (out_pa)
+		*out_pa = res.a1;
+	if (out_ipa)
+		*out_ipa = res.a2;
+
+	return res.a0;
+}
+
 #endif /* __ASM_RMI_CMDS_H */
diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index 41ee49c341c0..f4b8f1c9ba0b 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -49,6 +49,7 @@
 #define SMC_RMI_RTT_SET_RIPAS		SMC_RMI_CALL(0x0169)
 
 #define SMC_RMI_VDEV_MEM_MAP		SMC_RMI_CALL(0x0172)
+#define SMC_RMI_VDEV_MEM_UNMAP		SMC_RMI_CALL(0x0173)
 #define SMC_RMI_PDEV_ABORT		SMC_RMI_CALL(0x0174)
 #define SMC_RMI_PDEV_COMMUNICATE        SMC_RMI_CALL(0x0175)
 #define SMC_RMI_PDEV_CREATE             SMC_RMI_CALL(0x0176)
@@ -92,6 +93,7 @@ enum rmi_ripas {
 	RMI_EMPTY = 0,
 	RMI_RAM = 1,
 	RMI_DESTROYED = 2,
+	RMI_DEV = 3,
 };
 
 #define RMI_NO_MEASURE_CONTENT	0
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index bb338712ef34..5de49a47d782 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -454,15 +454,26 @@ void kvm_realm_destroy_rtts(struct kvm *kvm, u32 ia_bits)
 static int realm_destroy_private_granule(struct realm *realm,
 					 unsigned long ipa,
 					 unsigned long *next_addr,
-					 phys_addr_t *out_rtt)
+					 phys_addr_t *out_rtt,
+					 int *ripas)
 {
 	unsigned long rd = virt_to_phys(realm->rd);
 	unsigned long rtt_addr;
+	struct rtt_entry rtt_entry;
 	phys_addr_t rtt;
 	int ret;
 
+	// mmu_lock avoids parallel rte modification?
+	ret = rmi_rtt_read_entry(rd, ipa, RMM_RTT_MAX_LEVEL, &rtt_entry);
+	if (ret != RMI_SUCCESS)
+		return -ENXIO;
+
 retry:
-	ret = rmi_data_destroy(rd, ipa, &rtt_addr, next_addr);
+	if (rtt_entry.ripas == RMI_DEV)
+		ret = rmi_vdev_mem_unmap(rd, ipa, RMM_RTT_MAX_LEVEL, &rtt_addr, next_addr);
+	else
+		ret = rmi_data_destroy(rd, ipa, &rtt_addr, next_addr);
+
 	if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
 		if (*next_addr > ipa)
 			return 0; /* UNASSIGNED */
@@ -490,6 +501,7 @@ static int realm_destroy_private_granule(struct realm *realm,
 		return -ENXIO;
 
 	*out_rtt = rtt_addr;
+	*ripas = rtt_entry.ripas;
 
 	return 0;
 }
@@ -501,16 +513,16 @@ static int realm_unmap_private_page(struct realm *realm,
 	unsigned long end = ALIGN(ipa + 1, PAGE_SIZE);
 	unsigned long addr;
 	phys_addr_t out_rtt = PHYS_ADDR_MAX;
-	int ret;
+	int ret, ripas;
 
 	for (addr = ipa; addr < end; addr = *next_addr) {
 		ret = realm_destroy_private_granule(realm, addr, next_addr,
-						    &out_rtt);
+						    &out_rtt, &ripas);
 		if (ret)
 			return ret;
 	}
 
-	if (out_rtt != PHYS_ADDR_MAX) {
+	if (out_rtt != PHYS_ADDR_MAX && ripas != RMI_DEV) {
 		out_rtt = ALIGN_DOWN(out_rtt, PAGE_SIZE);
 		free_page((unsigned long)phys_to_virt(out_rtt));
 	}
@@ -1226,10 +1238,27 @@ static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
 			       unsigned long *top_ipa)
 {
 	struct kvm *kvm = vcpu->kvm;
-	int ret = ripas_change(kvm, vcpu, start, end, RIPAS_SET, top_ipa);
+	int ret;
 
-	if (ripas == RMI_EMPTY && *top_ipa != start)
-		realm_unmap_private_range(kvm, start, *top_ipa, false);
+	/*
+	 * We use the RIPAS value to decide between a data_destroy or a
+	 * dev_mem_unmap. Hence call realm_unmap_private_range() before
+	 * ripas_change().
+	 *
+	 * Technically, for private RAM, we don't need to call
+	 * realm_unmap_private_range(), because any RIPAS change via RSI would
+	 * trigger a memory fault exit. That would, in turn, invalidate the
+	 * guest's memfd range, which then triggers realm_unmap_private_range()
+	 * automatically.
+	 *
+	 * However, this doesn’t apply to RIPAS_DEV, because we currently
+	 * lack a user-space API to call realm_dev_mem_unmap() in response to a
+	 * memory fault exit. Therefore, the unmap must happen explicitly before
+	 * the RIPAS change.
+	 */
+	if (ripas == RMI_EMPTY)
+		realm_unmap_private_range(kvm, start, end, false);
+	ret = ripas_change(kvm, vcpu, start, end, RIPAS_SET, top_ipa);
 
 	return ret;
 }
@@ -1587,7 +1616,9 @@ int realm_dev_mem_map(struct kvm *kvm, unsigned long rec_phys,
 	int ret;
 	unsigned long top_ipa;
 	unsigned long base_ipa = start_ipa;
+	struct realm *realm = &kvm->arch.realm;
 	struct kvm_s2_mmu *mmu = &kvm->arch.mmu;
+	phys_addr_t rd_phys = virt_to_phys(realm->rd);
 	struct kvm_mmu_memory_cache cache = { .gfp_zero = __GFP_ZERO };
 
 	do {
@@ -1614,6 +1645,24 @@ int realm_dev_mem_map(struct kvm *kvm, unsigned long rec_phys,
 		for (start_ipa = ALIGN(base_ipa, RMM_L2_BLOCK_SIZE);
 		     ((start_ipa + RMM_L2_BLOCK_SIZE) < end_ipa); start_ipa += RMM_L2_BLOCK_SIZE)
 			fold_rtt(&kvm->arch.realm, start_ipa, RMM_RTT_BLOCK_LEVEL);
+	} else {
+		/* unmap the partial mapping. */
+		while (start_ipa > base_ipa) {
+			unsigned long out_pa;
+			unsigned long out_ipa;
+
+			/* start_ipa is highest mapped ipa */
+			start_pa -= RMM_PAGE_SIZE;
+			start_ipa -= RMM_PAGE_SIZE;
+
+			WARN_ON(rmi_vdev_mem_unmap(rd_phys, start_ipa,
+					RMM_RTT_MAX_LEVEL, &out_pa, &out_ipa));
+
+			WARN_ON(start_pa != out_pa);
+			WARN_ON(start_ipa + RMM_PAGE_SIZE != out_ipa);
+			WARN_ON(rmi_granule_undelegate(out_pa));
+
+		}
 	}
 
 	return ret;
-- 
2.43.0


