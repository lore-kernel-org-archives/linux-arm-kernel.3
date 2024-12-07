Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CA5E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 19:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v71tHQ+/iabRkp3Ln85j4Uu2dNQivNNldEgt9GFkwYE=; b=C0CvPqK1RZwT3PXWpF/wHKO7s6
	CgkyJ/BEoViWPLoS0nWMhmjO7LfZdkWOMCZ/dyupUCSreaSti6lVLk6dkVgpiTqB3mKM5u5MbJSwR
	37BX7kfaLWy8qhw5C2KVX0Od9HpkLIZsWljT2/7R4+H7DNAg155nh+DRqO+FYPvwEJyEzFpNfc5Sf
	gjJHUAcV+iw2xLBS2ka0fNTqPU+oU54tQtIjF7SM39EvqxdhwK4np7p0zAefIn9cN1g81Gss+3JYw
	ggZcLwHUHynLlxiFV7wFdQ0aL56ZcIJQRaj4Y4oc6sS8q/BRqJdpknd0bm9ygVyZtCtmydi/hFgeV
	EX2UglNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK0Dz-00000004IfU-432x;
	Sat, 07 Dec 2024 19:12:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK09y-00000004IKY-0ze1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 19:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F39D95C0831;
	Sat,  7 Dec 2024 19:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39180C4CECD;
	Sat,  7 Dec 2024 19:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733598488;
	bh=0j8vGZ36dxNbKwWwiSrTlZRlNfkcvdeaJx1lNvFy98k=;
	h=From:To:Cc:Subject:Date:From;
	b=cj1tQVA/BPJZfPrBqbmzM2KpgqILpeBNeIWW9kHkz9yumzqeIA4LwgO+VSZ2Z/pMC
	 loNuKDimZlXvHLfsEhKMu+8s9FAqhDuejcKVDJHhrkL9YFIdEEiY9qJ+AXIKgca6zA
	 Duyg0h8BQIlvyuQeZV9FNvLqEu9vGwjHwtMZIziTO/HdvCnK/Yq25Ol5qWTdgmoQOX
	 fcvX7g0VXwUiwZ8UJcSpYiK1OLKSkEhbdh8b/u9PaE2J0fxU4Ez4rJh/aoj498vDUD
	 b9ihZ1PKq9lZz/CIHh2TJt2ajTNfPA+xDdEVHHCrw9lBEfEGp4sqTH2mtlZ7NmkMb/
	 h5XzS212VWUQw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tK09t-001TOc-Rb;
	Sat, 07 Dec 2024 19:08:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/4] arm64/sysreg: Get rid of *_ELx as fields for EL12 accessors
Date: Sat,  7 Dec 2024 19:07:36 +0000
Message-Id: <20241207190740.2607673-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_110810_359473_589F576F 
X-CRM114-Status: GOOD (  10.90  )
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

We keep adding *_ELx definition to the sysreg as an abstraction for
the mapping between an EL1 register and its EL12 counterpart.

But nothing in the architecture has these ELx suffixes to describe
such abstraction. When they are mentioned, it always is as a shortcut
for EL1, EL2 or EL3, and never for EL12. That's because *_EL12 are
*not* registers. They are accessors, nothing else. So what we
currently have is not only bizarre, it is actively wrong.

This small series aims are injecting some sanity, by explicitly
describing EL12 registers as mappings to EL1 registers, and keeping
the ELx description as fields for the EL{1,2} registers.

Marc Zyngier (4):
  arm64/sysreg: Allow a 'Mapping' descriptor for system registers
  arm64/sysreg: Get rid of the TCR2_EL1x SysregFields
  arm64/sysreg: Convert *_EL12 accessors to Mapping
  arm64/sysreg: Get rid of CPACR_ELx SysregFields

 arch/arm64/include/asm/el2_setup.h      |  6 ++--
 arch/arm64/include/asm/kvm_arm.h        |  2 --
 arch/arm64/include/asm/kvm_emulate.h    | 40 ++++++++++++-------------
 arch/arm64/include/asm/kvm_nested.h     |  8 ++---
 arch/arm64/kernel/cpufeature.c          |  4 +--
 arch/arm64/kvm/at.c                     |  6 ++--
 arch/arm64/kvm/emulate-nested.c         |  2 +-
 arch/arm64/kvm/fpsimd.c                 |  2 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h |  4 +--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  4 +--
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c        |  6 ++--
 arch/arm64/kvm/hyp/vhe/switch.c         | 16 +++++-----
 arch/arm64/mm/proc.S                    |  5 ++--
 arch/arm64/tools/gen-sysreg.awk         |  2 +-
 arch/arm64/tools/sysreg                 | 39 ++++++++++++------------
 16 files changed, 73 insertions(+), 75 deletions(-)

-- 
2.39.2


