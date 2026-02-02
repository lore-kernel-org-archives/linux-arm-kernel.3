Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BF0E7DF19
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gcAiNTzzkOD3XmIXXUYu858AtJFJ7SZUAL5n8LDbmng=; b=O78wyBkDtyIpN+vQiI/BszzivU
	dNjXDQa+XtZjoh3n84N5THXQjUDFn9cpJhJox7z5x7SB4b3C8JIK5BPtPmnQg9/cv4jtfDUdv8Fai
	DP8OC9tkN1jC7fhcg8LM8hAcDzXeNsee8Oiu/saf8VAEMDpu1HLnVElOgVjcQxhRPrF2xyUDk8puK
	nBBwBxD5gwwcHHtYWIFFCOprjjvKWrLU2+LhcrsqRcDm3YCEiE62alBUC3Nr9GfEDA7M39et/y5+M
	MFm1xWWtrNIIdAXY8H8LbQBRwtLMIL0ryKkHg7SIRMRDCLDGs2cXE2Df8BvFpN4h+ZxPBjg1J/+45
	T8TwlaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytk-00000005Qzy-0AjD;
	Mon, 02 Feb 2026 18:43:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyti-00000005Qxm-1Ux6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79BE860010;
	Mon,  2 Feb 2026 18:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290C7C116C6;
	Mon,  2 Feb 2026 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057821;
	bh=bLqTU9IRK/P5BfC/WRSUY7H5idKZKHvYB30haHzcFsY=;
	h=From:To:Cc:Subject:Date:From;
	b=QIDroI2uQ5KwG245M83Ix7pyJM85+KNclxYYYMlvZgjw3hU9fdYeLCAUchfYXa4Nd
	 OJ4jSSog6RjK8vKlOURzvc3Q62NLi+euYjlYWl6sNRdUCrkadO4J8yDol6fJwTGuxG
	 O0/W9dWzDhegPlbkwQ9GApjTp7XoPbkpD3qkWJ1WKPjJ1et9DqD0C9zolKhKzPHrCJ
	 5r4VKXPjOQz06l0m21MWLg6cp5Z6ZmzIE3R7hFk5qs9/tAndKCs5P7mmHYI78K2pAb
	 kYAUpYWChP1k0ffjQzIH2CXx5hmgf1XYYG7YRzaTIg/p4DqsksDRo4cQm472tq6jrS
	 88OHKUMRebV9Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmyte-00000007sAy-2ppV;
	Mon, 02 Feb 2026 18:43:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 00/20] KVM: arm64: Generalise RESx handling
Date: Mon,  2 Feb 2026 18:43:09 +0000
Message-ID: <20260202184329.2724080-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
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

Having spent some time dealing with some dark corners of the
architecture, I have realised that our RESx handling is a bit patchy.
Specially when it comes to RES1 bits, which are not clearly defined in
config.c, and rely on band-aids such as FIXED_VALUE.

This series takes the excuse of adding SCTLR_EL2 sanitisation to bite
the bullet and pursue several goals:

- clearly define bits that are RES1 when a feature is absent

- have a unified data structure to manage both RES0 and RES1 bits

- deal with the annoying complexity of some features being
  conditioned on E2H==1

- allow a single bit to take different RESx values depending on the
  value of E2H

This allows quite a bit of cleanup, including the total removal of the
FIXED_VALUE horror, which was always a bizarre construct. We also get
a new debugfs file to introspect the RESx settings for a given guest.

Overall, this lowers the complexity of expressing the configuration
constraints, for very little code (most of the extra lines are
introduced by the debugfs stuff, and SCTLR_EL2 being added to the
sysreg file).

Patches on top of my kvm-arm64/vtcr branch (which is currently
simmering in -next).

* From v1 [1]

  - Simplified RES0 handling by dropping the RES0_WHEN_E2Hx macros

  - Cleaned up the kvm_{g,s}et_sysreg_resx() helpers

  - Simplified dynamic RESx handling

  - New improved debugfs handling, thanks to Fuad!

  - Various clean-ups and spelling fixes

  - Collected RBs (thanks Fuad and Joey!)

[1] https://lore.kernel.org/all/20260126121655.1641736-1-maz@kernel.org
Marc Zyngier (20):
  arm64: Convert SCTLR_EL2 to sysreg infrastructure
  KVM: arm64: Remove duplicate configuration for SCTLR_EL1.{EE,E0E}
  KVM: arm64: Introduce standalone FGU computing primitive
  KVM: arm64: Introduce data structure tracking both RES0 and RES1 bits
  KVM: arm64: Extend unified RESx handling to runtime sanitisation
  KVM: arm64: Inherit RESx bits from FGT register descriptors
  KVM: arm64: Allow RES1 bits to be inferred from configuration
  KVM: arm64: Correctly handle SCTLR_EL1 RES1 bits for unsupported
    features
  KVM: arm64: Convert HCR_EL2.RW to AS_RES1
  KVM: arm64: Simplify FIXED_VALUE handling
  KVM: arm64: Add REQUIRES_E2H1 constraint as configuration flags
  KVM: arm64: Add RES1_WHEN_E2Hx constraints as configuration flags
  KVM: arm64: Move RESx into individual register descriptors
  KVM: arm64: Simplify handling of HCR_EL2.E2H RESx
  KVM: arm64: Get rid of FIXED_VALUE altogether
  KVM: arm64: Simplify handling of full register invalid constraint
  KVM: arm64: Remove all traces of FEAT_TME
  KVM: arm64: Remove all traces of HCR_EL2.MIOCNCE
  KVM: arm64: Add sanitisation to SCTLR_EL2
  KVM: arm64: Add debugfs file dumping computed RESx values

 arch/arm64/include/asm/kvm_host.h             |  38 +-
 arch/arm64/include/asm/sysreg.h               |   7 -
 arch/arm64/kvm/config.c                       | 427 ++++++++++--------
 arch/arm64/kvm/emulate-nested.c               |  10 +-
 arch/arm64/kvm/nested.c                       | 151 +++----
 arch/arm64/kvm/sys_regs.c                     |  68 +++
 arch/arm64/tools/sysreg                       |  82 +++-
 tools/arch/arm64/include/asm/sysreg.h         |   6 -
 tools/perf/Documentation/perf-arm-spe.txt     |   1 -
 .../testing/selftests/kvm/arm64/set_id_regs.c |   1 -
 10 files changed, 478 insertions(+), 313 deletions(-)

-- 
2.47.3


