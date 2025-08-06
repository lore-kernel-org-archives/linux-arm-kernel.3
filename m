Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC6AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 16:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lXRcUrjjbwrNQI4p/Mv9FLaifo6I++QGSsJpsGE4zpA=; b=JDPyoZdSU7EQYpyKucU4fGtkXJ
	fPdB3y1pgUlIMFqVbgHYR8z/70npWJnHNR+bLpBKvY8VYHmHXnIVCS+sWELKA5Nu0gjFVTd7VfplF
	yQCodpr369g5FUdPen9s9feB80ZcQuFybMhj0Mc7lw7wDbcxwlan6vTSukaJKWCLpUElDHEDk8YvP
	1b3UqVssBu+CxvPF6SopZXM4b2CdkBbtGn1/ZRYyoX2ghb5mT9iDcFd47SVawJiV4mf7znWjjoGYC
	/3D0/JRnU5e8XzsrbrIbElH09vIu8OuITCbBz9nZchrrOTo731X2v86+t1DVSi86bDZv3lZ5JE0FU
	rd5ewwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhTo-0000000FpTH-0Lfs;
	Wed, 06 Aug 2025 16:59:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhRG-0000000Fop7-3J1t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 16:56:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CB79601FF;
	Wed,  6 Aug 2025 16:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F14C4CEE7;
	Wed,  6 Aug 2025 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754499389;
	bh=nAgxQxMg7fSf4u6ys2lhhQQPPEUWlRT0i7ib+oOcq9g=;
	h=From:To:Cc:Subject:Date:From;
	b=LSMkU25Z5/Drk3O9ryMexaEg+Y4nJBkF9Ju3k285DSVia4hDolFL3uud7vi9gksGy
	 8JaqrPsOkBgdx1d9pVfhPXsKIsAk2pGCxJaOl+fotiLStZsrOuiIWHWymyvjAiyBsr
	 XBS6QzjIJ69HE9t9XZRR+mVzJrBDD+LUy26Sk5KbGmpU1MYeeUO9xkIka3KBp4MV0h
	 jsFogfu1k0hnSe/RQnhV+3hif6+kIHHBeFROucplfJrVl8uTxlIF2qcp0ZkfyrbeCA
	 LRWmI9ZpyOO03UPHhgN2QZvOltWlOuUZmLpk4II3TwjZJhoIQk2cwJj0avjEKePWa3
	 FeR5I3eCWVUIA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ujhRD-004ZQV-FN;
	Wed, 06 Aug 2025 17:56:27 +0100
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
Subject: [PATCH v2 0/5] KVM: arm64: FEAT_RASv1p1 support and RAS selection
Date: Wed,  6 Aug 2025 17:56:10 +0100
Message-Id: <20250806165615.1513164-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, cohuck@redhat.com
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

This is the next iteration of this series trying to plug some of our
RAS holes (no pun intended...). See [1] for the original series.

Patches on top of kvmarm-6.17.

* From v1 [1]:

  - Bunch of patches picked by Oliver (thanks!)

  - Added missing SYS_ERXMISC{2,3}_EL1 from the list of handled RAS
    registers

 - Added some rationale about the advertising of RASv1p1 (Cornelia)

  - Picked AB from Catalin (thanks!)

[1] https://lore.kernel.org/kvmarm/20250721101955.535159-1-maz@kernel.org

Marc Zyngier (5):
  arm64: Add capability denoting FEAT_RASv1p1
  KVM: arm64: Handle RASv1p1 registers
  KVM: arm64: Ignore HCR_EL2.FIEN set by L1 guest's EL2
  KVM: arm64: Expose FEAT_RASv1p1 in a canonical manner
  KVM: arm64: Make ID_AA64PFR0_EL1.RAS writable

 arch/arm64/kernel/cpufeature.c  | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/hyp/vhe/switch.c |  5 ++++-
 arch/arm64/kvm/sys_regs.c       | 30 +++++++++++++++++++++++++++++-
 arch/arm64/tools/cpucaps        |  1 +
 4 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.39.2


