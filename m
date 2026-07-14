Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70BDC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IGGPtHL/McwRSrgBlkOgO9CvLa+/+toxJU/7GfFUsLs=; b=y5f0+H6Su5LoEWBAnlQmLU0xgM
	b2/lcx3fiW/02MuddZmOL0BL904uXW4FmSA7QqjRIFsP01MpMU1IDCU9PAI0ENpE4IDd1yR2F2bNR
	OQqfDdYThy6y8ued4Uo4Mumnd1vnTYbTzkHRuikB7goIWxhQQXowxGpVA7VwXHOO5VzehPHk+Fz4P
	2g4VJUA/aYTKdiIjkGsNfU2NqJXSNBZ6bji2dWp6PBUESJVkiGOiwSQQ8twelNPhOx87TYNMYzUaT
	qfisKKgcER8pyVkbZ5R/NfYO54NgMVM3ed0TNA+ZRwgewMW8DPL2u/0eyh667+hmBOP0ZaPsJIIZs
	nAPimi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaBx-0000000BXIb-02Vj;
	Tue, 14 Jul 2026 10:16:45 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaBu-0000000BXHV-0I15
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:16:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784024197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IGGPtHL/McwRSrgBlkOgO9CvLa+/+toxJU/7GfFUsLs=;
	b=S+q/f9eK0zAPQ774VDggYx7rcMe2jVvz5a7y/lVfWx0GnCOegyhEeHS7scTpD15E5YYNSd
	kuZWlhVsMDfdQnkmogupsuNcJSFM3x7MQdeIy1sTN2FzMJ/xw6L2G84hDiKjxI95KRqjvA
	/OhhhjvUic5BxnKsCUbkiooVcbu6zOQ=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v5 0/8] KVM: arm64: pKVM vCPU state management at EL2 (series A)
Date: Tue, 14 Jul 2026 11:15:53 +0100
Message-Id: <20260714101601.4142645-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_031642_287720_A1275E0A 
X-CRM114-Status: GOOD (  10.85  )
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

Hi folks,

Changes since v4 [1]:
  - Renamed the sys register accessors: vcpu_{read,write}_sys_reg() are
    now the context-dispatching wrappers valid in any context, and the
    host-only implementations are __vcpu_{read,write}_sysreg_vhe(). This
    avoids introducing a kvm_vcpu_ prefix that would be easy to confuse
    with vcpu_. (Oliver)
  - Dropped Vincent's Reviewed-by on the sys register accessor patch,
    since it changed materially with the rename.
  - Rebased onto v7.2-rc3.

Building on Will's pKVM infrastructure series [2], this series reworks
how pKVM moves vCPU state between the host and EL2, and stops copying a
non-protected guest's state on every world switch.

EL2 gains proper primitives for the state it transfers: vCPU lookup
helpers, and VGIC flush/sync that reduces how much host state EL2
dereferences. The series also moves some preparatory code (such as sys
reg access and PSCI helpers) to shared headers and HYP, and implements
lazy copying of a non-protected guest's register state back to the host
until the host actually needs it, instead of on every exit.

This is the first of two series moving pKVM vCPU state management to
EL2. The follow-up completes the job for protected VMs: state
isolation, PSCI handling at EL2, and the resulting API behaviour.

The series is structured as follows:

  01-04:  Preparatory refactoring (MPIDR, sys reg access, vCPU reset, PSCI
          helpers) to shared headers and HYP.
  05:     Host and hypervisor vCPU lookup primitives.
  06-07:  VGIC: reduce EL2's exposure to host state, add flush/sync primitives.
  08:     Lazy state sync for non-protected guests.

Based on v7.2-rc3 (a13c140cc289c).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260706095927.560795-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260105154939.11041-1-will@kernel.org/

Fuad Tabba (5):
  KVM: arm64: Extract MPIDR computation into a shared header
  KVM: arm64: Make vcpu_{read,write}_sys_reg available to HYP code
  KVM: arm64: Factor out reusable vCPU reset helpers
  KVM: arm64: Move PSCI helper functions to a shared header
  KVM: arm64: Implement lazy vCPU state sync for non-protected guests

Marc Zyngier (3):
  KVM: arm64: Add host and hypervisor vCPU lookup primitives
  KVM: arm64: Minimise EL2's exposure of host VGIC state during world
    switch
  KVM: arm64: Add primitives to flush/sync the VGIC state at EL2

 arch/arm64/include/asm/kvm_arm.h     |  12 ++
 arch/arm64/include/asm/kvm_asm.h     |   1 +
 arch/arm64/include/asm/kvm_emulate.h |  77 ++++++++
 arch/arm64/include/asm/kvm_host.h    |   6 +-
 arch/arm64/kvm/arm.c                 |   7 +
 arch/arm64/kvm/handle_exit.c         |  23 +++
 arch/arm64/kvm/hyp/exception.c       |  34 +---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c   | 258 +++++++++++++++++++++++----
 arch/arm64/kvm/psci.c                |  30 +---
 arch/arm64/kvm/reset.c               |  60 +------
 arch/arm64/kvm/sys_regs.c            |  18 +-
 arch/arm64/kvm/sys_regs.h            |  19 ++
 include/kvm/arm_psci.h               |  27 +++
 13 files changed, 408 insertions(+), 164 deletions(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.39.5


