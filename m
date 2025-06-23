Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EEAC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 01:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/L7z1+3IqwV7z6y8V8VJRap9OXNheZ0n7phc+aB5uM=; b=a5UdCRe+CCxW4VFVEmIqCx0WDj
	WiTM4DwN1UTJhOu68fC9N3hZTUGAmeNCrKSqvwLHbeFCEksPXymy99/pTNrDnaUBfDLsG/iSQzPdX
	CUFN1At2PRkI/UjEaFbR0PMKSxUSmc89SM1ZN5eRCezhaMzi/YHhC2Tzr1USLatGIE9nR0kHDWa2y
	lbUZYfXq7hnNiEjMYPKaVm9kaGBGyuZsI6KLtwta5q6eSnflh3w4YNqpW5s7LESRTMTp5fypm9jLf
	nGhGePBvgBi7kQQMe3sX9iMqm8HpIrZc2EA6+tMYNkFyimXtKzbqNKWSaH6RRhUZh84e1GsssLyFO
	ZPEB49wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTVfI-00000001Nld-27pG;
	Mon, 23 Jun 2025 01:08:04 +0000
Received: from mail-m9384.xmail.ntesmail.com ([103.126.93.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTVd0-00000001NhD-46MV;
	Mon, 23 Jun 2025 01:05:45 +0000
Received: from xxm-vm.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1988856fd;
	Mon, 23 Jun 2025 09:05:38 +0800 (GMT+08:00)
From: Simon Xue <xxm@rock-chips.com>
To: joro@8bytes.org,
	will@kernel.org,
	heiko@sntech.de
Cc: robin.murphy@arm.com,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Simon Xue <xxm@rock-chips.com>
Subject: [PATCH v2] iommu/rockchip: prevent iommus dead loop when two masters share one IOMMU
Date: Mon, 23 Jun 2025 09:05:32 +0800
Message-Id: <20250623010532.584409-1-xxm@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620073945.572523-1-xxm@rock-chips.com>
References: <20250620073945.572523-1-xxm@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR9KHlZLTkNPSE4ZTExPHktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a979a51c11e03ackunmb9b4d7f71b74391
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nj46Agw5NjEwSy45CB0hHgki
	Ey0aCRdVSlVKTE5LTU9LTEhCQ0lJVTMWGhIXVQMDFjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lBWU5D
	VUlJVUxVSkpPWVdZCAFZQUlKTkg3Bg++
DKIM-Signature: a=rsa-sha256;
	b=HcUQYdC1n/fdfPwVzWQh5u9nT6IAJItWvktXDa+TMc5smGT+z3y3P+xgxIedR+wOHJy4zDL+gnyEikwHSvyT3oerFWtW+N7XEHoZG/IGDlWMN1id+/67ObSAEIbLcgToHcdUhKq8fLnWSgbgfKEtLNvq8Cry/gPy1kS8SZSimg0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=j/L7z1+3IqwV7z6y8V8VJRap9OXNheZ0n7phc+aB5uM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_180543_533849_DD404E49 
X-CRM114-Status: GOOD (  10.01  )
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

When two masters share an IOMMU, calling ops->of_xlate during
the second master's driver init may overwrite iommu->domain set
by the first. This causes the check if (iommu->domain == domain)
in rk_iommu_attach_device() to fail, resulting in the same
iommu->node being added twice to &rk_domain->iommus, which can
lead to an infinite loop in subsequent &rk_domain->iommus operations.

Fixes: 25c2325575cc ("iommu/rockchip: Add missing set_platform_dma_ops callback")

Signed-off-by: Simon Xue <xxm@rock-chips.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>

v2:
   No functional changes.
---
 drivers/iommu/rockchip-iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 22f74ba33a0e..e6bb3c784017 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1157,7 +1157,6 @@ static int rk_iommu_of_xlate(struct device *dev,
 		return -ENOMEM;
 
 	data->iommu = platform_get_drvdata(iommu_dev);
-	data->iommu->domain = &rk_identity_domain;
 	dev_iommu_priv_set(dev, data);
 
 	platform_device_put(iommu_dev);
@@ -1195,6 +1194,8 @@ static int rk_iommu_probe(struct platform_device *pdev)
 	if (!iommu)
 		return -ENOMEM;
 
+	iommu->domain = &rk_identity_domain;
+
 	platform_set_drvdata(pdev, iommu);
 	iommu->dev = dev;
 	iommu->num_mmu = 0;
-- 
2.34.1


