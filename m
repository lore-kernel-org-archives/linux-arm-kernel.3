Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A13CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hF7FailYv+Ln6nxbjzEM/8FcOhFWUuPUwewYVZDC1Nw=; b=XpRioyXliIkjBrzX3phJF9ZrkI
	jVTXvY8qYHq+4MoMkUJFlwNIeBiNoRC7R41yLAoeV7LLINVEaY91iX7ctdtRIcWxtOR7C7ktOZt9r
	gQ/xb6r+DROrBDnwV9a5NLXgy6HLbG1aw1nSX7+IjnXIwYgxGZx+tpNy63wxmZTAl+/IdGVJXck6O
	yUTLuMnAqOeyI2vuUNbj5bscrOwZSHHUHdEH6Na2aqtVMzhnlvKLU4538vGChUMpHDcVV1ldRjuux
	RSmrh+B0cjXI/AjNijejMcvx51dO1yrFkS8wBMA3cuQhE3IpFqLwcmXZybPAn7FkksCWYHLRPTwoC
	lEvhp/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDegQ-0000000FwYJ-27hV;
	Mon, 05 Oct 2026 09:08:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDegN-0000000FwUO-0kXN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:08:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 312581684;
	Mon,  5 Oct 2026 02:08:23 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 910723F66F;
	Mon,  5 Oct 2026 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791191306; bh=z2LIrMIFE7EZF/TVEdQSDUxiMgdKOJBaWzN/bjwGxjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SwvMORJZlIlOgBlqZh4x7TdaL3H8J1hDi1q1+aJtu9rqzeKo/rcNdeMIazfX5Ef1p
	 FdVprzlhucKg4BGW0SNTxJAyrdvea6bmwDvgmGCFhfC+vqKh7YhEdtHlALsy4ozVrf
	 zPNQ0HTqLmrYktBSX946vASixC312jIvMqzAS1Ig=
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
Subject: [PATCH v22 06/23] KVM: arm64: Don't call vcpu_set_pauth_traps for pKVM host
Date: Mon,  5 Oct 2026 10:07:37 +0100
Message-ID: <20261005090754.2140522-7-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005090754.2140522-1-suzuki.poulose@arm.com>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_020827_454260_8435DDF7 
X-CRM114-Status: GOOD (  17.06  )
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
   more bigger and harder to review
---
 arch/arm64/kvm/arm.c | 52 +++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index bcec14c587119..50b84065ead1a 100644
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


