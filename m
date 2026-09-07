Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AB8C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B9u/KDn3oJrpitx2w+DNW370e2AZRNHD/mMvKI1/Kbg=; b=32gynonFkd/sXsKIxM+Mv8NfHq
	DoEQ5o4gs9tO71Q0u+B0aPzuqrSg9hI9pAXGA16ZyiToVa3z2ghLJ7xadRI21FviytSxga1phSgWV
	Cyj1D6nhQSbYAlv8rvm0VMge8cqR+nUJziLRilXreEoUukwkusAz9SNELajUrbtmk6Jw0tJNM71W3
	3ctKpHRDZodtq9jT7a5kD8hvrE+w41bI2KzorlpvvOzZXey9OTvtxnk2IsT7pcz2aq12QpkQfhHli
	J3np4FAix+OJHChqynzAfvX/apWs+QpKypr0pytbU7o1JVbKEJkEFD2JGClZThB+tInc6X77zzuLK
	un8gSirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TKu-000000065dW-1LVE;
	Mon, 07 Sep 2026 07:00:12 +0000
Received: from out-145.mta0.migadu.com ([2001:41d0:1004:224b::91] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TKn-000000065bK-0xmX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:00:10 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TE08JEO4XdsRWJoOoZ7o2sQMkOaJLpJ28XMnfB1BiWE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764403; v=1; x=1789369203;
 b=fc+SCpnKW8DpePhE3vdRe8eAevQcmXeAuASmYIauAId82qX9r2/imuJ/8sB8y0GGUY0X0vSK
 yD92cuvcM+1up0+IxpOlgPvu6mekS/bwWYmXPvmKhZgm4Dn/t3/YjNmOBsmkDFc2OZzAmzfRQf1
 /8+5H4kme4yEpI7rmzY04ImE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 767d52b0de770fd2;
	Mon, 07 Sep 2026 07:00:02 +0000
X-Mizu-Trace-ID: 767d52b0de770fd2
X-Migadu-Flow: FLOW_OUT
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
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 00/16] KVM: arm64: Confine protected VM vCPU state to EL2
Date: Mon,  7 Sep 2026 07:59:45 +0100
Message-Id: <20260907070002.3333525-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_000007_031460_E66FCA28 
X-CRM114-Status: GOOD (  15.29  )
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

Changes since v1 [1]:
  - Handle the SMCCC_ARCH_WORKAROUND_1/2/3 queries at EL2 from the
    host's mitigation state, instead of returning NOT_SUPPORTED.
    (Sashiko)
  - Reset ACTLR_EL1 and AMAIR_EL1 to 0, and trim the reset table to the
    registers the world switch loads. (Sashiko, Joey)
  - Move the capability allowlist to the end, after the restrictions
    it's subject to. (Vincent)
  - Use vcpu_is_protected() throughout, and move the protected-vCPU
    check inside the debug flush and sync helpers. (Vincent)
  - Add the HVC64 entry and exit handlers in the marshalling patch that
    first uses them, without the wrapper. (Joey)
  - Rebased onto v7.3-rc2.
  - Collected Joey's Reviewed-by on the per-EC entry handler patch. His
    Acked-by on the reset framework patch isn't carried, since its code
    and message changed. (thanks!)

Following the vCPU state-sync series [2], this series completes the
job for protected VMs: a protected guest's register state stays at
EL2, and the host sees only what handling each exit needs.

EL2 marshals a protected vCPU's state per exception class instead of
copying the whole context both ways. It owns the vCPU's trap
configuration, system register reset and HVC handling, and implements
PSCI itself: AFFINITY_INFO never reaches the host, and CPU_ON and
CPU_OFF are decided at EL2 with the host only scheduling or parking
the target. Host ioctls that would reach the state EL2 owns fail with
a clean errno, so a protected VM's state isn't save/restorable. All
of this is scoped to KVM_VM_TYPE_ARM_PROTECTED, and pkvm.rst describes
the resulting API.

The kvmtool changes that go with this are posted separately [3].

Patch 1 is the HCR_EL2.VSE fix posted separately [4]. It isn't part
of this series. It's carried so the series applies as is and Sashiko
can run on it.

The KVM_ARM_PREFERRED_TARGET documentation fix [5] went out just ahead
of v1. Nothing here needs it to apply, but patch 17 documents vCPU
feature availability as something the capabilities report, while
api.rst 4.83 still points userspace at a bitmap that has always been
empty.

The series is structured as follows:

  01:     The HCR_EL2.VSE fix, posted separately.
  02:     The PVTIME rejection.
  03-04:  Per-exception-class entry handlers; EL2 owns a protected
          vCPU's trap configuration.
  05-07:  Timer state, system register reset and HVC handling at EL2.
  08-09:  PSCI at EL2, and the KVM_ARM_VCPU_INIT and PSCI version
          restrictions.
  10-13:  Host PC adjustments blocked; an UNDEF at EL2 for exit
          classes the host doesn't emulate; per-class state
          marshalling; a protected guest's SError pended with
          HCR_EL2.VSE.
  14-15:  Host access to private state, and host power-on of a vCPU
          EL2 holds powered off, rejected.
  16:     Capability allowlist.
  17:     Documentation.

Still to come: selftests, TRNG, self-hosted debug and SVE for protected
guests, and much more, as separate series.

Based on v7.3-rc2 (df2908090cda3).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260831163421.272420-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260729131823.2021516-1-fuad.tabba@linux.dev/
[3] https://lore.kernel.org/all/20260831192406.1341841-1-fuad.tabba@linux.dev/
[4] https://lore.kernel.org/all/20260829071120.2522788-1-fuad.tabba@linux.dev/
[5] https://lore.kernel.org/all/20260831162815.269851-1-fuad.tabba@linux.dev/

Fuad Tabba (15):
  KVM: arm64: Sync HCR_EL2.VSE back to the host vCPU under pKVM
  KVM: arm64: Reject the PVTIME vCPU attribute for protected VMs
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
  KVM: arm64: Pend a protected guest's SError with HCR_EL2.VSE only
  KVM: arm64: Reject host access to protected VM private state
  KVM: arm64: Reject host power-on of a vCPU that EL2 holds powered off
  KVM: arm64: Advertise the capabilities that protected VMs support
  KVM: arm64: Document the protected VM userspace API

Marc Zyngier (2):
  KVM: arm64: Introduce per-EC entry handlers for pKVM
  KVM: arm64: Add {flush,sync}_hyp_timer_state() primitives

 Documentation/virt/kvm/api.rst                |  22 +-
 .../virt/kvm/arm/fw-pseudo-registers.rst      |   2 +
 Documentation/virt/kvm/arm/pkvm.rst           | 141 ++++-
 Documentation/virt/kvm/devices/vcpu.rst       |   4 +-
 arch/arm64/include/asm/kvm_asm.h              |   1 +
 arch/arm64/include/asm/kvm_host.h             |  21 +
 arch/arm64/include/asm/kvm_hyp.h              |   4 +
 arch/arm64/include/asm/kvm_pkvm.h             |  34 +-
 arch/arm64/kvm/arm.c                          |  43 ++
 arch/arm64/kvm/guest.c                        |  29 +
 arch/arm64/kvm/hyp/exception.c                |  27 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  18 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 560 +++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 442 +++++++++++++-
 arch/arm64/kvm/hyp/nvhe/switch.c              |  29 +-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            |  73 ++-
 arch/arm64/kvm/hypercalls.c                   |   7 +
 arch/arm64/kvm/inject_fault.c                 |   5 +-
 arch/arm64/kvm/pkvm.c                         |  21 +-
 arch/arm64/kvm/psci.c                         |   3 +
 20 files changed, 1406 insertions(+), 80 deletions(-)

-- 
2.39.5


