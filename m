Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DF2C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ctx57rLzTDeEjtgOib9aUyoQxqr6yVBe4ltDl2pGqk0=; b=aJln8f3Kv25Wmz4EhB0cri3Xkg
	MG4IngNZjXidFOeRTWsGGZEcoX9YXPpxZF33SSBYgNku5t+SMp+5/SLiHp50w9EB9v8deYjzG9Lr2
	YoU/AfgEdLMVVXRqch4ERHh9RS/UxFjOuqUwY9zEjSYwLmMu6ei9ff1y3QRWcCUYmn/VXom8njl0c
	iFhaL+9BkbhnTPoOphwFx9ZqGH9LAYxvs8Uy3oIUv5+Ch9wyyCSq0NUlx4A1/5MgU98uSKbC2ScXK
	WbrYrO83rzMlahzwfZ/7V5+T1VaaHi4+Sc1p9zKdi7f2W+gxBc7POlw7gX+Zc7+UnQmrlUoD+TP/5
	aI7BpKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuryn-00000002im9-0pLX;
	Fri, 14 Aug 2026 13:29:49 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuryk-00000002ikh-2mYB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 13:29:47 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6a18af264f9so209995a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786714185; x=1787318985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ctx57rLzTDeEjtgOib9aUyoQxqr6yVBe4ltDl2pGqk0=;
        b=lLijs7QAPta0iEA9GNtL51lzGbPTQTvUpCcJj137LPliLIF0Z85L1hYlYH+7gERgCQ
         0WNXJvndsHRZM6ryntRWvY2p2z8qnZ6lFgtaXZ2UPY3WbdCTEHIGy/ziTwIcLgjLDI9a
         IVVHriv3j3XH5+hrMWoErgqgsEsQg87u5dDG8t+yVeCWU+YfdHriSB+AZltSdEoEA6hQ
         D/Z9ezEWWKIYJj0ithzD6FJduCzmHaB8m2jLwWlyFTbA3zro3UbmuJqA5oCe2ZmjZuov
         SbL2abDial9W1bufExpNHmffqFX2tFjLlUnCpzRvCOY45iuV1diK9Tj/I0vDrRyIEqHi
         mpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714185; x=1787318985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ctx57rLzTDeEjtgOib9aUyoQxqr6yVBe4ltDl2pGqk0=;
        b=dzBr16Vw9TneJL37Iesoyfd/r6uGMRg+V5+jCXaL7Jbcw9XvO7IJ9/E+dEEz/wqvBB
         Tn3Nfo2xWLKh+urwIeBwtMP92OstIGXWMGGAq3mN/JLRWTXetMhpGJsgBltKNNYiijt6
         fNaLCymsnvc9ExVEgui0I6qTLoayelcu+/el9YD/YnoNUJwdLyxbx3XOVhc7H+g3oN3F
         X4cC+u9xEuz/5CgEYakGu84BUpK2Go0m7kHpnL4HXl7DTK2e/CeyXozgfSEfl7kBxm1Z
         EslhatXDZZi6zGO1r7iyWCRslu2FCA5KHsMu6W0gSkoyCCsiXTJbAU9r7yUqtp3Cm7GW
         ToXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1CW2O1hxjV1pm6Ag9UrefDFtPmXG5DZCTWd1mGevld5Vbuj+GErYj/D740P3VPUUfUhThNuf8u7yZQUuaLxGl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm3y2QhXNokQJiCZ/IND1clB0m+mSc/BHLMaNBQ3Z20dfYoecG
	pJn8mF3H51ld/AlsXzpJMtBxIf+y/tRf1+MQ/qhSDYl7THW1NGUOjJgXCfCjOGA652g=
X-Gm-Gg: AR+sD10TFcoLwPoRYMzV7L4bMSgu83GhTVwTzKSDkcyZZFZoadLDkbZDPj6lN4e0oKw
	nxaxzKL0pna8/EdcFOBuAan8EODMLMKsb3rfVCNZGwxWnYKQEjwI9QdfEUPNWBSpn7GyO8+biIV
	D6b8vx8s20JQm9UL9BAU15lOJztWd9apYCs09kHWmo2mI8fKOXD7dJ0fgQrH8xOGUSfUSOi/Hqc
	m2HWeRHeOfRdcdCFx/2feOwUSBy2T+BM7NdfIdHwdE3I33MPukkD1s+6VIGXw+B2VQj4GLmNCZp
	F1H3SbZvBrVchlGTOWYK/JTGLmdi1opdQFnpERF2FR2N90vzSI/HJbOKC3cZpPvIIb3XyyCx7QA
	PWPCTVd6P8NXhaj/Qk9lPfaavKHutSqRX4QvSXTuORjZ5W2zlTYvGgRWPDaQoC0qu1eFcD/ROIx
	e/tcTa1yM4yBaPXN25L6pD9AuDHlO98p1hUYENjG5Wos0/fz61yxJIT5oof3LGh4EDdN3BJbYJ9
	Fs09HKN5xQ3hJBdqm6Z82AGCO8Q5vpvtygOFDMos0J+bKuMH20gAsgHrHsk5ZAD9QLj
X-Received: by 2002:a05:6402:3881:b0:6a1:faeb:c519 with SMTP id 4fb4d7f45d1cf-6a38a97752amr1392217a12.3.1786714184680;
        Fri, 14 Aug 2026 06:29:44 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9d5eb2sm841941a12.5.2026.08.14.06.29.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 06:29:44 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] dmaengine: sun6i: fix null pointer dereference in sun6i_dma_tx_status
Date: Fri, 14 Aug 2026 15:28:30 +0200
Message-ID: <20260814132906.70322-3-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
References: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_062946_747967_269FD08A 
X-CRM114-Status: GOOD (  15.49  )
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

sun6i_dma_tx_status() calls vchan_find_desc() to look up the virtual
descriptor for a given cookie, then unconditionally dereferences the
result via to_sun6i_desc() before checking whether the pointer is NULL:

    vd = vchan_find_desc(&vchan->vc, cookie);
    txd = to_sun6i_desc(&vd->tx);   /* vd may be NULL here */

    if (vd) {
        for (lli = txd->v_lli; ...)

vchan_find_desc() returns NULL when the descriptor has already been
completed or is in-flight on a physical channel and no longer present
in the virtual channel's descriptor list. Dereferencing NULL via
to_sun6i_desc() in that case is undefined behaviour and will oops on
any architecture that faults on NULL pointer access.

Move the to_sun6i_desc() call inside the if (vd) block so it is only
reached when vd is known to be non-NULL:

    vd = vchan_find_desc(&vchan->vc, cookie);
    if (vd) {
        struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
        for (lli = txd->v_lli; ...)

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Christian Lugnberg <christian.lugnberg@soundtrack.io>
---
 drivers/dma/sun6i-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 04fe1f5042e9..7704b016aed8 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -981,7 +981,6 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	struct sun6i_pchan *pchan = vchan->phy;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
-	struct sun6i_desc *txd;
 	enum dma_status ret;
 	unsigned long flags;
 	size_t bytes = 0;
@@ -993,9 +992,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 
 	vd = vchan_find_desc(&vchan->vc, cookie);
-	txd = to_sun6i_desc(&vd->tx);
 
 	if (vd) {
+		struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
 		for (lli = txd->v_lli; lli != NULL; lli = lli->v_lli_next)
 			bytes += lli->len;
 	} else if (!pchan || !pchan->desc) {
-- 
2.54.0 (Apple Git-156)


