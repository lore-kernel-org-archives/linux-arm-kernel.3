Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FACAC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdsMiLz1GMIsfjQXrD+bsGeSS15N504CQNt4oTPbmfM=; b=NramANj3KMWOZA6gyYPR/onwBs
	wayNBS4ihoBtjCM7XN+siefhrbwu9fzeFphlXPcDL1jUckuaH4HPNm3SarLx4Fd7JsWKzcJaQIOvJ
	h4ONBVOXRKKwy8Y2TpTBb1xH4e5KIr6EBPpYftprd74vgN6aW/neeCpSmbRHYbvs1TbLZ4JRDwcWh
	cudWqGB4qfR82bkrWihwdLn+6KZSCbv/GhbhPNSBWAeEkPKM0SV9cWG3b8PNN3Cq5msHsr958wtZ6
	RbGZJTakoF50Sx0me43Z+uvN9PiTNire+FX54kCJc3U4OIX8JN9ue4Gb12835oq7fF/Jl+EAHlXIw
	ZgIu9KXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcrr-00000002jR0-1fWH;
	Mon, 10 Mar 2025 13:08:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC3-00000002bU1-346D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF3045C6386;
	Mon, 10 Mar 2025 12:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4AEC4CEF0;
	Mon, 10 Mar 2025 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609514;
	bh=rU2TYcrSVmMfGkQ4GYq3i+DtVe9z7lqhLE7D+KpN5Fs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XOX0xq0VG3Bkc2YxuIcfGsSY0K5xxSuMTXtpv7nBJ87QqysHsQkkTvpzBNQp+W0e9
	 kVxs/z5tesntMfVksAsfBkbv4p61Yp6x/LmnZ3I4nE8dFWgOjx7IqPsIFQQcjKzLXz
	 C7+LMqykXZdyJcHSWrpUo2xvMMU3YOGUpdDjRgVAfkux9LvgmR99u0ucbFlXN+TsYh
	 TQC6LptqwFqwdkotcoIvOIwz9HFhKgvhQfzgT3dnx77QFNVjMg5tmj769kfovc2IpO
	 ojhjqJrS6hQngSeg6pKD+ydGtgjmt8nEPUil34NuD+r8RdL7sCHocTuQEJyPFyAsd4
	 yGPOihE8EI3WQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcC0-00CAea-Pm;
	Mon, 10 Mar 2025 12:25:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 11/23] KVM: arm64: Use computed masks as sanitisers for FGT registers
Date: Mon, 10 Mar 2025 12:24:53 +0000
Message-Id: <20250310122505.2857610-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052515_885553_88624534 
X-CRM114-Status: GOOD (  12.44  )
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

Now that we have computed RES0 bits, use them to sanitise the
guest view of FGT registers.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 0c9387d2f5070..63fe1595f318d 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1118,8 +1118,8 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 		res0 |= HFGxTR_EL2_nS2POR_EL1;
 	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, AIE, IMP))
 		res0 |= (HFGxTR_EL2_nMAIR2_EL1 | HFGxTR_EL2_nAMAIR2_EL1);
-	set_sysreg_masks(kvm, HFGRTR_EL2, res0 | __HFGRTR_EL2_RES0, res1);
-	set_sysreg_masks(kvm, HFGWTR_EL2, res0 | __HFGWTR_EL2_RES0, res1);
+	set_sysreg_masks(kvm, HFGRTR_EL2, res0 | hfgrtr_masks.res0, res1);
+	set_sysreg_masks(kvm, HFGWTR_EL2, res0 | hfgwtr_masks.res0, res1);
 
 	/* HDFG[RW]TR_EL2 */
 	res0 = res1 = 0;
@@ -1157,7 +1157,7 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 			 HDFGRTR_EL2_nBRBDATA);
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2))
 		res0 |= HDFGRTR_EL2_nPMSNEVFR_EL1;
-	set_sysreg_masks(kvm, HDFGRTR_EL2, res0 | HDFGRTR_EL2_RES0, res1);
+	set_sysreg_masks(kvm, HDFGRTR_EL2, res0 | hdfgrtr_masks.res0, res1);
 
 	/* Reuse the bits from the read-side and add the write-specific stuff */
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP))
@@ -1166,10 +1166,10 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 		res0 |= HDFGWTR_EL2_TRCOSLAR;
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceFilt, IMP))
 		res0 |= HDFGWTR_EL2_TRFCR_EL1;
-	set_sysreg_masks(kvm, HFGWTR_EL2, res0 | HDFGWTR_EL2_RES0, res1);
+	set_sysreg_masks(kvm, HFGWTR_EL2, res0 | hdfgwtr_masks.res0, res1);
 
 	/* HFGITR_EL2 */
-	res0 = HFGITR_EL2_RES0;
+	res0 = hfgitr_masks.res0;
 	res1 = HFGITR_EL2_RES1;
 	if (!kvm_has_feat(kvm, ID_AA64ISAR1_EL1, DPB, DPB2))
 		res0 |= HFGITR_EL2_DCCVADP;
@@ -1203,7 +1203,7 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	set_sysreg_masks(kvm, HFGITR_EL2, res0, res1);
 
 	/* HAFGRTR_EL2 - not a lot to see here */
-	res0 = HAFGRTR_EL2_RES0;
+	res0 = hafgrtr_masks.res0;
 	res1 = HAFGRTR_EL2_RES1;
 	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, V1P1))
 		res0 |= ~(res0 | res1);
-- 
2.39.2


