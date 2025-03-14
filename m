Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC63C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HVcDUfdWEV/CxlgnXs/WJ2a6+xXKstleyiakidyOz5Y=; b=KRRDOp/9MwboaMvq3KhYj5QzGr
	C0Xg/ROwqQc/Zp8JaAaU9uiOKk7ejxdH2gDVdicNbUQV8+XQOkEB9BQnK7MoHGtnERA07SNvNINu+
	yGjbECtdeZfTNPLHVyV1IL4ceSU5yNqqRRsg5XZxRG5FUCJP0htL2xCkNZ3DkNa9w3cey/O11zM4I
	xB/zvjFIanSPBQpnIefbXq+mq4QQA2Z83J3bYYwy6N/zrYltsovvvm+b4yEEZ7RGNe+fFoWOTJfs+
	9zlDlEmPmoagXHQpm9JF6EjGvFuCidXnVxrwsSrtCtc9uqWtSI7sCjO7/tJ3KDx4zuFRdaAvTD9M7
	DunXVdnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAm4-0000000F7xE-0UHW;
	Fri, 14 Mar 2025 19:32:52 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAij-0000000F74L-1GCJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 19:29:26 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id E01692033454;
	Fri, 14 Mar 2025 12:29:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E01692033454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741980563;
	bh=HVcDUfdWEV/CxlgnXs/WJ2a6+xXKstleyiakidyOz5Y=;
	h=From:To:Cc:Subject:Date:From;
	b=RT+cdpJMHRpu5zFJKOc4I/uiHnO4Zx4QiWZb67xy0wBe/n2XUGp+EhFp5ZzXIFJ66
	 aybOf8vbQa9elwwrVrw0U0CPjPXQr3NCRdkGjgxum8IdPVjnaXSHScOn/GhUeSdmh/
	 hzp6zRISg9zz6Ccnw0EOD9PfyMPsHp8Qzzkfn1EU=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com,
	ltykernel@gmail.com,
	stanislav.kinsburskiy@gmail.com,
	linux-acpi@vger.kernel.org,
	eahariha@linux.microsoft.com,
	jeff.johnson@oss.qualcomm.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com,
	gregkh@linuxfoundation.org,
	vkuznets@redhat.com,
	prapal@linux.microsoft.com,
	anrayabh@linux.microsoft.com,
	rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net
Subject: [PATCH v6 00/10] Introduce /dev/mshv root partition driver
Date: Fri, 14 Mar 2025 12:28:46 -0700
Message-Id: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122925_389253_A3AF6AE0 
X-CRM114-Status: GOOD (  19.36  )
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

This series introduces support for creating and running guest virtual
machines while running on the Microsoft Hypervisor[0] as root partition.
This is done via an IOCTL interface accessed through /dev/mshv, similar to
/dev/kvm. Another series introducing this support was previously posted in
2021[1], and versions 1-4 of this series were posted in 2023[2].

Patches 1-4 are small refactors and additions to Hyper-V code.
Patches 5-6 just export some definitions needed by /dev/mshv.
Patches 7-9 introduce some functionality and definitions in common code, that
are specific to the driver.
Patch 10 contains the driver code.

-----------------
[0] "Hyper-V" is more well-known, but it really refers to the whole stack
    including the hypervisor and other components that run in Windows
    kernel and userspace.
[1] Previous /dev/mshv patch series (2021) and discussion:
https://lore.kernel.org/linux-hyperv/1632853875-20261-1-git-send-email-nunodasneves@linux.microsoft.com/
[2] v4 (2023):
https://lore.kernel.org/linux-hyperv/1696010501-24584-1-git-send-email-nunodasneves@linux.microsoft.com/

-----------------
Changes since v5:
* Rework patch 1:
 1. Introduce hv_status_printk() logging macros which print the raw HV_STATUS_
    code along with string [Roman Kisel]
 2. Iterate over an array of data items to get the string and errno for the
    hv_result_to_*() functions. [Michael Kelley]
 3. Use hv_status_printk() to log errors in hyperv/irqdomain.c and
    hyperv-iommu.c [Easwar Hariharan]
* Minor cleanup, improvements, and commit wording changes in patches 2, 3, 4, 6
  [Roman Kisel, Easwar Hariharan, Michael Kelley]
* Fix issues with declaration and lifecycle of hv_synic_eventring_tail in patch
  7 [Michael Kelley]
* Improve detail and clarity of commit message in patch 8 [Michael Kelley]
* Minor cleanups in patch 9 - uapi types -> kernel types, #ifdef CONFIG_X86_64
  -> CONFIG_X86 for consistency, fix HVCALL_* ordering, remove redundant
  __packed, use explicit enum value [Stanislav Kinsburskii, Easwar Hariharan,
  Michael Kelley, Tianyu Lan]
* Minor fixes and cleanup in patch 10 [Michael Kelley]
* Add MODULE_DESCRIPTION() to patch 10 [Jeff Johnson]

Changes since v4:
* Slim down the IOCTL interface significantly, via several means:
  1. Use generic "passthrough" call MSHV_ROOT_HVCALL to replace many ioctls.
  2. Use MSHV_* versions of some of the HV_* definitions.
  3. Move hv headers out of uapi altogether, into include/hyperv/, see:
https://lore.kernel.org/linux-hyperv/1732577084-2122-1-git-send-email-nunodasneves@linux.microsoft.com/
* Remove mshv_vtl module altogther, it will be posted in followup series
  * Also remove the parent "mshv" module which didn't serve much purpose
* Update and refactor parts of the driver code for clarity, extensibility

Changes since v3 (summarized):
* Clean up the error and debug logging:
  1. Add a set of macros vp_*() and partition_*() which call the equivalent
     dev_*(), passing the device from the partition struct
     * The new macros also print the partition and vp ids to aid debugging
	   and reduce repeated code
  2. Use dev_*() (mostly via the new macros) instead of pr_*() *almost*
  everywhere - in interrupt context we can't always get the device struct
  3. Remove pr_*() logging from hv_call.c and mshv_root_hv_call.c

Changes since v2 (summarized):
* Fix many checkpatch.pl --strict style issues
* Initialize status in get/set registers hypercall helpers
* Add missing return on error in get_vp_signaled_count

Changes since v1 (summarized):
* Clean up formatting, commit messages

Nuno Das Neves (9):
  hyperv: Log hypercall status codes as strings
  arm64/hyperv: Add some missing functions to arm64
  hyperv: Introduce hv_recommend_using_aeoi()
  acpi: numa: Export node_to_pxm()
  Drivers: hv: Export some functions for use by root partition module
  Drivers: hv: Introduce per-cpu event ring tail
  x86: hyperv: Add mshv_handler() irq handler and setup function
  hyperv: Add definitions for root partition driver to hv headers
  Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs

Stanislav Kinsburskii (1):
  x86/mshyperv: Add support for extended Hyper-V features

 .../userspace-api/ioctl/ioctl-number.rst      |    2 +
 arch/arm64/hyperv/hv_core.c                   |   17 +
 arch/arm64/hyperv/mshyperv.c                  |    1 +
 arch/arm64/include/asm/mshyperv.h             |   13 +
 arch/x86/hyperv/irqdomain.c                   |    6 +-
 arch/x86/kernel/cpu/mshyperv.c                |   16 +-
 drivers/acpi/numa/srat.c                      |    1 +
 drivers/hv/Makefile                           |    5 +-
 drivers/hv/hv.c                               |   12 +-
 drivers/hv/hv_common.c                        |  175 +-
 drivers/hv/hv_proc.c                          |   13 +-
 drivers/hv/mshv.h                             |   30 +
 drivers/hv/mshv_common.c                      |  161 ++
 drivers/hv/mshv_eventfd.c                     |  833 ++++++
 drivers/hv/mshv_eventfd.h                     |   71 +
 drivers/hv/mshv_irq.c                         |  124 +
 drivers/hv/mshv_portid_table.c                |   84 +
 drivers/hv/mshv_root.h                        |  308 +++
 drivers/hv/mshv_root_hv_call.c                |  852 ++++++
 drivers/hv/mshv_root_main.c                   | 2333 +++++++++++++++++
 drivers/hv/mshv_synic.c                       |  665 +++++
 drivers/iommu/hyperv-iommu.c                  |    4 +-
 include/asm-generic/mshyperv.h                |   34 +-
 include/hyperv/hvgdk_mini.h                   |   72 +-
 include/hyperv/hvhdk.h                        |  132 +-
 include/hyperv/hvhdk_mini.h                   |   91 +
 include/uapi/linux/mshv.h                     |  287 ++
 27 files changed, 6266 insertions(+), 76 deletions(-)
 create mode 100644 drivers/hv/mshv.h
 create mode 100644 drivers/hv/mshv_common.c
 create mode 100644 drivers/hv/mshv_eventfd.c
 create mode 100644 drivers/hv/mshv_eventfd.h
 create mode 100644 drivers/hv/mshv_irq.c
 create mode 100644 drivers/hv/mshv_portid_table.c
 create mode 100644 drivers/hv/mshv_root.h
 create mode 100644 drivers/hv/mshv_root_hv_call.c
 create mode 100644 drivers/hv/mshv_root_main.c
 create mode 100644 drivers/hv/mshv_synic.c
 create mode 100644 include/uapi/linux/mshv.h

-- 
2.34.1


