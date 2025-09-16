Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD737CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKZgQ3O498oMK8jiK/K+0WgAQqJ+YKdnw8CFtwa+U50=; b=L2803ywJIolrPpKFbYjr5LMp+h
	364iTdnG5H6AgZaAbB+xfeLyHpA0SoifwDzi5uGzDUsK3G/dHEBK2Gj7NvxDnR/crWfrimrt8MKYU
	PG1mI5+ERxH1j+Mp90+43rxGXWdTH0lpoQGHXGeOxSYVg+e3SlClk+V/tQ5lHdfDaLpDAeQBSySgJ
	rCOW2pKBc8a9bYq0tWmYOZGnx3YduF78jWh2tedMDIyRlVgATtZ0njUdu1dZ5NdumYfKSaiwfQX6T
	Su/9hMzDNT3M/85UvtMNBe0sYCU3isLCINJo1zZQENv5gxKy5YhuRNQ7um27V34b2hD87XxSci03J
	HhLQNqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFR-000000091Jo-484a;
	Tue, 16 Sep 2025 20:25:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEz-000000090mq-1DCQ;
	Tue, 16 Sep 2025 20:25:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5623544DB2;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06C12C4CEFF;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054326;
	bh=4w6w5DvzwFyRo2J5VW1szw6dNb6N2JHLDo922TOLKcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ma/CpcuBYVrPPjn8B5wDIMdK5MXsxC8Lgs9ueMxl7S9NVceWGjbSNc7QoFAQv10rw
	 ur8thkyVEuWGBCwwlKeyC5KZgjl9wxNhj3R6IwTEvmVNsQZyNMyoU8MQZmRpPCksfw
	 u05SWxcjEx103cFljCepFq6Kvns6i73kSrEQ3jWll+9HbQOi99pXQOCatoK5wv1uI2
	 O9m/FAv5Fbzdw36thgv1deL2EunYU468a9Aoqyj3a+vDSTZOqGF7BayMtXkucCkP4o
	 fKED/ROmSfgdNe/+KuXzbSxjjUCmBMUByFUbEtRoX8gYqQxoH06n2UWVySlp2i9PnT
	 OvlQZq5LjZY2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FA4CAC5A0;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:14 +0700
Subject: [PATCH 17/25] drivers: gpio: rda: Make direction register
 unreadable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-17-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=890;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=Ej4sfxzJ/Gsg0f6d9t0Id5MGonhTVkngeFDG/IpOGqc=;
 b=7/dQ+zSEH7UofRPjo+bKlBs6ViTT+WuJvSx4Gecx+bo6BYwM3Re5lMQKArpXET7WxhoCPOvfe
 Rk52QJ6IW9cA55W805ijHTkhu0687ofj0g1SAA1xQxJl5AhXuzcWLTL
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132529_523619_BFAE9794 
X-CRM114-Status: GOOD (  11.39  )
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

The register doesn't like to be read, this causes the SD Card
Card Detect GPIO to misbehaves in the OS.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 drivers/gpio/gpio-rda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index b4db8553a2371ae407fdb7e681d0f82c4d9f74b7..56aaa9f33d29469dfb1bf86ed7b63c54b413c89c 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -245,7 +245,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 		.clr = rda_gpio->base + RDA_GPIO_CLR,
 		.dirout = rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
 		.dirin = rda_gpio->base + RDA_GPIO_OEN_SET_IN,
-		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+		.flags = BGPIOF_READ_OUTPUT_REG_SET | BGPIOF_UNREADABLE_REG_DIR,
 	};
 
 	ret = gpio_generic_chip_init(&rda_gpio->chip, &config);

-- 
2.51.0



