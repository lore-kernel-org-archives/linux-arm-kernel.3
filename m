Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263AFC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UV7vo70Q15PKxyHcuqcabZOcjIvoszDm8zYalteT250=; b=JGEWJ3QMrnBDfRzgRwjEbKODL0
	QWY8/FK8VYK+ze/lRJxi2pTaH0WpohFljX080VP53aV2zv5qxdFO9sUJMxq1UyG1FUDg2ByeNgUfb
	7Adf48QCe0yugiKVfIQyEBnHOp9iORpBCT4SwCo+kqYdsB9Q/HYD6IFuZd8NpQxAS7XcbKyBf+psT
	qj/BpwndExqM3LMPx54PPWTq97DFWRh/i4YYjZy/poteQhKvYV3ZoOWqtN8dLHNqmg1YC5PDbSAJC
	wwMJdMusg6eJ0NK9Lsyccj8fz59FUQpdaaMPXpR+uP5I74UQ5NXls4XU+JVefnIKRot9WhzUM3wq8
	znHyxWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsZ-00000004uLJ-33No;
	Thu, 02 Jul 2026 16:03:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsU-00000004uCO-0r9V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2827E43F1D;
	Thu,  2 Jul 2026 16:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1011F00A3E;
	Thu,  2 Jul 2026 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008182;
	bh=UV7vo70Q15PKxyHcuqcabZOcjIvoszDm8zYalteT250=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QBHZsXz2mrPcvKCNA4yIgk6MMYZxTI6e53pJi2GYsgmQzfEDC7BPl/BB9pfI/baz9
	 QN5gjO1hhWU+OeDwSmg9hUHgM/YSeokmkY0JtnPnJAnldtegNp3z/JigCnY8d0rNsm
	 IdR+bM5OXMcymo9hvTKFVg5zbLSRtTqQSaL8X9lLlWj9uT5WuoJ8ZjgAfWmCgaDRGk
	 5yV0tOzAj39W/5+mZMcznwydxwOWKrA1f4edHjSQZK8l7v/guorS+6f/MNE/2116Nm
	 ECTCWBcPUWHGMXApIqEn50DaB0bm4gTpqlOWdopFp6GBvOzryA03IUdcx/IdQUXH9u
	 hdaKQUmANrNKQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsS-00000000ojd-1OTY;
	Thu, 02 Jul 2026 16:03:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 11/28] KVM: arm64: Expose FEAT_NV2p1 to NV guests
Date: Thu,  2 Jul 2026 17:02:31 +0100
Message-ID: <20260702160248.1377250-12-maz@kernel.org>
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

Since NV2p1 is reducing the number of traps, it is valuable to expose
it to NV guests. Do so.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index dfb96edbdc43c..9972dea42d12a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1728,7 +1728,7 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		 * You get EITHER
 		 *
 		 * - FEAT_VHE without FEAT_E2H0
-		 * - FEAT_NV limited to FEAT_NV2
+		 * - FEAT_NV limited to FEAT_NV2(p1)
 		 * - HCR_EL2.NV1 being RES0
 		 *
 		 * OR
@@ -1740,7 +1740,11 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features)) {
 			val = 0;
 		} else {
-			val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
+			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
+				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV2P1);
+			else
+				val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
+			val &= ~ID_AA64MMFR4_EL1_E2H0;
 			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, E2H0, NI_NV1);
 		}
 		break;
-- 
2.47.3


