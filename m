Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73425C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxUXaFX3//5gZlFn4j1A0nGnaMNCEpwg1qcm0FpwvYU=; b=ZOujgoc/dKEmtAc8xD7ln1WqVJ
	z14PHTPbtQxJrhy7x18R6Q2Xj3nC7nktMtPYnnE5P80bLFClWBwhd0NaMNZBUbmjMS5K23C28PWLb
	o9LWAtCKw1kHI5HVHJZXa2/VhMYgYa0MVFZeLgPYVqhmmiSGw2f8rTizNMKvZY8+ZibNBh1RfN31p
	MuaMcaIRdTnMKkF/OLtpjQwH3oHF+ZvA+/liRDzzKHb3ENWVHnm1V8g4Roqo9U0e+R+xrc9AHaJrk
	VbfJZ90uSsDLiKUG3trgNatPqNbclRgFnsaPmYAsB6St0Q0YPd6qNBk4ToPeB0HRvEL4CJOYIFvFf
	PsaKBC8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUUE-0000000CbkV-0Lyh;
	Mon, 10 Aug 2026 18:12:34 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUUB-0000000CbiX-2bXX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:12:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e041ea211so2537159a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385551; x=1786990351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxUXaFX3//5gZlFn4j1A0nGnaMNCEpwg1qcm0FpwvYU=;
        b=c8MmKHe0UOkM6ucqPSb820ymV92SFRZw0tGcIo5NKS79wkjNy5KpsgH1ff4vsVWSL4
         3fI/5EiyWQSXSMsz4BUdqAQgxVuBw6pBPBp6Pc6DgtUurdaxs2ow/R5v42JzhfXUpyxs
         L+Jd05Kd2GMOUV0TjD4An7m/tuPWj9Aaj22n20D74fjEPEtIFs/LP4LsTCF2rZEaCBLv
         8OZVaVJ/mfVVcJDgJlFfJNyJgN313yT5m4IUNk0GjkbRpUiaFoO8ygiwG9n/pALCImqa
         HVJWTLqpytqw1cUsbsA6Kd/Khpny4msY6CNRDX3yNBfiKoyiBaihy+BJR/G883tzyPT3
         g3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385551; x=1786990351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxUXaFX3//5gZlFn4j1A0nGnaMNCEpwg1qcm0FpwvYU=;
        b=J/awwnxBSgTPhlWbr26u1IILiJn8HJv90gT2P9+YgGrJsd6VT6eQVikgghI4OwWyc4
         qtw3zRcKlnwn/T/+WT/J7o1oEXHZpCbyTb4+pXOAoi7xzczgj9ve9OQ0g17BwOnW9i/f
         TCDLZCnEO/YRCiytYilpFc8Gs274ewgaiZNQswrQY9KNpZpWI2aOR8Xexg0wKchcO6Ib
         RBKTfskRwnSoCRFloWDDaROi8gIR8BAAFEpUYFe+5rUnVu86TJR54DsFXBsTeyDwc70I
         GwP0qV5ml9+KUHLHREodxwag0jRiq6vhDQzDDouU3FSLu2VLYtwVvsxHf1tVMn/SYMYy
         4VWw==
X-Forwarded-Encrypted: i=1; AHgh+RrL6bHGBh5zyjuJwy/kYgXCyuQpYyMa2LETD7l/UN849NL3EKiKlWdVPHhOXnOpn3yGFr3lr0sSWDpHXOlw9tgV@lists.infradead.org
X-Gm-Message-State: AOJu0YyhqM8FZnSFHdIAFrjrEC6fQuym3Thtjnt/XlZ2Alw5Dp5Z1vbS
	EvuXw1hOov6IQ4C8Rnblkbu6mQM60w/od+htIaltVrhwhNzUUQJY6L+1
X-Gm-Gg: AR+sD13ADvQjKGD4yWIJL90f36pfXRIuq/75PMcTNVyovO3HdhdszWJecfUrI9V+JUy
	mVTw27V9pmehSByzYSuMFpEUm7fE4j1BBTjdzCOPD5pTDsX1BW0XWUYmw2/QoNfzxztcHv+hK+9
	IcDEy6fRk+i1yBk/VkWytYAhSl22uvw3a9Brmn7QrG3LqlX/p8YUVAUpgXqgXKTaqmzkrxMGRz6
	q5SnlQbxp8LFnk/0m8N9NRcL8zfNWBx2096YnwkfgCkLLEIc59lI5q3HHQoL+yoenFUg3lGpAHN
	zo9hKAwPRJ0ZqkKMTJbQmDCo+xa2ZJuQqPS5Fhk57Ft8fznEwGYHoCJ7YBLgYZgW80NamQDB67N
	8spLsLxPZF2gQfSAZtWNeO/8fjp8BJCgEbHVSaU4Y9cm/eUeKVRQBhWMkeLOSISne/SomAwfPKT
	oGL7HUcQZVXi8WS0pNrSFL0vxeAvqYWbmXgcTI3LjCFKHfBemTGByFiZmtHOycvWQ=
X-Received: by 2002:a17:90b:28cf:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-3903c5d321dmr44037109a91.14.1786385550593;
        Mon, 10 Aug 2026 11:12:30 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:30 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 17/34] dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:18 -0700
Message-ID: <72495a21d3eb7ef735400e1a52deb24f3e70c944.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_111231_674790_2EDEFDCD 
X-CRM114-Status: GOOD (  14.10  )
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
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..e6dfa1fc5e5a 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -461,8 +461,6 @@ struct d40_base;
  * @phy_chan: Pointer to physical channel which this instance runs on. If this
  * point is NULL, then the channel is not allocated.
  * @chan: DMA engine handle.
- * @tasklet: Tasklet that gets scheduled from interrupt context to complete a
- * transfer and call client callback.
  * @client: Cliented owned descriptor list.
  * @pending_queue: Submitted jobs, to be issued by issue_pending()
  * @active: Active descriptor.
@@ -489,7 +487,6 @@ struct d40_chan {
 	bool				 busy;
 	struct d40_phy_res		*phy_chan;
 	struct dma_chan			 chan;
-	struct tasklet_struct		 tasklet;
 	struct list_head		 client;
 	struct list_head		 pending_queue;
 	struct list_head		 active;
@@ -1587,13 +1584,13 @@ static void dma_tc_handle(struct d40_chan *d40c)
 	}
 
 	d40c->pending_tx++;
-	tasklet_schedule(&d40c->tasklet);
+	dmaengine_schedule_bh(&d40c->chan);
 
 }
 
-static void dma_tasklet(struct tasklet_struct *t)
+static void dma_tasklet(struct dma_chan *chan)
 {
-	struct d40_chan *d40c = from_tasklet(d40c, t, tasklet);
+	struct d40_chan *d40c = container_of(chan, struct d40_chan, chan);
 	struct d40_desc *d40d;
 	unsigned long flags;
 	bool callback_active;
@@ -1641,7 +1638,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 	d40c->pending_tx--;
 
 	if (d40c->pending_tx)
-		tasklet_schedule(&d40c->tasklet);
+		dmaengine_schedule_bh(&d40c->chan);
 
 	spin_unlock_irqrestore(&d40c->lock, flags);
 
@@ -2815,7 +2812,7 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
 		INIT_LIST_HEAD(&d40c->client);
 		INIT_LIST_HEAD(&d40c->prepare_queue);
 
-		tasklet_setup(&d40c->tasklet, dma_tasklet);
+		dmaengine_init_bh(&d40c->chan, dma_tasklet);
 
 		list_add_tail(&d40c->chan.device_node,
 			      &dma->channels);
-- 
2.43.0


