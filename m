Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C5EC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRl+YWrA3y5pvvn46BjXKSxu9J2/YIzI/vjk6GTjx+o=; b=QDxVAyhrvVWjJX3bbbDa2pOd8G
	zjlwOJS53dgbu5Wi7ltga9nFsrar1+OQFPvo9z292PkMkYncuwrkqNgKS8D3H5ubFa/CLRBspfdm1
	bzona+mrCAcbp7Y7/Ncg8lAs1ebtY8O1XpLaqPgEziucrlsC0k3IuQzxHUnfCjBlSrZRrrWfV+7s6
	4ynbK2kQRPKW3NuwCgyJCH/6ADSHxwOCDbLlcUVbNATQpolec+WOlhiQba/OItPfkHcVhprLboc+5
	wthWIcnVQP5PU11yTLlYaS+7AESXtwWV2VsHnw3I+hfWYoln5vwbY6yhJNkNlve4NgYZlXulSlRNS
	Q55Om0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuES-000000018DE-1EcL;
	Tue, 25 Aug 2026 16:42:40 +0000
Received: from out-224.mta0.migadu.com ([2001:41d0:1004:224b::e0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuEO-000000018At-37S2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:42:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CYocrFWmtpehijgOQcGCt0ml+hOpQBMXbSBN0pxWBYg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787676154; v=1; x=1788280954;
 b=h/3l8OqFwZfY77u+/ur1hFq103jfMJ9kpESQwXqjQ/0w8oPXX1QGLKDk5FTdyLD9TqCe5bAI
 tLIiTIoov8PXdykCWf1yz36O4hJC0rCr+nWfx5nL4JqM0iwr4KKpnvYgHp48JDcHguREISdYIvb
 Yme+R6F35RrEtxLi2xfmi52o=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id 5c13a4e79d66ea44;
	Tue, 25 Aug 2026 16:42:34 +0000
X-Mizu-Trace-ID: 5c13a4e79d66ea44
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
Subject: [PATCH v4 2/2] arm64: Don't read GMID_EL1 when MTE is disabled
Date: Tue, 25 Aug 2026 17:42:19 +0100
Message-Id: <20260825164219.3347229-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260825164219.3347229-1-fuad.tabba@linux.dev>
References: <20260825164219.3347229-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_094237_000193_D931581D 
X-CRM114-Status: GOOD (  17.31  )
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
ID_AA64PFR1_EL1, so it reads the register even when the kernel has
disabled MTE (CONFIG_ARM64_MTE=n or arm64.nomte). KVM sets HCR_EL2.TID5
in that case, and pKVM injects an UNDEF the host cannot handle:

  Internal error: Oops - Undefined instruction: 0000000002000000 [#1]  SMP
  pc : __cpuinfo_store_cpu+0xf4/0x264
  Kernel panic - not syncing: Attempted to kill the idle task!

Only pKVM reaches it, and only after a CPU is offlined and brought back
online: its CPU_ON relay sets the host HCR before the CPU enters EL1,
while plain nVHE sets it at CPUHP_AP_KVM_ONLINE.

Gate the read on __read_sysreg_by_encoding(), which applies the cmdline
override, and on CONFIG_ARM64_MTE, which no register reflects.

Fixes: f35abcbb8a084 ("KVM: arm64: Trap MTE access and discovery when MTE is disabled")
Cc: stable@vger.kernel.org # needs "arm64: Apply overrides to CPU local capabilities"
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/cpufeature.h | 9 +++++++++
 arch/arm64/kernel/cpufeature.c      | 6 ++----
 arch/arm64/kernel/cpuinfo.c         | 2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index a57870fa96db5..0b374e938f708 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -1085,6 +1085,15 @@ static inline bool cpu_has_lpa2(void)
 #endif
 }
 
+/* No ID register reflects CONFIG_ARM64_MTE. */
+static inline bool gmid_el1_accessible(void)
+{
+	if (!IS_ENABLED(CONFIG_ARM64_MTE))
+		return false;
+
+	return id_aa64pfr1_mte(__read_sysreg_by_encoding(SYS_ID_AA64PFR1_EL1));
+}
+
 #endif /* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 88b15b5ef2f7f..23f174b3c4e26 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1228,7 +1228,7 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
 	}
 
-	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
+	if (gmid_el1_accessible())
 		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
 }
 
@@ -1523,11 +1523,9 @@ void update_cpu_features(int cpu,
 	 * they read/write depends on the GMID_EL1.BS field. Check that the
 	 * value is the same on all CPUs.
 	 */
-	if (IS_ENABLED(CONFIG_ARM64_MTE) &&
-	    id_aa64pfr1_mte(info->reg_id_aa64pfr1)) {
+	if (gmid_el1_accessible())
 		taint |= check_update_ftr_reg(SYS_GMID_EL1, cpu,
 					      info->reg_gmid, boot->reg_gmid);
-	}
 
 	/*
 	 * If we don't have AArch32 at all then skip the checks entirely
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d50e2a9b066b3..389fca84f106b 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -502,7 +502,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
 	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
 
-	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
+	if (gmid_el1_accessible())
 		info->reg_gmid = read_cpuid(GMID_EL1);
 
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
-- 
2.39.5


