Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE2D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TKBtNyAw;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWbUfAK2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wjtchPQeONVkp4MunXk9fa9KT+Wa3IU0Hsl5gORHKVI=; b=TKBtNyAwcbjIfoK7yt5J+YCUSH
	vhH/V2TxzYCW3iRL7G1uvNCurbJYgz17gh3VIOeRZrcm1mVObhPBFwktGUrzCuZNuJgoPyYgMEoZZ
	bPrge3DVhMxSPof4UhRBpsO9D+0cB0bQnYOhEe2zoEJLC7TPcO1KxqYZk5prX2IzMGzUS27/aFsO+
	f+xGWuLguz0dX+rULIentLDI7sUfhZr0myjTpzrV8ci/cYa3/0G/88AaoJztJkAoYV5qggKve0iyD
	bHaYnXKgO4uxbhxhA3GIj5vk/Jz6hOAZeDqO45JoTVXtTYVovWUUrplU5Gh5Ih0dNr7Wt+pSiNXHB
	R3re9iNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiGN-000000052hQ-1Ea4;
	Tue, 27 Oct 2026 14:34:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiGL-000000052hF-2u17
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:34:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CBAD42A23;
	Tue, 27 Oct 2026 14:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D485A1F01825;
	Tue, 27 Oct 2026 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793111693;
	bh=wjtchPQeONVkp4MunXk9fa9KT+Wa3IU0Hsl5gORHKVI=;
	h=From:To:Cc:Subject:Date;
	b=BWbUfAK2x1k3xV3EdygtW85S9Iq5wm16Snu8UA1z4E2ZyisZNXQndSH0QMx2VNRwP
	 Z76bBvpzuvrzmP2htOSTC1N6hBEMNHwc1VpK++QgNCGqjBZ7Kq0NwBvQ0CeC3x1Shp
	 Bnu+GDssVA73ZDWsonXuiJuMEFkfhjdf9xJEJuiKF8yblrQJXp2dRlHF6iEziSDh04
	 kd2TyQnnYCpl9DBAgfQC3rJ+CT5nG0KL7rVjOTH3fZ6Cut/Ot6r8AENsqa9WBrEXTF
	 VXqKjzMRCNwnXovd4Rn9fROaM9V18r3FVA+0FHbXh6O410TBWZUNmogVIbFEnoQymL
	 D4WaMuunu1mPw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLiGI-00000007kSQ-392O;
	Tue, 27 Oct 2026 14:34:50 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.4, take #1
Date: Tue, 27 Oct 2026 14:34:24 +0000
Message-ID: <20261027143424.2732449-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, fuad.tabba@linux.dev, itaru.kitayama@fujitsu.com, ljs@kernel.org, broonie@kernel.org, oupton@kernel.org, sascha.bischoff@arm.com, sashal@kernel.org, rostedt@goodmis.org, suzuki.poulose@arm.com, vdonnefort@google.com, seiden@linux.ibm.com, joey.gouly@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-24.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Paolo,

Here's the first set of KVM/arm64 fixes for 7.4, most of which have
been brewing for some time. Of note: a couple of fixes for mismerges
in the initial kvmarm-7,4 pull request, fixes for the publication of
IN/OUTSIDE_GUEST_MODE, and nesting for vcpu pausing. The rest is a
bunch of cleanups for nonsensical configurations and some more pKVM
fixes. I have already started queuing more fixes, so it is likely that
I'll be back next week with a similar email.

Note that this is on top of the initial pull-request that you sent to
Linus, so hopefully conflict free.

Please pull,

	M.

The following changes since commit 814607cd40df80d5727957adaa857e0feca43497:

  Merge tag 'kvm-s390-next-7.4-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD (2026-10-19 15:11:58 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.4-1

for you to fetch changes up to 9e9283e4c941e806d2735f09b66763487bc48b50:

  Merge branch kvm-arm64/misc-fixes-7.4-1 into kvmarm-master/fixes (2026-10-26 10:57:37 +0000)

----------------------------------------------------------------
KVM/arm64 fixes for 7.4, take #1

- Fix a couple of embarrassing merge mistakes in kvmarm-7.4

- Cleanup the HCR_EL2 bit fields to exclusively use the generated
  definitions, fixings a nasty regression introduced in 6.16, where
  barriers were not upgraded from NSH to ISH anymore

- Fix publication of state when a vcpu is forced out of the guest

- Let vcpu pausing nest correctly

- Sanitise ID_AA64MMFR3_EL1.S1P[IO]E to follow the rules of the architecture

- Don't warn on SMCCC filter reserved range allocation failure

- Prevent GICv5 and TLBI hypercalls to be used from the host when pKVM
  is active

- Enforce that only GICv3 guests are supported for pKVM

- Don't try to access GICv5 EL2 sysregs from EL1

- Compute architectrally correct values for ID_AA64MMFR3_EL1.S1P[IO]E
  by checking the feature dependencies

- Require matching VGIC and ITS model

- Cleanup TRACE_REMOTE dependencies

- selftests: Skip unwritable ID fields in the failed-run test

- Move pkvm_selftests() after all CPUs have initialized EL2

- Fix random comments

----------------------------------------------------------------
Fuad Tabba (10):
      KVM: arm64: vgic-its: Don't map an LPI from more than one event
      KVM: arm64: vgic-its: Remove the pending state of a discarded LPI
      KVM: arm64: Don't WARN on SMCCC filter reserved range allocation failure
      KVM: arm64: Reject the GICv5 CPU interface hypercalls under pKVM
      KVM: arm64: Return on kvm_gmem_get_pfn() failure in gmem_abort()
      KVM: arm64: Reject the stage-2 flush hypercalls under pKVM
      KVM: arm64: Validate the host-provided vgic model in pKVM
      KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
      KVM: arm64: Fix stale VGICv3 comments in the nVHE world switch
      KVM: arm64: Set HCR_EL2.BSU to Inner Shareable for guests

Marc Zyngier (12):
      KVM: arm64: nv: Move L2->L1 switch on interrupt early
      KVM: arm64: Move OUTSIDE_GUEST_MODE publication past context being saved
      KVM: arm64: Move IN_GUEST_MODE ahead of state being loaded
      KVM: arm64: Turn vcpu->arch.pause into a counter
      KVM: arm64: vgic: Stop the target vcpu when disabling LPIs
      KVM: arm64: vgic-its: Stop the VM when handling MOVALL
      KVM: arm64: Convert HCR_xyz to HCR_EL2_xyz
      KVM: arm64: Get rid of compatibility HCR_EL2 aliases
      KVM: arm64: Sanitise ID_AA64MMFR3_EL1.S1P[IO]E
      Merge branch kvm-arm64/hcr-cleanup into kvmarm-master/fixes
      Merge branch kvm-arm64/cross-vcpu-sync into kvmarm-master/fixes
      Merge branch kvm-arm64/misc-fixes-7.4-1 into kvmarm-master/fixes

Oliver Upton (1):
      KVM: arm64: Add helpers to halt a vCPU

Sascha Bischoff (3):
      KVM: arm64: gic-v5: Drop unused addr variable
      KVM: arm64: vgic: Require matching VGIC and ITS models
      KVM: selftests: Reject GICv3 ITS with a GICv5 VGIC

Sasha Levin (2):
      KVM: arm64: Take a protected vCPU's TWI and TWE only at vCPU load
      KVM: arm64: selftests: Skip unwritable ID fields in the failed-run test

Vincent Donnefort (2):
      KVM: arm64: Move pkvm_selftests() after all CPUs have initialized EL2
      tracing/remotes: Fix TRACE_REMOTE build when TRACING=n

 arch/arm64/include/asm/el2_setup.h              |   4 +-
 arch/arm64/include/asm/hardirq.h                |   6 +-
 arch/arm64/include/asm/kvm_arm.h                |  79 ++--------------
 arch/arm64/include/asm/kvm_asm.h                |  22 ++---
 arch/arm64/include/asm/kvm_emulate.h            |  18 ++--
 arch/arm64/include/asm/kvm_host.h               |  10 +-
 arch/arm64/include/asm/kvm_mte.h                |   4 +-
 arch/arm64/include/asm/kvm_pkvm.h               |   1 -
 arch/arm64/include/asm/kvm_ptrauth.h            |   4 +-
 arch/arm64/kernel/head.S                        |   4 +-
 arch/arm64/kvm/Kconfig                          |   2 +-
 arch/arm64/kvm/arm.c                            | 100 ++++++++++++--------
 arch/arm64/kvm/at.c                             |  18 ++--
 arch/arm64/kvm/config.c                         |  78 ++++++++++++++++
 arch/arm64/kvm/emulate-nested.c                 | 116 ++++++++++++------------
 arch/arm64/kvm/guest.c                          |   2 +-
 arch/arm64/kvm/handle_exit.c                    |   2 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h         |  14 +--
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h          |  13 +--
 arch/arm64/kvm/hyp/nvhe/host.S                  |   2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S              |   2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c              |  15 +--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c           |   6 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                  |  41 +++++----
 arch/arm64/kvm/hyp/nvhe/switch.c                |   4 +-
 arch/arm64/kvm/hyp/vgic-v3-sr.c                 |   4 +-
 arch/arm64/kvm/hyp/vhe/switch.c                 |  12 +--
 arch/arm64/kvm/hyp/vhe/tlb.c                    |   2 +-
 arch/arm64/kvm/hypercalls.c                     |   4 +-
 arch/arm64/kvm/inject_fault.c                   |   6 +-
 arch/arm64/kvm/mmu.c                            |   9 +-
 arch/arm64/kvm/nested.c                         |  16 +++-
 arch/arm64/kvm/pkvm.c                           |   4 +-
 arch/arm64/kvm/sys_regs.c                       |  26 +++---
 arch/arm64/kvm/vgic/vgic-init.c                 |  17 ++++
 arch/arm64/kvm/vgic/vgic-irs-v5.c               |   3 +-
 arch/arm64/kvm/vgic/vgic-its.c                  |  85 +++++++++++++++--
 arch/arm64/kvm/vgic/vgic-mmio-v3.c              |  15 ++-
 arch/arm64/kvm/vgic/vgic-v3-nested.c            |   4 +-
 arch/arm64/kvm/vgic/vgic.c                      |  15 +--
 include/kvm/arm_vgic.h                          |   6 +-
 kernel/trace/Kconfig                            |   1 +
 tools/testing/selftests/kvm/arm64/set_id_regs.c |  13 ++-
 tools/testing/selftests/kvm/arm64/vgic_v5.c     |  32 +++++++
 44 files changed, 517 insertions(+), 324 deletions(-)

