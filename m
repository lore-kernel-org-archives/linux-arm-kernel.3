Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5539BC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bb3xx+C3+5zdwNW58s+hETXGLzSL19H/yu/swuSmAQo=; b=atXzdllXNrYekvwqgXmPWVV2o5
	fWDD4Oq1zIcC4iEsLh409f7zDIPkELh61VYH0gGS8WgGGokWOCvSZi46SXX4V+h4WnJUlz2rvMbdQ
	w4kKUJhy69GCthLro6qfSOIX6fqC4XwUD8zGLRY6dav/lslikuKFY18rqauAqRrO0sqaBUkk6QZAZ
	R0uM9elqsfxw76nwNnhE95/ZC9jawb50FWr9jsZff2qSJCP/pR0AmovXvwJgMiYpgVJWsrthWIQWN
	JnqLqyTzRGn0sP2LuVenXzMzuQsxnemlmxrExygIT+PCPc+J52Va5oRKKCbNV+PR9PalagYlWLrbA
	Qvs+whPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64wX-00000003Fky-0Z2v;
	Mon, 14 Sep 2026 11:33:51 +0000
Received: from out-88.mta0.migadu.com ([2001:41d0:1004:224b::58] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64wU-00000003Fjb-0a88
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:33:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PEMGk0bdvF4Oc6xniSkHQ8I18jhsNbW1/Zk+ICdsASE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789385623; v=1; x=1789990423;
 b=vv0J5g4cBJLBKHpphmF1YtqgRHSOsQQXm18YOQMJtLV13VnaNdWbs5+cmbRwGQWphMb0vv5L
 i/77MB03qFwemr3G2oy2eEVNnDfeKaw1JP4AF9pqrFZBkFWsBS6EG4PVvbuwibv8JAcU2U1Nom5
 hJzr/KuE9eHWTl2SQ4Nzpll0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 14842c37075c9799;
	Mon, 14 Sep 2026 11:33:42 +0000
X-Mizu-Trace-ID: 14842c37075c9799
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v3 00/18] KVM: arm64: Confine protected VM vCPU state to EL2
Date: Mon, 14 Sep 2026 12:33:20 +0100
Message-Id: <20260914113338.159227-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043346_321628_6672F7CD 
X-CRM114-Status: GOOD (  18.57  )
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

Changes since v2 [1]:
  - Reworked the host PC adjustment patch: a get/put pair inside
    __kvm_adjust_pc(), and exception.c keeps its signatures. (Marc)
  - The pin that patch carried in v2 was fixing a hyp panic in the base;
    it is patches 2 and 3 now, going out separately.
  - A CPU_ON that reaches the host ahead of the target's CPU_OFF returns
    ALREADY_ON, and the host's CPU_ON of a protected vCPU is gated on
    EL2's power-off record, not on STOPPED. (sashiko)
  - Dropped the patch pending a protected guest's SError with
    HCR_EL2.VSE: EL2 copies the host's view of PSTATE out with A set
    instead. (Marc)
  - Moved the has-run -EPERM checks into one pkvm_filter_vcpu_ioctl()
    at the top of kvm_arch_vcpu_ioctl(). (Marc)
  - Take MDCR_EL2.HPMN from the PE's own ID_AA64DFR0_EL1 and PMCR_EL0,
    not from a system-wide cpucap.
  - Disable steal time through kvm_arm_pvtime_supported(), so
    KVM_ARM_VCPU_PVTIME_CTRL returns -ENXIO, as the CCA series [2]
    does. (Suzuki)
  - PSCI corrections: keep advertising KVM_CAP_ARM_PSCI; leave
    AFFINITY_INFO to the host; publish OFF with a release in
    pvm_psci_vcpu_off().
  - Fixed cache maintenance on unbacked memory: the host's instruction
    skip is applied to it, not only to an emulated MMIO access.
  - Tidied up some code and wording: the reset table, the HVC handler,
    the WFx entry handler and pkvm.rst (Joey), and the ESR read in the
    marshalling patch's sysreg handler.
  - Collected Joey's Reviewed-by on the reset framework patch. His
    Acked-by on the PC adjustment patch isn't carried, that code
    having changed. (thanks!)
  - Rebased onto v7.3-rc3.

Following the vCPU state-sync series [3], this series completes the
job for protected VMs: a protected guest's register state stays at
EL2, and the host sees only what handling each exit needs.

EL2 marshals a protected vCPU's state per exception class instead of
copying the whole context both ways. It owns the vCPU's trap
configuration, system register reset and HVC handling, and implements
PSCI itself: AFFINITY_INFO is left to the host, and CPU_ON and CPU_OFF
are decided at EL2 with the host only scheduling or parking the
target. A protected guest's TRNG calls, which the host handled until
now, return NOT_SUPPORTED until TRNG for protected guests follows. EL2
implements PSCI 1.1, so a protected guest also loses the functions the
host supports above that version, SYSTEM_OFF2 included.
Host ioctls that would reach the state EL2 owns fail with a clean
errno, so a protected VM's state isn't save/restorable. All of this is
scoped to KVM_VM_TYPE_ARM_PROTECTED, and pkvm.rst describes the
resulting API.

The kvmtool changes that go with this are posted separately [4].

Patches 1 to 3 go out separately: the HCR_EL2.VSE fix [5], posted, and
the host vCPU pin fix [6], where Sashiko found a pre-existing
unvalidated read of the host vCPU's VM on the same path. Patches 2 and
3 are v2 of [6], still to be posted. None of the three is part of this
series. They're carried so the series applies as is and Sashiko can run
on it.

The KVM_ARM_PREFERRED_TARGET documentation fix [7] went out just ahead
of v1. Nothing here needs it to apply, but patch 18 documents vCPU
feature availability as something the capabilities report, while
api.rst 4.83 still points userspace at a bitmap that has always been
empty.

The series is structured as follows:

  01:     The HCR_EL2.VSE fix, posted separately.
  02-03:  The host vCPU VM read and pin fixes, to be posted separately.
  04:     Steal time disabled for protected VMs.
  05-06:  Per-exception-class entry handlers; EL2 owns a protected
          vCPU's trap configuration.
  07-09:  Timer state, system register reset and HVC handling at EL2.
  10-11:  PSCI at EL2, and the KVM_ARM_VCPU_INIT and PSCI version
          restrictions.
  12-14:  Host PC adjustments blocked; an UNDEF at EL2 for exit
          classes the host doesn't emulate; per-class state
          marshalling.
  15-16:  Host access to private state, and host power-on of a vCPU
          EL2 holds powered off, rejected.
  17:     Capability allowlist.
  18:     Documentation.

Still to come: selftests, TRNG, self-hosted debug and SVE for protected
guests, and much more, as separate series.

Based on v7.3-rc3 (fd73f4a665989).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260907070002.3333525-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260908162223.1683432-11-suzuki.poulose@arm.com/
[3] https://lore.kernel.org/all/20260729131823.2021516-1-fuad.tabba@linux.dev/
[4] https://lore.kernel.org/all/20260831192406.1341841-1-fuad.tabba@linux.dev/
[5] https://lore.kernel.org/all/20260829071120.2522788-1-fuad.tabba@linux.dev/
[6] https://lore.kernel.org/all/20260914065136.3418404-1-fuad.tabba@linux.dev/
[7] https://lore.kernel.org/all/20260831162815.269851-1-fuad.tabba@linux.dev/

Fuad Tabba (16):
  KVM: arm64: Sync HCR_EL2.VSE back to the host vCPU under pKVM
  KVM: arm64: Validate the host vCPU's VM before reading it under pKVM
  KVM: arm64: Pin the host vCPU before adjusting its PC under pKVM
  KVM: arm64: Disable steal time for protected VMs
  KVM: arm64: Skip fixed-feature state flush for protected vCPUs
  KVM: arm64: Add system register reset framework for protected VMs
  KVM: arm64: Implement HVC handling for protected guests at EL2
  KVM: arm64: Handle PSCI calls for protected VMs at EL2
  KVM: arm64: Restrict KVM_ARM_VCPU_INIT and PSCI version for protected
    VMs
  KVM: arm64: Prevent host PC adjustments for protected vCPUs
  KVM: arm64: Inject an UNDEF at EL2 for unhandled protected guest exits
  KVM: arm64: Add per-EC entry/exit state marshalling for protected
    guests
  KVM: arm64: Reject host access to protected VM private state
  KVM: arm64: Reject host power-on of a vCPU that EL2 holds powered off
  KVM: arm64: Advertise the capabilities that protected VMs support
  KVM: arm64: Document the protected VM userspace API

Marc Zyngier (2):
  KVM: arm64: Introduce per-EC entry handlers for pKVM
  KVM: arm64: Add {flush,sync}_hyp_timer_state() primitives

 Documentation/virt/kvm/api.rst                |  22 +-
 .../virt/kvm/arm/fw-pseudo-registers.rst      |   2 +
 Documentation/virt/kvm/arm/pkvm.rst           | 161 ++++-
 Documentation/virt/kvm/devices/vcpu.rst       |   3 +-
 arch/arm64/include/asm/kvm_host.h             |  23 +-
 arch/arm64/include/asm/kvm_hyp.h              |   4 +
 arch/arm64/include/asm/kvm_pkvm.h             |  33 +
 arch/arm64/kvm/arm.c                          |  59 +-
 arch/arm64/kvm/guest.c                        |  11 +
 arch/arm64/kvm/hyp/exception.c                |  26 +-
 arch/arm64/kvm/hyp/include/hyp/adjust_pc.h    |  37 ++
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  18 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 586 +++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 414 ++++++++++++-
 arch/arm64/kvm/hyp/nvhe/switch.c              |  29 +-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            |  60 ++
 arch/arm64/kvm/hypercalls.c                   |   7 +
 arch/arm64/kvm/pkvm.c                         |  21 +-
 arch/arm64/kvm/psci.c                         |  10 +-
 arch/arm64/kvm/pvtime.c                       |  10 +-
 20 files changed, 1456 insertions(+), 80 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


