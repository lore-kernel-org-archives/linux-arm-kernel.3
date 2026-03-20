Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B341D1091937
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 00:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MzlIIY7b66i4fIFyZ2+UWe+HudSTmQ+Ey/SWxXk4aRw=; b=VajTcqTVl636iyZ8671Yco6WgW
	l075Odw61LXji6hxJu+0ADKjOYMrUIkivqFDKzGToFtTV1TJuYTIUKrbm00b++L2LNEpIKTT9yRW0
	SaOsHqBxVnMEbQtyCoS2U+Cr8fWbyvlXtZ3V/vNJya7b6GaymhilPO3v4nmNgLEBAh9w+QqEzmfdd
	NESKqif2sWmrjtPggmig1JyKV91CoYKVDMRevOwzjzEKSijuW5WL1ww9ZcUeGXBMBJkJ0mLFL/zyO
	3xMQd6hyvJ8VCCjRm5cwNA+C7vYTH44aKuhVRW+AFF7qcOtsqkD/SMtkkYB0VQlDvvmvlTA47yU+F
	yf59b7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Naw-0000000BphX-2ypa;
	Fri, 20 Mar 2026 00:20:06 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Nau-0000000Bph8-0RfG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 00:20:05 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-64ad8435f46so129267d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 17:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773966002; x=1774570802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzlIIY7b66i4fIFyZ2+UWe+HudSTmQ+Ey/SWxXk4aRw=;
        b=Vkrknc9b3AMz2hG/6ieyeEGs6SVgugEy6Rm28H5uEvVk1vNYcMlNwHeFkKjuQ9MVH1
         +fL5BXOWfJrjQJiRbg7C48wwYkIhIe9islL8LlvfxZgnsvPWF3JgHwlDXPpA/12MyUQ2
         zeIxW1zoIhxghKRaRZSOhkWGO9sCCWkE2VDPgTEgTglyydPGYWcxnbgLi3OMlV4pVjy3
         K/OpMqLI+G70cUnUC1G18c4wlkb0ZG4DzJwZkw6xWae9X8ZVp+lbYGpUAp0oZ1xp/TCt
         5WSE3Gy8Tt3Wj5T0An35Isyi4V+xjPpFktT58Gsa1Y4dhXWkgbWVyJAj7Yd7Em88fkEf
         wE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966002; x=1774570802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzlIIY7b66i4fIFyZ2+UWe+HudSTmQ+Ey/SWxXk4aRw=;
        b=j6vwZcfoewtRlZcmQ0XGTA5DTmHlNj1B62beHeMR94ZM5iPiwd6/l6nzLQYly6Cxgu
         5D7oUgHNAwFAOQjgjlA06Klax7JbPkdufz9qOGSP78eCQvLaNRx93VxIBSZTq8dkV1pe
         u3pZvMMmkntRlRWM10lQDz2XMPUjrVtlnUYyeAHpRJCMXfkegkKkXinFUSfgWF3lp/pU
         VIWbupomWqXzVqDaUWqxZnZV3Qzp/xPYpR6mjNw6d+44gN+Vb8DCOL7VKTQnx3nSKj3i
         QIvBxQPfkAKN/EOrsmpJqcMnB0n7V8gBJLqeFHX2acGLS+wu/TWSwc0nXc+bcUn+aB7U
         rBdw==
X-Forwarded-Encrypted: i=1; AJvYcCV3jQV29RmyIyuumDi1WzVVGqhnt0mPwRnP0UhRuNpuq0xJ27Wh+m3vVoC0ughXN4+XM30vUioNMQ2NoC3G2H0Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxMQIdHNC54sC0efeWGrctc0u+v85y0d0O1wF5ru1dZgrraNdpk
	2LOYhVav34Fc59/i4rATildQ1GW94Z5+/hjVRf5BJQdz+/YneKOfhR5+
X-Gm-Gg: ATEYQzx46ZgzexyMvcFIw4cjxEIA18l/4JZBgDKw9uw9cr0Cv5nMOGag9V4kdXGOfjV
	EdIpAhkqykPJoMNQ1lFqUZ9I9mPn4mMj2xLoNQsHKO3FlUQ81qR5ZzX0CTovj5bpIPRFv32F9iO
	Z4LPxCmNJo8WO9dhBw0CbBh+RpNNmRiUL9TvolNiEQuqnqF7Lt9DigmD2p8erYzrZYKfBLrPerX
	siXjU1ojZ8dVnzqz30hdrILnWrGjPvT2LqpMrSkyDnMCGBfxED8WYnMWe19n4IDs0C5AF+bgAlM
	HYeQN48I4ke845uCWWO+epZwtTN30kixTmgHmMqw+6s/F4PNWq0jb7t0f6Z4BrgGFvhayHyOaA/
	Ntjq1Y9g5SdkVgZBffmGbRxYcojf1iXIZ31lQj4e8P7a700XTX1mjh/6Gd67fd/ceYPT2z8drmj
	Q8DbVia5xRWROWdkgZun7QKs0bFjEvaY9+Jk6U8gCDdIsbzm4+ochhEow=
X-Received: by 2002:a05:690c:e3c6:b0:79a:65af:7f4d with SMTP id 00721157ae682-79a90aaea1dmr13698267b3.1.1773966002555;
        Thu, 19 Mar 2026 17:20:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903a294fsm6866627b3.8.2026.03.19.17.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:20:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] media: nxp: imx8-isi: remove kzalloc_objs
Date: Thu, 19 Mar 2026 17:19:43 -0700
Message-ID: <20260320001943.19443-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_172004_155704_813E3704 
X-CRM114-Status: GOOD (  13.49  )
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

Use a flexible array member to combine allocations.

It looks like pipes never gets freed anywhere. Meaning this effectively
fixes a memory leak.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add fixes tag, fix typo, and move pdata assignment to original
 place.
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 10 ++++------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 16392420903a..8d8ee1b3076b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -459,24 +459,22 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {

 static int mxc_isi_probe(struct platform_device *pdev)
 {
+	const struct mxc_isi_plat_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct mxc_isi_dev *isi;
 	unsigned int dma_size;
 	unsigned int i;
 	int ret = 0;

-	isi = devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
+	pdata = of_device_get_match_data(dev);
+	isi = devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_channels), GFP_KERNEL);
 	if (!isi)
 		return -ENOMEM;

 	isi->dev = dev;
 	platform_set_drvdata(pdev, isi);

-	isi->pdata = of_device_get_match_data(dev);
-
-	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
-	if (!isi->pipes)
-		return -ENOMEM;
+	isi->pdata = pdata;

 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
 	if (isi->num_clks < 0)
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 3cbd35305af0..99532efa4e41 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -286,7 +286,6 @@ struct mxc_isi_dev {
 	struct regmap			*gasket;

 	struct mxc_isi_crossbar		crossbar;
-	struct mxc_isi_pipe		*pipes;
 	struct mxc_isi_m2m		m2m;

 	struct media_device		media_dev;
@@ -294,6 +293,8 @@ struct mxc_isi_dev {
 	struct v4l2_async_notifier	notifier;

 	struct dentry			*debugfs_root;
+
+	struct mxc_isi_pipe		pipes[];
 };

 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
--
2.53.0


