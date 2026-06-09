Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213CACD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jagaY783ZQexk/NjgnRY09dQ8WqyYDUPOGhKANIhzfg=; b=lbGaRXoAT3npd+tyPrhNzzDAxE
	q/YlAa/khnV4VtL1IgAykIxjrWPs48664XCbstg+0M21NIleN2lTgHYDZFse/ZyoxoMHjmNzPqEpT
	BJ+tnaJMezyHhdUbb2CwVEfMS52hyhO1p39pl2TZFgFwPMoGc1b8bjwXVwWDfEmCR/ihaP7KmGmMo
	apV31S6JPKl5CRPSQKq6b9GYMqvew1WuhcZbQ3Om1SRlEESA3CWnC28Pg7HHZg6ego89H6MBVvA2O
	1BPdczwiCKWb7yh9V+/Vyi6vKn4Lxo1cxGiQVSj4codReo2fusGs4I753/8IKXVBDvPNgqMuhcpYH
	q6F8vvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX54r-00000006Smo-0kxP;
	Tue, 09 Jun 2026 22:37:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX54l-00000006SkP-1rGY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:37:40 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso42089385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044659; x=1781649459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jagaY783ZQexk/NjgnRY09dQ8WqyYDUPOGhKANIhzfg=;
        b=pRi8Nug8PwZBV6PIDJvhdRJFiYteZc36qfo5SmNMCjQu4k39xBHDzDe/EQouyaKt/N
         AXWp+m40HfUDcAufbrEODsYsTjlACOtZ+MWit0XQgvEPMfVeSeW2ZgJgfX5ypGJA2ytl
         7gtxYDDgH5WhHZSJaPerJYcA9Wr1ck4/v7fMTyBr/QEb4Swg5SV7UGARRmQZywCHU54X
         YhINNdXOrTlzy1L/CN8IaAaeqlfuNS/gHmCctjo9/EqHzyJJWrPLK3lFVutkSnsMLTEh
         97iARAYNOdZ5kuH6kRqxvj0OWjDMbp8MJa7ZSkqCE0YF6tceyBHQH5huVaXBUd5niTgb
         VmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044659; x=1781649459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jagaY783ZQexk/NjgnRY09dQ8WqyYDUPOGhKANIhzfg=;
        b=XGe1I8ozCjZAKRn2ryUHeHd4JWvzsPwIew6png1zQOHa4rIujqvjdGd7cOqZ80LJJr
         cHG4ASmwHRQnL4Ck2iYTfBx1KcxGFPBFBnby8X4GZFpG9387060M5kmLB3ql+f8RB2h2
         gFG0+zViXlK46cVaIWn7iMSxiRa+qbGtBhVLVyEM8eXu0g23/jj0GP43x7mtHg/sKeNP
         1CODyn5bUNtdhZfikm+R6O8n46Fu3ukZv+8OjlsFVgdkD/+RNbW7pWVrR4xVCcdb8P2q
         QSRdyCj21HMOTzAhIFGER7hBSWQN+KLzGDqQjcDXAWqEmDF1f61Bibe9239mPSAkElcQ
         8UAA==
X-Forwarded-Encrypted: i=1; AFNElJ9zGc0bfPgWfxPu8ORJwRVuQ7n19S026Hxm5PVJnUjWWrcuYIEeI8We98KqAmfTKfbfeU6BVhfcCahHa0Hem9mA@lists.infradead.org
X-Gm-Message-State: AOJu0YxduLrDl2BZjWKBa4UoHv4b96QcXP01+8EKJzC6bM3GSrM90COO
	j8WnTsO+0jjpHvC4Bvy0TBYkhywHtZ2AIEVueXOzus2FAlqA5LFbVLZx
X-Gm-Gg: Acq92OGbZcrh0t5vuhXQhfaDNjgLSET5s29IXP3tqg64RLuP1I97ml6wAY2LzdMBZLT
	nc9B/p+cGBbmk09pnS4mIcP6JyW3Xomf5tDOHHAfXpibFFxVf/4vAmAmDlNCVeIpvMlsszvTArb
	2GeQRwfj0rswabpcbxaIadE4sPT0VCd9tZGfLb78csQ5qClFkMlD3Z6FKwBy904kB23k1A9D4Aq
	g2lS+rDBc/+MrUZBpr5UN9FZ6RUQBzcVAsGCdBBwLZ8wUpSysROkGXwIHEDVNnLABeNq/er2a86
	ZjhpbrcjTru82rglWAyPHUixhIIS13fcAOwDTHgVQKFvDOL8LhLZVribW8SuWpzqyfK9fEjPa6H
	Qf4EYdV79Pdt5CxGFOfte2gYEHX0tv+EUaRUcXSpG+Nb/TWZDk7KEjrNl9TwyBUv68L+ub1NKAY
	TwxwpTs+2dQK4dpVxBG9rGSdNfbdxqJdsyN/Dn3jvj0G3kUGddAkdXZDsAMmK2umlu47YNZI2VD
	veiQu+FBI7BKK9DrL6i+l8SVI0LEw10ZC/h2gGn1BvJ2A==
X-Received: by 2002:a17:903:290f:b0:2c0:f807:a760 with SMTP id d9443c01a7336-2c1e7e51dd8mr158956345ad.13.1781044658617;
        Tue, 09 Jun 2026 15:37:38 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm293750655ad.9.2026.06.09.15.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:37:38 -0700 (PDT)
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
Subject: [PATCHv2 3/4] serial: mxs-auart: use devm resources for iomem and GPIO IRQs
Date: Tue,  9 Jun 2026 15:37:16 -0700
Message-ID: <20260609223717.41670-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609223717.41670-1-rosenp@gmail.com>
References: <20260609223717.41670-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_153739_504839_3268BA9D 
X-CRM114-Status: GOOD (  18.77  )
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

Replace platform_get_resource + ioremap with
devm_platform_get_and_ioremap_resource and convert GPIO IRQ
request_irq/free_irq to devm_request_irq. This eliminates the
mxs_auart_free_gpio_irq function and its call sites, and the
out_iounmap error label. Simplify the remove function accordingly.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 53 +++++++---------------------------
 1 file changed, 11 insertions(+), 42 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index aa59a48bfad7..4499e3206e85 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1517,15 +1517,6 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
 	return 0;
 }
 
-static void mxs_auart_free_gpio_irq(struct mxs_auart_port *s)
-{
-	enum mctrl_gpio_idx i;
-
-	for (i = 0; i < UART_GPIO_MAX; i++)
-		if (s->gpio_irq[i] >= 0)
-			free_irq(s->gpio_irq[i], s);
-}
-
 static int mxs_auart_request_gpio_irq(struct mxs_auart_port *s)
 {
 	int *irq = s->gpio_irq;
@@ -1537,21 +1528,13 @@ static int mxs_auart_request_gpio_irq(struct mxs_auart_port *s)
 			continue;
 
 		irq_set_status_flags(irq[i], IRQ_NOAUTOEN);
-		err = request_irq(irq[i], mxs_auart_irq_handle,
-				IRQ_TYPE_EDGE_BOTH, dev_name(s->dev), s);
+		err = devm_request_irq(s->dev, irq[i], mxs_auart_irq_handle,
+				       IRQ_TYPE_EDGE_BOTH, dev_name(s->dev), s);
 		if (err)
 			dev_err(s->dev, "%s - Can't get %d irq\n",
 				__func__, irq[i]);
 	}
 
-	/*
-	 * If something went wrong, rollback.
-	 * Be careful: i may be unsigned.
-	 */
-	while (err && (i-- > 0))
-		if (irq[i] >= 0)
-			free_irq(irq[i], s);
-
 	return err;
 }
 
@@ -1596,18 +1579,12 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		ret = -ENXIO;
+	s->port.membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
+	if (IS_ERR(s->port.membase)) {
+		ret = PTR_ERR(s->port.membase);
 		goto out_disable_clk;
 	}
-
 	s->port.mapbase = r->start;
-	s->port.membase = ioremap(r->start, resource_size(r));
-	if (!s->port.membase) {
-		ret = -ENOMEM;
-		goto out_disable_clk;
-	}
 	s->port.ops = &mxs_auart_ops;
 	s->port.iotype = UPIO_MEM;
 	s->port.fifosize = MXS_AUART_FIFO_SIZE;
@@ -1622,21 +1599,21 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto out_iounmap;
+		goto out_disable_clk;
 	}
 
 	s->port.irq = irq;
 	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
 			       dev_name(&pdev->dev), s);
 	if (ret)
-		goto out_iounmap;
+		goto out_disable_clk;
 
 	platform_set_drvdata(pdev, s);
 
 	ret = mxs_auart_init_gpios(s, &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize GPIOs.\n");
-		goto out_iounmap;
+		goto out_disable_clk;
 	}
 
 	/*
@@ -1644,7 +1621,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	 */
 	ret = mxs_auart_request_gpio_irq(s);
 	if (ret)
-		goto out_iounmap;
+		goto out_disable_clk;
 
 	auart_port[s->port.line] = s;
 
@@ -1667,11 +1644,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	return 0;
 
 out_free_qpio_irq:
-	mxs_auart_free_gpio_irq(s);
-	auart_port[pdev->id] = NULL;
-
-out_iounmap:
-	iounmap(s->port.membase);
+	auart_port[s->port.line] = NULL;
 
 out_disable_clk:
 	clk_disable_unprepare(s->clk);
@@ -1683,11 +1656,7 @@ static void mxs_auart_remove(struct platform_device *pdev)
 	struct mxs_auart_port *s = platform_get_drvdata(pdev);
 
 	uart_remove_one_port(&auart_driver, &s->port);
-	auart_port[pdev->id] = NULL;
-	mxs_auart_free_gpio_irq(s);
-	iounmap(s->port.membase);
-	if (is_asm9260_auart(s))
-		clk_disable_unprepare(s->clk);
+	auart_port[s->port.line] = NULL;
 }
 
 static struct platform_driver mxs_auart_driver = {
-- 
2.54.0


