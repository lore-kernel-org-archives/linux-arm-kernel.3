Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D2CC531CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvfRoiVVXMz5ozRg++qNQ5fER4Qs3LDX4/NpXBs7HWc=; b=4E6X1lMgBk6j9GcKWh+fdIDeB8
	ixKgNTv8ZPyETv1EydkkAnQrWDQ4pJVWFYs7gGB4TGrtnh3kp1DSo1tYcOgLX/kNkAh4c09//slGE
	TGeW1oRPejjTKs0D0rF+fP4NkJr1EYlpDUNog5bo4FOZBA4yljO71wYvL9Asdqq854K3FcyFggPM4
	A3FdCEXZ1sUQY2lSVjqPqsnCuIvi2uJgU7WNAclHOZjV4uZtIVbmOuUMw3lT0SFPUkIDePRfj8Z57
	0ZWIClVzic4bsuvZmT9xB7DLzDRytNZFwhE/M5NGdOAN/lPDp3sAIoFmyUSVPcl2V2GTcpd8SHjZn
	kF181BMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRc4-0000000B7Db-1U1a;
	Wed, 22 Jul 2026 07:43:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbZ-0000000B6kc-0ks8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:43:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E58F745085;
	Wed, 22 Jul 2026 07:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E071F000E9;
	Wed, 22 Jul 2026 07:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706180;
	bh=xvfRoiVVXMz5ozRg++qNQ5fER4Qs3LDX4/NpXBs7HWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PyfsmJiXqK5QYaIox8z01Y3O4loGKP5br4n2s6FW9QPJVoqlSz9dWpUJh5jXi4w48
	 FaUH/kgVY9eRAE7KklrjIavGow2cc5jNfDubUknEhdW7tVRmk38L3UWkimFMCAPGKT
	 Yllsf2if0cpFy895uq/UjJQXmIyI1+AgwUGLhcRtAPvD5ZRjQqSiyYL9vf0/A4IbxD
	 MLeJNAQudSf666YnmRdnKR6Cs0g3ZSEVLi7z4Bu2jOZgpcebQaowmtcXpOmFCpKdpO
	 xXExTHExiZ4bSRk2S+M8r21zChwAYb4ZmbvoY7t8dv2HAAhpEX2zYLQV78ECV0+98M
	 eKuG49/FyoaQw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbX-00000007VfN-0j8g;
	Wed, 22 Jul 2026 07:42:59 +0000
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
Subject: [PATCH v3 22/28] KVM: arm64: Add routing for NVHCR_EL2 trap
Date: Wed, 22 Jul 2026 08:42:28 +0100
Message-ID: <20260722074234.3330999-23-maz@kernel.org>
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

NVHCR_EL2 accesses from EL1 are taken to EL2 when HCRX_EL2.NVTGE==0
and HCR_EL2.NV==1. Describe this in the exception routing tables.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index b7f3d86a94031..625604019fb32 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -136,6 +136,8 @@ enum cgt_group_id {
 	CGT_CPTR_TTA,
 	CGT_MDCR_HPMN,
 
+	CGT_HCR_NV_HCRX_nNVTGE,
+
 	/* Must be last */
 	__NR_CGT_GROUP_IDS__
 };
@@ -588,6 +590,15 @@ static enum trap_behaviour check_mdcr_hpmn(struct kvm_vcpu *vcpu)
 	return BEHAVE_HANDLE_LOCALLY;
 }
 
+static enum trap_behaviour check_hcr_nv_hcrx_nnvtge(struct kvm_vcpu *vcpu)
+{
+	if ((__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_EL2_NV) &&
+	    !(__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_NVTGE))
+		return BEHAVE_FORWARD_RW;
+
+	return BEHAVE_HANDLE_LOCALLY;
+}
+
 #define CCC(id, fn)				\
 	[id - __COMPLEX_CONDITIONS__] = fn
 
@@ -598,6 +609,7 @@ static const complex_condition_check ccc[] = {
 	CCC(CGT_CNTHCTL_EL1NVVCT, check_cnthctl_el1nvvct),
 	CCC(CGT_CPTR_TTA, check_cptr_tta),
 	CCC(CGT_MDCR_HPMN, check_mdcr_hpmn),
+	CCC(CGT_HCR_NV_HCRX_nNVTGE, check_hcr_nv_hcrx_nnvtge),
 };
 
 /*
@@ -853,6 +865,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_SCTLR2_EL2,		CGT_HCR_NV),
 	SR_RANGE_TRAP(SYS_HCR_EL2,
 		      SYS_HCRX_EL2,	CGT_HCR_NV),
+	SR_TRAP(SYS_NVHCR_EL2,		CGT_HCR_NV_HCRX_nNVTGE),
 	SR_TRAP(SYS_SMPRIMAP_EL2,	CGT_HCR_NV),
 	SR_TRAP(SYS_SMCR_EL2,		CGT_HCR_NV),
 	SR_RANGE_TRAP(SYS_TTBR0_EL2,
-- 
2.47.3


