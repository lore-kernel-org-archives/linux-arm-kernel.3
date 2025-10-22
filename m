Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621ACCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FdcrSneWicl1pfGMcZk6PTeqOTBE1QoowN6eLnXOcgU=; b=nc2ikaarr3875R2cMYDDMIrzEF
	bkIfwSJ72Zomj6fKBV1JDoob9fHDN7rmsvefHtTgv1m+oNtZi4LWHD/S2P+LLjMaKd9K5+xaZ1pYt
	bqzmvlc/teA/330MtLzUd2T35H7etsTFpl8cbJDvOFI/8K0wdA2B4HkILh0aUCUQEAzkxX4V+jD+Z
	5ZznfEF/pXk+dJRKb7kvWdDlbE4I0Sy3Nm4ZsxXsEXs/s66y35d5I6efAfrrwwI1EjTJuZ66ybavM
	fHpHVg9Jor31MnAPHMTZVCwmeUrZ1mjGL8lqypodc8Qw/Sg0kGFuwj9QpwPWCTao21xoTv3DRq5W/
	APR8gg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBbaZ-00000003XEN-1Lrr;
	Wed, 22 Oct 2025 16:21:27 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBbaW-00000003XBF-2Sae;
	Wed, 22 Oct 2025 16:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761150069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lGCaflefZf9vW0sZUzl5R9DP8UEulwgyXUiaW+glHfUz31zKUpTCTtzJhn7nKRV0XYHMe7hwwkqRlSa6DNzkt2GWlia9O4YhjkvqdkVVK26uawqepgwLMmFOxxCjLnYK2zAf72kvwsYU66EU6Zi/alQaHMmDkjkIijxYYPMrAGU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761150069; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FdcrSneWicl1pfGMcZk6PTeqOTBE1QoowN6eLnXOcgU=; 
	b=H/uwlob0aAvM70DEBoKO/53Mu77vNhN7nV3svwqA6OZXj1Q6xieeknEwj66tK4ofB4Xf9p4A4IdPW5bZbAQvfXfcsKcAEkxBaitzg6enV8Di4F5cfOMwui4ZPwCgKiQyceNyTS3xXWS7PC/vy2LSLVcG9efvqFg04Lf/pbR8Bfs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761150068;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FdcrSneWicl1pfGMcZk6PTeqOTBE1QoowN6eLnXOcgU=;
	b=HjoYVDdPhe2UO4MEseYlCzsf5PLSkSqmQ3FBRRpzmXJYnVSgD+EsF1o8xOmD2lBO
	QQW8K+SkhZYDmAJBDqyWPe+4t7rnakJ4ZJOOGeB85q9hxtMI7pc4+4efkg7d7kQPxYi
	5PV1jfVkEizK87x9AmLdRXkEczkClnEiczdwOHWE=
Received: by mx.zohomail.com with SMTPS id 1761150066573669.259808258432;
	Wed, 22 Oct 2025 09:21:06 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/rockchip: Set VOP for the DRM DMA device
Date: Wed, 22 Oct 2025 19:19:48 +0300
Message-ID: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_092124_682797_31C661A0 
X-CRM114-Status: UNSURE (   9.89  )
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

Use VOP for DMA operations performed by DRM core. Rockchip DRM driver
is backed by a virtual device that isn't IOMMU-capable, while VOP is the
actual display controller device backed by IOMMU. Fixes "swiotlb buffer
is full" warning messages originated from GEM prime code paths.

Note, that backporting is non-trivial as this depends on 143ec8d3f9396
("drm/prime: Support dedicated DMA device for dma-buf imports"), which
landed in v6.16 and 421be3ee36a4 ("drm/rockchip: Refactor IOMMU
initialisation"), which landed in v5.19.

Reported-by: Daniel Stone <daniels@collabora.com>
Fixes: 2048e3286f34 ("drm: rockchip: Add basic drm driver")
Cc: stable@vger.kernel.org # v6.16+
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index eb77bde9f628..e693160e9b7f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -96,6 +96,9 @@ void rockchip_drm_dma_init_device(struct drm_device *drm_dev,
 		private->iommu_dev = ERR_PTR(-ENODEV);
 	else if (!private->iommu_dev)
 		private->iommu_dev = dev;
+
+	if (!IS_ERR(private->iommu_dev))
+		drm_dev_set_dma_dev(drm_dev, private->iommu_dev);
 }
 
 static int rockchip_drm_init_iommu(struct drm_device *drm_dev)
-- 
2.51.0


