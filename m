Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC2AC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GrrRmclmQ4Icg5sh/PZCX5WddHH9Wk4fS6xF3R4S49U=; b=dxrw8v+8ptAjP1WBpv3sAJcddk
	hM8e+YAOg53Wwywsx4Cgu25gGLz+lHBXPoM5i4EurcNl5rgfWu1f9FHVerbsqoSyKOWydxdufFwXl
	mnW9b/mV3XNwNDSDOCXGc8rEJeR2T+XGmLrECvvK3gBrcYKvjj5h+dpqBkJGaiqZYDfxV2o5uwzw2
	0EPV1RofANjXURjWXXKD6vVF2r/ZfX+hEJ8vjLHd3OBJ3vlhVEB3tseVVh8fKUw7ksMaaztMtgkTu
	ipJ81lCg9KVqOF+ck4kyC+Ra9KXLRJEZWKPOvnLXq6BXrQEznT6XQPeWAzV2kDXqk8N6HIAAyrena
	jtGk9wdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHVc-0000000DXhF-07rD;
	Thu, 19 Jun 2025 15:49:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEtF-0000000D7JV-3Gwj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 13:01:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E85A460010;
	Thu, 19 Jun 2025 13:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAF3C4CEEA;
	Thu, 19 Jun 2025 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750338072;
	bh=/kE+YFpl0J9ThQUvmELPjh8cJ/+9gC716KmHUlheWRU=;
	h=From:To:Cc:Subject:Date:From;
	b=kMa7OvsJYPpiI18LMM7gfqrPAVBmJ9s4dXxtORIasVECRmDh6RULdsK+Bwc2oVQWG
	 t6i1DTJFn+6CD7ktY4HGc9rOHW05ih3ofAYbuCZEe1GdPOmqASK4AX1FDVNjDMI4k+
	 0BV+Rc7hIYgmCH3F7Cq2LcSxphJz5J2uJ443Pa6qxIxVlL6nDO8/73/Cp+fk6Dvfm3
	 VcLVWoT5g9ZRQ3rBeeKkkB8zAb3iK9V6Qx5Qp3/uJ2yF4cUxsJ88JxZYOhMJ9q7sOj
	 leVn0OeIhztcC77Itmtl8qnOELWcEoaM07yV8ZMRsh2vJPoFmIvOf1BTsAwJq7oVJa
	 c0DkbXPTXdBdw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uSEtC-008G3W-Dh;
	Thu, 19 Jun 2025 14:01:10 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Luis <miguel.luis@oracle.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Sebastian Ott <sebott@redhat.com>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] KVM/arm64 fixes, take #3
Date: Thu, 19 Jun 2025 14:00:49 +0100
Message-Id: <20250619130049.3133524-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, catalin.marinas@arm.com, tabba@google.com, broonie@kernel.org, mark.rutland@arm.com, miguel.luis@oracle.com, oliver.upton@linux.dev, seanjc@google.com, sebott@redhat.com, r09922117@csie.ntu.edu.tw, will@kernel.org, yuzenghui@huawei.com, joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Here's the third set of KVM/arm64 fixes for 6.16. The most notable
thing is yet another batch of FP/SVE fixes from Mark, this time
addressing NV, and additionally plugging some missing synchronisation.
The rest is a mix of interrupt stuff (routing change, mishandling of
shadow LRs) and selftest fixes.

Please pull,

	M.

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.16-3

for you to fetch changes up to 04c5355b2a94ff3191ce63ab035fb7f04d036869:

  KVM: arm64: VHE: Centralize ISBs when returning to host (2025-06-19 13:34:59 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 6.16, take #3

- Fix another set of FP/SIMD/SVE bugs affecting NV, and plugging some
  missing synchronisation

- A small fix for the irqbypass hook fixes, tightening the check and
  ensuring that we only deal with MSI for both the old and the new
  route entry

- Rework the way the shadow LRs are addressed in a nesting
  configuration, plugging an embarrassing bug as well as simplifying
  the whole process

- Add yet another fix for the dreaded arch_timer_edge_cases selftest

----------------------------------------------------------------
Marc Zyngier (1):
      KVM: arm64: nv: Fix tracking of shadow list registers

Mark Rutland (7):
      KVM: arm64: VHE: Synchronize restore of host debug registers
      KVM: arm64: VHE: Synchronize CPTR trap deactivation
      KVM: arm64: Reorganise CPTR trap manipulation
      KVM: arm64: Remove ad-hoc CPTR manipulation from fpsimd_sve_sync()
      KVM: arm64: Remove ad-hoc CPTR manipulation from kvm_hyp_handle_fpsimd()
      KVM: arm64: Remove cpacr_clear_set()
      KVM: arm64: VHE: Centralize ISBs when returning to host

Sean Christopherson (1):
      KVM: arm64: Explicitly treat routing entry type changes as changes

Zenghui Yu (1):
      KVM: arm64: selftests: Close the GIC FD in arch_timer_edge_cases

 arch/arm64/include/asm/kvm_emulate.h               |  62 ---------
 arch/arm64/include/asm/kvm_host.h                  |   6 +-
 arch/arm64/kvm/arm.c                               |   3 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h            | 147 +++++++++++++++++++--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c                 |   5 +-
 arch/arm64/kvm/hyp/nvhe/switch.c                   |  59 ---------
 arch/arm64/kvm/hyp/vhe/switch.c                    | 107 ++-------------
 arch/arm64/kvm/vgic/vgic-v3-nested.c               |  81 ++++++------
 .../selftests/kvm/arm64/arch_timer_edge_cases.c    |  16 ++-
 9 files changed, 215 insertions(+), 271 deletions(-)

