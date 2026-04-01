Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A10D35178
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JLmw3xeGP+PbSi4/a0DecoDUs2oTv/d5qeQasXJ7hY=; b=yqWA2vDl0lbfWFfegWFLgxgO/Y
	YRTWCVzGpTEwUBqwT5CtNEExZInXZzZ2jGuBzySe+ENquUumq5tyK+yjx9Xhu95WfbOGeuRdrz+5B
	vOaOfnU20Xy61gd2wrD8pJIbriJpBwLBmTCC7vKmSov9nJMy+xT4aXfqg7A1F3jY3aeTnXXrypqUi
	ZWk7A0oZd2G8Su2FVgVShzJjJb6TmQNTKQWiEMmz7OwW5zrYOBgUSVPCey+iut/JSeFCJFD76oyvi
	Fq5A4xccbjNdG4ca2LmQktHmvupXIaVd1jjtoQLsviYImQFONyDmat4fILXnid8DZMAKgyWoDBp6A
	hjL4U4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw9-0000000EWHh-2QRm;
	Wed, 01 Apr 2026 10:36:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw6-0000000EWBx-1k76
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F66560139;
	Wed,  1 Apr 2026 10:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB13C2BCB4;
	Wed,  1 Apr 2026 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039794;
	bh=u28flmvfVSoY5WGICQjmC96Uju6XrphbLe7PuSo52T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=elt7qCMR3qVxj3RtKj0rM7ZVy9Jg2NPbEtSyZ7n2U/QotZu+EjEZq29KfhFKGu2K9
	 T10ieEKMaY+f4MolbnDyVJnygPvXdetRuiwmYSYyEs6YvGoyRTbYYjemuV9GJEz1WG
	 HRYstlrK4EpoMfiQDfKPtWmuU8RpeM4NiGzrWvR28Tb9wWfRulUKd/hSn9xzzcK3D5
	 ZxrNy8+aghDruPKfj+pKzmLiB05XZnGZOzMUuhxS2/22FXGNM7Aduv06yOz3fcwgpr
	 Kr25Fgq+TV3plpfGyM31N4584p94mAZxCcV78hJKsMBIz/Q9XQCTxlvguvnXl/B1Xo
	 ZFKz5icKJJZVQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw4-00000007oRQ-1Enw;
	Wed, 01 Apr 2026 10:36:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 14/16] KVM: arm64: Correctly plumb ID_AA64PFR2_EL1 into pkvm idreg handling
Date: Wed,  1 Apr 2026 11:36:09 +0100
Message-ID: <20260401103611.357092-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401103611.357092-1-maz@kernel.org>
References: <20260401103611.357092-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
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

While we now compute ID_AA64PFR2_EL1 to a glorious 0, we never use
that data and instead return the 0 that corresponds to an allocated
idreg. Not a big deal, but we might as well be consistent.

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Fixes: 5aefaf11f9af5 ("KVM: arm64: gic: Hide GICv5 for protected guests")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index b40fd01ebf329..be6f420388a14 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -439,7 +439,7 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* CRm=4 */
 	AARCH64(SYS_ID_AA64PFR0_EL1),
 	AARCH64(SYS_ID_AA64PFR1_EL1),
-	ID_UNALLOCATED(4,2),
+	AARCH64(SYS_ID_AA64PFR2_EL1),
 	ID_UNALLOCATED(4,3),
 	AARCH64(SYS_ID_AA64ZFR0_EL1),
 	ID_UNALLOCATED(4,5),
-- 
2.47.3


