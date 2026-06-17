Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43197CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 03:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PNRRDdQAg6OTo/rPWnE2gKXvJ32DvRz3h1z/Jd46StI=; b=HdvSfFv0BQfS3vzNZoJV2xvfeP
	4c9eOq8aZ8e9XwLkwT4HEbTv/8apAFcW/lOfNK8rp2TiposJxSn2jdqFoEGEmFgIxIXA4XuBAdKKz
	dFDo1H+GDcXE8J0YmBrS6sZVe9RpwtQFhF7a1GwxuojogUsDSpBXIrR2iHPuFLWMic+IBgCXKlshX
	fGXZhecI55dyuBbYTWyQmwyh7CJOi9q/Bsiv6kkNPUxyNLYzBbAIo5ap+BbcMWJPLlcJzpAHJql7X
	l5s0/WFVJ/eczlxr9qfCV2JonXQEDSmeNs/ry6tH9H+so+b5Q2QZjvSJZtCyvLBJL/C/u7TVLTY9s
	zQ+KS8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgzR-0000000GYmk-358A;
	Wed, 17 Jun 2026 03:30:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgzP-0000000GYm5-0hSM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 03:30:56 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-842288702fbso2501779b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 20:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781667054; x=1782271854; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PNRRDdQAg6OTo/rPWnE2gKXvJ32DvRz3h1z/Jd46StI=;
        b=CkmouPpVleYV7lSt+bdi96J8/pzOkOQHDJjzDHWtJAwY8CYr3SoE47Xfwoyv7h8JVz
         74BslZcYmDPOijiAuv31Gt5PsOwNpySR2fbSdMFpjmWN46BiKDq7kx+yY4bpG7CidgXk
         Pgk0iMq3cXAg4HR+alo1+kqhBp+huu4Ha8dTgFCRest0AhVQKOlKw+F68veRrUbyosOq
         24TL53Uulb8VRO9N1k9Qjm24Oo8gAIJMeE4DQZd7fxkJR9SDwXtPiPDq9TwL8pD1hEs0
         kADn6hRuZmlHUOo9oQ0kt0x0VpoeiQeg8nya1IkPbliZfRGr3hNf8ZVmRjafGf0+JsmP
         KRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781667054; x=1782271854;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNRRDdQAg6OTo/rPWnE2gKXvJ32DvRz3h1z/Jd46StI=;
        b=hqnMybuZq6rMfP6MjH8LMgQ2YELK/6SJtoJOEfRGqvroiSnI64nsPWrjvNQZHnJ57n
         CfExr1i925KKRGYZeep3Kv9H/4W08pGgGnViDZ/S6rMSvk1CjU13dDj0Q4WYXPB78eAD
         gDmuSF9gy0mj4hKAUlW+S/Ok7FhafSlNd5xpYF/aBUlpokp3sUV7tHc4W/e2ODkpJ9cC
         aXu7sBMlUVa9PPDrsFppHFcvZYTYt0k3K9J3wyPbnFc0NQ5e4fYnDEIa8ap+zGgvDrE0
         Y/xpRbwhmoX2JqPnYXu24t1hq1myEiZStxUCIFXPOaHNOc2hzrEq/rg/2uLAowBQERq7
         /CUg==
X-Forwarded-Encrypted: i=1; AFNElJ8b4F2w9Ms9FEPGjnHuAXqmyWV9RhqS8fNfaQoTaCxt3foGWhNlIDBwu7ZAUw9hodHfzR2VE/zDd31PYENkA5gs@lists.infradead.org
X-Gm-Message-State: AOJu0YxL7GewwAyg/xcNKz1NBGFvHHvhUj7rGZoVXbOvUvIMLtstHO1R
	qsE1ho3r79tSTQ7GK1NsM0bPAexyOcRAG5n3Vb2swZVWxeWirbOA07QW
X-Gm-Gg: Acq92OHn4cHG7Bz0jXRSSHW/ERaw57aTkHjADIXjAAOA6jTt6YCcy/rMIB/ED2s1KK+
	6mPNMpcIs8Dm4UZmjZVIQe8rQ8tIlHxoFGgzHQMzrcWRWesaIdg1mg/DhVficxsPffq1j9Au8Vc
	oOaC4Vver0aCtym7Rh20LS62IHWSWQy8bp98bktIV8trJ5wKg85Oq/J0lifjVS5rK59Cx/ualI2
	r6Midz59yZXAjwNGJa4idTUZfKvmOoraCzkFFME/5PuDEEGcvrGloJl1JSd5PdoTJgoTP/B2BfJ
	Lx09cLxWicH6mJ0fOaADYVBabbpKrn4uH+Mp+1UZwH3Z8/xAaM2Q5z1ahkpVaynsgIPnGtZxe0v
	nRNcLa9y3qkmQh+ynnTlUhq7YvD7QairOha8G0n6qWwhfe3f9vLisI7DIw/5A1BL0U8+g0DdAVv
	pXR2YtMw==
X-Received: by 2002:a05:6a21:4903:b0:3b4:870e:6f44 with SMTP id adf61e73a8af0-3b8be9b197cmr1944323637.35.1781667053893;
        Tue, 16 Jun 2026 20:30:53 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ccafsm13070205a12.2.2026.06.16.20.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 20:30:53 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: airoha: Fix TX scheduler queue mask loop upper bound
Date: Wed, 17 Jun 2026 11:20:10 +0800
Message-ID: <178166704952.2212140.11002626760717132754@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_203055_212548_910C19AD 
X-CRM114-Status: GOOD (  10.57  )
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

In airoha_qdma_set_chan_tx_sched(), the loop clearing queue mask was
using AIROHA_NUM_TX_RING (32) instead of AIROHA_NUM_QOS_QUEUES (8).

Each channel has 8 queues, and TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i)
computes BIT(i + (channel * 8)). With i ranging 0..31, this causes:
- channel 0: clears bit 0..31 (all 4 channels) instead of 0..7
- channel 1: clears bit 8..31 (channels 1-3) instead of 8..15
- channel 2: clears bit 16..31 (channels 2-3) instead of 16..23
- channel 3: clears bit 24..31 (channel 3 only) - correct by accident

While BIT(32+) on arm64 produces 64-bit values truncated to 0 in u32
mask parameter, the loop still incorrectly clears queues within the
same channel beyond queue 7.

Fix by using AIROHA_NUM_QOS_QUEUES (8) as the loop upper bound.

Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..a1eda13400 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2217,7 +2217,7 @@ static int airoha_qdma_set_chan_tx_sched(struct net_device *dev,
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	int i;
 
-	for (i = 0; i < AIROHA_NUM_TX_RING; i++)
+	for (i = 0; i < AIROHA_NUM_QOS_QUEUES; i++)
 		airoha_qdma_clear(port->qdma, REG_QUEUE_CLOSE_CFG(channel),
 				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));
 
-- 
2.51.0



