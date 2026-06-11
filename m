Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5094CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 03:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7DIsV2yYkeuv0vuZTHMuiTm55rfBmU9E0/9cM1N8Eo=; b=omEdxStXdaldqTw5wioCcc2qsu
	Hor5pbZPg8SwUAcgl4KZ2m5IzFyjfzcaZZWrKZJaMX0b8uJqpzI9ezIsnp1OJyscW1gbdjcVHTbbk
	ipcig+z1KtZb1rp3ARIzUKb9bTi8Rw7IZ6H8Xale+ZlWzsfBVbaZ5OmX5VteAD3l82zmEuZoDK2Eo
	Nden131DjzwkXZvpS+DYykalg+iahGkeL3+c1QRA0AFRgLqoJQ6OSGaJVLXSk2YGxjE8wEfA164RO
	vKT1c4egL28wQjChOBvQ81+xSMxcxbWST1oiXNa84FnEh57G149R5GK5jKmUK7oCFXU7KEsZT0EbA
	Ap49Mi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGG-00000008cjE-3qS3;
	Thu, 11 Jun 2026 03:39:20 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGD-00000008chV-2JuU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 03:39:18 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c8583b8fd89so4554425a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 20:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149156; x=1781753956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7DIsV2yYkeuv0vuZTHMuiTm55rfBmU9E0/9cM1N8Eo=;
        b=J950dlV5X+dftYDF7+0uemM4FKit5ubhIjkcA+5v5Y2EaqzoKrARA6ZCUbwn0/LM1v
         0VY49MIRN/3hJo8L+JyWhASrfYhHn6PjWIUUplDgd9CdzAFzbSPEHzSHGx1aApa34FTw
         0BUHQ6tzenKoCQuDmULI86OJgatT0Vq2+uGqERalFH2+iNLrLnxVQFkmAagDSFtNGS8A
         /5sNM2J8ZuUsv1+RtAMtlvJ4rACP1obC5082LyYAnjK1e1mQz9s4VQDK4AJiZvuQRthc
         aCNPLMRf4zes8Fi8+QOFTCGnvLctHfJd/8yM+tDmQdw8mLek/pkAwOoOqxHtMmQuLtCM
         JbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149156; x=1781753956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m7DIsV2yYkeuv0vuZTHMuiTm55rfBmU9E0/9cM1N8Eo=;
        b=BeOJ2owd4Mx2+Ss4OjLQ4emxcWPkUkWmLc4EggarZysT2Y3FDRhOETYOtfKZ1crbuq
         6eLRHnWYjkNs3KrC/D88EgDSbt4bUmt7OTpjtsAqPuqKIW+rXqT5Nl4frtWBI6fW+APt
         2Oqw998KYaf2mF7Q3vkkMpV03uWrtrnuHP0QbQVIIuAr5bVr+vxXTvmvEisryPpMI2dO
         PqSsbFc1vwsPh+HdvH9L3dsHuSkwpGz+gKv1WW4tiKPty1/zWNSgFFgjhz4+A9S415WU
         0eyrxTgNOTUu0ei02YypNfypMXCeSw5lP1Zim9Yr9ZRYHoRGL2kUBs6cvSvU5h/rubW1
         hYzg==
X-Forwarded-Encrypted: i=1; AFNElJ+dlhCAJiHtJH3npXAsxU26Eg/hZBLIb+CFbb3uWQzsUEJeIVbWsbxl5R/P+2ZMThTDNeX8fDSZrpnh/qu5DyFk@lists.infradead.org
X-Gm-Message-State: AOJu0YwfpL3Yo6XBShu/Sp3s8W06a8/6ShEZDGY/3yTajvRSoq0wE/Th
	GxfYsEhMZQUZsfRWeOFT5IY6b1tBNMnq/jZZfK0IC+hlU8iHkEWwZtxb
X-Gm-Gg: Acq92OHirYIdB1xiFnAkxuIyeLQxDssE6wX+Om5NRNOC9gRMZOHx+ut+JIKyxKyZVBu
	F3n8pIMSStIkq0bGRwe6gKmkn7icmiT/hMosLjZp4nDyF9c99oLNElGdFgdMR7A6HEz6h/sAabW
	N+nNa/q85YS7UyY8zCN/M8wkbBIJJqNGDda3rTLDxozvcM1dmjOiZFsgniyF+IScLnrp5o1ylU2
	c6q/sNSLi7wgBVvB6ImsK7zEE906vmcKaPCOAm65m8x4qObZ6VIwsxG6sklwVPpTWapSRS4Yml/
	f3fc+EBidxdaWF73alWOy00w3O0utNvouPht3BBQXrmzBFbDef/Ynb1vKpf3p9uNrAFk4kbAWPa
	gqkC2uxP2rGvQ6patiAab5hCm+Hj8va+WPFE3vzSrOrToRVlcu+YznoDCFc3XLj+n6yCAGFo9uH
	eI9A70j58iiZpFkTAOfOymRe7fOgA5oElOxzgaxNfm4gAxD9eBuBt2AVXwoapgTtgex8UNV3zsr
	tlVNRwutcDBY0aT8VuWBH9tiTtV0LyMiVFjR1twaAGjFQ==
X-Received: by 2002:a05:6a00:1d90:b0:841:58b0:82bb with SMTP id d2e1a72fcca58-843367c711bmr978126b3a.9.1781149156549;
        Wed, 10 Jun 2026 20:39:16 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:16 -0700 (PDT)
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
Subject: [PATCHv3 2/6] serial: mxs-auart: rework clock handling in mxs_get_clks and probe
Date: Wed, 10 Jun 2026 20:38:52 -0700
Message-ID: <20260611033856.6476-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203917_592323_75ABD583 
X-CRM114-Status: GOOD (  16.84  )
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


