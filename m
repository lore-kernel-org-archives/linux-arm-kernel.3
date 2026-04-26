Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1A3FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4PBfpNfiIjOJFFL0xA0IF9h53jT9Y+7A2MFAc7Sp6JM=; b=ZSomOa+RxpuybcAMj+qZPB1CFS
	FY5ME+/vDEsxbuHRFuenloFQvaPUUahAgiE3nIln5N20bMI24bK5o3VQ51PrlMslfoR1F3LEeHrad
	6pnCjLB3yHKYkZ5WlGuEI72GCE6MvXfgwtN5cWsiXlHf8lzso0Yng/MH1egSnQUu4ubRGJBwF8z+t
	v18fv5Ev/AQ76ErY3JuA+b34bshoO7dK8hslG+6HreQONns0OC4mT+om3W/rLGUg5gSMuUOfei26K
	xCWuFclP5QNxsLJsXd2weiN5pj/5F2YmI5I8Zxg6fkFhQHJ4wplXhRiQAfkkLReQFdxnP6iroyGZL
	I7CO4IaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH00B-0000000Fanh-0F7I;
	Sun, 26 Apr 2026 13:58:27 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH008-0000000FanM-25uc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 13:58:25 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82f8893bff3so4381955b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777211903; x=1777816703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PBfpNfiIjOJFFL0xA0IF9h53jT9Y+7A2MFAc7Sp6JM=;
        b=g6EfkcxyMeolD7uUgVivL0hXkwGtcP0k2LS46cLfo6DSHr8EvX3RwOwN4RMfxcDUEb
         tCEw7eYq3NKjYAmpE+80wafryVtS/2PDc9udBzTYkUI/dJ5HM8BMAOqVG8kOFIpAuH4y
         x1DxKlKKbqnIvvx/lVl/weegyFNITrWoLDZsXzAtFHTJw7Am9tzEW031+ZjF/9AVPYC+
         tQAWPVbFd2qtVotb+lK2ggZRnejXa7eMaDLt8qkMFYGqdu/Wrrs50BFEdYwFTb50zBql
         ofFffWt8uUhD+/D72JVndG0mMI9RpYDAQ9zgiKCsPplE23fZ7Ctu/vN47ADUBNdYslZG
         WmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777211903; x=1777816703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PBfpNfiIjOJFFL0xA0IF9h53jT9Y+7A2MFAc7Sp6JM=;
        b=qYmFfDN+82xgYD9vnyMSL+cnXXKWXuj32p/mp5SrXZaUMS2c7xJ9HMwfDoaJt3+cNa
         yLO7NHCgJ0I4PzvnqXh2TaHgser9xRvHDTR/TEc+zWAEWLBjtBUlmL/LAEnJ+YS0HvAS
         M1YAKOmaji5atLrUbPB5/arO7YRA13XkRCkZqylbY3Au1Ey4aGu+BKOOTbcyXTsToOwz
         ORYiYjJmpYthHU31xFCtDF1GH5ycFh4USsjTWy4QgoqLURVRBp4mNtRIRr61W+36XGmC
         by1ue5YfsNvMh6Eeq0CQ0WCO/B2tBy1IltJugvzA4j2eNEbNKKVKqn8oxTSzcY59Nqs7
         gpdg==
X-Forwarded-Encrypted: i=1; AFNElJ/KBhCPORtC7Hs3sPunjS5Ezcs4F4rWt4De4fQvTNbonEBUhSDVZrnQoiwJ+IyFKRXWwjBcjDd9KhnwQRXtv0ac@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8sGtUL4DBvyjZhWZgDOzne52ZbwrBJo86vlLsyMahRoYlWNV0
	EoyxOse8CY8QP0e8Sbc/+jycPJMnzBL6quQxAjapmbuWraciwekGcho=
X-Gm-Gg: AeBDiev1rwfJbN8zS2pjwS+IkbuwJqi93Sk9ov8Lh/IzkaDi0nIvWBQOcTOjTX886RA
	OM4t9XziMD+TK1Y2tA/yY0ygKx7aCV3RZHohiZkp2UhANLCRAnG9RDhFtMm/973MGpQ6JFfWQ6t
	bCkgr7lcLgjITDMXbhA0JUrMR1Z8rLxhF9ws2cQ8PhQcAzjJZeS2Qw+lG4sWQ8o+ZcipOmQQsEB
	tIx86aoHP+6iM087vKaXmhToKDGZLX593uNCF6uZ8Zc6EF+4gsOVT7vGPbXbW8FJ9y3LEVY+cTV
	Cnu6gzBEVafgw45b3x7B/E9Y1hbeHttVb16vyQjRtcRRqiFB5QfmOqNRjq3PXib/BZyHBnzJ4VE
	1QJ74vnfG16PzEagzCUg0H/BS4NofrmjSnCzOCPvWxhNzFoSkjfG0txEipkNpeSSehvVAs0MoHe
	TYR+GK1gqPshqoM9xvY9ZEWIk4sAunemMDVmtEdCNgO0xiQFm6ycDHqi9wcFlhL5Ru3z/Y8fpmA
	/dDkaRcdg==
X-Received: by 2002:a05:6a20:e210:b0:39b:91d1:6bf3 with SMTP id adf61e73a8af0-3a08d8ff2b2mr42090665637.56.1777211903497;
        Sun, 26 Apr 2026 06:58:23 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebbcfd7sm36558098b3a.32.2026.04.26.06.58.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 06:58:22 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: sun4i-csi: Clean up media device on probe errors
Date: Sun, 26 Apr 2026 22:58:11 +0900
Message-ID: <20260426135816.8080-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_065824_543959_8C7440FE 
X-CRM114-Status: GOOD (  15.12  )
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

sun4i_csi_probe() initializes the media device before acquiring the
MMIO resource, IRQ, clocks, reset control and media entity pads.
Several of those failure paths return directly.

media_device_cleanup() is still required after media_device_init(),
and a failed probe does not run the driver remove callback. Route
those errors through the existing media-device cleanup path before
returning.

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 32 ++++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770..a504a1c78e 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -187,37 +187,45 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	csi->v4l.mdev = &csi->mdev;
 
 	csi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(csi->regs))
-		return PTR_ERR(csi->regs);
+	if (IS_ERR(csi->regs)) {
+		ret = PTR_ERR(csi->regs);
+		goto err_clean_mdev;
+	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto err_clean_mdev;
+	}
 
 	csi->bus_clk = devm_clk_get(&pdev->dev, "bus");
 	if (IS_ERR(csi->bus_clk)) {
 		dev_err(&pdev->dev, "Couldn't get our bus clock\n");
-		return PTR_ERR(csi->bus_clk);
+		ret = PTR_ERR(csi->bus_clk);
+		goto err_clean_mdev;
 	}
 
 	if (csi->traits->has_isp) {
 		csi->isp_clk = devm_clk_get(&pdev->dev, "isp");
 		if (IS_ERR(csi->isp_clk)) {
 			dev_err(&pdev->dev, "Couldn't get our ISP clock\n");
-			return PTR_ERR(csi->isp_clk);
+			ret = PTR_ERR(csi->isp_clk);
+			goto err_clean_mdev;
 		}
 	}
 
 	csi->ram_clk = devm_clk_get(&pdev->dev, "ram");
 	if (IS_ERR(csi->ram_clk)) {
 		dev_err(&pdev->dev, "Couldn't get our ram clock\n");
-		return PTR_ERR(csi->ram_clk);
+		ret = PTR_ERR(csi->ram_clk);
+		goto err_clean_mdev;
 	}
 
 	csi->rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(csi->rst)) {
 		dev_err(&pdev->dev, "Couldn't get our reset line\n");
-		return PTR_ERR(csi->rst);
+		ret = PTR_ERR(csi->rst);
+		goto err_clean_mdev;
 	}
 
 	/* Initialize subdev */
@@ -236,17 +244,17 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&subdev->entity, CSI_SUBDEV_PADS,
 				     csi->subdev_pads);
 	if (ret < 0)
-		return ret;
+		goto err_clean_mdev;
 
 	csi->vdev_pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	vdev->entity.ops = &sun4i_csi_video_entity_ops;
 	ret = media_entity_pads_init(&vdev->entity, 1, &csi->vdev_pad);
 	if (ret < 0)
-		return ret;
+		goto err_clean_mdev;
 
 	ret = sun4i_csi_dma_register(csi, irq);
 	if (ret)
-		goto err_clean_pad;
+		goto err_clean_mdev;
 
 	ret = sun4i_csi_notifier_init(csi);
 	if (ret)
@@ -266,7 +274,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 
-err_clean_pad:
+err_clean_mdev:
 	media_device_cleanup(&csi->mdev);
 
 	return ret;

