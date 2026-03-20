Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3480C108B8E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LNdSqHld6dMEoykJJ2lwPDlUweYtefFU4K770atCA+0=; b=cLi/9AfMDgHJKi5z89tnNw1skj
	ZsYdC+zNEMpNRXMY1zp7WK1JdTbJl21h0rm0Ju6QtK2av662ZXbywSQzPiy7BFVNPa2IEdYtWv4Mf
	GZCnJI1sBBgMPnjePRoXODRag546CGH+upHpkDWxpJxGtZ9XZrmMgol+b/we3efUNBo2OC2xE4rrC
	LUxv6gjTYxP/nKXD0vLvJWMgufsSgDnJm1UHjN+EA+64eEt1dLfuX6+aaUXWje8e61ZZwVmylYt4S
	Gu72xAVmCC0MvBRXTmijg+HxcqvUhIZLfHZAotKtYA0WNfmRz2wcYAGIQ+Ymvt8Uyf/1s8RKaHufZ
	P496LSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WMg-0000000CV9F-3Pbb;
	Fri, 20 Mar 2026 09:41:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WMf-0000000CV98-3oyd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C3E160127;
	Fri, 20 Mar 2026 09:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F8CC2BC9E;
	Fri, 20 Mar 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773999716;
	bh=soIqa4dzdt6xuh4ZUR/8xPfEZyQ1j13Pr9d2gnaHB40=;
	h=From:To:Cc:Subject:Date:From;
	b=sj6ciDui8CjDNSMD0/3hKM++txW1In4032U7a9Gzn/bDGyOjNKMCgRU3D+5g05h39
	 Wfymiq4JtDGYnblfss7lcCAlHbeYj3CQ2Cm/LtqjX3Os73oQj3a/V9SJwaRqWPRD2U
	 o4mWtVUONEKgc0MWCiPcV0sGPy9G1CkmcV6MNQ6nlDbEEd7ZsD/YV7qcefAC91Zn/8
	 WndxrHnvWRMPhAvRJr7+6qn7cdrDPAo8EoxCqEfSVpQWrtY+kX2Kk9R3Hb/dLVXtQl
	 Y8/TTr8eiaokutz4dJxgbOi4IrcPbmaLCcCSdq3x+zh4J6tng3pCtu7lf6pfrWqzIj
	 eWZ9H5XLp3reQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w3WMc-00000003xdR-1ILK;
	Fri, 20 Mar 2026 09:41:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.0, take #4
Date: Fri, 20 Mar 2026 09:41:51 +0000
Message-ID: <20260320094151.2541661-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, joey.gouly@arm.com, suzuki.poulose@arm.com, zenghui.yu@linux.dev, oupton@kernel.org, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org
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

Another week, another set of fixes. This time, another two fixes,
mostly observable with nested virt. The first one results in a vcpu
coming out of reset potentially skipping the first instruction at its
initial PC. The second one is a classic example of pointer arithmetic
going wrong in our address translation emulation, setting the access
bit in semi-random places. Both are stable candidates.

Please pull,

	M.

The following changes since commit a79f7b4aeb8e7562cd6dbf9c223e2c2a04b1a85f:

  KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on CPU hotplug (2026-03-10 09:48:45 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.0-4

for you to fetch changes up to 0496acc42fb51eee040b5170cec05cec41385540:

  KVM: arm64: Fix the descriptor address in __kvm_at_swap_desc() (2026-03-17 13:40:00 +0000)

----------------------------------------------------------------
KVM/arm64 fixes for 7.0, take #4

- Clear the pending exception state from a vcpu coming out of
  reset, as it could otherwise affect the first instruction
  executed in the guest.

- Fix the address translation emulation icode to set the Hardware
  Access bit on the correct PTE instead of some other location.

----------------------------------------------------------------
Marc Zyngier (1):
      KVM: arm64: Discard PC update state on vcpu reset

Zenghui Yu (Huawei) (1):
      KVM: arm64: Fix the descriptor address in __kvm_at_swap_desc()

 arch/arm64/kvm/at.c    |  2 +-
 arch/arm64/kvm/reset.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

