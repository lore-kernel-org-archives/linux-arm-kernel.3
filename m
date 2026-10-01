Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D50CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/odbqFx//X9ltKCEx4aEosrpdqitw1LLL/sxuBe91Vs=; b=SqMqe1wkH07JieRDrEbA/oVzCI
	3A4ka1MRaYEvj8Y7pk9Zl5eOiv/UYMdGJS+Di6fLkfs5AM6lSXJevxitf6CJYgtacHylPCxNql2nY
	PHNuTErl2hdI2eOhfgPKYm6RQKNAgrIjDpDe8UcrD4A1E7Lb18Be44Lq7w5r4W4dB8e0gzdBMtiX7
	1gKPZq4aU/XtFBAK/FFLmzMjoHtkiWh72pY3eiDkZqdj1j/tREYjJ9BzbPCUDppd1wZMP4dKwcpeE
	6HwJhf8JwVroIEdhOCBzfMVPO8cd82IsuD8JBbd60m/0qviFO8I/KquLm/zspKRWOUuu49/nNi2qd
	emMdsHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO0L-0000000ACvI-3cGy;
	Thu, 01 Oct 2026 21:07:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO0F-0000000ACqs-3KYp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:07:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE0A516F8;
	Thu,  1 Oct 2026 14:07:39 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6F853F86F;
	Thu,  1 Oct 2026 14:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790888863; bh=j2b9WHiFALCo+wdRBdRdHxhVuEWadLpkN31xoR3hUMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKp2m88BEP8UjjaMtzOnAOlB0XEAjpA0fUMeSq/50GCT3jT6luaoY+7pbxkFXoxy3
	 v5rKP1/oIlbOBwKZTo3moFu5CySqSDNB8YBAWrYDnLsMUaVg3Tk1CxuP0fQ5kHOlHn
	 Xylq0bpm4/3EuHBUuABuW5ebwW/G2thCSrtCYjpU=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v21 06/23] KVM: arm64: Don't call vcpu_set_pauth_traps for pKVM host
Date: Thu,  1 Oct 2026 22:06:46 +0100
Message-ID: <20261001210703.1597150-7-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001210703.1597150-1-suzuki.poulose@arm.com>
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_140744_791593_6022574C 
X-CRM114-Status: GOOD (  17.03  )
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

vcpu_set_pauth_traps() bails out and does nothing for pKVM hosts.
Clean this up by moving the is_protected_kvm_enabled() check to the
caller, in preparation for adding VM specific vcpu load/put callbacks.

While at it, do an early return if the vcpu doesn't have ptrauth.

No functional changes

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v19:
 - New patch, since addition of this to the Refactoring patch makes it a bit
   more bigger and harder to follow
---
 arch/arm64/kvm/arm.c | 52 +++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 90547fbbc8ad7..849f5fcc26c15 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -631,33 +631,34 @@ void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 
 static void vcpu_set_pauth_traps(struct kvm_vcpu *vcpu)
 {
-	if (vcpu_has_ptrauth(vcpu) && !is_protected_kvm_enabled()) {
-		/*
-		 * Either we're running an L2 guest, and the API/APK bits come
-		 * from L1's HCR_EL2, or API/APK are both set.
-		 */
-		if (unlikely(is_nested_ctxt(vcpu))) {
-			u64 val;
+	if (!vcpu_has_ptrauth(vcpu))
+		return;
 
-			val = __vcpu_sys_reg(vcpu, HCR_EL2);
-			val &= (HCR_API | HCR_APK);
-			vcpu->arch.hcr_el2 &= ~(HCR_API | HCR_APK);
-			vcpu->arch.hcr_el2 |= val;
-		} else {
-			vcpu->arch.hcr_el2 |= (HCR_API | HCR_APK);
-		}
+	/*
+	 * Either we're running an L2 guest, and the API/APK bits come
+	 * from L1's HCR_EL2, or API/APK are both set.
+	 */
+	if (unlikely(is_nested_ctxt(vcpu))) {
+		u64 val;
 
-		/*
-		 * Save the host keys if there is any chance for the guest
-		 * to use pauth, as the entry code will reload the guest
-		 * keys in that case.
-		 */
-		if (vcpu->arch.hcr_el2 & (HCR_API | HCR_APK)) {
-			struct kvm_cpu_context *ctxt;
+		val = __vcpu_sys_reg(vcpu, HCR_EL2);
+		val &= (HCR_API | HCR_APK);
+		vcpu->arch.hcr_el2 &= ~(HCR_API | HCR_APK);
+		vcpu->arch.hcr_el2 |= val;
+	} else {
+		vcpu->arch.hcr_el2 |= (HCR_API | HCR_APK);
+	}
 
-			ctxt = this_cpu_ptr_hyp_sym(kvm_hyp_ctxt);
-			ptrauth_save_keys(ctxt);
-		}
+	/*
+	 * Save the host keys if there is any chance for the guest
+	 * to use pauth, as the entry code will reload the guest
+	 * keys in that case.
+	 */
+	if (vcpu->arch.hcr_el2 & (HCR_API | HCR_APK)) {
+		struct kvm_cpu_context *ctxt;
+
+		ctxt = this_cpu_ptr_hyp_sym(kvm_hyp_ctxt);
+		ptrauth_save_keys(ctxt);
 	}
 }
 
@@ -749,7 +750,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TWI;
 
-	vcpu_set_pauth_traps(vcpu);
+	if (!is_protected_kvm_enabled())
+		vcpu_set_pauth_traps(vcpu);
 
 	if (is_protected_kvm_enabled()) {
 		kvm_call_hyp_nvhe(__pkvm_vcpu_load,
-- 
2.43.0


