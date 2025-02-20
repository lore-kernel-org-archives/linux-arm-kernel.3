Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57530C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tKXN7MFjdZuUjVHfvfLC/4lobrg8VPSzlvJ5O+cLHwQ=; b=I/c3a1Uee3A18g9XDCHMw1aB8Y
	T6IzJuwUYri1le6yDnY2/SKoY3Dx0qFwaCMMxKUOFjmgGOoqzI0C4ZBUp1hiaU3X03JainMd4h7V/
	iOuQzTLVLjBt0hD0Oofo4RdLyQvSeRtZDdyWqaA4iwHM+nBzEqgZfDTlaQm1KnD+CwY4GJvuSkAch
	FXaBZtNU0julDD3lyce6xzkNUVouPi32o6Oba4y76vmYp3PBDFAt4TdOkOVaBzWM0j5ie4lRnZwNR
	8KUp9HHyO7kzCqWeVzvRB5hSzydlPzFr7oRWM2ayP9/JuR3CKxycWtro7SqAPczFHJPjS8Wa/IPvH
	et0jymzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAcV-00000002DAT-3Czk;
	Thu, 20 Feb 2025 17:45:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAaz-00000002Cdr-0WGJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 17D385C5EE1;
	Thu, 20 Feb 2025 17:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D8DC4CED1;
	Thu, 20 Feb 2025 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740073459;
	bh=JG9qAobTzeeNJhvrxW9wlpTi2Gx0CaoQMhNmfQShIEA=;
	h=From:To:Cc:Subject:Date:From;
	b=Uk2jw35ObtTTcxrptF2N88WVGFylhY2GEZlmBKieFMZC8RHGgcmyLDvZ8E05TlDjx
	 ZEFwUacTcTMXzvoYTkd+xqv2v6mG9o7IVQEjcVJNme+iDErOrMNDrT8EWo3E2UqjGL
	 ghzzM3LLFHaA02J676iF8uKFoQSk479xKBDiOw1jE3PNsq3pXkdV9pIb99hynzq+V+
	 pwmTlOszNT4vtYc3PmwxYhZbM1qgn+nkGXW49jGiGEU+m+j3UhTII6c+QJebY1ygB6
	 aaG5LbXp1O6RMuNLxE+JU4GFIf9Gki5b2XPmqsBvFC/LpnoFlJIuC0E16ySSCeTWgF
	 HAZJ1ixyiS26Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tlAau-006J9w-EF;
	Thu, 20 Feb 2025 17:44:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 6.14, take #3
Date: Thu, 20 Feb 2025 17:44:06 +0000
Message-Id: <20250220174406.749490-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, oliver.upton@linux.dev, vladimir.murzin@arm.com, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_094421_205676_7C44C15B 
X-CRM114-Status: GOOD (  10.04  )
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

Another week, another set of fixes.

This time around, we have a focus on MMU bugs, with one bug affecting
hVHE EL2 stage-1 and picking the ASID from the wrong register, while
the other affects VHE and allows it to run with a stale VMID value.

Either way, this is ugly.

Please pull,

	M.

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.14-3

for you to fetch changes up to fa808ed4e199ed17d878eb75b110bda30dd52434:

  KVM: arm64: Ensure a VMID is allocated before programming VTTBR_EL2 (2025-02-20 16:29:28 +0000)

----------------------------------------------------------------
KVM/arm64 fixes for 6.14, take #3

- Fix TCR_EL2 configuration to not use the ASID in TTBR1_EL2
  and not mess-up T1SZ/PS by using the HCR_EL2.E2H==0 layout.

- Bring back the VMID allocation to the vcpu_load phase, ensuring
  that we only setup VTTBR_EL2 once on VHE. This cures an ugly
  race that would lead to running with an unallocated VMID.

----------------------------------------------------------------
Oliver Upton (1):
      KVM: arm64: Ensure a VMID is allocated before programming VTTBR_EL2

Will Deacon (1):
      KVM: arm64: Fix tcr_el2 initialisation in hVHE mode

 arch/arm64/include/asm/kvm_arm.h  |  2 +-
 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/kvm/arm.c              | 37 +++++++++++++++++--------------------
 arch/arm64/kvm/vmid.c             | 11 +++--------
 4 files changed, 22 insertions(+), 30 deletions(-)

