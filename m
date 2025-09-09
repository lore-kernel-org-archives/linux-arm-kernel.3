Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3EDCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLeivrLEOZek6SMLKDE33++Zkcd6skvIc2fWGH65W+s=; b=h6moqxuZr8xaPB/HjnhBAQwP0/
	CIwgzS9aPqL/PyJJxu4hahUutjhgjVsq74j7cthfukWZapLJ4PLy09ilZRAHjHVi7PZ2YODcSP00U
	QRW5I95P7DnVZjQnss6U3lPTmYFT33Md2q+CfXmU+uNZbSnTQtivR6/95POv8Su8mo9UBqsNGisUL
	Ha/jocz0oaog+urZUJLq05FupPle+fJX4TROeVLY1zzbNtvgboewWqndRoMCANHs8/HFS6DcBQ1BX
	TF9kjVENHKYXfe9TKe+N3Syh3z9lPWi42WovxoCf/CL1zBZLbgQw7dLJmOu4RwWuv/i6/xZBNtxiu
	+/SJM0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26C-000000094C8-14Qr;
	Tue, 09 Sep 2025 17:25:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Y2-00000008Fqp-3B3p
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 15:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MLeivrLEOZek6SMLKDE33++Zkcd6skvIc2fWGH65W+s=; b=ch32bIt40xq7KA/LdLep+6q3Bt
	LxczN6nvQDfD0vkjMp64Ws962rk7JpFj42Q52ZFOx3p+l6YG11F2QXMe+oh1fWzapkmTWsXelIzMo
	sKgucWI3I+esxAVBPGTTy8SYk2PUkuXTtWtlD+H/Bl3weOjq1wJisU67L/l3AlXZXxbAidKgZcoQA
	lsBZUjqb0KL5wUkm18cX0bUJzEEwW63Chb6pwwWLyzjZJHJvAxhohksFDpPFXUf/PJclkrHsKKieG
	rVJdHHwxELEqjfS7FWJ1yAnv+HgXWU1ud1P0+4CeIhFdnIwt07Atw2+is+IkAC2F2thq8IhRapnoA
	IxW+PIYQ==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Xz-00000005PNx-1LNK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 15:46:21 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id CB75D211AA17;
	Tue,  9 Sep 2025 08:46:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CB75D211AA17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1757432776;
	bh=MLeivrLEOZek6SMLKDE33++Zkcd6skvIc2fWGH65W+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iVyAPeeSOfKpX05GKFZdZL3wkxv+aDuAGLDWRbTaOjJpdWaMk1hIUqMR1JWSpeZV2
	 gMkBclSjmSwji717PqcvZLnJByOiWj+2uSqlJyoHSH0/k5I/7GbOvE9pw0N1g0rMNO
	 oIKw4LH3nas2sbqnSaRRlAx29ue0TWSiRiObca5s=
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
Subject: [PATCH v4 2/4] iommu/of: fix device tree configuration for PCI devices
Date: Tue,  9 Sep 2025 08:45:58 -0700
Message-Id: <20250909154600.910110-3-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
References: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_164619_802834_6038DB94 
X-CRM114-Status: GOOD (  15.78  )
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

Individual PCI devices lack dedicated device tree nodes, but
their IOMMU configuration (including reserved IOVA regions) is often
defined at the PCI host controller level in the device tree. The
"iommu-addresses" property in reserved-memory nodes specifies IOVA
ranges that should be reserved for specific devices.

Currently, PCI devices cannot access these configurations because their
dev->of_node is NULL, preventing of_iommu_get_resv_regions() from
discovering reserved regions defined in the device tree.

There are at least 3 ways to reserve iommu-addresses for individual PCI
devices,
 - 1) By dynamically adding DTS nodes for individual PCI devices using
   [2] CONFIG_PCI_DYNAMIC_OF_NODES, this requires hardcoding PCI device
   IDs in DECLARE_PCI_FIXUP_FINAL

 - 2) By adding PCI devices nodes either in DTS or by modifying FDT at
   boot time in the firmware, eg [3] However, of_iommu driver doesn't
   seem to handle individual PCI devices, additionally this approach
   doesn't seem to much scalable for the complex PCI hierarchy

 - 3) By configuring PCI host controller DTS node for PCI device so
   that it can inherit iommu-addresses defined in the parent node.

This commit addresses the problem using approach 3) by assigning the
PCI host controller's device tree node to PCI devices during IOMMU
configuration, enabling them to inherit the host controller's device
tree properties. This allows PCI devices to properly discover and
reserve IOVA regions specified in the device tree.

Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 drivers/iommu/of_iommu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 6b989a62def20..077482917e3e8 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -145,6 +145,17 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
 		err = pci_for_each_dma_alias(to_pci_dev(dev),
 					     of_pci_iommu_init, &info);
 		of_pci_check_device_ats(dev, master_np);
+
+		/*
+		 * For PCI devices, ensure the device's of_node points to the
+		 * PCI host controller's device tree node so that reserved regions
+		 * and other DT-specific IOMMU configuration can be found.
+		 * PCI devices typically don't have individual DT nodes, but
+		 * their configuration (including reserved regions) is defined
+		 * at the PCI host controller level.
+		 */
+		if (!err && master_np && !dev->of_node)
+			dev->of_node = of_node_get(master_np);
 	} else {
 		err = of_iommu_configure_device(master_np, dev, id);
 	}
-- 
2.34.1


