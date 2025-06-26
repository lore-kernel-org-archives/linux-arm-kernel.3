Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C56C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1rGLhQaBk0Lc0lrn9ppnlXkEhKpmm7Gm2OqaL80R4b4=; b=SDA8OAWLGZ0djENM7+rAhFpkRy
	wSJDUB1epPrv/4xRyXHmgagXobFlwzXcveMKZ4818DIh6j9wv5Lfa/JSGMjiAOG6u62a0QIREZFDZ
	hdNGbv9X+/uZF+hqp+olF4vtc2sQ3C0yJRJUTttys7YzEQYhPGMWYUDqJlH4Hmest15NJSPtWEUab
	B8WYOB5u8h0l2x8FJnf1Dw7kGvsh54ACP3ynP/AgmtcdFr8P7eGgL0g2+vQV01WycSE5X50TooDji
	tCSk3BsT+Of2cExLDMptV2X2uAIyaqbwuNU+qKHoOVucYFGD7QykFCRhuAWGDcpAHd4qe5o+0AmI4
	IWDWJj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpFs-0000000CEdd-16w9;
	Thu, 26 Jun 2025 16:15:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoOw-0000000C65L-3jMo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 15:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE2485C5790;
	Thu, 26 Jun 2025 15:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9637C4CEEB;
	Thu, 26 Jun 2025 15:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750951234;
	bh=Dds48T+13Rl1lPltLORehbpwNU4/j51XA94K8+avE5w=;
	h=From:To:Cc:Subject:Date:From;
	b=Y5Jli4GUKuhTeHTX8HNMlcQxc3urmUV61Hch6xuZ20Lxj54j7rVARi41Wa7fBanQj
	 EKV+c01kX7Z19580K+dqEimfUHxhE3EUY475Y+3PY7pz+v7p7515q4T5Aw92CjzkT8
	 cG/U3lUDtVCwBCSiWD3QFjDxfKyAFnAUUwUTRH5DX/9YU9p7Z7zl9S+CyaJMigY5vA
	 Bzgz135J1cN9K4zkdP1xNUa0n2G90c5x3+QYev66JFV8J19iBFZRC+FcnGHAjxiUdH
	 jwcVzVIJcueW2BC6b6zRJ6rnW2+JVPDx0YYCedwR+xpLdSRghZ3nFDEe8/14sRRbST
	 J580m0nbOuamg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uUoOt-00AGoI-H6;
	Thu, 26 Jun 2025 16:20:31 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Mostafa Saleh <smostafa@google.com>,
	Quentin Perret <qperret@google.com>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 6.16, take #4
Date: Thu, 26 Jun 2025 16:20:23 +0100
Message-Id: <20250626152023.192347-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, smostafa@google.com, qperret@google.com, r09922117@csie.ntu.edu.tw, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_082034_968710_19661AE0 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

Another week, another set of fixes. Nothing major this time: allow
pKVM to fail to initialise without taking the host down, make sure we
are not mapping too much in the host S2 (another pKVM special), and a
brown-paper-bag quality bug fix on the nested GICv3 emulation.

Please pull,

	M.

The following changes since commit 04c5355b2a94ff3191ce63ab035fb7f04d036869:

  KVM: arm64: VHE: Centralize ISBs when returning to host (2025-06-19 13:34:59 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.16-4

for you to fetch changes up to 0e02219f9cf4f0c0aa3dbf3c820e6612bf3f0c8c:

  KVM: arm64: Don't free hyp pages with pKVM on GICv2 (2025-06-26 11:39:15 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 6.16, take #4

- Gracefully fail initialising pKVM if the interrupt controller isn't
  GICv3

- Also gracefully fail initialising pKVM if the carveout allocation
  fails

- Fix the computing of the minimum MMIO range required for the host on
  stage-2 fault

- Fix the generation of the GICv3 Maintenance Interrupt in nested mode

----------------------------------------------------------------
Mostafa Saleh (1):
      KVM: arm64: Fix error path in init_hyp_mode()

Quentin Perret (2):
      KVM: arm64: Adjust range correctly during host stage-2 faults
      KVM: arm64: Don't free hyp pages with pKVM on GICv2

Wei-Lin Chang (1):
      KVM: arm64: nv: Fix MI line level calculation in vgic_v3_nested_update_mi()

 arch/arm64/kvm/arm.c                  | 12 ++++++++++--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 20 ++++++++++++--------
 arch/arm64/kvm/vgic/vgic-v3-nested.c  |  4 +---
 3 files changed, 23 insertions(+), 13 deletions(-)

