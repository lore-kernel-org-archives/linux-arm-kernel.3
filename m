Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E15ECA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JSSC87nfxfspDKDrjTT3iXE48aOn32ItDe2Aa1070uI=; b=gkRES0vQD+UVSNouAgeOcrSKu7
	BoBUwRgVO9S3fql6i3/nxQM3t8tG/6RO+mM867GLgHdjy400plRkL9EqrNZinr7Lxws5Y7L0jBJqc
	ISkVpLJnhQr+rn0eBE09QmWZJpV4oBuP8qgBCnB7GXfh8aRHGnHETeK9trIurZv8xlFsTXsnujRIl
	gEr5XMlcRSa60ddGoku8J2rMg1tV74pyvYUG+NyDJxFdaT4ngr38EJ6hUg6sk+aOE3QQsNcDoRKnr
	P1ruYJpGoX7S/ZLCMB1an6Zmu3cI3Y4wGOjovox6juIpSOevpB7RN/L5u6YGo/4grYBoHg4IxyCtK
	kUJQfJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF139-00000005Jfw-42a0;
	Fri, 09 Oct 2026 03:13:35 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF134-00000005JeJ-3Fy7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 03:13:33 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50622db01;
	Fri, 9 Oct 2026 11:13:25 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] usb: gadget: pxa25x: mark the watchdog timer IRQ-safe
Date: Fri,  9 Oct 2026 11:13:18 +0800
Message-Id: <20261009031318.1122589-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa11ea6b86503a1kunm2290a5e1430986
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkkeVkpCGkJCSB1CSx4dQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bcSfLQjh4BTRg43Eyh/AtX3mKz0+pVTtRZS6sjLjvU5FF6Tz++1E+48c/SGtaOtYOE33rQg/aawOo26rq60Dj14/HBkrE2cRQZZaeJh6Dv+iuPup0Y5DZYVTVPkAiRHa0wSy76LDIo32f89moZhcvluoejcw8Sd1HjTgFJ8FcoU=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=JSSC87nfxfspDKDrjTT3iXE48aOn32ItDe2Aa1070uI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_201331_473576_290ACAAF 
X-CRM114-Status: GOOD (  10.96  )
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

The PXA25x UDC reset path runs from its hard-IRQ handler and calls
timer_delete_sync() for the watchdog. The timer is currently initialized
without TIMER_IRQSAFE, so timer_delete_sync() warns and can deadlock when
the reset races with the watchdog callback.

Mark the timer IRQ-safe. Since IRQ-safe callbacks run with interrupts
disabled and remain so on return, remove the callback's local IRQ disable
and enable pair; local_irq_enable() would otherwise re-enable interrupts
before the callback returns.

Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/usb/gadget/udc/pxa25x_udc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index 594d67193..41076ecca 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -1563,7 +1563,6 @@ static void udc_watchdog(struct timer_list *t)
 {
 	struct pxa25x_udc	*dev = timer_container_of(dev, t, timer);
 
-	local_irq_disable();
 	if (dev->ep0state == EP0_STALL
 			&& (udc_ep0_get_UDCCS(dev) & UDCCS0_FST) == 0
 			&& (udc_ep0_get_UDCCS(dev) & UDCCS0_SST) == 0) {
@@ -1571,7 +1570,6 @@ static void udc_watchdog(struct timer_list *t)
 		DBG(DBG_VERBOSE, "ep0 re-stall\n");
 		start_watchdog(dev);
 	}
-	local_irq_enable();
 }
 
 static void handle_ep0 (struct pxa25x_udc *dev)
@@ -2343,7 +2341,7 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	timer_setup(&dev->timer, udc_watchdog, 0);
+	timer_setup(&dev->timer, udc_watchdog, TIMER_IRQSAFE);
 
 	the_controller = dev;
 	platform_set_drvdata(pdev, dev);
-- 
2.34.1

