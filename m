Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414ADC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 03:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=enSLMsFajQZDV5MklXX7wSgXtuk+Nlzh10i3tv/rzF4=; b=pwyEs2Aw4KZSmsV9ADQaKy/jqG
	ZUrHIA0dU3U2RaLNZTIrASZgZKnnM3f0hl2Rc7KMzz9wiR7c7ovn8P/bn6nFmdHqJF9JDOMsmrBKa
	qHuczNH8RoaTwnnLtCEjW7dg867hjzUonwFSV+c9h+HItYv48nkB3Sjt3OuYpQQI4LouZkrEsIcPr
	MZnOR7EkPRKWuIWN5BcWcka/fMHVQpgUcA4RvCypw4U9vmetZmfAWbrMRYI3wi+5FuJXze4SKrL54
	yy8REcgqneUZOda+WzLJ0yt2X5YLWD7rkQgOIdFFxG1osJoXJ9z+vcX7mHAOXzGYrfioVxaQcxOHw
	SdzSjOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzJP-0000000FKUV-1WQv;
	Wed, 12 Aug 2026 03:07:27 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzJL-0000000FKU6-3l1t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 03:07:25 +0000
X-UUID: eb7925ec95fa11f1aa26b74ffac11d73-20260812
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7c8e65db-44e9-447e-a9e7-d16adb0551e7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:6353e8e742baf08e15818909926fe79a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eb7925ec95fa11f1aa26b74ffac11d73-20260812
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1043525765; Wed, 12 Aug 2026 11:07:15 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: yannick.fertre@foss.st.com,
	raphael.gallais-pou@foss.st.com,
	philippe.cornu@foss.st.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	benjamin.gaignard@linaro.org,
	yannick.fertre@st.com
Cc: dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] drm/stm/ltdc: Fix clock cleanup error handling
Date: Wed, 12 Aug 2026 11:07:10 +0800
Message-Id: <20260812030710.549621-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_200724_257213_A25FC209 
X-CRM114-Status: GOOD (  10.79  )
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

When clk_prepare_enable() fails for bus_clk or lvds_clk, the previously
prepared clocks are not cleaned up, leading to resource leaks.

In ltdc_resume():
- If bus_clk preparation fails, pixel_clk remains prepared
- If lvds_clk preparation fails, both pixel_clk and bus_clk remain prepared

In ltdc_load():
- If bus_clk preparation fails, pixel_clk remains prepared

Fix this by adding proper error handling to ensure all prepared clocks
are disabled and unprepared when a subsequent clock preparation fails.

Fixes: df61c776657f ("drm/stm: add sleep power management")
Fixes: d80667642b0f ("drm/stm: ltdc: support new hardware version for STM32MP25 SoC")
Fixes: b7243862f82a ("drm/stm: ltdc: handle lvds pixel clock")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
Changes in v2:
- Use separate error labels in ltdc_load() so a failed bus clock is not
  passed to clk_disable_unprepare().
- Keep cleanup limited to clocks that were successfully prepared.
---
 drivers/gpu/drm/stm/ltdc.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 8818dcf98da7..ac1c2f27563e 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1908,16 +1908,25 @@ int ltdc_resume(struct drm_device *ddev)
 		ret = clk_prepare_enable(ldev->bus_clk);
 		if (ret) {
 			drm_err(ddev, "failed to enable bus clock (%d)\n", ret);
-			return ret;
+			goto err_pixel;
 		}
 	}
 
 	if (ldev->lvds_clk) {
 		ret = clk_prepare_enable(ldev->lvds_clk);
-		if (ret)
+		if (ret) {
 			drm_err(ddev, "failed to prepare lvds clock\n");
+			goto err_bus;
+		}
 	}
 
+	return 0;
+
+err_bus:
+	if (ldev->bus_clk)
+		clk_disable_unprepare(ldev->bus_clk);
+err_pixel:
+	clk_disable_unprepare(ldev->pixel_clk);
 	return ret;
 }
 
@@ -1963,7 +1972,7 @@ int ltdc_load(struct drm_device *ddev)
 		ret = clk_prepare_enable(ldev->bus_clk);
 		if (ret) {
 			drm_err(ddev, "Unable to prepare bus clock\n");
-			return ret;
+			goto err_pixel;
 		}
 	}
 
@@ -2093,11 +2102,10 @@ int ltdc_load(struct drm_device *ddev)
 
 	return 0;
 err:
-	clk_disable_unprepare(ldev->pixel_clk);
-
 	if (ldev->bus_clk)
 		clk_disable_unprepare(ldev->bus_clk);
-
+err_pixel:
+	clk_disable_unprepare(ldev->pixel_clk);
 	return ret;
 }
 
-- 
2.25.1


