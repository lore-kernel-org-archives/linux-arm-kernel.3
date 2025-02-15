Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9761C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0EbrfsbOetLtFShOOfGN77ABNqlRqdu3JLgmFzgAao=; b=QwLJCE0E3UfGuqjM2xC6icFDNE
	yokxKT6EquLjbmyc/5SRms8WezVO4rVvrtnWLAM5yoKCGq81kUeFdTglpcsqmCpcW+EWPsZNhdd6P
	g6NRZaH5uhDwMlhuOKyvWPtvbFyFnCv9rB3dvne4XQOzWsduuQgnZGE0Bs64mktYpbto3Qv/69KAQ
	QnCtHMAOqHajwMRvcgsOrf7KmdOGGdNtmu1WbPaVZolA1h578s4VdgQJf2LwI0FXJTn6WTOgFmLAq
	EAO8qz1qeTyQeZN52aW3yTPneHoiK33Fg/V/17dq912As0mvkY/LqokuBv1vV5BEsJ64Sy+XM/s4d
	zc7in5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM8w-00000000VID-19tC;
	Sat, 15 Feb 2025 17:39:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7T-00000000Up0-0xKi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5367E5C2659;
	Sat, 15 Feb 2025 17:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62494C4CEE2;
	Sat, 15 Feb 2025 17:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641102;
	bh=XymYMKvSscNoNyr9c1xKeKhz7KoZPOt8xd5DrF64n9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IlgoqgP8oGA2xyi/FZ9j07Armi+ZphS1EixA0//5+jEH1TlM8fNIXu5CfG4GzL7fm
	 3rkTxzRYzSfU06RYn6dGnVdjmdAU4LzlxSf8yJvKPEhLr6RUev/88VUsLN4Z5fHp0j
	 S9iZmQO65I5fzjgi5VBWmCTcHWZKnPtGpKoZeL6sDt4qMv9gpgUesM9ajoThcuVOtZ
	 pX5LpB5jK89OgSNfgAcRahlsjWSKMsSi1xvQZsjNA1nZNDPV+YN8NWBjg1nKgqKLLn
	 czp7yLZD0jsB5VmYOwh7bg3huPyUjATAEVRodZ43/hgDx2XmbTyQOJhBC/JfGCwVEN
	 gf6Dg+bC0qBmQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7Q-004Pqp-GC;
	Sat, 15 Feb 2025 17:38:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 01/14] arm64: cpufeature: Handle NV_frac as a synonym of NV2
Date: Sat, 15 Feb 2025 17:38:03 +0000
Message-Id: <20250215173816.3767330-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_093823_352101_96C46374 
X-CRM114-Status: GOOD (  13.98  )
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

With ARMv9.5, an implementation supporting Nested Virtualization
is allowed to only support NV2, and to avoid supporting the old
(and useless) ARMv8.3 variant.

This is indicated by ID_AA64MMFR2_EL1.NV being 0 (as if NV wasn't
implemented) and ID_AA64MMDR4_EL1.NV_frac being 1 (indicating that
NV2 is actually supported).

Given that KVM only deals with NV2 and refuses to use the old NV,
detecting NV2 or NV_frac is what we need to enable it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 4eb7c6698ae43..94605e91f0e5f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -497,6 +497,7 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr3[] = {
 
 static const struct arm64_ftr_bits ftr_id_aa64mmfr4[] = {
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR4_EL1_E2H0_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR4_EL1_NV_frac_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
 
@@ -2162,7 +2163,7 @@ static bool has_nested_virt_support(const struct arm64_cpu_capabilities *cap,
 	if (kvm_get_mode() != KVM_MODE_NV)
 		return false;
 
-	if (!has_cpuid_feature(cap, scope)) {
+	if (!cpucap_multi_entry_cap_matches(cap, scope)) {
 		pr_warn("unavailable: %s\n", cap->desc);
 		return false;
 	}
@@ -2519,7 +2520,17 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.capability = ARM64_HAS_NESTED_VIRT,
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
 		.matches = has_nested_virt_support,
-		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, NV, NV2)
+		.match_list = (const struct arm64_cpu_capabilities []){
+			{
+				.matches = has_cpuid_feature,
+				ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, NV, NV2)
+			},
+			{
+				.matches = has_cpuid_feature,
+				ARM64_CPUID_FIELDS(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY)
+			},
+			{ /* Sentinel */ }
+		},
 	},
 	{
 		.capability = ARM64_HAS_32BIT_EL0_DO_NOT_USE,
-- 
2.39.2


