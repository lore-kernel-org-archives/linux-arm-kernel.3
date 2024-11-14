Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8DFD65C69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 10:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LKxg//RS89nhI4Fz7G85TI56YMv7sGenBwSh3euE8ag=; b=NUt4+VSETG4jnF/7rt933ie3Q0
	bS6DEhsORvADo91g7r5ca97hussFdgka8L3Ja8tU74l6WHe6c17+ke8wjukL+JcdV7Y+VJJjJrcHe
	VP1b9z9klKMvfQaeVz5Dgek1gzX8xtBWRbNsV9I1B0SlMWuQDZGTWzP75H9HFP/yDeCu/PtWgV/Go
	e+J9rIQ7JHMAFNuK8Q4gyW98FX07v9xLi1rSipMJhSwIBTSqzOb9izkigus1G7r12H+DeWuY2sikt
	9xdY4ULolhJ2L3wNLb1ashq9Gu1DUiUsTjc5ckokjVVsKuidmztWeqRhQK1aGiTCANyaoFvvC9B2v
	c0OAA31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWnv-00000009Tnx-3NiU;
	Thu, 14 Nov 2024 10:10:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWlo-00000009T5k-0lgz;
	Thu, 14 Nov 2024 10:08:15 +0000
X-UUID: 572ad612a27011ef82ff63e91e7eb18c-20241114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LKxg//RS89nhI4Fz7G85TI56YMv7sGenBwSh3euE8ag=;
	b=sCOaa9kEDqZRJngX1GkB5s9dG1vXffPMCeclfpKlR1OZfG7+4W/D6I6lTUvsXPdnqdE/8eWg+rxnHPEz5e4oK2Zp7UXeU0CCdbbzztIq95avLmShphOmRXCPcu4hWarFWHkzEoC3BKTX/ccm9jN59XQ3T/SAMk00F+J8hQfapBU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:17ba8afa-ad1d-4063-95f1-0e875f0cf876,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:d16b1307-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 572ad612a27011ef82ff63e91e7eb18c-20241114
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 610815924; Thu, 14 Nov 2024 03:08:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Nov 2024 18:08:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Nov 2024 18:08:02 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Cochran
	<richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liju-clr Chen <Liju-clr.Chen@mediatek.com>, Yingshiuan Pan
	<Yingshiuan.Pan@mediatek.com>, Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v13 00/25] GenieZone hypervisor drivers
Date: Thu, 14 Nov 2024 18:07:37 +0800
Message-ID: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_020812_318400_D62205C9 
X-CRM114-Status: GOOD (  23.84  )
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

From: Liju Chen <liju-clr.chen@mediatek.com>

This series is based on linux-next, tag: next-20241114.

GenieZone hypervisor(gzvm) is a type-I hypervisor that supports various
virtual machine types and provides security features such as TEE-like
scenarios and secure boot. It can create guest VMs for security use cases
and has virtualization capabilities for both platform and interrupt.
Although the hypervisor can be booted independently, it requires the
assistance of GenieZone hypervisor kernel driver(gzvm-ko) to leverage the
ability of Linux kernel for vCPU scheduling, memory management, inter-VM
communication and virtio backend support.

Changes in v13:
- Fix deadlock issue when removing module (rmmod) while there are still
  running VMs.
- Introduce a hypervisor version hypercall to check the hypervisor version.
- Introduce gzvm_drv struct to maintain in-module information.
- Reduce blocked duration in the hypervisor when destroying a VM by
  splitting a single hypercall into multiple calls and make the amount of
  work of each call be adjustable.
- Reduce blocked duration in the hypervisor during block-based demand
  paging with the same approach as done for destroying VM.
- Update documentation content based on reviewer's suggestions.
- Fix typos in documentation and YAML files.
- Fix errors reported by checkpatch.pl --codespell.

Changes in v12:
https://lore.kernel.org/lkml/20240730082436.9151-1-liju-clr.chen@mediatek.com/
- Introduce a mechanism to migrate the ARM64 virtual timer from the
  guest VM to the host Linux system when the execution context switches
  from the guest VM to the host.
- Implement CPU idle functionality for guest VMs to reduce CPU usage
  and achieve power savings.
- Emulate Inter-Processor Interrupts (IPI) handling for guest VMs.
- Add Co-developed-by tags, adjust the order of Signed-off-by lines, and
  remove "From:" lines.
- Fix coding style from viewer suggestion.

Changes in v11:
https://lore.kernel.org/all/20240529084239.11478-1-liju-clr.chen@mediatek.com/
- Resolve low memory issue by using only one api to get pages for guest VM.
- The GenieZone hypervisor acts as a vendor firmware to enable platform
  virtualization, offering an implementation that is independent of
  Linux-specific implementations. So, relocate dt-binding yaml file to
  the firmware path, as the dts node is used to confirm the presence of
  the geniezone hypervisor firmware.
- Fix coding style from viewer suggestion and checking tools.

Changes in v10:
https://lore.kernel.org/all/20240412065718.29105-1-yi-de.wu@mediatek.com/
- Optimize memory allocation: query hypervisor demand paging capability
  before VM memory population.
- Fix goto syntax according to ACK reviewer in `gzvm_vcpu.c`.
- Fix coding style from viewer suggestion and checking tools.

Changes in v9:
https://lore.kernel.org/all/20240129083302.26044-1-yi-de.wu@mediatek.com/
- Add gzvm_vm_allocate_guest_page function for demand paging support and
  protected VM memory performance optimization.
- Fix coding style from viewer suggestion and checking tools.

Changes in v8:
https://lore.kernel.org/all/20231228105147.13752-1-yi-de.wu@mediatek.com/
- Add reasons for using dt solution in dt-bindings.
- Add locks for memory pin/unpin and relinquish operations.
- Add VM memory stats in debugfs.
- Add tracing support for hypercall and vcpu exit reasons.
- Enable PTP for timing synchronization between host and guests.
- Optimize memory performance for protected VMs.
- Refactor wording and titles in documentation.

Changes in v7:
https://lore.kernel.org/all/20231116152756.4250-1-yi-de.wu@mediatek.com/
- Rebase these patches to the Linux 6.7-rc1 release.
- Refactor patches 1 to 15 to improve coding style while ensuring they do
  not violate the majority of the changes made in v6
- Provide individual VM memory statistics within debugfs in patch 16.
- Add tracing support for hyper call and vcpu exit_reason.

Changes in v6:
https://lore.kernel.org/all/20230919111210.19615-1-yi-de.wu@mediatek.com/
- Rebase based on kernel 6.6-rc1
- Keep dt solution and leave the reasons in the commit message
- Remove arch/arm64/include/uapi/asm/gzvm_arch.h due to simplicity
- Remove resampler in drivers/virt/geniezone/gzvm_irqfd.c due to defeature
  for now
- Remove PPI in arch/arm64/geniezone/vgic.c
- Refactor vm related components into 3 smaller patches, namely adding vm
  support, setting user memory region and checking vm capability
- Refactor vcpu and vm component to remove unnecessary ARM prefix
- Add demand paging to fix crash on destroying memory page, acclerate on
  booting and support ballooning deflate
- Add memory pin/unpin memory mechanism to support protected VM
- Add block-based demand paging for performance concern
- Response to reviewers and fix coding style accordingly

Changes in v5:
https://lore.kernel.org/all/20230727080005.14474-1-yi-de.wu@mediatek.com/
- Add dt solution back for device initialization
- Add GZVM_EXIT_GZ reason for gzvm_vcpu_run()
- Add patch for guest page fault handler
- Add patch for supporitng pin/unpin memory
- Remove unused enum members, namely GZVM_FUNC_GET_REGS and
  GZVM_FUNC_SET_REGS
- Use dev_debug() for debugging when platform device is available, and use
  pr_debug() otherwise
- Response to reviewers and fix bugs accordingly

Changes in v4:
https://lore.kernel.org/all/20230609085214.31071-1-yi-de.wu@mediatek.com/
- Add macro to set VM as protected without triggering pvmfw in AVF.
- Add support to pass dtb config to hypervisor.
- Add support for virtual timer.
- Add UAPI to pass memory region metadata to hypervisor.
- Define our own macros for ARM's interrupt number
- Elaborate more on GenieZone hyperivsor in documentation
- Fix coding style.
- Implement our own module for coverting ipa to pa
- Modify the way of initializing device from dt to a more discoverable way
- Move refactoring changes into indepedent patches.

Changes in v3:
https://lore.kernel.org/all/20230512080405.12043-1-yi-de.wu@mediatek.com/
- Refactor: separate arch/arm64/geniezone/gzvm_arch.c into
  vm.c/vcpu.c/vgic.c
- Remove redundant functions
- Fix reviewer's comments

Changes in v2:
https://lore.kernel.org/all/20230428103622.18291-1-yi-de.wu@mediatek.com/
- Refactor: move to drivers/virt/geniezone
- Refactor: decouple arch-dependent and arch-independent
- Check pending signal before entering guest context
- Fix reviewer's comments

Initial Commit in v1:
https://lore.kernel.org/all/20230413090735.4182-1-yi-de.wu@mediatek.com/

Jerry Wang (6):
  virt: geniezone: Add memory region purpose for hypervisor
  virt: geniezone: Add dtb config support
  virt: geniezone: Add memory pin/unpin support
  virt: geniezone: Add memory relinquish support
  virt: geniezone: Provide individual VM memory statistics within
    debugfs
  virt: geniezone: Reduce blocked duration in hypervisor when destroying
    a VM

Kevenny Hsieh (3):
  virt: geniezone: Enable PTP for synchronizing time between host and
    guest VMs
  virt: geniezone: Add support for guest VM CPU idle
  virt: geniezone: Emulate IPI for guest VM

Liju Chen (1):
  virt: geniezone: Add tracing support for hyp call and vcpu exit_reason

Willix Yeh (1):
  virt: geniezone: Add support for virtual timer migration

Yingshiuan Pan (14):
  virt: geniezone: enable gzvm-ko in defconfig
  docs: geniezone: Introduce GenieZone hypervisor
  dt-bindings: hypervisor: Add MediaTek GenieZone hypervisor
  virt: geniezone: Add GenieZone hypervisor driver
  virt: geniezone: Add vm support
  virt: geniezone: Add set_user_memory_region for vm
  virt: geniezone: Add vm capability check
  virt: geniezone: Add vcpu support
  virt: geniezone: Add irqchip support for virtual interrupt injection
  virt: geniezone: Add irqfd support
  virt: geniezone: Add ioeventfd support
  virt: geniezone: Optimize performance of protected VM memory
  virt: geniezone: Add demand paging support
  virt: geniezone: Add block-based demand paging support

 .../bindings/firmware/mediatek,geniezone.yaml |  34 +
 Documentation/virt/geniezone/introduction.rst |  87 +++
 Documentation/virt/index.rst                  |   1 +
 MAINTAINERS                                   |  11 +
 arch/arm64/Kbuild                             |   1 +
 arch/arm64/configs/defconfig                  |   2 +
 arch/arm64/geniezone/Makefile                 |   9 +
 arch/arm64/geniezone/gzvm_arch_common.h       | 120 ++++
 arch/arm64/geniezone/hvc.c                    |  73 ++
 arch/arm64/geniezone/vcpu.c                   |  96 +++
 arch/arm64/geniezone/vgic.c                   |  50 ++
 arch/arm64/geniezone/vm.c                     | 511 ++++++++++++++
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/geniezone/Kconfig                |  16 +
 drivers/virt/geniezone/Makefile               |  12 +
 drivers/virt/geniezone/gzvm_common.h          |  12 +
 drivers/virt/geniezone/gzvm_exception.c       | 112 +++
 drivers/virt/geniezone/gzvm_ioeventfd.c       | 281 ++++++++
 drivers/virt/geniezone/gzvm_irqfd.c           | 382 +++++++++++
 drivers/virt/geniezone/gzvm_main.c            | 352 ++++++++++
 drivers/virt/geniezone/gzvm_mmu.c             | 249 +++++++
 drivers/virt/geniezone/gzvm_vcpu.c            | 332 +++++++++
 drivers/virt/geniezone/gzvm_vm.c              | 642 ++++++++++++++++++
 include/linux/soc/mediatek/gzvm_drv.h         | 301 ++++++++
 include/trace/events/geniezone.h              |  84 +++
 include/uapi/linux/gzvm.h                     | 407 +++++++++++
 26 files changed, 4179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,geniezone.yaml
 create mode 100644 Documentation/virt/geniezone/introduction.rst
 create mode 100644 arch/arm64/geniezone/Makefile
 create mode 100644 arch/arm64/geniezone/gzvm_arch_common.h
 create mode 100644 arch/arm64/geniezone/hvc.c
 create mode 100644 arch/arm64/geniezone/vcpu.c
 create mode 100644 arch/arm64/geniezone/vgic.c
 create mode 100644 arch/arm64/geniezone/vm.c
 create mode 100644 drivers/virt/geniezone/Kconfig
 create mode 100644 drivers/virt/geniezone/Makefile
 create mode 100644 drivers/virt/geniezone/gzvm_common.h
 create mode 100644 drivers/virt/geniezone/gzvm_exception.c
 create mode 100644 drivers/virt/geniezone/gzvm_ioeventfd.c
 create mode 100644 drivers/virt/geniezone/gzvm_irqfd.c
 create mode 100644 drivers/virt/geniezone/gzvm_main.c
 create mode 100644 drivers/virt/geniezone/gzvm_mmu.c
 create mode 100644 drivers/virt/geniezone/gzvm_vcpu.c
 create mode 100644 drivers/virt/geniezone/gzvm_vm.c
 create mode 100644 include/linux/soc/mediatek/gzvm_drv.h
 create mode 100644 include/trace/events/geniezone.h
 create mode 100644 include/uapi/linux/gzvm.h

-- 
2.18.0


