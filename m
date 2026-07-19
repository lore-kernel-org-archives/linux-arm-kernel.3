Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC99C44527
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 04:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CyX8AQABzaqPAtDGTAAypouoiAqWWrZDtQeghuZu8BI=; b=b2BfEW8SogVOvrjp23Ch01Kk5z
	sb4WT0xe+qDd5yZY1+75u75S0PBOt9MsbMFZA9iZ7tL12cmo4uxnKAKbf/VEHVrDxAErbRxmoZEKq
	TgNR8dbE8Aca3WXXX/ASxEy9cbXQSdoY6N33XLvyKxOV8cyrsDmI1mk7ILfRanwcOgGO/8e5b0uZi
	09ZYs9HCDWrfOEt4eG0LLCHEDBgnL/cr7Z8uvqF/nyojfCyuBm/xpG/Lsi7g8MH9DhamUsVi+lzE/
	eq8wMDJUJaL1xzgJw6OTbTschONfCB/PyaU+gE67saXp9lqgY0kqGwOFQLIcGAZzHgPG/jxmO9i9s
	64hg6ClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlJA4-00000004kPB-02tO;
	Sun, 19 Jul 2026 04:29:56 +0000
Received: from azure-sdnproxy.icoremail.net ([52.187.6.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlJ9z-00000004kOk-13q9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 04:29:54 +0000
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wD3SAivUlxqr5wRAA--.40166S3;
	Sun, 19 Jul 2026 12:29:36 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app1 (Coremail) with SMTP id yy_KCgCHiaOuUlxqvO31Ag--.22502S2;
	Sun, 19 Jul 2026 12:29:34 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] usb: gadget: at91_udc: drain polled-VBUS timer/work before udc is freed
Date: Sun, 19 Jul 2026 04:28:39 +0000
Message-Id: <20260719042839.3167094-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: yy_KCgCHiaOuUlxqvO31Ag--.22502S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?E9tgYQXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVCjTgEH9dVomQuWcozCBBFO+OqxT0FaZMjqNNJSPRVXVwwGfJ0X0lj3+n4RXJDYpP4E
	eXecJ1t502QrduF9jzDN5RPxYw6l01w8CbPzC/8w
X-Coremail-Antispam: 1Uk129KBj93XoWxWF4fKFyUuw45XF1UWF48uFX_yoW5tF1kpF
	Z3WFWfCFW7XFW2ywnxZ3yqvFyYy3yxt34jvrWxGa18urn3Jr13JFyUJFy2vFWrCFZ5G3W7
	ta1kWw45CFn7ZrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85l1PUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_212951_493627_1B8725DE 
X-CRM114-Status: GOOD (  13.05  )
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

In polled-VBUS mode (board.vbus_pin && board.vbus_polled), probe arms a
self-restarting cycle: at91_vbus_timer() schedules vbus_timer_work, and
at91_vbus_timer_work() calls at91_vbus_update() and re-arms the timer via
mod_timer(). Both recover the same udc through container_of and dereference
it on every iteration.

Neither teardown path cancels this cycle. udc is devm-allocated, so it is
freed after at91udc_remove() returns, and is likewise freed when probe
fails and devres runs. A timer callback or work item that is pending or
running at either point dereferences the freed udc.

Add at91_udc_shutdown_vbus_timer() and call it from at91udc_remove() and
from the usb_add_gadget_udc() failure path in probe; the remaining probe
error paths fail before the timer is armed. timer_shutdown_sync() waits
for a running callback and clears timer->function, which makes the work
handler's mod_timer() a permanent no-op; cancel_work_sync() then drains
any pending or running work whose re-arm attempt now does nothing. The
timer must be shut down first, since cancelling the work alone would let
the timer re-queue it. The guard mirrors probe: in IRQ mode the timer and
work_struct are never initialized.

This does not require a fault; a normal driver unbind can interleave with
an already queued work item.

This issue was found by an in-house static analysis tool.

Fixes: 4037242c4f5f ("ARM: 6209/3: at91_udc: Add vbus polarity and polling mode")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/usb/gadget/udc/at91_udc.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 5aa360ba4..8e5d7fb71 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1794,6 +1794,19 @@ static void at91udc_of_init(struct at91_udc *udc, struct device_node *np)
 		udc->caps = match->data;
 }
 
+/*
+ * The work handler re-arms this timer, so shut the timer down before
+ * draining the work; otherwise it restarts the polling cycle.
+ */
+static void at91_udc_shutdown_vbus_timer(struct at91_udc *udc)
+{
+	if (!(udc->board.vbus_pin && udc->board.vbus_polled))
+		return;
+
+	timer_shutdown_sync(&udc->vbus_timer);
+	cancel_work_sync(&udc->vbus_timer_work);
+}
+
 static int at91udc_probe(struct platform_device *pdev)
 {
 	struct device	*dev = &pdev->dev;
@@ -1907,7 +1920,7 @@ static int at91udc_probe(struct platform_device *pdev)
 	}
 	retval = usb_add_gadget_udc(dev, &udc->gadget);
 	if (retval)
-		goto err_unprepare_iclk;
+		goto err_shutdown_vbus;
 	dev_set_drvdata(dev, udc);
 	device_init_wakeup(dev, 1);
 	create_debug_file(udc);
@@ -1915,6 +1928,8 @@ static int at91udc_probe(struct platform_device *pdev)
 	INFO("%s version %s\n", driver_name, DRIVER_VERSION);
 	return 0;
 
+err_shutdown_vbus:
+	at91_udc_shutdown_vbus_timer(udc);
 err_unprepare_iclk:
 	clk_unprepare(udc->iclk);
 err_unprepare_fclk:
@@ -1933,6 +1948,9 @@ static void at91udc_remove(struct platform_device *pdev)
 	DBG("remove\n");
 
 	usb_del_gadget_udc(&udc->gadget);
+
+	at91_udc_shutdown_vbus_timer(udc);
+
 	if (udc->driver) {
 		dev_err(&pdev->dev,
 			"Driver still in use but removing anyhow\n");
-- 
2.34.1


