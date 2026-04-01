Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F49D35171
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sN3GnIYIjpDV/fhQySPbfE2V+jV2yPIjCPVkvSRzjLs=; b=ThKgJKOhXbsmbgppTiLTNVMWv/
	iwMl5qetqUN+CMPBz97eRL8xjyLL3YuCQyZRbEYGYcUab8E2yzEytHLQlYAh7p3v3TIHg0EbNeNK+
	vtavtFXRXgdAeJQKSmQW3k20VXEw0oFwBIw5OJ7/KA4MK98AiIhkJGuQsnYNbJT7mYXFFWaWWbFl2
	kaVqPSamEBDTOsKLU0b8nPnKxTcrSbmhdMn0EETo03hHgsZiKqijeuXANQMqH9nbk+QTsi6zIjMeE
	BSvP8kXZuTfCznD3UImL3FuuP5JLgz4PmlXnAjPg02wxtXTTlBJjRteGfaTPn8XJ2wl/RcLO0BKt+
	z5MbsjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw6-0000000EWEM-31Yn;
	Wed, 01 Apr 2026 10:36:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw4-0000000EWBR-3XSI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0B4A60120;
	Wed,  1 Apr 2026 10:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE9AC4CEF7;
	Wed,  1 Apr 2026 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039791;
	bh=+QCbdHNHmHFia4f4ihvIccWXyxvqGeamB1Ak1UNFefk=;
	h=From:To:Cc:Subject:Date:From;
	b=HUtTc+qdBZnLXKPylb0z1+68iCLw5jkX1/ut0r6g/SMeABYvS+8ZmNqnA0AFwuA37
	 A/D46LyZvWkT2WkTX3s/Mm70TO6LslwBShA5UOhSK3fg7PW2O0Csg+PqsiZthfyAat
	 KBtKcLv1xeEa/AF4n67RfIylxJswxIDwS+9QlVTo228wmSuefAXQWKom0TRAfxVfCY
	 k8c+FiN25qiNwqTGWOU4taEH/W2mMd14FwaF64ZblEUZXNtk/sSnfZDzPzGxmK5vb3
	 jglbWUv6YN04xPQ1LsbD10tKpeoGXVIr0JDi98lpg6KljUmmNWFFG8IT+HRvFTUNYI
	 f6rvptv5L7pHA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw1-00000007oRQ-0SVj;
	Wed, 01 Apr 2026 10:36:29 +0000
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
Subject: [PATCH v2 00/16] KVM: arm64: First batch of vgic-v5 related fixes
Date: Wed,  1 Apr 2026 11:35:55 +0100
Message-ID: <20260401103611.357092-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
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

This is the second revision of this series attempting to fix a number
of issues reported on the vgic-v5 PPI series.

* From v1 [1]:

  - Partially reverted the effective priority mask fix, as Sascha
    pointed out the crucial difference in the way GICv5 manages the
    PCR compared to GICv[234]'s PMR.

  - Added a fix for dealing with the pending HW-backed PPIs.

  - Added a workaround for the set_id_regs selftest, already posted
    separately, but included here for completeness (and ease of
    merging).

Patches on top of my kvm-arm64/vgic-v5-ppi branch.

[1] https://lore.kernel.org/r/20260326153530.3981879-1-maz@kernel.org

Marc Zyngier (16):
  KVM: arm64: vgic: Don't reset cpuif/redist addresses at finalize time
  KVM: arm64: Don't skip per-vcpu NV initialisation
  arm64: Fix field references for ICH_PPI_DVIR[01]_EL2
  KVM: arm64: Fix writeable mask for ID_AA64PFR2_EL1
  KVM: arm64: Account for RESx bits in __compute_fgt()
  KVM: arm64: vgic-v5: Hold config_lock while finalizing GICv5 PPIs
  KVM: arm64: vgic-v5: Transfer edge pending state to ICH_PPI_PENDRx_EL2
  KVM: arm64: vgic-v5: Cast vgic_apr to u32 to avoid undefined
    behaviours
  KVM: arm64: vgic-v5: Make the effective priority mask a strict limit
  KVM: arm64: vgic-v5: Correctly set dist->ready once initialised
  KVM: arm64: Kill arch_timer_context::direct field
  KVM: arm64: Remove evaluation of timer state in
    kvm_cpu_has_pending_timer()
  KVM: arm64: Move GICv5 timer PPI validation into
    timer_irqs_are_valid()
  KVM: arm64: Correctly plumb ID_AA64PFR2_EL1 into pkvm idreg handling
  KVM: arm64: Don't advertises GICv3 in ID_PFR1_EL1 if AArch32 isn't
    supported
  KVM: arm64: set_id_regs: Allow GICv3 support to be set at runtime

 arch/arm64/kvm/arch_timer.c                   | 32 +++++-------
 arch/arm64/kvm/config.c                       |  4 +-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            |  2 +-
 arch/arm64/kvm/sys_regs.c                     | 20 +++----
 arch/arm64/kvm/vgic/vgic-init.c               | 32 ++++++++----
 arch/arm64/kvm/vgic/vgic-v5.c                 | 24 +++++++--
 arch/arm64/tools/sysreg                       |  4 +-
 include/kvm/arm_arch_timer.h                  |  3 --
 .../testing/selftests/kvm/arm64/set_id_regs.c | 52 ++++++++++++++++---
 9 files changed, 115 insertions(+), 58 deletions(-)


base-commit: ce29261ec6482de54320c03398eb30e9615aee40
-- 
2.47.3


