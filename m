Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F2BC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hRxg82xUfOW9mDQeH10Yx//tywA8mAwY9WlS188BwMI=; b=CSclxppx04EkouBNBqLNvRzpRR
	GmbTbkkjS3/1QPzdbRV+AFRoYeI5JcF/h+VmHPdpy7Iizz98zJx8Hx+ndnd7oV1/JeDHKXjPmCqce
	3xaWRf0mEpbIfSrAY+g3j67PEji5GwQ8BIGAuYM9jGZv7p8Yd7cU5qXeL2YkHTgtK+cnPR+/zZV86
	P0APJ9SjVsq+L5DJKzknaARfqF3GTPonfZtaZGMeOVTwHVvsbn0N9qw7KCVvKSAoKjBjTlxDmc1IS
	RZIgTMuNGATpoCyOka5B7osyoRZBSxzQuBGa0El8iKJ+C1hNa/SZdVbhYn5dGBnoNvhuavkV/jEOc
	lVk2Xxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBcK-00000000gNR-2lUB;
	Mon, 28 Sep 2026 13:42:04 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBcH-00000000gM9-2I0A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:42:02 +0000
Received: from LAPTOP-99KJFSET (unknown [58.216.104.98])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5d6f440;
	Mon, 28 Sep 2026 21:41:59 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: gregkh@linuxfoundation.org,
	vz@mleia.com
Cc: piotr.wojtaszczyk@timesys.com,
	johan@kernel.org,
	make24@iscas.ac.cn,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] usb: gadget: lpc32xx_udc: cancel pullup work on remove
Date: Mon, 28 Sep 2026 21:41:58 +0800
Message-ID: <20260928134158.117-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e8403a1503a1kunmf3b98a98200231
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaH04aVkMdHkoYH05CHk1KTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJSk1VSktPVUJDWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=a/YqVKu+cl/JdJzhOku1M4V7jBVYfxP8NwcttM9Gl8Z8x4FMD1Oj8R/E8SSNC9aqM8TPxSEjlpvBCoWlrU0soWlyOfHBUEZMoRyff6UieDJ924GkiKVtU3EssjxCRCf1TV3y1x19WtLMmyXNZErLNtBPgdAFbPKw/a+7L1TDufA=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=hRxg82xUfOW9mDQeH10Yx//tywA8mAwY9WlS188BwMI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_064201_749400_96CB9901 
X-CRM114-Status: UNSURE (   6.91  )
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

Several device interrupts can queue pullup_job, whose callback accesses
the UDC and its I2C transceiver. The IRQs are device-managed, so they
remain registered throughout the driver remove callback, and no path
drains work queued before the resources are released.

Disable and synchronize all publishing IRQs, then cancel pullup_job
before putting the I2C device and releasing the UDC resources.

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 044c31869cfb..0a784c9252c5 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3184,9 +3184,15 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
 		return;
 	}
 
+	disable_irq(udc->udp_irq[IRQ_USB_LP]);
+	disable_irq(udc->udp_irq[IRQ_USB_HP]);
+	disable_irq(udc->udp_irq[IRQ_USB_DEVDMA]);
+	disable_irq(udc->udp_irq[IRQ_USB_ATX]);
+
 	udc_clk_set(udc, 1);
 	udc_disable(udc);
 	pullup(udc, 0);
+	cancel_work_sync(&udc->pullup_job);
 
 	device_init_wakeup(&pdev->dev, 0);
 	remove_debug_file(udc);
-- 
2.50.1.windows.1


