Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DD0C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NyenvGwZgtQ1ti3SGghMMEphkksMnte6MvYyknQsOfs=; b=RWGztjiRv27DJbbRXy5tddCTxc
	sm0BKcIUsnaguMWkXUyYEh/YvLDX8zrSD4QFwyKPNFqy8CRiqBCkLYTeEBjGLWZWMs9XabHJCnBEJ
	QvBvWtA293Xk6Q03QM4u+bha/PFfTnIOVphAkFKhkQtT66eYHsaTYLtB/U74cfHQmYnW8PxqWqd0l
	rJ9bb1wxpn4aDkKiG+cczzbSUknh2Io+eV0Uo1hNOXXMwRvt3wQK7dWo1fMefBnoMcfMGwr989us0
	QrOb4wyls6HJ9Ez7o4BA9xRAPnTktEG+i3tL8LgrOx+xFBDrqcRNzHmwd0nF3/2CjfgN1oDJWYQye
	GO+46Few==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cpQ-000000020YG-43Aj;
	Mon, 21 Sep 2026 12:09:00 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cpO-000000020XH-1fFj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:08:59 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e943032e;
	Mon, 21 Sep 2026 20:08:55 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	KyongHo Cho <pullip.cho@samsung.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] iommu/exynos: quiesce SysMMU before requesting IRQ
Date: Mon, 21 Sep 2026 20:08:48 +0800
Message-Id: <20260921120848.96215-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0c3de84a303a1kunmd735d0fb4b6a8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTEpIVh5NSBgYSh5OS0kYHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=kkX5vbfWyv/gdMl7tC4ESPW32ilC7asfeLcN8S0K4dlX9J52PSfLUAZhNgD0iJ/2yJbIB9oEfHDb3kWslE2fMoAAz9gfICmC1gnOWetfT7Emq2GM89rBjfsd0eBhExmyYCSXliRpYgZPb/B8zbdKlOLH2FAPNMiY1vE2AvdSq/0=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=NyenvGwZgtQ1ti3SGghMMEphkksMnte6MvYyknQsOfs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_050858_631803_29FF3A11 
X-CRM114-Status: GOOD (  13.64  )
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

exynos_sysmmu_probe() registers the IRQ before obtaining clocks and
detecting the SysMMU variant. A pending IRQ during this window can enter
exynos_sysmmu_irq(), which takes data->lock and then dereferences
clk_master and variant before they are initialized.

Obtain the clock resources and initialize the software state before
requesting the IRQ. Detect the variant and quiesce the hardware by
disabling the SysMMU and clearing its configuration while the clocks are
enabled. This leaves the block inactive when the handler is published.

Also ignore interrupts observed while the SysMMU is inactive, so a
spurious interrupt cannot access inactive fault state.

The race is theoretical; no runtime occurrence has been observed.

Fixes: 2a96536e77b4 ("iommu/exynos: Add iommu driver for EXYNOS Platforms")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260901130527.3289245-1-runyu.xiao@seu.edu.cn/
Assisted-by: LLM Codex
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/iommu/exynos-iommu.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 874d05f4b3969..8081bd93c67cb 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -571,9 +571,12 @@ static irqreturn_t exynos_sysmmu_irq(int irq, void *dev_id)
 	struct sysmmu_fault fault;
 	int ret = -ENOSYS;
 
-	WARN_ON(!data->active);
-
 	spin_lock(&data->lock);
+	if (!data->active) {
+		spin_unlock(&data->lock);
+		return IRQ_NONE;
+	}
+
 	clk_enable(data->clk_master);
 
 	itype = __ffs(readl(SYSMMU_REG(data, int_status)));
@@ -744,13 +747,6 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	if (irq <= 0)
 		return irq;
 
-	ret = devm_request_irq(dev, irq, exynos_sysmmu_irq, 0,
-				dev_name(dev), data);
-	if (ret) {
-		dev_err(dev, "Unable to register handler of irq %d\n", irq);
-		return ret;
-	}
-
 	data->clk = devm_clk_get_optional(dev, "sysmmu");
 	if (IS_ERR(data->clk))
 		return PTR_ERR(data->clk);
@@ -777,6 +773,19 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 
 	__sysmmu_get_version(data);
 
+	/* Keep the hardware quiesced before publishing the IRQ handler. */
+	__sysmmu_enable_clocks(data);
+	writel(CTRL_DISABLE, data->sfrbase + REG_MMU_CTRL);
+	writel(0, data->sfrbase + REG_MMU_CFG);
+	__sysmmu_disable_clocks(data);
+
+	ret = devm_request_irq(dev, irq, exynos_sysmmu_irq, 0,
+			       dev_name(dev), data);
+	if (ret) {
+		dev_err(dev, "Unable to register handler of irq %d\n", irq);
+		return ret;
+	}
+
 	ret = iommu_device_sysfs_add(&data->iommu, &pdev->dev, NULL,
 				     dev_name(data->sysmmu));
 	if (ret)
-- 
2.34.1


