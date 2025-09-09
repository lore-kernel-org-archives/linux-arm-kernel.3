Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0703FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GQXZNPBz0DhvyMwtEtFgMvcxMmecvXfOavBE9BmZlWw=; b=KPl5iqHBVGZ4r0hyLkr4iOaLqP
	YudF+MZsF8S7Dwii0cgebZVa7PV9hZs4DaG4DX4BaXEB9F3xY+yLGjx0pztk/EBdPF+EFnr5VTTJL
	W7EMIeJsM9Kw75Qb8C3OQcu4mgxgxqnS8TbGtHigtS6Gq9NyF7MF7o2w4CYqveaONPDdKcjmG8YxX
	F8n5UkikUhJ7FTx3CVt3/rAe7inO+NIKl1TGWUqJHGEgJbGzmD/uPbI4EFtdJC4MYk8i9FzJW7/GV
	HS8qT1cRaeXPIo3RUVWR+8WAqmyGRcPTPPrBdCaVWNgrCzwx7t8qDV5stO4PWbZVJdYReqqewCmO6
	EbwvjZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26B-000000094BC-3C9Q;
	Tue, 09 Sep 2025 17:25:43 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Xu-00000008Fkf-1pMe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 15:46:17 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id B885E2119CBC;
	Tue,  9 Sep 2025 08:46:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B885E2119CBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1757432767;
	bh=GQXZNPBz0DhvyMwtEtFgMvcxMmecvXfOavBE9BmZlWw=;
	h=From:To:Cc:Subject:Date:From;
	b=HjjrcaIWlpWgjhW/CFD+kkQkerGsFe8lAQDD80BJGmzKxaF01/OQU+MxbCvv2TcdV
	 UdBQ8sxJ8WS0dc2zy2+KHeNft7I2WQkuSQdcH0qo+aDeiGWetjzL4cJZRHptjEcodd
	 7kt4SmQ5D45cHazLv5NssPuCXeI+1wIlWDMbZY4U=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: thierry.reding@gmail.com,
	robin.murphy@arm.com,
	robh@kernel.org,
	joro@8bytes.org,
	jgg@ziepe.ca
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	virtualization@lists.linux.dev,
	will@kernel.org,
	jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com,
	code@tyhicks.com,
	eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com,
	saravanak@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lizhi.hou@amd.com,
	clement.leger@bootlin.com
Subject: [PATCH v4 0/4] arm-smmu: select suitable MSI IOVA
Date: Tue,  9 Sep 2025 08:45:56 -0700
Message-Id: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_084614_582700_4B796CDE 
X-CRM114-Status: GOOD (  16.20  )
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

Hi,

Currently, the MSI_IOVA_BASE address is hard-coded to 0x80000000,
assuming that all platforms have this address available for MSI IOVA
reservation. However, this is not always the case, as some platforms
reserve this address for other purposes. Consequently, these platforms
cannot reserve the MSI_IOVA_BASE address for MSI.

There was an [1] attempt to fix this problem by passing the MSI IOVA
base as a kernel command line parameter.

The faulty iommu-addresses can be reserved in DTS and suitable MSI_IOVA
can be selected (Suggested by Jason), However, for individual PCI
devices of_iommu driver can't reserve iommu-addresses as these devices
doesn't inherit parent DTS properties.

There are at least 3 ways to reserve iommu-addresses for individual PCI
devices,
 - 1) By dynamically adding DTS nodes for individual PCI devices using
   [2] CONFIG_PCI_DYNAMIC_OF_NODES, this requires hardcoding PCI device
   IDs in DECLARE_PCI_FIXUP_FINAL

 - 2) By adding PCI devices nodes either in DTS or by modifying FDT at
   boot time in the firmware, eg [3] However, of_iommu driver doesn't
   seem to handle individual PCI devices, additionally this approach
   doesn't seem to much scalable for the complex PCI hierarchy

 - 3) By configuring PCI host controller DTS node for PCI device so that it
   can inherit iommu-addresses defined in the parent node.

This patch series aims to address both the problems described above: 
- select suitable MSI IOVA when the default MSI IOVA conflicts with
  reserved iommu addresses 
- Using 3) approach appropriately handle iommu-addresses for individual
  PCI devices during IOMMU configuration


This patch series accommodates platforms that do not have the default MSI
base address available for MSI reservation by implementing both solutions
described above.

[1]: https://lore.kernel.org/lkml/20200914181307.117792-1-vemegava@linux.microsoft.com/
[2]: https://lwn.net/Articles/939317/
[3]: https://elixir.bootlin.com/linux/v6.16/source/arch/arm64/boot/dts/nvidia/tegra186.dtsi#L1388

Thanks,
Shyam

---
v4:
- Add warn message to indicate MSI IOVA reservation issue
- Fix loop condition in arm_smmu_get_resv_regions()
- Refactor arm_smmu_get_resv_regions() by introducing iommu_set_sw_msi()
  helper function

v3:
- Drop "arm,smmu-faulty-msi-iova" property change
- Fix iommu driver device tree configuration for PCI devices
- Use "iommu-addresses" property to identify reserved MSI IOVA regions,
  and introduce an additional MSI_IOVA_BASE2 macro to select a suitable
  MSI IOVA base if the default overlaps with a reserved region (suggested by Jason)
Link: https://lore.kernel.org/linux-iommu/20250806215539.1240561-1-shyamsaini@linux.microsoft.com/

v2:
- add new dts property to hold faulty MSI IOVA and select appropriate
  MSI IOVA address
Link: https://lore.kernel.org/linux-iommu/20250410225030.2528385-1-shyamsaini@linux.microsoft.com/

v1:
Link: https://lore.kernel.org/linux-iommu/20250116232307.1436693-1-shyamsaini@linux.microsoft.com/

Shyam Saini (4):
  arm-smmu: move MSI_IOVA macro definitions
  iommu/of: fix device tree configuration for PCI devices
  arm-smmu: select suitable MSI IOVA
  drivers: iommu: refactor arm_smmu_get_resv_regions

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 13 ++-----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  3 --
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 16 ++------
 drivers/iommu/iommu.c                       | 37 ++++++++++++++++++
 drivers/iommu/of_iommu.c                    | 11 ++++++
 drivers/iommu/virtio-iommu.c                |  2 -
 include/linux/iommu.h                       | 42 +++++++++++++++++++++
 7 files changed, 96 insertions(+), 28 deletions(-)

-- 
2.34.1


