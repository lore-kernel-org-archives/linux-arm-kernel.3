Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F07DCD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7DIsV2yYkeuv0vuZTHMuiTm55rfBmU9E0/9cM1N8Eo=; b=izoYlzNbgLD5DPBK8ateppKLF/
	ktEKpxhIbdsqkk9Ya0Ygr2hMdhpmJT6/AiIaAG1X2jfvCLqLdxni8rnS65CjlMW35ZfF78nmSp8p6
	HA1lZ+Ib4DIDY+j8BH2xWu7qMCj4Pt+c/FLXSakaxaF94u63kYbhjSo2sJVesg9ElWUDIVGjZO85u
	kQXEp87uTMQuV0D6WXoUrD50BWQVbEUHi+cUITolKhjb3jYfTuk8oOcLk0lIbOxKGb7am9qwF34yC
	la5CamQjB6c41xOPEJQeJ9rI4oQFiZmfMA0qTUUX9vLLwW0L69CFL7PugbG32Gj1tTGaSKvp+I5gn
	P2DO7tAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX54n-00000006Sli-0Ca0;
	Tue, 09 Jun 2026 22:37:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX54j-00000006Sjo-3uoC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:37:39 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf1cda2b17so45311275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044657; x=1781649457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7DIsV2yYkeuv0vuZTHMuiTm55rfBmU9E0/9cM1N8Eo=;
        b=DkB0s+aKvXMm2uoS9NC9d0RHW2Tja1jl+YWJKRHwljhRAVyeN4DgPqRdUXK11Ax0xi
         a8qRdcpWObiPnemaudCs7uYn6O/ZcWjMrptpxg3N2EnW4B2+UsAtk0pIgi3oUGTXFAcn
         NzyYcdC2zWWhzBDQdOZZeR7vFXs0epO2OWPiyQgOlQp3UQ3ypdMiLxCtH2Pjjy6ACVTe
         Fh6zVDQ2mw/er7Sw1guogfZ9FokrvfOIVeMhszHGCbP5CXJ0K8H/8nmNiGLDScvGLK7J
         7pIeoFfimCfOakZYEB1VE1REmBXIWf+A14BX37jPwclqnPwNc3FlIuENNCO1+rHQwUUV
         uF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044657; x=1781649457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m7DIsV2yYkeuv0vuZTHMuiTm55rfBmU9E0/9cM1N8Eo=;
        b=L86UBaIEN463e48Tq6tKw2FQ/yZhz5xcG5M1OW03FwZaj/AYJA7OcJbd9K9fL5SVEu
         OcD7T47WWVowhKVXD71jgEwsilFw9J8tFgZlGhtnbTvBWASVd62D+BWfxLNH3p1iBKiT
         mIfh1BW3EeY/kqpB+/3ir7HUhXKg9nRvE3qdN3Tup3t6kK4bKFH7AI+dd5b8dis31u1A
         GqK02IW5ZnxYqrigGDHf5tpJ31MIP9ooSaCAFqwbBfSE+jxov1Kvc2vzjP23ffWxiSlk
         jdc6M1lXPuTXGqsE+4MutNWmTvU24CKGXD8++9pc8JARnB2LRdZPlARFdq2RRcTDTTH4
         x8kg==
X-Forwarded-Encrypted: i=1; AFNElJ8kI0WX3rTcPjoH5e6XW/btCPdfMbbSfWnVfv0p9YtimmG9KnNoNgWedJvt5Dd2d1Qa8sZcho66RaMA1yFTAst2@lists.infradead.org
X-Gm-Message-State: AOJu0YyxZGQRuHPPMB1VWN+2B4lywDenLeBR8YQMORVARfQgpRb1mPV5
	I2K+dQIn69x9Ar1mGpRcP2V6/ytF2gSUZXwwwoV66noyJ8jbtIhU2fSI
X-Gm-Gg: Acq92OELqF+ZCiJFCORtPBPWxETTJGp2QrjrehemA5IJEc+OfkJwDnCZ+YdM4maGwvp
	UkWKIq+NVcIOXFXWW2jXa7NlKMnhNM7Kp/tjrqNyHn1nEmx08/rl/7eei2yQjSOb0IOcXbQbmOY
	zbGs/3vnJU8eLb1HctYDstOQDa8mLDnJX416vBEa1mt5sNk2NPkWf5sVEmjq6TA/eJZ6K14dkI1
	eHIFD3N3xuyleNCGGNsoVPLdj5PQdZF8VPIDgFwB66YlADjnaiKCqYCMB8cbyv7AkXFXzRov6hj
	JV/etN8Msl1pxzhpjaksNOR6EgdQFSNJz8lkcqsPoAH+XQMk/wu+dJPFaB5IfWBrYi9q6EukCp+
	AeVI5Rp7WahX+SRAP7nKSPGeO0H4uB5zalTsE4R6cyeTG/gfq9fCvlOROetXxdIMVZxyzeFTB3Z
	7zE5P7BdEAyH+LwuCGP4gLjsIzd2Is9+rKqcPsiOX54mEdVIlAra+yLmuhwPIaRiZ+RykurnQC3
	LCJ2qXVcZklDJ4FjxZ0P4rFtyw9XUv2aZricoENAn27Tw==
X-Received: by 2002:a17:903:990:b0:2bf:1845:baf5 with SMTP id d9443c01a7336-2c1ec918402mr185643335ad.12.1781044657308;
        Tue, 09 Jun 2026 15:37:37 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm293750655ad.9.2026.06.09.15.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:37:36 -0700 (PDT)
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
Subject: [PATCHv2 2/4] serial: mxs-auart: rework clock handling in mxs_get_clks and probe
Date: Tue,  9 Jun 2026 15:37:15 -0700
Message-ID: <20260609223717.41670-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609223717.41670-1-rosenp@gmail.com>
References: <20260609223717.41670-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_153737_995265_53B345F5 
X-CRM114-Status: GOOD (  17.09  )
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
index de97c0f74e7d..aa59a48bfad7 100644
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


