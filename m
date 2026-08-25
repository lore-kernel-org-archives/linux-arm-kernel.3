Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACA9C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxVC+lSpcdp6zC/q42HoC5ftqhEEen1ET2JCQPkvBbY=; b=MuE/AU0wfyCvvQql1XB+7FPeFT
	jtsj2ClYV+ZoJ5bvDjhVN4PAXc6YR2oQgJLk4rmeQ5c0q1od9nQKKHUOUpohWHyh6jciUHizK6qni
	bpEdDhblWKitKjiO3EILTBFSPokw4eC7Eczjib0y2UHND8CyY93nZMRJeEsvqcMP1wPKOrdRiABXj
	6lgepWs12JCqo6plctMIFDzaEGpCx02p3ZkkBO2FTb4NPG1xhUMUbjwknEMLqGX02JtrfumIghtNP
	7vvEuQA6LxZuvvHyXSNp9gT47TKCWBTZsftAloSqAGG8STlvelMHDFUPCT1CQ5RiksarFu/0pU/nB
	fhCJBlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn0n-00000000RRU-3mtC;
	Tue, 25 Aug 2026 09:00:05 +0000
Received: from out-123.mta0.migadu.com ([2001:41d0:1004:224b::7b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn0e-00000000ROI-3Uzn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:00:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LjE9PUUTQJc3Mt/mX5qIW0W4SIgnuYSMj4Bego/GGoo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787648394; v=1; x=1788253194;
 b=PizeKtKNVePp47zcXi4tGyWtNRvk0XL+iIwQqHTBQbuvzuNoPc86Zb58UuZi+HT9hzdBHnFU
 Be5pvemwNA+93yVZnHANCGbOwkcELitLVL/PLp0MC/Tb74JNHd29ootKvuFFDIXZKdoGWppOUlA
 J4JVq7NaRo59if/zZ4xKNH2k=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id e9bb1680c418ec1f;
	Tue, 25 Aug 2026 08:59:54 +0000
X-Mizu-Trace-ID: e9bb1680c418ec1f
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Stefan Teodorescu <fane@google.com>,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] KVM: arm64: Do not clear VM-wide SVE feature on vCPU init failure
Date: Tue, 25 Aug 2026 09:59:46 +0100
Message-Id: <20260825085948.1674721-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260825085948.1674721-1-fuad.tabba@linux.dev>
References: <20260825085948.1674721-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_015957_008088_620AF955 
X-CRM114-Status: GOOD (  11.35  )
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

pkvm_vcpu_init_sve() clears KVM_ARM_VCPU_SVE in kvm->arch.vcpu_features
when it fails, but vcpu_has_sve() tests KVM_ARCH_FLAG_GUEST_HAS_SVE,
which is left set. Later vCPUs on that VM then skip the SVE setup and
register with a NULL sve_state, which the guest's first FP access hands
to sve_load_state().

Return the error without touching vcpu_features.

Fixes: 5db1bef93342 ("KVM: arm64: Track SVE state in the hypervisor vcpu structure")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 095ebfce91b08..73e6ee059eebb 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -451,7 +451,7 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
 	unsigned int sve_max_vl;
 	size_t sve_state_size;
 	void *sve_state;
-	int ret = 0;
+	int ret;
 
 	if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE)) {
 		vcpu_clear_flag(vcpu, VCPU_SVE_FINALIZED);
@@ -462,24 +462,19 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
 	sve_max_vl = min(READ_ONCE(host_vcpu->arch.sve_max_vl), kvm_host_sve_max_vl);
 	sve_state = kern_hyp_va(READ_ONCE(host_vcpu->arch.sve_state));
 
-	if (!sve_vl_valid(sve_max_vl) || !sve_state) {
-		ret = -EINVAL;
-		goto err;
-	}
+	if (!sve_vl_valid(sve_max_vl) || !sve_state)
+		return -EINVAL;
 
 	sve_state_size = sve_state_size_from_vl(sve_max_vl);
 
 	ret = hyp_pin_shared_mem(sve_state, sve_state + sve_state_size);
 	if (ret)
-		goto err;
+		return ret;
 
 	vcpu->arch.sve_state = sve_state;
 	vcpu->arch.sve_max_vl = sve_max_vl;
 
 	return 0;
-err:
-	clear_bit(KVM_ARM_VCPU_SVE, vcpu->kvm->arch.vcpu_features);
-	return ret;
 }
 
 static int vm_copy_id_regs(struct pkvm_hyp_vcpu *hyp_vcpu)
-- 
2.39.5


