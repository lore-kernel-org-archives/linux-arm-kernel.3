Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C4DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jaHFCEviRnbCdixdpD0GtuLBAdju+GKxQE6UGfkIoQ=; b=djjZKAVhtb2FKlwcmGiVahcyGD
	SySed/HzSSE9olsDo3H+sK2qyeiBCeOc+84CtqpN3Q07UFOVE1UJ2229/3rgeEoKm/6ydyhCMQsRm
	qka/WqHxAoIe8UQ0fm1IW9NeT74pNDL9I/ZRXVBrRPkiemHUAV5SX75sUVmAHOHX4QYJJvaaKVfIG
	CI0zImcSHgnEYFL4wwMLpUuEfBFJQRDSMT0FtDUuY0Y5h0Zs50aR24ioIKUZZT+AINeKaSyHoslrC
	S2DMZrw2qphAp/qhypMLIzTqYqqYPtL37oZ9/3MbAubKQ7574O73SI7V2j8rdlx0LnOVs4Ncj6QxG
	WljJQ+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZGF-0000000BPQ2-2WsA;
	Tue, 14 Jul 2026 09:17:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZG2-0000000BP5o-1Ylj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:16:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BF1B43D86;
	Tue, 14 Jul 2026 09:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38C11F00ADF;
	Tue, 14 Jul 2026 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020614;
	bh=8jaHFCEviRnbCdixdpD0GtuLBAdju+GKxQE6UGfkIoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lB/flkKHtoBf/BAkGYkte5eGO4Nctr+CYyOZOCZ99SKRVb0JUjvdL+LcC67gINrPf
	 2NP1U6P/0Nvl3f8Zf06igfpgcB+rf5un+BFsoRXa/9D2Yeb8yukzXYVqE8AO6R7WNw
	 1q5LuSyscn6bDQHt1Dwv9ELOTyywG5u2+tKAg0lqruUm+xdXpOZVZLKwfepYmkGM2M
	 fb6gJYHBtsIGuQ0IesqKQCjf/BsjQCDlQ2Q+OWkrmD4HNPnKq1ykjOUR6bMKSUwi9/
	 d5WFl/Ynl5VI7zpTvDyjCriAl06Hgy6EBBh60YxWY0UtWIIT8PrZNHRZMImc1156Gy
	 lVRBGkINpvEJw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjZG0-00000004ny1-18W4;
	Tue, 14 Jul 2026 09:16:52 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 25/28] KVM: arm64: Engage NV3 TLBI trap elision
Date: Tue, 14 Jul 2026 10:16:38 +0100
Message-ID: <20260714091641.1970822-26-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714091641.1970822-1-maz@kernel.org>
References: <20260714091641.1970822-1-maz@kernel.org>
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

Similarly to the ERET elision mechanism, FEAT_NV3 can elide TLBIs
that only affects the guest's S1 translation. Enable this, with the
express condition that the guest isn't NV2 aware, as we otherwise
need to trap these TLBIs to deal with VNCR mappings.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index b32870a5e1236..d17b161d4ba3a 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -715,6 +715,19 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
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
+					vcpu->arch.hcrx_el2 |= HCRX_EL2_NVnTTLBOS;;
+			}
 		}
 	}
 }
-- 
2.47.3


