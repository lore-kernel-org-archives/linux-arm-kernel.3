Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C04BC55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nL86Otcun7yyb1ytBTWGfmqSL8gl/fJkNRzwafPytk4=; b=aT4uM1ZdBEzn36zjpDHt6PKfmr
	ObHVl2UW+Z4EAHRKFMkbtBYhSJkiidz3iCHOhdbGEFlU9uW6jrG4vb8ZA8iSJgg+j8DCUEzAO3JjS
	WiVyDvGqr1MUcLtuQCDZ3U4Jk/+NCMhdMSePKECrB/2V2HW/o2FpnCedXRfIPIvwujVbDQcHnnW+r
	3tFqhnuhGdyavG9Tdae83Zw+4fZFcdNG+YoVb7oW9jJ2Dz65RIwCkzrRZT/4p/Ax8Gm4QlAeo5btH
	lX1LAMY9GlvVM1mQypEP17/wIbvcz8SFO1iex+Y0EGFxT4nPyyC+X992RgG5Ra3i2hSC+2pST92PS
	5Y7KiVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrFI-000000050Hg-0dmH;
	Thu, 06 Aug 2026 06:06:24 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrFF-000000050Gb-0Y9n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:06:22 +0000
Received: from LAPTOP-99KJFSET (unknown [36.153.54.46])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48fb94a23;
	Thu, 6 Aug 2026 14:06:11 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] usb: host: ehci-atmel: stop clocks before releasing HCD
Date: Thu,  6 Aug 2026 14:05:57 +0800
Message-ID: <20260806060557.1747-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fd5add33f03a1kunmf64ace83289325
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEMeVkhLTh0fGk1MSEoYSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTkhVTk9VT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=TnjF48TodI0UM6Ent6KhPkPvq60fAo5GUq4k1IDbtyQ6zpPaqbtHcvBZ5zpoq60tz2LsoY7hSBs/Lu7jJQ+4hswBMrAolt6uksuMXYEmHD5YT+8oQzDUEQlI+6BnqfAMX1xP6H7LZ5+tck/aQJl6kNg3hgNJgzKA1QoPUYHRPj0=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=nL86Otcun7yyb1ytBTWGfmqSL8gl/fJkNRzwafPytk4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_230621_362538_5BC5CFE3 
X-CRM114-Status: UNSURE (   8.76  )
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

usb_put_hcd() drops the driver's HCD reference and can free the HCD and its
private data. The remove callback then calls atmel_stop_ehci(), which
obtains that HCD from platform data and dereferences its private data to
disable the clocks.

Stop the controller clocks before dropping the HCD reference so that
atmel_stop_ehci() cannot access an already freed HCD.

Fixes: 501c9c0802d9 ("USB: at91: Add USB EHCI driver for at91sam9g45 series")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/usb/host/ehci-atmel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 65747270fd88..bcd56f888ec9 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -177,9 +177,8 @@ static void ehci_atmel_drv_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
-	usb_put_hcd(hcd);
-
 	atmel_stop_ehci(pdev);
+	usb_put_hcd(hcd);
 }
 
 static int __maybe_unused ehci_atmel_drv_suspend(struct device *dev)
-- 
2.50.1.windows.1


