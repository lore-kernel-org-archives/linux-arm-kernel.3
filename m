Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6224E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ednKvBPd;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QwDMTVXy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NF4sUbvPyij751VvJLGiH1sFVHF1zynFqu0g0nQ5mO8=; b=ednKvBPdIwlaT0jT9dm8kWcjYB
	Flex12aM+x4GrfOwIoDGh4Qjd5pnMGxPHzHZGtlo5kNpggG8ZU2gURMTV0MhyUAgGkMAyGCz1Xau/
	nRAhQZg3/fi0c2uxjpv4FHldKoaQoEODL1R1490dHezBAZ/DEgR+l5Uu5S2jiOgA8NedOd0mxsoHo
	aeZVH04Wgzm8yAaL4LfeSeEhEDFbs/CvJ/cwy5P5gZu8b2xFg1s3pdaO3OlxMuqPivjGcclP5qq1n
	kvrgHGjfjDRvMSuwzL25cpzjRz9abZZ4Lw2ywEQmeegTRDl5r4WXc56uKFsoPYT4mg9NSHUowUymn
	1tW1dYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNomp-0000000G6Ug-0g7Y;
	Mon, 02 Nov 2026 09:57:07 +0000
Received: from out-116.mta0.migadu.com ([2001:41d0:1004:224b::74] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNomm-0000000G6R4-0pNm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:57:06 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AHRF3WdW4TVnGF5J3qplS9mbVl+JWJar5CHhjFr/pmc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793613422; v=1; x=1794218222;
 b=QwDMTVXyG4+edckaGs8PJEvZ4txfbLY/qFE+oWo3YQaTIg6B2AzD91ixYwZMsPGj8qKFldYu
 lQYltrp81oMhLR2ED1H44Pp+m4RPU1fl80g+TVTQYBKVMyQ3makPFhQzPrgRtGM+KETUWy1fo7w
 dD/5aJ1ZtrzdDn6fM+T1RI4o=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 484bc338bd20a5e5;
	Mon, 02 Nov 2026 09:57:01 +0000
X-Mizu-Trace-ID: 484bc338bd20a5e5
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Xi Ruoyao <xry111@xry111.site>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Gavin Shan <gshan@redhat.com>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
Date: Mon,  2 Nov 2026 09:56:56 +0000
Message-ID: <20261102095656.2948964-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_015704_514242_719D2C2C 
X-CRM114-Status: GOOD (  18.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

finalise_el2_state() clears the EL2 MPAM traps on every CPU whose ID
registers advertise MPAM once the arm64.nompam override is applied.
KVM sets them again on guest entry only when ARM64_MPAM is set, a
capability that also requires MPAM1_EL1.MPAMEN. Without EL3, only
MPAM2_EL2.MPAMEN is writable, and the kernel never sets it, so
ARM64_MPAM stays clear and so do the traps. A guest can then access
MPAM0_EL1, MPAM1_EL1, MPAMSM_EL1 and MPAMIDR_EL1 while its
ID_AA64PFR0_EL1.MPAM reads 0.

Record two per-CPU flags at KVM's CPU init: whether MPAM is
implemented as finalise_el2_state() tests it, and whether
MPAMIDR_EL1.HAS_HCR is set (MPAMHCR_EL2 is UNDEFINED without it).
Read ID_AA64PFR0_EL1, ID_AA64PFR1_EL1 and MPAMIDR_EL1 from cpu_data,
which holds them with the overrides applied since commit 342e62ded77c6
("arm64: cpufeature: Read MPAMIDR_EL1 in __cpuinfo_store_cpu()"). Set
the traps from those flags. MPAMEN isn't part of any MPAM trap
condition, so the traps take effect whether or not it is set.

Fixes: 31ff96c38ea3 ("KVM: arm64: Fix missing traps of guest accesses to the MPAM registers")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v4:
     - Take ID_AA64PFR0_EL1, ID_AA64PFR1_EL1 and MPAMIDR_EL1 from cpu_data
       (was __read_sysreg_by_encoding() and read_sysreg_s()).
     - Commit message tightened, and the TIDR comment no longer
       rewritten.
     - Ben's Reviewed-by dropped, since the probe changed.
     - Rebased on 7.4-rc1.
    
    Based on Linux 7.4-rc1 (6628e7d4c6b25).
    
    v4: https://lore.kernel.org/all/20260924165329.1684155-1-fuad.tabba@linux.dev/
    v3: https://lore.kernel.org/all/20260911104715.307500-1-fuad.tabba@linux.dev/
    v2: https://lore.kernel.org/all/20260908145651.2828597-1-fuad.tabba@linux.dev/
    v1: https://lore.kernel.org/all/20260903160819.831518-1-fuad.tabba@linux.dev/

 arch/arm64/include/asm/kvm_host.h       |  2 ++
 arch/arm64/kvm/arm.c                    | 12 ++++++++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h |  8 ++++----
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb1300..d6b9538cbec36 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -839,6 +839,8 @@ struct kvm_host_data {
 #define KVM_HOST_DATA_FLAG_VCPU_IN_HYP_CONTEXT		4
 #define KVM_HOST_DATA_FLAG_L1_VNCR_MAPPED		5
 #define KVM_HOST_DATA_FLAG_HAS_BRBE			6
+#define KVM_HOST_DATA_FLAG_HAS_MPAM			7
+#define KVM_HOST_DATA_FLAG_HAS_MPAM_HCR			8
 	unsigned long flags;
 
 	struct kvm_cpu_context host_ctxt;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 157bf4b812020..5bab4833c9d33 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -32,6 +32,7 @@
 #include <asm/mman.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
+#include <asm/cpu.h>
 #include <asm/cpufeature.h>
 #include <asm/virt.h>
 #include <asm/kvm_arm.h>
@@ -2496,9 +2497,20 @@ static void cpu_set_hyp_vector(void)
 
 static void cpu_hyp_init_context(void)
 {
+	struct cpuinfo_arm64 *info = this_cpu_ptr(&cpu_data);
+	u64 pfr0 = info->reg_id_aa64pfr0;
+	u64 pfr1 = info->reg_id_aa64pfr1;
+
 	kvm_init_host_cpu_context(host_data_ptr(host_ctxt));
 	kvm_init_host_debug_data();
 
+	/* cpu_data has the overrides applied, as finalise_el2_state() does. */
+	if (id_aa64pfr0_mpam(pfr0) || id_aa64pfr1_mpamfrac(pfr1)) {
+		host_data_set_flag(HAS_MPAM);
+		if (info->reg_mpamidr & MPAMIDR_EL1_HAS_HCR)
+			host_data_set_flag(HAS_MPAM_HCR);
+	}
+
 	if (!is_kernel_in_hyp_mode())
 		cpu_init_hyp_mode();
 }
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index e0c55644224cb..f487d3a93fe27 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -298,11 +298,11 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
 	u64 clr = MPAM2_EL2_EnMPAMSM;
 	u64 set = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
 
-	if (!system_supports_mpam())
+	if (!host_data_test_flag(HAS_MPAM))
 		return;
 
 	/* trap guest access to MPAMIDR_EL1 */
-	if (system_supports_mpam_hcr()) {
+	if (host_data_test_flag(HAS_MPAM_HCR)) {
 		write_sysreg_s(MPAMHCR_EL2_TRAP_MPAMIDR_EL1, SYS_MPAMHCR_EL2);
 	} else {
 		/* From v1.1 TIDR can trap MPAMIDR, set it unconditionally */
@@ -317,12 +317,12 @@ static inline void __deactivate_traps_mpam(void)
 	u64 clr = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1 | MPAM2_EL2_TIDR;
 	u64 set = MPAM2_EL2_EnMPAMSM;
 
-	if (!system_supports_mpam())
+	if (!host_data_test_flag(HAS_MPAM))
 		return;
 
 	sysreg_clear_set_s(SYS_MPAM2_EL2, clr, set);
 
-	if (system_supports_mpam_hcr())
+	if (host_data_test_flag(HAS_MPAM_HCR))
 		write_sysreg_s(MPAMHCR_HOST_FLAGS, SYS_MPAMHCR_EL2);
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


