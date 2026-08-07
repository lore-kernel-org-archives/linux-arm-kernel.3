Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069F9C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v26QekWjf9eH2OeAer5pKNY67Fs+em5JTtiXnChoKig=; b=10y/upDfT1cJDawkNcTUCYERB1
	qRCBb+Xp27oDI1DcCJ+Jtzuf/Xti4s2wL8rTzdS8NEUWCmEIjhG28GPaLk1ig3Gk/C/7VEicQ0OXT
	mgVpanAAXNC79RYQsAO4Z4UqOUbdHgH8jmyYrwEZ0EiDzpA9j0092EgDcy9ZXiGl7Pft+AdB7b1WE
	sfxxXaSzfUiqwtc2cYzLOvfYR0BXtYX4fm292vAN/5ggYL+2/fNDetPMHJH6CpWiD3wvXXGYHtLqE
	yvtyQfBMXPDIFkrCpxHti6+NczQ8hulf5nAjpPEBCXK+MBhBWn5Zeecr2dWeaCMlilf33w0YopLxB
	GYhJEY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfb-00000008Rzt-14kt;
	Fri, 07 Aug 2026 16:43:43 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfY-00000008Rz0-4BHS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:42 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-698af52daa4so3338183a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121018; x=1786725818; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v26QekWjf9eH2OeAer5pKNY67Fs+em5JTtiXnChoKig=;
        b=I2LB4+Kv9mxxteb1Xad9p+IEiveQT6C8+0WDB3YKzqeqVukDntz3Lybyj+768WxCNm
         LavQiXbFXwEGfSr7v2NEQmxb7FAZpSuXyHXBmBObo6wmAJ1IZvlMfqUGORmPFG8TyYxL
         DBD1lWoXQZOSNIcKUo+nUx10KKC0c1HBv+x9MXTJi9/vKo3ztNHIsQSqNssngEe1GNT8
         j4G0Gd6uz6HNsEz9lO8Q26QKLWJv+5mIgA4vXjIBhq2LxBYARX4E+l7zbQLMZwCMxUPv
         oUbrv4H0iWBLydrn0b6EpQWX7YMfdAF+Uq/4V94ku1MwH5wPvQJBpAMby23520EfsjrI
         LWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121018; x=1786725818;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v26QekWjf9eH2OeAer5pKNY67Fs+em5JTtiXnChoKig=;
        b=s8Ynm0yIN2WKDgeBAvBTGubH3ed4IUoVuTAyDWBEXzxp/sKcCnFxbsw+DG6HK+A6Vo
         ZQKih++T96wgl5dvEVjJ7LwohVHxQ4denslzjwnpNTT+fjX/tzOD9NCGRE18pmJjqFHr
         j1NW1Zcs8TAVU3Trxy7ljwOkqk97vVcnJ/hUXgMSCc2N0i8Oq/0tZYW0tA/lwT2iD5mw
         dPO8HlfjLB+ur5iNk4KGAPoVcTaNjDoBWq5rtgb5lO1+NPEppyd4EWP4otxdGNYSDJKL
         qkVC9dfxrFfFglwy5/AIuMwLmbhs9VfQOqgWadV/srdem2uRrxYkVPMpTigS/hTGelo1
         r5lg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1jhkpXwpFiHr2kbK4UKIMZm8nNXJuxo/hE7jfKWJV72uPUoksFW9ct+NHCzLrvbBLtd8Mje6tdkqFq5IPvEj8@lists.infradead.org
X-Gm-Message-State: AOJu0YwI+fw0mxHQDMhZKP9n3Oob7jYv1Q5vMRJhk38BBpW1CDWsDF3W
	7IAB+YWuKlAKnNai2v3UxRaBHq2MdgnNgCfP7l7RExe8p+I0accNrj17PwNXUWzbj+26s2Dlfcc
	Mthzf0Yv5Z78yXYEmDWA4x4EgHh6oIA==
X-Received: from educ11.prod.google.com ([2002:a05:6402:100b:b0:6a0:7d05:aecc])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5416:b0:699:fbe4:16d5 with SMTP id 4fb4d7f45d1cf-6a14f07bde3mr14496650a12.1.1786121018308;
 Fri, 07 Aug 2026 09:43:38 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:10 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-2-sebastianene@google.com>
Subject: [PATCH v2 00/13] KVM: ITS hardening for pKVM
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org
Cc: kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, sebastianene@google.com, 
	seiden@linux.ibm.com, smostafa@google.com, tglx@kernel.org, 
	vdonnefort@google.com, vladimir.murzin@arm.com, yuzenghui@huawei.com, 
	zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094341_084620_0DAEFF36 
X-CRM114-Status: GOOD (  41.62  )
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

This is required because the ITS is in complete host control and can issue
transactions on the memory bus without having any protection in front of it
(IOMMU or SMMU). With pKVM this makes it an interesting target for crossing the
hypervisor privilege boundary because with pKVM the security model is
that the host is untrusted. 

Patches overview
================

The first patch is an adaptation of Mostafa's patch for donating MMIO to
the hypervisor which can be found here [1]

[1] https://lore.kernel.org/all/20260715115906.2664882-3-smostafa@google.com/

The only difference is that this maps MMIO in the linear space of the
hypervisor, but after discussing with him on the list [2]
(https://lore.kernel.org/all/anMwxy9gEEt_Wu6M@google.com/) he seems to be
more inclined to having the IO in the private VA mapping space. For
simplicity, I used the linear map but I am happy to change it this is
required as it doesn't change the code too much.

The next 2 patches add some basic infrastructure to be able to keep
track of the unmapped MMIO regions from the host and invoke a handler
when a stage-2 data abort happens in that region.

The 4th patch looks up the ITS node from the device tree and adds it to
an array of unmapped devices. It install a handler that forwards all the
MMIO request to mediate the host access inside the emulation layer and
to prevent breaking ITS functionality. 

The 5th patch changes the GIC/ITS driver to exposes two new methods
which will be called from the KVM layer to setup the shadow state and
to take the appropriate locks.

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

The next patches restrict the access of the host to certain registers
and prevent undefined behaviour. Prevent the host from re-programming
the tables held in the GITS_BASER register.

The last patch introduces an hvc to setup the ITS emulation and calls
into the ITS driver to setup the shadow state. 

Design
======


1. Command queue shadowing

The ITS hardware supports a command queue which is programmed by the driver
in the GITS_CBASER register. When ITS emulation is enabled, the ITS
driver allocated a copy of the original command queue and uses the copy
and the emulation layer restricts the access to the original queue for
the host. When the driver sends a command to the mirrored queue, the
emulation traps on the write to GITS_CWRITER register and validates the
command before writing it over to the original queue. 


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

Testing
=======

Verified that it boots in Qemu using the following arguments:
"-machine virt,virtualization=true,gic-version=4,its=true,iommu=smmuv3,acpi=off"

and enabled Qemu tracing using the following argument: '--trace "gicv3_its_*"'
Qemu reports a bunch of events due to virtio-block using the ITS to
raise MSIs and I can see the accesses made by the device to the
GITS_TRANSLATER register.

Wrote a PoC [3] which uses a DEVMEM like interface to poke the ITS
directly from userspace to achieve controlled write to hyp protected
memory and verified that this is not possible anymore when the
sanitization is in place.

[3] [https://github.com/sebastianene07/gic-its-poc/blob/main/its.c]


What is not covered
===================

Only a subset of the commands is sanitized & covered: vLPI commands are
not covered at all and the Redistributor hardeninig is not covered. 


Changelog
=========

v1 -> v2:
 - fixed a bunch of functional errors in the parsing of the MAPD command
 - renamed the functions exported from the GIC driver, made the
   allocation GFP_ATOMIC, make it accepts a flags arg
 - renamed the entry point in the emulation and make it so that it
   accepts the size of pages that we use for the private state
 - added support for rollback on certain commands that timeout on
   hardware
 - clarified commit messages 

Previous posting:
################

v1: https://lore.kernel.org/all/20260310124933.830025-1-sebastianene@google.com/


 Mostafa Saleh (1):
  KVM: arm64: Donate MMIO to the hypervisor

Sebastian Ene (12):
  KVM: arm64: Track host-unmapped MMIO regions in a static array
  KVM: arm64: Support host MMIO trap handlers for unmapped devices
  KVM: Parse the device tree and register the ITS region with pKVM
  irqchip/gic-v3-its: Add support for the ITS emulation setup
  KVM: arm64: Shadow the ITS command queue and setup emulation
  KVM: arm64: Restrict host access to the private ITS tables
  KVM: arm64: Trap & emulate the ITS MAPD command
  KVM: arm64: Trap & emulate the ITS MAPC command
  KVM: arm64: Restrict host updates to GITS_CTLR
  KVM: arm64: Prevent the host from specifying a different command queue
  KVM: arm64: Prevent the host from programming new GITS_BASER tables
  KVM: arm64: Implement HVC interface for ITS emulation setup

 arch/arm64/include/asm/kvm_arm.h              |   2 +
 arch/arm64/include/asm/kvm_asm.h              |   1 +
 arch/arm64/include/asm/kvm_pkvm.h             |  18 +
 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h |  14 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   7 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |   3 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  16 +
 arch/arm64/kvm/hyp/nvhe/its_emulate.c         | 827 ++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 189 +++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  27 +
 arch/arm64/kvm/hyp/pgtable.c                  |  11 +-
 arch/arm64/kvm/pkvm.c                         |  76 +-
 drivers/irqchip/irq-gic-v3-its.c              | 169 +++-
 include/linux/irqchip/arm-gic-v3.h            |  51 ++
 14 files changed, 1379 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/its_emulate.c

-- 
2.55.0.654.g21b8a5bc05-goog


