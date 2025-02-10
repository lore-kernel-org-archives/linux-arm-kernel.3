Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B4DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YcfQoattcfAtqhYK+I0xVSz5YvJgMhhlIZULFz+ZEuM=; b=DSzFJS99iUV3kP/rvTsObcO2pW
	H1xZPMRVCkb0PTBhrgznxTUYD1MkzxnlOsM6Lj50k5GS6mdJcDBdjqPxapmAy10BCZf3H3OogIJ3d
	k40wUBI19ZmWh4akght21Qs9WDgIadug4CdWVEb+peyPr9OaF2xq+Yw9Gs8b9k1TdQH4KLJmwgT+8
	+WWoJRgjASkLwFkKL/DXlkIhACKVd7eyoSVzb5LBmO7ErpN1bQWp5hzP80771aH9GJG7esMCaj2GU
	7yFMJRt+jyS1shWIPYW5USjA2Q/VYDYOu04hRwn4cYGe8G1F4U1EJ9qAsSlA0kHSUlMPrevjgh3Zj
	I/wLUBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZr7-00000001EtT-1Dsb;
	Mon, 10 Feb 2025 19:54:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZpf-00000001EXm-210y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 19:52:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C86591477;
	Mon, 10 Feb 2025 11:52:57 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA34C3F58B;
	Mon, 10 Feb 2025 11:52:32 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	eauger@redhat.com,
	eric.auger@redhat.com,
	fweimer@redhat.com,
	jeremy.linton@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com,
	stable@vger.kernel.org,
	tabba@google.com,
	wilco.dijkstra@arm.com,
	will@kernel.org
Subject: [PATCH v3 0/8] KVM: arm64: FPSIMD/SVE/SME fixes
Date: Mon, 10 Feb 2025 19:52:18 +0000
Message-Id: <20250210195226.1215254-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_115239_603539_4C9A6D1F 
X-CRM114-Status: GOOD (  12.56  )
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

These patches fix some issues with the way KVM manages FPSIMD/SVE/SME
state. The series supersedes my earlier attempt at fixing the host SVE
state corruption issue:

  https://lore.kernel.org/linux-arm-kernel/20250121100026.3974971-1-mark.rutland@arm.com/

Patch 1 addresses the host SVE state corruption issue by always saving
and unbinding the host state when loading a vCPU, as discussed on the
earlier patch:

  https://lore.kernel.org/linux-arm-kernel/Z4--YuG5SWrP_pW7@J2N7QTR9R3/
  https://lore.kernel.org/linux-arm-kernel/86plkful48.wl-maz@kernel.org/

Patches 2 to 4 remove code made redundant by patch 1. These probably
warrant backporting along with patch 1 as there is some historical
brokenness in the code they remove.

Patches 5 to 7 are preparatory refactoring for patch 8, and are not
intended to have any functional impact.

Patch 8 addresses some mismanagement of ZCR_EL{1,2} which can result in
the host VMM unexpectedly receiving a SIGKILL. To fix this, we eagerly
switch ZCR_EL{1,2} at guest<->host transitions, as discussed on another
series:

  https://lore.kernel.org/linux-arm-kernel/Z4pAMaEYvdLpmbg2@J2N7QTR9R3/
  https://lore.kernel.org/linux-arm-kernel/86o6zzukwr.wl-maz@kernel.org/
  https://lore.kernel.org/linux-arm-kernel/Z5Dc-WMu2azhTuMn@J2N7QTR9R3/

The end result is that KVM loses ~100 lines of code, and becomes a bit
simpler to reason about.

I've pushed these patches to the arm64-kvm-fpsimd-fixes-20250210 tag on my
kernel.org repo:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/
  git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git

The (unstable) arm64/kvm/fpsimd-fixes branch in that repo contains the
fixes plus additional debug patches I've used for testing. I've given
this some basic testing on a virtual platform, booting a host and a
guest with and without constraining the guest's max SVE VL, with:

* kvm_arm.mode=vhe
* kvm_arm.mode=nvhe
* kvm_arm.mode=protected (IIUC this will default to hVHE)

Since v1 [1]:
* Address some additional compiler warnings in patch 7
* Use ZCR_EL1 alias in VHE code
* Fold in Tested-by and Reviewed-by tags
* Fix typos

Since v2 [2]:
* Ensure context synchronization in patch 8
* Fold in Tested-by and Reviewed-by tags
* Fix typos

[1] https://lore.kernel.org/linux-arm-kernel/20250204152100.705610-1-mark.rutland@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20250206141102.954688-1-mark.rutland@arm.com/

Mark.

Mark Rutland (8):
  KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
  KVM: arm64: Remove host FPSIMD saving for non-protected KVM
  KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
  KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN
  KVM: arm64: Refactor CPTR trap deactivation
  KVM: arm64: Refactor exit handlers
  KVM: arm64: Mark some header functions as inline
  KVM: arm64: Eagerly switch ZCR_EL{1,2}

 arch/arm64/include/asm/kvm_emulate.h    |  42 --------
 arch/arm64/include/asm/kvm_host.h       |  22 +---
 arch/arm64/kernel/fpsimd.c              |  25 -----
 arch/arm64/kvm/arm.c                    |   8 --
 arch/arm64/kvm/fpsimd.c                 | 100 ++----------------
 arch/arm64/kvm/hyp/entry.S              |   5 +
 arch/arm64/kvm/hyp/include/hyp/switch.h | 133 +++++++++++++++++-------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  15 ++-
 arch/arm64/kvm/hyp/nvhe/switch.c        |  91 ++++++++--------
 arch/arm64/kvm/hyp/vhe/switch.c         |  33 +++---
 10 files changed, 187 insertions(+), 287 deletions(-)

-- 
2.30.2


