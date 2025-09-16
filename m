Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EDBCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riQuTgx7iCbl5kxSQfHxl9RpnDS12lNUWQQGj+//LE8=; b=KMCe92lpIx5vf2zvwBq++ze79Z
	TuwOTMlb2v6UMQ7m2pqOIexSPJn4yXzo+erRrv8ImBSUybbqKilWD/F5TSSCVvqqjPQT7duh3/n/E
	14dFlbsTWmi69QbB/5thfUuxLOEjBH7lPzjS1MjybdeZIJ6SS7l6OBQ1a8zZxwA3apKPIrr7+jcL3
	FwZDJatwH2g/zNI8O4uk8RfC1xZmaqxugXYzr6+w/S7KQh4L2QfaviKSxbL+3nqefmV2JWtWpyoh7
	Q0siVj22mCt+dZR1BGhtjStisvgZmIK81do4wPX3ukwH8EETsncZjPCklo3lQtXrKPrt1QS7QoCBJ
	d7E8HTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycF8-000000090w7-06ge;
	Tue, 16 Sep 2025 20:25:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEv-000000090iI-42Hx;
	Tue, 16 Sep 2025 20:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 877A344D0F;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 125A4C4CEF0;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=X893mXdG5jDAoakU25w6AZ+PiFmR96PaE7s6Wnh4JEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XlVltMwPC7nNczwGoEIxDvOnbVd/T0P9HRB68TaGLfkQvRojcP444NbvGrx+Mmvc6
	 nut9J3OGDCfFVNbyFfSsZ5nbOlpjbdU8QlP4Tr1Uvljn6ija86f6oWLHr1lEGY9NJS
	 3gdGtPcKjCipIcxglJPeaLYXA36bDP8ICq1GQWxioMhUypE4ubq6DnlSzgSm5RpyJ7
	 YvbQkhArhH2IGsJ+jCGM4Bm34kk9lFkDWd+biHQQ8a9QeMp03jyGZn5WW+jg6ph2eM
	 oO+WD4aev9S2dRQxXSWq95nkmkeoyeGlNtuwjRm3ztPBEKWRL/7cmlDvWBLM1QBLkl
	 /FHvZPlMbaysQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017D1CAC59D;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:24:59 +0700
Subject: [PATCH 02/25] drivers: gpio: rda: Make IRQ optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-2-9ca9184ca977@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=961;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=Fax4H41w25n5u6GELyum7Uq2SVrab6rxKUOtQRQV09k=;
 b=8NPdXoYR6QMjpq7tWNquTNmGzt1Zr4mpACDx1zfor3wYw4pn/Zqu2jUfRZ99rq5r4TeUYxPub
 D4syMEvbMWWAYGlhGdETHjrWpszpet/JuedVRzqk5g7xv9O7nsvn0Hz
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132526_041373_167E276C 
X-CRM114-Status: GOOD (  11.97  )
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



