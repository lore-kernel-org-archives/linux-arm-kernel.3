Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AD4C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZzWfhxSs7Ijv/NWxS+JT1yf5R5x2XicAoTTuuWFkWA=; b=qHzRrIxDM8EqtmG1rcfeFOpUuO
	uegWBVXcsauCFtwpXgUH3PRStphfDLmeZHbqPm4YMiMU/ajisYPnSYq52cYqSbruVYK28bKjjsaAY
	kw3pNnCdtfUy023UKMWGihRAXD6mPoH9nJSDzfvsio5GEp9WWNcLoewfgwXxtAF8osZtZ60+njVwb
	oDuZ8W9lf05M72z/XJR/nUP++IoE7vQmmJ4zdLe7tFcwYKVRTRtq6AS53eul+RvUbT/adqYFkPg+V
	MokyhczSpE3/X3JfC+r0S8to5y6v1QlUUiB6VGA2lxrLUdYKanZiQmJ0OvM08kBRVQe8duvCGS4u6
	y693k+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJse-00000004uVZ-1oTy;
	Thu, 02 Jul 2026 16:03:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsV-00000004uFp-3NrR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F60840458;
	Thu,  2 Jul 2026 16:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708E81F0155D;
	Thu,  2 Jul 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008183;
	bh=3ZzWfhxSs7Ijv/NWxS+JT1yf5R5x2XicAoTTuuWFkWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ckQE7mhwh2oDXFxSOYBNLTkJS2b3Itkc9NeXYd8YqyOBkYNf4SbBaXT2R0WOkmUDX
	 ZknSV+x6oRrfTJL5zhjF55FiUAMiVGWHUTaBlnVv+k1bXOiNovERSIfY6HGQB1JTph
	 MgdI+rTNpenvbCGx4JUfljmeggDCHKeB53Ne9BmbWUcgulpRNvIlBnnXGZHTI2ef5E
	 1G2knwCJG9k/HbYB2SaHty1rasEWQzYguJCVA85Rs/VZQROuQ2j9/TZg+uEMTiUefn
	 0mp4Qq3YzGS8R4TmuIO2VUWMIP6lH4Z0pxo8kFxS2T5Ld/Q0qlxSwAU7VXpOJ9UQ/b
	 mivsOjp4Wgc+g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsT-00000000ojd-38yA;
	Thu, 02 Jul 2026 16:03:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 18/28] KVM: arm64: Add kvm_has_nv{2,3}() predicates
Date: Thu,  2 Jul 2026 17:02:38 +0100
Message-ID: <20260702160248.1377250-19-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Add a new set of predicates indicating whether VM is capable of
NV2, NV3, and is in a nested NV3 context.

This is going to become useful as we start dealing with a mix of
behaviours (NV2, NV3, NV2 on NV3...).

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 9831166695186..c562d8171d5e1 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -266,6 +266,26 @@ static inline bool vserror_state_is_nested(struct kvm_vcpu *vcpu)
 	       (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TMEA);
 }
 
+static inline bool kvm_has_nv2(struct kvm *kvm)
+{
+	return (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT) &&
+		kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY));
+}
+
+static inline bool kvm_has_nv3(struct kvm *kvm)
+{
+	return (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT) &&
+		cpus_have_final_cap(ARM64_HAS_NV3) &&
+		kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV3));
+}
+
+static inline bool is_nested_nv3_ctxt(struct kvm_vcpu *vcpu)
+{
+	return (has_vhe() && kvm_has_nv3(vcpu->kvm) && is_nested_ctxt(vcpu) &&
+		(__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_EL2_NV) &&
+		(__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_NVTGE));
+}
+
 /*
  * The layout of SPSR for an AArch32 state is different when observed from an
  * AArch64 SPSR_ELx or an AArch32 SPSR_*. This function generates the AArch32
-- 
2.47.3


