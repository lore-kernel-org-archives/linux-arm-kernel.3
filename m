Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02D310A88E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gh0xtarxttyL8TyNPWhmdMvjx6DYW0/2D32X0liBSGo=; b=0NL/GzDKK1JWD+sfr/xdpxP7Ce
	TcAQrOPElbdNFHFnMNFNgyn9TUuahrcBeKuvL+Na7/GTcJiKAdnlRjjEY4QTda8CZ+Pw+t3cW7RQL
	o5fbK8NumsiCJi2WOPUcvCBEqGPirKWixKZn8z553a5LGWwIZ6GJ4l5JRbxylVDhjGKmBgXeG0nVT
	rg6yjF8V79qaIS6dKebayYnE3s9DM9EBsXdnrfZRAP+9dhcbsiPYCLJLiQ+2DnaZ+WU9mEm7AXe2F
	xuwloopbsO2Z7+BL61wjBQk2DtABvxdoPuysFbNyrzb8TszR8wXe0LpVHGvbqjSlHlAuSIQRNoqjE
	+ZVu8Ivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkM-00000005l9X-3dYS;
	Thu, 26 Mar 2026 15:35:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkD-00000005l2N-1enF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C92E44570;
	Thu, 26 Mar 2026 15:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDA2C2BCB0;
	Thu, 26 Mar 2026 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539336;
	bh=2qFqwaEfjkfonQCEJHd6t4DHT0B1l3UAc3R8lLUcmVg=;
	h=From:To:Cc:Subject:Date:From;
	b=oPns00bvIJX0a6WpQMR7SRs8rm/MJV4uSn3ne+1IvspE4KRR/Jp0TZluxF4Xx4xFE
	 k0U6XSjlv1J+9+0Fr+j2vdYkynPpy32GMSu1HzqrH+GC3axVXweoCz51hGw3mjStvQ
	 se068+X1xYcVk1vVCmkXU5KeC7cmdKZrEO84I70ZMlQumlymMye5yiakI/MD/KJNoL
	 ZzbSM90qUrscSR7aBR+qSIiLWwjdPu/DaTpe84/2Hnmo9CX/ZSwiwmeKa0077pdEgd
	 XL9ygfsaVx9e7UANw3D3jLuzJxOoDlW++Cfer52ma23Accjh9xiUbfy/Czvy2sUb4U
	 AYCF9Iy2D42YQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkA-000000060II-0p62;
	Thu, 26 Mar 2026 15:35:34 +0000
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
Subject: [PATCH 00/15] KVM: arm64: First batch of vgic-v5 related fixes
Date: Thu, 26 Mar 2026 15:35:15 +0000
Message-ID: <20260326153530.3981879-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083537_466715_961B4053 
X-CRM114-Status: GOOD (  10.30  )
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

Well, merging the first batch of vgic-v5 patches didn't go smoothly at
all. We initially found a couple of regressions, but most of the crap
was actually uncovered by everyone's new best friend (enemy?), the AI
bot sitting behind sashiko.dev [1].

While not all of the remarks were valid, a bunch of them were actually
extremely pertinent, and resulted in me frantically hacking away at
the series. Hopefully the bot doesn't find even more issues in the
fixes. Note that the first patch has already been posted and merged,
and is only here for reference.

Note that given the amount of rework, I'm really in two minds between
adding these patches on top, or pulling the whole series for another
cycle. I guess time will tell.

[1] https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com

Marc Zyngier (15):
  KVM: arm64: vgic: Don't reset cpuif/redist addresses at finalize time
  KVM: arm64: Don't skip per-vcpu NV initialisation
  arm64: Fix field references for ICH_PPI_DVIR[01]_EL2
  KVM: arm64: Fix writeable mask for ID_AA64PFR2_EL1
  KVM: arm64: Account for RESx bits in __compute_fgt()
  KVM: arm64: vgic-v5: Hold config_lock while finalizing GICv5 PPIs
  KVM: arm64: vgic-v5: Transfer edge pending state to ICH_PPI_PENDRx_EL2
  KVM: arm64: vgic-v5: Cast vgic_apr to u32 to avoid undefined
    behaviours
  KVM: arm64: vgic-v5: align priority comparison with other GICs
  KVM: arm64: vgic-v5: Correctly set dist->ready once initialised
  KVM: arm64: Kill arch_timer_context::direct field
  KVM: arm64: Remove evaluation of timer state in
    kvm_cpu_has_pending_timer()
  KVM: arm64: Move GICv5 timer PPI validation into
    timer_irqs_are_valid()
  KVM: arm64: Correctly plumb ID_AA64PFR2_EL1 into pkvm idreg handling
  KVM: arm64: Don't advertises GICv3 in ID_PFR1_EL1 if AArch32 isn't
    supported

 arch/arm64/kvm/arch_timer.c        | 32 +++++++++++++-----------------
 arch/arm64/kvm/config.c            |  4 ++--
 arch/arm64/kvm/hyp/nvhe/sys_regs.c |  2 +-
 arch/arm64/kvm/sys_regs.c          | 20 +++++++++----------
 arch/arm64/kvm/vgic/vgic-init.c    | 32 ++++++++++++++++++++----------
 arch/arm64/kvm/vgic/vgic-v5.c      | 24 +++++++++++++++++-----
 arch/arm64/tools/sysreg            |  4 ++--
 include/kvm/arm_arch_timer.h       |  3 ---
 8 files changed, 70 insertions(+), 51 deletions(-)

-- 
2.47.3


