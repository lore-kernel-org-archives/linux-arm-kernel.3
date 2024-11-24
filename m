Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDE6E668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzfPt6Egg5AqKwls7dQJkZyzkHYdc7gRnqPIxJVtU5E=; b=wMIJonFWzdiHRI8jCSMFlehVtt
	ZpUNgHjmR8cV+5+qZstK9oxYxNeENPKUsCv043jvFTbns4Mu9YG0vbKUvdqbB7scqhX/WUwdQPjth
	qdRRuV6PXzrcOtQc9GXMvHTWPzET3APj6zJcwffhzq/qiLzNaIii7dIgnRLn3v4k1gA3mXjWOrx5Q
	Ze0Xosp11bZrAivSPhnHUWeyxIIMmmkNkr5K99wrhxl9on4R6OPxOmz4afMjEUOwcMIqx5D7lE1ho
	ZxF56TxeXHlojOf5XXp/hw+MXMFfx9+lPveivUie4ido3OV6XG+EsJqJDdm2yBTZFGJruwG7eJqJ5
	RpX2IzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCG0-00000005pcC-39Qv;
	Sun, 24 Nov 2024 13:02:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC85-00000005njS-4AWQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:54:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2BED5C2706;
	Sun, 24 Nov 2024 12:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE3DC4CED3;
	Sun, 24 Nov 2024 12:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452861;
	bh=+iVJvc2iy6AghupPTz3ENqEhMXX0RUkQdQFWdt+V3GQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rkMcjCP8+ngC/lEZ0T7qIFdhxmNRiqO/z5rcYfd+oZqzh6/lGFv7q21aIevF+re1h
	 eKmW6OPFcta+aboM7/PL4BYsWG2DpGw5sXOwHUFkCIxIC11ogJxvhviruUYGUwEc3x
	 rPgpPJ7jF9FwZq7zgTKaVfrshFagoV5qwsNfOL0hVf9lN1JCEpXnH8K1nMRvKsWNCN
	 QFTVV8k7BIG8Xw1XWP+OnvFc+UtZXrzOx7F2ckocgcoZ+484UpImmb2Nn2n1kRSgp3
	 4ZVxBlrNk4MCieFHkaq7HM9kaOFCnveghNSItQvCd24Ns8CIUsvv4hGcdXhOsMBTuv
	 3ooE2Av7yBh9g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 15/16] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
Date: Sun, 24 Nov 2024 07:52:33 -0500
Message-ID: <20241124125311.3340223-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125311.3340223-1-sashal@kernel.org>
References: <20241124125311.3340223-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_045422_082855_BFDC6DD8 
X-CRM114-Status: GOOD (  11.88  )
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 62d2a940f29e6aa5a1d844a90820ca6240a99b34 ]

Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20241104093609.156059-6-andriy.shevchenko@linux.intel.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 61424cfd2e1cb..f624b37e2e960 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2356,18 +2356,19 @@ static int pxa_udc_probe(struct platform_device *pdev)
 	struct pxa_udc *udc = &memory;
 	int retval = 0, gpio;
 	struct pxa2xx_udc_mach_info *mach = dev_get_platdata(&pdev->dev);
-	unsigned long gpio_flags;
 
 	if (mach) {
-		gpio_flags = mach->gpio_pullup_inverted ? GPIOF_ACTIVE_LOW : 0;
 		gpio = mach->gpio_pullup;
 		if (gpio_is_valid(gpio)) {
 			retval = devm_gpio_request_one(&pdev->dev, gpio,
-						       gpio_flags,
+						       GPIOF_OUT_INIT_LOW,
 						       "USB D+ pullup");
 			if (retval)
 				return retval;
 			udc->gpiod = gpio_to_desc(mach->gpio_pullup);
+
+			if (mach->gpio_pullup_inverted ^ gpiod_is_active_low(udc->gpiod))
+				gpiod_toggle_active_low(udc->gpiod);
 		}
 		udc->udc_command = mach->udc_command;
 	} else {
-- 
2.43.0


