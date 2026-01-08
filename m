Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3C4D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h872DOEtapaXIlBPV2pqF6RDcMUBYWqmr5AVhHu044s=; b=gmyqKdN7q/j0xie6sqtnsqVrQU
	vpV33uS4Bu778thgw8c0eBVNEn/+Q0/om6Nwqropd3Xx3CikKG15PlwLhAYcXRWcjXc3Hcf5px7ck
	E2ZFZtBsElCS3sS9nEd+uujaji6aXUC+g7REuz9o5l8I5xENx+ufRWBl75U/T2od8jhmu05U6i50H
	lxjUhR0RaeBF8z9gIFMzdF7MlgtJG9xiktq3p/C1s4DwZSYs7cNw4QszGL4yiu4btONjai+P2Tq6N
	rUMhf7QNH92JRnjSaIr2lXSknfQ6RL8G6y/lVSWFWWwC7i/IBJ2YFukTBP1IIDlADkkC0Jvivr5Lx
	XmjpU0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsK-00000000PTk-2u3w;
	Thu, 08 Jan 2026 17:32:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsF-00000000POs-3VvK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC5C4440B8;
	Thu,  8 Jan 2026 17:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B720DC116D0;
	Thu,  8 Jan 2026 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893558;
	bh=UuRofox7XCb3cdDnaXYj1PeEoLZTYke+qDQbE9WjKss=;
	h=From:To:Cc:Subject:Date:From;
	b=JiJt+5uTJRHY+HzgL59bmQ7c5gOnf1B0TMmN02RUEQ7L7TYrfHPVYCp1oZcE4PBYW
	 EojDLf1Fr+MvQ1T8LttAIXhi2Nyx80mSMpMMiSmpaCCOvpt7OP6ms7b8EdmGAs0vxD
	 obJBe+oW959zSElfZbJINoO8iaR17Q/bxhemsKTQuVJuzw0/jL1m1xkOQvTanrYpGq
	 UEOv+KiYIAfD79S739XVbpCkh5VWmOYSnemuIwOvYBz6kdUO0FBPAyhfBvN4pV+/EM
	 +K2ySN+jhBDJzRvGfidkNUs4SctFmg0MAYha4LUChXNmE/Ekj6eISVYhuAfC8WxxH+
	 q/tmq6MoHNhCA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdtsC-00000000W9F-1ORF;
	Thu, 08 Jan 2026 17:32:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v4 0/9] KVM: arm64: Add support for FEAT_IDST
Date: Thu,  8 Jan 2026 17:32:24 +0000
Message-ID: <20260108173233.2911955-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093239_923244_305CDB8F 
X-CRM114-Status: GOOD (  15.29  )
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

FEAT_IDST appeared in ARMv8.4, and allows ID registers to be trapped
if they are not implemented. This only concerns 3 registers (GMID_EL1,
CCSIDR2_EL1 and SMIDR_EL1), which are part of features that may not be
exposed to the guest even if present on the host.

For these registers, the HW should report them with EC=0x18, even if
the feature isn't implemented.

Add support for this feature by handling these registers in a specific
way and implementing GMID_EL1 support in the process. A very basic
selftest checks that these registers behave as expected.

* From v3: [3]

  - Added ID_AA64MMFR2_EL1.IDS == EL3 (Ben)

  - Introduced in_feat_id_space() helper (Yao)

  - Collected RBs, with thanks

* From v2: [2]

  - Repainted ID_AA64MMFR2_EL1.IDS description (Oliver)

  - Made the IDST handling more generic in the core KVM code, which
    resulted in the series being restructured a bit

  - Added handling to pKVM (in a slightly different way, as pKVM
    insist on seeing a full enumeration of the trapped registers)

  - Some cleanups

  - Collected RBs, with thanks

* From v1: [1]

  - Fixed commit message in patch #4 (Ben)

  - Collected RB, with thanks (Joey)

[1] https://lore.kernel.org/r/20251120133202.2037803-1-maz@kernel.org
[2] https://lore.kernel.org/r/20251126155951.1146317-1-maz@kernel.org
[3] https://lore.kernel.org/r/20251204094806.3846619-1-maz@kernel.org

Marc Zyngier (9):
  arm64: Repaint ID_AA64MMFR2_EL1.IDS description
  KVM: arm64: Add trap routing for GMID_EL1
  KVM: arm64: Add a generic synchronous exception injection primitive
  KVM: arm64: Handle FEAT_IDST for sysregs without specific handlers
  KVM: arm64: Handle CSSIDR2_EL1 and SMIDR_EL1 in a generic way
  KVM: arm64: Force trap of GMID_EL1 when the guest doesn't have MTE
  KVM: arm64: pkvm: Add a generic synchronous exception injection
    primitive
  KVM: arm64: pkvm: Report optional ID register traps with a 0x18
    syndrome
  KVM: arm64: selftests: Add a test for FEAT_IDST

 arch/arm64/include/asm/kvm_emulate.h          |   1 +
 arch/arm64/kvm/emulate-nested.c               |  21 ++++
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            |  39 ++++--
 arch/arm64/kvm/inject_fault.c                 |  10 +-
 arch/arm64/kvm/sys_regs.c                     |   4 +-
 arch/arm64/kvm/sys_regs.h                     |  10 ++
 arch/arm64/tools/sysreg                       |   7 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/arm64/idreg-idst.c  | 117 ++++++++++++++++++
 9 files changed, 194 insertions(+), 16 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/idreg-idst.c

-- 
2.47.3


