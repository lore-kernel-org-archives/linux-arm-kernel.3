Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0096E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1uHb50FOhT2sTQYD19MyVnsJSrtzbLh2XTjkI9oZ81k=; b=dDZVWdaQSHxyLVB5ns+C55GWta
	PdhMRnTv51O430J8NFrWrdOARJ57Yz2vedr6wdIrLuC2SM1sdGJOkg8w5do3L3or3pJgPKaN8SJ9p
	3CzlvUtqOTAsSbMjHrZIioof1t1k2wNqtK6XRrwaFGxMMTZ5vIVBCqPul3uszWWOaP50/neU9/BpJ
	k0Mp+D+3B6c14XPKNpWjEjwcRlJHNPudXa9A4pbawjX8S0DnXj5lNmJOyyELq3S/VC1Eqre95LpKy
	6EHBra6i1SH2JkfbFH9XJDzYVZNDO5rhy1VhHTkT4g/Hx22hv2UlSsvqzQdtDAQ1iacP/TPkrMAYo
	dARNNS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKXu-00000002bQN-3ZTM;
	Thu, 19 Dec 2024 17:42:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKPR-00000002Zo0-0RCu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B2C85C647C;
	Thu, 19 Dec 2024 17:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5E4C4CED4;
	Thu, 19 Dec 2024 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734629640;
	bh=QZmElIefHd/oEum8VNselLfsNxqkON0BuYmRcf8dbh0=;
	h=From:To:Cc:Subject:Date:From;
	b=MK4G+wn8GF8g2vSEjXQEUJNP4JuCWiDCTw7shy5AE77JF2OcDeMmDFS5yborql6VT
	 3m1itFmskKXZHyYGT/PtdZw7YILc6/Nx+FhfigLPnqYvrtVqcJxZbRWgcr9nL1Y6mO
	 pbnjAPgWYwWoncexDxR1WxCINi2X5dodbsnsqzyEEQ/CO/uwgUqza5Pt+gcAMTVw6I
	 znqLcuSJX57syNk5oxKMmR7d3efdWqZZSGWZRXL8WzBbpn105I0lQBnpm+c17iz/yU
	 do4UlBlWn7p1z/l7NcduWrqUxcjhBtKb2A5CXrIIFDvMGANJVqsuroXco+yJ314pD1
	 57q+YHlet9q/g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tOKPO-005Lao-8W;
	Thu, 19 Dec 2024 17:33:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/4] arm64/sysreg: Get rid of *_ELx as fields for EL12 accessors
Date: Thu, 19 Dec 2024 17:33:46 +0000
Message-Id: <20241219173351.1123087-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_093401_186843_4DD31ABD 
X-CRM114-Status: GOOD (  12.82  )
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

* From v1:

  - Fixed the description in the first patch following Mark's proposal

  - Couple of spelling funnies being fixed

  - Collected Acks and RBs.

Marc Zyngier (4):
  arm64/sysreg: Allow a 'Mapping' descriptor for system registers
  arm64/sysreg: Get rid of the TCR2_EL1x SysregFields
  arm64/sysreg: Convert *_EL12 accessors to Mapping
  arm64/sysreg: Get rid of CPACR_ELx SysregFields

 arch/arm64/include/asm/el2_setup.h      |  6 ++--
 arch/arm64/include/asm/kvm_arm.h        |  2 --
 arch/arm64/include/asm/kvm_emulate.h    | 40 +++++++++++-----------
 arch/arm64/include/asm/kvm_nested.h     |  8 ++---
 arch/arm64/kernel/cpufeature.c          |  4 +--
 arch/arm64/kvm/at.c                     |  6 ++--
 arch/arm64/kvm/emulate-nested.c         |  2 +-
 arch/arm64/kvm/fpsimd.c                 |  2 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h |  4 +--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  4 +--
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c        |  6 ++--
 arch/arm64/kvm/hyp/vhe/switch.c         | 16 ++++-----
 arch/arm64/mm/proc.S                    |  5 +--
 arch/arm64/tools/gen-sysreg.awk         |  2 +-
 arch/arm64/tools/sysreg                 | 44 ++++++++++++-------------
 16 files changed, 76 insertions(+), 77 deletions(-)

-- 
2.39.2


