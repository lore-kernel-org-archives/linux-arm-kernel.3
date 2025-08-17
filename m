Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF9DCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 20:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eIjcgKfTyVyT7gWAGou2n/GfhW/eH94L9YlyOiTdrqk=; b=qaKB6JC37asSMJH2/cJUUksaJQ
	kOS4Qke7HjHZVFbTOxjOd6fYMNlKsz65oeHufiJEopSbQUkI/YPFMnr0jYH2uE2F0RF5qjWy3eZB5
	+CwGofdmrL9KgDn2uAgXUdtyjGTZqze+97PVyXBCVekB464cEwxLQPKparxI4T2zz0FSxS1qKmJzX
	rC62ldo17sAIpclaQ22W9sam/5n44vc2cjP5esvJNil7QO2EY9ELMb57WHQkjBeNW7mRq55hCqVIf
	u0T9u9ES7m3knCF8VqMXaGSiSw9vHc2eW8G0tvh0xlOu6O3i2MmlOR0nv3Q0iynmgmY8SImEmEaFc
	ZOcE9zuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unk3S-000000061e0-198b;
	Sun, 17 Aug 2025 20:32:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unjtH-000000060QU-3Crw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 20:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8AB745C12EF;
	Sun, 17 Aug 2025 20:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B61C4CEEB;
	Sun, 17 Aug 2025 20:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755462125;
	bh=6IKXewD5unUmBax2L4vHEKjl6ny3rrpHG4F8C3MhAI4=;
	h=From:To:Cc:Subject:Date:From;
	b=JQ/fuZORsW19lxI3yCEgGoKsk/eCkdixoVAwGBsuTCHwVrwe125DUvz/ImYQN0m9e
	 SVzyFTelspj4+e3kqbco62jwL8K+Z3KN7wMLOd2C+qGY5vGgcVqZqRCKjX1gjUCO2p
	 i+X64uCFoJGt4yLdEcT5oBHpK9euSaEREzSk2u5ciSUl+K+9WH9mlRH63r2S0t5q+9
	 N7R5fKKqGSAhuqiRGtBJb+yf/LgppqM13bc7GnBfKDYrzv+0+ndzQVV1SzxQlrp38e
	 JlO6O0IbUkM2kC0obukFDaJ5B/iQD+PZRBheP8fNE977hoxWarTEq5polxRzwnPuv1
	 48mhCcwGn+dOA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1unjtC-008PX0-PO;
	Sun, 17 Aug 2025 21:22:02 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 0/6] KVM: arm64: FEAT_RASv1p1 support and RAS selection
Date: Sun, 17 Aug 2025 21:21:52 +0100
Message-Id: <20250817202158.395078-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, cohuck@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_132207_881001_6A555CE9 
X-CRM114-Status: GOOD (  13.03  )
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

This is the next iteration of this series trying to plug some of our
RAS holes (no pun intended...). See [1] for the original series.

The difference with the previous drop is that we don't try to expose a
canonical encoding RASv1p1. Which means you must migrate between
similar implementations for now.

I've also added a cleanup patch at the end, which can be dropped.

Patches on top of v6.17-rc1.

* From v2 [2]:

  - Drop the canonical RASv1p1 advertisement

  - Expose ID_AA64PFR1_EL1.RAS_frac as a writable field

  - Added an extra patch dropping ARM64_FEATURE_MASK(), as it is both
    useless and annoying

  - Pick RB from Joey (thanks!)

* From v1 [1]:

  - Bunch of patches picked by Oliver (thanks!)

  - Added missing SYS_ERXMISC{2,3}_EL1 from the list of handled RAS
    registers

  - Added some rationale about the advertising of RASv1p1 (Cornelia)

  - Picked AB from Catalin (thanks!)

[1] https://lore.kernel.org/kvmarm/20250721101955.535159-1-maz@kernel.org
[2] https://lore.kernel.org/kvmarm/20250806165615.1513164-1-maz@kernel.org

Marc Zyngier (6):
  arm64: Add capability denoting FEAT_RASv1p1
  KVM: arm64: Handle RASv1p1 registers
  KVM: arm64: Ignore HCR_EL2.FIEN set by L1 guest's EL2
  KVM: arm64: Make ID_AA64PFR0_EL1.RAS writable
  KVM: arm64: Make ID_AA64PFR1_EL1.RAS_frac writable
  KVM: arm64: Get rid of ARM64_FEATURE_MASK()

 arch/arm64/include/asm/sysreg.h               |  3 -
 arch/arm64/kernel/cpufeature.c                | 24 ++++++
 arch/arm64/kvm/arm.c                          |  8 +-
 arch/arm64/kvm/hyp/vhe/switch.c               |  5 +-
 arch/arm64/kvm/nested.c                       |  3 +-
 arch/arm64/kvm/sys_regs.c                     | 75 +++++++++++++------
 arch/arm64/tools/cpucaps                      |  1 +
 tools/arch/arm64/include/asm/sysreg.h         |  3 -
 .../selftests/kvm/arm64/aarch32_id_regs.c     |  2 +-
 .../selftests/kvm/arm64/debug-exceptions.c    | 12 +--
 .../testing/selftests/kvm/arm64/no-vgic-v3.c  |  4 +-
 .../selftests/kvm/arm64/page_fault_test.c     |  6 +-
 .../testing/selftests/kvm/arm64/set_id_regs.c |  8 +-
 .../selftests/kvm/arm64/vpmu_counter_access.c |  2 +-
 .../selftests/kvm/lib/arm64/processor.c       |  6 +-
 15 files changed, 107 insertions(+), 55 deletions(-)

-- 
2.39.2


