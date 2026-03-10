Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83126FD2D6E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IkWZZ/2D6yVVqp412goArl3g/4kVgZn3fzb2+ahTrWk=; b=HvEqswwvdM624OAm+S5bBhng1s
	IyEkXqJNrg5KDdkV/lxSXVDGG6whvPPCrpCtkgTDP7lnhR2FJFi7d/NtnFitj3bASv34hRHZWrmqj
	GR1m4fvO6eFqo0yEdoLNxvu8ZlSnLgXL3bP34n+9xGBlDlVjs9EXFdBkSS6qNa9muGoSjdkfHQ3tS
	4zEow4alWQ5RJitP1ovZtprya82kR/zfNUBUuW84RBTdgN9NW2lLeWBw7ZX2reqnotY9Kb6ibMeUD
	r7cLcO5+IyYoHdh3yHCZRR/H2t5ZhyM0V8h0TF17JdMnZfgSXSCk3rzye/vWnBM/V83Mhn7Yup9oV
	pyVyPAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwWx-00000009W3b-1srH;
	Tue, 10 Mar 2026 12:49:47 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwWu-00000009W2G-39g7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:46 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4853ab1cae0so20354415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146982; x=1773751782; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IkWZZ/2D6yVVqp412goArl3g/4kVgZn3fzb2+ahTrWk=;
        b=oPjInPY585pozxXTF0dXKKM5n+vu9t9GwcCJZpsIwKszwIRh33TBFp/Z7FoUAeSPyG
         qg7AUVTqx9C6Ts7oc2p2rbVctKKMcH45gohesSHYWnYZULga1P52thYV/I1UMOvtlSV9
         fimZGCNZqXghYoZVFCMEX3Jyd/uehC+CfU0hZ9K4QzYx1wTMWhNkqLIK0RNLEDZsw1So
         6HKRpTWLvpODbNa/YWiQWaQ20mpjiN3DaTrLuTf/SNAL1nuo+hvZnwXyrSioI8ekhjZH
         eZNtTdT52jGty1jHloUDYxoZUCSbAcuqzMqQPWtxafXWGMUSvKxaZu0g3+p3bsPi6S4c
         N22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146982; x=1773751782;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkWZZ/2D6yVVqp412goArl3g/4kVgZn3fzb2+ahTrWk=;
        b=rKRd55SRhELZCkWMTKm8TuqOX5CpcmTX3cnKfEl4EwiA6qXaeVMZagC1rnZYSmtaZe
         k9OkFIai0Ju35HEqAZiaJD1LtTTfyEscO09qLsOTAJyhhR/gBUSw/Hl9G8PyCdAS8EBP
         HZ58hjzWnxa2dy7BKgWTvGflzMjyL9l0bdl/FNaxkzkBmGQED6yfeidZT63+eFszdkqJ
         PltH6Mvb0BOup4E66cCvc+vfWE4e3U0NgNOG5OGaqbsHKIEReh43HD3mqowf935TtPUz
         iXY4L8hf2nDBukv1oNryNLRvfv2xkP8ANsV3mFGyaszpjLfqMDk3MfDYvf9Njob7DMPl
         /3uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfP3vGxRPsef8RLM5ZyhLUP7VXfRBgpgEcX1OQp2M88LUfa3zf2LDcq60hSABhlPFe5GfexLDBneaCkmAi+Avd@lists.infradead.org
X-Gm-Message-State: AOJu0YzjzbxAKFW1JOs2eW7NvTc0fmjwyyCBRNDavpIaKNc62RUHR+y8
	Gq62R0ZOAFZ6/2HWASWKKfBk8r/jXPlnSiacZpDiQx/GhIOmTs88+EuJ4biFgVBdi1tq1fqYNiK
	/s5+csLISNf+Pd2X7CUzCNDzP67Z+Zg==
X-Received: from wmdd7.prod.google.com ([2002:a05:600c:a207:b0:485:3ddc:f27a])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348c:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-4852695941dmr243450295e9.17.1773146981827;
 Tue, 10 Mar 2026 05:49:41 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:19 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-1-sebastianene@google.com>
Subject: [RFC PATCH 00/14] KVM: ITS hardening for pKVM
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054944_865286_06CC2053 
X-CRM114-Status: GOOD (  40.82  )
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

This series introduces the necessary machinery to perform trap & emulate
on device access in pKVM. Furthermore, it hardens the GIC/ITS controller to
prevent an attacker from tampering with the hypervisor protected memory
through this device. 

In pKVM, the host kernel is initially trusted to manage the boot process but
its permissions are revoked once KVM initializes. The GIC/ITS device is
configured before the kernel deprivileges itself. Once the hypervisor
becomes available, sanitize the accesses to the ITS controller by
trapping and emulating certain registers and by shadowing some memory
structures used by the ITS.

This is required because the ITS can issue transactions on the memory
bus *directly*, without having an SMMU in front of it, which makes it
an interesting target for crossing the hypervisor-established privilege
boundary.


Patch overview
==============

The first patch is re-used from Mostafa's series[1] which brings SMMU-v3
support to pKVM.

[1] https://lore.kernel.org/linux-iommu/20251117184815.1027271-1-smostafa@google.com/#r

Some of the infrastructure built in that series might intersect and we
agreed to converge on some changes. The patches [1 - 3] allow unmapping
devices from the host address space and installing a handler to trap
accesses from the host. While executing in the handler, enough context
has to be given from mem-abort to perform the emulation of the device
such as: the offset, the access size, direction of the write and private
related data specific to the device. 
The unmapping of the device from the host address space is performed
after the host deprivilege (during _kvm_host_prot_finalize call).

The 4th patch looks up the ITS node from the device tree and adds it to
an array of unmapped devices. It install a handler that forwards all the
MMIO request to mediate the host access inside the emulation layer and
to prevent breaking ITS functionality. 

The 5th patch changes the GIC/ITS driver to exposes two new methods
which will be called from the KVM layer to setup the shadow state and
to take the appropriate locks. This one is the most intrusive as it
changes the current GIC/ITS driver. I tried to avoid creating a
dependency with KVM to keep the GIC driver agnostic of the virtualization
layer but I am happy to explore other options as well. 
To avoid re-programming the ITS device with new shadow structures after
pKVM is ready, I exposed two functions to change the
pointers inside the driver for the following structures:
- the command queue points to a newly allocated queue
- the GITS_BASER<n> tables configured with an indirect layout have the
  first layer shadowed and they point to a new memory region

Patch 6 adds the entry point into the emulation setup and sets up the
shadow command queue. It adds some helper macros to define the offset
register and the associate action that we want to execute in the
emulation. It also unmaps the state passed from the host kernel
to prevent it from playing nasty games later on. The patch
traps accesses to CWRITER register and copies the commands from the
host command queue to the shadow command queue. 

Patch 7 prevents the host from directly accessing the first layer of the
indirect tables held in GITS_BASER<n>. It also prevents the host from
directly accesssing the last layer of the Device Table (since the entries
in this table hold the address of the ITT table) and of the vPE Table
(since the vPE table entries hold the address of the virtual LPI pending
table.

Patches [8-10] sanitize the commands sent to the ITS and their
arguments.

Patches [11-13] restrict the access of the host to certain registers
and prevent undefined behaviour. Prevent the host from re-programming
the tables held in the GITS_BASER register.

The last patch introduces an hvc to setup the ITS emulation and calls
into the ITS driver to setup the shadow state. 


Design
======


1. Command queue shadowing

The ITS hardware supports a command queue which is programmed by the driver
in the GITS_CBASER register. To inform the hardware that a new command
has been added, the driver updates an index into the GITS_CWRITER
register. The driver then reads the GITS_CREADR register to see if the
command was processed or if the queue is stalled.
 
To create a new command, the emulation layer mirrors the behavior
as following:
 (i) The host ITS driver creates a command in the shadow queue:
	its_allocate_entry() -> builder()
 (ii) Notifies the hardware that a new command is available:
	its_post_commands()
 (iii) Hypervisor traps the write to GITS_CWRITER:
	handle_host_mem_abort() -> handle_host_mmio_trap() ->
            pkvm_handle_gic_emulation()
 (iv) Hypervisor copies the command from the host command queue
      to the original queue which is not accessible to the host.
      It parses the command and updates the hardware write.

The driver allocates space for the original command queue and programs
the hardware (GITS_CWRITER). When pKVM becomes available, the driver
allocates a new (shadow) queue and replaces its original pointer to
the queue with this new one. This is to prevent a malicious host from
tampering with the commands sent to the ITS hardware.

The entry point of our emulation shares the memory of the newly
allocated queue with the hypervisor and donates the memory of the
original queue to make it inaccesible to the host.


2. Indirect tables first level shadowing

The ITS hardware supports indirection to minimize the space required to
accommodate large tables (eg. deviceId space used to index the Device Table
is quite sparse). This is a 2-level indirection, with entries from the
first table pointing to a second table.

An attacker in control of the host can insert an address that points to
the hypervisor protected memory in the first level table and then use
subsequent ITS commands to write to this memory (MAPD).

To shadow this tables, we rely on the driver to allocate space for it
and we copy the original content from the table into the copy. When
pKVM becomes available we switch the pointers that hold the orginal
tables to point to the copy.
To keep the tables from the hypervisor in sync with what the host
has, we update the tables when commands are sent to the ITS.


3. Hiding the last layer of the Device Table and vPE Table from the host

An attacker in control of the host kernel can alter the content of these
tables directly (the Arm IHI 0069H.b spec says that is undefined behavior
if entries are created by software). Normally these entries are created in
response of commands sent to the ITS.

A Device Table entry that has the following structure:

type DeviceTableEntry is (
	boolean Valid,
	Address ITT_base,
	bits(5) ITT_size
) 

This can be maliciously created by an attacker and the ITT_base can be
pointed to hypervisor protected memory. The MAPTI command can then be
used to write over the ITT_base with an ITE entry.

Similarly a vCPU Table entry has the following structure:

type VCPUTableEntry is (
	boolean Valid,
	bits(32) RDbase,
	Address VPT_base,
	bits(5) VPT_size
)

VPT_base can be pointed to hypervisor protected memory and then a
command can be used to raise interrupts and set the corresponding
bit. This would give a 1-bit write primitive so is not "as generous"
as the others.


Notes
=====


Performance impact is expected with this as the emulation dance is not
cost free.
I haven't implemented any ITS quirks in the emulation and I don't know
whether we will need it ? (some hardware needs explicit dcache flushing
ITS_FLAGS_CMDQ_NEEDS_FLUSHING). 

Please note that Redistributors trapping hasn't been addressed at all in
this series and the solution is not sufficient but this can be extended
afterwards. 
The current series has been tested with Qemu (-machine
virt,virtualization=true,gic-version=4) and with Pixel 10.


Thanks,
Sebastian E.

Mostafa Saleh (1):
  KVM: arm64: Donate MMIO to the hypervisor

Sebastian Ene (13):
  KVM: arm64: Track host-unmapped MMIO regions in a static array
  KVM: arm64: Support host MMIO trap handlers for unmapped devices
  KVM: arm64: Mediate host access to GIC/ITS MMIO via unmapping
  irqchip/gic-v3-its: Prepare shadow structures for KVM host deprivilege
  KVM: arm64: Add infrastructure for ITS emulation setup
  KVM: arm64: Restrict host access to the ITS tables
  KVM: arm64: Trap & emulate the ITS MAPD command
  KVM: arm64: Trap & emulate the ITS VMAPP command
  KVM: arm64: Trap & emulate the ITS MAPC command
  KVM: arm64: Restrict host updates to GITS_CTLR
  KVM: arm64: Restrict host updates to GITS_CBASER
  KVM: arm64 Restrict host updates to GITS_BASER
  KVM: arm64: Implement HVC interface for ITS emulation setup

 arch/arm64/include/asm/kvm_arm.h              |   3 +
 arch/arm64/include/asm/kvm_asm.h              |   1 +
 arch/arm64/include/asm/kvm_pkvm.h             |  20 +
 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h |  17 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   2 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |   3 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  14 +
 arch/arm64/kvm/hyp/nvhe/its_emulate.c         | 653 ++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 134 ++++
 arch/arm64/kvm/hyp/nvhe/setup.c               |  28 +
 arch/arm64/kvm/hyp/pgtable.c                  |   9 +-
 arch/arm64/kvm/pkvm.c                         |  60 ++
 drivers/irqchip/irq-gic-v3-its.c              | 177 ++++-
 include/linux/irqchip/arm-gic-v3.h            |  36 +
 14 files changed, 1126 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/its_emulate.c

-- 
2.53.0.473.g4a7958ca14-goog


