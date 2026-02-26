Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1334FFC5926
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5RZxa5HXOWbybOeMG67CMxQ3rKSc75rOXpOFnHKy+B8=; b=kHgA21pwbq6NwUziddly0/tQrU
	rRJjL0ay8K3MfDpaZlJT1Z2x1bGrkqO+IZkSvV8H76GMt+KwosgizSo1xWVaZHgukmElDalHucv5V
	jkPn/f9TIxObhJkPFgTX9FoD3PfNpwL4LIcqEmT+1ASvaRNNWdQRvRrhm2uoHlQ17eLtS8drYs554
	AwxcN1h4BUtuPY4Prfw60thcg8OL0gyahKSx3GHulrniPlCQ4z1aKbAqNFOBZEhRn7kWhiEbgf5AL
	qGGEYZbkojFNqTU7c/yEPjIVIWbVww4LTGnvTM2bfHmWv6r4AkK0vhDcNyJOt5jAt5u2uE8UWj7d8
	JG8EYtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYxb-00000005xkt-48AY;
	Thu, 26 Feb 2026 10:51:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYxb-00000005xkl-0lPi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 293E1600AA;
	Thu, 26 Feb 2026 10:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C381FC2BC9E;
	Thu, 26 Feb 2026 10:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772103069;
	bh=c2H9Qi49m5+C4KxTW0j8/WB4GcymfvOF1Dx3C8KYFFs=;
	h=From:To:Cc:Subject:Date:From;
	b=Eq0N/CcVRqyeonDZJrXv9xf3VwFC3Mrxsw0GwBo1up49FgA9c+Wv+Vdo0yenwTCM/
	 c7lUFm8KvlVKebR1w3mheBfxkQ+C9gadmCPvyhJg1KzY+CsACuJjyd7xR90llaFNnW
	 o/YRAfhqXTXF44ytY4W/xynrOigplzqcDObe8xIgASJc02kex8sdfkwLnrungkIk2A
	 tuVUBLKBur7cE+h9zRtE+6vzLKx+SHiEr3KtUyfiw2pKnDxyZIWXBNlqdjaQ0Si8aZ
	 3WTxHdG3WZH9tK/MeC7b1jMxRBLovlNNY1XF+8XHWq7eJByIZ/D3EU5SZUUHppwGEN
	 T6rX32Xvv4jIQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vvYxX-0000000E12u-3VQk;
	Thu, 26 Feb 2026 10:51:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Kees Cook <kees@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.0, take #1
Date: Thu, 26 Feb 2026 10:50:47 +0000
Message-ID: <20260226105048.28066-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, tabba@google.com, joey.gouly@arm.com, jonathan.cameron@huawei.com, kees@kernel.org, broonie@kernel.org, sascha.bischoff@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Here's the first set of KVM/arm64 fixes for 7.0. Most of it affects
pKVM (feature set, MMU), but we also have a GICv5 fix and a couple of
small cleanups. Details in the tag below.

Note that there is a very minor conflict with Linus' tree due to Kees'
patch having been applied to both trees. Whatever is in Linus' tree is
the right thing.

Please pull,

	M.

The following changes since commit 6316366129d2885fae07c2774f4b7ae0a45fb55d:

  Merge branch kvm-arm64/misc-6.20 into kvmarm-master/next (2026-02-05 09:17:58 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.0-1

for you to fetch changes up to 54e367cb94d6bef941bbc1132d9959dc73bd4b6f:

  KVM: arm64: Deduplicate ASID retrieval code (2026-02-25 12:19:33 +0000)

----------------------------------------------------------------
KVM/arm64 fixes for 7.0, take #1

- Make sure we don't leak any S1POE state from guest to guest when
  the feature is supported on the HW, but not enabled on the host

- Propagate the ID registers from the host into non-protected VMs
  managed by pKVM, ensuring that the guest sees the intended feature set

- Drop double kern_hyp_va() from unpin_host_sve_state(), which could
  bite us if we were to change kern_hyp_va() to not being idempotent

- Don't leak stage-2 mappings in protected mode

- Correctly align the faulting address when dealing with single page
  stage-2 mappings for PAGE_SIZE > 4kB

- Fix detection of virtualisation-capable GICv5 IRS, due to the
  maintainer being obviously fat fingered...

- Remove duplication of code retrieving the ASID for the purpose of
  S1 PT handling

- Fix slightly abusive const-ification in vgic_set_kvm_info()

----------------------------------------------------------------
Fuad Tabba (5):
      KVM: arm64: Hide S1POE from guests when not supported by the host
      KVM: arm64: Optimise away S1POE handling when not supported by host
      KVM: arm64: Fix ID register initialization for non-protected pKVM guests
      KVM: arm64: Remove redundant kern_hyp_va() in unpin_host_sve_state()
      KVM: arm64: Revert accidental drop of kvm_uninit_stage2_mmu() for non-NV VMs

Kees Cook (1):
      KVM: arm64: vgic: Handle const qualifier from gic_kvm_info allocation type

Marc Zyngier (2):
      KVM: arm64: Fix protected mode handling of pages larger than 4kB
      KVM: arm64: Deduplicate ASID retrieval code

Sascha Bischoff (1):
      irqchip/gic-v5: Fix inversion of IRS_IDR0.virt flag

 arch/arm64/include/asm/kvm_host.h   |  3 +-
 arch/arm64/include/asm/kvm_nested.h |  2 ++
 arch/arm64/kvm/at.c                 | 27 ++--------------
 arch/arm64/kvm/hyp/nvhe/pkvm.c      | 37 ++++++++++++++++++++--
 arch/arm64/kvm/mmu.c                | 12 +++----
 arch/arm64/kvm/nested.c             | 63 ++++++++++++++++++-------------------
 arch/arm64/kvm/sys_regs.c           |  3 ++
 arch/arm64/kvm/vgic/vgic-init.c     |  2 +-
 drivers/irqchip/irq-gic-v5-irs.c    |  2 +-
 9 files changed, 81 insertions(+), 70 deletions(-)

