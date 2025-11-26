Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AD3D11181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUBQjnuVkQ9eQw+q3UnS+cSzAR6ILnUOV2y2V/JRSkQ=; b=C8ATVB9z2jBNrtDoXiE58tRCXV
	cgI1x8s7RobfAhiAznMqIj3ipL+dpiQrD52WcB/ODoXnCjgbf9/22KoxzAtIxMC12p5txH4kSn/nL
	nLSzDZBF9w56vLVxFtUD7LJRRaUAEwJ1qEFXaNmxPPFaLJhaJjRsUh+4PcKibJUor5XZ5S2GGXeNf
	2/d2eO4Mx2/8lbp5YLYESOXylqzjHLvmSwz4HCWoLsnbzqW9i7pvoEqvXgIhflrDvTUZm9VCr0qm+
	PBmqLwVQLo89MBO7n5UDL+C3DnQIIsC4CFVNONBkk0+mJ3fDAFAIdhQaMRhtbZs4LETPkIRXPLFUB
	fj4rhVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHw7-0000000FDlh-2171;
	Wed, 26 Nov 2025 16:00:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHw2-0000000FDhm-2FSg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A17E760215;
	Wed, 26 Nov 2025 16:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45745C4CEF7;
	Wed, 26 Nov 2025 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764172801;
	bh=sJ9Nj0RO2E3MleSVWlAJM1EaUuH0Yx6I5YRixpnnKkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NZmF4txmq6wWCNGsVXXWCTVwE7bQLTDTxBkd+P70S1S4Lnw+c2XKern/AJTYf+5wi
	 Si++rC+wE0WhYYGtHwE4UA6fCKOGXuCqp6kwNlZntstO3sEj9DbXm1R6pYR4G2gBXa
	 IvP4HYHzesIm4/T2zbg24iDbnzf7Wp9fVwMPIBbAxeART6B0o+Vs+ccdP5dzrIMC1X
	 sBJ15AVEalPCod7BhDkzLC/M1x5mwJnpRKpa5xZV9BSxYIn72m7AT1gjMnF24fs4Wp
	 31B6r2z4kwNHK82X7xYUnwWWHpRvaXpImj5lMbUDr6kRTWC3jSNOw2MbNlVTQN3LYG
	 LmKTgF35lPFzg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vOHvy-00000008WrH-2KuL;
	Wed, 26 Nov 2025 15:59:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v2 1/5] KVM: arm64: Add routing/handling for GMID_EL1
Date: Wed, 26 Nov 2025 15:59:47 +0000
Message-ID: <20251126155951.1146317-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251126155951.1146317-1-maz@kernel.org>
References: <20251126155951.1146317-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com
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

HCR_EL2.TID5 is currently ignored by the trap routing infrastructure,
and we currently don't handle GMID_EL1 either (the only register trapped
by TID5).

Wire both the trap bit and a default UNDEF handler.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 8 ++++++++
 arch/arm64/kvm/sys_regs.c       | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 834f13fb1fb7d..616eb6ad68701 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -70,6 +70,7 @@ enum cgt_group_id {
 	CGT_HCR_ENSCXT,
 	CGT_HCR_TTLBIS,
 	CGT_HCR_TTLBOS,
+	CGT_HCR_TID5,
 
 	CGT_MDCR_TPMCR,
 	CGT_MDCR_TPM,
@@ -308,6 +309,12 @@ static const struct trap_bits coarse_trap_bits[] = {
 		.mask		= HCR_TTLBOS,
 		.behaviour	= BEHAVE_FORWARD_RW,
 	},
+	[CGT_HCR_TID5] = {
+		.index		= HCR_EL2,
+		.value		= HCR_TID5,
+		.mask		= HCR_TID5,
+		.behaviour	= BEHAVE_FORWARD_RW,
+	},
 	[CGT_MDCR_TPMCR] = {
 		.index		= MDCR_EL2,
 		.value		= MDCR_EL2_TPMCR,
@@ -665,6 +672,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_CCSIDR2_EL1,	CGT_HCR_TID2_TID4),
 	SR_TRAP(SYS_CLIDR_EL1,		CGT_HCR_TID2_TID4),
 	SR_TRAP(SYS_CSSELR_EL1,		CGT_HCR_TID2_TID4),
+	SR_TRAP(SYS_GMID_EL1,		CGT_HCR_TID5),
 	SR_RANGE_TRAP(SYS_ID_PFR0_EL1,
 		      sys_reg(3, 0, 0, 7, 7), CGT_HCR_TID3),
 	SR_TRAP(SYS_ICC_SGI0R_EL1,	CGT_HCR_IMO_FMO_ICH_HCR_TC),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 8ae2bca816148..9e4c46fbfd802 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3400,6 +3400,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
 	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
 	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
+	{ SYS_DESC(SYS_GMID_EL1), undef_access },
 	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
 	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
-- 
2.47.3


