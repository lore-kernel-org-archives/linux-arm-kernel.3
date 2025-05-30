Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25772C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W63TW46Nlg5B6lmMIX38H7pNZynzm67mxXdmk0sTokY=; b=2yDuhen2ycfYx0Xzb/RZK/2vEz
	cmfEGsmdt38IJjxsYUch78PyveJdxUJbKtSrYgx3xcUlp9/x6Y59TLXlfGETEgcQUGYHmeTvP6p+D
	zT8mTzPnnDrRiAlnZYNuzrMFIm0cf623NuvDMK+fd4NT3ce4hmSAOuH/9/HvIMzGv9lCDAZdw9LsM
	CtZ6lmWxLGlV4EfaUQn9ytDiwRhTIYzPhWHzaZSRBuiusTls9LXHkhHPb4Qt84GFuzhUCteiazLWt
	faNbtAkzbwGhDNp/1J4EgWSqZ9Etp8ITLNhOM/YuWB21KCgXIxUxlJF4yZAOdmAcIKZI9tTAdYU/s
	lQtTJwNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwSX-00000000E02-15cF;
	Fri, 30 May 2025 09:55:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwPv-00000000DiM-2gPx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:52:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB61EA4DB6D;
	Fri, 30 May 2025 09:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8254DC4CEE9;
	Fri, 30 May 2025 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748598766;
	bh=vQBPZkgMXyD+EbgfzSAlFm0EAAyiNqjKIVGyLm9BEZo=;
	h=From:To:Cc:Subject:Date:From;
	b=Ci+KBFGO8HoE+478ZVAO1y5C4e4nsPcCvd07wOyfb3tSotn1gzGnOVPjA+b1bNM1R
	 zuVmo7ekE5rXvnCJl68CEysYYClhtOaDpKPhmFURc9IHrNoqZ+KWX2NaaYuvflCM3i
	 OdeY4yYm5fPmouOdh88XCjNO+VnvIda7aXmp2tLbbM3I0mjOFH9YPw1JLK7oDtq8gG
	 C+U26ZcMQv+fKNKF9jkyg5/zStv9AwP7Rqgvl6dLhjzfoqXNizB86v/zviXnGWu/Ci
	 jMNcLDU+eQsjWoeMtb8uggdTPoZ2I1gBQP0CAn5n7K250ZV4RVl5ayIEo2nbNaJqwC
	 aTvsSlQ3dFsTw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uKwPs-001ovg-67;
	Fri, 30 May 2025 10:52:44 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alexander Potapenko <glider@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Jing Zhang <jingzhangos@google.com>,
	Mark Brown <broonie@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 6.16, take #1
Date: Fri, 30 May 2025 10:52:23 +0100
Message-Id: <20250530095223.1153860-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, glider@google.com, catalin.marinas@arm.com, dan.carpenter@linaro.org, scott@os.amperecomputing.com, jingzhangos@google.com, broonie@kernel.org, oliver.upton@linux.dev, sweettea-kernel@dorminy.me, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_025247_818368_FFA9039A 
X-CRM114-Status: GOOD (  12.06  )
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

Here's the first batch of fixes for KVM/arm64. Nothing very exciting,
except for yet another annoying race condition in the vgic init code
spotted by everybody's favourite backtrace generator (syzkaller).

Details in the tag below.

Please pull,

	M.

The following changes since commit 1b85d923ba8c9e6afaf19e26708411adde94fba8:

  Merge branch kvm-arm64/misc-6.16 into kvmarm-master/next (2025-05-23 10:59:43 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.16-1

for you to fetch changes up to 4d62121ce9b58ea23c8d62207cbc604e98ecdc0a:

  KVM: arm64: vgic-debug: Avoid dereferencing NULL ITE pointer (2025-05-30 10:24:49 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 6.16, take #1

- Make the irqbypass hooks resilient to changes in the GSI<->MSI
  routing, avoiding behind stale vLPI mappings being left behind. The
  fix is to resolve the VGIC IRQ using the host IRQ (which is stable)
  and nuking the vLPI mapping upon a routing change.

- Close another VGIC race where vCPU creation races with VGIC
  creation, leading to in-flight vCPUs entering the kernel w/o private
  IRQs allocated.

- Fix a build issue triggered by the recently added workaround for
  Ampere's AC04_CPU_23 erratum.

- Correctly sign-extend the VA when emulating a TLBI instruction
  potentially targeting a VNCR mapping.

- Avoid dereferencing a NULL pointer in the VGIC debug code, which can
  happen if the device doesn't have any mapping yet.

----------------------------------------------------------------
Marc Zyngier (3):
      arm64: sysreg: Drag linux/kconfig.h to work around vdso build issue
      KVM: arm64: Mask out non-VA bits from TLBI VA* on VNCR invalidation
      KVM: arm64: vgic-debug: Avoid dereferencing NULL ITE pointer

Oliver Upton (5):
      KVM: arm64: Use lock guard in vgic_v4_set_forwarding()
      KVM: arm64: Protect vLPI translation with vgic_irq::irq_lock
      KVM: arm64: Resolve vLPI by host IRQ in vgic_v4_unset_forwarding()
      KVM: arm64: Unmap vLPIs affected by changes to GSI routing information
      KVM: arm64: vgic-init: Plug vCPU vs. VGIC creation race

 arch/arm64/include/asm/sysreg.h  |  1 +
 arch/arm64/kvm/arm.c             | 26 +++++++++++-
 arch/arm64/kvm/nested.c          |  6 ++-
 arch/arm64/kvm/vgic/vgic-debug.c |  5 ++-
 arch/arm64/kvm/vgic/vgic-init.c  | 27 +++++++++++-
 arch/arm64/kvm/vgic/vgic-its.c   | 48 ++++++++++-----------
 arch/arm64/kvm/vgic/vgic-v4.c    | 92 ++++++++++++++++++++++------------------
 include/kvm/arm_vgic.h           |  3 +-
 8 files changed, 134 insertions(+), 74 deletions(-)

