Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8AACDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 02:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iUMuOltz+V+mvED4r7D4vLbje8XR7nwMng6lJAODwc8=; b=xSfVfu7iNFTFC0EOAp/sWAGnDd
	OVqppSreq1s8Ltc+Hao16B7DfbPy2q2GJSy/0DS6f/iFwJ32+ieBsFIWswhssLIL9aAPOS7lHXJl1
	ngn8sZHTz684NaGpDzYAga1PHCSuno5+3u8dlzpo/df107UIaAMOClCBtpHMOvxZidyN6BsDD0ZsJ
	hsyWdCPPVCMOjNDdGxVD159qjwJv9RyeTJvE4qQN2Or1gWEOZHNpyHd/tVtlz/LNXi0JlUftYcpNT
	0MN1cA5y2tPcz9ErwXaB/CnL5xB7LR8Ro+VNDukAF48aZA88siKdI1kX8LGtW7sKyg6f58bmRezuR
	eXVGW0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcDlz-000000074SO-2VmF;
	Wed, 24 Jun 2026 02:55:31 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcDlw-000000074Qr-0t1H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 02:55:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iUMuOltz+V+mvED4r7D4vLbje8XR7nwMng6lJAODwc8=;
	b=CU1UNOQCYtC+iF35VNilQUvhZ9j7kzTvEy0HBSGmU4fnNeSOOm5kmP5d9t8Rr5F/1ZWU5b8+C
	AsKiOwOw89JtqM8ymtTZLvmoVdHOOKoN0igS+OH5ZzublflykqQGE4P/vLY2DRNtvly+Cfz1JmW
	/igez19aQJ3/pzyGkctSi6M=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4glRCf36bKz1T4LP;
	Wed, 24 Jun 2026 10:46:38 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id DAC114056D;
	Wed, 24 Jun 2026 10:55:18 +0800 (CST)
Received: from huawei.com (10.50.163.32) by dggpemf500013.china.huawei.com
 (7.185.36.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 10:55:17 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <lpieralisi@kernel.org>, <maz@kernel.org>, <tglx@kernel.org>,
	<alex@shazbot.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<liuyonglong@huawei.com>, <wangzhou1@hisilicon.com>, <linuxarm@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [RFC PATCH] irqchip/gic-v3-its: enable dynamic MSI-X allocation
Date: Wed, 24 Jun 2026 10:53:45 +0800
Message-ID: <20260624025345.458387-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_195528_559762_B5BB3348 
X-CRM114-Status: GOOD (  11.07  )
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

On ARM64 platforms with GICv3 ITS, VFIO PCI passthrough currently
cannot dynamically allocate MSI-X vectors after MSI-X has been
enabled. When QEMU needs to extend the vector range, it must
disable MSI-X, free all interrupts, then re-enable with a larger
allocation. This creates an interrupt loss window for already-active
vectors.

Consider HNS3 with RoCE: NIC and RDMA share one PCI device and
ITS DeviceID, with MSI-X vectors partitioned as NIC (lower range)
then RoCE (starting at base_vector = num_nic_msi). In VFIO
passthrough, loading hns_roce after hns3 forces QEMU to tear down
all interrupts before re-allocating the larger range. During this
process, NIC interrupts may be lost. Testing confirmed that this
occasionally occurs, causing the network port reset to fail.

ITS_MSI_FLAGS_SUPPORTED lacks MSI_FLAG_PCI_MSIX_ALLOC_DYN, causing
pci_msix_can_alloc_dyn() to return false. VFIO then sets
has_dyn_msix=false and never clears VFIO_IRQ_INFO_NORESIZE for
MSI-X, keeping the old "disable and reallocate" behavior.

The essential prerequisite for enabling this flag is the fix to
msi_prepare() call timing (commit 1396e89e09f0 ("genirq/msi: Move
prepare() call to per-device allocation")): msi_prepare() is
now called once at per-device domain creation with hwsize, so ITS
creates an ITT with sufficient capacity for all MSI-X vectors.
Without this fix, msi_prepare() was called per-allocation with
semi-random nvec, maybe resulting in an ITT too small for dynamic
vector addition.

With this in place, dynamic MSI-X allocation works correctly:
msi_domain_alloc_irq_at() uses populate_alloc_info() to copy the
pre-prepared alloc_data without re-invoking msi_prepare(), so each
new vector simply gets a LPI entry in the already-allocated ITT,
without affecting existing vectors.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 drivers/irqchip/irq-gic-its-msi-parent.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index b9257103a999..b2b9d2068bb1 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -18,7 +18,8 @@
 
 #define ITS_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK |	\
 				 MSI_FLAG_PCI_MSIX      |	\
-				 MSI_FLAG_MULTI_PCI_MSI)
+				 MSI_FLAG_MULTI_PCI_MSI |	\
+				 MSI_FLAG_PCI_MSIX_ALLOC_DYN)
 
 static int its_translate_frame_address(struct fwnode_handle *msi_node, phys_addr_t *pa)
 {
-- 
2.33.0


