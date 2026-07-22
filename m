Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866B9C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwUtkaBfc1/bGDoMdw8wkMEGT7WDFKoW/EX/Xh2aA+Y=; b=icUKnfS8nz8YWN2j1DMca07khd
	OANlsGFCOwovxsFbe0mV7x08zPMiJ6D8Q88w3ZkCTMbbB9aUzvYl1Kqi2qFz16i1/0nUHfVNKjD++
	e+UVtz3Xhw1xWJVIugB0voIAYmklld/5ctM6crOpOrnKaBsTyo6eII2rB7BjlP60gFCvj9ldiFPQ1
	Q2pm0xgwIeT+35Y+K/lYUAOiUutW2VyqS4TlRf6Hql45pbTJt+VEbyvn14uXJSmEwOwpFsaRrtoVi
	B4wMUvX7WccxOETHHtt2WD+/cz6kfjm9olSg79p8P6IT+z17uQhTHNENohWLUDbvQugiEAQxVkE9/
	tAn13Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRc7-0000000B7N8-1V4h;
	Wed, 22 Jul 2026 07:43:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRba-0000000B6mL-3cyn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:43:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BF3E60A7B;
	Wed, 22 Jul 2026 07:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41031F0155A;
	Wed, 22 Jul 2026 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706182;
	bh=ZwUtkaBfc1/bGDoMdw8wkMEGT7WDFKoW/EX/Xh2aA+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LYR559Cq+9PmDBj5i3IMaVxCT3dz5SRrMtWEQVLpWjcZcymRRwRSCWEDAZT1LJWTA
	 ihXqYYfFwHNHAnKZdHAO5BTr62JpieqqbWm41vq5xjftXE7kjgukXRi8/eCI9civVn
	 VJz2I8qqhxnWPLR24aUxFxcV8pgIkZZkKS0RJ4OTuvL/GQH2xkXnUSf2q2ivc2T0i7
	 rHVB+ZLi27SxcblOoJGh/cXGrbvr0LcY65iJLTfTe92xWHx58PTFPCtIE0d2eWmiGS
	 ReXu7QwqPfuoufD2P5XWTVBAJ0NukKpKXhbBArrsWnfN+E5/XiloBFlo4rIwomRdQj
	 dH9mAzvAbuH+w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbY-00000007VfN-1PkQ;
	Wed, 22 Jul 2026 07:43:00 +0000
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
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 27/28] KVM: arm64: Expose FEAT_NV3 to guests
Date: Wed, 22 Jul 2026 08:42:33 +0100
Message-ID: <20260722074234.3330999-28-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722074234.3330999-1-maz@kernel.org>
References: <20260722074234.3330999-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com
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
index f646894fec9a9..70d605e60cfb3 100644
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
@@ -1741,7 +1741,9 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 			val = 0;
 		} else {
 			val &= ID_AA64MMFR4_EL1_NV_frac;
-			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
+			if (cpus_have_final_cap(ARM64_HAS_NV3))
+				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV3);
+			else if (cpus_have_final_cap(ARM64_HAS_NV2P1))
 				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV2P1);
 			else
 				val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
-- 
2.47.3


