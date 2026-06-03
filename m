Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AA4CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Jhe81GLnFMt2SFFisrAqvCgJB0UsWbau4qiCW8JuqQ=; b=uDGgG4btlEEohOsoZ0XK2ZEizN
	D4PYGSra/Wf0TY8dJ7b/v3ya5MfWmsCTPM7pLaePvYHQVuysx/kLXpHdBAcxXBfV462+uFEBxWW0C
	4z6HGRk0clO40tyHtVgXAOJmIHNxDPbzJwwCmwLv2FoLUQj44yfU1BtESaLl+9O9NRVG+EeeTmqVr
	BlxYMxmAsgAritvkmP0aB0Vs6JU/C8dBZjReeG4XEGMNd1CR7NoRvrrFrUWZ6mD/QsBj5HKdt8wvZ
	/iPHg8nwoZhYAxdey6SPgqeHnM7rGgiJugfwY+ClLCuKf4CFXmgAUr9gMPBI1cgW948G/sr3cPpY0
	WTSnZEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZuu-0000000E0qY-1pIN;
	Wed, 03 Jun 2026 00:57:08 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZur-0000000E0pl-1mqG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 00:57:06 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-5174a3a025aso32384561cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 17:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780448224; x=1781053024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jhe81GLnFMt2SFFisrAqvCgJB0UsWbau4qiCW8JuqQ=;
        b=aOYQm1CE/4EBA2cGIDqDNDdeEYs9B2yrc7L24AtjNtgBjGaoNr5ukUeZFpVVwNNzPW
         siaHSgsg72wkD8RnvIZeqw2ltW1IYluRQPwm9J68L8Wsysq6VcFDkWHYa6X281f37WUi
         gL1TVdNXQ+3wCrjTamTvOIng9FIq1H8otbxFhOAghammxevOHjlJPW0zTaL9oTUMI3Z5
         Gk1chlkVNMeYgOwBGT0tq6k4x3EWCDOx/F5J4AuTomAyJq9tAJi/ZuDvQfqpNJnqR4KJ
         67fHxElLZDs2D7lt6JKE19ajdHmcEYkPuRby2ZidiUTbgf2pAACc7CsuayjTbBdnYB6j
         D9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448224; x=1781053024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Jhe81GLnFMt2SFFisrAqvCgJB0UsWbau4qiCW8JuqQ=;
        b=Pn+TVpVzKoTZAZTTvpR7+xUUMcmRxTUFJ6XkawtRX1yyZElrCwgP44nFx5zEC4ZWNb
         GtKZBeKUu6Pdz6R+vYKJo2i5sylHHT03qCRc515KSMJ5aaGZ91ynJjAZ6FyXn2b4auG/
         GkzHSKN+lmGWNzXtegkChlZ43OA1nWP+ft817OviH1jJ42cz/j65fOVHgDoJwVojdRv0
         Z2gmoHxtK8pcrh0K4nuTxFeTXUuGp3+seDofL7FyhtihnI2wSBHg7h/J91YxIFQlgZ0n
         bDHtOul53RwJINLpNWEXXJfCplixhXg5/iiax8GELiX7yhDgTau1faB7plpVuFj/aZ5n
         eGeA==
X-Forwarded-Encrypted: i=1; AFNElJ8gLE4SPsF5TctJvmnvFw9aRuBPboqpvKLazF/vsafFRTzuz1kZ+iAScXg9SNCDfHrhyhoUE1hReYYaQUVdZCg4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt2IYSYQAY/f8Pm1fjZoKbN8QXIguNC7W8zn5rgZKSHhG/oHL6
	wbCIJFAxUs3fZDFnYiL+DOh0VnNCtpt12Q4deYyBdgIyBLOLAl8dhw36
X-Gm-Gg: Acq92OF3cRXw6Axm7daSDZfuGLipSIyfnHvUNYpVm7R2jiyHOWRS/CvlPphPBN2sgW3
	lTac2oX0Y1VG331Glyektc3LaFyGTZPH6AeiGuk44X+eBgODgc9todpuNkr+U6Pfpy0k3E3osWS
	RjCQR63JlEtkDkQg1fbfK2NcGMrSEmzDs8+UQTOIoA4E3PyaTRIQ4H1Mu71tIeNri0KZnXZBxBv
	wGKVc720SVEVftcfMc+mKO3Py/kMLtHrs5vDYRqacAAxREogHJLM6W3yti8oljiBudPDAUthEeQ
	rDQxQDXxIORR3pOfNqeJLHSGAtvFGyHIHFIHjdTDX0kV0hU2/IzbJDDVxg5bQOP3+mkwWMvgiR7
	r0RuLNnEequMA4PcjMnpFtEAmHA+YJtc1ewIpTz8sg0WoyuyTLBufJ8Eqrqn+2Q5GgY/LYgshwz
	2/EXRYXDgHKOoqQJOIo/eDvVFanQdHFrnpU6qpiWNabScvGTV35+dw7dlaSm8PbkEZAYqH2m2F+
	xAgxWUBoepm7UtsGHFq6X5qRULpxQBjbCWLXqprMx2lPQ==
X-Received: by 2002:a05:622a:4114:b0:517:642c:8196 with SMTP id d75a77b69052e-517785921eemr24993891cf.12.1780448224112;
        Tue, 02 Jun 2026 17:57:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c297a8sm12121051cf.8.2026.06.02.17.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 17:57:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openbmc@lists.ozlabs.org (moderated list:ARM/ASPEED I2C DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: aspeed: Simplify resource mapping and IRQ retrieval
Date: Tue,  2 Jun 2026 17:56:45 -0700
Message-ID: <20260603005645.227239-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_175705_474611_B5D5638A 
X-CRM114-Status: GOOD (  12.35  )
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

Simplify resource mapping by using devm_platform_ioremap_resource()
instead of the longer devm_platform_get_and_ioremap_resource() helper
as the last argument is NULL.

Additionally, use platform_get_irq() to retrieve the interrupt
instead of irq_of_parse_and_map() and propagate its error code on
failure.

Assisted-by: Antigravity:Gemini-3.5-Flash
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index a26b74c71206..f3c28c7c547d 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1006,7 +1006,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	if (!bus)
 		return -ENOMEM;
 
-	bus->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	bus->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bus->base))
 		return PTR_ERR(bus->base);
 
@@ -1064,7 +1064,10 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	ret = devm_request_irq(&pdev->dev, irq, aspeed_i2c_bus_irq,
 			       0, dev_name(&pdev->dev), bus);
 	if (ret < 0)
-- 
2.54.0


