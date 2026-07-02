Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28PbrJsue24gxCxFzMj1TZNmDll7upM8xjPIwGE2HHc=; b=Tik4symPjCPS52LfUzzK25Z53v
	MQU3/vV45t26I0vDRjsLPL2wtavTKG1Ccg4oUz6cUgPwm8f6XUFskltXGjcBKsjGfh2xgFXcj9b4m
	8lKwtpUeNqtLVMd/JocPwHRfkkpLOuq2stIPaJTckYhlCwDSw9fh8P2tBvMjV6+5w+DbG8HWxFkbf
	tFvD4jHVhNxxFUwLln5sL112Lyxu2P6sKouHG4OSadnfRpDf8Mm5JVNLc9o7f/yPys/94BG7utoB3
	jJ1WnK1XIjLZ0xd5fEKgyFuJQfiVpS5aBo8F7A+xyU06aboiKM1QcsawL4lINzXEcqA8yDQc6udrS
	z3oD1+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMiP-00000005JEu-3T5b;
	Thu, 02 Jul 2026 19:04:49 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMiN-00000005JCl-3DnV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1783019087; x=1814555087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=28PbrJsue24gxCxFzMj1TZNmDll7upM8xjPIwGE2HHc=;
  b=pqGNjnPKznFlsBd3A72LbumvG1E8KxcOuzW62eAGPcZN9LwAueetoqAB
   I1TgzB+DGxcacMLsMq7SusLfEHIUiqZIuEvLL1fjb12uKNORHU4j93K7m
   4NLaIjSZGbEM6JtB4bfnRcjOoMCRZsuwWk6sYuuXtrAeldA3G2XOjj+Qa
   BiX1TKpV8JunCxCDthm3EpAcRIkdUt3EoeWSCI6tdWmuKzsnKCTWCNPPx
   rjFHVLJLYXkD1dQ3r5iiVgZ3eDERY/gHWyzoxlHqv30TSoMSJG3IiWmfp
   FX5NqllJIU/2VAFmIikZdT4D/1no6w96OXOt1sObksQQtV10p/PCVTnHS
   Q==;
X-CSE-ConnectionGUID: Z1BcOmIYQYKK6k3LUBa7pQ==
X-CSE-MsgGUID: 3IFZy54RQYaqxgK0r4k1gA==
X-IronPort-AV: E=Sophos;i="6.25,144,1779148800"; 
   d="scan'208";a="22933538"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 19:04:43 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:32053]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.112:2525] with esmtp (Farcaster)
 id 8a338137-edab-4456-8313-f0c7488aa835; Thu, 2 Jul 2026 19:04:42 +0000 (UTC)
X-Farcaster-Flow-ID: 8a338137-edab-4456-8313-f0c7488aa835
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 19:04:42 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Thu, 2 Jul 2026
 19:04:42 +0000
From: Congkai Tan <congkai@amazon.com>
To: Oliver Upton <oupton@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
CC: Congkai Tan <congkai@amazon.com>, Marc Zyngier <maz@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Haris Okanovic <harisokn@amazon.com>, Geoff Blake
	<blakgeof@amazon.com>, Stanislav Spassov <stanspas@amazon.de>,
	<kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] KVM: arm64: Advertise STALL_SLOT* in PMCEID1 under strict PMUv3 UAPI
Date: Thu, 2 Jul 2026 19:04:21 +0000
Message-ID: <20260702190421.420992-4-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260702190421.420992-1-congkai@amazon.com>
References: <20260702190421.420992-1-congkai@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.251.204]
X-ClientProxiedBy: EX19D045UWC004.ant.amazon.com (10.13.139.203) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_120447_861639_2B44D43C 
X-CRM114-Status: GOOD (  13.08  )
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
index 9595bce6519f..89eec5a1a499 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -851,9 +851,9 @@ static u64 __compute_pmceid(struct arm_pmu *pmu, bool pmceid1)
 	return ((u64)hi[pmceid1] << 32) | lo[pmceid1];
 }
 
-static u64 compute_pmceid0(struct arm_pmu *pmu)
+static u64 compute_pmceid0(struct kvm_vcpu *vcpu)
 {
-	u64 val = __compute_pmceid(pmu, 0);
+	u64 val = __compute_pmceid(vcpu->kvm->arch.arm_pmu, 0);
 
 	/* always support SW_INCR */
 	val |= BIT(ARMV8_PMUV3_PERFCTR_SW_INCR);
@@ -862,32 +862,33 @@ static u64 compute_pmceid0(struct arm_pmu *pmu)
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


