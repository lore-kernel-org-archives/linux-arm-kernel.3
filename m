Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546FAFED3E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 15:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=11B7mFpZ7qVCH2xf01dCaQCgfvR0W4/yFUJfYdr9MXk=; b=LImxlJ/wZzmlSbXkmHXTRsl62M
	+x4AX0JVhO1QyGggJAeqP/uPaAcb44cGNKijrKovoHZ+74Talyr3uvNz1xSQAQq4J5XWIOuhzV0Rr
	dQjha4pKygGrhnz6th3I2Nm4ieaa/3ZD8vGIn4hXdbwUm9CNWm+uPCt0V4s6RpX8ak6AuzHIivUMf
	NNKhrlGIVMkIMPhUdC+iQ87cE7IhkGTh2yIErebg9NEv9PBn8soH2iIXz6l9eQnUK6y8wBiHLjmYK
	ua9GxnBZmcYRt3MXZFQoOz23Hkuuqpwg1qFExTZpenY7+Z3lMx+THniPZxLQXEg34ihogfpyAMBf+
	He5VI7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIFG-0000000DNDO-23DQ;
	Fri, 24 Apr 2026 15:15:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIFE-0000000DNCH-23ZF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 15:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A787144384;
	Fri, 24 Apr 2026 15:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834ECC19425;
	Fri, 24 Apr 2026 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777043703;
	bh=g9K5mfNblRY0b8MrHwI5cfWeLShbsP+DXXMV5iplhIU=;
	h=From:To:Cc:Subject:Date:From;
	b=ixejiLbCe6paehrBYEgux/SsbNRd7z0hbwWE3TgN2pwgIIvCNGNdeIfJ9tK+Y95ru
	 oYaLVhKd6Wllz358gOUojfmSejLRJaq+8q2GtBDJSqIF4nk6OZJQ6/BVQd4QkqyQ96
	 ldDaQq40R4xj6QDnnWHhlWhEi+PQXPRroBHYyyNn7s2jUbQIiXAOVO4qK0/Go7MVOq
	 Nd+KX3P0gBE2ckpNniPIZJwnRslVs5KS8h36Bqe/8HtCpLmeKF7CHLG5lMGjkQpd9m
	 Yd6X1/oKxy3NNdUCBIkWsAma9wwIRyxwe5tYXqGw3H+nihQkZTNnMm67JWCEGkV81Y
	 2fsMq98wGr6EA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wGIFA-0000000EPWA-2PuZ;
	Fri, 24 Apr 2026 15:15:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ben Simner <ben.simner@cl.cam.ac.uk>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Fuad Tabba <tabba@google.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.1, take #1
Date: Fri, 24 Apr 2026 16:14:43 +0100
Message-ID: <20260424151443.750077-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, ben.simner@cl.cam.ac.uk, dwmw@amazon.co.uk, tabba@google.com, qperret@google.com, sebastianene@google.com, vdonnefort@google.com, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_081504_579250_08BBB7ED 
X-CRM114-Status: GOOD (  14.40  )
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

This is the first drop of KVM/arm64 fixes for 7.1. Nothing really
major so far, but a rather wide range of fixes for idreg handling,
long standing regressions, SMCCC compliance and more. Add a few
cleanups to the fix, and that's about it. As usual, gory details in
the tag below.

Please pull,

	M.

The following changes since commit 94b4ae79ebb42a8a6f2124b4d4b033b15a98e4f9:

  Merge branch kvm-arm64/misc-7.1 into kvmarm-master/next (2026-04-08 12:26:11 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.1-1

for you to fetch changes up to 4ce98bf0865c349e7026ad9c14f48da264920953:

  KVM: arm64: Wake-up from WFI when iqrchip is in userspace (2026-04-24 12:03:57 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 7.1, take #1

- Allow tracing for non-pKVM, which was accidentally disabled when
  the series was merged

- Rationalise the way the pKVM hypercall ranges are defined by using
  the same mechanism as already used for the vcpu_sysreg enum

- Enforce that SMCCC function numbers relayed by the pKVM proxy are
  actually compliant with the specification

- Fix a couple of feature to idreg mappings which resulted in the
  wrong sanitisation being applied

- Fix the GICD_IIDR revision number field that could never been
  written correctly by userspace

- Make kvm_vcpu_initialized() correctly use its parameter instead
  of relying on the surrounding context

- Enforce correct ordering in __pkvm_init_vcpu(), plugging a
  potential pin leak at the same time

- Move __pkvm_init_finalise() to a less dangerous spot, avoiding
  future problems

- Restore functional userspace irqchip support after a four year
  breakage (last functional kernel was 5.18...). This is obviously
  ripe for garbage collection.

- ... and the usual lot of spelling fixes

----------------------------------------------------------------
David Woodhouse (1):
      KVM: arm64: vgic: Fix IIDR revision field extracted from wrong value

Fuad Tabba (5):
      KVM: arm64: Fix FEAT_Debugv8p9 to check DebugVer, not PMUVer
      KVM: arm64: Fix typo in feature check comments
      KVM: arm64: Fix FEAT_SPE_FnE to use PMSIDR_EL1.FnE, not PMSVer
      KVM: arm64: Fix kvm_vcpu_initialized() macro parameter
      KVM: arm64: Fix pin leak and publication ordering in __pkvm_init_vcpu()

Marc Zyngier (2):
      KVM: arm64: pkvm: Adopt MARKER() to define host hypercall ranges
      KVM: arm64: Wake-up from WFI when iqrchip is in userspace

Quentin Perret (1):
      KVM: arm64: Fix initialisation order in __pkvm_init_finalise()

Sebastian Ene (1):
      KVM: arm64: Reject non compliant SMCCC function calls in pKVM

Vincent Donnefort (1):
      KVM: arm64: Re-allow hyp tracing HVCs for [nh]VHE

 arch/arm64/include/asm/kvm_asm.h   | 28 ++++++++++++++++++----------
 arch/arm64/include/asm/kvm_host.h  |  5 +----
 arch/arm64/kvm/arm.c               |  4 ++++
 arch/arm64/kvm/config.c            | 23 ++++++++++++++++-------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 30 +++++++++++++++++-------------
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 38 +++++++++++++++++++++++++-------------
 arch/arm64/kvm/hyp/nvhe/setup.c    |  6 +++---
 arch/arm64/kvm/vgic/vgic-mmio-v2.c |  2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c |  2 +-
 9 files changed, 86 insertions(+), 52 deletions(-)

