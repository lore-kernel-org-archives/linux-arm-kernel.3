Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55E0CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU56tLyF7UzXsTeACLNC09MWYPppBK+O1Bfll83A28E=; b=2V1rquRC8qlKAQuZNLvoi2N/1z
	fYL11otbryeB4jALJG5ahM5ZtPv2h1I45s07pbsLyjFE9yezF+Td+1n/wgpUNCHzAnnK9jECu4KU4
	OrwC7FKKQ1BeNVEDm870WwAaMwFPt4vYXRWZz72e0UK7Pbn2/zfb4/ecjrm6sIRwp7ONFxFqerF/N
	HcvviqoR9aVBOA4NjdOQQ6I4rN1wq7fdb9U+CsC2jvRyJ3K1DQosV5PlO/NbgxTB7uf88dvk6bqsY
	1Uni5epBp9ujIZCmOCRdh1ZYd+0Y4lLgAZ0L35Kg6V9Kgy8wj3+jyvtyPFhF4oANpSzRj1i3UTWgp
	CB2c1K0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6T-000000047bO-40pI;
	Wed, 20 May 2026 09:20:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6L-000000047NV-2cji
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pU56tLyF7UzXsTeACLNC09MWYPppBK+O1Bfll83A28E=; b=OyjjaD8M4IN3lfNWpBXmm9Dtjr
	dyOXYLeVonhXJH9VjQaBkv6kkzHjb+tIuQ3lQj1XmXLhhYHKlDqIefVRLpT7HAa9e6kdqGXuViQgt
	O7QyH/yZLh2O8vpcHdlQFiY1RlPlzEezPJDO2lXFA2obwi/QRKrckC57Ly3fx6r0kSEqRCEDyiPUf
	x9McnKa9F6SLJlEIlVoownC9tPwxaWpanGaFTz6n4zYw3LrpPufU24Ag3CiL2gU1NBXePiYKqUp7/
	XiYHiB6o4rS/eAmAHcP9zzcyTp17uITeFkFtOcBfrk0wSnPyvBX0kVFhhKj/k5w2noBktV0a/Nyta
	iTLG/ORQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6F-00000006xOb-2Ano
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22FD542DB2;
	Wed, 20 May 2026 09:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023C01F008A2;
	Wed, 20 May 2026 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268814;
	bh=pU56tLyF7UzXsTeACLNC09MWYPppBK+O1Bfll83A28E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MNgcwIhrtAJxmSQDFXyYkJNK6w7IL/kyWQxmdplBXbCVN3mlKPdKQTKySsqvpPKWg
	 SoqeYvuDtbYXlTuvqG9x36UI/KRizlzr/CvToAX1hoarcl4t8C6i+5ya/DFMNqs27+
	 /K+FhqASGTOfF2526gVdLOL6XX6DUOPcQNzEE4Vp81Y2mBV2QveJXfpMjw8bLNSUbX
	 8Sael31E8YyYqXlVAmMOiWrBmEXnHMoLvDjPZnWY7S3UPjlbFZd5ttoHc95aOx35Wb
	 bilvop/qOaATG0lsCtmQftyX8Ar1RGl/FoTitWC/vSa0W4Sb2o2NzOKdYC3H5tvxLr
	 7gbu8mCM8Dwmg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd64-00000004IaV-14Ue;
	Wed, 20 May 2026 09:20:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 10/18] KVM: arm64: vgic-v5: Add missing trap handing for NV triage
Date: Wed, 20 May 2026 10:19:41 +0100
Message-ID: <20260520091949.542365-11-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102023_872095_DC8F0038 
X-CRM114-Status: GOOD (  11.33  )
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

As things stand, there is no support for Nested Virt with GICv5 guests
yet. However, this is coming and therefore we need to be able to
correctly triage the traps when running with NV.

Add the missing fgtreg lookups required for that to
triage_sysreg_trap(). These are specific to the FGT regs added as part
of GICv5:
   * ICH_HFGRTR_EL2
   * ICH_HFGWTR_EL2
   * ICH_HFGITR_EL2

Fixes: 9d6d9514c08f "(KVM: arm64: gic-v5: Support GICv5 FGTs & FGUs")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index dba7ced74ca5e..a4eb36b4c4421 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2631,6 +2631,14 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 		fgtreg = HFGITR2_EL2;
 		break;
 
+	case ICH_HFGRTR_GROUP:
+		fgtreg = is_read ? ICH_HFGRTR_EL2 : ICH_HFGWTR_EL2;
+		break;
+
+	case ICH_HFGITR_GROUP:
+		fgtreg = ICH_HFGITR_EL2;
+		break;
+
 	default:
 		/* Something is really wrong, bail out */
 		WARN_ONCE(1, "Bad FGT group (encoding %08x, config %016llx)\n",
-- 
2.47.3


