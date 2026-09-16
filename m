Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F77C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XRjLa7qlFX6dJVmeGqjKmWH1z03VST/FAeIvkxhWRZ8=; b=kbgU/xCcBP1nRpryZzGOOBbM3V
	Styw4nOL9h9YpSnAzYRzIGOu9siapIVCVNN5QvJ9abRTEHTlMc2zJ6ZRdKDnjTL3q1+rDraIrz1os
	HmCsBrFYVymrpvfRP54ao5t9Z0FKsDQzUfpZrePWdFrSIMima4IN81PQOgkUbG6z8PXCZuN06GQRI
	a9d4xSlzCyS1JX8TTRibyQ3PaRnov32sqqZnFRB1xN4izI1L350jQKzra44m/h1QD6lDOx10xmFw1
	Udk48WwQdvJ6yD+dEkf3+Y3aS8W7V5FreOXL/irm7AuAeEagPH56ZMMg555aGqbe3S6qRWmVj16c+
	WPMGBEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6slc-00000009mNn-12D4;
	Wed, 16 Sep 2026 16:45:52 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6slZ-00000009mMm-3fXC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:45:51 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABn0jy6x6pqIOZtCA--.22817S2;
	Thu, 17 Sep 2026 00:45:46 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: daniel@zonque.org
Cc: dbrownell@users.sourceforge.net,
	gregkh@linuxfoundation.org,
	haojian.zhuang@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robert.jarzmik@free.fr,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: Fix transceiver leak in pxa_udc_probe()
Date: Wed, 16 Sep 2026 16:45:18 +0000
Message-Id: <20260916164518.2084871-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABn0jy6x6pqIOZtCA--.22817S2
X-Coremail-Antispam: 1UD129KBjvJXoW7try3urW7KrW8WF45Zr48tFb_yoW8tFWxpa
	nruayrtry5Aa93t393Jwn8ZF1rAF17tFyqkrWIyan5ua13Xr42yw45JFyaga18CFykW3y7
	tFsxtw4fCFWDur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9a14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCV
	W8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJr
	UvcSsGvfC2KfnxnUUI43ZEXa7VUbo5l5UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwQMA2qqpVhQ8wAAsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_094550_288169_22828ECD 
X-CRM114-Status: GOOD (  13.22  )
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

When the device is probed from platform data instead of device tree,
pxa_udc_probe() takes a reference on the USB2 transceiver with
usb_get_phy(USB_PHY_TYPE_USB2). This reference is only released in
pxa_udc_remove(), but the error paths taken after the transceiver has
been acquired return directly: a failed D+ gpio lookup, a failed
devm_clk_get() or clk_prepare() call, a failed devm_request_irq() and
a failed usb_add_gadget_udc() or udc_enable() call all leak the
reference.

Route those error paths to the existing err label so that the
transceiver is put together with the clk_unprepare() cleanup. The put
is guarded by !of_have_populated_dt(), because in the device tree case
the reference is taken by devm_usb_get_phy_by_phandle() and released
by devres when the probe fails.

Fixes: 7fec3c25b773 ("USB: pxa27x_udc: add otg transceiver support")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 1abea0d48c35..5f4f66e571f9 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2421,18 +2421,21 @@ static int pxa_udc_probe(struct platform_device *pdev)
 	if (IS_ERR(udc->gpiod)) {
 		dev_err(&pdev->dev, "Couldn't find or request D+ gpio : %ld\n",
 			PTR_ERR(udc->gpiod));
-		return PTR_ERR(udc->gpiod);
+		retval = PTR_ERR(udc->gpiod);
+		goto err;
 	}
 	if (udc->gpiod)
 		gpiod_direction_output(udc->gpiod, 0);
 
 	udc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(udc->clk))
-		return PTR_ERR(udc->clk);
+	if (IS_ERR(udc->clk)) {
+		retval = PTR_ERR(udc->clk);
+		goto err;
+	}
 
 	retval = clk_prepare(udc->clk);
 	if (retval)
-		return retval;
+		goto err;
 
 	udc->vbus_sensed = 0;
 
@@ -2471,6 +2474,8 @@ static int pxa_udc_probe(struct platform_device *pdev)
 		usb_unregister_notifier(udc->transceiver, &pxa27x_udc_phy);
 err:
 	clk_unprepare(udc->clk);
+	if (!of_have_populated_dt() && !IS_ERR_OR_NULL(udc->transceiver))
+		usb_put_phy(udc->transceiver);
 	return retval;
 }
 
-- 
2.34.1


