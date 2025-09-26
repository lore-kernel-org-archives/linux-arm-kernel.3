Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A373CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 11:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8ro+z6I3e7rYWTf70PfE79qL/qbZpg+9acSDLSXYCc=; b=BX/oEUzbpit1tXE4AtS7LSNbty
	bFeVdJYhFz3hn/KgrAjopi56GV+Bm9Vbrc8AoJjTppQbwZVBjWY2Xr67uGDGpZeIDHjDNIvjnB1zx
	u05SXijb9xMLcAxmAZOG14dbEsN9UZpSx1KzarQ1iYrw5neuNB/QLmQSw4kPu4P6kVuWKjI4BfruL
	DiGq8fxmOLcVLyihxQUv0jOrlyYLw/03dKoA8zaS/LTGvnpjxYhghJPOuJVtGwUuNPmo0PfTBGcCX
	r3fa0sT8fOeyLjvIhbuk7VHYSZUUn9aLfHR3AiHyKcfr7bFqx6+ze3Ss/kWv6JIBdebtEM4pLzb2t
	W0Ikio/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26EY-00000000cqF-01Lh;
	Fri, 26 Sep 2025 11:03:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26ET-00000000clD-0FUx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 11:03:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48AC72BCC;
	Fri, 26 Sep 2025 04:03:12 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D58963F66E;
	Fri, 26 Sep 2025 04:03:16 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Steven Price <steven.price@arm.com>
Subject: [RFC PATCH 3/5] arm64: RME: Support RMI_EXIT_S2AP_CHANGE
Date: Fri, 26 Sep 2025 12:02:52 +0100
Message-ID: <20250926110254.55449-4-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926110254.55449-1-steven.price@arm.com>
References: <20250926110254.55449-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_040321_187875_18B17701 
X-CRM114-Status: GOOD (  15.90  )
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

If the primary plane of a realm wishes to change the access permissions
of memory for the other planes then this causes an exit to the normal
world. KVM then must complete the request using RMI_RTT_SET_S2AP which
may fail if there are missing RTTs. In this case KVM must allocate the
missing RTTs and retry.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/include/asm/kvm_rme.h |  3 +++
 arch/arm64/kvm/rme-exit.c        | 27 +++++++++++++++++++++++++++
 arch/arm64/kvm/rme.c             | 25 +++++++++++++++++++++----
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
index e5c0c8274bf8..934b30a8e607 100644
--- a/arch/arm64/include/asm/kvm_rme.h
+++ b/arch/arm64/include/asm/kvm_rme.h
@@ -112,6 +112,9 @@ int kvm_rec_pre_enter(struct kvm_vcpu *vcpu);
 int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_status);
 
 int realm_aux_map(struct kvm_vcpu *vcpu, phys_addr_t ipa);
+int kvm_realm_set_s2ap(struct kvm_vcpu *vcpu,
+		       unsigned long start,
+		       unsigned long end);
 
 void kvm_realm_unmap_range(struct kvm *kvm,
 			   unsigned long ipa,
diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
index 04c8af8642af..b7e615f7b3a9 100644
--- a/arch/arm64/kvm/rme-exit.c
+++ b/arch/arm64/kvm/rme-exit.c
@@ -112,6 +112,31 @@ static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
 	return -EFAULT;
 }
 
+static int rec_exit_s2ap_change(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct realm *realm = &kvm->arch.realm;
+	struct realm_rec *rec = &vcpu->arch.rec;
+	unsigned long base = rec->run->exit.s2ap_base;
+	unsigned long top = rec->run->exit.s2ap_top;
+	int ret = -EINVAL;
+
+	if (kvm_realm_is_private_address(realm, base) &&
+	    kvm_realm_is_private_address(realm, top)) {
+		kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_page_cache,
+					   kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
+		write_lock(&kvm->mmu_lock);
+		ret = kvm_realm_set_s2ap(vcpu, base, top);
+		write_unlock(&kvm->mmu_lock);
+	}
+
+	WARN_RATELIMIT(ret && ret != -ENOMEM,
+		       "Unable to satisfy SET_S2AP for %#lx - %#lx\n",
+		       base, top);
+
+	return 1;
+}
+
 static int rec_exit_host_call(struct kvm_vcpu *vcpu)
 {
 	int i;
@@ -192,6 +217,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
 		return rec_exit_psci(vcpu);
 	case RMI_EXIT_RIPAS_CHANGE:
 		return rec_exit_ripas_change(vcpu);
+	case RMI_EXIT_S2AP_CHANGE:
+		return rec_exit_s2ap_change(vcpu);
 	case RMI_EXIT_HOST_CALL:
 		return rec_exit_host_call(vcpu);
 	}
diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
index c420546d26f3..fa39a8393d53 100644
--- a/arch/arm64/kvm/rme.c
+++ b/arch/arm64/kvm/rme.c
@@ -1329,6 +1329,7 @@ static int kvm_populate_realm(struct kvm *kvm,
 enum ripas_action {
 	RIPAS_INIT,
 	RIPAS_SET,
+	SET_S2AP,
 };
 
 static int ripas_change(struct kvm *kvm,
@@ -1348,12 +1349,13 @@ static int ripas_change(struct kvm *kvm,
 		rec_phys = virt_to_phys(vcpu->arch.rec.rec_page);
 		memcache = &vcpu->arch.mmu_page_cache;
 
-		WARN_ON(action != RIPAS_SET);
+		WARN_ON(action == RIPAS_INIT);
 	} else {
 		WARN_ON(action != RIPAS_INIT);
 	}
 
 	while (ipa < end) {
+		unsigned long rtt_tree_idx = 0;
 		unsigned long next;
 
 		switch (action) {
@@ -1364,21 +1366,27 @@ static int ripas_change(struct kvm *kvm,
 			ret = rmi_rtt_set_ripas(rd_phys, rec_phys, ipa, end,
 						&next);
 			break;
+		case SET_S2AP:
+			ret = rmi_rtt_set_s2ap(rd_phys, rec_phys, ipa, end,
+					       &next, &rtt_tree_idx);
+			break;
 		}
 
 		switch (RMI_RETURN_STATUS(ret)) {
 		case RMI_SUCCESS:
 			ipa = next;
 			break;
-		case RMI_ERROR_RTT: {
+		case RMI_ERROR_RTT:
+		case RMI_ERROR_RTT_AUX: {
 			int err_level = RMI_RETURN_INDEX(ret);
 			int level = find_map_level(realm, ipa, end);
 
 			if (err_level >= level)
 				return -EINVAL;
 
-			ret = realm_create_rtt_levels(realm, ipa, err_level,
-						      level, memcache);
+			ret = realm_create_rtt_aux_levels(realm, ipa, err_level,
+							  level, rtt_tree_idx,
+							  memcache);
 			if (ret)
 				return ret;
 			/* Retry with the RTT levels in place */
@@ -1396,6 +1404,15 @@ static int ripas_change(struct kvm *kvm,
 	return 0;
 }
 
+int kvm_realm_set_s2ap(struct kvm_vcpu *vcpu,
+		       unsigned long start,
+		       unsigned long end)
+{
+	struct kvm *kvm = vcpu->kvm;
+
+	return ripas_change(kvm, vcpu, start, end, SET_S2AP, NULL);
+}
+
 static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
 			       unsigned long start,
 			       unsigned long end,
-- 
2.43.0


