Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339E1CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 18:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDz3DzLUQQ5mcKqF07wL/URCSyIZHPc7fvM4+8qhAUA=; b=w+YHcJtJZsVdU+WB3IfB7hIr/S
	X3LhdAUQIEzsatCjMwoDHW0bFl++TZxxk34avMpbZxMb/JFw/t6Xl7/ZnJgPICAXSMsTWymSMkp2G
	90bTGZH/odQCnyvbYBAA9mtl+Hmb52E+SDh5O280ysvKzDPeWMcCOPZLavF5CPVXvEXACfGbAqxKe
	cODXH/FZ22dxfI4apXY7jgYtd1M3NAhrLgtQv/JEN7g18Cg6YywCe/k5f6jRW5zAB+5h9lv92EwPS
	TIOYHasPZNt1XHfro0mgPfS9rT2nHG7uwyJqYFxHZsckxff04ST10eVYjNiA5E8NRLufvGCb92bil
	cfbIIq/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJi4-00000000uxW-1PBp;
	Thu, 18 Sep 2025 18:50:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJhf-00000000uey-1Aac;
	Thu, 18 Sep 2025 18:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77DCC44CF6;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26CE1C19422;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221398;
	bh=xFZzw0dxkId4PpzWi4rCIk0ujR41JrlCk231RXGFPjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YauvTm6aF85Rf2LnVgDHgqBJ8NYqPiAc/R+nTvtZFu0rxjVNHIazKwd5d3gGv0cu4
	 7Bi8nThF/VZmTZfDKJJIYIG9okGui02mQ0GcDfIfTOdThWAFVzo8Lbwlt+ozcGAAYi
	 J8ToHTT2PE9TwbTX441/VaxVY77yVY7FuvL3W9ZmkuxsJ2W3otNn6r1ilyvWs3KC4S
	 Bn1AfAPGFmI6cHEE35u2F07KP/320MoekbWNfiSXgCNj/QMb4QQk0dgJul6Uwf1Hxz
	 6RP5FBz05/3Eijz1AEtGowJys/7ZaEz4qSJI+qwOG7Cw2avpsAqSjMEFA5OAuzvAV0
	 AYl3fLnfSG6PQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E980CAC5A9;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Fri, 19 Sep 2025 01:48:45 +0700
Subject: [PATCH 05/10] gpio: rda: Make IRQ optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-rda8810pl-mmc-v1-5-d4f08a05ba4d@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758221395; l=961;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=MpdOunzwRix8r+I6dz4W5XzomAmmpf9+SZqztmWlQWc=;
 b=gcu6tm5gzmZ+ZMKsRV7i/uxjKVCVaCUgL333lVwfm3e0f8wM4biBdYwyH2e1IKu/7nMS5khcs
 Tc0z4jijgshB0EsAQMfMy7L+Jji9rFMHcG7B3mt7gpRIFlwxVXF0BM1
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_114959_361448_F9E7C747 
X-CRM114-Status: GOOD (  11.53  )
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
index fb479d13eb01a49218ad4229e7d4f70f096f5a2e..7d20dbbb6ec41149a1dbf4d9ef9ac86449773c35 100644
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



