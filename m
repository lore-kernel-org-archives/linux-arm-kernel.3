Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A25C44509
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07dRYKXgRyU3x0X5on17tlJ7LESqf7TzRfpEcaCKSac=; b=4rUGG/GaEvaWNaJK05gb7xluSF
	Rya7pDWl7YIE+5EmxA/fQOHL8h62+1Hb42SlQqwGd8QjLAFMzIiQqdFPtOEfEN1N2q6mfrYu0rjvN
	vli7q4VWG/a5p6jq74SoekSvkPS0NypBRFg1AYZrzHPK2RGf5IrOQqs3IM1n/kwXRCcow5O3MifvS
	n0lg5DIk9gmY7xeb4Jd05Gry2FCM5qhWUaHkMgq1NxcgwFSp3ORAFm+e967PhUzjc0kpvtufriUg7
	nq7gAAwRoD5i4gaUPlxSsJx9MzrVTHXVU1Bba3jYLo+YaRN3uCQVNbgsUb6pD3koUT6kQ/6P390re
	ov/J0nZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZGB-0000000BPCi-101I;
	Tue, 14 Jul 2026 09:17:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZFz-0000000BP3D-3uQf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:16:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FA886132C;
	Tue, 14 Jul 2026 09:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054D11F00AC4;
	Tue, 14 Jul 2026 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020611;
	bh=07dRYKXgRyU3x0X5on17tlJ7LESqf7TzRfpEcaCKSac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i06AkM5WjMzdYA3MuLaaRZCOy7iPwtjy9QRrzjThhRYCxQNjbqKA6WDTBnje1TbtA
	 wwlB/BGabziv6rgHSCk2DuOdC07tOq6h34lxMmvUGiZCSdY8N7l07K6uCUY0G2qMFV
	 8UvpaJrud6ZEEjOUrlgH9IvcgIGwwFt2yiqkJozFp5XUwmnS6YsxdoiO1aZHtzoCTg
	 7vngTV3sayHob3wsCYtHInL2u/Dzmg+d8NhThEeph7J3SCshuOgAYppAEFxggrhvah
	 mcAidXMCln7JheNulkPbVYbY26I7tIPQ3bxVLx5/aLM6/6oKhvWo6aiwbGAz+OUBFy
	 ysoVd1U50fTyQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjZFx-00000004ny1-1E8Q;
	Tue, 14 Jul 2026 09:16:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 11/28] KVM: arm64: Expose FEAT_NV2p1 to NV guests
Date: Tue, 14 Jul 2026 10:16:24 +0100
Message-ID: <20260714091641.1970822-12-maz@kernel.org>
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

Since NV2p1 is reducing the number of traps, it is valuable to expose
it to NV guests. Do so.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index dfb96edbdc43c..35a1c42ad3f84 100644
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
+			val &= ID_AA64MMFR4_EL1_NV_frac;
+			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
+				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV2P1);
+			else
+				val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
 			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, E2H0, NI_NV1);
 		}
 		break;
-- 
2.47.3


