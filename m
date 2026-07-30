Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF10C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3OsRNm/LgtUUKlEl5oqCab/dsqCViWJfNpDdHuMMXg=; b=cKpS6KNeyjTR3e0c4cPnBSRV0q
	Z8IrYO5hJ7LF7WWIWXOakFkHUKdpVa539KcKEt+K/AY92epX3li/aygvhBWs13LRbUjLbm4efj3JG
	oNXqZXrmDe7m3vcml2dar07VG3p6QHYaKQpZZ4KzkseBR7JON3OxoGG5dkP+VmwHME1GuKanlLAOK
	xGpiCCSbbtsverUAw8M2CZI9s7dNkgeSU25nvxt+RzfeKH4iJRyj6hJoTSxBMBx8T3fCCS0UCe9aw
	pBX8DuhOh0mI1Liu3D1+oOwZLAaB857WvRWwLTj54Wq+3p+h2Ho+3bJCYkFyQvz5GH74Nkf6CyvJy
	B4qL12eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvb-00000009glQ-0Rq4;
	Thu, 30 Jul 2026 07:11:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKus-00000009gO1-3NzU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C76B41E40;
	Thu, 30 Jul 2026 07:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD3B1F0156E;
	Thu, 30 Jul 2026 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395454;
	bh=t3OsRNm/LgtUUKlEl5oqCab/dsqCViWJfNpDdHuMMXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cVmZBCmUJyByq+vMpbE3Ed7SRenb4HH6PVoFAZtlZruAYXaPtHxDzq5Q0TkBHubHx
	 p/ImGx8fXMT9M0gTK+DvC4uAOZRskYKPLoKWtk0hrL6nHJ0VdVqpmIK2Nc6G1lEjM8
	 /8xTg6JC6k/TLEzHJRseQ5x3ghkG1884E5Fz1Bb2XKZeIyMQ8i5ICKTVwE+6fATMR+
	 FxilQPSpHCHi6v/5v4jOez53FxNv8TBz0L3RmlLyOJJLXDE21YuEoNO4eowlAcDA/N
	 imi8G+nnbEZ951aIhgBLt6aZccv5/SIvNHyTUD0i9LBecHSONNrvKbQ5qj0egX2yrM
	 v1ChdLlsYprpA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKuq-0000000AOpW-2xHU;
	Thu, 30 Jul 2026 07:10:52 +0000
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
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH v4 20/29] KVM: arm64: Add sanitisation for NVHCR_EL2
Date: Thu, 30 Jul 2026 08:10:13 +0100
Message-ID: <20260730071022.296811-21-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730071022.296811-1-maz@kernel.org>
References: <20260730071022.296811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com, vladimir.murzin@arm.com
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

Just like any other VNCR-based register, NVHCR_EL2 requires some
level of sanitisation. Being specified as a live copy of HCR_EL2,
it adopts the exact same format, but depends on FEAT_NV3 instead.

A subtle aspect is that we only want to apply the sanitisation if
FEAT_NV3 is actually present, as the VNCR location is otherwise
used to back accesses to HCR_EL2.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 15 +++++++++++++++
 arch/arm64/kvm/nested.c |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 467f57eb8e6bb..1053676551aff 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1019,6 +1019,9 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 static const DECLARE_FEAT_MAP(hcr_desc, HCR_EL2,
 			      hcr_feat_map, FEAT_AA64EL2);
 
+static const DECLARE_FEAT_MAP(nvhcr_desc, NVHCR_EL2,
+			      hcr_feat_map, FEAT_NV3);
+
 static const struct reg_bits_to_feat_map sctlr2_feat_map[] = {
 	NEEDS_FEAT(SCTLR2_EL1_NMEA	|
 		   SCTLR2_EL1_EASE,
@@ -1393,6 +1396,7 @@ void __init check_feature_map(void)
 	check_reg_desc(&hdfgwtr2_desc);
 	check_reg_desc(&hcrx_desc);
 	check_reg_desc(&hcr_desc);
+	check_reg_desc(&nvhcr_desc);
 	check_reg_desc(&sctlr2_desc);
 	check_reg_desc(&tcr2_el2_desc);
 	check_reg_desc(&sctlr_el1_desc);
@@ -1592,6 +1596,17 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 	case HCR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hcr_desc, 0, 0);
 		break;
+	case NVHCR_EL2:
+		/*
+		 * Only apply sanitisation if we do have FEAT_NV3.
+		 * Otherwise, the register aliases with HCR_EL2 in VNCR,
+		 * and we're better off relying on data transfers between
+		 * NVHCR_EL2 and HCR_EL2 to sanitise things.
+		 */
+		resx = (kvm_has_nv3(kvm) ?
+			compute_reg_resx_bits(kvm, &nvhcr_desc, 0, 0) :
+			(typeof(resx)){});
+		break;
 	case SCTLR2_EL1:
 	case SCTLR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &sctlr2_desc, 0, 0);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 35a1c42ad3f84..f646894fec9a9 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1830,6 +1830,10 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	resx = get_reg_fixed_bits(kvm, HCR_EL2);
 	set_sysreg_masks(kvm, HCR_EL2, resx);
 
+	/* NVHCR_EL2 */
+	resx = get_reg_fixed_bits(kvm, NVHCR_EL2);
+	set_sysreg_masks(kvm, NVHCR_EL2, resx);
+
 	/* HCRX_EL2 */
 	resx = get_reg_fixed_bits(kvm, HCRX_EL2);
 	set_sysreg_masks(kvm, HCRX_EL2, resx);
-- 
2.47.3


