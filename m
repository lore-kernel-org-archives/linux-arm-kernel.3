Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E9AF4199B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU56tLyF7UzXsTeACLNC09MWYPppBK+O1Bfll83A28E=; b=SVu7P4CJygAc6eu0jh2Umv+KC+
	YxKSOvX4AW4w1Xp+0TklexyzrMnxT1pz8KOBQImcmtZfS8bpIEdyUYq7dFltnaXa3ZO1VXNziOQi0
	FNJhU9nZp3xX2tUkApKgkCbwnepP5edSrWscGVi8YJzQzxFeXv7wc9dLZ0vkkQcWLH4htqWw6m6aE
	irsvkpq4AtH4aT/xOyHZMYabV+8IrU9Qs9isEJCzeiZzbGCOVmxp59BU/Sb0cqqgjuyPBdtUyfYUg
	lDlGVBZIgvngxp0oCCSujtRztqwiNEqkaDoaFVspWZJpnFGrVmJBRMhycntfvCvpe8xCSWKFisWmJ
	lzpzJWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr5-000000014AA-0LhO;
	Wed, 15 Apr 2026 11:56:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr1-0000000146d-39kw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36C8F60131;
	Wed, 15 Apr 2026 11:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3F1C2BCB8;
	Wed, 15 Apr 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254182;
	bh=Zp5PG6ea4JcntK4ndrBEZbSawNvwNwKG+2HfhGE8uL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AWWirv+1VMXuVhJhLxle6sNBMFAGIsDXWziy9rH6aIroDoRksQGsFKFi4tx4tBT/X
	 SrZHaxPEBxFB77bpZM6ysKp5j0Ya1QuVjfMcecYAGMPuRtFu3SVa0G99eT0suHvOQv
	 +JBg+8/XbWGETmmvJYErQcdecnVPirYXHIIWyPsDTyB7LgmH3pHlP/FsU07JeCJg6O
	 Migeprda5B7A/69xnOGMBT0LjJCPY9lAgH7fcj16cVKmCW0Xzfyph8o6HrvKvlTMjL
	 v9YRzPVnx8A9XEUMiwMaYFrwmvNZeO1gFN6B+sCjWAJa3KyuUL3ZeG4knZk5IwBxTg
	 e9gm7NrM8JwHw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqz-0000000Bqsi-0XlD;
	Wed, 15 Apr 2026 11:56:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 10/18] KVM: arm64: vgic-v5: Add missing trap handing for NV triage
Date: Wed, 15 Apr 2026 12:55:51 +0100
Message-ID: <20260415115559.2227718-11-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
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


