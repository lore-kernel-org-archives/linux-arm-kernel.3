Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428A5C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 22:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9Zyvxd9QcR3+RgwZw0Pfazx1gPOwalq9eyq9Lnt7M8=; b=SOxEK0LNUpq7e3rwbQQ+pGmzdh
	4uRhWD8KjuopdVhzrJ50CH+2XxnkUzSjGXUqFLGqnV3jYn0uUu9WbX40Mn/ad95+4lp1Eavg7K4UX
	b+CC2lSCYEYwLwaJzY4biirOkJbD3y/MECpDdIK7zqeVBprOTHDC7omTl8pDhXNUpxqwBEvzjwiyX
	PoP1M4CWj7bd6W1tlEabi2QPGrFPzcLalUBrlqAtZ60JsjkljOP4QEcRUmYjOD5mjUVOYZDPdJq/v
	B5RtscRbDlXkUk0yOMLVsW51I9ITx/L6cdzEVJmYqbhRqvk/aCjPScmoHJl3XEN4dhdYYl7JMxKKi
	oKeLqkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmOO-0000000GhIf-3Rcv;
	Wed, 06 Aug 2025 22:13:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm7A-0000000Gefr-0E1H
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 21:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=I9Zyvxd9QcR3+RgwZw0Pfazx1gPOwalq9eyq9Lnt7M8=; b=k7X13LoH/NanNU1f/BUtPanSdG
	uVyxnmf4eKa6zS6ERdmIA04yXXwsb2Jd5XS9tAk8k71mIOfsZlmIVUZMUYv//UBZFPDVcgbKqu1RW
	sEGgIO5jbU0lkmvwUx6eVIPZcm20OCxp2CXUdLfx0vXmbIHaqFkV5fomnRokObSGayG3H/MubxaRV
	jj9LrfHzK0rdasuzMS4lU6176hCZuk9HYkNsuBwwoDURzQaz+IWjxAMSWkrIZXuEmAzll2tuPRmY7
	tNdRHTCj9FuWMW4xBxdjXfLOtlyoLKGwmMWW/MLCyMxrVu60CKwtspd+/P3iNVqta+TEVVX3QJm57
	4ROSUR5g==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm70-0000000ER8G-1sg6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 21:56:00 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [40.65.108.177])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6015B201BC92;
	Wed,  6 Aug 2025 14:55:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6015B201BC92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1754517349;
	bh=I9Zyvxd9QcR3+RgwZw0Pfazx1gPOwalq9eyq9Lnt7M8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IHlSUyCuOtKdJO1Ul39hnfFzFmUS6bMPUl4LAbiJyHekgrUKxKprvvFWPIx7x6WsX
	 0f++5HzJ/+rTx4tLSfmpFusF2rIX06RemKuA4MGrcE3JzPHbEobUJWL0kOgcbr5nBQ
	 5yafgMMarU2fZgBderoNS3ILRvuKuw+wlzuaTF4E=
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
Subject: [PATCH v3 2/3] iommu/of: fix device tree configuration for PCI devices
Date: Wed,  6 Aug 2025 14:55:38 -0700
Message-Id: <20250806215539.1240561-3-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_225558_832174_2512446A 
X-CRM114-Status: GOOD (  10.98  )
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

Fix this by assigning the PCI host controller's device tree node to
PCI devices during IOMMU configuration, enabling them to inherit the
host controller's device tree properties. This allows PCI devices to
properly discover and reserve IOVA regions specified in the device tree.

Link: https://lore.kernel.org/linux-iommu/20250529183815.GA236098@ziepe.ca/
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


