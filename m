Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89BEC02196
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uA5iSjfsgBQd9f6d2nWB59IySd1XQaUX9i+T42LF4Vs=; b=mpKmBk9srCJUm0nwdYywhLCpAe
	0yYJ68O1Tg5egAOV8/t70DBFXaJIT/sbP3NnewhPV+gjtkUe5z4yCQ9SDetDmG8C7iraOooF92SJc
	SVuFm3KMntle9AprLB/omgmFdw9jupVDfLHjG8FGQnrcM3GiOYrmUQkaVEjqv5Qji0zfRs0fh3jyF
	s1tcyDL5MUasEzuiTN4I6QMeD0LLXWBobnvCwKu5k1djdfwSTlW29Xo6mnzB8Ik/NRpDGg4idmaKp
	6qXu5xcSZ+05oWgCMwkmypjcSXVMspApj8OMy3Gsnf/7G1tKPNUvXPTmOSieF/z5YT3nikDg9Jtxg
	u4qmSHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKoY-00000000oHg-2Xiy;
	Tue, 04 Feb 2025 15:26:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKjf-00000000nrT-2A1g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:21:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EDD311FB;
	Tue,  4 Feb 2025 07:21:32 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36BA93F63F;
	Tue,  4 Feb 2025 07:21:06 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	eauger@redhat.com,
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
Subject: [PATCH 0/8] KVM: arm64: FPSIMD/SVE/SME fixes
Date: Tue,  4 Feb 2025 15:20:52 +0000
Message-Id: <20250204152100.705610-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_072111_598119_0C4990B0 
X-CRM114-Status: GOOD (  11.66  )
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

These patches fix some isuses with the way KVM manages FPSIMD/SVE?SME
state. The series supersedes my earlier attempt at fixing the host SVE
state corruption issue:

  https://lore.kernel.org/linux-arm-kernel/20250121100026.3974971-1-mark.rutland@arm.com/

Patch 1 addreses the host SVE state corruption issue by always saving
and unbinding the host state when loading a vCPU, as discussed on the
earlier patch:

  https://lore.kernel.org/linux-arm-kernel/Z4--YuG5SWrP_pW7@J2N7QTR9R3/
  https://lore.kernel.org/linux-arm-kernel/86plkful48.wl-maz@kernel.org/

Patches 2 to 4 remove code made redundant by patch 1. These probably
warrant backporting along with patch 1 as there is some historical
brokenness in the code they remove.

Patches 5 to 7 are preparatory refactoring for patch 8, and are not
intended to have any functional impact.

Patch 8 addreses some mismanagement of ZCR_EL{1,2} which can result in
the host VMM unexpectedly receiving a SIGKILL. To fix this, we eagerly
swith ZCR_EL{1,2} at guest<->host transitions, as discussed on another
series:

  https://lore.kernel.org/linux-arm-kernel/Z4pAMaEYvdLpmbg2@J2N7QTR9R3/
  https://lore.kernel.org/linux-arm-kernel/86o6zzukwr.wl-maz@kernel.org/
  https://lore.kernel.org/linux-arm-kernel/Z5Dc-WMu2azhTuMn@J2N7QTR9R3/

The end result is that KVM loses ~100 lines of code, and becomes a bit
simpler to reaason about.

I've pushed these patches (with some additional debug patches that can
be used for testing) to the arm64-kvm-fpsimd-fixes-20250204 tag on my
kernel.org repo:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/
  git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git

I've given this some basic testing on a virtual platform, booting a host
and a guest with and without constraining the guet's max SVE VL, with:

* kvm_arm.mode=vhe
* kvm_arm.mode=nvhe
* kvm_arm.mode=protected (IIUC this will default to hVHE)

Any additional testing would be much appreciated.

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

 arch/arm64/include/asm/kvm_emulate.h    |  42 ---------
 arch/arm64/include/asm/kvm_host.h       |  22 +----
 arch/arm64/kernel/fpsimd.c              |  25 -----
 arch/arm64/kvm/arm.c                    |   8 --
 arch/arm64/kvm/fpsimd.c                 | 100 ++------------------
 arch/arm64/kvm/hyp/include/hyp/switch.h | 116 +++++++++++++++++-------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  15 ++-
 arch/arm64/kvm/hyp/nvhe/switch.c        |  91 ++++++++++---------
 arch/arm64/kvm/hyp/vhe/switch.c         |  33 ++++---
 9 files changed, 170 insertions(+), 282 deletions(-)

-- 
2.30.2


