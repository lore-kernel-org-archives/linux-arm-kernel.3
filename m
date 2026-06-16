Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6AACD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=72nfFGwOqmCepnKWEGZx1I8t5XYaTrVTqrklMpMGSkY=; b=G4geLLJLLn1XIMe1XQI9ak2JBA
	By7LhPwrIk6kETcBaOu8qH/etpGPYmqOczoS4usbAmMrzQLqbvET3R3DHZ6FB0L1FZS+5iIO37jrr
	wFnxHQ5iSMu6h2jEm58zMl+EtLKf9pdSH+XH2eD99g1dOHilxGNwrDnj2MZdIIS0gl99yTE4Cvp95
	BTTBWc/AIG72tii64eWWsx2f9XJpPfh2NVNHcer5nFSnDhdfohDO2k4qOxqVt+xI8N90HSvchvpR/
	vEPS3IwmwngNypYSZDp9Ls9pFOJu9T5ANO+1Y4C2SoS0JbavB1jvcau05mm7BylKKxiGJv0+DEmnU
	ufgpQlMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRh-0000000FdlA-3sqV;
	Tue, 16 Jun 2026 10:55:05 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRf-0000000Fdiq-3i8u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:55:05 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so2180617b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607303; x=1782212103; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=72nfFGwOqmCepnKWEGZx1I8t5XYaTrVTqrklMpMGSkY=;
        b=ae9RV9Nuvs9jQSUvrE3TfQHX8lFlVN+Y6QimRNPUYLhtgQB711946WH+UFByh8omyg
         V2vjrBX5tdbQbT1aI3FzeBkDGQ/n+74MT/qADWqg1YS5eEaCVv5vLKWqIggLlY6TiUtQ
         L2aim/kqDZU0AZMIWpV9SMb4EKsFJLO5XOKf3xWjdinGgJnqswb9trLBUVuXyfw592/j
         sJhhvZSzIwUgBNIxChjziMBYz11hY2F3gFFktHG1xjjNTD/tQQ5o1fhWePfWG5aZj8m8
         493xZ7VHHZKfOSO1wZY9+J9fpWmARurrXEu5JhZudTBQ17i/cuYGJyu1nKr+7QvF5ruW
         LDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607303; x=1782212103;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72nfFGwOqmCepnKWEGZx1I8t5XYaTrVTqrklMpMGSkY=;
        b=JjDredmRX7musaU9WvKOK2wUc5nH8OOIY5sNWtdYt5f6ZpQZPp/5sssEcqQCD2sBwz
         Zb1py2h41wOKXoBJDHovI8S9PWYnQ/+9BWaLvLZr2IPf5vkBxH43dkAkPr7eCEcAy5gu
         qlKvueJjfPoXg7ZC68es17SYy6gcqa87srgwBzuOSyPZ5HhQs8ft9v0s8LGcxfs1WxCE
         WHZl2URTGfszKDitdbrEwe50u9vhZgpCaXAwKcn/Tuxaq3B/juhfIz1ymxbyXjGAbxfH
         zKQAA41H2FMK5rgSlVoYmoKtgjnenU/nlLjHL0k74KLcqtZQ2e2MzX23lc9kvETOQ+si
         viVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8si2DI0JafiDCAFisVpQgNs+Crju1/d1xJgo224RR1XSwG2qrhjiGVJPeK7ZqAZNUkyAMoazn0y7eP348Vw2bc@lists.infradead.org
X-Gm-Message-State: AOJu0YzUpv8Ift4eq0DubwqhX1qhM6cD+NIrqNkZ2CNkNAB0/M5HcuEw
	Q3NQn1eIVNhRaY76z5WlXzoyx4BEmf6pBoDjeCyDoxtlIgQkBVR7rupX
X-Gm-Gg: Acq92OEJuesc3zAEOxxlqZhZP7zUEkQG4lVTrcUvD1707odWFgcmEvMbyRjh/AltMz7
	CCFS03gA2qg+/UKfqOK4rBHWpF+/4p5as/vH83rXxeaGp/WTpMR6524mc3cUiQlvtamKQhR9/cF
	XstHby3xPZ7Qh7LroQm+ENPVw3qc9RsaGkp/TfZzqyzjCWvAyLYdFwR0Exu5C763fHFDKpbvZ9j
	Q5erek7jP4MTjt78oIWihWrsm38DMDgyidZTGJPJXRF2dGrcyn73IiYrEoeGnkXmzt19Uy1+H8W
	nR38DPRPwgDCBZ3vlRMkvan0PSUoIU4BBNK3/wEVIrAcBhY+eOs8NgBir/Cd1gmuZEXpYacrTrf
	jrNogvqdsS+uUdpCKQ8bYfRvINMi5Eu8UXTwuuIYrizOg2P5xFTorK0v/XFAysdJddmH1uk98bE
	eLwFGEx4yQCyXkNok/
X-Received: by 2002:a05:6a00:1ad3:b0:842:50fd:4c13 with SMTP id d2e1a72fcca58-84513e1750dmr2556028b3a.4.1781607302958;
        Tue, 16 Jun 2026 03:55:02 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm11550889b3a.45.2026.06.16.03.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:55:02 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] net: airoha: Stop TX queues on error path in airoha_dev_open
Date: Tue, 16 Jun 2026 18:50:39 +0800
Message-ID: <178160729880.2156257.7978513589649053826@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_035503_952573_86124EF8 
X-CRM114-Status: GOOD (  11.97  )
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

In airoha_dev_open(), if airoha_set_vip_for_gdm_port() fails after
netif_tx_start_all_queues() has been called, the TX queues remain
started while the device configuration is incomplete. This leaves
the device in an inconsistent state where packets could be
transmitted before the VIP/IFC port configuration is complete.

Add netif_tx_stop_all_queues() call on the error path to properly
roll back the TX queue state.

Fixes: 20bf7d07c956 ("net: airoha: add QDMA support for Airoha EN7581 Ethernet")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..cf9c366907 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1715,8 +1715,10 @@ static int airoha_dev_open(struct net_device *dev)
 
 	netif_tx_start_all_queues(dev);
 	err = airoha_set_vip_for_gdm_port(port, true);
-	if (err)
+	if (err) {
+		netif_tx_stop_all_queues(dev);
 		return err;
+	}
 
 	if (netdev_uses_dsa(dev))
 		airoha_fe_set(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
-- 
2.51.0



