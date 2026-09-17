Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E154C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=92DqYzsY5tQw8zrK7ygfUYU1Rl0yvZP1MFAZ/+j1d2Y=; b=OkbHwtrsVVBYcEbmMR4SEwD5x2
	Ph5fGk12rl+KDFD1qCN2octRnmcG+okz4TLcf+goRtqmQIDvJGcnYxjd6jiZWzjTvat5t4xx4PXqQ
	v2+tg+Zw0LcUyBQAgDKeY041iikPMAXJ5YEmqxnAZKEJAfJkoUXPQSQnhJ5+cDQoNdNz1WOqjwOHt
	CG2A9/SiyGlC6mIAAsJIeunKoYtm1eFKzNBw45Up34J+e9YuMRubKBrZe0Cl2YSaqJLCJbvT6KQbm
	U+pApbAEmDZAo5dDQA2rvcA+phpNTS4p0ldGG6jMKoezdk4AKfLGXWaA9WGsWHJMawSULrvNQkW7H
	zFCOwjtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79Pe-0000000B6s5-2Kdb;
	Thu, 17 Sep 2026 10:32:18 +0000
Received: from out28-123.mail.aliyun.com ([115.124.28.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79Pb-0000000B6ri-3Y4k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789641128; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=92DqYzsY5tQw8zrK7ygfUYU1Rl0yvZP1MFAZ/+j1d2Y=;
	b=FYcO+E3I4dCg0XWVrTf5qHdgm1PgOnrnOcSj0YC2Lxm379gpfFHlzAtbCOc98A5kwnRAzuPcpu6+rAtofY03FMmZbliL1fhwM+ayPRF3YUb7AVdCIQSMzNzn3NE02qQxYz8H4n7jgrMKJ6q++DbsbEN43amxGJKvQ9vi9sfHXyY=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0743678|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0333185-0.00133189-0.96535;FP=10121135997339731664|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037025160;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.jFzyINx_1789641126;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.jFzyINx_1789641126 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 17 Sep 2026 18:32:07 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: neal_liu@aspeedtech.com,
	gregkh@linuxfoundation.org
Cc: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	liuwb@xiaopeng.com,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH] usb: gadget: aspeed: clamp transfer length in RX completion handlers
Date: Thu, 17 Sep 2026 18:32:04 +0800
Message-ID: <20260917103205.3049861-1-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_033216_321709_D38E66CF 
X-CRM114-Status: UNSURE (   7.71  )
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

ast_udc_ep0_out(), ast_udc_epn_handle() and ast_udc_epn_handle_desc()
read the received byte count from hardware registers and add it to
req->req.actual without clamping against the remaining buffer space
(req->req.length - req->req.actual).

When actual reaches or exceeds length, the subsequent DMA has already
written past the end of the request buffer.  Across multiple short
packets the overrun grows with each completion.

A malicious or malfunctioning USB host can exploit this to trigger a
heap buffer overflow in any gadget function (e.g. f_mass_storage,
f_fs) layered on top of this UDC.

Clamp the received length to the remaining space before accumulating
it in all three RX completion paths.

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Cc: stable@vger.kernel.org
Reviewed-by: Weibin Liu <liuwb@xiaopeng.com>
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 54f81e668..53f6218b4 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -793,6 +793,8 @@ static void ast_udc_ep0_out(struct ast_udc_dev *udc)
 	req = list_entry(ep->queue.next, struct ast_udc_request, queue);
 
 	rx_len = EP0_GET_RX_LEN(ast_udc_read(udc, AST_UDC_EP0_CTRL));
+	if (rx_len > req->req.length - req->req.actual)
+		rx_len = req->req.length - req->req.actual;
 	req->req.actual += rx_len;
 
 	SETUP_DBG(udc, "req %p (%d/%d)\n", req,
@@ -865,6 +867,8 @@ static void ast_udc_epn_handle(struct ast_udc_dev *udc, u16 ep_num)
 	req = list_first_entry(&ep->queue, struct ast_udc_request, queue);
 
 	len = EP_DMA_GET_TX_SIZE(ast_ep_read(ep, AST_UDC_EP_DMA_STS));
+	if (len > req->req.length - req->req.actual)
+		len = req->req.length - req->req.actual;
 	req->req.actual += len;
 
 	EP_DBG(ep, "req @%p, length:(%d/%d), %s:0x%x\n", req,
@@ -944,6 +948,8 @@ static void ast_udc_epn_handle_desc(struct ast_udc_dev *udc, u16 ep_num)
 
 	} while (i != wr_ptr);
 
+	if (total_len > req->req.length - req->req.actual)
+		total_len = req->req.length - req->req.actual;
 	req->req.actual += total_len;
 
 	EP_DBG(ep, "req @%p, length:(%d/%d), %s:0x%x\n", req,
-- 
2.50.1


