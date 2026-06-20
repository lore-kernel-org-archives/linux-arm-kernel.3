Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43716CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uZHSWLvj9OPXqYMo+gcDi1m2qcLBOu8zkp0WPfo48s8=; b=Q7Po2uBX+juw3TVsSyepWh8/yT
	dkRKgwUDP7jWWAJ+7M/IK1hoPhnWjxxBrdG0rQ9iCSlJQ2LkYgaSk7r+fBSnCnX5BodsEOFVLIh+c
	+d9T9eWug9tdBDOsS3Hl0KaUmyVYQ5c+ffRv8gYTSP8e3EjmKA4HBmObOKClUaKjbUOcRkYYMjhmo
	7QlBN+cE14qyci+U42KEOviHuwygz5v2Et7J+/HaJFMM1amSQAo2UzGtYMyR7NHCJv4yLoblMcq3v
	OuHZ1ULgQlkeuM9+axHgc9WXjw0v36NYKMBwWd1hkPpWVwbJYjV1nXYjO1DIf6eSw08GjE6IXU+Mv
	OdPSWOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waqx2-00000003F5d-1t9f;
	Sat, 20 Jun 2026 08:21:16 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waqwz-00000003F4v-2NH6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 08:21:15 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-36b8d414666so1519969a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781943672; x=1782548472; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uZHSWLvj9OPXqYMo+gcDi1m2qcLBOu8zkp0WPfo48s8=;
        b=CcU6pgmds+apkAPRorY3CsdIEFjMLAnUKYog7wI9rSCobHLICRJGoNAETQszUtAovJ
         py1+jc3w8JcLeGk//EPo/7U0/CyZJq0V2D5fQdSwhDsPX1OGHxA9Y+y0juhBNdhjipj1
         bfdu9v2lnU+b/rOW0NY5NxdPdv4HpPPWj5ZtgopEFN1Sb7QVWnuIuJhQq58BOGg+ow0J
         Xa9I7r5JRZensClrsZPp51U88ldsGLDIk/Bd3hIQ1IWgn+3+dhjdESX9SKeJYqCzJy6V
         FBXLOgB3UWGgyu59IgAxO+JV8wMMKF9qnkx5dPZzhARRLuNPpuooYJjFLW/nIvT1OFYJ
         zadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781943673; x=1782548473;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZHSWLvj9OPXqYMo+gcDi1m2qcLBOu8zkp0WPfo48s8=;
        b=LVgZmDovk7GdQ3hzd5hAKRKKaGt0Sl2ODNaAS4c2FLqmOxtw3HKxtGVZcESOcMqoeo
         JvJcfSHYjEItPsEwvUdMWrWYPGWpUcoXx1QP3aet2wenVAJfWywN88fKab4q70BG44it
         C//aWrbsAD/9IbIjKmaIoieR7xrVE/yBXDpriIDJ+23Kh9Qjk3HCE9ncn3p+T7FXYnVE
         H5wohpvsl2v5eoPfu6Un/bGPuqnidoON0jzm+0pEqU2nhUZYNlsqsF1C1kzUBtklq49H
         zVPztLEmv6wJT0h6qtnXP7JzttshFvEXen71iYD7oGTR41mgzMABOiOKNIuJFUyebEI/
         Zw5w==
X-Forwarded-Encrypted: i=1; AFNElJ9VofySrvPTncwGun2GVr3imOe1fsPdaygyaGrv96Bl+jaFDEpNnWH+314h8EDmMqmlNvNvNBIVvQcsUIfV7DO5@lists.infradead.org
X-Gm-Message-State: AOJu0YxJPH2O/hNbfzF1C/MtWyVupPNAn//Rv7CoL0otizY9Fue3/BLy
	Raur7FymK0BBvg0v7F4vxsOW0q1QRhzm2Lq5+sxeGi+EywoaCOJBZ0hj
X-Gm-Gg: AfdE7cmx7wQKtnzoYXBU3FVYHSOgYNzMtLNcEDlvoEWLBlVf6NV4lmJZD4CW7sP8GxI
	XXHZNGbTABvQa16WeBt7cawhVDYgtr8qk7o2hvg21gwkTTjsmS2GbgkYqz8IUS6I1G7iA8iqJwv
	FJ3tZhx8nFQME8DQzPWUW4pm+Zc+Lnq/FQUJwwegDJtBpJd06UnhJiz6xxIhrBjcgqnYSS2BOLJ
	cXBpJd7SYrnTUqQT18CMGhK70aNyyUQUMSJe3nRfSFjP3T3bZUGROi6tlAsIEOhYvEuvdzysjob
	rD8r0PwZLN8qNmBwvhci6ldivXEX2kYyJDjob/LhgMeCkA4jIRM0mLBOF5CKkEcqJHkQIZss0DG
	gasVDskwIAdvPYb41bnivvDve7rCA4/9QjRNnPIpZczev+hP4UroGxwFOQVocrpnpn1yqEYFegR
	2dQoWPtQ==
X-Received: by 2002:a17:90b:5884:b0:37c:806b:3ca7 with SMTP id 98e67ed59e1d1-37d4d71d969mr2357014a91.3.1781943672584;
        Sat, 20 Jun 2026 01:21:12 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bbffc2329sm1786971a12.0.2026.06.20.01.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 01:21:11 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Joe Damato <joe@dama.to>
Subject: [PATCH net v5] net: airoha: Fix skb->priority underflow in airoha_dev_select_queue()
Date: Sat, 20 Jun 2026 16:17:44 +0800
Message-ID: <178194366700.2485734.5368768965976693502@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_012113_639395_48E58099 
X-CRM114-Status: GOOD (  10.56  )
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
Link: https://lore.kernel.org/netdev/178185573207.2378135.3729126358670287878@gmail.com/
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: Joe Damato <joe@dama.to>
---
Changes in v5:
- Rebase on net/main (previous version was incorrectly based on
  net-next/origin/master, causing Patchwork CI apply failure).

Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 64dde6464f3f..3370c3df7c10 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2110,7 +2110,7 @@ static u16 airoha_dev_select_queue(struct net_device *netdev,
 	 */
 	channel = netdev_uses_dsa(netdev) ? skb_get_queue_mapping(skb) : port->id;
 	channel = channel % AIROHA_NUM_QOS_CHANNELS;
-	queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES; /* QoS queue */
+	queue = skb->priority % AIROHA_NUM_QOS_QUEUES;
 	queue = channel * AIROHA_NUM_QOS_QUEUES + queue;
 
 	return queue < netdev->num_tx_queues ? queue : 0;
-- 
2.51.0



