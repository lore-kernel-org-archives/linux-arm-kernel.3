Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2519C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XNjC9HyRFq5Wdc+4CVIp5K/5DRraP+ML+Z+a1Bg1uH8=; b=GzA25m4Q5qwfTRDQF2Q90WaLqg
	fxh1YF++SwHQkT14pB0qhsg8xQnezTnUM6S4e5j1Y3WUF6dzRems2bykln38TSYe6gOYYWUiewoS2
	Rg8grZNvkwcNJ9rZFSuXbv1cpQPzXIvjwkpmO8aQpcrjc2gSX/jqNs117VnnKrBFhrUOV0Zp+REIK
	OPaLjL+5FrX45iSjHYIZlUDBuuVLin+jSFk1RyvV+85zllS8qReB+EeplFtoVZQCRWKxvQh5b7yT+
	zovMEWM9phYrX/LTb8jVjB2uixmH611U61N5aSM40sX7xOaVvjJS8CUp4feNH90foxqucABzRvSB1
	+TGEiMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhF3-00000009ybt-19OC;
	Wed, 19 Aug 2026 14:26:09 +0000
Received: from out-37.mta1.migadu.com ([2001:41d0:203:375::25] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhF0-00000009ybA-2WHo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:26:08 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ke29VbWvxDUHLQ7QMVek08IQ7Fx8RV4z7tK1SShiMag=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787149564; v=1; x=1787754364;
 b=k2sPUtHe7dLnxojRgqsvtmNs/rqVWFq2GoTh7c5GLx9QZ4NF6ldoyKhxArr9tRgYk5d/KxlS
 dpvHCGMLL62yjitOR6nLZ5cJ7CV8we/iopOg+Koh3hYRURcwZH/YkFnbovbWs7Qr9z1ewikxPGK
 Hgvp7Hk5rZeJgldnzKFwLAas=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 4fec9eef40ee9f70;
	Wed, 19 Aug 2026 14:26:04 +0000
X-Mizu-Trace-ID: 4fec9eef40ee9f70
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
Subject: [PATCH] arm64: Defer the GMID_EL1 read to {init,update}_cpu_features()
Date: Wed, 19 Aug 2026 15:25:58 +0100
Message-Id: <20260819142558.1300100-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_072606_792184_DD5821F8 
X-CRM114-Status: GOOD (  19.44  )
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

Only pKVM is affected, and only for a CPU onlined after KVM init: its
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


