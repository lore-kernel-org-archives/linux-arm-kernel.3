Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0BBCF9C7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ty080sdi0Rk9rJi9euzei6Hv2qMdYsAYdvBACaCzgZs=; b=LuON9Sn+0PGBL7LlyoXDEGmfh2
	orax4Kt1dmctfOcYmS+kTWt3KhxP6nvF3lMGE+am57jMFZeX8RTXiRBu/3CXxp2JYCKavoDPv1vEQ
	oN5aWznjZjbNO1uqg+OD6GEtJzZUsDeWdW452OBVxM8PImmeVyauF2y2U0jr9ZaK6iIFVjNPJ0q1T
	5uTvrDlKLAqlH2fVKOsx9xfbTCYq22hl7BQTBmcl40er72PKDIWFacykQwNUqQKqwxIp7fA8ksIX4
	toWN1DzV3QaRtF9f62Y4Yeg1uQVjWqwDC+rs6n3E2AbBidAwb8/DwpDgl2IGxhPa9toPte1lTw+IZ
	ZcACSlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q8-000000075lz-1EkV;
	Thu, 20 Nov 2025 17:26:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pu-000000075ZQ-0Mx9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A6A044439;
	Thu, 20 Nov 2025 17:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FAAC116C6;
	Thu, 20 Nov 2025 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659557;
	bh=Earuil5WtmkVRYjuRYbwq4QLfgEPy3EZ1zKptjMuAoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=egfIydpbFHqW4n8S9oN56xIqgZLnbejulYZz7CLWsPWcZuQyDvYteCxP/ksm04fz8
	 QDBVf8la+65N3pP3fNInCjDp51SdnKMiQOlZAwS678qbCHL84hDH4PQxHG5DHW0Amr
	 q3ea8QUAM1anfUzzvH/8Z75Z0kV2iho7qxckz0Tw+c1FNNXD1M0xTUbfadyJFOoQz6
	 wgKwSRzyowUwF3LO69kxJ4NfaNislCoxYFtBgGOXPS1JXesbV4lv70vXrowLM1cyuX
	 g062T+0XATxPJi7/75/3rMqKRewI/3ZIHcWnpEFifDTgaan0fpCZxpFIRKWY3udgPY
	 joP6mOrzjUdVA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pr-00000006y6g-0wZO;
	Thu, 20 Nov 2025 17:25:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 06/49] KVM: arm64: GICv3: Detect and work around the lack of ICV_DIR_EL1 trapping
Date: Thu, 20 Nov 2025 17:24:56 +0000
Message-ID: <20251120172540.2267180-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092558_166129_97BBBA7E 
X-CRM114-Status: GOOD (  17.29  )
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

A long time ago, an unsuspecting architect forgot to add a trap
bit for ICV_DIR_EL1 in ICH_HCR_EL2. Which was unfortunate, but
what's a bit of spec between friends? Thankfully, this was fixed
in a later revision, and ARM "deprecates" the lack of trapping
ability.

Unfortuantely, a few (billion) CPUs went out with that defect,
anything ARMv8.0 from ARM, give or take. And on these CPUs,
you can't trap DIR on its own, full stop.

As the next best thing, we can trap everything in the common group,
which is a tad expensive, but hey ho, that's what you get. You can
otherwise recycle the HW in the neaby bin.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/virt.h  |  7 ++++-
 arch/arm64/kernel/cpufeature.c | 52 ++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/hyp-stub.S   |  5 ++++
 arch/arm64/kvm/vgic/vgic-v3.c  |  3 ++
 arch/arm64/tools/cpucaps       |  1 +
 5 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
index aa280f356b96a..8eb63d3294974 100644
--- a/arch/arm64/include/asm/virt.h
+++ b/arch/arm64/include/asm/virt.h
@@ -40,8 +40,13 @@
  */
 #define HVC_FINALISE_EL2	3
 
+/*
+ * HVC_GET_ICH_VTR_EL2 - Retrieve the ICH_VTR_EL2 value
+ */
+#define HVC_GET_ICH_VTR_EL2	4
+
 /* Max number of HYP stub hypercalls */
-#define HVC_STUB_HCALL_NR 4
+#define HVC_STUB_HCALL_NR 5
 
 /* Error returned when an invalid stub number is passed into x0 */
 #define HVC_STUB_ERR	0xbadca11
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5ed401ff79e3e..5de51cb1b8fe2 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2303,6 +2303,49 @@ static bool has_gic_prio_relaxed_sync(const struct arm64_cpu_capabilities *entry
 }
 #endif
 
+static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
+				 int scope)
+{
+	static const struct midr_range has_vgic_v3[] = {
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M1_ICESTORM),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M1_FIRESTORM),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M1_ICESTORM_PRO),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M1_FIRESTORM_PRO),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M1_ICESTORM_MAX),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M1_FIRESTORM_MAX),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M2_BLIZZARD),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M2_BLIZZARD_PRO),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE_PRO),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M2_BLIZZARD_MAX),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE_MAX),
+		{},
+	};
+	struct arm_smccc_res res = {};
+
+	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDIR <= ARM64_HAS_GICV3_CPUIF);
+	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDIR <= ARM64_HAS_GICV5_LEGACY);
+	if (!cpus_have_cap(ARM64_HAS_GICV3_CPUIF) &&
+	    !is_midr_in_range_list(has_vgic_v3))
+		return false;
+
+	if (!is_hyp_mode_available())
+		return false;
+
+	if (cpus_have_cap(ARM64_HAS_GICV5_LEGACY))
+		return true;
+
+	if (is_kernel_in_hyp_mode())
+		res.a1 = read_sysreg_s(SYS_ICH_VTR_EL2);
+	else
+		arm_smccc_1_1_hvc(HVC_GET_ICH_VTR_EL2, &res);
+
+	if (res.a0 == HVC_STUB_ERR)
+		return false;
+
+	return res.a1 & ICH_VTR_EL2_TDS;
+}
+
 #ifdef CONFIG_ARM64_BTI
 static void bti_enable(const struct arm64_cpu_capabilities *__unused)
 {
@@ -2814,6 +2857,15 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_gic_prio_relaxed_sync,
 	},
 #endif
+	{
+		/*
+		 * Depends on having GICv3
+		 */
+		.desc = "ICV_DIR_EL1 trapping",
+		.capability = ARM64_HAS_ICH_HCR_EL2_TDIR,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = can_trap_icv_dir_el1,
+	},
 #ifdef CONFIG_ARM64_E0PD
 	{
 		.desc = "E0PD",
diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
index 36e2d26b54f5c..085bc9972f6bb 100644
--- a/arch/arm64/kernel/hyp-stub.S
+++ b/arch/arm64/kernel/hyp-stub.S
@@ -54,6 +54,11 @@ SYM_CODE_START_LOCAL(elx_sync)
 1:	cmp	x0, #HVC_FINALISE_EL2
 	b.eq	__finalise_el2
 
+	cmp	x0, #HVC_GET_ICH_VTR_EL2
+	b.ne	2f
+	mrs_s	x1, SYS_ICH_VTR_EL2
+	b	9f
+
 2:	cmp	x0, #HVC_SOFT_RESTART
 	b.ne	3f
 	mov	x0, x2
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 8c14945086821..1b6c3071ec80f 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -648,6 +648,9 @@ void noinstr kvm_compute_ich_hcr_trap_bits(struct alt_instr *alt,
 		dir_trap = true;
 	}
 
+	if (!cpus_have_cap(ARM64_HAS_ICH_HCR_EL2_TDIR))
+		common_trap = true;
+
 	if (group0_trap)
 		hcr |= ICH_HCR_EL2_TALL0;
 	if (group1_trap)
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 1b32c1232d28d..116d1a7b688cb 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -40,6 +40,7 @@ HAS_GICV5_CPUIF
 HAS_GICV5_LEGACY
 HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
+HAS_ICH_HCR_EL2_TDIR
 HAS_HCR_NV1
 HAS_HCX
 HAS_LDAPR
-- 
2.47.3


