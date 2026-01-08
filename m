Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B1BD1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6k5OQFkjKRhDwo0iXNt1/546+974/zl6x7HWDQ5ZolU=; b=1vjMi5P5UupqhOk5Ya19q/ddNh
	smst9MKlf7iMohqb6zTQqjtsS/jgXa6BhlNBgObaJIJoDgmP2M+jP3zwDmWV7Gyk/GX+BibRtgpyX
	fnBMnXR19a1hqAO54aLYWkfZPyvqiNzA1FHK6teJ7KtDcWr9TbU2yi8KmqQPC+rkZuds2O6UqkeBE
	EAg84tyBOUabBPdelxhtNt2cqu8Kqkk1AvsrZJdeboavgSkOUIVg0YeFinjjtBrZznUBWWmFAbR4J
	0gyd38397az2WcT5Ksu6xfoDATNmSKRDM2KJ1WbL4i7s7B0ESf1xUEokcg1x69coL+Z4MizzU9hDr
	fN4JVdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsH-00000000PQw-3BAb;
	Thu, 08 Jan 2026 17:32:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsG-00000000POx-13JD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:32:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68F5560130;
	Thu,  8 Jan 2026 17:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19595C16AAE;
	Thu,  8 Jan 2026 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893559;
	bh=lBM9O1xiYp3upt+sE8CBR/zZAFQ7xYSFnh/kkG4Fd4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=glimZ8G4SNAjTBRQKdLQkzr8Bu1wHkZ7ZUqsu0eyU77PuGcUbUCHZ3JbP/PlNyavO
	 4QlWY84WAC6XL9nc3PufdAStZjOT/DjAiJKMtzxAB5/BVU8J5Z9Chvjh2GTuwe4aEv
	 D/kvWVZgM1NSMqr063LhRoKCQtMzjs0gLmeyd6sf6d2ly/LgZkLe75bCblNc7Zqme0
	 wlGgTrwO/btvQLpYoaqPk+Ou+4I/7fYRDTRPJo/RfWL6vlcFml6K7Ral/Pn1zRSoDH
	 MIkVzUjXjjaT841GpoDrzTvz+RfnZUEK+5LyV1tF7U1+6Td2914ZJlky2UXpZYdckS
	 tq8Tap2MHLwRQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdtsC-00000000W9F-3NHY;
	Thu, 08 Jan 2026 17:32:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v4 2/9] KVM: arm64: Add trap routing for GMID_EL1
Date: Thu,  8 Jan 2026 17:32:26 +0000
Message-ID: <20260108173233.2911955-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108173233.2911955-1-maz@kernel.org>
References: <20260108173233.2911955-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
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

HCR_EL2.TID5 is currently ignored by the trap routing infrastructure.
Wire it in the routing table so that GMID_EL1, the sole register
trapped by this bit, is correctly handled in the NV case.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 8 ++++++++
 1 file changed, 8 insertions(+)

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
-- 
2.47.3


