Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3A8CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 05:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWdXLvFu30yYvjltQxnE0pJ9kE3gyhS9Vq00c5VUKSU=; b=ZU+e2sjZUTByCrUluz/t1YYr51
	EPCHE6jiAEgTxnETLKUblrbHKWrVBDVHNkTTVo3ehnc25BPYi6Ti3lPI4KCoqfP/KsEvld+PKPksQ
	G7b/LF8ttYD+R8MH03hQ9qLPYiUbmekyExDe5RYn8h/dVCJr/lPO9cKWMh8GFe8JznlNOcyVYpFUk
	MdOddOD2IYMbPyIKZy25w7T5q/BhScNWjXtwiHxBg9qiX/LLcANCrXf386Iis/NHx6VX7vIUGpeYD
	89QAj9gm/IXRetL3CqIEgnCPd1x2POWNNNbjEm60cEWgX/zXg5YEeiX1t9LGKvQNDI2O4P6UgVf5x
	/Zw21rAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2N3D-00000007BNY-0qng;
	Sat, 27 Sep 2025 05:00:51 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2N3A-00000007BMx-0kUA;
	Sat, 27 Sep 2025 05:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949156; bh=DWdXLvFu30yYvjltQxnE0pJ
	9kE3gyhS9Vq00c5VUKSU=; b=squFCJkGPyKQGu2syC4oXR3X0o5JP4wYYRdGY8WjUIK+wLQu5a
	b2fDD1QFZ1UMC2A18BjynkKrUh1VdG2Uo07QwUkW0zRQ/eHIQ+Z47jI3Z++HfY10XadHQB6NYwP
	FljSqk8MomKME7YYPOhPofg1XCr/dRVKhB3mUnj99OLU2KSuhO5qWlR6KoUoJmP3RGR3AkeSRMr
	ekDrI0/3urVjcj2PeMU0EC9lqybN2FNx7zLqpXdCP2QVLEhGIQ0donb3xfWP3B1t9KasZoP/8b1
	x/NjqhabtuVcDNEYAtUDZIDQ3krNmLZqXvVwFcUuKCrifvLnvaFOfhS5lluSO6ldE6A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949156; bh=DWdXLvFu30yYvjltQxnE0pJ
	9kE3gyhS9Vq00c5VUKSU=; b=xE6S+r2yuMtthxGPUz48JuxFTe3Lc6QqhYjub/HRYdMGg7pIoT
	Z2aTXtfPzEkPlgL7L0TD03lIbCv30yTGuGBA==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Sat, 27 Sep 2025 11:59:07 +0700
Subject: [PATCH v3 2/3] gpio: rda: Make IRQ optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-rda8810pl-gpio-fix-v3-2-3641cdcf6c1e@mainlining.org>
References: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
In-Reply-To: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758949147; l=961;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=MpdOunzwRix8r+I6dz4W5XzomAmmpf9+SZqztmWlQWc=;
 b=FbBM848buke3ZFLTeEqaWSbtCt9iSjXfoKtgadZUBCbL0o6C85MggUTDyTusPlRHhTEWOI9Ub
 Ho0FsXs8vibAwBYtHPJGLAt7nm5TUJPRnjE5MKr3OpVE/Tvq+F9yrHj
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_220048_362392_1059E9E5 
X-CRM114-Status: UNSURE (   9.80  )
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

