Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95FFD262A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 21:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwMx1fGfc/oMBGTHztc/dxOH22dYYQr047Mb7LvAKtc=; b=3b9XAVHt0pT4ZXg5V507Zj/xBI
	NtBqk+tqbaMR4IBjTDA/VDX5HGEA2KxRuvKHfjVxL0wvz7mYKXE5bRD2cZc3lm7eoQuip5rgJAooj
	HXhj9xoEwAdMAdLCUege+9+IQ8QW0wY7sR9gb3Sr6F4OIzCF0KQSoyET8TSmI6Cj9iBdinIZfBIxV
	DawGIIsnRI5WySaQfVKS20TQRzqOk4XvB/NnbrEJVPB7Lemaecn9U5mtzfY3U8nF6cbp7ilvEixCK
	LjKFub9MZlluSg7UlLvPRoV7N5uNof+7eBZrFjMMlNilgj3PgtQO3vmd4Wv3+FbVlwe7NLxHnpGN4
	+5MMqvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJcU-00000004VUN-2FGC;
	Tue, 20 Jan 2026 21:50:38 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJcS-00000004VTu-1rcG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 21:50:37 +0000
Received: from localhost (unknown [20.236.11.185])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8301220B7167;
	Tue, 20 Jan 2026 13:50:33 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8301220B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768945834;
	bh=DwMx1fGfc/oMBGTHztc/dxOH22dYYQr047Mb7LvAKtc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XdU2nnEITnohdXjTAjZux5Tf14cVyNK+1C0eGq/oK+KE1lzbPRUSq+ZyoEC65z6Nu
	 428sRK77k7ioALgSM4txW6tNcXrwJ2u07BXXVCqLB4vhBS/Keavg5KXscUf6CpEo6j
	 ONB3467l8VndQ/7q+tIfu5XMSAqJ2PcV4iH0KMsk=
Date: Tue, 20 Jan 2026 13:50:32 -0800
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arch@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
 nunodasneves@linux.microsoft.com, mhklinux@outlook.com
Subject: Re: [PATCH v0 00/15] PCI passthru on Hyper-V (Part I)
Message-ID: <20260120134933.00004f2a@linux.microsoft.com>
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
Organization: LSG
X-Mailer: Claws Mail 3.21.0 (GTK+ 2.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_135036_533630_866834C5 
X-CRM114-Status: GOOD (  23.14  )
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

Hi Mukesh,

On Mon, 19 Jan 2026 22:42:15 -0800
Mukesh R <mrathor@linux.microsoft.com> wrote:

> From: Mukesh Rathor <mrathor@linux.microsoft.com>
>=20
> Implement passthru of PCI devices to unprivileged virtual machines
> (VMs) when Linux is running as a privileged VM on Microsoft Hyper-V
> hypervisor. This support is made to fit within the workings of VFIO
> framework, and any VMM needing to use it must use the VFIO subsystem.
> This supports both full device passthru and SR-IOV based VFs.
>=20
> There are 3 cases where Linux can run as a privileged VM (aka MSHV):
>   Baremetal root (meaning Hyper-V+Linux), L1VH, and Nested.
>=20
I think some introduction/background to L1VH would help.

> At a high level, the hypervisor supports traditional mapped iommu
> domains that use explicit map and unmap hypercalls for mapping and
> unmapping guest RAM into the iommu subsystem.
It may be clearer to state that the hypervisor supports Linux IOMMU
paging domains through map/unmap hypercalls, mapping GPAs to HPAs using
stage=E2=80=912 I/O page tables.

> Hyper-V also has a
> concept of direct attach devices whereby the iommu subsystem simply
> uses the guest HW page table (ept/npt/..). This series adds support
> for both, and both are made to work in VFIO type1 subsystem.
>=20
This may warrant introducing a new IOMMU domain feature flag, as it
performs mappings but does not support map/unmap semantics in the same
way as a paging domain.

> While this Part I focuses on memory mappings, upcoming Part II
> will focus on irq bypass along with some minor irq remapping=20
> updates.
>=20
> This patch series was tested using Cloud Hypervisor verion 48. Qemu
> support of MSHV is in the works, and that will be extended to include
> PCI passthru and SR-IOV support also in near future.
>=20
> Based on: 8f0b4cce4481 (origin/hyperv-next)
>=20
> Thanks,
> -Mukesh
>=20
> Mukesh Rathor (15):
>   iommu/hyperv: rename hyperv-iommu.c to hyperv-irq.c
>   x86/hyperv: cosmetic changes in irqdomain.c for readability
>   x86/hyperv: add insufficient memory support in irqdomain.c
>   mshv: Provide a way to get partition id if running in a VMM process
>   mshv: Declarations and definitions for VFIO-MSHV bridge device
>   mshv: Implement mshv bridge device for VFIO
>   mshv: Add ioctl support for MSHV-VFIO bridge device
>   PCI: hv: rename hv_compose_msi_msg to hv_vmbus_compose_msi_msg
>   mshv: Import data structs around device domains and irq remapping
>   PCI: hv: Build device id for a VMBus device
>   x86/hyperv: Build logical device ids for PCI passthru hcalls
>   x86/hyperv: Implement hyperv virtual iommu
>   x86/hyperv: Basic interrupt support for direct attached devices
>   mshv: Remove mapping of mmio space during map user ioctl
>   mshv: Populate mmio mappings for PCI passthru
>=20
>  MAINTAINERS                         |    1 +
>  arch/arm64/include/asm/mshyperv.h   |   15 +
>  arch/x86/hyperv/irqdomain.c         |  314 ++++++---
>  arch/x86/include/asm/mshyperv.h     |   21 +
>  arch/x86/kernel/pci-dma.c           |    2 +
>  drivers/hv/Makefile                 |    3 +-
>  drivers/hv/mshv_root.h              |   24 +
>  drivers/hv/mshv_root_main.c         |  296 +++++++-
>  drivers/hv/mshv_vfio.c              |  210 ++++++
>  drivers/iommu/Kconfig               |    1 +
>  drivers/iommu/Makefile              |    2 +-
>  drivers/iommu/hyperv-iommu.c        | 1004
> +++++++++++++++++++++------ drivers/iommu/hyperv-irq.c          |
> 330 +++++++++ drivers/pci/controller/pci-hyperv.c |  207 ++++--
>  include/asm-generic/mshyperv.h      |    1 +
>  include/hyperv/hvgdk_mini.h         |   11 +
>  include/hyperv/hvhdk_mini.h         |  112 +++
>  include/linux/hyperv.h              |    6 +
>  include/uapi/linux/mshv.h           |   31 +
>  19 files changed, 2182 insertions(+), 409 deletions(-)
>  create mode 100644 drivers/hv/mshv_vfio.c
>  create mode 100644 drivers/iommu/hyperv-irq.c
>=20


