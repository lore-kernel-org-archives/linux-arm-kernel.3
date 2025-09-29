Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3167DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 04:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSVaMtuyuSZZ1up/bnEVaaqJsX9Frjk4SuqMGWpTs64=; b=BQFnW0u/gSVhQqcmDdEToCutBO
	XSAzyRJkSHDmAAMo7IyGvuGaLikqo0VSXFxXPS6/5yWs9tySo+rFBzH1I3z5dacoudj8T63iVSalF
	3wgeRc+76//BFgAnNKda+/qoXPEh/88GCBln7FCmgAkjKEmSBjOJ1Utwbted09lLvdufKGKHQGzmC
	hOnmogmFfb/aI8SdWl4+wM/QzY1npH/sZjxof8lvkVtr9tXVKE4CT5uZkrOGsPCugcdoTkm4bGPtR
	jow2grIgVHIudzuvuCJoTcn3TQwEAKOpgbPdjw7kJung4u9uF6+PfTKVFh4AQcGbl6iFuzi2rC4J5
	1uKSxYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v35Vy-00000001JKf-1htL;
	Mon, 29 Sep 2025 04:29:30 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v35Vv-00000001JJ5-1Oyb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 04:29:28 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250929042918epoutp02c1e2e137cf6a70e87dc488ebbb114692~ppnbTtyO02973729737epoutp02h
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250929042918epoutp02c1e2e137cf6a70e87dc488ebbb114692~ppnbTtyO02973729737epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759120158;
	bh=YSVaMtuyuSZZ1up/bnEVaaqJsX9Frjk4SuqMGWpTs64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X5vFgjR2l4L6b7NiucO1Gnr+xHkgGl7MZYoIVi7/uLllwe5iBIprnPGKf3ll2Zguf
	 cu/LtcY53z+eZg9Xst/Aoi8cRnWVpdkmvD5DBBITb7R9hDBy8Enyynq0XV1LVBLCjD
	 2aLer6162rjBn6jLXpdKON84Mub2r+6cUmDCEtGU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250929042918epcas2p389736ec498c2e1e07be26be0e12c7636~ppna6NSXN1841018410epcas2p3d;
	Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.205]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cZp9p0SkJz6B9mG; Mon, 29 Sep
	2025 04:29:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7~ppnZ_6lVS1831418314epcas2p2O;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929042917epsmtip1cd0804751a75e6720cbf5da675545d7a~ppnZ5hi7v2403224032epsmtip1i;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
From: Hoyoung Lee <hy_fifty.lee@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: Hoyoung Lee <hy_fifty.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init() and drop
 manual cleanup
Date: Mon, 29 Sep 2025 13:31:09 +0900
Message-ID: <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7
References: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
	<CGME20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_212927_683698_92637813 
X-CRM114-Status: GOOD (  13.04  )
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

Switch mode-config initialization to drmm_mode_config_init() so that the
lifetime is tied to drm_device. Remove explicit drm_mode_config_cleanup()
from error and unbind paths since cleanup is now managed by DRM.

No functional change intended.

Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 6cc7bf77bcac..1aea71778ab1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -257,7 +257,7 @@ static int exynos_drm_bind(struct device *dev)
 	dev_set_drvdata(dev, drm);
 	drm->dev_private = (void *)private;
 
-	drm_mode_config_init(drm);
+	drmm_mode_config_init(drm);
 
 	exynos_drm_mode_config_init(drm);
 
@@ -297,7 +297,6 @@ static int exynos_drm_bind(struct device *dev)
 err_unbind_all:
 	component_unbind_all(drm->dev, drm);
 err_mode_config_cleanup:
-	drm_mode_config_cleanup(drm);
 	exynos_drm_cleanup_dma(drm);
 	kfree(private);
 	dev_set_drvdata(dev, NULL);
@@ -317,7 +316,6 @@ static void exynos_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(drm);
 
 	component_unbind_all(drm->dev, drm);
-	drm_mode_config_cleanup(drm);
 	exynos_drm_cleanup_dma(drm);
 
 	kfree(drm->dev_private);
-- 
2.34.1


