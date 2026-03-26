Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F18510A88E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x50UIWy3mQSxm8grwWRzsnag19VoOGManJS+XmICi1o=; b=JaBnXUa92U5p341zN4/V2iNagP
	EZ3ZOH3BQwK6q4MAwcDAnJ2vhjZK5OBJNiEqKPzLvZH60MjN7IyWz2SflWdN/ocbio6t/5K8jEq14
	0b1sA76tBodQHYN2O+bxD7Tpu3YRxPK2wCNQqLytPjH5Jdm+XO0+Vmwdz0cPrUYc+X1OZV+5nVFlH
	HIBBMNXx4Y2fCeUwVeyJLAQSn6ZO/d+OdMK1AJvKmuCExqHnfP/LUdPPYHS7SfeTQTrFxHrfDCuXW
	HNkPLL5oUkZhofpporOkVMEcWdZ4LqASdHdtQkQoO70J+cYOlQ1VtDj9RAyS1Ajp2A6ZYs2iwPdr1
	xcfwBTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkQ-00000005lFS-1NVt;
	Thu, 26 Mar 2026 15:35:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkF-00000005l4y-2K9V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 325A04459A;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124F6C116C6;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539338;
	bh=wAr21SGWaskPWZ1zkmUORU+tQYp2h4f6CHNfFfIlMVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cLxF8Su3CM01NazMbWxO/wtlKzB25+OPV2YXtiaBvbAGTgw6KQWk3aa3+MB0Q0sqw
	 nBsDsj4jX1QTabNbGcBq3jyyELSM0jPhNsHuTZkqMeAJwSPDsEaR01HZiagDleTpo+
	 D3tuWGty1eyTVqPasyuKtj9dkRkg8eTdq48mxNzCOfwaF/JaOIy/sqLwo0CCc3hxg2
	 kXbwBqzvZMPjTH+FTJYuY3YUV8oFpnXGsQCAHTZ3P8ZiD1/cAKGdTKuabpYtVxFAba
	 3DuzfWJ/4Zmq+W17upUX1UjZ9sv2Z0ZBKIkbfiVNB01q7jU09SHpvMoP8Adt+tiDhy
	 qKiLMqAnfBo0Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkC-000000060II-0jUE;
	Thu, 26 Mar 2026 15:35:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 09/15] KVM: arm64: vgic-v5: align priority comparison with other GICs
Date: Thu, 26 Mar 2026 15:35:24 +0000
Message-ID: <20260326153530.3981879-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083539_662343_0EE8B9C2 
X-CRM114-Status: GOOD (  11.81  )
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

The way the effective priority mask is computed, and then compared
to the priority of an interrupt to decide whether to wake-up or not,
is slightly odd, and breaks at the limits.

This could result in spurious wake-ups that are undesirable.

Adopt the GICv[23] logic instead, which checks that the priority value
is strictly lower than the mask.

Fixes: 933e5288fa971 ("KVM: arm64: gic-v5: Check for pending PPIs")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 0f269321ece4b..75372bbfb6a6a 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -238,7 +238,7 @@ static u32 vgic_v5_get_effective_priority_mask(struct kvm_vcpu *vcpu)
 	 */
 	priority_mask = FIELD_GET(FEAT_GCIE_ICH_VMCR_EL2_VPMR, cpu_if->vgic_vmcr);
 
-	return min(highest_ap, priority_mask + 1);
+	return min(highest_ap, priority_mask);
 }
 
 /*
@@ -367,7 +367,7 @@ bool vgic_v5_has_pending_ppi(struct kvm_vcpu *vcpu)
 
 		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
 			has_pending = (irq->enabled && irq_is_pending(irq) &&
-				       irq->priority <= priority_mask);
+				       irq->priority < priority_mask);
 
 		vgic_put_irq(vcpu->kvm, irq);
 
-- 
2.47.3


