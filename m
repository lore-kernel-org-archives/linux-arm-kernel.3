Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C5CCAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MfrKbQAcxo1P+UMUl3T75e+IPr/PFabDA6Xht/wT2k=; b=tuddR1YUSTJkJgxiSFv7Xfq3Wa
	v1RHponVvUq8s7KMma2rqFOBzY1vSPi3XvMhfvohjNqE2mLkaVbMHVj4uoZYg0nIQyx+ZzJ8gN9Fl
	ZWwJsiC1L/xHV/gtU1YOQUbnpevHIFIq4yHSwyOO+Hw9vx+HArM0WtjYrFIBiFKiHMbpusNfo9BTw
	HXWhYDKR4wNmYlyKSdBm5d1R1mfvgCypV4gzuPuGLAZTb3Z3hBHbxVKQzmpV9Ki0lEDPRflzE6zK+
	zyQYWwue5UagD3bGP/oZk10+5XQD+R0NihCnmQKZi8D0CdTCDOkhjPJv4MXlyZj3nLlQ+CUAPHAIu
	nv1HaHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc4X-00000008zcp-0Qh0;
	Tue, 16 Sep 2025 20:14:41 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc4U-00000008zc4-2Lhe;
	Tue, 16 Sep 2025 20:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053288; bh=/MfrKbQAcxo1P+UMUl3T75e
	+IPr/PFabDA6Xht/wT2k=; b=VJhHzR1HV/j+Qma4wsjArLbf21+pHVb08dOcDiqw8LpAPh3DW7
	Aob2lXQ04vwOeHD9V5oMflVdOkNpaV1THNjwFADz0LSc79WBQwqQsmFN5hyd27ms9lHDL/2TtF7
	uOkGOXvYvSezBsX15BsztxtlYbXSwGju2lk2LE1/07mpsIN6FVry7UYGPtPZf7oPZDCBhJ9FdIg
	c4HBuFNwkfNSZlSJZ/0BGGIbinJV2HXNvEKKgQCi+8824Lxc0RLiaa/Ajw59+MzzlLQAWFlL4jT
	B/nIQ2+i3gMyag9SMjMw10NW/5FNfZ0xzMbOxte4/9NnER1yZS7471JRO3R4izUDu5A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053288; bh=/MfrKbQAcxo1P+UMUl3T75e
	+IPr/PFabDA6Xht/wT2k=; b=lrjMieh9dKOkoNobhZqp7S+144r6DdCdWyAK9MOlkepG/rYvIZ
	q8YOhzqs8AP/NmjvkxP7ydLOAuIGOChsDdAA==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Wed, 17 Sep 2025 03:07:19 +0700
Subject: [PATCH 02/25] drivers: gpio: rda: Make IRQ optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-2-74866def1fe3@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_131438_743488_6221BD9F 
X-CRM114-Status: GOOD (  10.47  )
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

Not all GPIO have IRQ. When we use this driver with
GPIOC (handled by modem) we get:

rda-gpio 11a08000.gpioc: error -ENXIO: IRQ index 0 not found

Let's mark IRQ as optional so this error doesn't show up.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 drivers/gpio/gpio-rda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index bcd85a2237a532b875df9470d972ac88b95a91cc..b4db8553a2371ae407fdb7e681d0f82c4d9f74b7 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -229,7 +229,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 	 * RDA8810PL, GPIOC doesn't support interrupt. So we must handle
 	 * those also.
 	 */
-	rda_gpio->irq = platform_get_irq(pdev, 0);
+	rda_gpio->irq = platform_get_irq_optional(pdev, 0);
 
 	rda_gpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rda_gpio->base))

-- 
2.51.0

