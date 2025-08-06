Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FB1C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 22:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EB5F7X0QTQBLYUeJTZBsEDkMArE5SLaRkOQ9lia3kO8=; b=jJDTN2qBX3V5wcuScypPVF0xkI
	1XE5IH9mTqLUNub1BI8X264NRXAznAN/zlasB3LmI8APXBft+PqSqxIFjy21updSRm3T0kFm1y5pp
	NS6yCnkuZ2Y+iK7KqQWHF1NdWNhlnrDw0+rbMAUHRg8qnxAnBQgBn3s5QJV9VBm96rrW8WmCRnxwq
	pbyWYdGNuI2IJwvqffp4lzapbdbmhbABaXx0/E6ZKHTEaS/6hOKAJKM3OVmBZkVVhO1kyPCeKc0RU
	rRHS/ahbPg1SbVwAB5G8SdjHAPXcVIAL1mojK2JxNFxhRWFb486LQuXHv2vfdRwMOWtTAjvsd5PfG
	AgKAoozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmQu-0000000GhqC-3DXX;
	Wed, 06 Aug 2025 22:16:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm7A-0000000GegS-437U
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 21:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EB5F7X0QTQBLYUeJTZBsEDkMArE5SLaRkOQ9lia3kO8=; b=FYetUyuRoNlZUCiOsJFNAqoIhs
	wkB8tNEvBt9QEaGOSFztYSLwwXtP/ZH2Whv1k5elK9YcFeAgYKaxyI3O3LluVCi3ZmdCOBrd+boWO
	xM/nVg6KrUxJsj3wSRtMwTC0ONhy5dzexGR4gm/T+DzNj+26o+K5HKP6PGbxevGJ61fVpjfIg18vp
	5tOreli3uN/O1mV+hYcl7YhY7zEEULBDOdj2b3gOUqVodHZ9ja3mXBVqqM/MGuT+NPiVpRVrIUsIk
	n9iDxoJY2fpunXhWcBHQjzkcJaCzP0XxQePtI+ZykhCfGRX3Im62GChPKP8QUs2MBXSL5pV5Sbj5f
	KGpQ6tMg==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm73-0000000ER8F-3gR2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 21:56:02 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [40.65.108.177])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6D9BD2018F33;
	Wed,  6 Aug 2025 14:55:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6D9BD2018F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1754517348;
	bh=EB5F7X0QTQBLYUeJTZBsEDkMArE5SLaRkOQ9lia3kO8=;
	h=From:To:Cc:Subject:Date:From;
	b=rfGsuz8deZNit4jb/h6AAxRxsJrJRm5iHZARB0RYBxr38DNSJnTp1Pl6AJBdkQ4dE
	 vl7PB/Pg8MKcRk6pIMjkzLlMaZbc+RdW0Qzm28cyv0SnwA3+WKl+gQOtRGZhKGUG99
	 hb5kWS7YYT/TdX46xMv7YyL7BhxMr1/weJku+I2U=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: jgg@ziepe.ca,
	will@kernel.org,
	jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com,
	code@tyhicks.com,
	eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com
Subject: [PATCH v3 0/3] arm-smmu: select suitable MSI IOVA
Date: Wed,  6 Aug 2025 14:55:36 -0700
Message-Id: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_225559_132977_F43E86E7 
X-CRM114-Status: GOOD (  10.64  )
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

This patch series aims to address the issue by reserving faulty MSI_IOVA
and selecting suitable MSI IOVA address for a given platform.

This approach accommodates platforms that do not have the default MSI base address
available for MSI reservation.

[1]: https://lore.kernel.org/lkml/20200914181307.117792-1-vemegava@linux.microsoft.com/

Thanks,
Shyam

---
v3:
- Drop "arm,smmu-faulty-msi-iova" property change
- Fix iommu driver device tree configuration for PCI devices
- Use "iommu-addresses" property to identify reserved MSI IOVA regions,
  and introduce an additional MSI_IOVA_BASE2 macro to select a suitable
  MSI IOVA base if the default overlaps with a reserved region (suggested by Jason)

v2:
- add new dts property to hold faulty MSI IOVA and select appropriate
  MSI IOVA address
Link: https://lore.kernel.org/linux-iommu/20250410225030.2528385-1-shyamsaini@linux.microsoft.com/

v1:
Link: https://lore.kernel.org/linux-iommu/20250116232307.1436693-1-shyamsaini@linux.microsoft.com/

Shyam Saini (3):
  arm-smmu: move MSI_IOVA macro definitions
  iommu/of: fix device tree configuration for PCI devices
  arm-smmu: select suitable MSI IOVA

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27 ++++++++++++++-----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  3 ---
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 30 ++++++++++++++-------
 drivers/iommu/of_iommu.c                    | 11 ++++++++
 drivers/iommu/virtio-iommu.c                |  2 --
 include/linux/iommu.h                       | 28 +++++++++++++++++++
 6 files changed, 79 insertions(+), 22 deletions(-)

-- 
2.34.1


