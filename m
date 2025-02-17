Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9A3C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYxmjmcnv20EozxpBB0KUfwFbaSBl07wUtFd3IHALC0=; b=vpfM+9WSM24tDZNHz+eRvzqDTZ
	KtHUmuTjRd0xx7OhDHz6ISSUfxwe2nV7hF0iSfIW/exJzRkTqeizWnsF77+QtRuwXnhcRR8dGMuOd
	Zla0rKHSmqvPqDeFUxJInY366Nqf/hQT9uhqCKVYY5e7xjF1kbJhYDvDcafKt1YQhK1VMfHnA63Be
	BFu9NFMm/PB4ovndUXe8Gnq3Mm4tdHit60vyQ/WpsHoRLh0X4GThxIwkHIvg5Nh64FgMVAejt9E6d
	vxZhWiMEvTEvcRuRG+mELMpUS40gOttn+QmAG2WFaZEhwkht/yeDoNAlRzIV/mrSQdzR8u/vyzpY4
	DJpOb4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzHT-00000004Ikg-2lMR;
	Mon, 17 Feb 2025 11:27:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzEZ-00000004INs-3Psl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD98C5C475F;
	Mon, 17 Feb 2025 11:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A81C4CED1;
	Mon, 17 Feb 2025 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739791458;
	bh=/biC/eqcOUoVMy3qZKQSnx5pVvZiHxABcWjEY3QBkbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbqfxHrmf0TOXfFVgtSmwzLA/tcyzE7tEqQ4PYUYqCJPjJ8SCRugxWnSEzE6gxE8s
	 TcI5I7MdzoDRAKJ+GGVuTuRF1RI1P9njj+6c2pB72ow2xHnMA6b7Frzg22JWpTlZjy
	 Ew1aWOsiwdHJbk4R5MnMF/jIAMxciw17hz3CQyglLZj6sTrsrVEbg2c7ctUhtP9hRi
	 /kulcNhPH7BJzuCjR+8S5SPZpBu8Egn95yRbv2W7Blamoo99w1+QuM2uy2yJ3wKVlp
	 bl4Jgp+v8X2ZZUi1gUu7bBXHrTM3/Ae6hKZKoPZZx4dXtXKmIAVbO90S00mGR6Da4X
	 AYyZZib4jdUXg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjzEX-0052DP-4q;
	Mon, 17 Feb 2025 11:24:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 2/2] KVM: arm64: Contextualise the handling of PMCR_EL0.P writes
Date: Mon, 17 Feb 2025 11:24:12 +0000
Message-Id: <20250217112412.3963324-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250217112412.3963324-1-maz@kernel.org>
References: <20250217112412.3963324-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_032419_891363_9592254A 
X-CRM114-Status: GOOD (  14.13  )
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

Contrary to what the comment says in kvm_pmu_handle_pmcr(),
writing PMCR_EL0.P==1 has the following effects:

<quote>
The event counters affected by this field are:
  * All event counters in the first range.
  * If any of the following are true, all event counters in the second
    range:
    - EL2 is disabled or not implemented in the current Security state.
    - The PE is executing at EL2 or EL3.
</quote>

where the "first range" represent the counters in the [0..HPMN-1]
range, and the "second range" the counters in the [HPMN..MAX] range.

It so appears that writing P from EL2 should nuke all counters,
and not just the "guest" view. Just do that, and nuke the misleading
comment.

Reported-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/pmu-emul.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 5a71c3744c4d7..636cae89310cd 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -617,14 +617,12 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
 		kvm_pmu_set_counter_value(vcpu, ARMV8_PMU_CYCLE_IDX, 0);
 
 	if (val & ARMV8_PMU_PMCR_P) {
-		/*
-		 * Unlike other PMU sysregs, the controls in PMCR_EL0 always apply
-		 * to the 'guest' range of counters and never the 'hyp' range.
-		 */
 		unsigned long mask = kvm_pmu_implemented_counter_mask(vcpu) &
-				     ~kvm_pmu_hyp_counter_mask(vcpu) &
 				     ~BIT(ARMV8_PMU_CYCLE_IDX);
 
+		if (!vcpu_is_el2(vcpu))
+			mask &= ~kvm_pmu_hyp_counter_mask(vcpu);
+
 		for_each_set_bit(i, &mask, 32)
 			kvm_pmu_set_pmc_value(kvm_vcpu_idx_to_pmc(vcpu, i), 0, true);
 	}
-- 
2.39.2


