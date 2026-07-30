Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE933C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmXle6f58ZvhPKo2zNTeSDGA59Tm96Gw2BOndMtNuhc=; b=P5dkQxcmPKWgJLkYX9Vh+tcahw
	bg/D+wsbYHGnKOoi5RMZMUbl2C2c33ohvwzi5I+L65bVgiWI3paCjpHozuo72qLIwIIlSxceBtD0j
	F9GcG5Q4bTAtUfxzc/LZKxM507mhLRiprl/5WJFVPGQRhDMkBp5fxQ0QrNY1QXJMI1AyiUrO0tmRS
	54DTyR/ohT2YucWNVHLTScump/bOd1rGacAjra9n/YFEsGjDWznfZbmjHgPbLnpbmTVIexYanRCGZ
	ISEvYVQ4pbQtvgrKYw+NP/1FTwcq4D8sWloJFN/3fcruhF5k46c41E5pUlInn4Aogs9IAf9ZbCPjX
	Dmqhf3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvd-00000009grw-2Mc8;
	Thu, 30 Jul 2026 07:11:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKuu-00000009gP2-17Tv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B328E600C8;
	Thu, 30 Jul 2026 07:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696F01F01560;
	Thu, 30 Jul 2026 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395455;
	bh=EmXle6f58ZvhPKo2zNTeSDGA59Tm96Gw2BOndMtNuhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Zno6SSpowHOpAHby86cYgerCZNwtKn6gtjS97iRgtUzRAr+akk7QTahaCA34xT0ur
	 GZIi8l1Fj3AWWKxOaQU6mXUqio7lBhQpDzYPCxBVJd6o0lbPp9+N2naRTqw397pmna
	 2fcS/I4NwXUpb1AmCdMsuWMa0Egci3VjPcZbKT+F2m4I+CReSUfoaj+XHqmdk/eaIg
	 ExT3CZL5VO7S06boAJoRdq3G+eg6a/C6FHFWxu8gyhELlAconX5x6hVCkNu8FcHKA/
	 u0WWpLrn/Q0MYW6PGNpN5GrouBg/7XsyMfw1N3caruPx2Gg2bAsL90E187F0LzWYaQ
	 hPtKW3BYSbInw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKur-0000000AOpW-3MpF;
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
Subject: [PATCH v4 25/29] KVM: arm64: Engage NV3 TLBI trap elision
Date: Thu, 30 Jul 2026 08:10:18 +0100
Message-ID: <20260730071022.296811-26-maz@kernel.org>
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

Similarly to the ERET elision mechanism, FEAT_NV3 can elide TLBIs
that only affects the guest's S1 translation. Enable this, with the
express condition that the guest isn't NV2 aware, as we otherwise
need to trap these TLBIs to deal with VNCR mappings.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index ee340d3294478..67ad4523a1e67 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -714,6 +714,19 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 		if (cpus_have_final_cap(ARM64_HAS_NV3) &&
 		    vcpu_has_nv(vcpu) && vcpu_el2_e2h_is_set(vcpu)) {
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_NVTGE;
+
+			/*
+			 * If the guest is NV2-capable, then we need to see
+			 * all the TLBIs, as configured in HCR_EL2.
+			 * Otherwise, relax the TLBI traps to only TGE=0.
+			 */
+			if (!kvm_has_nv2(vcpu->kvm)) {
+				vcpu->arch.hcrx_el2 |= (HCRX_EL2_NVnTTLB   |
+							HCRX_EL2_NVnTTLBIS);
+
+				if (kvm_has_feat(kvm, ID_AA64ISAR0_EL1, TLB, OS))
+					vcpu->arch.hcrx_el2 |= HCRX_EL2_NVnTTLBOS;
+			}
 		}
 	}
 }
-- 
2.47.3


