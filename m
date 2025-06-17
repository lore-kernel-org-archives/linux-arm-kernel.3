Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630C7C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cl4EkXk+SXuxA1MthlYy/2jnfHXWKpDM5SlNRw8sb7s=; b=bqpmQVCpeaD48wLU41Qjr7tZE1
	soBSK3+XAps9IJst0F+2rz1IhUICGamtSNnOQjWRO3SO67rYgNYhiH28WNu4lNpWGjWBLZIq0fOSa
	Urf60XjNyLRK4wBGg8TASXKSj0/Z/WuIS96z++3B8m9C/CifL/KaQ8/JeeizBqxjZCVHA20fqbHzv
	+WjXjIa5Mcmy+QE+2QsA5WX2MUdCM/xE+r9ljyDwbo6vefKHlAp9mdxiZrtx5fSA+/MqAx+S7aQfR
	2TXV++DBGIYicILKCXy7QJAFq4DKincLlWxJcriDUti2FRHIj75W+bol+1vVXioykHProbz73l9x4
	6Uqyx/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWdy-00000007PSp-3i65;
	Tue, 17 Jun 2025 13:46:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWVE-00000007Ns9-2dYC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:37:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18B1C150C;
	Tue, 17 Jun 2025 06:37:06 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D6073F673;
	Tue, 17 Jun 2025 06:37:25 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	stable@vger.kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 0/7] KVM: arm64: trap fixes and cleanup
Date: Tue, 17 Jun 2025 14:37:11 +0100
Message-Id: <20250617133718.4014181-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_063728_731027_C49F1B32 
X-CRM114-Status: UNSURE (   9.97  )
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

This series fixes some issues with the way KVM manages traps in VHE
mode, with some cleanups/simplifications atop.

Patch 1 fixes a theoretical issue with debug register manipulation,
which has been around forever. This was found by inspection while
working on other fixes.

Patch 2 fixes an issue with NV where a host may take unexpected traps as
a result of a guest hypervisor's configuration of CPTR_EL2.

Patch 5 fixes an issue with NV where a guest hypervisor's configuration
of CPTR_EL2 may not be taken into account when running a guest guest,
incorrectly permitting usage of SVE when this should be trapped to the
guest hypervisor.

The other patches in the series are prepartory work and cleanup.

Originally I intended to simplify/cleanup to kvm_hyp_handle_fpsimd() and
kvm_hyp_save_fpsimd_host(), as discussed with Will on an earlier series:

  https://lore.kernel.org/linux-arm-kernel/20250210161242.GC7568@willie-the-truck/
  https://lore.kernel.org/linux-arm-kernel/Z6owjEPNaJ55e9LM@J2N7QTR9R3/
  https://lore.kernel.org/linux-arm-kernel/20250210180637.GA7926@willie-the-truck/
  https://lore.kernel.org/linux-arm-kernel/Z6pbeIsIMWexiDta@J2N7QTR9R3/

In the process of implementing that, I realised that the CPTR trap
management wasn't quite right for NV, and found the potential issue with
debug register configuration.

I've given the series some light testing on a fast model so far; any
further testing and/or review would be much appreciated.

The series is based on the 'kvmarm-fixes-6.16-2' tag from the kvmarm
tree.

Mark.

Mark Rutland (7):
  KVM: arm64: VHE: Synchronize restore of host debug registers
  KVM: arm64: VHE: Synchronize CPTR trap deactivation
  KVM: arm64: Reorganise CPTR trap manipulation
  KVM: arm64: Remove ad-hoc CPTR manipulation from fpsimd_sve_sync()
  KVM: arm64: Remove ad-hoc CPTR manipulation from
    kvm_hyp_handle_fpsimd()
  KVM: arm64: Remove cpacr_clear_set()
  KVM: arm64: VHE: Centralize ISBs when returning to host

 arch/arm64/include/asm/kvm_emulate.h    |  62 ----------
 arch/arm64/include/asm/kvm_host.h       |   6 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h | 147 ++++++++++++++++++++++--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |   5 +-
 arch/arm64/kvm/hyp/nvhe/switch.c        |  59 ----------
 arch/arm64/kvm/hyp/vhe/switch.c         | 107 +++--------------
 6 files changed, 158 insertions(+), 228 deletions(-)

-- 
2.30.2


