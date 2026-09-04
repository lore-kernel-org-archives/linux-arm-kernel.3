Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA31DC79F87
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYNMh+wlYQbXqey/rgOB5yDcItmOFPFcTITbDauYbKE=; b=edYpZjj8HC6KUl203mXHiELfv/
	R61E6eBpDMHwjF2g0tw/sYpwsYkrPHiguRRWFlILt2DFEm7vj+5AsJaI3ildsA+7wyYjnPHNkG3r4
	aJgGpQrczKlkzCt5hYEac6sFJjWZEVLnIBpxNqm3G2LPNmAzOjIhIODTGn3kWQSVW1Y7ZcfMoi5HZ
	5KzBAza48olpuzKgpC6DDs7/FhXvBLwpdl9lEwg0sF6YDNcWuTtQAJxgPrT3HlPWgKJjyU+p+Idh6
	px1h6L/E4Yu39338jc5ANFaCa/gAgXPQjwWIcoFxqf2crY8oXLi9ClEvgAP2ZJlowXxa2f0NJMli9
	gy7vnCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WZo-00000002gf6-0GSz;
	Fri, 04 Sep 2026 16:15:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WZh-00000002gci-1zib
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:15:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 16ED64E41511
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 16:15:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA2B36057F;
	Fri,  4 Sep 2026 16:15:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C09211C78767;
	Fri,  4 Sep 2026 18:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788538526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SYNMh+wlYQbXqey/rgOB5yDcItmOFPFcTITbDauYbKE=;
	b=IAl74W7ImszHKs0rHmLq7TC01B3a+fipQqD9OUxGgAnar6XLleRvLssoJa/mjAme5IvCUg
	fz4n1vWwsLgHlEbXwZkqPlxG2nfPVcoC5Qq6hS4hvzn61FID2DVqso+cNUKTx7WQgR5/Pj
	wyNBOXVQLrby+Azn+5uvOAdJUYWFbQGtXs4fR9YfK/BRlBGO771PasLZarWIyvWIfqtpqp
	4KbSza2273Afyy8XYuHkRqYsHFywo6n+TQQIa7OkNJ/auftcZ92cgvYoL+m0RMxsIO+ob3
	oJ5AAhX3nzcfiDQIxlnz1h/6+r18+80n3l4eeL0F2ocVyUowS8QOxFO1xn0THA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 18:15:11 +0200
Subject: [PATCH 2/2] spi: ma35d1-qspi: Allow DTR operations with the
 regular SPI API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-perso-ma35d1-master-v1-2-b6936e8c6fa1@bootlin.com>
References: <20260904-perso-ma35d1-master-v1-0-b6936e8c6fa1@bootlin.com>
In-Reply-To: <20260904-perso-ma35d1-master-v1-0-b6936e8c6fa1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_091535_257814_E2B90D57 
X-CRM114-Status: UNSURE (   9.23  )
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

The feature was implemented but not actually enabled for regular SPI
operations (as opposed to spi-mem operations). Make sure the missing
capability is actually set.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/09c3928f-4b58-4ac6-8e1a-84dfe3ff6b92@sirena.org.uk/
Fixes: 15e9362f6190 ("spi: ma35d1-qspi: Add DTR support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 7f938d0c6f1f..ee3427640f3a 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -645,6 +645,7 @@ static int nuvoton_qspi_probe(struct platform_device *pdev)
 	ctlr->max_message_size = nuvoton_qspi_max_message_size;
 	ctlr->mem_ops = &nuvoton_qspi_mem_ops;
 	ctlr->mem_caps = &nuvoton_qspi_mem_caps;
+	ctlr->dtr_caps = true;
 	ctlr->set_cs = nuvoton_qspi_set_cs;
 	ctlr->transfer_one = nuvoton_qspi_transfer_one;
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);

-- 
2.54.0


