Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603C2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=; b=iE8/R4mEXXz3oYRJtas7lgY6/4
	11NTnxfRx9hVyLJRBrMPOVq9bYDxGqRlmzm/Iko7v88E+Fn2aDZUkD987Lt877s9UctS6VRWCA2f4
	EE9qke47oNXQIh2TLrih9a8WWCXQhstGu+CPbeleBTsdYJzUA1jb/CUtjxxy1nN/ThfRPIEBqctBy
	5rXEX7pbkiO2UjOGMBaBJlzw6Nflh9C+hZYda/JInpxlYzG0OUI2ctN9lRCLNTUynhdH6jjKikTLp
	Ltt6adf0Z6h6ODZqkqEn9gt+07RrNwHFL02XIxKITuphtjbooRjOA8OlDgh94HVrcltoxYeFoEM3f
	P83t7MVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQI2-0000000GzUB-48yB;
	Wed, 08 Jul 2026 11:18:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQHz-0000000GzQD-1Nd0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:18:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so5834385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 04:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509481; x=1784114281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=;
        b=DEK7+0hEK8b4uOWcWHLghNei18Aeq8zg/HCLeAnEoO98d5R4n5MzEUG8E6IFgHoxOy
         L1PTSmQ25Daiy4IytP8sX7OPjcnhb9H9fkD9BqdvshqbsOeexsq9dNoimNUsAa873Eiq
         4KkOMTp7OAqNQ25MXL7l+jAKLyAm0nyFp6Q0nxsf6VGPpMpjggHVVZxCe1nHNz/SeN98
         6W2eiR65Zt1fynJv1WuqhmX4J+qW5qiCsnR9NKGpqTnrLAWUtprN0KMXl0L8Bdo5ff1U
         l9/FQ1MoAObWEgHNwZLbAilLhOYagxaMytyfbxIL04uUyWYGxpdTXp6JajxRUpVQMVwm
         NYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509481; x=1784114281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9h4E8fzpkUKefQYXbM+5aTJxB/wkrGJJdLAlPHgwa7A=;
        b=cCsHwJ+eCxVW71oyGZdXMLZcQuJRvahV7e275hq6ah4BN0Y4AS6Fe4pc12NUNuA+zq
         GWF3m2/ZS4ZNH9JBv5VSJf6hpctbmxAVTIh4h8bw/WCnm+d3xfDMYo1D6zGSKQ+G3wZC
         eAuBy9l9/bbATd7K1fXSuhFYNAXxnkw+/8dAGVBC/wM8GrogwDainBW1JnnHhOz8Yhop
         DaI9q4pnhAuGkGlejrbwxlpq0tWY3EEz21k9BeJnRreIrnhKKoDX2JVofKJU95Er9bhQ
         pj2nwGifvVQWd27v+Cl+JBNtv/Ay0pKyPiGP/wTPV3FjA8y7HTvv1mZx3QZ36kix35AW
         RZ0A==
X-Forwarded-Encrypted: i=1; AHgh+RpwiRw0eIQPQgFl6e3vfuyH1bA18wWLGAuCtll4YURy85IndOAxQvWYnneWq8P4gmzAolQdDxab1u1nN9JWQlyW@lists.infradead.org
X-Gm-Message-State: AOJu0YzCrg7+IIGnIB5Bu+NVpxbB9vmtdX5jeOEnaFaiNjPlO0RYjZ7R
	t4U+L/ioJqF96A+KnEaLv3TxGvo1Ku/STp8yvOafgRGERYpq8i6nXFdIr/dPLzyyz1U=
X-Gm-Gg: AfdE7cmH6W9VJ25JeSJUzaIu5J8XqFvlGyXs41Hb2qvkXhrZ6XpxmjGROyRV7pe/Dkd
	XQ7/lBKBd6mcXrAacErOXr/67XzdcMA1j77TQSU85bqoH/qXni39N4dyH5HbHAnPOf7LYuqZBZA
	7xD8zuJmsmwSRuGhrMaHqJIcAdR6+nFqSd1eBlKCFNcxG2yNDuWfdvA3wUh0edwvMleDkWvMA7o
	NAgXiYfQrfIlFKEh36Yown8GJv9dNYX13eX2ihA03FnMjjooFJ0yNaAv1Jpf5z/xa3rfNMlj9xL
	rwJv7tfM5zeVVRQSmCVupZrda/tGazVcPfnodpWBaWtdXb0KyX/y5Da8A1gRD95gUBoZWXqEGzJ
	VBucHWKHoF4L5LQRKa7l9Nx2sYla5vlsfoHgp0l3hdonjmMHHrcvGAYBAVUK5Y0/QaxBtLTs5rf
	LxPizZMz/SkEvYwFNSBe4b+nNaekrlFv6Tf1f9y5b+T+Jkt0uBQzJNy6AJgidMiF3j6qLwBhiPr
	on7ad0OPPM2cWkTtA==
X-Received: by 2002:a05:600c:a55:b0:490:469c:556b with SMTP id 5b1f17b1804b1-493e68bef13mr21155325e9.12.1783509481596;
        Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa (host-79-16-115-126.retail.telecomitalia.it. [79.16.115.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm37867694f8f.31.2026.07.08.04.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Wed, 08 Jul 2026 13:17:41 +0200
Subject: [PATCH 2/2] serial: 8250_mtk: honor DT serial aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ccaione-genio-serial-aliases-v1-2-bf22229e9383@baylibre.com>
References: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
In-Reply-To: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041803_389069_C13F8E75 
X-CRM114-Status: GOOD (  16.57  )
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

The Genio board DTs provide serial aliases for all enabled UARTs, but
the MTK 8250 driver still registered every port with the default line
number. If uart0 deferred and another UART probed first, the 8250 core
could still assign ttyS0 to the wrong port despite the DT aliases.

Read the serial alias during OF probe and seed uart.port.line before
registering the port so the 8250 core reserves the requested ttyS slot.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index e6a56cf54ae0..841d64f6a707 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
@@ -521,7 +522,7 @@ static int mtk8250_probe(struct platform_device *pdev)
 	struct uart_8250_port uart = {};
 	struct mtk8250_data *data;
 	struct resource *regs;
-	int irq, err;
+	int irq, err, line;
 	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 
 	irq = platform_get_irq(pdev, 0);
@@ -575,6 +576,10 @@ static int mtk8250_probe(struct platform_device *pdev)
 #endif
 
 	if (is_of_node(fwnode)) {
+		line = of_alias_get_id(pdev->dev.of_node, "serial");
+		if (line >= 0)
+			uart.port.line = line;
+
 		/* Disable Rate Fix function */
 		writel(0x0, uart.port.membase +
 			(MTK_UART_RATE_FIX << uart.port.regshift));

-- 
2.55.0


