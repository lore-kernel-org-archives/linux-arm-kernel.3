Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6FDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 02:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wJX+34A+wt7RZfYUEbDhGP+lMIsQIrQS9v3vdze22yg=; b=GMalmmqxc6EtSirk1d3baSX/cS
	TjnWKuu8j5Q2AqZiOFUkp8IoaYQ6HYf6UKUdgmo12tnFbIBLrIYYScD1wHToZR19GoTv0o6WShLdB
	BGxfN4mwF5o/L5SOFo1VMmgNBhAXjNEAIHW43hnMGGNmaDP/BilSkrYEmkPk4+pd8/J4jQPsSMIDz
	rcrMa5iYes1zMrrK+byHtSKYrpv/3EEKaCiivlzkBpbgL0YPhZ6oXKKQc1N0CkBJS1cFN5NoZeZyV
	iF/zygzoAfxgkWHO/qisPzo1JaWOPbV0LnpS3pL5Rj0ur06KdS/x96BXc76wpuIeaelEJBzhiyjLU
	k956GrVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNKW-000000068Mf-3THJ;
	Sat, 11 Jul 2026 02:20:36 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNKT-000000068MC-2g2a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 02:20:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wJX+34A+wt7RZfYUEbDhGP+lMIsQIrQS9v3vdze22yg=;
	b=KU9x41WHWvUQA3PhHeAbK5by7i3WzSn3OfqNWtdMtHmgqDg5qa5KLeB+ZLrmTMoS+ax6ueNZQ
	uE1kcuqItEFEu6fwzimEX8efbgWEKW0HrI81WPwI5dop6nq/DxAz1Jn3SXtjd3el8qMKvXXWJtY
	w95r/delq2/uA3Y568KgEeM=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gxscz1s2Sz1T4G6;
	Sat, 11 Jul 2026 10:11:15 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id CABAF4057F;
	Sat, 11 Jul 2026 10:20:19 +0800 (CST)
Received: from huawei.com (10.50.163.32) by dggpemf500013.china.huawei.com
 (7.185.36.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 11 Jul
 2026 10:20:19 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <lpieralisi@kernel.org>, <maz@kernel.org>, <tglx@kernel.org>,
	<alex@shazbot.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<liuyonglong@huawei.com>, <wangzhou1@hisilicon.com>, <linuxarm@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [RFC PATCH v2] irqchip/gic-v3-its: enable dynamic MSI-X allocation
Date: Sat, 11 Jul 2026 10:20:15 +0800
Message-ID: <20260711022015.3049867-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_192034_153264_D67103F3 
X-CRM114-Status: GOOD (  12.15  )
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
occasionally occurs, causing the network port reset to fail. This
appears to be unavoidable, as it's a standard approach adopted by
all network card vendors.

On Hisilicon HIP09 (ARM64, GICv3/GICv4.1) with latest upstream kernel
and QEMU 8.2. VFIO passthrough of HNS3 NIC to VM: load both hns3 and
hns_roce_hw_v2 drivers and trigger FLR, this bug will occur occasionally.
After enabling dynamic MSIX allocation, this bug no longer occurs.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
Changes in v2:
  - Updated the commit message to add test information.

v1: https://lore.kernel.org/linux-arm-kernel/20260624025345.458387-1-yangjinqian1@huawei.com/
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


