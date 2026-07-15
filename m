Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F6EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWcHpuMxpYCisKyhPLH9vgHoB10SUVnynvQlEFsGUmQ=; b=lDS2LssVU8YO091BVTmLuK17Zm
	2Kp1diT7y5aQ+EBSq45LjR9SKfDjizL69+oSwUUnR0wy91wMHdKpGmpbbGEesRB0qXONY+Zh0PTkW
	lRhTMKd6thezPDhxM9bbTLxFrE8aASvI5fcbOliOutOQMlm8Rn4SWPuoHMax5Vt0UpI+Gj1hsWsVO
	JFliHpIoWoSEvP0KY1gdCg9heRki9PwVzmktcXk1mngeBd4jPXWDqXxbEAvrojjwtsGG2zsBi5b5D
	fOGdnPtX5kvvKj9bUjLRxORpKAVlFfjV1AiQqacpilbFBC5YJoMPRBpFIt9bWkhRMgZJZs0jA+jBC
	5kAA1lfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dn-0000000F9yf-2b2Y;
	Wed, 15 Jul 2026 14:31:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dL-0000000F9MZ-0hNX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:30:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 454C41595;
	Wed, 15 Jul 2026 07:30:42 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 940823F93E;
	Wed, 15 Jul 2026 07:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784125846; bh=JZym60zbrF+ZMsN57R7TWSgm37sQOomsgrW5gOlLZu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbwb03nNFjXUcW1IZnu9G+dlaX2iZxpyhQQRpzBDed6sVsVmuaR5pE/RC10v8ctD9
	 KOwdpvlhO/sQDdbjWIRdt4Q09o8SruJXDM5sJih9ItRBD+CS84/MDWL0AT0F1WEMlz
	 ZkZgHQkUXGDN5hhjiNL2llvOYV+5qeVg2T92bODU=
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
Subject: [PATCH v15 23/37] KVM: arm64: CCA: Handle realm vCPU load
Date: Wed, 15 Jul 2026 15:28:25 +0100
Message-ID: <20260715142841.80544-24-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715142841.80544-1-steven.price@arm.com>
References: <20260715142841.80544-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_073047_276197_DE77CF11 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

When loading a realm VCPU much of the work is handled by the RMM so only
some of the actions are required. Rearrange kvm_arch_vcpu_load()
slightly so we can bail out early for a realm guest.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/kvm/arm.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 1558bb12b1b1..4ad9462e9d47 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -707,7 +707,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	struct kvm_s2_mmu *mmu;
 	int *last_ran;
 
-	if (is_protected_kvm_enabled())
+	if (is_protected_kvm_enabled() || kvm_is_realm(vcpu->kvm))
 		goto nommu;
 
 	if (vcpu_has_nv(vcpu))
@@ -751,12 +751,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_vgic_load(vcpu);
 	kvm_vcpu_load_debug(vcpu);
 	kvm_vcpu_load_fgt(vcpu);
-	if (has_vhe())
-		kvm_vcpu_load_vhe(vcpu);
-	kvm_arch_vcpu_load_fp(vcpu);
-	kvm_vcpu_pmu_restore_guest(vcpu);
-	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
-		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
 
 	if (kvm_vcpu_should_clear_twe(vcpu))
 		vcpu->arch.hcr_el2 &= ~HCR_TWE;
@@ -778,6 +772,17 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 			     &vcpu->arch.vgic_cpu.vgic_v3);
 	}
 
+	/* No additional state needs to be loaded on Realmed VMs */
+	if (vcpu_is_rec(vcpu))
+		return;
+
+	if (has_vhe())
+		kvm_vcpu_load_vhe(vcpu);
+	kvm_arch_vcpu_load_fp(vcpu);
+	kvm_vcpu_pmu_restore_guest(vcpu);
+	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
+		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
+
 	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
 		vcpu_set_on_unsupported_cpu(vcpu);
 
-- 
2.43.0


