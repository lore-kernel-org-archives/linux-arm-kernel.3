Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F6BCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+x0Q9vKRabtFjaGXApa4amcI6ZA0EEYg48FTUvCHSCM=; b=Tyuj8/CyaZOdihqgTci4ckOnPL
	mOQ8L6TXhgROuBd24TJJ+s4nSmR1Y9xKga22Q/HHJunUhSIIk4H3ycGsHLrS6UST7aKUvl6v0o7mS
	TI3gM996kpLlm8a3UktXzxYyPfLWkzqt4/6WlFaPDQBuKfDHkXc39uWvFfKtJEEWy3hANTRpalJdf
	ryU/UiYKOq8HdY0GCnO4oGXug+ems85Y5ZFU9sxLZk1QBFOPZxZDLudcQ3jRndtcFYensQVwFiXpq
	JPKTDpmrzqZcLDxaGe61yNlwtqLsoQ/g7e/UiEZwbr0thTKnUIBAGwYNILK77qW++1EYW1cL8YebD
	7rWQIk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waU4h-000000028Jr-2GJS;
	Fri, 19 Jun 2026 07:55:39 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waU4f-000000028JB-1y8q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:55:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso13447815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855736; x=1782460536; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+x0Q9vKRabtFjaGXApa4amcI6ZA0EEYg48FTUvCHSCM=;
        b=jAbeC8VFR8DvhcjXfh4ypQlTMjGHIcT/Qp0bnaFAg7cE3TY/rhfYFfJm9C59sxO3ch
         1/NF4k7fGzJBt+1B90L7E/H4rX9elP6YrlILvSXSgkLePsQcnwWfG5Ebl6Iddvsnl25w
         I3F3qE5jntFs7/nghSeQxdSNMjwZ2qlngifZOEWZsLtPRC4sQS4+acnGHeBt9Zyzm1Rc
         ynMXEiFfuWsTZdcM6pnaBVoON/yVy6VZiAGVI9tHYu61SvWj6VQhrCskS7cjkyVeV2v6
         hwKOwXj2W5M6tabmG3rfzomkZPQ9rWAe1gOq2Tje4pNY3XT2YkzEPQF1yrr6Dajussfd
         KYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855736; x=1782460536;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+x0Q9vKRabtFjaGXApa4amcI6ZA0EEYg48FTUvCHSCM=;
        b=Ve6vuErHDO8eeVakAyXDCdph//9aD//G6rHYzSa1hkwaUBVk/P5Zo1EAL/FZi2VZDW
         oIROK/9iWu9/COvUOGM0vfqGh+ay9y8b4xjx4lv2cjfi6HJagHuw38YJz/8EF4Ym7tsU
         eH4KiO18cO5oSy9GGYwi7n60mD72RR6cL4mLhYWHdOEC8AR4UHuPQ71wiBMhshEAe4Lg
         zh1FmXcEdQ+hcYgWQTH3raAKmnKSm8q4emj9lgnkGtViKMTW3wvwbBGzA8mAfSwq7t/x
         /XBIqSOPV7HeYuwgfJu9wjjHazcSRjBYkGuQiA5aav3nEx3D+OQit3xPvuCUuIyyqyqT
         RXaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JR0XGJlwTLaZpU8D1gE64a57sCh5jA8nnhnl4vRgGBhBsl0DE74vmVTf7DUqlmBt2I5BkKncOxFHv5ZmJQ3wW@lists.infradead.org
X-Gm-Message-State: AOJu0YwX5u1VJHw7L7aST974Bqz76XBWkj4Kix2wS7RTciWOEeHeh+7g
	i2IwV28H16VcwXYbHmkJMJ7bYVCZkYBq0OyV5egyKxP2oP3Pg2Bcx8Hl
X-Gm-Gg: AfdE7cl5ogERs84LHUPXLcF8o5FMwkylqJrx9ZzuJKpxd5ZfHUKY6vVuVEYOpssjlti
	H+DfxvaQMscoJDuB/vgTwxpA0gCUsuq6uhf4q5akOBshrLHU2TOklMYW+CLmVd/FZ6xCgGYF9TJ
	BzAj4gxc9GZejOuJuen0KU2YGLtICapc2tbV4Iz6US+7kHVKSjOlLVwdWnH/QFbn+l7lHPXgxpR
	AZ54peFNUru83jjFt0h2m36qydrALWc9ayi3+6raaSXItVHYrz/j/WDPS3/qMHWa0V00apVwSeD
	Bi2IdNZmnrB5lBvr8FwFMpTZBt4tJghU+8BwFl/OgPWiEi7QcObZlgWD6U0Spawhh3Z1nI3Feyi
	8BEQelFVAZ1Y2Vn0KgSDIhLtW6XXu8GinbR3VrqVw3krnM2n/wFrspEJ//IvuDdJ1p+Oxt9FgjO
	iCUVWxqGUKVSH8pyg7
X-Received: by 2002:a17:902:cf06:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c718fe25a3mr28777415ad.20.1781855736340;
        Fri, 19 Jun 2026 00:55:36 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209bc296sm15297755ad.49.2026.06.19.00.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:55:36 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net v4] net: airoha: Fix skb->priority underflow in airoha_dev_select_queue()
Date: Fri, 19 Jun 2026 15:50:16 +0800
Message-ID: <178185573207.2378135.3729126358670287878@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_005537_509954_0C5A4836 
X-CRM114-Status: GOOD (  11.29  )
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

In airoha_dev_select_queue(), the expression:

  queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;

implicitly converts to unsigned arithmetic: when skb->priority is 0
(the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
and UINT_MAX % 8 = 7, routing default best-effort packets to the
highest-priority QoS queue. This causes QoS inversion where the
majority of traffic on a PON gateway starves actual high-priority
flows (VoIP, gaming, etc.).

The "- 1" offset was a leftover from the ETS offload implementation
that has since been removed. The correct mapping is a direct modulo:

  queue = skb->priority % AIROHA_NUM_QOS_QUEUES;

This maps priority 0 → queue 0 (lowest), priority 7 → queue 7
(highest), with higher priorities wrapping around. This is the
standard Linux sk_prio → HW queue mapping used by other drivers.

Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Wayen Yan <win847@gmail.com>
---
Changes in v4:
- Remove the "- 1" offset entirely as suggested by Lorenzo and Jakub.
  The offset was an ETS offload leftover; the correct mapping is a
  direct modulo of skb->priority to AIROHA_NUM_QOS_QUEUES, matching
  the standard Linux sk_prio → HW queue convention. (v3 used a
  ternary guard which addressed the underflow but kept the unneeded
  offset.)

Link: https://lore.kernel.org/netdev/20260617164448.31e189bc@kernel.org/
Link: https://lore.kernel.org/netdev/ajPCgH7E_ke6Fdur@lore-desk/

 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index d0c0c0ec8a..9ec3f22754 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1928,7 +1928,7 @@ static u16 airoha_dev_select_queue(struct net_device *dev, struct sk_buff *skb,
 	 */
 	channel = netdev_uses_dsa(dev) ? skb_get_queue_mapping(skb) : port->id;
 	channel = channel % AIROHA_NUM_QOS_CHANNELS;
-	queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES; /* QoS queue */
+	queue = skb->priority % AIROHA_NUM_QOS_QUEUES;
 	queue = channel * AIROHA_NUM_QOS_QUEUES + queue;

 	return queue < dev->num_tx_queues ? queue : 0;
--
2.51.0


