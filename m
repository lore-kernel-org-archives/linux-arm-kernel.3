Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EEDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t1U4Ay+x9Llrs3FK1AOa9XDUPRnkzPmNlWRTMLh++Q4=; b=cT3X8+oJwWYMykbU31aQv1XIzW
	FBkBXvDOX9gqzfCT0RuTFjFhGDomdst/JNDNXoKPG3sbwen7D25kro1nBfO+3voonlJ24aL+AFRAL
	kPTYKVpVrwzXSRcbpLy/KCVFhQLzVPpffS558qzG6kL5bXLlsYVFLhbsEN32SpuM7tieIXXhRyBuM
	TFHKevqq/eyzurMpE3P2Lnrrg2U6cDVOpBPdRsfdywuzw4HsyYmsIYK1N2PHZnQ1b7wKPYFs1FPgI
	4JpzyI9j8qoX08xUdJAWHWbQ/aI/ILsazLKO8oe9tKlUx0aW/uPrnqTNtrWVV9bvuZh9MjXNGmAog
	LGXpJvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTj8-0000000HaC5-2vYz;
	Fri, 06 Jun 2025 09:51:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTcD-0000000HYlx-0Clr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 09:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D2455C1344;
	Fri,  6 Jun 2025 09:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3CAC4CEEB;
	Fri,  6 Jun 2025 09:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749203035;
	bh=vZSEXUYli2C2cAp32nX+g8RtQUwpt0WT3dasG2Hy6hg=;
	h=From:To:Cc:Subject:Date:From;
	b=Ig6MjsCHBZ7IiVBqLMDcvDaLhYqnM0A4Fsr8bfQNcpKZBDqKkHL/GPwKIZAD5mL8r
	 juLZAgbz/5TFL1jUx58LwcFWDSqLi5WPBPu0qX5P/ON6CXu+DFBl85STG4m7qWhm95
	 jGNMY2aF6Dyfs0polPjGy4wRCKNezFcQE9FgT1kdTCBwSR5tUi3lMmUIhb7FfbH4Xv
	 MGJZtiifI27wXajNXfUh4HlboZ26pw1QZoVasHefQeErT7S2OSwdRUwNxMR4UQuPpA
	 IFj/P4rt40KIh4MjPVNRaiuGcrGpKEmSfcmTImb5C9Grq73Rjp8WE91z/0/ext99zX
	 l2fTVmOARpPhg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uNTc9-004WjE-7M;
	Fri, 06 Jun 2025 10:43:53 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Miguel Luis <miguel.luis@oracle.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Sebastian Ott <sebott@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 6.16, take #2
Date: Fri,  6 Jun 2025 10:43:50 +0100
Message-Id: <20250606094350.1318309-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, miguel.luis@oracle.com, oliver.upton@linux.dev, sebott@redhat.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_024357_169769_64D8078D 
X-CRM114-Status: GOOD (  11.77  )
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

Here the second batch of fixes for 6.16. We have a significant rework
of our system register accessors so that the RES0/RES1 sanitisation
gets applied at the right time, and a bunch of fixes for a single
selftest that really *never* worked.

Please pull,

	M.

The following changes since commit 4d62121ce9b58ea23c8d62207cbc604e98ecdc0a:

  KVM: arm64: vgic-debug: Avoid dereferencing NULL ITE pointer (2025-05-30 10:24:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.16-2

for you to fetch changes up to fad4cf944839da7f5c3376243aa353295c88f588:

  KVM: arm64: selftests: Determine effective counter width in arch_timer_edge_cases (2025-06-05 14:28:44 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 6.16, take #2

- Rework of system register accessors for system registers that are
  directly writen to memory, so that sanitisation of the in-memory
  value happens at the correct time (after the read, or before the
  write). For convenience, RMW-style accessors are also provided.

- Multiple fixes for the so-called "arch-timer-edge-cases' selftest,
  which was always broken.

----------------------------------------------------------------
Marc Zyngier (4):
      KVM: arm64: Add assignment-specific sysreg accessor
      KVM: arm64: Add RMW specific sysreg accessor
      KVM: arm64: Don't use __vcpu_sys_reg() to get the address of a sysreg
      KVM: arm64: Make __vcpu_sys_reg() a pure rvalue operand

Sebastian Ott (4):
      KVM: arm64: selftests: Fix help text for arch_timer_edge_cases
      KVM: arm64: selftests: Fix thread migration in arch_timer_edge_cases
      KVM: arm64: selftests: Fix xVAL init in arch_timer_edge_cases
      KVM: arm64: selftests: Determine effective counter width in arch_timer_edge_cases

 arch/arm64/include/asm/kvm_host.h                  | 32 ++++++++++--
 arch/arm64/kvm/arch_timer.c                        | 18 +++----
 arch/arm64/kvm/debug.c                             |  4 +-
 arch/arm64/kvm/fpsimd.c                            |  4 +-
 arch/arm64/kvm/hyp/exception.c                     |  4 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h            |  4 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h         |  6 +--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c                 |  4 +-
 arch/arm64/kvm/hyp/vhe/switch.c                    |  4 +-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c                 | 48 ++++++++---------
 arch/arm64/kvm/nested.c                            |  2 +-
 arch/arm64/kvm/pmu-emul.c                          | 24 ++++-----
 arch/arm64/kvm/sys_regs.c                          | 60 +++++++++++-----------
 arch/arm64/kvm/sys_regs.h                          |  4 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c               | 10 ++--
 .../selftests/kvm/arm64/arch_timer_edge_cases.c    | 39 +++++++++-----
 16 files changed, 151 insertions(+), 116 deletions(-)

