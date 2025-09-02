Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC262CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHzf8zOkoK/gz40/u34nFlS5x0KpraKKt7bj2JGtWEk=; b=duU9KeNMZsMJFZZAtqr3TwMmGG
	cVHdbPqkJ2sHrXZGDzwssi3MQS/fKSuGCAsyt7AhOJBnnNHtyhYCLzIH6ayXmNrKM5wgj4fViD7IH
	CARnJBh1+zOEi0tUpTGmWwSWR4CA8S1Vm31tilkKoXJ4V+oc6pYxVIf8JlVF+MZw1yVsWD5k7yON6
	4e8HEVusKkCVQjmddr28EQoNqrRmu/6gBOA9bcxP+anq9xVkGYJwSqty3uJ5Peiw7c/D/9zHJ7Sey
	YrKn+AVE9DOVG2+VfpFaL2gsyIfSDXVmKhjnceH/1tKVYi2h/xSElkx0L5tSD50t/lZPXboJqwxTs
	v6XY1CdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNp-00000001ZY4-2UPb;
	Tue, 02 Sep 2025 19:09:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQpk-0000000HYkP-3F1C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:14:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 200902720;
	Tue,  2 Sep 2025 06:13:50 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 098EB3F694;
	Tue,  2 Sep 2025 06:13:56 -0700 (PDT)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org
Subject: [PATCH v2 1/2] KVM: arm64: VHE: Initialize PMSCR_EL1
Date: Tue,  2 Sep 2025 14:08:32 +0100
Message-ID: <20250902130833.338216-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902130833.338216-1-alexandru.elisei@arm.com>
References: <20250902130833.338216-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061400_852215_D82B39B4 
X-CRM114-Status: GOOD (  16.25  )
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

According to the pseudocode for StatisticalProfilingEnabled() from Arm
DDI0487L.b, PMSCR_EL1 controls profiling at EL1 and EL0:

- PMSCR_EL1.E1SPE controls profiling at EL1.
- PMSCR_EL1.E0SPE controls profiling at EL0 if HCR_EL2.TGE=0.

These two fields reset to UNKNOWN values.

When KVM runs in VHE mode and profiling is enabled in the host, before
entering a guest, KVM does not touch any of the SPE registers, leaving the
buffer enabled, and it clears HCR_EL2.TGE. As a result, depending on the
reset value for the E1SPE and E0SPE fields, KVM might unintentionally
profile a guest. Make the behaviour consistent and predictable by clearing
PMSCR_EL1 when KVM initialises the host debug configuration.

Note that this is not a problem for nVHE, because KVM clears
PMSCR_EL1.{E1SPE,E0SPE} before entering the guest.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Tested by setting PMSCR_EL1.{E1SPE,E0SPE} in __finalise_el2 (to simulate a
system where the bits reset to 1) and clearing MDCR_EL2.TPMS (so guest
accesses to PMSCR_EL1 are not trapped). I booted the kernel in the model
with FEAT_SPE, but without FEAT_FGT (so I wouldn't have to fiddle with
those traps too).  Then ran a hacked kvm-unit-tests test that reads
PMSCR_EL1.

Without the patch: PMSCR_EL1 = 0x3 - E1SPE and E0SPE are set.
With the patch: PMSCR_EL1 = 0x0- E1SPE and E0SPE are not set.

Also tested by running the series on a cubie a5e (doesn't have FEAT_SPE),
in vhe, nvhe and protected modes.

 arch/arm64/kvm/debug.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 381382c19fe4..e7ce0d5a622d 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -74,13 +74,19 @@ void kvm_init_host_debug_data(void)
 	*host_data_ptr(debug_brps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, dfr0);
 	*host_data_ptr(debug_wrps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, dfr0);
 
+	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
+	    !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P)) {
+		if (has_vhe()) {
+			/* Clear E{0,1}SPE, which reset to UNKNOWN values. */
+			write_sysreg_el1(0, SYS_PMSCR);
+		} else {
+			host_data_set_flag(HAS_SPE);
+		}
+	}
+
 	if (has_vhe())
 		return;
 
-	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
-	    !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P))
-		host_data_set_flag(HAS_SPE);
-
 	/* Check if we have BRBE implemented and available at the host */
 	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_BRBE_SHIFT))
 		host_data_set_flag(HAS_BRBE);
-- 
2.51.0


