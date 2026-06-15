Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4738CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Date:Cc:To:From:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=an+NyJhpdAxSbgwZ0j7wPX1XyTG7T96Feh4LnwHfKms=; b=JyiCKEqlAwwZ3frrO5tQjw3NPE
	HZftRhBWDgMOVAB8MEAzECBhA2lwrEtDW6lwjmAQazLSooVaPgiFKVWSeb4C96M1GHoUWe3jVgfnv
	3XSF6PCBd0tBw2n4UZ1njTbjN7TjMwuutDpC25NQTN/kx0T7AstsbsvHxO59R1vyuvO1d23kKUc+e
	JenwCs9fnmLSjye6Z08/vSxKI4UuRJyWHbrOo3EtZFqNyaKMClJELbFGbTEXswnX0HhdFqxVZCK9Z
	vHEEmD5m0mTpFo0Sd+ZC0IzZFBN+WDVvD0Mb41CRBarxiqqf1G+ja6Vj/a3qTaW/VhVOB4N2wVnRt
	9OaHEYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6jn-0000000EEYR-0Hb7;
	Mon, 15 Jun 2026 12:48:23 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6jk-0000000EEXc-3QB1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:48:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8424b6792efso1325384b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781527699; x=1782132499; darn=lists.infradead.org;
        h=subject:date:cc:to:from:content-transfer-encoding:mime-version
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=an+NyJhpdAxSbgwZ0j7wPX1XyTG7T96Feh4LnwHfKms=;
        b=l4kBEL8nYbwz+q50OknIdGCvYb6wD3NLiuVYrLjiklRLDHIIPSs8HZ+OA43M6SWOG5
         TAtE4QTI/KtlNTIRFGwYSrjQxxyazw69duVAS/Gs9sWLCf0KKWuh7wn+EFZxA8O1x+G0
         jHkJL32yhCsgzFxalukBD/a+5JvBsP7LYwUXOUQzSbgNJp9SKHp13+byScME+eEZ9hrP
         HWHobqkmRl4xeQS8OuEQbkv4tU+3QSUw6G0Fq7LgU1LWOyvkO+XN4rRLc2KUWeQ9ee45
         UJHs5faY/fX+Ph0muBc4nP5EdKKTk6R692Y4UsdfYi32JBehMc/yEgQOHtFS3KpVvNeZ
         uLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527699; x=1782132499;
        h=subject:date:cc:to:from:content-transfer-encoding:mime-version
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=an+NyJhpdAxSbgwZ0j7wPX1XyTG7T96Feh4LnwHfKms=;
        b=q0D4s9p4dbIAb3Xhul6XRiVy5fxvBb15QJY/uK8fgV54XfBd3WutO454uBnC8rLTT7
         dZFn0bI66XHdXX9EnV7LV2Q9fTHyAsVYmNH/HH60XzzIVH60PNmG490ndelvWK5rNFHw
         4AL67l9qVNbDxFrdz0F56S/jtvGaWrGFfhpbuaTsXav5+tgUZdQQgbJM/uXylAk6C2B0
         A1FIT52/+p4AdxHem3ZTUATVBW+hi4P1AJBGL+Q/bZpBw2OPYZYvzJKvhjpeEaX1rm3u
         AA97nc6Xv1LVhTxETZPEOTjHJoOoo7SYy5RZpigA4ftUp57oQh5FdTdyopBaDaor+zV6
         hAkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8L2R1XnS7m9rewe+PeiBlYYXVkdjxBWiGQavbqyZfXR1i9DnOHou/O4WTERSw7PEEmCm9U976lHlaRsgsT63gD@lists.infradead.org
X-Gm-Message-State: AOJu0YxdIo90ZDoIWqNLWVk2rxvc4A24kkJFT6TNgAPDMBS2zXOAqBDY
	Gv1B0NJDkB7DKvAVHa8dTvtHaXDHmKN4oW8s7snNg6V6gGxEYS9Wnkr0
X-Gm-Gg: Acq92OHzDJ08iFXjJU0mRo36iwZN0zgk/qvEy5jn7F/mk5P6JIa96ZIAEAobCtaKAcZ
	OjjwpiznM3tjSx8HE7O+UsHivk0ZPgtVF6fw2DVLWi1bGdfp1favhcyn92uvdDumxnRm0xzfxD/
	oxIhWYQJQyh6HJ4j8n/Vuo78/83L4Wd6vwSLdaj61MStrntJUZ4f1UHH4INI9rheVm2AbRHJGcF
	yxkaiC6dCdj6eTYxUlMaadN8LoI3TLd2Bi22gbbyb7Dxwt9ZayVenYz8zGm+BbfY7bIIt7HvVcQ
	HX0WvrYHGjEyfccsIZ3bs2cXLCUPbYOdaQ1ixxUnxnzDUU2JcQFMVLqvKlJ+iTRuvibSEHHT1T0
	1z0iORRxH3O9aI5TPDwJ6VJDn6bloOtXeqVChHgx+D82pAVVHDkbc51kuNJc083UZEufFlS87Pq
	g0rKwf6AZqTpxRz7+b0vg=
X-Received: by 2002:a05:6a00:23d4:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-844e193a3aamr10771235b3a.7.1781527699379;
        Mon, 15 Jun 2026 05:48:19 -0700 (PDT)
Received: from [127.0.1.1] ([58.240.122.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acffd04sm9949954b3a.26.2026.06.15.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:48:19 -0700 (PDT)
Message-ID: <6a2ff493.5934d26d.389ef4.d16d@mx.google.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 15 Jun 2026 20:48:13 +0800
Subject: [PATCH net v2] net: airoha: Fix skb->priority underflow in
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_054820_845889_EC708051 
X-CRM114-Status: GOOD (  11.82  )
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

From b894fc031e307f1b6756ea9fcac98e82e23815e1 Mon Sep 17 00:00:00 2001
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 07:30:54 +0800
Subject: [PATCH net v2] net: airoha: Fix skb->priority underflow in
 airoha_dev_select_queue()

In airoha_dev_select_queue(), the expression:

  queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;

implicitly converts to unsigned arithmetic: when skb->priority is 0
(the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
and UINT_MAX % 8 = 7, routing default best-effort packets to the
highest-priority QoS queue. This causes QoS inversion where the
majority of traffic on a PON gateway starves actual high-priority
flows (VoIP, gaming, etc.).

Fix by guarding the subtraction: when priority is 0, map to queue 0
(lowest priority), otherwise apply the original (priority - 1) % 8
mapping.

Fixes: 2b288b81560b ("net: airoha: Introduce ndo_select_queue callback")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Wayen <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..d476ef83c3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1933,7 +1933,7 @@ static u16 airoha_dev_select_queue(struct net_device *dev, struct sk_buff *skb,
 	 */
 	channel = netdev_uses_dsa(dev) ? skb_get_queue_mapping(skb) : port->id;
 	channel = channel % AIROHA_NUM_QOS_CHANNELS;
-	queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES; /* QoS queue */
+	queue = skb->priority ? (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES : 0;
 	queue = channel * AIROHA_NUM_QOS_QUEUES + queue;
 
 	return queue < dev->num_tx_queues ? queue : 0;
-- 
2.51.0


