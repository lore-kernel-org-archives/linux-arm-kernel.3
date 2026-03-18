Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A978103E198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=At2/CLDxhNPpwjikry66+7jlBHjAq3Xrc9H+qzAA/Ok=; b=cMhfFBxx3qked4aAV16EFqzhX0
	/usIRG2K/p5ZuEJfJRLBj2TYVs+CKjzl6XhVmh4H1KT/1zmZp/2otKmoumRWFIIke9hCiimsjYoMo
	X6OvX65R48c4fcn7HgNFs0DpHcempOcoS8pBqE48mEwRvgaxpSXUQg9OqvpdUJRJIR/QbcGMg4tSc
	LWgrIOD7nF99Wg2u81Jq6SyKSCxpp+WIz1DWV/kQA9ejC7Nbsro4EmrAnx/a8vsXKN9Cdch9srCh/
	3uSB+0ViTDd+cebq3GyT5ddp0vsS6m0UhsSdJutGfMpjad+P0O15VoeONVDnwp2qHcyQgwlp79/5p
	1kijXVLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tGv-00000008qkY-3IG1;
	Wed, 18 Mar 2026 15:57:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tGb-00000008qMu-43Yl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 15:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=At2/CLDxhNPpwjikry66+7jlBHjAq3Xrc9H+qzAA/Ok=; b=IXIQItZIAqNUJ71Nc/ioPTHdD9
	LBgOfDz8LauDqnww0gzIXEHZcMPEHouoKuctRjrbkY22i/74HoLQE3EOQ74wMxHQ9NdBQnJlQ1PoZ
	hu+job83tuEPjdffg9NzQq+wZ5Pvjc0p4JdiY9VKslr7Hr4mUHeWvV5Fug92LrOB5VgYkFHS+J5rR
	Ci3BQZMH2q9RNULjfgff0Jpz3qJ4Hf+A1q5XgcE6/Y26H4iCxaeK9Xk8YBtkpedIZYZR5E49ntCbT
	8+2Kh6o2Z+9opzVtHxYe2KErkpw48EIogEK+3/K2Iw+gQPd79cwUkX9aTlCAN4hF+n8/Un3n2YFyO
	F/7wgIkQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tGY-0000000Bdzm-2aWG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:57:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1528A2050;
	Wed, 18 Mar 2026 08:56:55 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14B423F73B;
	Wed, 18 Mar 2026 08:56:57 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
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
	Steven Price <steven.price@arm.com>
Subject: [PATCH v13 43/48] arm64: RMI: Configure max SVE vector length for a Realm
Date: Wed, 18 Mar 2026 15:54:07 +0000
Message-ID: <20260318155413.793430-44-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_155703_055980_2E065A3B 
X-CRM114-Status: GOOD (  16.92  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Obtain the max vector length configured by userspace on the vCPUs, and
write it into the Realm parameters. By default the vCPU is configured
with the max vector length reported by RMM, and userspace can reduce it
with a write to KVM_REG_ARM64_SVE_VLS.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v6:
 * Rename max_vl/realm_max_vl to vl/last_vl - there is nothing "maximum"
   about them, we're just checking that all realms have the same vector
   length
---
 arch/arm64/kvm/guest.c |  3 ++-
 arch/arm64/kvm/rmi.c   | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 705c2ccc335d..999edf0b5219 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -361,7 +361,7 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	if (!vcpu_has_sve(vcpu))
 		return -ENOENT;
 
-	if (kvm_arm_vcpu_sve_finalized(vcpu))
+	if (kvm_arm_vcpu_sve_finalized(vcpu) || kvm_realm_is_created(vcpu->kvm))
 		return -EPERM; /* too late! */
 
 	if (WARN_ON(vcpu->arch.sve_state))
@@ -756,6 +756,7 @@ static bool validate_realm_set_reg(struct kvm_vcpu *vcpu,
 		switch (reg->id) {
 		case KVM_REG_ARM_PMCR_EL0:
 		case KVM_REG_ARM_ID_AA64DFR0_EL1:
+		case KVM_REG_ARM64_SVE_VLS:
 			return true;
 		}
 	}
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index f2aeda7f5e6e..f69151d4235a 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -706,6 +706,39 @@ static void realm_unmap_shared_range(struct kvm *kvm,
 			     start, end);
 }
 
+static int realm_init_sve_param(struct kvm *kvm, struct realm_params *params)
+{
+	unsigned long i;
+	struct kvm_vcpu *vcpu;
+	int vl, last_vl = -1;
+
+	if (!kvm_has_sve(kvm))
+		return 0;
+
+	/*
+	 * Get the preferred SVE configuration, set by userspace with the
+	 * KVM_ARM_VCPU_SVE feature and KVM_REG_ARM64_SVE_VLS pseudo-register.
+	 */
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		if (!kvm_arm_vcpu_sve_finalized(vcpu))
+			return -EINVAL;
+
+		vl = vcpu->arch.sve_max_vl;
+
+		/* We need all vCPUs to have the same SVE config */
+		if (last_vl >= 0 && last_vl != vl)
+			return -EINVAL;
+
+		last_vl = vl;
+	}
+
+	if (last_vl > 0) {
+		params->sve_vl = sve_vq_from_vl(last_vl) - 1;
+		params->flags |= RMI_REALM_PARAM_FLAG_SVE;
+	}
+	return 0;
+}
+
 static int realm_create_rd(struct kvm *kvm)
 {
 	struct realm *realm = &kvm->arch.realm;
@@ -751,6 +784,10 @@ static int realm_create_rd(struct kvm *kvm)
 	if (kvm_lpa2_is_enabled())
 		params->flags |= RMI_REALM_PARAM_FLAG_LPA2;
 
+	r = realm_init_sve_param(kvm, params);
+	if (r)
+		goto out_undelegate_tables;
+
 	params_phys = virt_to_phys(params);
 
 	if (rmi_realm_create(rd_phys, params_phys)) {
-- 
2.43.0


