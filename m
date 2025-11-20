Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48436CF8859
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyGCii64PY5HZfaLaM3uxAPbBYezmR0OhJbgftm4nS0=; b=Fr+H2FUPLFF8w8Y/cT7H3WFdLS
	cPMAdMSvOjiIiOIOBGHcNXvbFS0naJPUAKd7MWFcwL7Z8vKsCkAF5Pv3iHpqgu+f5vxn3PL78SmOC
	yNaUWbXc01WhE+96yKP30iPbR3h5tM5kI+9BY7mnFhduYfDqdh4fp/LiEpYL0W4HOZumG9w4cuDnW
	sLMb+1gjqh6fJCx7OCTJ58/AkfrPRxvFFVJmixBP9PlFlZcxnh9p6mKlxspAldiVqxy9hoOQkLStX
	oS9rDp65X+ty5Juulk+oxCXUer7hKVqo+oBmxqZ2/hrQL6LcBAzNmRVI74A6ivnH8Rl+Cb5WsDGGp
	AT+PILWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4lz-00000006jY1-2Qjc;
	Thu, 20 Nov 2025 13:32:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4lp-00000006jUL-0vI2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 13:32:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A5AB443F0;
	Thu, 20 Nov 2025 13:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B1AC116D0;
	Thu, 20 Nov 2025 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763645540;
	bh=sNShVh/3Wfcp1fU9b2leeizEh1WeKw0B0W6xrZVsUhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CjvnuliuV+bv9g/yeXSYer26fqmvlOW/YSVHjI7KPUPDP2IJSSrvGNiC7U2jYro/Q
	 X3sMClG9/aDHnnWUisu3w9uTEc39dqIBn7/FvqQpYsauEtbaK4+rKBLHjBpyRzCrEj
	 L2oioSW4MK4vmIULP4VBwPckH3HcrZUWE7f7vYWTZegocJsnsn/+XP55djCLF4oZde
	 eLP56FstsaNsL1TPB0A7xNTKmWGm2MZ4QR0aUGNSD7PZteowb5IGngOOK4z0Tpyt/M
	 3zZyNOXTeJ2D/SuQggjb+4cRi98eg8D8jKbYnqMmthkULI69/yBKPF3iD/Ai5cbXrm
	 sw16y2OHQ9VpA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM4lm-00000006tUG-2Sxt;
	Thu, 20 Nov 2025 13:32:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 4/5] KVM: arm64: Report optional ID register traps with a 0x18 syndrome
Date: Thu, 20 Nov 2025 13:32:01 +0000
Message-ID: <20251120133202.2037803-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120133202.2037803-1-maz@kernel.org>
References: <20251120133202.2037803-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_053221_297402_B358E10D 
X-CRM114-Status: GOOD (  13.40  )
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

With FEAT_IDST, unimplemented system registers must be reported using
EC=0x18 at the closest handling EL, rather than with an UNDEF.

Most system registers are always implemented thanks to their dependency
on FEAT_AA64, except for a set of (currently) three registers:
GMID_EL1 (depending on MTE2), CCSIDR2_EL1 (depending on FEAT_CCIDX),
and SMIDR_EL1 (depending on SME).

For these three registers, report their trap as EC=0x18 if they
end-up trapping into KVM and that FEAT_IDST is not implemented in the
guest. Otherwise, just make them UNDEF.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 40f32b017f107..992137822dcf9 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -82,6 +82,16 @@ static bool write_to_read_only(struct kvm_vcpu *vcpu,
 			"sys_reg write to read-only register");
 }
 
+static bool idst_access(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+			const struct sys_reg_desc *r)
+{
+	if (kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, 0x0))
+		return undef_access(vcpu, p, r);
+
+	kvm_inject_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+	return false;
+}
+
 enum sr_loc_attr {
 	SR_LOC_MEMORY	= 0,	  /* Register definitely in memory */
 	SR_LOC_LOADED	= BIT(0), /* Register on CPU, unless it cannot */
@@ -3396,9 +3406,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CCSIDR_EL1), access_ccsidr },
 	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
 	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
-	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
-	{ SYS_DESC(SYS_GMID_EL1), undef_access },
-	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
+	{ SYS_DESC(SYS_CCSIDR2_EL1), idst_access },
+	{ SYS_DESC(SYS_GMID_EL1), idst_access },
+	{ SYS_DESC(SYS_SMIDR_EL1), idst_access },
 	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
 	ID_FILTERED(CTR_EL0, ctr_el0,
-- 
2.47.3


