Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39924C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wtr6C7a2bWw56KI7UgkJ9lIBa9lQozueu7UESTIAJSY=; b=TYy1MfdQjrGzf+xDgYd9ZAycXA
	HcW9rfjLdUrUFEl19RwNuqkQuWGXho/7YZNE9H3kxc4S7jiSODEOYyh7QzV/LYVPn1qzu1S4vHkpS
	b4ygEgrkd2lH+DhfCQGQvWn0GP1d6jGNbDYTeODMnfNpbFgxvO56NwLospcZrrLDAcU4zwdE71xA/
	DQuLgZgHuby9lY3eVd3BAnyeWXKv5LmPNedIYH43xtnUFZF9O56cFkuaUKdM/bobHCgLWHsoCydoH
	eCx3f84Lz99OXpAnR2nqpm7GTDSDkMjOl15dS4Tp4w9ikUpAG+csq6slE1j5ZbIM2YEUnlK20JKfd
	Eey2c8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRye-00000003qEa-0eDR;
	Mon, 27 Jul 2026 20:31:08 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRyc-00000003qDV-0qjR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:31:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso29136445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184265; x=1785789065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wtr6C7a2bWw56KI7UgkJ9lIBa9lQozueu7UESTIAJSY=;
        b=Wr5Xey78+e7Xv/IXAGrk5re+Pjmm6smWs4ioADcIwH9EJNvBZmhbn6UBRwTxR4sxTg
         jVwljvTaXzA86jXPS5Sle4kDdtggVPEt66bUgvkJKN7ym/eKkVV6u7ZyHhdMBPtTElQh
         o0L7KVweFXLpVhp+VSmLXIG7pfv+WE0sZYy8x+CdpSePSYK2JICqljCNIh734Rwvie7a
         t8LbTRUbhnF4aZjzFimgR1VBBb/MI4beAZZcT4vKMut89YgR5+OgqY8YUj+GjLDYU9eK
         7qEs2Ffax1J0WlxyJ5AQJRzXF1ew3crVs3sAC6EwEqGWoilTMYsZxhDWDPLNUyZyPL2E
         eUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184265; x=1785789065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wtr6C7a2bWw56KI7UgkJ9lIBa9lQozueu7UESTIAJSY=;
        b=ZeuHVurVJxZSzuuYIiWaMoGvh0n42MCbrLevN4nB2xNZErY4OkTSOBmAJQvZ8u5mpQ
         CqGHu2vvLN+DYt19Z+U0pNRwFoxgRJyd75Mtzbu11NF6I+/rG8aLWDIscbxM8NmYLS28
         hVjUTqxD9v6CVzUlGzL9szc6kBJ76YTlYgY0gGFK+hRkoJtfJk4zalk/tOguI1dUu6DZ
         STWtqlQlNbFAI+jeGZenHs+7FHgZgf2lawS0xv3QN+umkiZ/lGhdzryu5Nw1x4RNHQzP
         9YkSM6rBIQl2bT8DxnkMvpV92CS7WrTt/mmK+I2z79lyg8JhtNaXOPbl9IzkNCXNrzs7
         itYw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7xSSGbh9jdp5B+CJ9JHjbsoersM1OIpnij7SbXXWfxVPefClukLwbpWqSjEwz/oyjC94s7aPMK683gVlpUcIg@lists.infradead.org
X-Gm-Message-State: AOJu0YxlGZvXKQoKbCkOmRci1vt65NrWpmvK09ak7iuCxPx7xHPy0AlP
	izZpqzP4sCGHdUfGCfVuVDI4KKztiqpK/HcHnGTfz88SQZ86MQ5aqBhY
X-Gm-Gg: AR+sD13GnwFxaTwfg9EAmq/+IA4zp442r53A2i9pKfiYVk9YO/u4SCft3VFne9uEKXQ
	qEI8ORMsbHtTPhJf4YBkRNq8DqgC1kcQCIWD0vIGF3j0+nmGCWExHEi8DLIbvFhz7rzeKGABZMF
	s6BvggiG40p39144eeMXASPtD9aFGczMGOh8lMnNNTrm/CBp8ZffdcFcpW5Xg63rCgJNdQBFW/2
	gB+cW1vZ04b2JDVgD0tQGJ9mbKQnNxhWhi0ue0kvgDtGaHaHGEqGNfEFondRiPWp9kIUA6bndHv
	u7A6Uz0f7WKqzrPnQF+BicPxKcC/rvLM0+Vb5JKjsmM1wm75almBzjNPbDB/H9YkfEKlHJTe+uH
	fKd9GFVTvkPvBgArnh5aKzEWvfbpm4YFT1jv1ufettDSV3qOkkscTgBATLpdIw+S4JaAAXZhVVQ
	vW3PRs
X-Received: by 2002:a17:902:f547:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2cfde7aca4dmr86641865ad.18.1785184265001;
        Mon, 27 Jul 2026 13:31:05 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:04 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/64] dmaengine: apple-admac: use dma_chan BH callback
Date: Mon, 27 Jul 2026 13:28:31 -0700
Message-ID: <3804b35d529e0b80d8d0898f1dad1fd4cb917fcb.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133106_248579_86C7FA95 
X-CRM114-Status: GOOD (  14.73  )
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

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/apple-admac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 14a5ee14a481..84483247bde6 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -89,7 +89,6 @@ struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
 	struct dma_chan chan;
-	struct tasklet_struct tasklet;
 
 	u32 carveout;
 
@@ -521,10 +520,7 @@ static int admac_terminate_all(struct dma_chan *chan)
 		list_add_tail(&adchan->current_tx->node, &adchan->to_free);
 		adchan->current_tx = NULL;
 	}
-	/*
-	 * Descriptors can only be freed after the tasklet
-	 * has been killed (in admac_synchronize).
-	 */
+	/* Descriptors are released once the BH is flushed in admac_synchronize */
 	list_splice_tail_init(&adchan->submitted, &adchan->to_free);
 	list_splice_tail_init(&adchan->issued, &adchan->to_free);
 	spin_unlock_irqrestore(&adchan->lock, flags);
@@ -543,7 +539,7 @@ static void admac_synchronize(struct dma_chan *chan)
 	list_splice_tail_init(&adchan->to_free, &head);
 	spin_unlock_irqrestore(&adchan->lock, flags);
 
-	tasklet_kill(&adchan->tasklet);
+	dma_chan_kill_bh(&adchan->chan);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -662,7 +658,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		dma_chan_schedule_bh(&adchan->chan);
 	}
 	spin_unlock_irqrestore(&adchan->lock, flags);
 }
@@ -712,9 +708,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static void admac_chan_tasklet(struct tasklet_struct *t)
+static void admac_chan_bh(struct dma_chan *chan)
 {
-	struct admac_chan *adchan = from_tasklet(adchan, t, tasklet);
+	struct admac_chan *adchan = to_admac_chan(chan);
 	struct admac_tx *adtx;
 	struct dmaengine_desc_callback cb;
 	struct dmaengine_result tx_result;
@@ -886,7 +882,7 @@ static int admac_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&adchan->issued);
 		INIT_LIST_HEAD(&adchan->to_free);
 		list_add_tail(&adchan->chan.device_node, &dma->channels);
-		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
+		dma_chan_init_bh(&adchan->chan, admac_chan_bh);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.43.0


