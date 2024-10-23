Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F951CF539E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNJRTYVP+yRHM59tEwezyRAja3crd/q+Tw6nbQq41vE=; b=TkFjEJ5yya+95IhTpKZJAkvQzQ
	4jNK3RcdNAcv/JBMLhCxEaQV5+x6SmUJ9ou5SLlBftEOCxDreWzqdfz2KQCCFA617La0YigJHAY2K
	vHeKFH4qPWVo7JHeWeauj2SxYMKrwK3O+F+RtFtejGdHK6K8+E2+D/6q7SKzNqdWkk7QYPclDunae
	kH38Kt0FGrZs5J6lWM+NcWovYexL1TwhG+3ppsxRhccXLU4jK1un9NldFD2WgYVgjCJjcNOLDGWrs
	BZh5IhqA9X7fOsz2aesYAg1sFKci+uE0VtBAyTVo7sEHernSI0LsmNRFq1rUl7p7sMB2IXmEgmSyh
	HXgIFpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dER-0000000Ewtf-2ROU;
	Wed, 23 Oct 2024 15:25:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckN-0000000EpQ7-3bz2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nNJRTYVP+yRHM59tEwezyRAja3crd/q+Tw6nbQq41vE=; b=m6/EU3a40O8OCUXIsaMJTUFshy
	M+aTCrBmCjaxcrVr3z6LUuNwXBUWpHTQBNIkFdNRnAJSmXP1upKwALD7bYSvPe4XouePVGP3EW9fv
	kMfk9lJFHr9XO2RevF/gR3dpl31dHsA8VYniszdW+yuAhXA9eolndbSqgKs1bXDz986NEZLnI3dFG
	HWcIHpCDsobkBj2OuxwiNn+xgJ9gy5WCF/cuAMlSzWpI/2k9Odo020lNM8DF0IJ1l6/DmrKwMRdkK
	hP+GUY9LbzGPVeqS9aYbXW1AnIncwiwVMc4A9OouSim4ak8v+TRIx1SZweLUBsS+Fn0epg/i0jc6i
	+zmIb3pw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckK-00000008Qbn-0I5i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5286FA4502F;
	Wed, 23 Oct 2024 14:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58224C4CEE6;
	Wed, 23 Oct 2024 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695234;
	bh=Ndyhy4f9+aMJcCyUr5ZtLkREXt/9DAHPLPbNiHbLeqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=altMq01t8W3+a5/1kF0TeDisedul4ml4EkD2IDcwMeeZILvwjj6kDyXaU+mLvOTyk
	 +CT3zmaNoQ3oKwJeKe2soY85lcYeUZbIPjpL8TEyjj+eTk8lUAXctD4jkLVJK55SDb
	 Ipi8mAGFK1ZvBM5N2mCLpwAx61EbgaNH0qXGoib20qBmTShP8zsMWGAYim8dWLCc7O
	 p0zBjgSkpuDVyQo9i8nAgX8mfwgcxKkzHT5jP7EBFb3lFhMUFwFQMEvNW+eKzIFpEJ
	 +iNKUopzzCeUNdpb4LAPwnXoifHuecWRu2CZ3OHG8FOT/ABRguG7NgvMkAq+8pc1tw
	 08UNnMhF7X3AQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckC-0068vz-Jn;
	Wed, 23 Oct 2024 15:53:52 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 15/37] KVM: arm64: Add save/restore for PIR{,E0}_EL2
Date: Wed, 23 Oct 2024 15:53:23 +0100
Message-Id: <20241023145345.1613824-16-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_155400_368937_F7B0C408 
X-CRM114-Status: GOOD (  12.49  )
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

Like their EL1 equivalent, the EL2-specific FEAT_S1PIE registers
are context-switched. This is made conditional on both FEAT_TCRX
and FEAT_S1PIE being adversised.

Note that this change only makes sense if read together with the
issue D22677 contained in 102105_K.a_04_en.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index cdbf52bfc4833..a603966726f65 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -51,9 +51,15 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
 		__vcpu_sys_reg(vcpu, TTBR1_EL2)	= read_sysreg_el1(SYS_TTBR1);
 		__vcpu_sys_reg(vcpu, TCR_EL2)	= read_sysreg_el1(SYS_TCR);
 
-		if (ctxt_has_tcrx(&vcpu->arch.ctxt))
+		if (ctxt_has_tcrx(&vcpu->arch.ctxt)) {
 			__vcpu_sys_reg(vcpu, TCR2_EL2) = read_sysreg_el1(SYS_TCR2);
 
+			if (ctxt_has_s1pie(&vcpu->arch.ctxt)) {
+				__vcpu_sys_reg(vcpu, PIRE0_EL2) = read_sysreg_el1(SYS_PIRE0);
+				__vcpu_sys_reg(vcpu, PIR_EL2) = read_sysreg_el1(SYS_PIR);
+			}
+		}
+
 		/*
 		 * The EL1 view of CNTKCTL_EL1 has a bunch of RES0 bits where
 		 * the interesting CNTHCTL_EL2 bits live. So preserve these
@@ -110,9 +116,14 @@ static void __sysreg_restore_vel2_state(struct kvm_vcpu *vcpu)
 		write_sysreg_el1(val, SYS_TCR);
 	}
 
-	if (ctxt_has_tcrx(&vcpu->arch.ctxt))
+	if (ctxt_has_tcrx(&vcpu->arch.ctxt)) {
 		write_sysreg_el1(__vcpu_sys_reg(vcpu, TCR2_EL2), SYS_TCR2);
 
+		if (ctxt_has_s1pie(&vcpu->arch.ctxt)) {
+			write_sysreg_el1(__vcpu_sys_reg(vcpu, PIR_EL2), SYS_PIR);
+			write_sysreg_el1(__vcpu_sys_reg(vcpu, PIRE0_EL2), SYS_PIRE0);
+		}
+	}
 
 	write_sysreg_el1(__vcpu_sys_reg(vcpu, ESR_EL2),		SYS_ESR);
 	write_sysreg_el1(__vcpu_sys_reg(vcpu, AFSR0_EL2),	SYS_AFSR0);
-- 
2.39.2


