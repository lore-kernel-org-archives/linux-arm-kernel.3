Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC45B10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 22:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k97b44HDmjZh/vldQtsPrUOt0HFv7cy3dp+8tuieXWA=; b=nzr6md8SWCRbH/gQ/zm+MCgIWF
	YlXH0BawTiuruM3WNmiucL/A7x/yn/gPCTJhnCh3X55p+29YLoOLLVeq+J5v1BswLvd5yHYrQ6CkO
	s+BZ5QGAsJYjlp5k1CUxaoWvU0KaZkjM6EXxrQ3jSNsItRG4EacIBWfcZlmraZsbpJTKk6JWiUSbr
	uBgknzQnxRtORq8O2y/9pQ7F2k1NIBngXE4pT91iyY5d9U5F4AV6dcBulWUa9ZZGyoQotCnOa+Xut
	OjMbASxEkPSYS1fcIZxVIgL2E01b+3nVTaTaL2BITnPY0FS63ednSAkc1c2t/qYohM125ZB7HVwTD
	uaV1nZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6FeC-00000008Hkw-34w0;
	Fri, 27 Mar 2026 22:27:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Fe8-00000008HkX-17RB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 22:27:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so24304545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774650434; x=1775255234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k97b44HDmjZh/vldQtsPrUOt0HFv7cy3dp+8tuieXWA=;
        b=gm9vkn8Qw02mh5RYz/6fi4ljth12N0TI5R5FsuUFD0icODxz120Yp/kgyfWUItOTQF
         DfeLj7ySq3vt5o8X2HiUmVbGx6rWafwlNjpMRZ6/TMxf7kkWCHzHqZvmlp4c1Gway3sC
         AxySSvi6kKmFCsHHBzKbUkifDP1+YDTDukCONJu2AoVp1NIYHtdOGEBqCyWZSUZd0rV7
         AuKrI0m0TS5J8av87rii9ySLjPWGKxN9iiY5vK9xcySGUxVSjJ13ynBjr8qNHhcC/Maa
         u6bOUTjlSrU0fvX9qGPMyi5JVnljxpx+VcMG6flQqi+hfH33Z9tV3Q92JKaUtW/oQP5K
         j2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774650434; x=1775255234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k97b44HDmjZh/vldQtsPrUOt0HFv7cy3dp+8tuieXWA=;
        b=p7dOO40IdACBBIbTEfWwQTJexERAiN3iO7oF2kMvLIVX5b8yjJFyh6y1evOYL67D0/
         ulpVXM0mu+BzepEbtxQ6dIQxsfmH1U01mSkR5FS3cwWdWAaU+bZ82jtk+SPmzmXCmGPR
         g/GEmuzNqv97PDun+i8hKf2pppqALVWsmSGfbMYtDf3ZFQJf/rb72IRE8wDng8n4E4Pq
         Hm3tXeW1+vzMztp80XPpcgqCZDgGWO/SjIAVKQNale1HArr/Mt4uITa3sXyI/W1qZdey
         ykjq5oI+mAT/cVTJEbnMqa6pGYWjnO5M5zutyErmL1z9KTMhpp9e0t3gmYIYW+6mOhGd
         VkpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaWSuvbiIY5QRut/pXrEjdB6SPoErpw1CdhjAnWK6CnTMX7sw4ee7aM8kxbj9X5xCt19AhpKX8vilOoxupYofn@lists.infradead.org
X-Gm-Message-State: AOJu0YzFqfHiNjuPXNwCezCiO4CjoCqEpEp89Z2EEpWmeksAy/AVvMhj
	c1iWFE3KCC6cHxAKP+IlYWT7NrItgZwUk/5Ek2n5S4D0GYLT0QDTx4DD
X-Gm-Gg: ATEYQzyKINEBsCWBXUWY+/0Azi/y+bziowkY8JhINFZ+oJyZzMHR6GIv+D1sLlxIRwe
	79dAFpqE7XZyeZJU2c7rfciR6gIkwslau1GbseKInWXD+NXdFeSQXsNSfEj6edtQcBntCQP48N8
	fVhYXcs1t4VTe4JaGvKRmR0onGZeA9i8RE7e/j6hR60XE3y7VLUPZpYD4Dh28lsLNlR10eS8Cnn
	HaHgovzJtl9yJ14dRSffsgEP6CUdLftf32Q/6fiVgHE855eiGmB9FxRdc/zQbdFVkff7rmhCJpr
	7Qp6IxfrtfSBzueZof1OddbuJGuxqsLClNErs5f6LFcdjTzD1AAdXhJhyeCuxKEGjw6Mr0geJzn
	Fb1M9Zcqz0D+DBYz7A3W+DskIucvDA1TNUHbw/ghdEuPjPLZfXnprgayOf7qc8k6DO7CfMuG5MR
	Hw5qMeMNrFKXN6s6/3zT10FYDOaGAVAUzCoV/XZNwp2bOSCsmeuAiOYTS5k5pO1gssJCoSP36XR
	nkCPV37bs53
X-Received: by 2002:a05:600c:45cd:b0:486:fbc4:8fe2 with SMTP id 5b1f17b1804b1-4872912dd2bmr59529345e9.15.1774650433771;
        Fri, 27 Mar 2026 15:27:13 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873062ec9bsm10062655e9.7.2026.03.27.15.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:27:13 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	jacopo@jmondi.org,
	aisheng.dong@nxp.com,
	guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: nxp: imx8-isi: fix memory leaks in probe error paths and remove
Date: Fri, 27 Mar 2026 22:27:11 +0000
Message-ID: <20260327222711.268132-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_152718_292850_C97AC6F4 
X-CRM114-Status: GOOD (  14.97  )
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

mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
frees it on any probe failure path or in mxc_isi_remove(), leaking the
allocation on every failed probe and every normal unbind.

Additionally, when mxc_isi_pipe_init() fails partway through the
channel loop or when mxc_isi_v4l2_init() fails, the already initialized
pipes are not cleaned up — their media entities and mutexes are leaked.

Fix both by adding kfree(isi->pipes) to all probe error paths and to
mxc_isi_remove(), and cleaning up already-initialized pipes in the
err_xbar error path.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISP Channel driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4bf8570e1b9e..ab32c5b6ac9c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -490,33 +490,43 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
-	if (isi->num_clks < 0)
+	if (isi->num_clks < 0) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
+	}
 
 	isi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(isi->regs))
+	if (IS_ERR(isi->regs)) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, PTR_ERR(isi->regs),
 				     "Failed to get ISI register map\n");
+	}
 
 	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
-		if (IS_ERR(isi->gasket))
+		if (IS_ERR(isi->gasket)) {
+			kfree(isi->pipes);
 			return dev_err_probe(dev, PTR_ERR(isi->gasket),
 					     "failed to get gasket\n");
+		}
 	}
 
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
 
 	ret = devm_pm_runtime_enable(dev);
-	if (ret)
+	if (ret) {
+		kfree(isi->pipes);
 		return ret;
+	}
 
 	ret = mxc_isi_crossbar_init(isi);
-	if (ret)
+	if (ret) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, ret,
 				     "Failed to initialize crossbar\n");
+	}
 
 	for (i = 0; i < isi->pdata->num_channels; ++i) {
 		ret = mxc_isi_pipe_init(isi, i);
@@ -538,7 +548,10 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	return 0;
 
 err_xbar:
+	while (i--)
+		mxc_isi_pipe_cleanup(&isi->pipes[i]);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
+	kfree(isi->pipes);
 
 	return ret;
 }
@@ -556,6 +569,7 @@ static void mxc_isi_remove(struct platform_device *pdev)
 		mxc_isi_pipe_cleanup(pipe);
 	}
 
+	kfree(isi->pipes);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
 }
-- 
2.53.0


