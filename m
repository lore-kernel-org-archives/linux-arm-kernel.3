Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9E7CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxKnPUkphuWfddUZLA+MOUImaPa7WKWIfJYWmiD+PUQ=; b=r17mYEVA3SYNi8z351OiSgfDz3
	mdLbv55rYJb+cZU4kUaQ/3RV21sNb+X29zlz7uWSMyg5xTGDuwAhTAGObdLAc2nTv+sOMm2cDvRAF
	q5rLq8NQ5/X/zLZ1nEL8yD7pTy4D99f+vyE3Pn9wdq+xDRbdueErrIRX0CygJSH3D+vm/UoL6V5l9
	uCXaqM5xJU7tVdU0QBNBh0OH2YzsYYlCWWmopbhLPhO8PYz+fb5DlSGIsf3hnXtV6bZ780rtNlCys
	ECXBF1BHHpdvEJ6Ac3rFkro3sEyyhAyPaYURkWxldXv+A6z4aw3YtzBfFicw1viGYwtf7AqmXkJ/k
	u3rb3LKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHJt-00000009JcG-115g;
	Thu, 01 Oct 2026 13:59:33 +0000
Received: from out-153.mta0.migadu.com ([2001:41d0:1004:224b::99] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHJn-00000009JWm-0hN7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:59:28 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=KtnZNfTyiwS2Mpj4kCjZJTQvGUvZYN+6FATvF5Nx0r0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790863164; v=1; x=1791467964;
 b=qSGdeYWqMZZzn+yztTfSr992ha/cVWz1evwh2kjIBBpn/dm20qGd9MUgLa6aT8sh02PMkJRG
 yEBwbXdyMFH85z/kUQAZ0UAH4r6WwcUgvpHGz2xO4HElmdRQ10uvXyecCqPX8Z4qIByHB5LZYWm
 7WTeOpfNu1GkFkmZvQ9M4rZs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9cb9a86a70c79499;
	Thu, 01 Oct 2026 13:59:24 +0000
X-Mizu-Trace-ID: 9cb9a86a70c79499
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
Subject: [PATCH v4 18/18] KVM: arm64: Document the protected VM userspace API
Date: Thu,  1 Oct 2026 14:57:11 +0100
Message-Id: <20261001135711.1640520-19-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001135711.1640520-1-fuad.tabba@linux.dev>
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065927_531513_779E4E24 
X-CRM114-Status: GOOD (  35.09  )
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

EL2 owns a protected vCPU's state once it has run, and the ioctls that
would reach it fail rather than operate on the host copy, which holds
the boot state the VMM wrote plus what the exit handlers copy out.
Describe the resulting API in pkvm.rst, point api.rst at it from each
ioctl that behaves differently, and say beside the PVTIME attribute
in devices/vcpu.rst and the PSCI version register in
fw-pseudo-registers.rst how protected VMs differ. The overview also
states the GIC support pKVM enforces: GICv2 is not supported in
protected mode (vgic-v2.c) and GICv5-based guests aren't registered
under pKVM (vgic-v5.c).

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/api.rst                |  27 ++-
 .../virt/kvm/arm/fw-pseudo-registers.rst      |   2 +
 Documentation/virt/kvm/arm/pkvm.rst           | 164 +++++++++++++++++-
 Documentation/virt/kvm/devices/vcpu.rst       |   3 +-
 4 files changed, 185 insertions(+), 11 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e0430cc750c9e..7fc0fed0edb18 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1322,6 +1322,9 @@ guests, across different userspace implementations. Nevertheless, userspace
 can still emulate all Arm exceptions by manipulating individual registers
 using the KVM_SET_ONE_REG API.
 
+For a protected VM, setting ext_dabt_pending returns -EPERM; see
+Documentation/virt/kvm/arm/pkvm.rst. Injecting an SError is unaffected.
+
 See KVM_GET_VCPU_EVENTS for the data structure.
 
 Calling this ioctl on a vCPU that hasn't been initialized will return
@@ -1545,7 +1548,9 @@ Possible values are:
    KVM_MP_STATE_RUNNABLE         the vcpu is currently running
                                  [x86,arm64,riscv,loongarch]
    KVM_MP_STATE_UNINITIALIZED    the vcpu is an application processor (AP)
-                                 which has not yet received an INIT signal [x86]
+                                 which has not yet received an INIT signal
+                                 [x86], or a protected VM's vcpu that the
+                                 guest holds powered off [arm64]
    KVM_MP_STATE_INIT_RECEIVED    the vcpu has received an INIT signal, and is
                                  now ready for a SIPI [x86]
    KVM_MP_STATE_HALTED           the vcpu has executed a HLT instruction and
@@ -1624,6 +1629,12 @@ For arm64/riscv:
 The only states that are valid are KVM_MP_STATE_STOPPED and
 KVM_MP_STATE_RUNNABLE which reflect if the vcpu should be paused or not.
 
+On arm64, once a protected VM's vcpu has run, it reads as
+KVM_MP_STATE_UNINITIALIZED while the guest holds it powered off, with
+CPU_OFF or by not yet bringing it online with CPU_ON, and
+KVM_MP_STATE_RUNNABLE and KVM_MP_STATE_SUSPENDED return -EPERM on it: only
+the guest can power it on. See Documentation/virt/kvm/arm/pkvm.rst.
+
 On LoongArch, only the KVM_MP_STATE_RUNNABLE state is used to reflect
 whether the vcpu is runnable.
 
@@ -2324,7 +2335,8 @@ Errors:
   ENOENT   no such register
   EINVAL   invalid register ID, or no such register or used with VMs in
            protected virtualization mode on s390
-  EPERM    (arm64) register access not allowed before vcpu finalization
+  EPERM    (arm64) register access not allowed before vcpu
+           finalization, or after a protected VM's vcpu has run
   EBUSY    (riscv) changing register value not allowed after the vcpu
            has run at least once
   ======   ============================================================
@@ -2949,7 +2961,8 @@ Errors include:
   ENOENT   no such register
   EINVAL   invalid register ID, or no such register or used with VMs in
            protected virtualization mode on s390
-  EPERM    (arm64) register access not allowed before vcpu finalization
+  EPERM    (arm64) register access not allowed before vcpu
+           finalization, or after a protected VM's vcpu has run
   ======== ============================================================
 
 (These error codes are indicative only: do not rely on a specific error
@@ -3484,6 +3497,7 @@ Errors:
   ======     =================================================================
   EINVAL     the target is unknown, or the combination of features is invalid.
   ENOENT     a features bit specified is unknown.
+  EPERM      the vcpu belongs to a protected VM and has already run.
   ======     =================================================================
 
 This tells KVM what type of CPU to present to the guest, and what
@@ -3512,6 +3526,10 @@ after the vcpu has been run. This will reset the vcpu to its initial
 state. All calls to this function after the initial call must use the same
 target and same set of feature flags, otherwise EINVAL will be returned.
 
+For a protected VM this ioctl returns EPERM once the vcpu has run, and the
+features it accepts are restricted: KVM_ARM_VCPU_PSCI_0_2 is required. See
+Documentation/virt/kvm/arm/pkvm.rst.
+
 Possible features:
 
 	- KVM_ARM_VCPU_POWER_OFF: Starts the CPU in a power-off state.
@@ -3790,6 +3808,9 @@ can be determined by querying the KVM_CAP_GUEST_DEBUG_HW_BPS and
 KVM_CAP_GUEST_DEBUG_HW_WPS capabilities which return a positive number
 indicating the number of supported registers.
 
+On arm64, this ioctl returns -EPERM for a protected VM: debugging a
+protected guest is not supported. See Documentation/virt/kvm/arm/pkvm.rst.
+
 For ppc, the KVM_CAP_PPC_GUEST_DEBUG_SSTEP capability indicates whether
 the single-step debug event (KVM_GUESTDBG_SINGLESTEP) is supported.
 
diff --git a/Documentation/virt/kvm/arm/fw-pseudo-registers.rst b/Documentation/virt/kvm/arm/fw-pseudo-registers.rst
index d78b53b05dfcf..c07471e258ea2 100644
--- a/Documentation/virt/kvm/arm/fw-pseudo-registers.rst
+++ b/Documentation/virt/kvm/arm/fw-pseudo-registers.rst
@@ -33,6 +33,8 @@ The following registers are defined:
     highest PSCI version implemented by KVM and compatible with v0.2)
   - Allows any PSCI version implemented by KVM and compatible with
     v0.2 to be set with SET_ONE_REG
+  - Returns -EINVAL for a version below v1.1 on a protected VM (see
+    Documentation/virt/kvm/arm/pkvm.rst)
   - Affects the whole VM (even if the register view is per-vcpu)
 
 * KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_1:
diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
index 514992a79a833..b75bb8ad6f26d 100644
--- a/Documentation/virt/kvm/arm/pkvm.rst
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -15,7 +15,9 @@ Overview
 Booting a host kernel with '``kvm-arm.mode=protected``' enables
 "Protected KVM" (pKVM). During boot, pKVM installs a stage-2 identity
 map page-table for the host and uses it to isolate the hypervisor
-running at EL2 from the rest of the host running at EL1/0.
+running at EL2 from the rest of the host running at EL1/0. pKVM supports
+GICv3 only: GICv2 is not supported in protected mode, and neither are
+GICv5-based guests.
 
 pKVM permits creation of protected virtual machines (pVMs) by passing
 the ``KVM_VM_TYPE_ARM_PROTECTED`` machine type identifier to the
@@ -31,7 +33,7 @@ See hypercalls.rst for more details.
 Isolation mechanisms
 ====================
 
-pKVM relies on a number of mechanisms to isolate PVMs from the host:
+pKVM relies on a number of mechanisms to isolate pVMs from the host:
 
 CPU memory isolation
 --------------------
@@ -50,8 +52,9 @@ stage-2 identity map as part of the donation procedure. This gives rise
 to some user-visible differences when compared to non-protected VMs,
 largely due to the lack of MMU notifiers:
 
-* Memslots cannot be moved or deleted once the pVM has started running.
-* Read-only memslots and dirty logging are not supported.
+* Memslots cannot be moved or deleted once the pVM has started running
+  (``-EPERM``).
+* Read-only memslots and dirty logging are not supported (``-EPERM``).
 * With the exception of swap, file-backed pages cannot be mapped into a
   pVM.
 * Donated pages are accounted against ``RLIMIT_MLOCK`` and so the VMM
@@ -67,12 +70,19 @@ largely due to the lack of MMU notifiers:
   then it will either return ``-EFAULT`` or forcefully reclaim the
   memory pages. Reclaimed memory is zeroed by the hypervisor and a
   subsequent attempt to access it in the pVM will return ``-EFAULT``
-  from the ``VCPU_RUN`` ioctl().
+  from the ``KVM_RUN`` ioctl().
 
 CPU state isolation
 -------------------
 
-Status: **Unimplemented.**
+Status: CPU register state of protected vCPUs is managed entirely at EL2.
+
+pKVM performs the complete context switch for protected vCPUs within the
+hypervisor. The hypervisor sets a protected vCPU's initial state, not the
+host, and only what each exit needs is synchronised back.
+
+The user-visible consequences are described under `API behaviour for
+protected VMs`_.
 
 DMA isolation using an IOMMU
 ----------------------------
@@ -89,13 +99,153 @@ The FF-A proxy ensures that the host cannot share pVM or hypervisor
 memory with Trustzone as part of a "confused deputy" attack.
 
 The PSCI proxy ensures that CPUs always have the stage-2 identity map
-installed when they are executing in the host.
+installed when they are executing in the host. This proxy is distinct
+from the PSCI handling provided to protected guests, which is described
+under `API behaviour for protected VMs`_.
 
 Protected VM firmware (pvmfw)
 -----------------------------
 
 Status: **Unimplemented.**
 
+API behaviour for protected VMs
+===============================
+
+Protected vCPU state is owned by EL2 (see `CPU state isolation`_). The VMM
+configures a vCPU before its first ``KVM_RUN``; afterwards the state is
+private to the guest and the ioctls that access it return ``-EPERM``. The
+vCPU ioctls' errors follow one rule: ``-EPERM`` means the host asked for
+state that the guest owns, ``-EINVAL`` means the request is not valid for a
+protected VM, and a feature pKVM doesn't support for protected VMs is
+rejected the way KVM rejects one that isn't implemented (``-ENXIO`` from
+``KVM_ARM_VCPU_PVTIME_CTRL``, for example). The ioctls themselves are
+described in Documentation/virt/kvm/api.rst.
+
+Boot
+----
+
+A protected VM boots from a single primary vCPU. Before the first
+``KVM_RUN``, the VMM prepares the boot state:
+
+* Set ``KVM_MP_STATE_RUNNABLE`` on the primary vCPU and
+  ``KVM_MP_STATE_STOPPED`` on every other vCPU. EL2 allows only one
+  RUNNABLE primary per protected VM. A second RUNNABLE vCPU fails at its
+  first ``KVM_RUN``.
+* Set the primary vCPU's boot state with ``KVM_SET_ONE_REG``: the kernel
+  entry address in ``PC`` and the DTB pointer in ``x0``.
+
+``PC`` and ``x0`` are the only registers EL2 takes from the host. Other
+pre-run writes are accepted, but the guest starts from the state the
+hypervisor resets it to.
+
+Secondary vCPUs are started by the guest itself through PSCI ``CPU_ON``
+(see `Power state`_), which supplies their entry point and context ID.
+The VMM cannot choose where they boot.
+
+vCPU state
+----------
+
+* ``KVM_GET_ONE_REG`` and ``KVM_SET_ONE_REG`` return ``-EPERM`` once the
+  vCPU has run. Before that, they access the host-side copy from which
+  EL2 builds the guest's boot state (see `Boot`_).
+* ``KVM_ARM_VCPU_INIT`` accepts only the vCPU features that a protected
+  guest supports and returns ``-EINVAL`` otherwise.
+  ``KVM_ARM_VCPU_PSCI_0_2`` is required, as EL2 implements PSCI 1.1 for
+  the guest (see `Power state`_). ``KVM_ARM_VCPU_EL1_32BIT`` is not
+  supported: protected guests run in AArch64 only and see no AArch32
+  support in ``ID_AA64PFR0_EL1``. Once the vCPU has run,
+  ``KVM_ARM_VCPU_INIT`` returns ``-EPERM``, as re-initialising it would
+  reset the host-side copy alone.
+* ``KVM_SET_VCPU_EVENTS`` returns ``-EPERM`` for external-abort injection
+  (``ext_dabt_pending``), and ``KVM_CAP_ARM_INJECT_EXT_DABT`` is not
+  advertised to a protected VM. SError injection is unaffected.
+* ``KVM_SET_GUEST_DEBUG`` returns ``-EPERM``, and ``KVM_CAP_SET_GUEST_DEBUG``
+  is not advertised to a protected VM (see `Debug`_).
+
+Power state
+-----------
+
+EL2 implements PSCI 1.1 for a protected guest. The calls that move a
+vCPU's power state, ``CPU_ON`` and ``CPU_OFF``, are handled at EL2, and
+the host cannot change the outcome: for ``CPU_ON`` the host only
+schedules the target, which EL2 has already reset to the entry point
+the guest chose, and for ``CPU_OFF`` it only stops scheduling it.
+``AFFINITY_INFO`` is handled by the host, which returns ``OFF`` once
+it has stopped scheduling every vCPU the query covers, as for a
+non-protected VM. A vCPU becomes a valid ``CPU_ON`` target at its first
+``KVM_RUN``, and before that EL2 returns ``INVALID_PARAMETERS``. The
+platform calls, ``CPU_SUSPEND``, ``SYSTEM_OFF``, ``SYSTEM_RESET`` and
+``SYSTEM_RESET2``, are forwarded to the host and behave as for a
+non-protected VM, with the ``SYSTEM_*`` calls exiting to the VMM as
+``KVM_EXIT_SYSTEM_EVENT``; the ``SYSTEM_RESET2`` reset type and cookie
+are in the guest's registers, which ``KVM_GET_ONE_REG`` rejects once
+the vCPU has run. Any other function returns ``NOT_SUPPORTED``, and
+``PSCI_FEATURES`` reports the same set. Because the host handles those
+forwarded calls, ``KVM_SET_ONE_REG`` on ``KVM_REG_ARM_PSCI_VERSION``
+returns ``-EINVAL`` for a version below 1.1.
+
+Once a vCPU has run, its power state follows the guest's PSCI calls, not
+the VMM's. A vCPU that the guest has powered off with ``CPU_OFF``, or has
+not yet brought online with ``CPU_ON``, reads as
+``KVM_MP_STATE_UNINITIALIZED``, and only an in-guest ``CPU_ON`` can power
+it on: ``KVM_SET_MP_STATE`` returns ``-EPERM`` for ``KVM_MP_STATE_RUNNABLE``
+and ``KVM_MP_STATE_SUSPENDED`` on it, accepts ``KVM_MP_STATE_STOPPED`` and
+leaves it as it is, and never takes ``KVM_MP_STATE_UNINITIALIZED`` from
+the VMM. ``KVM_MP_STATE_STOPPED`` still stops a vCPU EL2 has powered on,
+and ``KVM_MP_STATE_RUNNABLE`` resumes it, so the VMM can pause it.
+
+Other interface differences
+---------------------------
+
+* ``KVM_CHECK_EXTENSION`` reports only the arm64 capabilities that pKVM
+  supports for protected guests, and ``KVM_ENABLE_CAP`` accepts only
+  those. Query them on the VM file descriptor: the system file descriptor
+  has no VM to filter against. The capabilities the generic KVM code
+  answers itself (``KVM_CAP_SYNC_MMU`` or ``KVM_CAP_DEVICE_CTRL``, for
+  example) are reported as for any VM, and don't mean the feature works
+  for a protected one. The filter does not cover every interface either:
+  device-fd configuration (for example the VGIC after
+  ``KVM_CREATE_DEVICE``) and vCPU attributes are unfiltered, so a feature
+  the filter excludes is rejected by the attribute itself.
+  ``KVM_ARM_VCPU_PVTIME_CTRL`` returns ``-ENXIO``, for example, as it does
+  where steal time isn't implemented.
+* The vGIC of a protected VM remains host-managed: device creation,
+  configuration and interrupt injection all work as they do for a
+  non-protected VM.
+* ``KVM_ARM_SET_COUNTER_OFFSET`` and ``KVM_ARM_GET_REG_WRITABLE_MASKS``
+  return ``-EINVAL``: their capabilities are not advertised to a protected
+  VM, whose counter offset and ID registers are set by EL2. A protected
+  guest sees the physical timebase.
+* A protected guest's first access to each page of memory exits to the
+  host, since the hypervisor cannot tell memory from a device before the
+  page is mapped. For a store, the host sees the value of the register
+  the syndrome names, clamped to the access width, and nothing else from
+  the register file. For a load, the register the syndrome names takes
+  the value the host returns, as for any emulated access.
+* A protected guest that uses a feature it was not given, or executes an
+  ``SMC``, takes an undefined instruction exception from the hypervisor;
+  the host is not involved.
+* Apart from PSCI, the hypervisor handles a protected guest's SMCCC
+  calls itself and does not involve the host. A function it does not
+  implement returns ``NOT_SUPPORTED``, and the host's SMCCC filter does
+  not apply: the VM device attribute ioctls (``KVM_ARM_VM_SMCCC_CTRL``)
+  return ``-EINVAL`` for a protected VM.
+* The hypervisor can decode a trapped guest access only from the CPU's
+  instruction syndrome, which is provided only for a load or store of a
+  single general-purpose register. An access without one (for example a
+  load/store pair or a SIMD/FP access) cannot be decoded. For a
+  non-protected VM it can exit to the VMM as ``KVM_EXIT_ARM_NISV``. For a
+  protected VM it cannot be emulated by the VMM, so the guest takes a
+  synchronous external abort instead.
+
+Debug
+-----
+
+Hardware-assisted debugging is not available to protected guests.
+``MDSCR_EL1``, ``OSLAR_EL1``, ``OSLSR_EL1``, ``OSDLR_EL1``, and breakpoint
+and watchpoint 0 are RAZ/WI; any other debug register access takes an
+undefined instruction exception.
+
 Resources
 =========
 
diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index deb5c51bc00c8..916407835acdf 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -231,7 +231,8 @@ Returns:
 Specifies the base address of the stolen time structure for this VCPU. The
 base address must be 64 byte aligned and exist within a valid guest memory
 region. See Documentation/virt/kvm/arm/pvtime.rst for more information
-including the layout of the stolen time structure.
+including the layout of the stolen time structure. Stolen time is not
+supported for protected VMs (see Documentation/virt/kvm/arm/pkvm.rst).
 
 4. GROUP: KVM_VCPU_TSC_CTRL
 ===========================
-- 
2.39.5


