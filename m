Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21978CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 10:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WEAysOJhYWScktWySeX+/hXiUj2AW4y6blrSCBK852s=; b=TMg/SID2YdIkqBVu3PquWPofNf
	8dy67snEHfrFo1EnyBudeOLMU7UfhS9Dex6SU2HU0Iti5FXDwctt/VAQhm3TZPekCDOEte8Mdg4p0
	4ReEg099QHfvR6TMtT3iN3zK9ALsWkKs385A3bBuT2oCPPpLiZtkp9NQKyQdh2H+7UwxwzL5RGv5l
	x5LHVhnduFcy2ZfZ2smFFUA2zeRqYhWPTAQtnQYUXv7m/y7xDfW9hYvLU0KbiChJxIJxLOipIgHY3
	e/nLUSn3yzjxaVgczDf/5rOkO1wyqxUeKAaiGkzc5xXjqULUDMCijS1bNeVQAP3SCIeltE7DtDtPw
	qGBgxs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpKh-00000001gZB-1F2s;
	Tue, 26 May 2026 10:48:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpKf-00000001gYY-0giU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 10:48:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59E77435FD;
	Tue, 26 May 2026 10:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211541F000E9;
	Tue, 26 May 2026 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779792500;
	bh=WEAysOJhYWScktWySeX+/hXiUj2AW4y6blrSCBK852s=;
	h=From:To:Cc:Subject:Date;
	b=fuZ4QRQDTCyNZCqf+VzbJ3OEA/ucV1ybEhaJ3ZKzfgZ/LujfhOdE+NOxz/mYBE06i
	 MXQYSzCgyVL72T5wkfhsTjn6Jqg/0MkJ+Y+Y1oHEDQaeALOsQkXHyUSinY/k8ue9Hp
	 q9Upes6n1tC0/JY3YWJJGSVMFj8VxGWOm+z02n90I0GOB91nkfNcJyzflDPYFancja
	 /xdJQ+ZTUyBh7Sg3TMqjDCoyClzjy9QL2yc9RniPXh8OP823mV5YAgYN8Wl1kIeqpz
	 TonAUlHUh4oJYlpXMr5gTzAt97W7kvgXZD+W/b/Nw8n/7Ri2HAX9EQV9fbZ5a/2j+d
	 MeFiHc19m/f+A==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: udc: pxa: fix error handling
Date: Tue, 26 May 2026 12:47:52 +0200
Message-Id: <20260526104810.3906090-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_034821_227430_B314E4DF 
X-CRM114-Status: GOOD (  13.84  )
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

From: Arnd Bergmann <arnd@arndb.de>

As Dan Carpenter points out, my recent change makes subtle
changes to the error handling that were not intended.

Move the warning print up so it does not get skipped in
case of an error, but handle -EPROBE_DEFER properly now.

Change the devm_gpiod_get() to the _optional variant, which
is in line with the intended behavior and the DT binding,
though this did not work previously.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/linux-usb/ag6-xhfFjb5NpXQz@stanley.mountain/
Fixes: 25bd55f46032 ("usb: udc: pxa: remove unused platform_data")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 640f81988c04..df5cca43afbe 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2374,9 +2374,10 @@ static int pxa_udc_probe(struct platform_device *pdev)
 	struct pxa_udc *udc = &memory;
 	int retval = 0;
 
-	udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
+	udc->gpiod = devm_gpiod_get_optional(&pdev->dev, NULL, GPIOD_ASIS);
 	if (IS_ERR(udc->gpiod))
-		return PTR_ERR(udc->gpiod);
+		return dev_err_probe(&pdev->dev, PTR_ERR(udc->gpiod),
+				     "Couldn't find or request D+ gpio\n");
 
 	udc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(udc->regs))
@@ -2395,11 +2396,6 @@ static int pxa_udc_probe(struct platform_device *pdev)
 		udc->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
 	}
 
-	if (IS_ERR(udc->gpiod)) {
-		dev_err(&pdev->dev, "Couldn't find or request D+ gpio : %ld\n",
-			PTR_ERR(udc->gpiod));
-		return PTR_ERR(udc->gpiod);
-	}
 	if (udc->gpiod)
 		gpiod_direction_output(udc->gpiod, 0);
 
-- 
2.39.5


