Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1F2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xU0zR51wflE1l/qxeepjhJW1gRX7/vDKAyH6Qcq6aqU=; b=sBxi1jEQJhgXOSCoG/Wb87Qekp
	4sbSEPwnCm7qJaIR4W1DmtqkkPipZWwqET3D/ShzS5OfcNQb60zcBBxpGQ186KVdBqbIlt0ZTSvih
	0BNu6gCh64EzNhE3SQOfJQblguyjULXm+XREdPFoXTt6YycaWFp7vYc8tT3ph5AvCFUjwrgYRrjNv
	bxBPAWj7Me+XJVZ7/zI9I7iCir+tWouTe1CLPkVICWlYd7RWVH+JXNgIUQSpi4bZaUs+EEi4Sv2bu
	QAri7sAluG52/URiLNvSWefkg0IgdzRiWe4P/sIcHLJRgAfQBJv0Tsd57vdYBqM7fBEvBWmiBVQEx
	wxmqftyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27R8-00000003tXn-0XhX;
	Tue, 08 Apr 2025 11:48:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZM-00000003kX5-1jwJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1DB76115B;
	Tue,  8 Apr 2025 10:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805B7C4CEEA;
	Tue,  8 Apr 2025 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109559;
	bh=eXvgI10mmaf2ewAwZAKZgJKFqhyv5yx9FJwjuwqxvPg=;
	h=From:To:Cc:Subject:Date:From;
	b=WbAIpUR461uXt15y6Vqak43pYY0clt6qZLJEOR4etB4z2i2NhRS0iUhLso+uZjVTa
	 Xr7jBHxFyIZOm4p9h6QCPBebxRNOZfQa2+5e87UuxEQt6puIjNlZ0yuZVR5SGi/Qt1
	 3lNOznMk9n76riyAuzmKBthSlP6XmMI2wHTmmAv8n9deC5rFCuRhCV5j7gMkF5hxQl
	 +8YySSI1fAOPw6PPXWjIfffCX+iiauueRrGPuuNYA9yVsRLSuk7CYzP6Bvj4sKKMpV
	 bv/KAD7i/sCPZY7L6P+hLsJ2wS8GFqegwt93Sf9GbqWA4IxgDRMHm5wFU5c7eN5fEF
	 MrV1YNTnyEkvw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u26ZI-003QX2-UY;
	Tue, 08 Apr 2025 11:52:37 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 00/17] KVM: arm64: Recursive NV support
Date: Tue,  8 Apr 2025 11:52:08 +0100
Message-Id: <20250408105225.4002637-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
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

KVM: arm64: Recursive NV support

This is probably the most interesting bit of the whole NV adventure.
So far, everything else has been a walk in the park, but this one is
where the real fun takes place.

With FEAT_NV2, most of the NV support revolves around tricking a guest
into accessing memory while it tries to access system registers. The
hypervisor's job is to handle the context switch of the actual
registers with the state in memory as needed.

This memory (which we shall call the VNCR page henceforth) lives at an
EL2 VA, and is therefore accessed out of context by the EL1 guest
hypervisor.

So far, so good. But what does it mean to virtualise VNCR itself?

It means that when L1 has a prepared a VNCR page for L2, we must map
it in the L0 EL2, and allow L2 to magically access it. Isn't that fun?
To some extent. But there's more!

Having that L0 mapping on behalf of L1 comes with strings attached. It
means that we must be prepared for this page to become inaccessible,
which can happen for a variety of reasons:

- paged out from the host (MMU notifiers)

- unmapped from L1 EL2 stage-1

- permission changes in L1 EL2 stage-1

And in case you're wondering, yes, all of these have TLB invalidation
in common. That's because performing this mapping is akin to
allocating a "SW managed" TLB for L1's VNCR page.

This is what the bulk of this series is about: TLB management for VNCR
pages, and making sure we have the correct page at the right time.

From an implementation perspective, it isn't that complicated, as it
plugs into the existing NV artillery (TLBI, AT, MMU notifiers). Of
course, nothing is optimised, because we're not at this stage yet. I
have plans to make this better (i.e. fewer TLBIs, which implies fewer
traps when nesting), but that's all future work.

But this is functional enough that I can run an L4 guest on my QC
box. Slowly.

As an added bonus, this series now includes the last two patches that
switch the damned thing on. Does it mean this is bug-free? Of course
not. But we're at a point where NV is no longer a third-rate citizen.
Only a second-rate one.

Patches on top of v6.15-rc1. The full integration is, as always, in my
kvm-arm64/nv-next branch.

* From v1:

  - Rebased on 6.15-rc1

  - Picked up the last two patches to enable the full NV shebang

[1] https://lore.kernel.org/r/20250215150134.3765791-10-maz@kernel.org

Marc Zyngier (17):
  arm64: sysreg: Add layout for VNCR_EL2
  KVM: arm64: nv: Allocate VNCR page when required
  KVM: arm64: nv: Extract translation helper from the AT code
  KVM: arm64: nv: Snapshot S1 ASID tagging information during walk
  KVM: arm64: nv: Move TLBI range decoding to a helper
  KVM: arm64: nv: Don't adjust PSTATE.M when L2 is nesting
  KVM: arm64: nv: Add pseudo-TLB backing VNCR_EL2
  KVM: arm64: nv: Add userspace and guest handling of VNCR_EL2
  KVM: arm64: nv: Handle VNCR_EL2-triggered faults
  KVM: arm64: nv: Handle mapping of VNCR_EL2 at EL2
  KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers
  KVM: arm64: nv: Program host's VNCR_EL2 to the fixmap address
  KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2
  KVM: arm64: nv: Plumb TLBI S1E2 into system instruction dispatch
  KVM: arm64: nv: Remove dead code from ERET handling
  KVM: arm64: Allow userspace to request KVM_ARM_VCPU_EL2*
  KVM: arm64: Document NV caps and vcpu flags

 Documentation/virt/kvm/api.rst      |  14 +-
 arch/arm64/include/asm/esr.h        |   2 +
 arch/arm64/include/asm/fixmap.h     |   6 +
 arch/arm64/include/asm/kvm_host.h   |  15 +-
 arch/arm64/include/asm/kvm_nested.h | 100 +++++
 arch/arm64/include/asm/sysreg.h     |   1 -
 arch/arm64/kvm/arm.c                |  10 +
 arch/arm64/kvm/at.c                 | 123 +++---
 arch/arm64/kvm/emulate-nested.c     |   7 -
 arch/arm64/kvm/handle_exit.c        |   1 +
 arch/arm64/kvm/hyp/vhe/switch.c     |  46 ++-
 arch/arm64/kvm/nested.c             | 608 +++++++++++++++++++++++++++-
 arch/arm64/kvm/reset.c              |   2 +
 arch/arm64/kvm/sys_regs.c           | 135 +++---
 arch/arm64/tools/sysreg             |   6 +
 include/uapi/linux/kvm.h            |   2 +
 16 files changed, 940 insertions(+), 138 deletions(-)

-- 
2.39.2


