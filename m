Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA8BC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=; b=WIM6MBjUgHZWpDO6UZCcehWu7F
	FOYNAAB0QdXDwGrsUEozALOMX63viM9Lsyrdu8vFEQqTefdu1d92JdWdh7jvdpcGahNkkWy88JD2R
	dKJPYX/4seOO1k/4tZWY5tptsLHkeXq+uaZK89vh8ZOvypBmh75slGGQNLQdYq0pj77E5b3H68hHV
	P24WFl4ZrbzVuWRKiJV00MesKsg0Zw6md72myxY6WVzPXFbtU06xiYh5W1FaiG+nnfQ9TZ72v7uS/
	uPAySIlOoVz6lPTEevsTVjDfWL6wM1A4sA/jMnOqIvYnrWLbFZx1LTVv6B3iOQJOWgPC8OT1m0RYn
	7y8sqACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusst-00000002n8n-0pYG;
	Fri, 14 Aug 2026 14:27:47 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wussn-00000002n6r-3TVX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 14:27:45 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-69a33fb0031so149972a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786717660; x=1787322460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=;
        b=F74yIkr7Z+lSFTOnIJ5+BtZs9alEjeZUZjcVgKwOabfFZOAF91cQhvX42HVUFbzg5n
         GHLSbk8CSC1kP/r8Knhg9R3Y6+LMEeV+uzGvzO6uSP2+Ve/a/zz6qklLK1pH5Q/s5cOm
         U+izpkFvnRmbea2FVAcipDezJBejAWweS4lyVqX46XJszfeNpex3OMohT4hvwC94/YfJ
         0IVhNE26CorcGfHLG6DdBG2ya3XUo0swTjwQxI6nIA8zrX7FEabu01763RtzU5MS5ztb
         IaBFdFTTXPmNE8u+UEn7YlQQ/wVkuZG8G3SglS/vKx0ia53AiXK/xrS1rOpzec2511uC
         g2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717660; x=1787322460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=;
        b=hAyuXtiyuL5Gf/c6d9EJEGawwkh/fwiXv7kLx6RirRENUn/tW+cAkMGruO6EqlYcvw
         F98/CmHR5m7vZUcedxH+Dw4YGQASTwC67H1kgI4y9DLFIKUKl+NAHGAUVPiVTQXRn1oZ
         LWSaEPztG6muxEyQtuY+Iq95Py4Co/mrXHejsEyzau8PVlYs487cucMAJQBn0kAYIauS
         zpCQ6rv5A20eyyom5KppRdqsbVxg4alYfE/YCwsMDo9Gw+5leFictby+jeZfL590e+rE
         PK6Yrc472j4PQcWD+UdE4m1D7JhIPhj3XVwIGPB1K3y7NTpLph8wgBrKgQnKNnXikDeD
         xs3g==
X-Forwarded-Encrypted: i=1; AHgh+RqPewfOPXaMHKhhvtCnRVvW6fJkzklALtIx/I6tZg2sYWAwrBOA5PtG/QHT+CaKoB/rmZSQSFJo5COYFEMeIXxw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/wy+XQtBMf9tOTfaJsB7OBCITh5zOiw8q/LbzZA5VO/GkfP9a
	Wxlar8wAkotDSpQScjdnFVALBMFR6IVuZI95IzhK7NeEkZ9eH/tHneD74EyNQGnTPu4=
X-Gm-Gg: AR+sD13FH32jq04xyK+eUUrGTzQHpHzaUsalVYX0vOeilDIYj2zfgLSL20U7BugLKKI
	Yv1GSCLNE2LFCvBrGXBpWP9IIiNKlVBB80ah63v3DgoJ8OmQuKyHua6UiXrkkVyqX/2I52T3SRp
	GUfALZ157P/77dKRoYWZ2/6s10LcygiuqfVWL+TJbIiZ8JiT3IgwTzLC8VJQa8TKfaHKEgBCnBP
	ckbkYiFNhDMtzGVPEJiuz3NuB3s9u85erIZC6atT5ycovdmoAGz1poH+YSMkaYptFGdsz6Eouxu
	FDhWfbusvZyJZDisDVhXYmY1WhmN5JLdUu+GLU5avXth4TQ21fOnRiPa4OiU1EnU7367qP0n1nk
	JrAKWGVVtazPTI9UXSEeswNddEwGgVXL6VtydDrzJpbQFcorxM6aF1BSUwy0eLAcnzgWTUGSBei
	ukd3itpqOmsD7+Hdqw1q8SUwRf6S2YF1cxTx6Pde+D5oEtv5W86ncu7NokphqgyMb4oJ2hL7M9m
	3zhFCmVKvfsg0NjPVqlgRRbk+GWL2sRknqmfHl4l/8nXmR8ab9u67Oyeg==
X-Received: by 2002:a17:907:9403:b0:c1c:4ae9:b935 with SMTP id a640c23a62f3a-c212a22e029mr175852366b.3.1786717659858;
        Fri, 14 Aug 2026 07:27:39 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c45ffsm106308866b.19.2026.08.14.07.27.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 07:27:39 -0700 (PDT)
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
Subject: [PATCH v2 2/2] dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
Date: Fri, 14 Aug 2026 16:21:11 +0200
Message-ID: <20260814142708.79120-3-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
References: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_072741_885334_3858EC06 
X-CRM114-Status: GOOD (  15.11  )
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
descriptor for a given cookie, before checking whether the pointer
vd is NULL:

    vd = vchan_find_desc(&vchan->vc, cookie);
    txd = to_sun6i_desc(&vd->tx);   /* vd may be NULL here */

    if (vd) {
        for (lli = txd->v_lli; ...)

vchan_find_desc() returns NULL when the descriptor has already been
completed or is in-flight on a physical channel and no longer present
in the virtual channel's descriptor list. When vd is NULL,
to_sun6i_desc() is called unconditionally on &vd->tx before the NULL
check, which is undefined behaviour. Move the call inside the if (vd)
guard to ensure it is only reached with a valid pointer.

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


