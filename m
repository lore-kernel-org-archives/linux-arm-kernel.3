Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4D3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uitPE3YZ82V7uRyv8yldMkwgClqFe0DQvFTN5NyfsiU=; b=CAxUX8qkQA36+h0Sd1W/DW2x7r
	N7ktC1wX5i0FpEDAdlKzgESbm7S6IIHW918U9JoZ0k0GbTzFp9oesxWxkUI8VGXPWsoQpL2SBatgG
	Y7tJ03lcJWgXkxYMjxxdnNNPQdTrRa1By9yts0e5cx8W+2Jby3m2iFp63Qh/b32KqBUrXWyCkuF1+
	sEDQsCrJUjGTiCyIkEsw0+C48Lf3CrDcFO43ELVDn3SaEQIukaGUmxGzArck4JgDZwsR+H7TsfkoU
	KnbsWEncjtMsRLn9IOha4tYgTFvJBQsa8jJ1rHQ8fQglhMbazwU6QFS9t7M9z7UQ2E3SuIQwIUMxR
	V46s9L8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsh-00000004ufK-1jLw;
	Thu, 02 Jul 2026 16:03:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsY-00000004uIr-17Nc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A53D5601FE;
	Thu,  2 Jul 2026 16:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EFC1F0156A;
	Thu,  2 Jul 2026 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008185;
	bh=uitPE3YZ82V7uRyv8yldMkwgClqFe0DQvFTN5NyfsiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FTXFoo6xmxtosrUf+QPhnEHxOlvAyECtAiA9mMI/I6z2IdyZ7Jqp29nrJrNavXuo3
	 e779vVH1o+HgvwmOBh151KoXTf/l4Ln1MdMaTO35vmMgODLNksB7FpNHyn+sJHKTjU
	 EkZA+CUA4enr69BujdvDePK8Yiq64NQOhi9Zc5DlpFpJKAdRAxrJyBuEQ4FPDHYmU+
	 NxYJSl2Rmeh7RY6ezrkWFt8fhJ3JHLiWH98j/oOaRC0kbR+4p01B5tzCnnmW9cPWst
	 1kMwEfuMcgoY3n1CM4yYy8958SkrmhMawEvuGAS1XoJxf0Hu+Oat5pyP4XnAA6LLwg
	 bdXAnPj1sMBug==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsV-00000000ojd-2Z6n;
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
Subject: [PATCH 27/28] KVM: arm64: Expose FEAT_NV3 to guests
Date: Thu,  2 Jul 2026 17:02:47 +0100
Message-ID: <20260702160248.1377250-28-maz@kernel.org>
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

Further enable FEAT_NV3 by making it visible to NV guests.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index c9bf04944f9cb..64c8fb82fadf6 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1728,7 +1728,7 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		 * You get EITHER
 		 *
 		 * - FEAT_VHE without FEAT_E2H0
-		 * - FEAT_NV limited to FEAT_NV2(p1)
+		 * - FEAT_NV limited to FEAT_NV2(p1)/NV3
 		 * - HCR_EL2.NV1 being RES0
 		 *
 		 * OR
@@ -1740,7 +1740,9 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features)) {
 			val = 0;
 		} else {
-			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
+			if (cpus_have_final_cap(ARM64_HAS_NV3))
+				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV3);
+			else if (cpus_have_final_cap(ARM64_HAS_NV2P1))
 				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV2P1);
 			else
 				val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
-- 
2.47.3


