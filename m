Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D4EC44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sc+YNJvCMO8POyKxYM31Z+XWj7WidvIM24AX/y83cNU=; b=PyMv3VWdh+pR47SoXAc09C+GRh
	XG9+t4tnSJYDNU3AaUTZbd6jra1KHMFzdE+cdnRnksLJpvd6yh5HOvFvouAeeb4fkUEn/F0Iy7ZvE
	dzKQIjUhMvnUXLzd96gtVgnGx6caa1cmW5bBSnhm/RKwpI3G4xbTF812OAmWCL8euNU9a021Oi6pm
	DGMfJkH78HiuNUEXcLYJhbi71XcST+XX5qbHiGj8pMx0BWkJbWtMTpALnA4KVvb9OcfTv6BfQcR/6
	i+ikPG6yIHAhVZmP7cuo4jm2GAq+GJoqresviIcE1Y6JHcxMzqM+ZLmlucHRazcioCKYg6DYxWuwO
	AwJ0TbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsg-00000004uaw-0Wfi;
	Thu, 02 Jul 2026 16:03:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsX-00000004uH3-0O8A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3A0443F5B;
	Thu,  2 Jul 2026 16:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92981F00A3F;
	Thu,  2 Jul 2026 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008184;
	bh=sc+YNJvCMO8POyKxYM31Z+XWj7WidvIM24AX/y83cNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fQmPCFTUWtFjdY1I5sHHCwNx3VALn85F6ecggwUHdTHiuJqaAQActoHfxowc30YBk
	 UVU1MvWDg58ccT96JQr+/jWoX08/9NI8PcVt2FDvxhwnHlvn19oKoU6UF9VFGGxdcT
	 mm02U3Cs2CU+f+kzWCfyMGbXedDtQ4zf+FraSlbRnSK1d0eHRdJpSuvMOftP8i2dUh
	 lf1BVgWVWogbFa5g4KRKntCRdsmmu2d0ey8LAn/6DaJPwkGsFnuqag50qFSIU4HxAT
	 dZqOisqPJ7TCWpsRnHWB/Mr6PB5/kNpZUtxeQxSV4p99vnaDDGIFRo59QWRjjsWZdr
	 P3JT/cx8x82Pg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsV-00000000ojd-02eU;
	Thu, 02 Jul 2026 16:03:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 24/28] KVM: arm64: Engage NV3 ERET trap elision
Date: Thu,  2 Jul 2026 17:02:44 +0100
Message-ID: <20260702160248.1377250-25-maz@kernel.org>
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

When running on NV3 HW, always engage ERET trap elision when running
the L1 context, as there is no benefit in not doing so.

An L1 can itself engage trap elision by setting its own view of
HCRX_EL2.NVTGE==1, which will subsequently be honored.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 10 ++++++++++
 arch/arm64/kvm/hyp/vhe/switch.c      |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index c562d8171d5e1..b32870a5e1236 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -706,6 +706,16 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 
 		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
+
+		/*
+		 * NV3 is a host-specific extension, and we always use it
+		 * when present and that the guest uses NV. It may be be
+		 * hidden from the guest though.
+		 */
+		if (cpus_have_final_cap(ARM64_HAS_NV3) &&
+		    vcpu_has_nv(vcpu) && vcpu_el2_e2h_is_set(vcpu)) {
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_NVTGE;
+		}
 	}
 }
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index c5c06ae41b229..f129f22f15618 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -345,6 +345,10 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
 	u64 esr = kvm_vcpu_get_esr(vcpu);
 	u64 spsr, elr, mode;
 
+	/* With NV3, the fast path is handled in HW */
+	if (cpus_have_final_cap(ARM64_HAS_NV3) && vcpu_el2_e2h_is_set(vcpu))
+		return false;
+
 	/*
 	 * Going through the whole put/load motions is a waste of time
 	 * if this is a VHE guest hypervisor returning to its own
-- 
2.47.3


