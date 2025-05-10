Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A555C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 13:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPNtmFJxQ6qfkaV/7sUcFpQ7Up10ht/uIC/UAoosXBs=; b=EG01NPULZ7w1tfIxupxM06A67O
	76GyvujPFSWt493Q62arYGR0GQCqe2Kd8Y8t/RdjNvE2IpdxpS+QXW7DNsB/m3Dx64pm8gv1yt/dt
	Hrfd59tPI1dgPWhgkIUqyPErfTqWrT6ktSh+IzUTe7xI0JDUsK5wmvRNOC+GJsyzSbHp1YBto5wU4
	gaqLTx/JXLhyw3ovF8MGhgkUrIOcKNr/qLIDu+y/GD7lMta53+L6IPV0AE13GCS1j8UEh+Bb3Z9oC
	+mAyNMQGvFK1Gham3qHLfMbCjvAuzsHiE/LlfyJuL++L/PdfUL4rYK5P48jCyZqDaDf0khltWg3tj
	k4C1ipZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDkhD-000000060WM-1bod;
	Sat, 10 May 2025 13:56:55 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDkZA-00000005znR-34FT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 13:48:41 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7399838db7fso3012586b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 06:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746884916; x=1747489716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPNtmFJxQ6qfkaV/7sUcFpQ7Up10ht/uIC/UAoosXBs=;
        b=bYNxZiqgiS9Hmc80MSPt+Q++Nw9r9Z40YfvVtigEkUCiqR7uvwKNkReNLwvyqeiiLG
         q4eu1jN4hbml6KQMcasIIHXfhUXqh+w7Bgl5ipPxIkz6FIP+QYbMN2HZhl6rXdBN5BqC
         zRDjnhpOlbFri/6l/a21GjHbP51jDUH+kd2dog0Th8VG2K0JGLEMuqMHpOINWtvUbwGZ
         lpjGW2DO4wcVBCrqMnvnK94bcJpdE/7jEolqNPVmmlroJ/XGNSrpajfamKQIY2k/A2b/
         AP1uGub6giEQh1DTxENgHoaUqHFy99jPVOqvZ+GjY40BxrH9vN1iJFo7kypVPH7Kdq31
         vg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746884916; x=1747489716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPNtmFJxQ6qfkaV/7sUcFpQ7Up10ht/uIC/UAoosXBs=;
        b=pAL5mDRgIf4ZoSuONn9T3z9SWszYKm+5FWa5eF4MorkJWXdOjrU1h6cV/tWPaMEn/s
         pt2dCJRu/cLgOAXnVg5KBHfJtvrZoZ4dyI+b6SpXyUYeo+6wnfu6mAZYoJp6VTYpIOYC
         ktwHQNccRy13yzbyhu7yhA9/VRwDWWi1rH8EhXwEHkC9jNvQ6rQsFqOFtWq6wMKP37xb
         PnqiLoF8Tfse6F06+TwyBgPOyogtA1OFg4khiz2ic0DZY/xgwrMfQdqmU03RpTk5OJlO
         du3kRShc8000R+EFsSiy4O8GUnBY9I3EqjXKbk0qlat2apQgbr+ZEzzK1KhLtc3zd0W7
         qhjA==
X-Gm-Message-State: AOJu0YxKjkUV/6PFiKm+bwdICER/bgIpZFFKtoMX0ODiTFUZoP/GwcWZ
	jCbuB6Pnwc5l6HGKE0XHM9SG+CISBA47RCFDcPSrLISrB8zfk1HG
X-Gm-Gg: ASbGncs11b6k851RmS3qqLRBp9sh5lOzivEGBU+xhHL2bg9FbAtdA98oWmjmXLfPdD4
	cb/iSB3UVGuhieemxVb+GqNsVo7syYOP3Pe7rDFWDDkF2BA8vgBKkf7OSmGBMIcMpw9xdE7/EWL
	KFmSCPzRJJC2iKTMV+EUvIeugxupYXY0LahhfWvO6S74s4+Ex/HYjczc81/jAALa/NFazdWmF7W
	f0pfppiNI0ltHwKXpHEcyKYaugA7DIMhKj1kxV181s+C4EgcARVNMyHOwUnfeZuiVPdhHNtqkLg
	7cbSUII6HtVGzBBqQwyqnEznnXGJpmV7Fs3wCsrRkzUbBfa4mFWaOPntoJo+nkcXciUXrTsCOvE
	Ak9TAlaOyPp1GXg==
X-Google-Smtp-Source: AGHT+IH9EOAr3sj5GMToa8RFMVGWPuFZ626Vwp9kQBaou2wEWvAFIFPcR7SdOshO8pN0E64g87eTdg==
X-Received: by 2002:a05:6a00:138a:b0:73c:3f2e:5df5 with SMTP id d2e1a72fcca58-7423c06f4b4mr9918280b3a.9.1746884915850;
        Sat, 10 May 2025 06:48:35 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([114.253.36.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423773939fsm3360424b3a.62.2025.05.10.06.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 06:48:35 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: tariqt@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemdebruijn.kernel@gmail.com,
	irusskikh@marvell.com,
	bharat@chelsio.com,
	ayush.sawal@chelsio.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net-next v2 3/3] net: stmmac: generate software timestamp just before the doorbell
Date: Sat, 10 May 2025 21:48:12 +0800
Message-Id: <20250510134812.48199-4-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250510134812.48199-1-kerneljasonxing@gmail.com>
References: <20250510134812.48199-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_064836_769765_A6A86115 
X-CRM114-Status: GOOD (  13.06  )
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

From: Jason Xing <kernelxing@tencent.com>

Make sure the call of skb_tx_timestamp is as close as possbile to the
doorbell.

The patch also adjusts the order of setting SKBTX_IN_PROGRESS and
generate software timestamp so that without SOF_TIMESTAMPING_OPT_TX_SWHW
being set the software and hardware timestamps will not appear in the
error queue of socket nearly at the same time (Please see __skb_tstamp_tx()).

Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 28b62bd73e23..4446599ba6ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4497,8 +4497,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (priv->sarc_type)
 		stmmac_set_desc_sarc(priv, first, priv->sarc_type);
 
-	skb_tx_timestamp(skb);
-
 	if (unlikely((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
 		     priv->hwts_tx_en)) {
 		/* declare that device is doing timestamping */
@@ -4531,6 +4529,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	netdev_tx_sent_queue(netdev_get_tx_queue(dev, queue), skb->len);
+	skb_tx_timestamp(skb);
 
 	stmmac_flush_tx_descriptors(priv, queue);
 	stmmac_tx_timer_arm(priv, queue);
@@ -4774,8 +4773,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (priv->sarc_type)
 		stmmac_set_desc_sarc(priv, first, priv->sarc_type);
 
-	skb_tx_timestamp(skb);
-
 	/* Ready to fill the first descriptor and set the OWN bit w/o any
 	 * problems because all the descriptors are actually ready to be
 	 * passed to the DMA engine.
@@ -4822,7 +4819,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	netdev_tx_sent_queue(netdev_get_tx_queue(dev, queue), skb->len);
 
 	stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
-
+	skb_tx_timestamp(skb);
 	stmmac_flush_tx_descriptors(priv, queue);
 	stmmac_tx_timer_arm(priv, queue);
 
-- 
2.43.5


