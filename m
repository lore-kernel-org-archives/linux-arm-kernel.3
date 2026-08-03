Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A3FC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1L50MxCTmUUMSB/93uAMYthGBrgS30awVgLBGu7jRE=; b=XudLgzgF2B6cWrWYgJLW2N+55v
	1ise8GGiReAuiiilSYaoGZlcW4VpD0KD9PfMiNGbZETlOrPJXbaAenCZix8dKTZmvcUiAyDvZu9Xu
	RmREvz1sWdRhDitINIt5N34TdifT2l7Wx8yG6ASfUjqzOw/WMnpulVnkAQXceYbBJ2rbOb7T5vXeE
	oQmb33rPvOswbi8JWv0jfD4A2G9RGsf8dM8SNt/P5nsXx5CMQYnbZ+1Az4x2BdD2s1lsbx9MtsJRk
	zMmvNJ4XgK5VkSwe8wDGFdIssBMkCJMLyOxsnGIJ6JJQuyB8IcBcmhdYn9rujmRZnb1AVQ7bZXa7j
	AnVU+zDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqszj-0000000HDWw-1t74;
	Mon, 03 Aug 2026 13:46:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqszf-0000000HDRp-0Xiv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:46:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82CCB1476;
	Mon,  3 Aug 2026 06:46:10 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25FCB3F66F;
	Mon,  3 Aug 2026 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764774; bh=m0q9iQzfENu+IKhVoifkCF21JYCMmwdvHCqfJcAPwSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V2ITscyGrIwMX4uOOOQowYWBHyZljrJUHnrmxNALBcYB57/yWYVkLVKGxxXMAZ1ER
	 IrEYy6XnYC5/OIb8KDdhwtFqMCxZ/yrhkkkA3xZ5M2Ncn/HxPGLObK4SkAJUKncYVv
	 dWe60VEONtq033OE1n/aRwowa6u4+qalhg1K2YBQ=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v16 25/45] KVM: arm64: CCA: Create the realm descriptor
Date: Mon,  3 Aug 2026 14:43:41 +0100
Message-ID: <20260803134403.80630-26-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064615_289053_3793C3AB 
X-CRM114-Status: GOOD (  16.31  )
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

Creating a realm involves first creating a realm descriptor (RD). This
involves passing the configuration information to the RMM. Do this as
part of realm_ensure_created() so that the realm is created when it is
first needed. The call to realm_ensure_created() will be added in a
later patch.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v15:
 * The page for realm parameters is now only temporarily allocated in
   realm_create_rd().
 * Deal with negative error codes.
Changes since v14:
 * Explicitly set hash_algo = RMI_HASH_SHA_256 (which is the default).
 * Support SRO flow during realm creation.
Changes since v13:
 * The RMM no longer uses AUX granules, so no need to ask it how many it
   needs.
 * Adapted to other changes.
Changes since v12:
 * Since RMM page size is now equal to the host's page size various
   calculations are simplified.
 * Switch to using range based APIs to delegate/undelegate.
 * VMID handling is now handled entirely by the RMM.
---
 arch/arm64/kvm/rmi.c | 95 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index a7202054c8e6..31eedf78a752 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -462,6 +462,83 @@ static void realm_unmap_shared_range(struct kvm *kvm,
 			     start, end);
 }
 
+static int realm_create_rd(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+	struct realm_params *params __free(free_page) = NULL;
+	void *rd = NULL;
+	phys_addr_t rd_phys, params_phys, top_delegated;
+	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
+	long rmi_ret;
+	int r;
+
+	realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
+
+	if (WARN_ON(realm->rd))
+		return -EEXIST;
+
+	params = (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
+	if (!params)
+		return -ENOMEM;
+
+	rd = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	if (!rd)
+		return -ENOMEM;
+
+	rd_phys = virt_to_phys(rd);
+	if (rmi_delegate_page(rd_phys)) {
+		r = -ENXIO;
+		goto free_rd;
+	}
+
+	if (rmi_delegate_range(kvm->arch.mmu.pgd_phys, pgd_size,
+			       &top_delegated)) {
+		r = -ENXIO;
+		goto out_undelegate_tables;
+	}
+
+	params->s2sz = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
+	params->rtt_level_start = get_start_level(realm);
+	params->rtt_num_start = pgd_size / PAGE_SIZE;
+	params->rtt_base = kvm->arch.mmu.pgd_phys;
+	params->hash_algo = RMI_HASH_SHA_256;
+
+	if (kvm->arch.arm_pmu) {
+		params->pmu_num_ctrs = kvm->arch.nr_pmu_counters;
+		params->flags0 |= RMI_REALM_PARAM_FLAG_PMU;
+	}
+
+	if (kvm_lpa2_is_enabled())
+		params->flags0 |= RMI_REALM_PARAM_FLAG_LPA2;
+
+	params_phys = virt_to_phys(params);
+
+	rmi_ret = rmi_realm_create(rd_phys, params_phys, realm->sro);
+	if (rmi_ret) {
+		r = rmi_ret < 0 ? rmi_ret : -ENXIO;
+		goto out_undelegate_tables;
+	}
+
+	realm->rd = rd;
+	kvm_set_realm_state(kvm, REALM_STATE_NEW);
+
+	return 0;
+
+out_undelegate_tables:
+	if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys,
+					 top_delegated - kvm->arch.mmu.pgd_phys))) {
+		/* Leak the pages if they cannot be returned */
+		kvm->arch.mmu.pgt = NULL;
+	}
+	if (WARN_ON(rmi_undelegate_page(rd_phys))) {
+		/* Leak the page if it isn't returned */
+		return r;
+	}
+free_rd:
+	free_page((unsigned long)rd);
+	return r;
+}
+
 static void realm_unmap_private_range(struct kvm *kvm,
 				      unsigned long start,
 				      unsigned long end,
@@ -632,6 +709,24 @@ static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
 	return ret;
 }
 
+static int __maybe_unused realm_ensure_created(struct kvm *kvm)
+{
+	lockdep_assert_held(&kvm->arch.config_lock);
+
+	switch (kvm_realm_state(kvm)) {
+	case REALM_STATE_NONE:
+		break;
+	case REALM_STATE_NEW:
+		return 0;
+	case REALM_STATE_DEAD:
+		return -ENXIO;
+	default:
+		return -EBUSY;
+	}
+
+	return realm_create_rd(kvm);
+}
+
 static int kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
-- 
2.43.0


