Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A42CF65E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N1MTMacPrjgv5Jfh+zveGyXFfX4XsD0MwqFQwkQwE+w=; b=ZQRMN/ZKO8jgAhIvDOloVslA4X
	dltzQ83r9eHgxe4H5/5ySMGfvHni4+Gslw0bskE9ktgBSzsYG20iRDFPdvtCDGUTGL2S4Yd/p1XQ3
	BjiMq8bYOqXeN4CqN9FZkWK+IEibvA3zHivobdzV/u8y7AGa3HY5aOCmFXc4XPeRC+Tf3DxSI01E+
	f4mreqO4pmaW4Dm0pv1QqmO7A7K988vsYyO5t/e8ayP0RJCEZ1KrBHyzc6V6XxCxOlUtZ7dIaJr3w
	fVvvo1q56wZGwQLgVuHjosJ1wUQQ3FLR8c9WP2bpeWmt5oP5IsAVYGuV4QrxQvcTUNtKZ3M6O+T9q
	I3OX75Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXR-0000000CV0V-0deP;
	Mon, 26 Jan 2026 12:17:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXD-0000000CUqz-0Wnp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 064E044202;
	Mon, 26 Jan 2026 12:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C87C19422;
	Mon, 26 Jan 2026 12:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429853;
	bh=uc5X5aKabC+jCw4M1h0zdw2/00NHc+cDLz/jTFu+bto=;
	h=From:To:Cc:Subject:Date:From;
	b=azV2pcb36iRUs7IUKxkq3qU4RgLIqeHxfaQhDga1WIrF550NnLHv9AbgFlLynA20c
	 7uM0PuXkGrohnpB8g2Y/uHLdtW4ZeIyJQLIo0XPsAHRoJiX46hELd1HyA0kCE1uLms
	 stnJ4fkdKEcgvdxyrbe5zZdkWsO6CrTdg4BOrkpQCeAbV3Bg6QRtfN76MCUY+tqxuK
	 o8PDmGB5R8ZFbnkEpNhBqzcGfYpdbXtmc4Y5EENLCMVjlFp44nVdT1Ro+7SZEcc4xc
	 gIyvwBNZx2DLCQ0ybb7gxkH6OPSprIQ0ayuCT51XMg8fXB4bQIkRzWhJNyFmlBtrDz
	 U8WHYCoWclOeQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLX9-00000005hx6-2B8p;
	Mon, 26 Jan 2026 12:17:31 +0000
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
Subject: [PATCH 00/20] KVM: arm64: Generalise RESx handling
Date: Mon, 26 Jan 2026 12:16:34 +0000
Message-ID: <20260126121655.1641736-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041735_203431_57A471CE 
X-CRM114-Status: GOOD (  13.02  )
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
  KVM: arm64: Add RESx_WHEN_E2Hx constraints as configuration flags
  KVM: arm64: Move RESx into individual register descriptors
  KVM: arm64: Simplify handling of HCR_EL2.E2H RESx
  KVM: arm64: Get rid of FIXED_VALUE altogether
  KVM: arm64: Simplify handling of full register invalid constraint
  KVM: arm64: Remove all traces of FEAT_TME
  KVM: arm64: Remove all traces of HCR_EL2.MIOCNCE
  KVM: arm64: Add sanitisation to SCTLR_EL2
  KVM: arm64: Add debugfs file dumping computed RESx values

 arch/arm64/include/asm/kvm_host.h             |  33 +-
 arch/arm64/include/asm/sysreg.h               |   7 -
 arch/arm64/kvm/config.c                       | 430 ++++++++++--------
 arch/arm64/kvm/emulate-nested.c               |  10 +-
 arch/arm64/kvm/nested.c                       | 151 +++---
 arch/arm64/kvm/sys_regs.c                     |  98 ++++
 arch/arm64/tools/sysreg                       |  82 +++-
 tools/arch/arm64/include/asm/sysreg.h         |   6 -
 tools/perf/Documentation/perf-arm-spe.txt     |   1 -
 .../testing/selftests/kvm/arm64/set_id_regs.c |   1 -
 10 files changed, 510 insertions(+), 309 deletions(-)

-- 
2.47.3


