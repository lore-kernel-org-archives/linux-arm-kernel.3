Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3700610F3DDF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5w1Y1b3TwAv79lqz5JishdxGsbpyNm4BW0hPIUDQcY=; b=EH+EnB4AnlD1C6gsooLsMFrVRk
	9wKCgonpYJ6//CQkIYOiTwBiEtkLaWXTo7MER3sbxdZfkdFt15n7UcFDDz8yRoVbclWxJLD6Jl7wx
	K4FrvuCcBmAus1A7mOLq532rZMT9UxuIOgm5n2AWClWpkFQis8GwZkGkcbe5A2rD2igCfDz9dwzpS
	0dxzuMk3mcxcPu/O8fI2Q9e6cURZwrCBPIU6xoz0iWWN8VYSTcmZ44hapi2tcypcse7L8T4FWOsqR
	idCuBQZRFbHy91RpymownKjbfseLVxWdrthch5WqeirGZWiOSnhWoulFeg1tkcjuQorltFYBg25bp
	kutT2WPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QSo-00000008nni-20qC;
	Sat, 28 Mar 2026 10:00:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QSm-00000008nnL-1gjc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 10:00:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4870206f73bso17061535e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 03:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774692014; x=1775296814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5w1Y1b3TwAv79lqz5JishdxGsbpyNm4BW0hPIUDQcY=;
        b=iAWxsG/Rbsatjr9AErEhnT/9TtMzOlHPEf+FXSWz+E7lN0GEXBao8unZF7zHNi71Nn
         bZc0kpEiImipVYlJfi9lnsf5eputLcNnRFC2mSTAyzRd5F4jkF6wCuYKbL8iLxtrYFjB
         GFn/QTBwKYdCpFY/ONyT3Psf6pFxR7BED4kuPGMGMBiaVvGVkW/zxyZDd5ltY6aCJ5MS
         On1/nJC2cqdsXg4PoX4De1fpC1FNNM6+GSfiLit7YtwvftDZSeY3i97qvsNML6xmVbGs
         HcXOQSu89Gq//3aCKdq+q4Zfi5kQ6a5kn30fYxYWmQMNnHQosUj0/dEYjM++tXUku18M
         JhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774692014; x=1775296814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5w1Y1b3TwAv79lqz5JishdxGsbpyNm4BW0hPIUDQcY=;
        b=mJdYHo0oM8Aa63LiqfcAieZTIM6uxx0jFqSL0lr8h2b6eZAJZWq6GRldCwAUhcAkU8
         Zt4bG/KhyI6h/1w02IATBCfCR0uskCpWcAaBjfIisRU9ENvGFSBwhOsRiZePcTkP+de4
         f78yIp/kDFLamHzYgt+h6W7RE731hIG8g8RGUR0vHsUk1TPC2xSoyPdBfYOKF/0aIs+s
         Dy+XUzo4OajNB0VwBUIQfTUIoPVlYJfvGemlQD3wVFnMp0l2neEySj9jGovBbV+E8HEG
         L034Jxgzd4z/lFBFpQ4SiHCTyW6aUePxD0xxu42sDRTF3ycbr/cIuo37imAoGJN6lyFz
         FIuA==
X-Forwarded-Encrypted: i=1; AJvYcCVR+xUl3LlhKwj+FDS8Y6CvEiuGxxS83qCQI8cBm/XwQGe7cW4N/F45hAoGevEKv4brhJ98XMXOaPwU2UKrBqUW@lists.infradead.org
X-Gm-Message-State: AOJu0YxFCwIv2EU5dVzAMnJD4qhq7t+EvhVeC+b9zwvCXf1zgNfCqQdJ
	YkkbBLH7B0AB8uudr55Moqby7JL9ZIBPs0oBm+l8cXx4DXHsgJHAZMwQ
X-Gm-Gg: ATEYQzyvn+mrYE93sKfwyFKbwEtufEcbiICdUvwWrtROqPt6b0C+ssGzNGrz0ukl5DP
	/pQYR4ZPtO7Bz8d4zGlcdcxL9lXN4fjiC4xQuJtF563YKytEFYChODrIZsUS1O5S3ND1imRupGD
	nMxGw/+0BOh0RGW0w0mD4gzABHXdviYQpI+Ydmm03PAKDDzuHXElUAevoOxoknxA7xoqN3/IUTv
	yKZ5TEZp67bDT+HKCtvI+jTp6Kd9SIC4my4/4Mi6fD7YvX6GGUjCzgRYVH6OtNgbmcpoAL3u87S
	p7bAha5e3foJs0qtFzHcWhKfhwsLB8NI3jSyTM47isWQbesfUc5n8i9OqFV4isGFIaWiJROxX+r
	8hDfi3UKfyxJMCY5F9VtpbxRZUHc3vcAVyjM9Yb5mrgT91HYOoSfliSZW/M3Axjkq+2ozm+Ctc3
	V2l0R2v8QmQthaFkY6Us0+sGm4qlCNhk5PBef8gzyJg/heNN8u76tTQrgmetIeNGfif397dRP2H
	pj07PTzCA7yLqpklN/bnYo=
X-Received: by 2002:a05:600c:6814:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-48727f7be29mr91414145e9.22.1774692014189;
        Sat, 28 Mar 2026 03:00:14 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d4d884sm198418535e9.15.2026.03.28.03.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 03:00:13 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jacopo@jmondi.org,
	aisheng.dong@nxp.com,
	guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: nxp: imx8-isi: fix memory leaks in probe error paths and remove
Date: Sat, 28 Mar 2026 10:00:10 +0000
Message-ID: <20260328100010.41236-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327222711.268132-1-devnexen@gmail.com>
References: <20260327222711.268132-1-devnexen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_030016_459617_81590E92 
X-CRM114-Status: GOOD (  15.36  )
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

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
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


