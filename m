Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AC3CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYa7LbLjk11lrjjaU1fZoPN6rpBXsfSmsjALmXq19N8=; b=l8fZCl7iIL60Kt9EBuoUn6KM1f
	RxOmVGGxP/LiL5vE4o2edo0eSVDxeh1oHbzOUIQRoqJMyJQnRTUpdPHozCIDP6FtQWtBkRwxOwwIK
	rsGNUG+ybxrxlLoIuvWyG9EkO19aQqGozBMYj/CCFS1KS1By4b57zPdbmdYv3DW5toWijA1vy3GJW
	OXZR9by2s5ZM4ImtCKrz5WWbuunp9HSig6bOnyoarIzvMXqpeIw/zu9j113GaTnBOuIaHR7RvkSVl
	5X9p4/ysYfIU548+Q+NFyPlWwZt9flyLGwvquOOMRQkWdCjpLdCN+Kt2Nnitp4xffjKIKwY0wfuWT
	v4cAizmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbpA-0000000E8nU-07t6;
	Wed, 03 Jun 2026 02:59:20 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbp7-0000000E8m3-1vj7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:59:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf2247e38eso41938625ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 19:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455556; x=1781060356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYa7LbLjk11lrjjaU1fZoPN6rpBXsfSmsjALmXq19N8=;
        b=gH9MIzX1Li4yBqS8DdTt9EBRa+RQ4sDK1xWn7RigYiwNcK/JlQSSr22a5wXF8CmwFk
         PCpwhpg8xjtwULJtOP2OOGa5thWTbGQI3g20dfMCN02n6F+Xgaivhu7DOTbx3eMtof0g
         JOVOxViVqX/iYBQ/jOfUaok4QBw/vU8xhpDe+TxFXnndBmWUJ0L7wg20GdOFIgW9futY
         yQqBYom92B7UN+mfR5ck+vAKlG/MwBaFsxs4hTg4StPTw3zVUBRmM8zW74hR4U9okMKy
         a9tbS1nFuHhsq7UQ/e1z5cm+u5Ds/90ztCIxqcmWgTV59UKm/AAHOWq4oXEvt6qC4Qq2
         Mocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455556; x=1781060356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYa7LbLjk11lrjjaU1fZoPN6rpBXsfSmsjALmXq19N8=;
        b=cmCfjmXLeytfqpW/n2NKhEp7hWYZ7hwOREAIfOVRODLePJ88CrhMCZYTLqzDdVpRvB
         ZNeu5tySZb3z8ERhECz8GlzUR2q2NRZnzZ5xtMnDSEg8LBweYh9mEXnA/Go5xgQlZ+36
         FIjGlsJZtPiquGtem3sJNKGnAGTTpkQ+C4IbyAAflEWIhL0AaNAxwme/Yr3r/KH5fdsh
         qnUCi8qSJXe6dgAjtoklRCWsFjtDKDa0CeB1EmlVQLGJAVypAmCXF2DpfjJZjA9u0eDF
         wtnnZOuoqMTFMOn3ZnJAB0wNwhao79jk4f7kCp2EviE0qN22eS1dyc4Sbm5nmA9cosXC
         0p/w==
X-Forwarded-Encrypted: i=1; AFNElJ9SWCGmYGqklQctdl/cgvycRad52raU91x9KLoiFdjRQ92yrP+KBOTC75iQ5iEAKt5K+NdZm3l9HkJ0kqqHZn04@lists.infradead.org
X-Gm-Message-State: AOJu0YxfU4gOQdZrxJvub1H/Xj9caOc95A3MVcN/EtFPPxKmXWED5Wov
	UkWnOlZgEVq7kidBPSzah5SG46l0UFJd1J9qjPpUDjKxMBlNxBV8wl+1
X-Gm-Gg: Acq92OFlewko+P1odFaAUtsya0qNYRJpDD5kyG/sin9O30324AI2zjQgpByajD29Sk1
	zS9q4Z47FSIJfOsajAdjiwx/jBUYXXz6SY1GIqarRj6kThn2iqVN52kJTlbJZRm9KIO7Z87M57S
	8nwdzbCPkRyJRqoEIP7pNiIvQ6IL8XjFgJVFJ6k9jJJn47oWoCLngNFmmNoQIRdjMGXYHUX3ovt
	MJABfu0UhFLdVf9YOvYJz29fsyOA9AsSCgmUauaoDerF/9bHPTsRWYPL3+U2IJDqSWhHRSaeUQL
	nPfFiDjKMIrdIgn3u75GfVkLI/LV17qbvdHH1FhsHcJredMc83zhrHgy3/t7WdFtLk+5OYyL6i9
	8f/hi9Fv4VhkOl5NmyYsEnu8OhkYDKbGukMR1Jo2xX9gYClvuUGt0i4yttn2KqZcJ/k0wbJ+2sd
	OQUxsZWMiye/+khATkjqgNhdo28Vd1pKcd9p4kFgY+KaBOc28fav6lQbMmvNAPffJFqHqv/VbLN
	AgUnO6nyoh9wvx9p0B7NWKWC7RqGQXo0rRubSV4gVDmvRf3XA/mZJav
X-Received: by 2002:a17:902:d48d:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2c163a2311amr14365355ad.11.1780455556485;
        Tue, 02 Jun 2026 19:59:16 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm8093805ad.17.2026.06.02.19.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:59:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCH 1/3] serial: mxs-auart: rework clock handling in mxs_get_clks and probe
Date: Tue,  2 Jun 2026 19:58:55 -0700
Message-ID: <20260603025857.287148-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603025857.287148-1-rosenp@gmail.com>
References: <20260603025857.287148-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_195917_503647_066F3D7C 
X-CRM114-Status: GOOD (  17.37  )
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

Use devm_clk_get_enabled for the AHB clock so its enable/disable
lifetime is managed by the driver model. Move the mod clock
(clk) prepare_enable out of mxs_get_clks and into probe so that
clk_set_rate is called while the clock is still disabled, avoiding
CLK_SET_RATE_GATE failures. Clean up the error labels accordingly.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 47 ++++++++++++----------------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..1390fa000a5b 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1470,34 +1470,22 @@ static int mxs_get_clks(struct mxs_auart_port *s,
 		return PTR_ERR(s->clk);
 	}
 
-	s->clk_ahb = devm_clk_get(s->dev, "ahb");
+	s->clk_ahb = devm_clk_get_enabled(s->dev, "ahb");
 	if (IS_ERR(s->clk_ahb)) {
 		dev_err(s->dev, "Failed to get \"ahb\" clk\n");
 		return PTR_ERR(s->clk_ahb);
 	}
 
-	err = clk_prepare_enable(s->clk_ahb);
-	if (err) {
-		dev_err(s->dev, "Failed to enable ahb_clk!\n");
-		return err;
-	}
-
+	/*
+	 * Set mod clock rate while it is still disabled so
+	 * CLK_SET_RATE_GATE does not cause clk_set_rate to fail.
+	 * The mod clock will be enabled in mxs_auart_startup()
+	 * and in probe after mxs_get_clks returns.
+	 */
 	err = clk_set_rate(s->clk, clk_get_rate(s->clk_ahb));
-	if (err) {
+	if (err)
 		dev_err(s->dev, "Failed to set rate!\n");
-		goto disable_clk_ahb;
-	}
 
-	err = clk_prepare_enable(s->clk);
-	if (err) {
-		dev_err(s->dev, "Failed to enable clk!\n");
-		goto disable_clk_ahb;
-	}
-
-	return 0;
-
-disable_clk_ahb:
-	clk_disable_unprepare(s->clk_ahb);
 	return err;
 }
 
@@ -1604,17 +1592,21 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(s->clk);
+	if (ret)
+		return ret;
+
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
 		ret = -ENXIO;
-		goto out_disable_clks;
+		goto out_disable_clk;
 	}
 
 	s->port.mapbase = r->start;
 	s->port.membase = ioremap(r->start, resource_size(r));
 	if (!s->port.membase) {
 		ret = -ENOMEM;
-		goto out_disable_clks;
+		goto out_disable_clk;
 	}
 	s->port.ops = &mxs_auart_ops;
 	s->port.iotype = UPIO_MEM;
@@ -1681,11 +1673,8 @@ static int mxs_auart_probe(struct platform_device *pdev)
 out_iounmap:
 	iounmap(s->port.membase);
 
-out_disable_clks:
-	if (is_asm9260_auart(s)) {
-		clk_disable_unprepare(s->clk);
-		clk_disable_unprepare(s->clk_ahb);
-	}
+out_disable_clk:
+	clk_disable_unprepare(s->clk);
 	return ret;
 }
 
@@ -1697,10 +1686,8 @@ static void mxs_auart_remove(struct platform_device *pdev)
 	auart_port[pdev->id] = NULL;
 	mxs_auart_free_gpio_irq(s);
 	iounmap(s->port.membase);
-	if (is_asm9260_auart(s)) {
+	if (is_asm9260_auart(s))
 		clk_disable_unprepare(s->clk);
-		clk_disable_unprepare(s->clk_ahb);
-	}
 }
 
 static struct platform_driver mxs_auart_driver = {
-- 
2.54.0


