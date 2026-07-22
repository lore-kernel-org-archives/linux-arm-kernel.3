Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271F7C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tdZIKqk1KOwy6KV41836GjWMmzaCTY8AMcClAGUR5I=; b=iQjooZbSOH37nLzxkuMUaFOD12
	zf2mQ0lgedYxN6AY2NvpVN5vDA10ONvuBPyP1LF/42ovNuT8NTR3BqdFwWNk+23fl8l/fNyANr1rI
	AdwyoUtdkxjtL7zC/agqfQjzE5NfUPvxe+zHh9j0onXVh5INIWwb85xD8LYmYn/C6iH1n7w+YU/kz
	U0tmfaXB6NFI08HEOBlWd+lDmC9brUB+nnr/JOVvumFjg4w64CGrkh3tdwxwE105h2o8x1tKpjab9
	r+0qHiujY0kOdNEPTLN/2eETb57YPSJ5v/B6rpznLuYr+UkhiqEPP4Ror5qGxbR19932efWN1j98D
	43GILwog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdXT-0000000Cie1-2pGY;
	Wed, 22 Jul 2026 20:27:35 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdXL-0000000CiaR-3X9B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784752047; x=1816288047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4tdZIKqk1KOwy6KV41836GjWMmzaCTY8AMcClAGUR5I=;
  b=fJr8nRtXCKJbbvfuh0XSMlu60YE2wuCVTnO2etEfultHwCIVzbWcp4F/
   bcAITa4VUy0zsyDSGJJy/9ku1VYJq+5VdNadnA6lBUGfFqTq9YJQo61c4
   69eE71ljRFYjDJCq3E4ZKYFILp5XoNoXqTajdJkuc/NHbnVEu28bVM1Cg
   cptcYu45MyvLBmM1MsfxFhfAq3jhtK5lRQkr00ucnCOV4oL8JZ9B9BNhi
   Io5vumFmBmMPHwvjTWi0OxId1NxlbFUSfxaQoJI0nRDO3I8wZnbXHFXqq
   j10NyynujQluC1x0gwHrGbbEApMRaDkY7vNcRc8VsIofkUuATYARijLXK
   g==;
X-CSE-ConnectionGUID: ugh81CEfS0mBEyUZjWZN0w==
X-CSE-MsgGUID: UKx1CdUoQbOsXiVEsf/Wbg==
X-IronPort-AV: E=Sophos;i="6.25,179,1779148800"; 
   d="scan'208";a="24175846"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 20:27:23 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:15180]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.176:2525] with esmtp (Farcaster)
 id d2a3db87-e10d-48ee-8a5c-527d8b8a4244; Wed, 22 Jul 2026 20:27:23 +0000 (UTC)
X-Farcaster-Flow-ID: d2a3db87-e10d-48ee-8a5c-527d8b8a4244
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Wed, 22 Jul 2026 20:27:23 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Wed, 22 Jul 2026
 20:27:22 +0000
From: Congkai Tan <congkai@amazon.com>
To: Oliver Upton <oupton@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
CC: Congkai Tan <congkai@amazon.com>, Marc Zyngier <maz@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, "Haris
 Okanovic" <harisokn@amazon.com>, Geoff Blake <blakgeof@amazon.com>,
	"Stanislav Spassov" <stanspas@amazon.de>, <kvm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/4] KVM: arm64: Advertise STALL_SLOT* in PMCEID1 under strict PMUv3 UAPI
Date: Wed, 22 Jul 2026 20:27:00 +0000
Message-ID: <20260722202702.4165917-3-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722202702.4165917-1-congkai@amazon.com>
References: <20260722202702.4165917-1-congkai@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.251.204]
X-ClientProxiedBy: EX19D045UWC001.ant.amazon.com (10.13.139.223) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_132727_946767_57527A52 
X-CRM114-Status: GOOD (  12.89  )
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

Skip masking STALL_SLOT, STALL_SLOT_FRONTEND and STALL_SLOT_BACKEND out
of PMCEID1 when KVM_ARM_VCPU_PMU_V3_STRICT is set, because this is when
PMMIR_EL1.SLOTS is exposed to guests, making these events meaningful for
collection.

Change the parameter of compute_pmceid1() from arm_pmu to kvm_vcpu, to
check if KVM_ARM_VCPU_PMU_V3_STRICT is set. Also updated the signature of
compute_pmceid0() for consistency.

Signed-off-by: Congkai Tan <congkai@amazon.com>
Reviewed-by: Geoff Blake <blakgeof@amazon.com>
Reviewed-by: Haris Okanovic <harisokn@amazon.com>
Reviewed-by: Stanislav Spassov <stanspas@amazon.de>
---
 arch/arm64/kvm/pmu-emul.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 7ac00423fa8d..bcfd0a91e114 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -838,9 +838,9 @@ static u64 __compute_pmceid(struct arm_pmu *pmu, bool pmceid1)
 	return ((u64)hi[pmceid1] << 32) | lo[pmceid1];
 }
 
-static u64 compute_pmceid0(struct arm_pmu *pmu)
+static u64 compute_pmceid0(struct kvm_vcpu *vcpu)
 {
-	u64 val = __compute_pmceid(pmu, 0);
+	u64 val = __compute_pmceid(vcpu->kvm->arch.arm_pmu, 0);
 
 	/* always support SW_INCR */
 	val |= BIT(ARMV8_PMUV3_PERFCTR_SW_INCR);
@@ -849,32 +849,33 @@ static u64 compute_pmceid0(struct arm_pmu *pmu)
 	return val;
 }
 
-static u64 compute_pmceid1(struct arm_pmu *pmu)
+static u64 compute_pmceid1(struct kvm_vcpu *vcpu)
 {
-	u64 val = __compute_pmceid(pmu, 1);
+	u64 val = __compute_pmceid(vcpu->kvm->arch.arm_pmu, 1);
 
 	/*
-	 * Don't advertise STALL_SLOT*, as PMMIR_EL0 is handled
-	 * as RAZ
+	 * If KVM_ARM_VCPU_PMU_V3_STRICT is not set, PMMIR_EL1 is
+	 * unconditionally RAZ, so don't advertise STALL_SLOT* events.
 	 */
-	val &= ~(BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT - 32) |
-		 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND - 32) |
-		 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_BACKEND - 32));
+	if (!kvm_vcpu_has_pmuv3_strict(vcpu))
+		val &= ~(BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT - 32) |
+			 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND - 32) |
+			 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_BACKEND - 32));
+
 	return val;
 }
 
 u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 {
-	struct arm_pmu *cpu_pmu = vcpu->kvm->arch.arm_pmu;
 	unsigned long *bmap = vcpu->kvm->arch.pmu_filter;
 	u64 val, mask = 0;
 	int base, i, nr_events;
 
 	if (!pmceid1) {
-		val = compute_pmceid0(cpu_pmu);
+		val = compute_pmceid0(vcpu);
 		base = 0;
 	} else {
-		val = compute_pmceid1(cpu_pmu);
+		val = compute_pmceid1(vcpu);
 		base = 32;
 	}
 
-- 
2.50.1


