Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379F8CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 02:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3uqvnJsyWF+t4G7MqHH48qXotf4h0m3zoYZGm1Q9Ir4=; b=QgNdQDzVICc7NBmS0NxsYzLZ3z
	dBFECLudczyDOmtK4VSEVfUAsjHQGNTWJkUDYzQesnW975gIsJFSVYUi8PuIoQ9heS22yJfTj6HXR
	eW9CkvVdC4oNYgqi2u1AkUJgxdFsL/YJZtd8wcTllNtDx17nOFWLMJGU6JOY6DfO3pmmTyUU/asM7
	iIQFnbMG7pYS6wBosYR5fc4zp3uPJ5uTQmIQZI4G+8VBOYtSOvyV2dsIupRPsyh+IYMhBLppkkftw
	XacHqjCbL6ArpjRpye9/T0oDWq4xhvK6OD8VnskpgH5wngqpfCjC3hb9dg15mt1mxmDRL6jYvoM7e
	NYM9NlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7PNB-00000009hUz-1nec;
	Sat, 11 Oct 2025 02:30:17 +0000
Received: from gfmail1.glenfly.com ([106.75.234.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7PN8-00000009hUV-29jv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 02:30:16 +0000
X-ASG-Debug-ID: 1760149803-196b4b048bb0da0001-tbGyMd
Received: from GFSHEXCH03.glenfly.com (GFSHEXCH03.glenfly.com [10.5.250.53]) by gfmail1.glenfly.com with ESMTP id wl0dZeELfCuJW1jC (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Sat, 11 Oct 2025 10:30:03 +0800 (CST)
X-Barracuda-Envelope-From: ReaperLiOC@glenfly.com
X-Barracuda-RBL-Trusted-Forwarder: 10.5.250.53
Received: from glenfly.com (10.30.16.59) by GFSHEXCH03.glenfly.com
 (10.5.250.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.59; Sat, 11 Oct
 2025 10:30:03 +0800
From: Reaper Li <reaperlioc@glenfly.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.5.250.53
To: <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<reaperlioc@glenfly.com>
Subject: [PATCH] iommu/arm-smmu-v3: fix probe device bug due to duplicated stream IDS.
Date: Sat, 11 Oct 2025 10:30:03 +0800
X-ASG-Orig-Subj: [PATCH] iommu/arm-smmu-v3: fix probe device bug due to duplicated stream IDS.
Message-ID: <20251011023003.159922-1-reaperlioc@glenfly.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.30.16.59]
X-ClientProxiedBy: GFSHEXCH02.glenfly.com (10.5.250.52) To
 GFSHEXCH03.glenfly.com (10.5.250.53)
X-Barracuda-Connect: GFSHEXCH03.glenfly.com[10.5.250.53]
X-Barracuda-Start-Time: 1760149803
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.5.252.52:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at glenfly.com
X-Barracuda-Scan-Msg-Size: 1594
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.50
X-Barracuda-Spam-Status: No, SCORE=0.50 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=BSF_RULE7568M
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.148472
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
	0.50 BSF_RULE7568M          Custom Rule 7568M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_193014_705343_2E5528FA 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
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

From: Reaper <reaperlioc@glenfly.com>

Commit 9246b487ab3c ("PCI: Add function 0 DMA alias quirk for Glenfly Arise
chip ") add quirk to fix hda dma request issue, but IORT logic populaties
two identical IDs into the fwspec->ids array via DMA aliasing in
iort_pci_iommu_init() called by pci_for_each_dma_alias().

Signed-off-by: ReaperLi <reaperlioc@glenfly.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a8b46b94..996d3c0f8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3476,10 +3476,21 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 				rb_entry(existing, struct arm_smmu_stream, node)
 					->master;
 
+			struct device *mdev = master->dev;
+			struct device *existing_mdev = existing_master->dev;
+
 			/* Bridged PCI devices may end up with duplicated IDs */
 			if (existing_master == master)
 				continue;
 
+			/* Dma alias PCI devices may end up with duplicated IDs */
+			if (existing_mdev != mdev &&
+				dev_is_pci(existing_mdev) && dev_is_pci(mdev) &&
+				to_pci_dev(existing_mdev)->bus == to_pci_dev(mdev)->bus &&
+				pci_devs_are_dma_aliases(to_pci_dev(existing_mdev),
+										 to_pci_dev(mdev)))
+				continue;
+
 			dev_warn(master->dev,
 				 "Aliasing StreamID 0x%x (from %s) unsupported, expect DMA to be broken\n",
 				 sid, dev_name(existing_master->dev));
-- 
2.34.1


