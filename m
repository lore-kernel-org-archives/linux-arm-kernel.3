Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21687C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abbuRn7ERMELANUQsWKF7tsdkKdp5Mps+aY1v1pDBuU=; b=cUhzEiHlGfhPc8kD+8IJ7kbWKN
	xVTyV0awXkMC+mpkK6XqDO2WGq5WGlWhNI/8me8ycpEkPrEyIaUhZ8oK/0hHzdVf8gKiVZ4HHYFk7
	P0DoMKc8vZBiMZwsz17tJ1IOwmfATnz1gxF4uV/v9X2c5cIxfqvgxcXzyAWu9uwrXfbZlS59qqAni
	EWfhNyW16bDFWrQfwKW944HhG9z6ZoW0yucVh4ZgZ6kAGUYEm4+qAphr4roMF8tAeac7J37suUmH6
	c2Gj9GofTWzABMfrjN7+vRitVqVujGMLPpE8e7TxKpriVZppqNlGWEea7A9aTmJHWI7ySRc/8gIjH
	GAExdgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6zt-00000001A3G-2Zpf;
	Thu, 20 Feb 2025 13:53:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6vS-000000018hI-4B4G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 979486144C;
	Thu, 20 Feb 2025 13:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18DDC4CEDD;
	Thu, 20 Feb 2025 13:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740059353;
	bh=3qNcw3CYfOVceSuJucDGYdwSv7d2QqdCWmHzIgDUP9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K/6aooAIhiXxTctJONavfFDjCW3rhD6X9uNsmzmW4ou1JqzOnzeG3gwCX4X9ae6kQ
	 XQIdnayTsbMil2PcKQpj9pfGtsAXbPWLiAQMoE6qy7Cfa5/ViutIM+FL+NBnZ/UOc+
	 D4l7Cdvztwp99qCh70BOlMOyCbXSzUKrJBINE3rQaMOw92LpAkFcymP5y+h5/k2voW
	 njHCI9uVPVssJeGkvhEqEDky2Mmce54KVc2JLA08alt3Qivz0VhJ7z23cApEVZlOiy
	 bpvfarCubn+6IzxUgfj3jGDhqJowHv3v6bOz/j7An9IPOL0EkchqT7Maw6tJAzMXxw
	 pOFfRBAKdMbcQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tl6vP-006DXp-Ov;
	Thu, 20 Feb 2025 13:49:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	gankulkarni@os.amperecomputing.com
Subject: [PATCH v2 01/14] arm64: cpufeature: Handle NV_frac as a synonym of NV2
Date: Thu, 20 Feb 2025 13:48:54 +0000
Message-Id: <20250220134907.554085-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250220134907.554085-1-maz@kernel.org>
References: <20250220134907.554085-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_054915_143898_CD20FC20 
X-CRM114-Status: GOOD (  14.44  )
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
index d561cf3b8ac7b..2c198cd4f9405 100644
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


