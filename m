Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31228E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbOxUW2t68exPWAuQOWEEtmoKzFQeoyWjIWsV2ex6GI=; b=f8T+0WWaP6K3Jjdi46BTMmdExg
	PnZkymDO56MxY5c8SUbgUjO5fSB8dZDgrdP+AHvfB8XZcl9nG2QDQ8Zeu1qiepMGpP2fnL2QJb15M
	kG5dILLe2DGUXKUyHFf8YP7fTRfv2/vt6xk/5cXW7SCrp2ZCL77L2DRxcDD3ryG9UdHKGS7V32fV+
	nIB2uvgjFeYyoaKzuaYMVALBGLNSU62dVIqssau8Mz3u5U9Fwhus1UYyryOIgRgYKWTUNPFhwYHdE
	JrYWD6XWSBovcCc09B/MXonCN2onb0jGxbIWGgJ4g4rZicbT1WtkVDxqwUI0MGwa95vzUVdYvYEfo
	LgIzkHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfCC-0000000EsXt-2SlL;
	Tue, 17 Dec 2024 21:33:36 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf0W-0000000EqXZ-2RoF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:21:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbOxUW2t68exPWAuQOWEEtmoKzFQeoyWjIWsV2ex6GI=;
	b=HHeESZGQjxo+RX9Mddf7j4K+mJv4pNnXmUBlky78iZZV3BMpY9/HQbDBQNlsbtQnEohmhF
	J3bwplJspNRaIpWkKnV37nXnx3o/C7dpmypXfMTL4fYR6qzqYqsSY/hz10+AbOAruyWBMl
	wIgjEED2IRz7bwQqys+fjKkoCdmnVZE=
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
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH 11/18] KVM: arm64: Move PMUVer filtering into KVM code
Date: Tue, 17 Dec 2024 13:20:41 -0800
Message-Id: <20241217212048.3709204-12-oliver.upton@linux.dev>
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132132_761364_4AE0C54A 
X-CRM114-Status: GOOD (  10.42  )
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

The supported guest PMU version on a particular platform is ultimately a
KVM decision. Move PMUVer filtering into KVM code.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/cpufeature.h | 23 -----------------------
 arch/arm64/kvm/pmu-emul.c           | 15 +++++++++------
 2 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 6a989927926a..d49e9c7e201c 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -525,29 +525,6 @@ cpuid_feature_extract_unsigned_field(u64 features, int field)
 	return cpuid_feature_extract_unsigned_field_width(features, field, 4);
 }
 
-/*
- * Fields that identify the version of the Performance Monitors Extension do
- * not follow the standard ID scheme. See ARM DDI 0487E.a page D13-2825,
- * "Alternative ID scheme used for the Performance Monitors Extension version".
- */
-static inline u64 __attribute_const__
-cpuid_feature_cap_perfmon_field(u64 features, int field, u64 cap)
-{
-	u64 val = cpuid_feature_extract_unsigned_field(features, field);
-	u64 mask = GENMASK_ULL(field + 3, field);
-
-	/* Treat IMPLEMENTATION DEFINED functionality as unimplemented */
-	if (val == ID_AA64DFR0_EL1_PMUVer_IMP_DEF)
-		val = 0;
-
-	if (val > cap) {
-		features &= ~mask;
-		features |= (cap << field) & mask;
-	}
-
-	return features;
-}
-
 static inline u64 arm64_ftr_mask(const struct arm64_ftr_bits *ftrp)
 {
 	return (u64)GENMASK(ftrp->shift + ftrp->width - 1, ftrp->shift);
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 2c98cf24bef3..98690e53dc73 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1257,13 +1257,16 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 
 u8 kvm_arm_pmu_get_pmuver_limit(void)
 {
-	u64 tmp;
+	unsigned int pmuver;
 
-	tmp = read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1);
-	tmp = cpuid_feature_cap_perfmon_field(tmp,
-					      ID_AA64DFR0_EL1_PMUVer_SHIFT,
-					      ID_AA64DFR0_EL1_PMUVer_V3P5);
-	return FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMUVer), tmp);
+	pmuver = SYS_FIELD_GET(ID_AA64DFR0_EL1, PMUVer,
+			       read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1));
+
+	/* Treat IMPLEMENTATION DEFINED functionality as unimplemented */
+	if (pmuver == ID_AA64DFR0_EL1_PMUVer_IMP_DEF)
+		return 0;
+
+	return min(pmuver, ID_AA64DFR0_EL1_PMUVer_V3P5);
 }
 
 /**
-- 
2.39.5


