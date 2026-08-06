Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F46C56203
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHCSHflXhVlLm5RFxN/ZdQsm2IC8U/hNfit+tq/GzoA=; b=oA9GgtupBbvHeKZsDoqAutE0Jm
	jvFV5i+X+7n4omq+huqppaufqZnMzKWyiS1LrgJFyVUAL/0eflf/ZZl7NlyNwrgxHRrvdlM2qgHRT
	zOxjjoa+RGnvR+MgbW4/fLtdFlTQ0gncg6qnW0ekvLzCF4Bygv5JM4mgtqz8C6Fs+25uyy8B5lX9z
	VZRv691oc1xo9r5jiWj4/qegnBXajRKcvQ41duxr5BA+h2BPiEPqTv0NroLya+MqhF5BFmbeY5/64
	pup2jJrSvOaEM6ZEczJsH2tG82PL2yltzDM7WlC4a317nCyjPgNXIe5cR7+e3g7WQymhIlyNw/u00
	IL2eQJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wru7a-00000005L2b-0wBO;
	Thu, 06 Aug 2026 09:10:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wru7X-00000005L19-2HnP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:10:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2DC360AAC;
	Thu,  6 Aug 2026 09:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DDE1F00A3D;
	Thu,  6 Aug 2026 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786007434;
	bh=GHCSHflXhVlLm5RFxN/ZdQsm2IC8U/hNfit+tq/GzoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F2xTVHF+d62+QARwlyvbIPVQHgVacoGfgIYzYYyV82B0sFTJJpWuNPrxzMBFZyInK
	 gDFFIFwKOYjyzQaFunttXOXALYGKOXrycJzm1NDRBCeM2YHiD7wso1IymHjnMwcUr4
	 185+7EbmllwgxxRNAfd+W6eVnwsBthnaivoFvkuSHT/EWSkqtyWwy5zqRmduGjAeYQ
	 gbX/+XcORI/o5mbqCubHF/Nl4GHs5RAlIIxPyHoP5eJnCgmxYENtxZVp16d1BPfNjI
	 rpPgpSVoF3PaK9RVi8bYOT6jAvD+eKTVfOz3MljlFTy7fVMqbkfrcrCjD2Gtb73a8M
	 h1y8m1BtDgAHA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wru7T-0000000CtHi-3gZi;
	Thu, 06 Aug 2026 09:10:31 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	ljs@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/8] KVM: arm64: Remove VM-wide VNCR mapping counter
Date: Thu,  6 Aug 2026 10:10:19 +0100
Message-ID: <20260806091026.620700-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806091026.620700-1-maz@kernel.org>
References: <20260806091026.620700-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, imv4bel@gmail.com, yaoyuan@linux.alibaba.com, ljs@kernel.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The global VNCR mapping counter is used to decide whether an L1
provided VNCR page is mapped in L0 on any CPU at the point of
dealing with a TLB invalidation. It is incremented when a mapping
is made in the fixmap, and decremented when unmapped.

As it turns out, this tracking has several flaws:

- we are trying to invalidate TLBs, and the mapping is only an
  opportunistic consequence of the TLB. Checking this counter to
  decide whether a TLB needs to be invalidated may result in missed
  invalidations.

- an L1 vcpu invalidating its own TLB (a very likely case) will not
  succeed in invalidating the VNCR pseudo TLB because that page is
  not mapped in L0 at this stage.

Given that this tracking fails at delivering the minimum guarantees
that are required and is only a performance optimisation, remove it
completely.

Fixes: 4ffa72ad8f37e ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/kvm_host.h | 3 ---
 arch/arm64/kvm/hyp/vhe/switch.c   | 3 +--
 arch/arm64/kvm/nested.c           | 3 ---
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bae2c4f92ef5c..ac16f96c878d6 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -411,9 +411,6 @@ struct kvm_arch {
 	/* Masks for VNCR-backed and general EL2 sysregs */
 	struct kvm_sysreg_masks	*sysreg_masks;
 
-	/* Count the number of VNCR_EL2 currently mapped */
-	atomic_t vncr_map_count;
-
 	/*
 	 * For an untrusted host VM, 'pkvm.handle' is used to lookup
 	 * the associated pKVM instance in the hypervisor.
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index bbe9cebd3d9d5..c09b1d411c584 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -427,8 +427,7 @@ static bool kvm_hyp_handle_tlbi_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
 	 * If we have to check for any VNCR mapping being invalidated,
 	 * go back to the slow path for further processing.
 	 */
-	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu) &&
-	    atomic_read(&vcpu->kvm->arch.vncr_map_count))
+	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu))
 		return false;
 
 	__kvm_skip_instr(vcpu);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index dfb96edbdc43c..f3c75954cf36c 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -48,7 +48,6 @@ void kvm_init_nested(struct kvm *kvm)
 {
 	kvm->arch.nested_mmus = NULL;
 	kvm->arch.nested_mmus_size = 0;
-	atomic_set(&kvm->arch.vncr_map_count, 0);
 }
 
 static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
@@ -890,7 +889,6 @@ static void this_cpu_reset_vncr_fixmap(struct kvm_vcpu *vcpu)
 	clear_fixmap(vncr_fixmap(vcpu->arch.vncr_tlb->cpu));
 	vcpu->arch.vncr_tlb->cpu = -1;
 	host_data_clear_flag(L1_VNCR_MAPPED);
-	atomic_dec(&vcpu->kvm->arch.vncr_map_count);
 }
 
 void kvm_vcpu_put_hw_mmu(struct kvm_vcpu *vcpu)
@@ -1592,7 +1590,6 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
 	if (pgprot_val(prot) != pgprot_val(PAGE_NONE)) {
 		__set_fixmap(vncr_fixmap(vt->cpu), vt->hpa, prot);
 		host_data_set_flag(L1_VNCR_MAPPED);
-		atomic_inc(&vcpu->kvm->arch.vncr_map_count);
 	}
 }
 
-- 
2.47.3


