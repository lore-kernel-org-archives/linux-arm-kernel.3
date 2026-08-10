Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B210EC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0Canle5rtkGjjXltqJt/4h8AMWrPL9Wd/WVDPCBLgc=; b=NHJQ+1ukya9wNhudDgsPDrs+YP
	9Y/q3cTLyQovXQ9rLrXEsNlt3MHgDDOkjKK15mILU1LwmFxbefMISgOZ5P1R7TAiEY9eBv3jq8qkM
	Mi9UCR19KjvqmwFNxSgbBDRoe3iGmsDeWtMg4D6JpVWv8C84QYduVHegk+Vacfblv0AfV4w9PAb5f
	irTJeuLMYqBpyEqH7cYupVN+dO+ydjcRNFyoqs6+G5tHIePyLG/8T9p1gAP3sU8SzpEdFPOdVnBcX
	7ob0kyRXuYrsqtqm3RhtGquUncCp6qc5uwVDnkchggwpulDeMPlTwJ9veQkTng/lsYWR6kIDTG/k0
	x7atlGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUT7-0000000CbJg-2T2x;
	Mon, 10 Aug 2026 18:11:25 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUT5-0000000CbIW-1mZr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:11:24 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2824801a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385483; x=1786990283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0Canle5rtkGjjXltqJt/4h8AMWrPL9Wd/WVDPCBLgc=;
        b=HzNrdKtwn33PnhUXSjjFI0ed70YH9LaQvzT8CeO/oY13qBKWmQ9wUE77nirJkyfgZG
         xS1FgbL+4TIkUte9sQDX9Z5TBlFHUCANjmnklz6DX2a/OGGt9s9Kzg7pbaGnDK7Rbf9a
         3pQb+pSKrKiG8At+xkNXMJSNOVz0m+kKcvaFp8mSGim9mjfQIKyh0EZKmedY5FnKLQ4U
         U8U1fpLkydv8viElHTO1erQu3JuY4j7yXA47cKtfZq83G4xI8f73auFHimcCN7+QoQsX
         V30burRE2DCGg+S3aXC3hbTVo+Zj2Gs40ZSxb9vC/N/jWK+h2kX5jWqEXqeoQeLPps8X
         PrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385483; x=1786990283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0Canle5rtkGjjXltqJt/4h8AMWrPL9Wd/WVDPCBLgc=;
        b=gbYEkjnpjUc/F2APV8F7pYwLKHSsfyTBbSCnUpyh71eUELeAmb2pXTflitV6B4Ld7m
         fhoNLrIZQW/woIb512TcQx9cBM7LSQvVOis6+0Ui/BtNROQYuA5kFbjRgjASNticGYqt
         DHokgZMtX2BXFXYgqoaG1T/bIB4SsrSr8BLPYfw//BT2EdK0kGyfUhZutB6Fg1GpF6ej
         Ftmh5NX3tqM+nSFAJfqGaTdBftNmMxQOAsodGM/FKJrZrV+ZoMSSBGG7EaKV70JLxSfZ
         tz98koz8LS7IYu09lE/YV2I3IyA8kOeQFSbVeIzV9yLdYu59mdrFodNCXhBznmXci4bO
         DpjA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9TN5vJ0NTTSU4Fe/hyfyQxTzPaSJOLb201jJUsB9bfyaHQkR45XixKNb8/pgcsbpUIWKJGQmpFSgSMjZDavNb@lists.infradead.org
X-Gm-Message-State: AOJu0YxAj5MzVpIuMbnxDErIOJXuxo85VrCmVKZJr8xoHjPTSSjDyDYA
	F5x7+AE760FJK9wSMFKNGMLdsiqnKXzdFp5cz60V3eMHAV8ldPVyTMoMaH8yLA==
X-Gm-Gg: AR+sD13kiSzhO4RnTPNEXgiKOjnIr6R3vesmLRf0hywkGdLmzDiW8ypYfGWT/FJZPm9
	AJXGnIzP3Zs2AxV7QxD6mWQALD2UgXm6429PfI/ogIkWJu2CkYmS1kSW9B+xgGGVLHqm6wJFo1A
	wQFyXZaqvFKBUw0CaWJRdMjElvtp2bDDXCwG4CwfWK3AKoqFcu6DbOFbuj2j/uwR7+FsxGXMbPC
	VJT4o++68iyDQkP40ZbEysLdcRAaES5/xbzaoHscSoCVwPCzHhEEDOd/21Vw3OxZTZTWFL1lm/o
	eHgpdM1cHiC2T3GxCFMstas3NHhGwRgBy1mgYqyMUS0b5+9Atzh66jHOHohkAhXX7oTBupeUhkZ
	UVDDxSdImP2tnT9sW5xAFlrAwUzQDUoMddHt21gu986aXkBplEj4osWAQ4/CIIpOw+JX7491K31
	eHgW0lA4s7UpGQXNXDhItF4hCxsvXBk33EpTC8bbaktAEJRSwxmcM5YMdQORw0ONc=
X-Received: by 2002:a17:90b:3985:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-392620e6f9dmr23957113a91.12.1786385482746;
        Mon, 10 Aug 2026 11:11:22 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:20 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 04/34] dmaengine: at_xdmac: move irq bottom half to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:05 -0700
Message-ID: <452a0aad787e4d64a057f13f47302782e9b3752e.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_111123_472693_D2B0F4D3 
X-CRM114-Status: GOOD (  16.43  )
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/at_xdmac.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 901971e8bae6..5a970f9f3831 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -228,7 +228,6 @@ struct at_xdmac_chan {
 	u32				save_cndc;
 	u32				irq_status;
 	unsigned long			status;
-	struct tasklet_struct		tasklet;
 	struct dma_slave_config		sconfig;
 
 	spinlock_t			lock;
@@ -1759,9 +1758,9 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
 	/* Then continue with usual descriptor management */
 }
 
-static void at_xdmac_tasklet(struct tasklet_struct *t)
+static void at_xdmac_tasklet(struct dma_chan *chan)
 {
-	struct at_xdmac_chan	*atchan = from_tasklet(atchan, t, tasklet);
+	struct at_xdmac_chan	*atchan = to_at_xdmac_chan(chan);
 	struct at_xdmac		*atxdmac = to_at_xdmac(atchan->chan.device);
 	struct at_xdmac_desc	*desc;
 	struct dma_async_tx_descriptor *txd;
@@ -1865,7 +1864,7 @@ static irqreturn_t at_xdmac_interrupt(int irq, void *dev_id)
 			if (atchan->irq_status & (AT_XDMAC_CIS_RBEIS | AT_XDMAC_CIS_WBEIS))
 				at_xdmac_write(atxdmac, AT_XDMAC_GD, atchan->mask);
 
-			tasklet_schedule(&atchan->tasklet);
+			dmaengine_schedule_bh(&atchan->chan);
 			ret = IRQ_HANDLED;
 		}
 
@@ -2317,7 +2316,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		return PTR_ERR(atxdmac->clk);
 	}
 
-	/* Do not use dev res to prevent races with tasklet */
+	/* Do not use devm resources to prevent races with the BH worker */
 	ret = request_irq(atxdmac->irq, at_xdmac_interrupt, 0, "at_xdmac", atxdmac);
 	if (ret) {
 		dev_err(&pdev->dev, "can't request irq\n");
@@ -2397,7 +2396,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		spin_lock_init(&atchan->lock);
 		INIT_LIST_HEAD(&atchan->xfers_list);
 		INIT_LIST_HEAD(&atchan->free_descs_list);
-		tasklet_setup(&atchan->tasklet, at_xdmac_tasklet);
+		dmaengine_init_bh(&atchan->chan, at_xdmac_tasklet);
 
 		/* Clear pending interrupts. */
 		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
@@ -2458,7 +2457,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	for (i = 0; i < atxdmac->dma.chancnt; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
-		tasklet_kill(&atchan->tasklet);
+		dmaengine_kill_bh(&atchan->chan);
 		at_xdmac_free_chan_resources(&atchan->chan);
 	}
 }
-- 
2.43.0


