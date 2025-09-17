Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B5ACAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oIJhxH6x0+caddNcoRZbQGV68C8Hc8sOrEwlX0LzJ9k=; b=n+j2eBaa16heEaL0QZZpt9e2KF
	ZIbrld9Ti+YJwvpoOyhzRNl+ofKF6sXqhYneLVLHxcRE24yQmW32k5XMQ09Fv/eY311ItWYRTQDIs
	kkE+jWHwVWHgrd2p7W1IIWGvfwHpX4WbFqrra6BHD1E47SRtmQKpCua7+QTwDbiVQSRL+QTP20zH2
	5MC0ZA6Dv8MGM5op6iWwiwV4qoaw+UCg0n9sfwyhn6A+VK26l5hO/nH1Mmcs0mi5lK01FKoHIst19
	tWky65j6Pqv9yHNs/7tI6ANOEF9YdyfRHG0AjpcawNxinloKteRzTxO3fcXoKTtr296Nj1ipjdw5C
	PVMM9q2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyta8-0000000CSG3-24sT;
	Wed, 17 Sep 2025 14:56:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyta5-0000000CSEL-1Ik3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:56:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1303267F;
	Wed, 17 Sep 2025 07:56:15 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A75023F66E;
	Wed, 17 Sep 2025 07:56:20 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	Dave.Martin@arm.com,
	ahmed.genidi@arm.com,
	kevin.brodsky@arm.com,
	scott@os.amperecomputing.com,
	mbenes@suse.cz,
	james.clark@linaro.org,
	frederic@kernel.org,
	rafael@kernel.org,
	pavel@kernel.org,
	ryan.roberts@arm.com,
	suzuki.poulose@arm.com,
	maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 0/6] initialize SCTRL2_ELx
Date: Wed, 17 Sep 2025 15:56:12 +0100
Message-Id: <20250917145618.1232329-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_075625_389047_9E405686 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

This series introduces initial support for the SCTLR2_ELx registers in Linux.
The feature is optional starting from ARMv8.8/ARMv9.3,
and becomes mandatory from ARMv8.9/ARMv9.4.

Currently, Linux has no strict need to modify SCTLR2_ELx--
at least assuming that firmware initializes
these registers to reasonable defaults.

However, several upcoming architectural features will require configuring
control bits in these registers.
Notable examples include FEAT_PAuth_LR and FEAT_CPA2.

Patch History
==============
from v4 to v5:
  - using .ifc in set_sctlr2_elx
  - change (re)initialise position after SCTLR_ELx
  - add docs for SCTRL2_ELx
  - rebase to v6.17-rc6
  - https://lore.kernel.org/all/20250821172408.2101870-1-yeoreum.yun@arm.com/

from v3 to v4:
  - integrate set_sctlr2_elx() and __set_sctlr2_elx() to set_sctlr2_elx()
    without isb()
  - fix the wrong register setting in set_sctlr2_elx().
  - add initialise SCTLR2_EL2 at HVC_SOFT_RESTART.
  - https://lore.kernel.org/all/20250813120118.3953541-1-yeoreum.yun@arm.com/

from v2 to v3:
  - rewrite commit messages.
  - fix missing SCTLR2_EL2 synchonization at boot.
  - merging the __kvm_host_psci_cpu_entry() changes into patch #1
  - https://lore.kernel.org/all/20250811163340.1561893-1-yeoreum.yun@arm.com/

from v1 to v2:
  - rebase to v6.17-rc1
  - https://lore.kernel.org/all/20250804121724.3681531-1-yeoreum.yun@arm.com/


Dave Martin (1):
  docs: arm64: Document booting requirements for FEAT_SCTLR2

Yeoreum Yun (5):
  arm64: make SCTLR2_EL1 accessible
  arm64: initialise SCTLR2_ELx register at boot time
  arm64: save/restore SCTLR2_EL1 when cpu_suspend()/resume()
  arm64: initialise SCTLR2_EL1 at cpu_soft_restart()
  arm64: make the per-task SCTLR2_EL1

 Documentation/arch/arm64/booting.rst | 10 ++++++++++
 arch/arm64/include/asm/assembler.h   | 15 +++++++++++++++
 arch/arm64/include/asm/el2_setup.h   | 17 +++++++++++++++--
 arch/arm64/include/asm/processor.h   |  3 +++
 arch/arm64/include/asm/suspend.h     |  2 +-
 arch/arm64/include/asm/sysreg.h      |  5 +++++
 arch/arm64/kernel/cpu-reset.S        |  3 +++
 arch/arm64/kernel/head.S             |  5 +++++
 arch/arm64/kernel/hyp-stub.S         | 13 +++++++++++++
 arch/arm64/kernel/process.c          |  9 +++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   |  3 +++
 arch/arm64/kvm/hyp/nvhe/psci-relay.c |  3 +++
 arch/arm64/mm/proc.S                 | 24 ++++++++++++++++--------
 13 files changed, 101 insertions(+), 11 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


