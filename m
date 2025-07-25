Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945D2C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5/bUBAcTHA5SdieGqpRNiqi2E15Aab+zmlB1Dy9Q40=; b=zq8Zc7zzZ5jn4tWGPPNCyIJRal
	ZxRFRTk3Ii5T117ZT5/mNM/NcTIx9QSEraMKUViBwLhkW5gzk5CY1yGEe704J2vcOiyRkmtdRiQZH
	5GOBzg7nr+4rNC5oe4oEGF6wDUNKLeY/LTvIQTGC07lrvdx1GSG+uE3AV2bXeOOGiV9/gzNtrEW/N
	K3r9znWUQk3O/wZWa7xno+plMX0YMkf+uplmyoGhplMY2T6d+D7j5K0bD4dSsqWP4X2CQs1JpyNGY
	NIfEqxAaAl8/olVA3BpbltKewt8bDDf2wHJEOK89NKKYtxKkYdB+tX06QWOxnGHNfFFCyhdZKZ3bZ
	dYIQxb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFj2-00000009bJB-1z0n;
	Fri, 25 Jul 2025 10:32:28 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFKj-00000009WqU-3wBv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:07:23 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9cSdh007814;
	Fri, 25 Jul 2025 12:07:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	a5/bUBAcTHA5SdieGqpRNiqi2E15Aab+zmlB1Dy9Q40=; b=OSoXrK0idm941G5W
	sOIF943zL9Je+mlt2Rzt6vLREo7pe+cb+voOcLPSn0cyQ2+y69MFAeTlECBZ8AWE
	s26OraJ3Iqu6QIzSGvepRou/VGNAGYbtT4neEWeizSlStoKFH/QNRxtizKyTIYbX
	tXL5yieJwK718P03oNsGoWCOFuLQCRA+u9J1T2gJcyTKEkvXSopsvZ2w8j/s8iXV
	+rTaiGRQenJPUn6hQjkqTS5CqIEjLIT9WsLis06GMWb3ASBt+ais//iKBZfrWy9G
	ZQQNIXBsTzSvHSgR2ugSatSzUnMBwObS5J9anTw2yPi6zT6TmBuYQf6Aa333N9m4
	YP3FUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3m2hdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 12:07:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4561540058;
	Fri, 25 Jul 2025 12:05:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D32BA7A19C6;
	Fri, 25 Jul 2025 12:04:32 +0200 (CEST)
Received: from localhost (10.252.19.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 12:04:32 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 25 Jul 2025 12:03:59 +0200
Subject: [PATCH 07/12] drm/stm: ltdc: handle lvds pixel clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250725-drm-misc-next-v1-7-a59848e62cf9@foss.st.com>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
In-Reply-To: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.19.90]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030722_286471_89991F9E 
X-CRM114-Status: GOOD (  14.65  )
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

From: Yannick Fertre <yannick.fertre@foss.st.com>

Handle LVDS pixel clock.

The LTDC operates with multiple clock domains for register access,
requiring all clocks to be provided during read/write operations.  This
imposes a dependency between the LVDS and LTDC to access correctly all
LTDC registers.  And because both IPs' pixel rates must be synchronized,
the LTDC has to handle the LVDS clock.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/stm/ltdc.h |  1 +
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 2bcdef76af2e8cbe3b6030deccefa097f28adc3a..031c561b8e780a55b77f4a4c8338e74b52bbbb48 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -837,6 +837,12 @@ ltdc_crtc_mode_valid(struct drm_crtc *crtc,
 	int target_max = target + CLK_TOLERANCE_HZ;
 	int result;
 
+	if (ldev->lvds_clk) {
+		result = clk_round_rate(ldev->lvds_clk, target);
+		drm_dbg_driver(crtc->dev, "lvds pixclk rate target %d, available %d\n",
+			       target, result);
+	}
+
 	result = clk_round_rate(ldev->pixel_clk, target);
 
 	DRM_DEBUG_DRIVER("clk rate target %d, available %d\n", target, result);
@@ -1878,6 +1884,8 @@ void ltdc_suspend(struct drm_device *ddev)
 	clk_disable_unprepare(ldev->pixel_clk);
 	if (ldev->bus_clk)
 		clk_disable_unprepare(ldev->bus_clk);
+	if (ldev->lvds_clk)
+		clk_disable_unprepare(ldev->lvds_clk);
 }
 
 int ltdc_resume(struct drm_device *ddev)
@@ -1895,8 +1903,16 @@ int ltdc_resume(struct drm_device *ddev)
 
 	if (ldev->bus_clk) {
 		ret = clk_prepare_enable(ldev->bus_clk);
-		if (ret)
+		if (ret) {
 			drm_err(ddev, "failed to enable bus clock (%d)\n", ret);
+			return ret;
+		}
+	}
+
+	if (ldev->lvds_clk) {
+		ret = clk_prepare_enable(ldev->lvds_clk);
+		if (ret)
+			drm_err(ddev, "failed to prepare lvds clock\n");
 	}
 
 	return ret;
@@ -1980,6 +1996,10 @@ int ltdc_load(struct drm_device *ddev)
 		}
 	}
 
+	ldev->lvds_clk = devm_clk_get(dev, "lvds");
+	if (IS_ERR(ldev->lvds_clk))
+		ldev->lvds_clk = NULL;
+
 	rstc = devm_reset_control_get_exclusive(dev, NULL);
 
 	mutex_init(&ldev->err_lock);
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index ddfa8ae61a7ba5dc446fae647562d0ec8e6953e1..17b51a7ce28eee5de6d24ca943ca3b1f48695dfd 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -48,6 +48,7 @@ struct ltdc_device {
 	void __iomem *regs;
 	struct regmap *regmap;
 	struct clk *pixel_clk;	/* lcd pixel clock */
+	struct clk *lvds_clk;	/* lvds pixel clock */
 	struct clk *bus_clk;	/* bus clock */
 	struct mutex err_lock;	/* protecting error_status */
 	struct ltdc_caps caps;

-- 
2.25.1


