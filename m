Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE85DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 07:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CIhLP8VNx9+hB6Na6gfMqJ8p5nvcqzIVDkp68cI4vX0=; b=m9Up9Q0jkqwjkFJtfMhGdjVk/s
	XOihPp00jiG5Rp6p49FeAkPm2olx1jbvPIOEKKhKaDgUS9LwBRSHaklbJRS5O54/yeXrQ+JM0pNs3
	HJgH0ljFcYTRMj7IbovUokDn57g/rbrFjHR+brq9sWr2vS6ymkgsDhOIUdpnKj8YgwenjPf8AOCc/
	M47RgoTd/9zmgRarA8bgWM/4CEouNQhxHFzhwCgzwrtpC4iP8X2vyVxh6n0Qxer4FGDKvN+Ad/NaL
	u8XLQ4BGM/5qdr5O9oxTynya/QQO0BSQEv6ZGAj7Sio7/2FQtcCRpwbQeDuEgBXjJbAFnQd21iBA5
	gBGvxHsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLpk-0000000A5SU-0M8a;
	Tue, 03 Jun 2025 07:13:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLlN-0000000A4HG-1yEO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 07:08:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F02CA614AE;
	Tue,  3 Jun 2025 07:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F0FC4CEF1;
	Tue,  3 Jun 2025 07:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748934523;
	bh=vDjDeOJoD8W/7MpPea4jV/CiHifHXJQj4nT62rmfbH0=;
	h=From:To:Cc:Subject:Date:From;
	b=cKOgFFTOxm8K5q4Z9XUBlLZENU8u+clbftsXWTA2SRMZ5qpixPO98LIjPCTEISm2v
	 yqc2WP3xOgY2KdSf5gLRD2W0htHctVFyrrZ6ODHtwO5aLlaBL1lo6/HVR4bRLyyBul
	 HfzQoQgGmNgKCc3CR3PJxzgOFvfW11xHcBYzsGwmTVVcxjQuiVYDkkpZ6fHFd9o8+b
	 uQC48btiW4xZS7l9CfbxwQAeV1W/rJfAY21LXJuY+np0zaGKUzCFoERza+yjLCGZsX
	 IsGYd6yYUj2bEgwwqnFLypHb50hcpUqCUv1H5IJGHa/qxxI4JYNmVLruqoL90RHA/9
	 B2sbqRuEfyciA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uMLlJ-002isr-5r;
	Tue, 03 Jun 2025 08:08:41 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 0/4] KVM: arm64: vcpu sysreg accessor rework
Date: Tue,  3 Jun 2025 08:08:20 +0100
Message-Id: <20250603070824.1192795-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

This series tries to bring some sanity to the way the RESx masks
are applied when accessing the in-memory view of the guest's
system registers.

Currently, we have *one* accessor (__vcpu_sys_reg()) that can either
be used as a rvalue or lvalue while that applies the RESx masks behind
the scenes. This works fine when used as a rvalue.

However, when used as a lvalue, it does the wrong thing, as it only
sanitises the value we're about to overwrite. This is pointless work
and potentially hides bugs.

I propose that we move to a set of store-specific accessors (for
assignments and RMW) instead of the lvalue hack, ensuring that the
assigned value is the one that gets sanitised. This then allows the 
legacy accessor to be converted to rvalue-only.

Given the level of churn this introduces, I'd like this to land very
early in the cycle. Either before 6.16-rc2, or early in 6.17.

* From v1 [1]

  - rebased to kvmarm-fixes-6.16-1

[1] https://lore.kernel.org/all/20250113183524.1378778-1-maz@kernel.org/

Marc Zyngier (4):
  KVM: arm64: Add assignment-specific sysreg accessor
  KVM: arm64: Add RMW specific sysreg accessor
  KVM: arm64: Don't use __vcpu_sys_reg() to get the address of a sysreg
  KVM: arm64: Make __vcpu_sys_reg() a pure rvalue operand

 arch/arm64/include/asm/kvm_host.h          | 31 +++++++++--
 arch/arm64/kvm/arch_timer.c                | 18 +++----
 arch/arm64/kvm/debug.c                     |  4 +-
 arch/arm64/kvm/fpsimd.c                    |  4 +-
 arch/arm64/kvm/hyp/exception.c             |  4 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h    |  4 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  6 +--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         |  4 +-
 arch/arm64/kvm/hyp/vhe/switch.c            |  4 +-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c         | 48 ++++++++---------
 arch/arm64/kvm/nested.c                    |  2 +-
 arch/arm64/kvm/pmu-emul.c                  | 24 ++++-----
 arch/arm64/kvm/sys_regs.c                  | 60 +++++++++++-----------
 arch/arm64/kvm/sys_regs.h                  |  4 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c       | 10 ++--
 15 files changed, 125 insertions(+), 102 deletions(-)

-- 
2.39.2


