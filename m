Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E672DFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdzSJHCqBPghJHP9yT4mgftGxJjry3km7Q5bZ8Dl+Ig=; b=d9XZwjxCGB8X3Pr2LV6kx8v7wG
	iuu1viK70iPE2w/1+r1adzhy4KuXJKQQv0e+Xh+q53heO8qdsMI8TQEstnEjlo6tOyHio7tObPve8
	C+RxWSVu4n1r1RulaKfijthRgw7nnb082BZexl9/NBni45D1s0mFEiNEQZUJRQjH8IthEGKY1+SLp
	qOkcKr7wv8VZYuhnC9cEIoVDy0x8puFMWjMxXxATILgaM1SR2iZUOBAymZgJKMtQGTJsTaCu1VC6y
	yFy7gHxugzA9H1kSRVNQSrdVQXmg3HeUEbXS1wWKdZgoUOKBOIe4WQopcZb8SL+jZeZ57v4mQdDde
	WbJZ6M7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeYx-0000000147L-0GTv;
	Tue, 28 Apr 2026 09:17:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeYr-0000000140N-1tx9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:16:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6AFFDC5EF13;
	Tue, 28 Apr 2026 09:17:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1447601D0;
	Tue, 28 Apr 2026 09:16:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1EEF10728632;
	Tue, 28 Apr 2026 11:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777367813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SdzSJHCqBPghJHP9yT4mgftGxJjry3km7Q5bZ8Dl+Ig=;
	b=TEtocTzN7gk+5Eb7iEPNc1IabHYrkE40qkY4J1Cch5xIZi+i7TZD20qh+PrF4iCscdCunn
	tOJZU/Au1wR2dh0g2SLJKUa5FZ0/0KNQV6mhRDoLHrGGh7Jf8ik0UtCAWXCbjxHNTOulQd
	227e4M1fUrLamXqqrDgh+mZdaJJtB8SCCAj1v7f2dG62XfbwSSnlIvmqVWR8ZzBkJgeiOI
	/CSfWEKE2WiEzbTPPiFyyeWsor1Y7lNGU8mbiPgN5a343QlyWHoNnEcoJDVPosTIc6/TS4
	qh9F1exhZRJwd5FKR6CBwnLyiPn8WzTj+4rldWPWr1l9rFmSkiCci5lRc0sCIQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 28 Apr 2026 11:15:56 +0200
Subject: [PATCH v2 10/11] drm: zynqmp_dp: switch to
 of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-10-4300744a1c47@bootlin.com>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_021657_665662_A050D058 
X-CRM114-Status: GOOD (  13.80  )
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

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. To achieve this, instead of
adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
pointer which is automatically put when the bridge is eventually freed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 379180fb3004..c724250d794f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -353,7 +353,6 @@ struct zynqmp_dp_train_set_priv {
  * @lock: Mutex protecting this struct and register access (but not AUX)
  * @irq: irq
  * @bridge: DRM bridge for the DP encoder
- * @next_bridge: The downstream bridge
  * @test: Configuration for test mode
  * @config: IP core configuration from DTS
  * @aux: aux channel
@@ -385,7 +384,6 @@ struct zynqmp_dp {
 	struct completion aux_done;
 	struct mutex lock;
 
-	struct drm_bridge *next_bridge;
 	struct device *dev;
 	struct zynqmp_dpsub *dpsub;
 	void __iomem *iomem;
@@ -1494,8 +1492,8 @@ static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	if (dp->next_bridge) {
-		ret = drm_bridge_attach(encoder, dp->next_bridge,
+	if (dp->bridge.next_bridge) {
+		ret = drm_bridge_attach(encoder, dp->bridge.next_bridge,
 					bridge, flags);
 		if (ret < 0)
 			goto error;
@@ -2461,10 +2459,11 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	 * Acquire the next bridge in the chain. Ignore errors caused by port@5
 	 * not being connected for backward-compatibility with older DTs.
 	 */
-	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 5, 0, NULL,
-					  &dp->next_bridge);
-	if (ret < 0 && ret != -ENODEV)
+	dp->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dp->dev->of_node, 5, 0);
+	if (IS_ERR(dp->bridge.next_bridge) && PTR_ERR(dp->bridge.next_bridge) != -ENODEV) {
+		ret = PTR_ERR(dp->bridge.next_bridge);
 		goto err_reset;
+	}
 
 	/* Initialize the hardware. */
 	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;

-- 
2.53.0


