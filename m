Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FFECD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/rvMeUsp+Th3MTKB/4X5GkEFsXCvCrhahVYSvDtQ1Y=; b=Ja62DWtnScxzdJdOw+eWusjYXB
	vVNaYnzll3oDFVNi8XqjkZhfWB9CPlIBKATvvuhlIM+KdQZpZRmv4u4SAktZygbSKIjNUUIdcqYX1
	owP0rJK5dWEr4Ia32Oi7CcvhNliw4XqNw4owfZSQ6sD8pJLtlYCh0u32TDtnxlMuDFOl3RTSHQkoK
	YfyYI9n1oI0lEkkdLGA7x6UpuUryjelGmrz2EEkrLR40NhjHDFqojtyYcektJhuSdy4xOKXsvQmeZ
	lawudB+qT2xFE2U7PRrDWYb/I4ezy0TvY+6yXzqBO5tLOYil1KK8qc3pQCGaFg5/KjNgopBZyfFH9
	QYar4zGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdq1-00000001EuQ-35vg;
	Wed, 06 May 2026 15:07:01 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdpz-00000001Et2-3nfD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1778080019; x=1809616019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U/rvMeUsp+Th3MTKB/4X5GkEFsXCvCrhahVYSvDtQ1Y=;
  b=QIZ9/1RiELaA68XvmXg7AJdSTJ6d76i5h0vSH70prnLuJMo4fmubXHDE
   dYmvFJ9p/owPih1PU6PBTrU9iODhaPxdKE2+3HYfG865S/tZdCCOxn9bj
   d6mJ/QijeOWrE1mKwjSHgP06ClX7ENWxJQX9XxRzBR60/7KYa1mt47fA0
   rx1G+CjAokQdyVp+9ST3Tokiu72SuYCsl+vQiOmmig4PrPCtYxSo5Wm7J
   qMMOgvsUiKcnC0Vg9dYTGqXWCowrjUEtFXmOTFIcgOrBUzKBsUvxwos7h
   jPmDxi0NLD4FObfebCvbzZj3iOy0wdCEa8z8pFya0hxALC1AZ7MI+yQW0
   w==;
X-CSE-ConnectionGUID: pBgyRvOKTPKCQgsJmnMkdA==
X-CSE-MsgGUID: plt9Ar9xQ5mQMllXEPvCpg==
X-IronPort-AV: E=Sophos;i="6.23,219,1770595200"; 
   d="scan'208";a="19005044"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 15:06:55 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:23550]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.153:2525] with esmtp (Farcaster)
 id b8767516-fa69-4398-a5c2-3a41f5800182; Wed, 6 May 2026 15:06:55 +0000 (UTC)
X-Farcaster-Flow-ID: b8767516-fa69-4398-a5c2-3a41f5800182
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 6 May 2026 15:06:55 +0000
Received: from dev-dsk-yigitogu-1a-d17f6574.eu-west-1.amazon.com
 (172.19.100.7) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Wed, 6 May 2026
 15:06:53 +0000
From: Yigit Oguz <yigitogu@amazon.de>
To: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
	<baolu.lu@linux.intel.com>, <dwmw2@infradead.org>,
	<suravee.suthikulpanit@amd.com>
CC: <jgg@ziepe.ca>, <nicolinc@nvidia.com>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Yigit Oguz" <yigitogu@amazon.de>, Lilit Janpoladyan <lilitj@amazon.com>
Subject: [PATCH 2/3] iommu/vt-d: Add PCI segment and vendor:device ID to DMAR fault logs
Date: Wed, 6 May 2026 15:05:38 +0000
Message-ID: <20260506150541.60467-3-yigitogu@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506150541.60467-1-yigitogu@amazon.de>
References: <20260506150541.60467-1-yigitogu@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [172.19.100.7]
X-ClientProxiedBy: EX19D036UWB001.ant.amazon.com (10.13.139.133) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_080700_979608_B157A0B8 
X-CRM114-Status: GOOD (  12.75  )
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

Include the full SSSS:BB:DD.F address with PCI segment and
vendor:device ID (VVVV:DDDD) in DMAR fault messages. Uses
iommu->segment for the PCI domain and pci_get_domain_bus_and_slot
to look up the pci_dev. Falls back to segment:BDF without
vendor:device if the device is not found.

This brings Intel IOMMU fault logging in line with the ARM SMMUv3
event decoding, making it easier to identify faulting devices
(e.g. after FLR) without cross-referencing lspci.

Before:
  DMAR: [DMA Write NO_PASID] Request device [86:00.0] fault addr 0xe0000000
	[fault reason 0x05] PTE Write access is not set

After:
  DMAR: [DMA Write NO_PASID] Request device [0000:86:00.0 8086:1533] fault addr 0xe0000000
  	[fault reason 0x05] PTE Write access is not set

Signed-off-by: Yigit Oguz <yigitogu@amazon.de>
Signed-off-by: Lilit Janpoladyan <lilitj@amazon.com>
Assisted-by: Claude:claude-4.6-opus
---
 drivers/iommu/intel/dmar.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index d33c119a935e..225fa498d714 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1890,30 +1890,39 @@ static int dmar_fault_do_one(struct intel_iommu *iommu, int type,
 {
 	const char *reason;
 	int fault_type;
+	u8 bus = source_id >> 8;
+	u8 devfn = source_id & 0xFF;
+	struct pci_dev *pdev;
+	char devid[48];
 
 	reason = dmar_get_fault_reason(fault_reason, &fault_type);
 
+	pdev = pci_get_domain_bus_and_slot(iommu->segment, bus, devfn);
+	if (pdev) {
+		snprintf(devid, sizeof(devid), "%04x:%02x:%02x.%d %04x:%04x",
+			 iommu->segment, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
+			 pdev->vendor, pdev->device);
+		pci_dev_put(pdev);
+	} else {
+		snprintf(devid, sizeof(devid), "%04x:%02x:%02x.%d",
+			 iommu->segment, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+	}
+
 	if (fault_type == INTR_REMAP) {
-		pr_err("[INTR-REMAP] Request device [%02x:%02x.%d] fault index 0x%llx [fault reason 0x%02x] %s\n",
-		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
-		       PCI_FUNC(source_id & 0xFF), addr >> 48,
-		       fault_reason, reason);
+		pr_err("[INTR-REMAP] Request device [%s] fault index 0x%llx [fault reason 0x%02x] %s\n",
+		       devid, addr >> 48, fault_reason, reason);
 
 		return 0;
 	}
 
 	if (pasid == IOMMU_PASID_INVALID)
-		pr_err("[%s NO_PASID] Request device [%02x:%02x.%d] fault addr 0x%llx [fault reason 0x%02x] %s\n",
+		pr_err("[%s NO_PASID] Request device [%s] fault addr 0x%llx [fault reason 0x%02x] %s\n",
 		       type ? "DMA Read" : "DMA Write",
-		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
-		       PCI_FUNC(source_id & 0xFF), addr,
-		       fault_reason, reason);
+		       devid, addr, fault_reason, reason);
 	else
-		pr_err("[%s PASID 0x%x] Request device [%02x:%02x.%d] fault addr 0x%llx [fault reason 0x%02x] %s\n",
+		pr_err("[%s PASID 0x%x] Request device [%s] fault addr 0x%llx [fault reason 0x%02x] %s\n",
 		       type ? "DMA Read" : "DMA Write", pasid,
-		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
-		       PCI_FUNC(source_id & 0xFF), addr,
-		       fault_reason, reason);
+		       devid, addr, fault_reason, reason);
 
 	dmar_fault_dump_ptes(iommu, source_id, addr, pasid);
 
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


