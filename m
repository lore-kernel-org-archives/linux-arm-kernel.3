Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4DCC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tlY5LDePUReNiXOVeX55AOb6mz1UWHGO73r+pXTpgPI=; b=0B9Ls3ePEoE8MoXHOvtNDukgf3
	MtZMVl+mh1EpF7ZR5VXqb/6DHGQ6fQRi0Gy+15ajdZdXpLReTs30hxjxxFImGeSELYKRQQPUvHH6T
	fLVGanTQWW7tS4ChVk7gAUXQt7a7s/9EIm5Ant5qBjAHNkgLuzz2N4ZK32iTO606sFEtsGZEBxBLP
	ULREMG4EyY0fuSoPgCFxgS25GLlOyNcr7O9R4HaSMDtV78r8YJ5rWm4+OnQp+Lg/SDi6Ld37hx3Vi
	x1z+oU6fOOcSxQqFJkU2iEhmysjg9SPSCPLuh8LxKKuYII9GLAwZrFxVq6xqBX4tkEmCP73xoQWIi
	KUY6FV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOoy-0000000G32M-2AiQ;
	Mon, 24 Aug 2026 07:10:16 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOov-0000000G31h-1R98
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:10:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=au6xQbhjJ6Ac1efAjVBkkpnspFlnMc1gX/jCiGcALR4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787555409; v=1; x=1788160209;
 b=FYugbi094QAdgeaCrGK9OJHafhCVI/t7Nfc8LQawlTDP0h/8+/Wlr5oZtJ24AGbvvqSM6/xz
 nLbR5pCohTlFne65CQU8F3U/29nVVxswDYkwW8vNV4mbgPPlIto//sHSzR+BxeBVr6kogy1zFGz
 D/ndOsDf/dRlIv8iPn9XLjIQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id 0d031bd8521c682b;
	Mon, 24 Aug 2026 07:10:08 +0000
X-Mizu-Trace-ID: 0d031bd8521c682b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2] arm64: Defer the GMID_EL1 read to {init,update}_cpu_features()
Date: Mon, 24 Aug 2026 08:10:04 +0100
Message-Id: <20260824071004.504894-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_001014_340210_007F4EFF 
X-CRM114-Status: GOOD (  19.98  )
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

__cpuinfo_store_cpu() gates the GMID_EL1 read on the raw
ID_AA64PFR1_EL1, so it reads the register on MTE hardware even when the
kernel has disabled MTE (CONFIG_ARM64_MTE=n or arm64.nomte). KVM sets
HCR_EL2.TID5 in that case, which traps the read to EL2 and injects an
UNDEF:

  Internal error: Oops - Undefined instruction: 0000000002000000 [#1]
  pc : __cpuinfo_store_cpu+0xf4/0x264
  Call trace:
   __cpuinfo_store_cpu+0xf4/0x264 (P)
   secondary_start_kernel+0xc8/0x1d0
   __secondary_switched+0xc0/0xc4
  Kernel panic - not syncing: Attempted to kill the idle task!

Only pKVM is affected, and only for a CPU that is offlined and brought
back online. Every CPU's first bring-up precedes KVM's initcall, and
pKVM refuses CPU_ON for a CPU that was not online when KVM initialised,
so hotplug is the only path to cpuinfo_store_cpu() with TID5 set. pKVM's
PSCI CPU_ON relay sets the host HCR before the CPU enters EL1, whereas
plain nVHE sets it at CPUHP_AP_KVM_ONLINE, after cpuinfo_store_cpu().

Defer the read to {init,update}_cpu_features() and gate it on the
sanitised ID register, as MPAM already does. system_supports_mte()
cannot serve as the gate, as update_cpu_features() also runs during
initial SMP bring-up, before smp_cpus_done() calls
setup_system_features(). The init path gains the CONFIG_ARM64_MTE test
the update path already had, leaving SYS_GMID_EL1 uninitialised when
MTE is compiled out, where its only other user (lib/mte.S) is not
built.

Fixes: f35abcbb8a084 ("KVM: arm64: Trap MTE access and discovery when MTE is disabled")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v1:
    - Clarified that the trap only fires on a CPU that is offlined and
      brought back online, not a late first boot (Marc).
    
    Tested on QEMU with -machine virt,mte=on, under pKVM.
    
    Offline/online CPU1 with arm64.nomte on the host cmdline: unpatched
    panics in __cpuinfo_store_cpu(), patched does not.

 arch/arm64/kernel/cpufeature.c | 19 ++++++++++++++++---
 arch/arm64/kernel/cpuinfo.c    |  8 +++++---
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120f..5120f6721b1e0 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1176,6 +1176,17 @@ static bool detect_ftr_has_mpam(void)
 	return id_aa64pfr0_mpam(pfr0) || id_aa64pfr1_mpamfrac(pfr1);
 }
 
+/*
+ * Mirrors system_supports_mte(), which cannot be used before the capabilities
+ * are finalised. KVM sets HCR_EL2.TID5 when it is false, trapping GMID_EL1.
+ */
+static bool detect_has_mte(void)
+{
+	u64 pfr1 = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
+
+	return IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(pfr1);
+}
+
 void __init init_cpu_features(struct cpuinfo_arm64 *info)
 {
 	/* Before we start using the tables, make sure it is sorted */
@@ -1228,8 +1239,10 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
 	}
 
-	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
+	if (detect_has_mte()) {
+		info->reg_gmid = read_cpuid(GMID_EL1);
 		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
+	}
 }
 
 static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
@@ -1490,8 +1503,8 @@ void update_cpu_features(int cpu,
 	 * they read/write depends on the GMID_EL1.BS field. Check that the
 	 * value is the same on all CPUs.
 	 */
-	if (IS_ENABLED(CONFIG_ARM64_MTE) &&
-	    id_aa64pfr1_mte(info->reg_id_aa64pfr1)) {
+	if (detect_has_mte()) {
+		info->reg_gmid = read_cpuid(GMID_EL1);
 		taint |= check_update_ftr_reg(SYS_GMID_EL1, cpu,
 					      info->reg_gmid, boot->reg_gmid);
 	}
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d50e2a9b066b3..c8967f185e3dd 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -502,12 +502,14 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
 	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
 
-	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
-		info->reg_gmid = read_cpuid(GMID_EL1);
-
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
 		__cpuinfo_store_cpu_32bit(&info->aarch32);
 
+	/*
+	 * info->reg_gmid deferred to {init,update}_cpu_features because
+	 * reading it traps to EL2 when MTE is disabled.
+	 */
+
 	/*
 	 * info->reg_mpamidr deferred to {init,update}_cpu_features because we
 	 * don't want to read it (and trigger a trap on buggy firmware) if
-- 
2.39.5


