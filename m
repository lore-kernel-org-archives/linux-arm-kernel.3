Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAEEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 01:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CTR+6ICqlHVrcFNDk9C+pAwZ8WeU7M3KHuHwvE/RzXE=; b=EdD1rr3cXWZlML9H4s1SO/lAeF
	rnWr7qkMACIl1CdtJQrrrSp3ANbI013VKCr8K8V4fFoLZ+AobjfvCBUICWv7ikvAgNGWgaOB6Vgw9
	7jrU+PveMWbnnvTY3NZLgSbLutIDwb/p/aomp/FEVxkT5Kb4Cs9LXRhnIw/NloDClvH+Tu6DDkUbh
	78ytcYGlkalOACnrfUeDeQ0ScmmZKH6PUznxcu59rlg+Vm0uGNuUwHmLH5SKsEldPF2j79eanzxDD
	Y7RISF+enXwJbVrPEcs/kKSsiRchPjw4sgIx8N4dd6tuXqmC4IdhGtrPxlQWtubBLfTzumfN5hgHI
	BoArQMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5mt-00000007wFR-3b9B;
	Mon, 13 Jul 2026 01:48:51 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5mq-00000007wEt-1WUd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 01:48:50 +0000
X-UUID: f8964ae47e5c11f1aa26b74ffac11d73-20260713
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:37285a2a-020d-4cff-93fc-76cf3109648a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:acd1ecc9a18f14a309e819678c549fcb,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f8964ae47e5c11f1aa26b74ffac11d73-20260713
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1369605824; Mon, 13 Jul 2026 09:48:39 +0800
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
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH] drm/stm/ltdc: Fix clock cleanup error handling
Date: Mon, 13 Jul 2026 09:48:35 +0800
Message-Id: <20260713014835.23995-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_184848_728529_E52579DB 
X-CRM114-Status: UNSURE (   9.33  )
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
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/gpu/drm/stm/ltdc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 95fcfa48d8be..ead9e87bd719 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1907,16 +1907,25 @@ int ltdc_resume(struct drm_device *ddev)
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
 
@@ -1962,7 +1971,7 @@ int ltdc_load(struct drm_device *ddev)
 		ret = clk_prepare_enable(ldev->bus_clk);
 		if (ret) {
 			drm_err(ddev, "Unable to prepare bus clock\n");
-			return ret;
+			goto err;
 		}
 	}
 
-- 
2.25.1


