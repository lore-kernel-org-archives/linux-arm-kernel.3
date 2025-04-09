Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF95C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAzktJ/0XlnB3gGEY/g9nF8A2Lqw4IqxaUM2olb9mzY=; b=E/yYydgEU7HQo+d9MsnJnDcLw3
	5D5bNyUDWfcJCyPhnsQTq76f1KN9GawyWzLX47nVwU177vNJmgMGGNHjo7Vj03whlZOrgL4HrWKth
	vUO4mcGS8euGbjytTqxpuUU4m14XdrHCwC6PgTStAZ/Z80n0sZdpfaQFRQEUZD39T7I5Avz7s9KH9
	H4JMqOPKEk7I49BOuGwTsxuV1w6S7HKEvd58rw3StdiuBvZPpU9R1W2Io5i+/Slj26QlZ925sgXEQ
	6JlrrQFQZSY+ha3LXZhYtW0dRalv76gHvZRE0SoS9AHXpugQ9A9D9fusowXhOQlI7tH9s36AJIPJl
	ol5EJd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Y0R-00000007qBs-2cHI;
	Wed, 09 Apr 2025 16:10:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xrf-00000007oQt-1aAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96F6F4A0DF;
	Wed,  9 Apr 2025 16:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486B4C4CEEC;
	Wed,  9 Apr 2025 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214482;
	bh=DHz376aawgvSsxJ0B6qhnTizqqNaXEuRGrIx/tSGW18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AMQXwYudUx6ShJLREac/0zMnj7zJOIiGAGOk6oNMfi+XrKJGjizhGDHjnJToym3qa
	 DHErx8QYMBarPGokHjnLDT0jQDQLiGPvJURpcvox9I34IlALY8Clfl6uQToah/V0ea
	 38vk/UhIBA3zfsQNbZmunRx9yvIGIuyQRDEOaXWCxP0E2Xq4aWDdpRghQ8+1ZylPDQ
	 wde9OIGb3boDO1QeeVCBajP08JBsuAmIOLB5oQUlVanHusy1vv51GFn+Yn20MOvkGc
	 zSAdnJTsQhyh1A03XiiWAvO2bA6IPnOYXkMiJYsLpeW+LjnwiNsgZ/WoeUDVY9LF1v
	 OXc2nXE9rjj8g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u2Xrc-003vQT-CS;
	Wed, 09 Apr 2025 17:01:20 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 2/6] KVM: arm64: Contextualise the handling of PMCR_EL0.P writes
Date: Wed,  9 Apr 2025 17:01:02 +0100
Message-Id: <20250409160106.6445-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250409160106.6445-1-maz@kernel.org>
References: <20250409160106.6445-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_090123_441896_42F40277 
X-CRM114-Status: GOOD (  15.11  )
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
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/pmu-emul.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 4dc4f3a473c3f..f3650f2f2d468 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -608,14 +608,12 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
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


