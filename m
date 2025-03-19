Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5622CC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 17:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxEFq+tkQsQY54WIjXCDvOVP0CS7ReLg86nKmRhTjhE=; b=cN52phUGX/AdZkZB8p3TP0tFsn
	aSGmUvcNE/rDfN9/FrGvwXfmFLFwL0kOx2ybYprXBhkJZGsgrcJqv7lDxeqkEFXw6Z7TFMZZWqOFa
	cUmULMNgUU4iVTPmPlKTBQx1y6+vQx93NGgo06ycyGORn2Q9ulaw3VPfCFX0RgGd7rLmQVgqmGLH4
	m9gBElh+zM59I1tawtPkrmz4NYaZXpX5ccnvLsnBeFK/V1HNt4hpg5P5D9CF6UVLPcSKuRmgpUqYT
	pAzmvBbe9ylTEHKN0hn5ZS0JnPhlLiEQLlC352gHE/7vYFhU/cD3vYjvw0NDMDgV1pCBRFOXOZRBt
	jre8INUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxKt-00000009j2o-0Z2h;
	Wed, 19 Mar 2025 17:36:11 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxHX-00000009iSq-3bVa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 17:32:45 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZHwgt5K67z6K9Fb;
	Thu, 20 Mar 2025 01:29:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5DEEB1409C9;
	Thu, 20 Mar 2025 01:32:42 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Mar 2025 18:32:35 +0100
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <kevin.tian@intel.com>, <jgg@ziepe.ca>,
	<alex.williamson@redhat.com>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<will@kernel.org>, <robin.murphy@arm.com>, <nicolinc@nvidia.com>,
	<jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>
Subject: [RFC PATCH v3 1/5] KVM: arm64: Introduce support to pin VMIDs
Date: Wed, 19 Mar 2025 17:31:58 +0000
Message-ID: <20250319173202.78988-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250319173202.78988-1-shameerali.kolothum.thodi@huawei.com>
References: <20250319173202.78988-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_103244_184274_920E7F77 
X-CRM114-Status: GOOD (  20.75  )
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

Introduce kvm_arm_pinned_vmid_get() and kvm_arm_pinned_vmid_put(), to pin
a VMID associated with a KVM instance. This will guarantee that VMID
remains the same after a rollover.

This is in preparation of introducing support in the SMMUv3 driver to use
the KVM VMID for S2 stage configuration in nested mode.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 ++
 arch/arm64/kvm/vmid.c             | 76 ++++++++++++++++++++++++++++++-
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index d919557af5e5..b6682f5d1b86 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -142,6 +142,7 @@ int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages);
 
 struct kvm_vmid {
 	atomic64_t id;
+	refcount_t pinned;
 };
 
 struct kvm_s2_mmu {
@@ -1261,6 +1262,8 @@ int __init kvm_arm_vmid_alloc_init(void);
 void __init kvm_arm_vmid_alloc_free(void);
 void kvm_arm_vmid_update(struct kvm_vmid *kvm_vmid);
 void kvm_arm_vmid_clear_active(void);
+int kvm_arm_pinned_vmid_get(struct kvm *kvm);
+void kvm_arm_pinned_vmid_put(struct kvm *kvm);
 
 static inline void kvm_arm_pvtime_vcpu_init(struct kvm_vcpu_arch *vcpu_arch)
 {
diff --git a/arch/arm64/kvm/vmid.c b/arch/arm64/kvm/vmid.c
index 7fe8ba1a2851..7bda189e927c 100644
--- a/arch/arm64/kvm/vmid.c
+++ b/arch/arm64/kvm/vmid.c
@@ -25,6 +25,10 @@ static unsigned long *vmid_map;
 static DEFINE_PER_CPU(atomic64_t, active_vmids);
 static DEFINE_PER_CPU(u64, reserved_vmids);
 
+static unsigned long max_pinned_vmids;
+static unsigned long nr_pinned_vmids;
+static unsigned long *pinned_vmid_map;
+
 #define VMID_MASK		(~GENMASK(kvm_arm_vmid_bits - 1, 0))
 #define VMID_FIRST_VERSION	(1UL << kvm_arm_vmid_bits)
 
@@ -47,7 +51,10 @@ static void flush_context(void)
 	int cpu;
 	u64 vmid;
 
-	bitmap_zero(vmid_map, NUM_USER_VMIDS);
+	if (pinned_vmid_map)
+		bitmap_copy(vmid_map, pinned_vmid_map, NUM_USER_VMIDS);
+	else
+		bitmap_zero(vmid_map, NUM_USER_VMIDS);
 
 	for_each_possible_cpu(cpu) {
 		vmid = atomic64_xchg_relaxed(&per_cpu(active_vmids, cpu), 0);
@@ -103,6 +110,14 @@ static u64 new_vmid(struct kvm_vmid *kvm_vmid)
 			return newvmid;
 		}
 
+		/*
+		 * If it is pinned, we can keep using it. Note that reserved
+		 * takes priority, because even if it is also pinned, we need to
+		 * update the generation into the reserved_vmids.
+		 */
+		if (refcount_read(&kvm_vmid->pinned))
+			return newvmid;
+
 		if (!__test_and_set_bit(vmid2idx(vmid), vmid_map)) {
 			atomic64_set(&kvm_vmid->id, newvmid);
 			return newvmid;
@@ -169,6 +184,55 @@ void kvm_arm_vmid_update(struct kvm_vmid *kvm_vmid)
 	raw_spin_unlock_irqrestore(&cpu_vmid_lock, flags);
 }
 
+int kvm_arm_pinned_vmid_get(struct kvm *kvm)
+{
+	struct kvm_vmid *kvm_vmid;
+	u64 vmid;
+
+	if (!pinned_vmid_map || !kvm)
+		return -EINVAL;
+
+	kvm_vmid = &kvm->arch.mmu.vmid;
+
+	guard(raw_spinlock_irqsave)(&cpu_vmid_lock);
+	vmid = atomic64_read(&kvm_vmid->id);
+
+	if (refcount_inc_not_zero(&kvm_vmid->pinned))
+		return (vmid & ~VMID_MASK);
+
+	if (nr_pinned_vmids >= max_pinned_vmids)
+		return -EINVAL;
+
+	/*
+	 * If we went through one or more rollover since that VMID was
+	 * used, make sure it is still valid, or generate a new one.
+	 */
+	if (!vmid_gen_match(vmid))
+		vmid = new_vmid(kvm_vmid);
+
+	nr_pinned_vmids++;
+	__set_bit(vmid2idx(vmid), pinned_vmid_map);
+	refcount_set(&kvm_vmid->pinned, 1);
+	return (vmid & ~VMID_MASK);
+}
+
+void kvm_arm_pinned_vmid_put(struct kvm *kvm)
+{
+	struct kvm_vmid *kvm_vmid;
+	u64 vmid;
+
+	if (!pinned_vmid_map || !kvm)
+		return;
+
+	kvm_vmid = &kvm->arch.mmu.vmid;
+	vmid = atomic64_read(&kvm_vmid->id);
+	guard(raw_spinlock_irqsave)(&cpu_vmid_lock);
+	if (refcount_dec_and_test(&kvm_vmid->pinned)) {
+		__clear_bit(vmid2idx(vmid), pinned_vmid_map);
+		nr_pinned_vmids--;
+	}
+}
+
 /*
  * Initialize the VMID allocator
  */
@@ -186,10 +250,20 @@ int __init kvm_arm_vmid_alloc_init(void)
 	if (!vmid_map)
 		return -ENOMEM;
 
+	pinned_vmid_map = bitmap_zalloc(NUM_USER_VMIDS, GFP_KERNEL);
+	nr_pinned_vmids = 0;
+
+	/*
+	 * Ensure we have at least one emty slot available after rollover
+	 * and maximum number of VMIDs are pinned. VMID#0 is reserved.
+	 */
+	max_pinned_vmids = NUM_USER_VMIDS - num_possible_cpus() - 2;
+
 	return 0;
 }
 
 void __init kvm_arm_vmid_alloc_free(void)
 {
+	bitmap_free(pinned_vmid_map);
 	bitmap_free(vmid_map);
 }
-- 
2.47.0


