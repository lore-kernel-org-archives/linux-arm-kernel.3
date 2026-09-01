Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EA5C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LQLxe3McHBmGULMFD/4NkaDRFU0WQZ/I3unsR12nsDs=; b=avNWrDyQ3U1H665ZTGYoFcETrx
	XKgiKgBqfyRPpY68GDjOwGOmAT45oAZZ3T5P85EjjQxnmtUN10jZ3ZciM3LWCJLrCfrECyQWpuqS9
	MuuuCZ8t0l4y2/gaxiAv8C5ZbSbvb5tbQ1lu5sHC5toMsShjeM3fWIDsMRxDQq7j23Xyxe5sdpd82
	REzHC3lTzc6BJtBFOZYJaqR27D90lxCpGAQ+fkKW6TGe+854aAT2RRuB49xRoaVC/STrtmaH58DuB
	6AlEIGImuGTIuN720KsdH+XRPwUYBvZaEmET8bsNNYH87AZcB06rYOwJZWzBB91EMc2rth2I8EOan
	0H/I79cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OBL-0000000C9h2-21NB;
	Tue, 01 Sep 2026 13:05:43 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OBH-0000000C9gR-43UA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:05:42 +0000
Received: from PC-202605011814.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c1f46417;
	Tue, 1 Sep 2026 21:05:33 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	KyongHo Cho <pullip.cho@samsung.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] iommu/exynos: Initialize lock before requesting IRQ
Date: Tue,  1 Sep 2026 21:05:27 +0800
Message-Id: <20260901130527.3289245-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa05d132e6603a1kunm445721fa16f246
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTBkdVkhOTkIdTxhJSUhNGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=EOgFoxRwxzQxfvlYFYg841s7jzQqgANec6RRRQkmlaoB0ROYTaT/yN4FOZfSa+n3LZVnlZLSXJ+hqRca9EvEaOInR1CpEExYk86+iLZIK8/H5C65FPTD6U5qRg+X+VQUPW3UE8rrNXtusalywWgPJPGlfs2DQMthhffCQBXkmH4=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=LQLxe3McHBmGULMFD/4NkaDRFU0WQZ/I3unsR12nsDs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_060540_622749_2D9A23D5 
X-CRM114-Status: GOOD (  10.72  )
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

The SysMMU interrupt handler can run as soon as devm_request_irq() is
called. Initialize the driver lock before registering the handler so an
early interrupt cannot use an uninitialized lock.

Fixes: 2a96536e77b4 ("iommu/exynos: Add iommu driver for EXYNOS Platforms")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
Assisted-by: Codex:GPT-5
---
 drivers/iommu/exynos-iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 874d05f4b..e9feb83b3 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -735,6 +735,8 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	spin_lock_init(&data->lock);
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	data->sfrbase = devm_ioremap_resource(dev, res);
 	if (IS_ERR(data->sfrbase))
@@ -773,7 +775,6 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 		return PTR_ERR(data->clk_master);
 
 	data->sysmmu = dev;
-	spin_lock_init(&data->lock);
 
 	__sysmmu_get_version(data);
 
-- 
2.34.1

