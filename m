Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244A8C28B22
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfqIKZG28S2rSPiEQ0brMIbgRTgMNYuFfI/4SHaMPU8=; b=qwZ/frmodCK+SisXnXCUhXNg5c
	WJG4Z4S2k3RxD5A3lhI824jLAj7uL/8kWwzEpyOKNxOjnZLU/HFPcTzlYJBYug1D7f+a2POdqDMCJ
	xJIBOZxpy4Yuvdl8tk8Rr41XNru1S6JVOvbEjfEqkPLFMAioTnOfNcly/04i4vFf3qeJVaeV3SrZ1
	tlU6fCzhzhXyY0+Kc7ufxvGAOKokLmTNin5OsQrObHPoypiF+PYAbmwO+ysnMJ8b1SmdvyPi93h/A
	f5nYz/7hR7Py4WMKj5qT+y8r9kO7b79KCgA/9kTGtrfGYkBpPhvJW80A6WENioYCpHA8tDYbWnqUA
	HVUBMbqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx4i-00000009Sa0-2FBL;
	Wed, 05 Mar 2025 22:18:48 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKf-00000009D6E-1v2v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:27:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741206422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfqIKZG28S2rSPiEQ0brMIbgRTgMNYuFfI/4SHaMPU8=;
	b=Uu01N3n1m/d2hGWqII/ulvPTDgJK4auB0XLXgXIOUpzA2VtKUL6P1gZDlKnN23VYW9rJQD
	IlBIPwJDIvD2XJU1CciUwTwoCyBjsl9zlbHhH9JyUPEMTEJczBg7iXW1nK2ZF09O7Z0Unb
	nA0X/Zn8YlXNBRl9rcAbsz5yxQBsDMw=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v3 03/14] KVM: arm64: Compute PMCEID from arm_pmu's event bitmaps
Date: Wed,  5 Mar 2025 12:26:30 -0800
Message-Id: <20250305202641.428114-4-oliver.upton@linux.dev>
In-Reply-To: <20250305202641.428114-1-oliver.upton@linux.dev>
References: <20250305202641.428114-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_122709_648416_492ABCF7 
X-CRM114-Status: GOOD (  12.42  )
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

The PMUv3 driver populates a couple of bitmaps with the values of
PMCEID{0,1}, from which the guest's PMCEID{0,1} can be derived. This
is particularly convenient when virtualizing PMUv3 on IMP DEF hardware,
as reading the nonexistent PMCEID registers leads to a rather unpleasant
UNDEF.

Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 47 ++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 6c5950b9ceac..104672a0c5a2 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -842,8 +842,42 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
 	return pmu;
 }
 
+static u64 __compute_pmceid(struct arm_pmu *pmu, bool pmceid1)
+{
+	u32 hi[2], lo[2];
+
+	bitmap_to_arr32(lo, pmu->pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
+	bitmap_to_arr32(hi, pmu->pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
+
+	return ((u64)hi[pmceid1] << 32) | lo[pmceid1];
+}
+
+static u64 compute_pmceid0(struct arm_pmu *pmu)
+{
+	u64 val = __compute_pmceid(pmu, 0);
+
+	/* always support CHAIN */
+	val |= BIT(ARMV8_PMUV3_PERFCTR_CHAIN);
+	return val;
+}
+
+static u64 compute_pmceid1(struct arm_pmu *pmu)
+{
+	u64 val = __compute_pmceid(pmu, 1);
+
+	/*
+	 * Don't advertise STALL_SLOT*, as PMMIR_EL0 is handled
+	 * as RAZ
+	 */
+	val &= ~(BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT - 32) |
+		 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND - 32) |
+		 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_BACKEND - 32));
+	return val;
+}
+
 u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 {
+	struct arm_pmu *cpu_pmu = vcpu->kvm->arch.arm_pmu;
 	unsigned long *bmap = vcpu->kvm->arch.pmu_filter;
 	u64 val, mask = 0;
 	int base, i, nr_events;
@@ -852,19 +886,10 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 		return 0;
 
 	if (!pmceid1) {
-		val = read_sysreg(pmceid0_el0);
-		/* always support CHAIN */
-		val |= BIT(ARMV8_PMUV3_PERFCTR_CHAIN);
+		val = compute_pmceid0(cpu_pmu);
 		base = 0;
 	} else {
-		val = read_sysreg(pmceid1_el0);
-		/*
-		 * Don't advertise STALL_SLOT*, as PMMIR_EL0 is handled
-		 * as RAZ
-		 */
-		val &= ~(BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT - 32) |
-			 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND - 32) |
-			 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_BACKEND - 32));
+		val = compute_pmceid1(cpu_pmu);
 		base = 32;
 	}
 
-- 
2.39.5


