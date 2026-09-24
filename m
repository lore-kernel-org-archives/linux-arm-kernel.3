Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A49C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOIrjlPHlsQKXA2/9FwwNsLLczH4MkvA/TRaBpEfDYA=; b=TiC9Uz0I+H2eyoAyBUl9nByJ9U
	/V9DNIDafepqrxtQNO81uohU4nrmtKUGgddC8rkGpFUSerb+CJ6KfHz1B8/K+aQO5VZS+Gai0XGYH
	RjU8RMyZBpITxmEu3hgb3uHER7Qp9ROtx0xJ5wzm29II41rNiUyUzoOo9u5lQu7GFc8lVTpaHo7uE
	xeq98P2vYvCNJ+MIBCo55mToiFwmrhUlHkMYdbhFYBki0pgAetg80pfBO8hNXnP2Cs9Yu4abAKMc1
	2/S0ylmWSDU2nQahl8WLz59o3fi677u4hpfVuQCMFxWsEyK8fXzz03OXTOz+Fp9Xjw6TBIOyUCb+M
	KJgn/mfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGY-0000000Bk0Z-1ZSs;
	Thu, 24 Sep 2026 17:29:50 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGR-0000000Bjrq-1Jc8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:46 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-4a7de733fa9so217300b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270982; x=1790875782; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOIrjlPHlsQKXA2/9FwwNsLLczH4MkvA/TRaBpEfDYA=;
        b=kE7+dqVWMdmtiNcRqblpiik2uK0H4gbVD1rE7ENxyUBE+Vz+qkdK+Fl3h6pqRmljOM
         ywx9uxSSMptYAtIZXV/F6qitJ3fumFsuqdxznJhzsH0rgHTvxF3Fj13E7ezuGDd8DKdr
         wqt6RpBSyvrLftZZI585Bd5NYKwrWZe0iGgl7ftbWR29YoKFmCMLUGIpG+K8e/fT/GOn
         AIvNE29ntrmRGqBQhhdIShjabiUI5/5/zT7iwAx3IxEh1Ust91kwdeEbZWkm7AvRrTah
         Wzqkg9T5d6cVOUR/OCagUBGx2Ozem6rX84W3ROLmRKP2jHYamKsGbnMFYQLSaYVhfDUF
         5Jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270982; x=1790875782;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOIrjlPHlsQKXA2/9FwwNsLLczH4MkvA/TRaBpEfDYA=;
        b=GPCMhtsr1eUhmYW+a/cKhZv0KeYiSQbiaTzu7+3ayFdjRMXG5m69qmYsNJhD7zM5DI
         DAspObYmQpWsjAuBibMaKFExuFEQLkEWsNVqHyeJYHOMZjhCdVSYbE5joyuWKxFaucar
         2XTMgYA0GMV+VpqIcNQqXyQkIQ8dkKbxs82fXBR/8Al2VvjgWbvRa6HhT26DqMxSZZNV
         RE1DSqviH9esMSZazfHuidZ5l5zEH9LJd2jNiKvrYcgVi7dekYn+GjBLnOI01WApV3W8
         QrmxSIMgMD3zcOmQuzTTTwev0dPIrzbhpVhCWD3UirCB0KgvTjKMYEOBhywX82plV9XT
         VRmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTigQjlZYa/+yliSrBsL3tU+ZU0kX856eNLX3mnB4QhO9zc0jnoraU2J9xwu5NXb+jjX2mHiE1gzDv3Yg/UBrP@lists.infradead.org
X-Gm-Message-State: AFuF++k4Js3JzZq+CwTYUv10LqfxZp1XBZvcGnwTDkAc8+X7ml79b5f/
	jrvCdJ7jXXUKfhhRTuemelYjteiEiOvSSSW8gRf1Yt68EtDGKRME/zmem1MfcKO1TtURDh/QcAh
	iLudhV9JfW4RQc9AYjmC67dsJWQ==
X-Received: from jalg14.prod.google.com ([2002:a05:6638:c4e:b0:5f0:cbe4:72e7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1394:b0:4b5:5bfb:f25e with SMTP id 5614622812f47-4d72c637812mr3680802b6e.21.1790270981701;
 Thu, 24 Sep 2026 10:29:41 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:15 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-10-coltonlewis@google.com>
Subject: [PATCH v9 09/22] KVM: arm64: Set up FGT for Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_102944_165094_361881BD 
X-CRM114-Status: GOOD (  15.93  )
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

In order to gain the best performance benefit from partitioning the
PMU, utilize fine grain traps (FEAT_FGT and FEAT_FGT2) to avoid
trapping common PMU register accesses by the guest to remove that
overhead.

Untrapped:
- PMCR_EL0
- PMUSERENR_EL0
- PMSELR_EL0
- PMCCNTR_EL0
- PMCNTEN_EL0
- PMINTEN_EL1
- PMEVCNTRn_EL0

These are safe to untrap because writing MDCR_EL2.HPMN as this series
will do limits the effect of writes to any of these registers to the
partition of counters 0..HPMN-1. Reads from these registers will not
leak information from between guests as all these registers are
context swapped by a later patch in this series. Reads from these
registers also do not leak any information about the host's hardware
beyond what is promised by PMUv3.

Trapped:
- PMOVS_EL0
- PMEVTYPERn_EL0
- PMCCFILTR_EL0
- PMICNTR_EL0
- PMICFILTR_EL0
- PMCEIDn_EL0
- PMMIR_EL1

PMOVS remains trapped so KVM can track overflow IRQs that will need to
be injected into the guest.

PMICNTR and PMICFILTR remain trapped because KVM is not handling them
yet.

PMEVTYPERn remains trapped so KVM can limit which events guests can
count, such as disallowing counting at EL2. PMCCFILTR and PMICFILTR
are special cases of the same.

PMCEIDn and PMMIR remain trapped because they can leak information
specific to the host hardware implementation.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/config.c | 49 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 1053676551aff..f00ef9d598a95 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1708,12 +1708,55 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
 		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
 }
 
+static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGRTR_EL2);
+
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		*vcpu_fgt(vcpu, HDFGRTR_EL2) |=
+			(HDFGRTR_EL2_PMOVS |
+			 HDFGRTR_EL2_PMCCFILTR_EL0 |
+			 HDFGRTR_EL2_PMEVTYPERn_EL0 |
+			 HDFGRTR_EL2_PMCEIDn_EL0 |
+			 HDFGRTR_EL2_PMMIR_EL1) & ~hdfgrtr_masks.res0;
+	}
+}
+
 static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
 {
 	__compute_fgt(vcpu, HDFGWTR_EL2);
 
 	if (is_hyp_ctxt(vcpu))
 		*vcpu_fgt(vcpu, HDFGWTR_EL2) |= HDFGWTR_EL2_MDSCR_EL1;
+
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		*vcpu_fgt(vcpu, HDFGWTR_EL2) |=
+			(HDFGWTR_EL2_PMOVS |
+			 HDFGWTR_EL2_PMCCFILTR_EL0 |
+			 HDFGWTR_EL2_PMEVTYPERn_EL0) & ~hdfgwtr_masks.res0;
+	}
+}
+
+static void __compute_hdfgrtr2(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGRTR2_EL2);
+
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		*vcpu_fgt(vcpu, HDFGRTR2_EL2) &=
+			~(HDFGRTR2_EL2_nPMICFILTR_EL0 |
+			  HDFGRTR2_EL2_nPMICNTR_EL0) | hdfgrtr2_masks.res1;
+	}
+}
+
+static void __compute_hdfgwtr2(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGWTR2_EL2);
+
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		*vcpu_fgt(vcpu, HDFGWTR2_EL2) &=
+			~(HDFGWTR2_EL2_nPMICFILTR_EL0 |
+			  HDFGWTR2_EL2_nPMICNTR_EL0) | hdfgwtr2_masks.res1;
+	}
 }
 
 static void __compute_ich_hfgrtr(struct kvm_vcpu *vcpu)
@@ -1750,7 +1793,7 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
 	__compute_fgt(vcpu, HFGRTR_EL2);
 	__compute_hfgwtr(vcpu);
 	__compute_fgt(vcpu, HFGITR_EL2);
-	__compute_fgt(vcpu, HDFGRTR_EL2);
+	__compute_hdfgrtr(vcpu);
 	__compute_hdfgwtr(vcpu);
 	__compute_fgt(vcpu, HAFGRTR_EL2);
 
@@ -1758,8 +1801,8 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
 		__compute_fgt(vcpu, HFGRTR2_EL2);
 		__compute_fgt(vcpu, HFGWTR2_EL2);
 		__compute_fgt(vcpu, HFGITR2_EL2);
-		__compute_fgt(vcpu, HDFGRTR2_EL2);
-		__compute_fgt(vcpu, HDFGWTR2_EL2);
+		__compute_hdfgrtr2(vcpu);
+		__compute_hdfgwtr2(vcpu);
 	}
 
 	if (cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF)) {
-- 
2.56.0.rc1.310.g51773c2048-goog


