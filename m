Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C10C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iphw/trZbQgKuaLseXe8o8FXlhLchtJlvFzyolbcN1U=; b=ccYZ+m9z6m3E4tRXRcc6nX4RZZ
	JtO0dtyHVbP+tpuRjoPUYQjspDeIir2Al+Hu8unyHqneSsNctWzKa2ewDpbAasRflogpKDGpEiO71
	fcB8dXteS3JbogkdQ9qQ118l5FGB7G0JWpUs9MfhLskwiG/EyNPqmMloIYwn00Sm3XN/Mj+6E5hOg
	PAzaJoGpE7+a56wYsDkC2wvw0y9momPwC+gAqM1aW7mU8gB1hYA9EpPLiZRa5bqNN97HcO3ZDmipu
	7h+ChYH4+gRG3gZpqG0NpV2oqNI1+z3PGWSIl7LXW7k2kaM+FB68WvkrmL9Z8FD7oCD67GTSpW4H8
	hmCY2pmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvb-00000009gmp-2knp;
	Thu, 30 Jul 2026 07:11:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKut-00000009gOl-2M6H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53B7E44037;
	Thu, 30 Jul 2026 07:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391211F0155B;
	Thu, 30 Jul 2026 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395455;
	bh=iphw/trZbQgKuaLseXe8o8FXlhLchtJlvFzyolbcN1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eNsntE6cJcGyj56BJgdyOCjZzmZoi1R0PuaWlWqd/5Oa5TZvCHYDo/fGndmHfzbgF
	 162aGnCZrLLduG/QDL6GWZkfrFqK/CX6ZZ3IC9MHykt068Mbg6Nfq6WNMTVmPsl+wS
	 A9z/txwh3MV3nh4MMdHPEEH8zOzmDyOT471tcN2T4eLh2QLWU5U8HJ/3GhCGC/vDZ+
	 TcJBXFrySwD7YOC0JZvr0Uy3MUfA++tCiyb+4fmi7J4E+p3b6M5paFQg6Rkvh1K6F1
	 77KL2EmMntoT06VDJ4fjNwt28ZDKhejpxtMYm5LUO1Cd6zaQy5gND+jIV8dUNxwGex
	 BPrx3jOZRCquw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKur-0000000AOpW-2S4K;
	Thu, 30 Jul 2026 07:10:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH v4 24/29] KVM: arm64: Engage NV3 ERET trap elision
Date: Thu, 30 Jul 2026 08:10:17 +0100
Message-ID: <20260730071022.296811-25-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730071022.296811-1-maz@kernel.org>
References: <20260730071022.296811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com, vladimir.murzin@arm.com
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

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 10 ++++++++++
 arch/arm64/kvm/hyp/vhe/switch.c      |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index bdb7dfaa271cd..ee340d3294478 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -705,6 +705,16 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 
 		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
+
+		/*
+		 * NV3 is a host-specific extension, and we always use
+		 * it when present and that the guest uses NV. It may
+		 * be hidden from the guest though.
+		 */
+		if (cpus_have_final_cap(ARM64_HAS_NV3) &&
+		    vcpu_has_nv(vcpu) && vcpu_el2_e2h_is_set(vcpu)) {
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_NVTGE;
+		}
 	}
 }
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index cbda9e087db39..4ed745bdde418 100644
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


