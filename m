Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8D7CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5BNZy3cOchIj+q1A6RzriXn+laI7zcTUz8KY5bkQWA=; b=hHZBpsoymA291I8EJlIUM+EF9a
	qHqSooFiItwf/HkRdH3RMRY+kLX7pZIzFbWToDFPiN3NLAAsnneMqf1ANfAIdtVTWkyxzokBnpU5O
	p2qhESn3Z64fvQI/MXtBEw2zg+tia0Qk9ytaiHY2JshZleyANdfNs9WNQTOyb9JCOTbnG2WO9xSsz
	n0K9uZPngiaXq7Obel6CJPyZVuHo2IEKisxby2/Yl4dIn9MvkEJ0DRmnmQ0KNFRTUYKc7dZ0hlPiK
	LYHmclhBouyGZFuAhXX5NSAj2oZdg+3O9u84Mr+GpydBLf1Glp26JXpdlsgeMYCN7FGKTnoPa5njt
	KTmI/nQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG61-000000094sL-2zzS;
	Thu, 01 Oct 2026 12:41:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG5u-000000094mM-0Mx3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:41:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 416FA447F5;
	Thu,  1 Oct 2026 12:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E960CC4AF15;
	Thu,  1 Oct 2026 12:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790858461;
	bh=LuLtqROKn6v/5SnLPl2pLsf8PEM9ZZqa2Vqie0OeXL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Yz84WtxF78PvN5z7FXTlu8th8yS/gS80c+41pkk3dPMgAUEFMUF9WvX//pHiPWl2o
	 dMKC+Z/r50ZKxJC8cWvkMhntnK9YlLvV8iHXR8F1czgynv2i514kmodFIZByxvLoYg
	 cG+yp0Jt1PGl3n3aOcJT7iPvejAutLWkc8Cj0tKea+W6evLP9yyURLDFaypvpyvhbs
	 fFd6JS3uXcqHHRwwXzIJL6Gd88+ZClxhfmiALYKojcUCCCPryr5LJzjA/Sv5PNmKIZ
	 OZNfGrduAvYK7P57+7Mf48bbQRBFSTnz5ocB7YOMsBJo36X7UJ/vM5pbJM9R5zCfmm
	 EyDgO7GDngTfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D039FCA5FD2;
	Thu,  1 Oct 2026 12:41:00 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 01 Oct 2026 20:40:58 +0800
Subject: [PATCH v9 09/15] gpio: pl061: use IRQ_TYPE_LEVEL_MASK and
 IRQ_TYPE_EDGE_BOTH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-cv75-v5-v9-9-486cc289a4b8@ambarella.com>
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
In-Reply-To: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Long Zhao <zl020895@163.com>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858457; l=1367;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=U1oCsZKXHVZucP03LrQEhXlOSCt4fTuqBZIwSw3whzE=;
 b=oISmmqpKlMHmBfYFuNu7aVod0hPkDafFoFPAccJZKcSf0O39lInAb+3XmP60uGUCD5bTh7Uy/
 R9+cRpsyABHCow/ECwU51tuSweEnUBwxd7m1aanD7hza/wMfkUym3P+
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Use the standard IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH helpers
instead of open-coded edge and level comparisons.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 66aea0856bc4..2913daf46aff 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -167,9 +167,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
 
-	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
-	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
-	{
+	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH)) {
 		dev_err(gc->parent,
 			"trying to configure line %d for both level and edge "
 			"detection, choose one!\n",
@@ -184,7 +182,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	regmap_read(pl061->regmap, GPIOIS, &gpiois);
 	regmap_read(pl061->regmap, GPIOIBE, &gpioibe);
 
-	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (trigger & IRQ_TYPE_LEVEL_MASK) {
 		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
 
 		/* Disable edge detection */

-- 
2.34.1



