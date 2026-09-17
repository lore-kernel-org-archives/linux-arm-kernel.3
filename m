Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28149C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sfgTjkTMc5KT6QQReeCBUecnTymzx5L9VFdHS6YdI9Y=; b=em9GYPYh/2fecnhv9ZCGG16Pad
	FAlilFbwORi8l7oPMWm6cMI3+Hlhg6saWLFJnMmcDMLTwo/ZRXRv4T1w2Y+fa9PkPdYvgO0oWgJIz
	B3CccOzOQ9AKkICWfDAb5gFyUWqHWDTDmdg1Fux2VJawibFLfOqwMiLjQelLauW48FyR2m6MJS8cE
	OC/XKWJFXFbDQWP05uxkO/nwGQ6eZxLlCQIxZeFhJITERzbkF4fjkaI5azuz9KDE4U4ZLQXOmeJZS
	ERZV47kNL51yi8/lTEyCFCyZtOTp5M0lGXtafIRY6kuHvXJT5+Ip68Td8PwgvrUXp4u/jCFRcQ2yL
	PVvfjmjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JsR-0000000CZnm-38tK;
	Thu, 17 Sep 2026 21:42:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JsP-0000000CZn8-3GaL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:42:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C2401476;
	Thu, 17 Sep 2026 14:42:36 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B91C53F7B4;
	Thu, 17 Sep 2026 14:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789681359; bh=gcbmT+sZ4SM4YBTJ+Ao+lynYhehA9kw/yxtrgAdddD8=;
	h=From:To:Cc:Subject:Date:From;
	b=K56y6lHPcLee/72BUwAqq3PYR11u7WIpJUa4yIA7oApC3+bPJFJdeKnrSl8WmrgrM
	 eniXASUwWeSOE4P2xEDc4AEvpJBYQiNWGLxMgvBW7sEt2b349ZnzYuyedBATuFQ1uF
	 FMX3V5zhRLQZcgzSgaW8Cb+4eyDxDmFg/WBwXjO8=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	James Clark <james.clark@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 0/4] KVM: arm64: Properly advertise !FEAT_LPA2 for NV
Date: Thu, 17 Sep 2026 22:42:10 +0100
Message-ID: <20260917214215.74135-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_144241_969606_B898B383 
X-CRM114-Status: GOOD (  12.65  )
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

Hi,

This v2 fixes a few naming and styling issues, collects Mark's
Reviewed-by tag, and adds Marc's TCR_EL2 reset patch [1]. Please see
details below.

* Changes from v1 [2]:

  - Renamed tcr_el2_vhe_* to vhe_tcr_el2_*, rename tcr_el2_nvhe_* to
    tcr_el2_* to better align with the TCR_EL2 macros. (Marc)

  - Added Marc's TCR_EL2 reset patch (thanks!).

  - Put each == comparison on one line. (Marc)

  - Added Fixes and Cc: stable tags to patch 1.

  - Collected Reviewed-by tag from Mark (thanks!).

Series based on v7.3-rc3.

Below is the same cover from v1:

Previously for NV FEAT_LPA2 is accidentally exposed to the guest at
stage-1 if hardware supports it. Stage-2 is correctly sanitised out in
ID_AA64MMFR0_EL1 but not stage-1. This is wrong on two fronts:

- There is no FEAT_LPA2 support for NV yet.
- It is non-architectural to advertise different FEAT_LPA2 support in
  stage-1 and stage-2.

This series first removes FEAT_LPA2 from TGRAN4, TGRAN16 for NV, to
present a !FEAT_LPA2 system. Then guest TCR_EL2 sanitisation is added,
to make the DS bit RES0 for NV guests. Note that this sanitisation
can't cover all cases, as we don't trap VHE L1 accesses to the vCPU's
TCR_EL2 via TCR_EL1.

TCR_EL2 sanitisation differs slightly from the AARCHMRS, please see the
commits for details.

For testing I booted a 4K 52-bit nVHE L1 and checked:
1. It is using 48-bit VAs in stage-1.
2. Writing 1 to TCR_EL2.DS and reading it back reads 0.

Thanks!

[1]: https://lore.kernel.org/kvmarm/86pkyk6us5.wl-maz@kernel.org/
[2]: https://lore.kernel.org/kvmarm/20260909222015.3046432-1-weilin.chang@arm.com/

Marc Zyngier (1):
  KVM: arm64: Reset TCR_EL2 according to guest's E2H mode

Wei-Lin Chang (3):
  KVM: arm64: nv: Don't advertise FEAT_LPA2 for guest stage-1
  arm64: sysreg: Add TCR_EL2 to sysreg infrastructure
  KVM: arm64: Convert TCR_EL2 to config-driven sanitisation

 arch/arm64/include/asm/kvm_arm.h  |  13 ----
 arch/arm64/include/asm/kvm_host.h |   2 +-
 arch/arm64/include/asm/sysreg.h   |   1 -
 arch/arm64/kvm/config.c           | 113 +++++++++++++++++++++++++++
 arch/arm64/kvm/nested.c           |  15 ++++
 arch/arm64/kvm/sys_regs.c         |  10 ++-
 arch/arm64/tools/sysreg           | 125 ++++++++++++++++++++++++++++++
 7 files changed, 263 insertions(+), 16 deletions(-)

-- 
2.43.0


