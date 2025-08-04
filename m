Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29009C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UYNkJg56cA4axAoCTrDMhUb+Z/cKKircXTD3amVyrC0=; b=l8i+4nqTExSavngy8LNX6iqa5l
	h2y0fz8KyQINq/QXVI8qr2uN81IjWoe0uJ9V8I87h2LKAdO4OKh7Q5kdkFHnPLqiAyZ2RHmEYCuMr
	i0v7uYeMywfB7tYXPVsYApm0MpnoyAjWpvgbJ+bimS5iv3kaHg/euKyhzzAHzL7PGdMOSuvfXFV14
	N2LPA1cwwwZnT8OLwD3xgqMq6Omq4qDwYWB1JOUy8aTD6KEq7pnfAyHdR4fLuqV6L8cgWcLOdFnh1
	D1OH/tcWMq/acFl8TJNOXSSUva4RUivNOsfTl71i9Ugmjg8tlZt539X3qsR+T7zkW3BKO1Riwvpq/
	YbdEhywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuCf-0000000AMWs-3zH7;
	Mon, 04 Aug 2025 12:22:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiu8C-0000000ALlB-3W21
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 12:17:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01291150C;
	Mon,  4 Aug 2025 05:17:22 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D8BB3F738;
	Mon,  4 Aug 2025 05:17:26 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	ry111@xry111.site,
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
	suzuki.poulose@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 00/11] support SCTLR2_ELx
Date: Mon,  4 Aug 2025 13:17:13 +0100
Message-Id: <20250804121724.3681531-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_051732_916102_0E6191CD 
X-CRM114-Status: UNSURE (   9.45  )
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

Currently, Linux has no strict need to modify SCTLR2_ELx—
at least assuming that firmware initializes
these registers to reasonable defaults.

However, several upcoming architectural features will require configuring
control bits in these registers.
Notable examples include FEAT_PAuth_LR and FEAT_CPA2.

This series is based on v6.16 and probably KVM-safe but
Not tested yet:
  - nVHE boot.

Yeoreum Yun (11):
  arm64/sysreg: add system registers SCTLR2_EL2
  arm64: make SCTLR2_EL1 accessible
  arm64: initialise SCTLR2_ELx register at boot time
  arm64: cpufeature: add FEAT_SCTLR2 feature
  arm64: save/restore SCTLR2_EL1 when cpu_suspend()/resume()
  arm64: init SCTLR2_EL1 at cpu_soft_restart()
  arm64: make the per-task SCTLR2_EL1
  KVM: arm64: initialise SCTLR2_EL1 at __kvm_host_psci_cpu_entry()
  KVM: arm64: support SCTLR2_EL1 for guest
  KVM: arm64: nv: support SCTLR2_ELx on nv
  KVM: arm64: expose FEAT_SCTLR2 feature to guest

 arch/arm64/include/asm/el2_setup.h         | 14 +++++++++++-
 arch/arm64/include/asm/kvm_host.h          |  7 ++++++
 arch/arm64/include/asm/processor.h         |  5 +++++
 arch/arm64/include/asm/suspend.h           |  2 +-
 arch/arm64/include/asm/sysreg.h            | 22 ++++++++++++++++++
 arch/arm64/include/asm/vncr_mapping.h      |  1 +
 arch/arm64/kernel/cpu-reset.S              |  6 +++++
 arch/arm64/kernel/cpufeature.c             |  8 +++++++
 arch/arm64/kernel/head.S                   |  5 ++++-
 arch/arm64/kernel/process.c                |  9 ++++++++
 arch/arm64/kvm/emulate-nested.c            |  2 ++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 16 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/psci-relay.c       |  3 +++
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c         |  6 +++++
 arch/arm64/kvm/nested.c                    | 13 +++++++++++
 arch/arm64/kvm/sys_regs.c                  | 25 +++++++++++++++++++--
 arch/arm64/mm/proc.S                       | 26 +++++++++++++++-------
 arch/arm64/tools/cpucaps                   |  1 +
 arch/arm64/tools/sysreg                    | 17 ++++++++++++++
 19 files changed, 175 insertions(+), 13 deletions(-)


base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


