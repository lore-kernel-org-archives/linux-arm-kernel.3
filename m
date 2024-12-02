Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337A8E69E83
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yRGheXDFSsPMo10+NqlshISyAL28nDOjigGtIJLWauU=; b=Fm9XOau9ij5ggedUuHwI66XEP6
	Y2IeHTs59SmTwMNcwdE8zFZO8KhgrHQG+fE6VKCYxzots1mv+xmK0fxKZ+8iOlSf2q6NIb3tyEfWw
	D8peGfVGdl/8AWORmp50SLxVyBK/S3JsKU1oiNODexc6/hHIDv2UHGvN2l567/gPmStEWdY/iEdWY
	+rCl/2rNtZjcPtVKXmFHXz8pTdre2nLD7z/6KnIE1geqXWHMWzzWUEXIUHsWyhhwcTMWZOirk+Hu6
	QW0+dGJDujqxEGmtMzN2LRtVnbWUdHLmnzSMlgk2zO5Oh/L7d7p4EYPM+DQhV+s5rF9rFY5J12Ic1
	06frx8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBA6-00000007AIz-1I3Q;
	Mon, 02 Dec 2024 18:28:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7m-00000006zxI-3HTe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B14B5C53CD;
	Mon,  2 Dec 2024 17:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD101C4CED1;
	Mon,  2 Dec 2024 17:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160137;
	bh=UpzE0ZmBH3j6iH9EdlvMQO+Y3xZZ7zh9pVe57GIdbkY=;
	h=From:To:Cc:Subject:Date:From;
	b=pYDSI5e3AmxzREPbNfe/OtP9tFYgHbjYic41biAC5nbB5i/Zd5IQOfR/3Hlw3WzlC
	 3T3va3TYFnjO88NLAHp/32MA2708EYAGN1Q4emlZiJZ29ch6i1yAkLpTw45rJVRzvr
	 /Vjx1xCWDzI9FGAJW07fm+4rTnFzQ6PaRBC3ULHzg4dFVGlF2n8CjWikCSkdDvv/K7
	 06N22GExQSq0AIrQnSbpHi2ncbFHAWWP9t617Y3w5zzEMCPA4aAF0VUvYM57X4aNjf
	 UJID57/cPI4Rkc8OQd/k+J10jk47xuaH/ZQnxuk0f4LH0F1YBrXRRWXVOqNEbWQDDv
	 bPnFe5nRIVB6Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIA7j-00HQcf-LD;
	Mon, 02 Dec 2024 17:22:15 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH 00/11] KVM: arm64: Add NV timer support
Date: Mon,  2 Dec 2024 17:21:23 +0000
Message-Id: <20241202172134.384923-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_092218_906719_CFA0A3C2 
X-CRM114-Status: GOOD (  17.72  )
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

Here's another batch of NV-related patches, this time bringing in most
of the timer support for EL2 as well as nested guests.

The code is pretty convoluted for a bunch of reasons:

- FEAT_NV2 breaks the timer semantics by redirecting HW controls to
  memory, meaning that a guest could setup a timer and never see it
  firing until the next exit

- We go try hard to reflect the timer state in memory, but that's not
  great.

- With FEAT_ECV, we can finally correctly emulate the virtual timer,
  but this emulation is pretty costly

- As a way to make things suck less, we handle timer reads as early as
  possible, and only defer writes to the normal trap handling

- Finally, some implementations are badly broken, and require some
  hand-holding, irrespective of NV support. So we try and reuse the NV
  infrastructure to make them usable. This could be further optimised,
  but I'm running out of patience for this sort of HW.

What this is not implementing is support for CNTPOFF_EL2. It appears
that the architecture doesn't let you correctly emulate it, so I guess
this will be trap/emulate for the foreseeable future.

This series is on top of v6.13-rc1, and has been tested on my usual M2
setup, but also on a Snapdragon X1 Elite devkit. I would like to thank
Qualcomm for the free hardware with no strings (nor support) attached!

If you are feeling brave, you can run the whole thing from [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-next

Marc Zyngier (11):
  KVM: arm64: nv: Add handling of EL2-specific timer registers
  KVM: arm64: nv: Sync nested timer state with FEAT_NV2
  KVM: arm64: nv: Publish emulated timer interrupt state in the
    in-memory state
  KVM: arm64: nv: Use FEAT_ECV to trap access to EL0 timers
  KVM: arm64: nv: Accelerate EL0 timer read accesses when FEAT_ECV in
    use
  KVM: arm64: nv: Acceletate EL0 counter accesses from hypervisor
    context
  KVM: arm64: Handle counter access early in non-HYP context
  KVM: arm64: nv: Add trap routing for
    CNTHCTL_EL2.EL1{NVPCT,NVVCT,TVT,TVCT}
  KVM: arm64: nv: Propagate CNTHCTL_EL2.EL1NV{P,V}CT bits
  KVM: arm64: nv: Sanitise CNTHCTL_EL2
  KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity

 arch/arm64/include/asm/cputype.h        |   2 +
 arch/arm64/include/asm/kvm_host.h       |   2 +-
 arch/arm64/include/asm/sysreg.h         |   4 +
 arch/arm64/kernel/cpu_errata.c          |   8 ++
 arch/arm64/kernel/image-vars.h          |   3 +
 arch/arm64/kvm/arch_timer.c             | 177 +++++++++++++++++++++---
 arch/arm64/kvm/arm.c                    |   3 +
 arch/arm64/kvm/emulate-nested.c         |  58 +++++++-
 arch/arm64/kvm/hyp/include/hyp/switch.h |  39 ++++--
 arch/arm64/kvm/hyp/nvhe/timer-sr.c      |  16 ++-
 arch/arm64/kvm/hyp/vhe/switch.c         |  84 +++++++++++
 arch/arm64/kvm/nested.c                 |  15 ++
 arch/arm64/kvm/sys_regs.c               | 146 ++++++++++++++++++-
 arch/arm64/tools/cpucaps                |   1 +
 include/clocksource/arm_arch_timer.h    |   6 +
 include/kvm/arm_arch_timer.h            |  23 +++
 16 files changed, 546 insertions(+), 41 deletions(-)

-- 
2.39.2


