Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE45CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z24k+LQZs05VjiiN2ltNPT89oDxAmQ/6P/qF1hm3qv4=; b=QGoyqH/tN27+Tns+9DbJrRqOwJ
	qw5gUKA2KCyn9IU5QXoWB/qBQYLPVLdde4c1yGkmS0BR1Lm5O6hhTeV6sedmqK6cQP/n6OD4pDLoC
	YQ0OP8oDDyYTbUyakay54MdWsHhmtS0DbWABUSqWKsuauznl5/8ayQENduuOghmZxRhPjVVhmHVHz
	9UGM1e/+UMJbvew6W9BXgHkUrwKpY4pS+yr06o+ZccLorunPsK1x7udIQAcwi42Bm0j0B32JLlk6A
	N+QJisTkL/CE3AtVlyOAt0K6OTqMQJKpbjCAjvq/ptJBY7D8S/JZjee434fZZdDZ5GvHUAodKBA6d
	8XjZOgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIS4u-00000005V8E-3BAg;
	Mon, 10 Nov 2025 13:37:04 +0000
Received: from mx13.kaspersky-labs.com ([91.103.66.164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIS4r-00000005V7A-0gm0;
	Mon, 10 Nov 2025 13:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1762781809;
	bh=Z24k+LQZs05VjiiN2ltNPT89oDxAmQ/6P/qF1hm3qv4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OcCweNw3vb9jy2lz7l6GQ8gmv0I+gcRQhVDkwPCpSDwr08Q3rHXVnJ7RBtgUnxbCQ
	 O6i98Wt5XZdzXHgPmhdKwsyETn8WoruSckkFRovH7HbL1pucmgeFe6E9GTNLKf4d7c
	 7Ls+iLFAVufN+zfDhUfdFEf5m5dNn7sFRqFSL6g3cprwx2FGOAQ4pm+vyx2D1Xrlo6
	 ppfDT5lv7papwnVmUdLnQ8Z/MG8y9RRY/GMnX9sPOm5/pZnDhmgS1BcY6gAM4R/fTh
	 wCIFliiGwCT2AFpzjys9p4h8/JMgZdGr10TmsJ5frMHSy41AFZ2Aibt8udJtlGleSS
	 MfgjQJ6TaZRRg==
Received: from relay13.kaspersky-labs.com (localhost [127.0.0.1])
	by relay13.kaspersky-labs.com (Postfix) with ESMTP id 8C2263E24E5;
	Mon, 10 Nov 2025 16:36:49 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub13.kaspersky-labs.com (Postfix) with ESMTPS id 86E023E21DC;
	Mon, 10 Nov 2025 16:36:48 +0300 (MSK)
Received: from zhigulin-p.avp.ru (10.16.104.190) by HQMAILSRV2.avp.ru
 (10.64.57.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 10 Nov
 2025 16:36:29 +0300
From: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
To: " Chunfeng Yun  " <chunfeng.yun@mediatek.com>, <linux-usb@vger.kernel.org>
CC: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] usb: gadget: pxa27x_udc: add proper errors hanling
Date: Mon, 10 Nov 2025 16:36:09 +0300
Message-ID: <20251110133612.159057-1-Pavel.Zhigulin@kaspersky.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.16.104.190]
X-ClientProxiedBy: HQMAILSRV3.avp.ru (10.64.57.53) To HQMAILSRV2.avp.ru
 (10.64.57.52)
X-KSE-ServerInfo: HQMAILSRV2.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/10/2025 13:26:37
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 197932 [Nov 10 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: Pavel.Zhigulin@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 75 0.3.75
 aab2175a55dcbd410b25b8694e49bbee3c09cdde
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: zhigulin-p.avp.ru:5.0.1,7.1.1;kaspersky.com:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/10/2025 13:28:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/10/2025 12:24:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/11/10 10:58:00 #27905202
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_053702_188013_DFF4BEF1 
X-CRM114-Status: GOOD (  16.23  )
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

The udc_enable() function previously returned void and ignored
potential errors from clk_enable(). This patch changes it to return
int and propagates clock enable errors back to the caller.

pxa_udc_pullup() now handles these return values correctly.

Also, both pxa27x_change_configuration() and pxa27x_change_interface()
now check and log negative return codes from the gadget driver’s .setup()
callback to aid debugging of failed reconfiguration events.

No functional behavior change expected under normal conditions.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: eb50702539f9 ("USB: pxa27x_udc: factor pullup code to prepare otg transceiver")
Fixes: f4fd094cdfd1 ("usb: gadget: pxa27x_udc: fix clock prepare and enable")
Fixes: d75379a53870 ("usb: pxa27x_udc driver")
Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 42 ++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 897f53601b5b..58b7f85667bd 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1462,7 +1462,7 @@ static int pxa_udc_wakeup(struct usb_gadget *_gadget)
 	return 0;
 }

-static void udc_enable(struct pxa_udc *udc);
+static int udc_enable(struct pxa_udc *udc);
 static void udc_disable(struct pxa_udc *udc);

 /**
@@ -1519,17 +1519,21 @@ static int should_disable_udc(struct pxa_udc *udc)
 static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
 {
 	struct pxa_udc *udc = to_gadget_udc(_gadget);
+	int ret = 0;

-	if (!udc->gpiod && !udc->udc_command)
-		return -EOPNOTSUPP;
+	if (!udc->gpiod && !udc->udc_command) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}

 	dplus_pullup(udc, is_active);

 	if (should_enable_udc(udc))
-		udc_enable(udc);
+		ret = udc_enable(udc);
 	if (should_disable_udc(udc))
 		udc_disable(udc);
-	return 0;
+out:
+	return ret;
 }

 /**
@@ -1691,12 +1695,18 @@ static void udc_init_data(struct pxa_udc *dev)
  * Enables the udc device : enables clocks, udc interrupts, control endpoint
  * interrupts, sets usb as UDC client and setups endpoints.
  */
-static void udc_enable(struct pxa_udc *udc)
+static int udc_enable(struct pxa_udc *udc)
 {
+	int ret = 0;
+
 	if (udc->enabled)
-		return;
+		goto out;

-	clk_enable(udc->clk);
+	ret = clk_enable(udc->clk);
+	if (ret < 0) {
+		dev_err(udc->dev, "failed to enable clock=%d\n", ret);
+		goto out;
+	}
 	udc_writel(udc, UDCICR0, 0);
 	udc_writel(udc, UDCICR1, 0);
 	udc_clear_mask_UDCCR(udc, UDCCR_UDE);
@@ -1726,6 +1736,8 @@ static void udc_enable(struct pxa_udc *udc)
 	pio_irq_enable(&udc->pxa_ep[0]);

 	udc->enabled = 1;
+out:
+	return ret;
 }

 /**
@@ -2078,6 +2090,7 @@ static void handle_ep(struct pxa_ep *ep)
 static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
 {
 	struct usb_ctrlrequest req ;
+	int setup_result;

 	dev_dbg(udc->dev, "config=%d\n", config);

@@ -2092,7 +2105,11 @@ static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
 	req.wLength = 0;

 	set_ep0state(udc, WAIT_ACK_SET_CONF_INTERF);
-	udc->driver->setup(&udc->gadget, &req);
+
+	setup_result = udc->driver->setup(&udc->gadget, &req);
+	if (setup_result < 0)
+		dev_dbg(udc->dev, "driver setup failed=%d\n", setup_result);
+
 	ep_write_UDCCSR(&udc->pxa_ep[0], UDCCSR0_AREN);
 }

@@ -2108,6 +2125,7 @@ static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
 static void pxa27x_change_interface(struct pxa_udc *udc, int iface, int alt)
 {
 	struct usb_ctrlrequest  req;
+	int setup_result;

 	dev_dbg(udc->dev, "interface=%d, alternate setting=%d\n", iface, alt);

@@ -2121,7 +2139,11 @@ static void pxa27x_change_interface(struct pxa_udc *udc, int iface, int alt)
 	req.wLength = 0;

 	set_ep0state(udc, WAIT_ACK_SET_CONF_INTERF);
-	udc->driver->setup(&udc->gadget, &req);
+
+	setup_result = udc->driver->setup(&udc->gadget, &req);
+	if (setup_result < 0)
+		dev_dbg(udc->dev, "driver setup failed=%d\n", setup_result);
+
 	ep_write_UDCCSR(&udc->pxa_ep[0], UDCCSR0_AREN);
 }

--
2.43.0


