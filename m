Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0470ACD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R6rJ2lBTSRBiSi/3hBuK1toMuKkxHnWeZuud2dPMa4c=; b=PJkK21mDO8GcCJ3RbiXS0Xws8P
	d+mvimhCGa6GKFRnVMqP8B40btSAZVCmdPCgxF1ASlYcVfTbQyy+AGvBCPKK0jjrg6kdS1Fxyifsc
	modx3GjcBtn4jTo1hXYPGSQkoUWKXV6EBS9DUE0HzJJYivBOjHJXbOp1/DHnsmZmQVVxejqQxNGQ5
	Y+FI+mdveJNgV+eEwL1T9zHtZWvZHZYUqISUtBKZ8DJb+trhgn/Fmv5zalTjbEUKFJG2XiGKrWabo
	DlOFobKLVeiWFkMmlRO13VfunmWudolLfTR4d5MEfcwi5Y2WFLkodQPBOTt7dwTOtYePiwy2LH36V
	KUvknn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSUd-0000000FjUM-2q0C;
	Tue, 16 Jun 2026 12:02:11 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSUb-0000000FjTf-1HJK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:02:10 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8423610ec93so3741654b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781611328; x=1782216128; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R6rJ2lBTSRBiSi/3hBuK1toMuKkxHnWeZuud2dPMa4c=;
        b=Sl4THNJA2rO16D7TD5brQ+RabfAHVVJDtE39JBTBKvK91tPMQucOy/1at9edz5ARA8
         JqTW7FnelHhygOiVx6v2DA7sgd1frcHFy2lxkhi/TBujWfrfPj+sJFohHXWK+h4dIU1P
         XWH/t04ovywoH1n09MWaBUNSADia7aEO/09dyiQxuTI/GdVVTKgp3AleWbZJRV+B3xaP
         wa0+IbdE5+/nItX+FBFwoeJaKdHXpqSCi5Gwxb35nV89Nk+kem3DWUvC2z/9yXVpFxii
         0mxwxVF4cEWl5/eNoX9vyzIwgwhlaVxZW60glSI0aMJBkY3cHx7w5QbvHw91NP3g/2aC
         hv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611328; x=1782216128;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6rJ2lBTSRBiSi/3hBuK1toMuKkxHnWeZuud2dPMa4c=;
        b=Gm24hti6+V5cq0mut7v4TUfQ9eXTWJL9+qTt3MpqRmQL1xF7kxB3+DdvRSWu4WpINO
         20Ha4dBojM1RBMfZEEv+dIIO+80/whXfdy8buXy3pBHy/PfThYSKCvAFFoQtqlRPb5Ct
         OH3uf6Jp+Robwkvd667KTFtjbJjo1UMPhOzFkzrvvmCl3EeGiAfvvEkGWWxZ+c1ivIAL
         rN6/Eq9kHKQ+emxtA3Nu1xMGYcgpFBP2PirgfMgoiB9BmRJinCSuuCsuTk+hxBij3jGK
         dooUu2V9sqchXcAsdRrM9B+eMi+pKSRM3oqgozLmnm/+XBjBS3r40JMokv6pcUuap9Hp
         hUIA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZHkI2Qb81EVHEaA/+iHEKgGPGoYRaRthiwhupqgHha7xSYOVFafIpNnQ+m9ti5JK1LrH1ZQ3hl1C4xdZmKq0P@lists.infradead.org
X-Gm-Message-State: AOJu0YyzPhHVAXq4YF/W0nhGCh0hZzYFpl7qF8Nonp26AlM+QIvCxwYN
	UZHij9enK08S0Suoryh76nWW8LA5DaExNN0yyV7GRvIpwzU/omKXisW+P9ZpeU86yR5c9A==
X-Gm-Gg: Acq92OFmlSbicoYOh+AOQSQvXGv/7zfMlGgzZ4oRqDz5S7CBvwyWehY2PrDsqhtX3Gv
	UiJwKeXO2jeU1trSsdBD85c1PAqwiOu11T8p5aqtmHzJpoMNGw6AyxBd0WN7X9t2SGfdyZ9o6kT
	jOvEC9iuXzTd0b+34VocvYDwdTBffO1axGOlQ7MoEwAnlP3X74Lr0xrUdV+vomUACrdPT+PnFHD
	Y2vZnqrh2kxAT9vsTG/XT+CEJ2S85lBmnA7i+Y5h02tPHaeSCsXPB5ae+hMNNd8FlkB/2Eavfb8
	S8MCul2xrUjTLpKDmGKy5G8MlVAk5f4mNgdykSigtY+JdNdfLfdY9+KowulVkEFIqHQ6oc5f4Mh
	FdCQdHRMznkzVpSV9fThIGxPAQJboBp572QmKUFu8pLBmDDxRHCVRQR+ClSU9vxRXE7ARuCHJMN
	Lvx7ZlfvvVgKOIxcy9
X-Received: by 2002:a05:6a00:993:b0:83a:4846:90bf with SMTP id d2e1a72fcca58-8451566da92mr3284092b3a.43.1781611328433;
        Tue, 16 Jun 2026 05:02:08 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9bfe1sm13341635b3a.12.2026.06.16.05.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:02:08 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2] [net] net: airoha: Fix QoS counter configuration for Tx-fwd channels
Date: Tue, 16 Jun 2026 18:50:29 +0800
Message-ID: <178161132384.2164449.18407700117859190327@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_050209_335936_BD8A9345 
X-CRM114-Status: UNSURE (   9.85  )
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

In airoha_qdma_init_qos_stats(), the Tx-fwd counter was incorrectly
using register index (i << 1) instead of ((i << 1) + 1). This caused
the Tx-fwd configuration to overwrite the Tx-cpu configuration for
each QoS channel, resulting in incorrect QoS statistics.

Fix by using the correct register index ((i << 1) + 1) for Tx-fwd
counter configuration.

Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..329988a840 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1256,7 +1256,7 @@ static void airoha_qdma_init_qos_stats(struct airoha_qdma *qdma)
 			       FIELD_PREP(CNTR_CHAN_MASK, i));
 		/* Tx-fwd transferred count */
 		airoha_qdma_wr(qdma, REG_CNTR_VAL((i << 1) + 1), 0);
-		airoha_qdma_wr(qdma, REG_CNTR_CFG(i << 1),
+		airoha_qdma_wr(qdma, REG_CNTR_CFG((i << 1) + 1),
 			       CNTR_EN_MASK | CNTR_ALL_QUEUE_EN_MASK |
 			       CNTR_ALL_DSCP_RING_EN_MASK |
 			       FIELD_PREP(CNTR_SRC_MASK, 1) |
-- 
2.51.0



