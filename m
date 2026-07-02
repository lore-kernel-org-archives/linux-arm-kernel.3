Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5B7C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1UdJ97Bp7EXqhL2TR07gM6gIfScCTqCxI6c0EYEFwI=; b=OPA+UjUWmvUVTyI1zDX6DCkbZI
	iZYl8dV99IsPXTtK05Ck4o2ZZhrkPPT2SGdc8LEt2kDe5vT7tUaf5ajlXyN/Ca5gRJ3u6s5wyU3Jr
	6DAok5KowqSU4ZA3ESWW61CAesVyb2jC53dlNCR0fmsyaKB4NRQuhvEpypOmn9OZq1eaCjyyqKpcn
	ZYkaRY2wcxzFiBMLLj53Vk9D+81a7Ow2uaoT6dU6k/Bo3HAY7DzRwkFO7ALthUx+LqKuhKMfQuWMT
	wY22TPSuQvjQd+xvjYLU5JNo853ks3dGCFv5V/8+f3YDFAIBL6ok3quKKdEFhmUkGPni2dJ6UlmdF
	2F/RsPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsg-00000004ucJ-1fh5;
	Thu, 02 Jul 2026 16:03:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsX-00000004uHL-1DPX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B166415AA;
	Thu,  2 Jul 2026 16:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25021F01568;
	Thu,  2 Jul 2026 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008184;
	bh=/1UdJ97Bp7EXqhL2TR07gM6gIfScCTqCxI6c0EYEFwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R9yFgPqodk5pFnoAa8zckKG5N4UUu43NKBq397/iMbegaOgTq5BqV81zDx0d2vGlD
	 QT87B7VIzQUrFmwqrh/i83/dVidA3wTc01Ug7tfx09Bol2slx/1VWyWPrY4ufHdzPv
	 B2oWGEcAdtw+fBKi26V+XyBbdycXdRSL6JtsnKoO8XjNdaaWb7zDf3KtclSLmNXofi
	 A8ohcF3jVIyQmtEiYh7XTGG0sS7i89EbMmXLrvyDR6igUZMJprRFC/P3HO+Jj5mkbk
	 Vs8CUwZ78u5MRibCFswne5S7XAIABigu7YGOEQCT0es+X9hkbXFo2VZ92hWwoWNqrX
	 eZszobUdyh6cQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsV-00000000ojd-0sJp;
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
Subject: [PATCH 25/28] KVM: arm64: Engage NV3 TLBI trap elision
Date: Thu,  2 Jul 2026 17:02:45 +0100
Message-ID: <20260702160248.1377250-26-maz@kernel.org>
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

Similarly to the ERET elision mechanism, FEAT_NV3 can elide TLBIs
that only affects the guest's S1 translation. Enable this, with the
express condition that the guest isn't NV2 aware, as we otherwise
need to trap these TLBIs to deal with VNCR mappings.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index b32870a5e1236..d6f432b1558f5 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -715,6 +715,15 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 		if (cpus_have_final_cap(ARM64_HAS_NV3) &&
 		    vcpu_has_nv(vcpu) && vcpu_el2_e2h_is_set(vcpu)) {
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_NVTGE;
+
+			/*
+			 * If the guest is NV2-capable, then we need to see
+			 * all the TLBIs, as configured in HCR_EL2.
+			 * Otherwise, relax the TLBI traps to only TGE=0.
+			 */
+			if (!kvm_has_nv2(vcpu->kvm))
+				vcpu->arch.hcrx_el2 |= (HCRX_EL2_NVnTTLB  |
+							HCRX_EL2_NVnTTLBIS);
 		}
 	}
 }
-- 
2.47.3


