Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C7AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NzHNiZRJs/ug1E3IvLOYIVWeeI5eXvwckhLoUOrOafc=; b=SOSzab7x69zBXsZP9e451N5Eoy
	x4mZM3uUJw48mOUG0jANj6YWnl9c+2VY2fMmAnA8ayCzSq88XEX+2qjdBjlpNPNIBfF4PIj8ADDeK
	3bRdI/THG1DNwAjLn2iRkCwHMAlZ1dPRAJbEN2XwVckDucjISv7JgG4iZaSBdB7aRW6nD1K0iPtU8
	T+wwmVczYNZlt4ou9BGJ7hflQKxqlwPADIKvPBxwN3Nz6eraJEdTgQ46bLDebPwPwgEdiMaqwuGBj
	ekipNlR+2lEWe7uyrA32Y+Za3x8EHdtBjUY9xUw+t8XHYefnUEzEvQnPLEhIe3Cix9NLYgc+kMNvm
	3oPkLzHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6iZ-0000000BNmy-2xhn;
	Fri, 26 Jun 2026 13:35:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6iY-0000000BNmk-206Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 13:35:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 17CDC405E5;
	Fri, 26 Jun 2026 13:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED28B1F000E9;
	Fri, 26 Jun 2026 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782480938;
	bh=NzHNiZRJs/ug1E3IvLOYIVWeeI5eXvwckhLoUOrOafc=;
	h=From:To:Cc:Subject:Date;
	b=VMeT0S1SvqLatI/IwMpCTMXnqFFBPetfizCnvFuQZvF9X2oV6NsBlc8otnciskJ7d
	 DmNVg/W6U4lrOQdbceCKtUGpvtFWXu26YXitkFfqWlHbd2a0dx1fjEpKpNk2DygS7f
	 YpgzuqzwwQWIHeWSTu0nYlIG6Oo8DKm8g8k+JZias+t0haj2M6qzxXr5E6C3rz8yrU
	 DIEQLOuKqJdvJCUR2GQUG8icS+Cz9VM3949Oy6ga6wWJ/VxJ13Qiu63jPsKdznBIk6
	 T+9qCI8OMnE0Kl2SxClS3up52kDWYpoJRb/spn3gNoCFg+JJFrryiIuDV+oh9g5sYB
	 J3dWlP/o9k95g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wd6iV-0000000GLsv-1HwZ;
	Fri, 26 Jun 2026 13:35:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Bradley Morgan <include@grrlz.net>,
	Fuad Tabba <tabba@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Oliver Upton <oupton@kernel.org>,
	Weiming Shi <bestswngs@gmail.com>,
	Will Deacon <will@kernel.org>,
	Xuanqing Shi <shixuanqing.11@bytedance.com>,
	Zhong Wang <wangzhong.c0ss4ck@bytedance.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.2, take #1
Date: Fri, 26 Jun 2026 14:35:26 +0100
Message-ID: <20260626133526.817232-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, include@grrlz.net, tabba@google.com, imv4bel@gmail.com, oupton@kernel.org, bestswngs@gmail.com, will@kernel.org, shixuanqing.11@bytedance.com, wangzhong.c0ss4ck@bytedance.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Paolo,

As predicted, here's another largeish set of fixes for KVM/arm64. A
bunch of them are fairly benign (the PSTATE.IL stuff), but some are
pretty annoying (vgic, MOPS) and are stable material.

On the bright side, Fuad has volunteered to be an official reviewer.
We really need people to engage with the reviewing process instead of
simply dumping patches on us, as me and Oliver really can't be
stretched much further. So many thanks Fuad for offering to help.

I expect to be back next week with a similar delivery, as my Inbox
keeps filling with this stuff...

Please pull,

	M.

The following changes since commit 1ee27dacbe5dc4def481794d899d67b0d4570094:

  Merge branch kvm-arm64/nv-mmu-7.2 into kvmarm-master/next (2026-06-12 09:29:34 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.2-1

for you to fetch changes up to d098bb75d14fde2f12155f1a95ec0168160867ce:

  KVM: arm64: account pKVM reclaim against the VM mm (2026-06-22 10:48:08 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 7.2, take #1

- Fix an accounting buglet when reclaiming pages from a protected
  guest

- Fix a bunch of architectural compliance issues when injecting a
  synthesised exception, most of which were missing the PSTATE.IL bit
  indicating a 32bit-wide instruction

- Another set of fixes addressing issues with translation of VNCR_EL2,
  including corner cases where the guest point that register at a RO
  page...

- Don't warn when trapping accesses to ZCR_EL2 from an L2 guest, as
  that's not unexpected at all

- Address a bunch of races with LPI migration vs LPIs being disabled

- Fix a total howler of a bug combining FEAT_MOPS and NV, resulting in
  exception returning in the wrong place...

- Coerce Fuad Tabba into a reviewer role, and may his Inbox catch
  fire!

----------------------------------------------------------------
Bradley Morgan (1):
      KVM: arm64: account pKVM reclaim against the VM mm

Fuad Tabba (11):
      KVM: arm64: nv: Write ESR_EL2 for injected nested SError exceptions
      KVM: arm64: Sync SPSR_EL1 when injecting an exception into a pVM
      KVM: arm64: nv: Fix PSTATE construction on illegal exception return
      KVM: arm64: Add Fuad Tabba as a reviewer
      KVM: arm64: Set ESR_ELx.IL for injected undefined exceptions at EL2
      KVM: arm64: Unconditionally set IL for injected undefined exceptions
      KVM: arm64: Unconditionally set IL for injected abort exceptions
      KVM: arm64: Set IL for injected FPAC exceptions during ERET emulation
      KVM: arm64: Set IL for emulated SError injection
      KVM: arm64: Set IL for nested SError injection
      KVM: arm64: Set IL in fake ESR for pKVM memory sharing exit

Hyunwoo Kim (1):
      KVM: arm64: vgic: Check the interrupt is still ours before migrating it

Marc Zyngier (1):
      KVM: arm64: vgic: Handle race between interrupt affinity change and LPI disabling

Oliver Upton (6):
      KVM: arm64: nv: Drop bogus WARN for write to ZCR_EL2
      KVM: arm64: nv: Respect read-only PFN when mapping L1 VNCR
      KVM: arm64: nv: Inject SEA if kvm_translate_vncr() can't resolve PFN
      KVM: arm64: nv: Re-translate VNCR before injecting abort
      KVM: arm64: nv: Inject SEA if guest VNCR isn't normal memory
      KVM: arm64: nv: Mark VM as bugged for unexpected VNCR abort

Weiming Shi (1):
      KVM: arm64: nv: Fix SPSR_EL2 restore in kvm_hyp_handle_mops()

 MAINTAINERS                             |   1 +
 arch/arm64/include/asm/kvm_nested.h     |   8 ++
 arch/arm64/kvm/at.c                     |   8 --
 arch/arm64/kvm/emulate-nested.c         |  37 +++++--
 arch/arm64/kvm/hyp/include/hyp/switch.h |  11 ++-
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |   3 +-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c      |   3 +-
 arch/arm64/kvm/inject_fault.c           |  18 +---
 arch/arm64/kvm/nested.c                 | 164 ++++++++++++++++----------------
 arch/arm64/kvm/pkvm.c                   |   2 +-
 arch/arm64/kvm/vgic/vgic.c              |  20 ++--
 11 files changed, 149 insertions(+), 126 deletions(-)

