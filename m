Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05ACCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 18:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y08FxHfY7Xuz5yzBq1LBc71S9ItO79pb/vbfHtfZFok=; b=qplowaZDWm25Y3rw9PZA5+qKWZ
	Z+0FHq3ABKTeXom3bUwkpmDXpMtpoVhzosXKFoZyGvbLAVkmtV0Nsn7hl5XCJJHvP+WAZUvF4axex
	DaJMRrKD6ziK9UBlBISUpW+4NZ6bj2FK3R1XJumerXTNx8wiHYXnEHOLO+R5J0LRF2TTLoAUrkxxC
	+YdL50e4ddrdcazWVblZmrnci5UMxghfxCWz90/qoxKwxdzFx056dlobzImC2Y3fXCo5wvXEWFH4W
	k7MDziwxts3JGOVVux5tuPHKbPHcza/4akgbASrbpYRtj6CyE8Z6Bv57Kn89lRo0W2znQDOKRQ/ke
	lZeZaaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJhp-00000000umL-0bTX;
	Thu, 18 Sep 2025 18:50:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJhf-00000000ufC-25Le;
	Thu, 18 Sep 2025 18:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A11D56026E;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B556C116B1;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221398;
	bh=0toEdpgdrAHwzWBocpkLTIinw0pb9FWHXvtuM2MoRow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mXTa/7ZTSyoRUPq0LQumllP2bsy6xtHw59fnlRGrCpAMMrQy4Uls6SEbrDebF3128
	 YpCJ1745BR8ndtD5NrHPFLqZD56yFrg463l+6bPD7F3ty+ZC8Q9ei3PjQkEVxD8KEd
	 yZ7nhF7sgZ3vLyKHqeXo0DuVFBEh+NUdy4XZ4BxklfDLOhcSlJz3e4twocACzX0PCN
	 wcim4j1KWKTIqVnbKUuUz65L7FokbPceYxlodBk66B0/LiHvtNCdsfluXDHoXXUJGl
	 +DkO1/0KzhaBKatU7mmbBoW21zDgo3tPmXfjRsR2y6xhXodHQji0MdbqW01qnlIV7Y
	 NMAB2bTu2PQQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1E0CAC5A7;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Fri, 19 Sep 2025 01:48:46 +0700
Subject: [PATCH 06/10] gpio: rda: Make direction register unreadable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-rda8810pl-mmc-v1-6-d4f08a05ba4d@mainlining.org>
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
In-Reply-To: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758221395; l=985;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=VMMKg4HONUFRzO6+25FovvsxOlucUttBjgwEeb3Ns7Q=;
 b=iAakQHayFHGXZ7IKRgsLgfpt3RDZjxa0+TASp4ZeKYUKatPRehTsYyn/QN0h83ue75flIlEEa
 Z292tJSmrBCA/7rCRSbbK0qIuX2/EJRrE+U7wNAYUXGkbpIODs8+5p8
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
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

The register doesn't like to be read and would cause all the input
to be switched to output.

This causes the SD Card Detect GPIO to misbehaves in the OS and/or
may cause hardware to malfunction.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 drivers/gpio/gpio-rda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index 7d20dbbb6ec41149a1dbf4d9ef9ac86449773c35..ae2efa22755986b5445fdb8d4f004d595c189590 100644
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



