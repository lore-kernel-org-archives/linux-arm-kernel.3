Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA2AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mDhvZS20eLXaKld5OnUktRnrq8yN830WLvxutVCN3aw=; b=RaFal9HgNuL0eajleYz0EBM1Gg
	CUyjKDQLN4qwKBPzKXgYROHtB32e1MnWNj1QxMNUnVW5gcwmVtiLEkjw3QABvXXko7eVVWESrN+cv
	XYvmFCfYxsF9JFcCvbL+W9VwswqSivh8DdbBVwhStqgPK+CFO8iZmnr3o2K8Nat+dRbdj71b9hvr2
	5lGl8DGtzMKsVJqdBwolZdPWYDuWPbMZHJebEwCSxX+khD1vYEhNdpRXYVZcGs/nLQQls1QQSz3tV
	gUKxLv8QGFme1f5RabjF0xVmTcT3MmQJed7ZrCo/mN+lFY69HKdT595cmwsg+g4AA1AsYrbnKCar3
	jYKth/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYmb-00000006Kv8-0l0b;
	Tue, 18 Mar 2025 15:23:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYkt-00000006Kff-1qlF;
	Tue, 18 Mar 2025 15:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742311281;
	bh=ikl3rkeQnLiGTEwhtDsuQZ0Era+RRUfSI1GQRsd5rKk=;
	h=From:To:Cc:Subject:Date:From;
	b=KQh2Uzj1upplFHfwz9hQ9ANnArlYejbPYiBBTXjp95CU3QcRfhQ7UOVPI+NyYIGwb
	 DZVhoYSMC7aYHKs03qhCjF3RTaJME3UWdWy/jNPUalGTlyuXDsA0YgMS4RKTJPHapv
	 pY3raIGtiua01SNHB8ME9PjAYwjRcx8Tnj99dShYuekQJgwTCde22Mx4vMOJCGH5F2
	 3AWykmi5mHEcBj/mWBB/hoiRJbLFEFgyZM5ulCAYs3ToqEjQrZmkLCdV7lY7VfJFD0
	 3uixhy/3/2OZ7r18GPZdrz3LUQztRlSTNkpVkaNvzp7o3hbhdKNUkNpO3BMUIwMGxj
	 xci45pvz6E/ow==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DD9517E0E8D;
	Tue, 18 Mar 2025 16:21:19 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH] iommu/rockchip: Add flush_iotlb_all ops
Date: Tue, 18 Mar 2025 11:20:49 -0400
Message-ID: <20250318152049.14781-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_082123_629901_327E2A1C 
X-CRM114-Status: GOOD (  17.06  )
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

From: Jonas Karlman <jonas@kwiboo.se>

On some Rockchip cores (like the vdpu34x video decoder), the IOMMU device
is inside the the device that uses it.

The IOMMU device can still be driven by the iommu driver, but when an
error occurs in the main device (e.g. a decoding error that resets the
decoder), the IOMMU device will also be reseted.
In such situation, the IOMMU driver and the hardware are out of sync and
IOMMU errors will start popping up.

To avoid that, add a flush_iotlb_all function that will let the main drivers
(e.g. rkvdec) tell the IOMMU driver to write all its cached mappings into
the IOMMU hardware when such an error occured.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/iommu/rockchip-iommu.c | 45 ++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 323cc665c357..7086716cb8fc 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -899,6 +899,40 @@ static size_t rk_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
 	return unmap_size;
 }
 
+static void rk_iommu_flush_iotlb_all(struct iommu_domain *domain)
+{
+	struct rk_iommu_domain *rk_domain = to_rk_domain(domain);
+	struct list_head *pos;
+	unsigned long flags;
+	int i, ret;
+
+	spin_lock_irqsave(&rk_domain->iommus_lock, flags);
+	list_for_each(pos, &rk_domain->iommus) {
+		struct rk_iommu *iommu = list_entry(pos, struct rk_iommu, node);
+
+		ret = pm_runtime_get_if_in_use(iommu->dev);
+		if (!ret || WARN_ON_ONCE(ret < 0))
+			continue;
+
+		if (WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu->clocks)))
+			continue;
+
+		rk_iommu_enable_stall(iommu);
+		for (i = 0; i < iommu->num_mmu; i++) {
+			rk_iommu_write(iommu->bases[i], RK_MMU_DTE_ADDR,
+				rk_ops->mk_dtentries(rk_domain->dt_dma));
+			rk_iommu_base_command(iommu->bases[i], RK_MMU_CMD_ZAP_CACHE);
+			rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK, RK_MMU_IRQ_MASK);
+		}
+		rk_iommu_enable_paging(iommu);
+		rk_iommu_disable_stall(iommu);
+
+		clk_bulk_disable(iommu->num_clocks, iommu->clocks);
+		pm_runtime_put(iommu->dev);
+	}
+	spin_unlock_irqrestore(&rk_domain->iommus_lock, flags);
+}
+
 static struct rk_iommu *rk_iommu_from_dev(struct device *dev)
 {
 	struct rk_iommudata *data = dev_iommu_priv_get(dev);
@@ -1172,11 +1206,12 @@ static const struct iommu_ops rk_iommu_ops = {
 	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
 	.of_xlate = rk_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-		.attach_dev	= rk_iommu_attach_device,
-		.map_pages	= rk_iommu_map,
-		.unmap_pages	= rk_iommu_unmap,
-		.iova_to_phys	= rk_iommu_iova_to_phys,
-		.free		= rk_iommu_domain_free,
+		.attach_dev		= rk_iommu_attach_device,
+		.map_pages		= rk_iommu_map,
+		.unmap_pages		= rk_iommu_unmap,
+		.flush_iotlb_all	= rk_iommu_flush_iotlb_all,
+		.iova_to_phys		= rk_iommu_iova_to_phys,
+		.free			= rk_iommu_domain_free,
 	}
 };
 
-- 
2.49.0


