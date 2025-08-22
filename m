Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB83CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tb63wGgl66XJrSdpJFzgbrvT8Sty+d5zvKlUcKZpBbE=; b=0PtaUA6Sozh4gQj3jCj42kkzxA
	nR0GWj00P0k4Su3c2yeUXrl7p8QAi87ESd6jyD5+hHus53lrQIf50CvUvf6NSrMTigASxzvgyM1jI
	pNkO2u8i8CmEHfNHFPUA5IMX1WskCO3McllRTUdtkjqhNopPOLvL8IQ+wY2d4miZ+s+FnLNRzwjEc
	HgVZUM3H/LVDhZuMv154dF1HvlPYZzVI9CO3NZvaORItqwv2LtLUbMmEUbAomYaYIkIf2fQcU+GHI
	7QUcCqv6HZAwt2wzNlBIn7ewO1BaOV2BUEuKPmJpNE8LYOEUXh929iEh1iJ32nYtDijj/i7j8ugsC
	4SpdRBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrJ-000000046PK-3qqh;
	Sat, 23 Aug 2025 06:36:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSub-00000002rFX-3Ga3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 14:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tb63wGgl66XJrSdpJFzgbrvT8Sty+d5zvKlUcKZpBbE=; b=o1RUGpz4fK5OIiHIGDeDG4TSzs
	OJB4HAapvQQ6Y6FrZwhk08KT1wNhXqow+1CL1VYOSChgZa89U6N2r7OOgkJQNNoHX3U9cVorE7Njj
	LYoQOAsxSBeesENX6MIzojgWjmP8k4XqW+Qb+5ouup1L6QPRKnZhF+ECyKShLKgbDPtGGmQagzTQc
	6nkUoYnE/NrDEWpJ9tM4LJNVjFha/bDKN5ZUiwzwrKaFOoFnibBkU++DyyRmjT/v1ETDpr27Wc1N0
	vqG6j1QF+EZZMwBSzh+HGBA3fl5dE8qUfQZHW+y86NziCrOuDHvYzq0WQP4lHy7wJWVVkA9YRUCSQ
	x7ZHM+TA==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSuY-00000000x9x-3jWD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:38:36 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MEW3dA017575;
	Fri, 22 Aug 2025 16:38:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	tb63wGgl66XJrSdpJFzgbrvT8Sty+d5zvKlUcKZpBbE=; b=UOjjXn3mr+r4BTJe
	2hmSh6Pnm7bVn8X8bPOH7gPr1k5VG5wtyYWE0JQz9TRNChgq79/OPyp7/cKjAuse
	XUas3xwgwbHIXPgAaj6qy7PFJi5oSNtX+hAEXRUFpJYMozskIS5JOJmES1ZDSOrs
	1znbq2yTI8LWJG6oDkUzO6XT3I3+AFDUt4N9M4KKVI49NNEdGwwlBlov0S8+B1Yj
	AEmcfwLevVtPFOKRzxVX8NdO3x3JOazQi0xEaMsHyGmiF5304bOZaaJHo0xCS5GX
	M3GtgM9tOwxE5wXqOero0snKRrDlmjTFLoxdgFJT+APjp1x0xMdYmLtEJZkd8UyU
	9Z8g6w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nd5xshmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 16:38:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5FBC54004A;
	Fri, 22 Aug 2025 16:36:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FD39726F18;
	Fri, 22 Aug 2025 16:35:54 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:35:53 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 22 Aug 2025 16:34:17 +0200
Subject: [PATCH v5 08/13] drm/stm: ltdc: handle lvds pixel clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-drm-misc-next-v5-8-9c825e28f733@foss.st.com>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
In-Reply-To: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
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
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_153835_125139_6AEF2951 
X-CRM114-Status: GOOD (  14.47  )
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
Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/stm/ltdc.h |  1 +
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 17548dd3484a0a3e1015c58c752b80f8892a0ff7..f84a9a8590f0653e422798ff61804d7c3966caef 100644
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
@@ -1981,6 +1997,10 @@ int ltdc_load(struct drm_device *ddev)
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


