Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95737C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 03:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STwC2IS6exLI0zzWU7M54ip6dOGrQ7MtK7OABGaeWUU=; b=TQXJoxdiZ9v6mGUQUbD1wAGaVv
	GuI/96NbircrfnALNmsvFkh0GteyFBr2tC0HuRQqugP5jDT2wLtb2XQ2qhrGLOQLE02BnUn3jlsv7
	i+SnTr+2nPSaVKBJPdPmDCWoxVfPC5fGRVyOC2CrK0aAas2vgS5L9jfq6ST7t3HG0DccXJ+kZeIFh
	I7lf2FJtNfR9+bvC9/7l1UOOXcanLzZFfrupy/iafN1nn8NDuLWbiZw2BF88hFdxAzPevOnimfyPn
	HHN7Z+uvjYRLuMMD6HZrTDrz8T8jjuMy5rh+PpxCW621HBAlEX+bUh6mGotWtxVwB0iPHWCnWwEm+
	85TW1Zpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCs8u-0000000HEjX-0ydT;
	Thu, 08 May 2025 03:41:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCs1I-0000000HDzd-1LK9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 03:34:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22e033a3a07so6915485ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 20:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746675239; x=1747280039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STwC2IS6exLI0zzWU7M54ip6dOGrQ7MtK7OABGaeWUU=;
        b=id07nsa7LCy0putwCwKI+/C71wmOiNRW967eTOeiqB4cgWxiva/X8r0EPDJ9Z30nu0
         xMbojTPcn2BEpgw3UPbuaM1ev6u6PQExbm2S8IC+0KCm0+Odfla/S+CxrnjN44iKeVKN
         S6QWbYQMPsmB8fL6Cj46e2/s9Nd9fgMFpH0fVkvqLsjaDKSfQcW1PhHJwEGgkJ3hFU7D
         CjHQseqx3q3k5qFRtLsPEYZB+YnKw5/IuGlxkN5nqYR65pFvvuxpZB7IdlTDHoozazCL
         /nc7d2UR6wFGFXJ81LunNRXKwEH18W0Kvs7UAZ6AjkGIfIEJxuWimJceisq72stadcro
         bBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746675239; x=1747280039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STwC2IS6exLI0zzWU7M54ip6dOGrQ7MtK7OABGaeWUU=;
        b=FnINBcBQVI0vAfOq7XVdvuw2E0M6fOd79MeLxGkaNUvfs/hGfWIPfdco5j1smleAXn
         fC8pTXRLwFA82z88DGXHGyKDlrXnsvvsCHrew6Tje+RkinHRlTTFpNm4wgy5EMwJFFv+
         C45KDE30twPau33UfU515cMHpbsZzUJEzEekvfrHZPJx38+h/kkPUflBBVH5LHSXM3yl
         +VtxiPn9aFktORqORN5kvt0vRn3aXth5rboSG7L+Cng19apZP1Wn+AWVRkE0YaNJNIm7
         LPdOeSNtpNupz/fWjB9+eFQEgcdeJ/Vw3byXzM8IdTLmYImUTIdF0rjAck1aczIe588R
         VfUw==
X-Forwarded-Encrypted: i=1; AJvYcCUw/hzJ0ckgIoAsV5TaCYyGKuqKgsbBLaANZ1NtrpqpzSI1cHUPe0zdsIDEOQZaPc2sRpMlc3/TlFISCfFm2585@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd1v8pPW44c3HtkwNDrBAQu1wT/Iuuw2lTQJGsnCyNry/L5jZt
	RsDULqTjYt92dnZfWsWprszxQHOvuZopHOQGnLstLIhsuJYXjmiL
X-Gm-Gg: ASbGncvgWuAMl8sKriQWJ+U6SHtoAo9rob+KEoCpiTyV0okcblptAEiT+FadmWARoaw
	9lOCFf2sJRQD0hnL9KRH9E8VI6SsAQolEpUh8kyGyzUNosUIQS5O4J7G5GyfI5efoEN24O2Rcv3
	ZuDR9AVqgf029Mn1XnJ2mKUTTJODpjGDi0TVIjofTb1CRjdxYUOi8fjXaBMnpd6yXiM6+bOmPq6
	o+TxppUaWgfJLZEVr5+HthUT1m061ARinU1Ly3oPtL4MpuygmG77zFJWP6E0lu2CudinTVWTDrO
	7YN9vIwD+tEe7DFiA83+rTOG0dluspH3RnjESY6hhC86hvYIJIQjITi6jwxb8x3lpg9/C2qFZ5I
	OvYdcYS2OvuZq
X-Google-Smtp-Source: AGHT+IFNBu+spPs6hHuGIkVh1YINLq4WHn7KOys95hSNq9ZK93KPikPLdTAtOZWgFL0dDvNhanikHA==
X-Received: by 2002:a17:902:ecc6:b0:224:1d1c:8837 with SMTP id d9443c01a7336-22e5ea3b7c4mr96108705ad.19.1746675239438;
        Wed, 07 May 2025 20:33:59 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ffdsm101685265ad.179.2025.05.07.20.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 20:33:59 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: irusskikh@marvell.com,
	andrew+netdev@lunn.ch,
	bharat@chelsio.com,
	ayush.sawal@chelsio.com,
	horatiu.vultur@microchip.com,
	UNGLinuxDriver@microchip.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sgoutham@marvell.com,
	willemb@google.com
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net-next v1 3/4] net: stmmac: generate software timestamp just before the doorbell
Date: Thu,  8 May 2025 11:33:27 +0800
Message-Id: <20250508033328.12507-4-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250508033328.12507-1-kerneljasonxing@gmail.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_203400_362938_339678C7 
X-CRM114-Status: GOOD (  12.49  )
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

Make sure the call of skb_tx_timestamp as close to the doorbell.

In stmmac_tso_xmit(), adjust the order of setting SKBTX_IN_PROGRESS and
generating software timestamp so that without SOF_TIMESTAMPING_OPT_TX_SWHW
being set the software and hardware timestamps will not appear at the
same time (Please see __skb_tstamp_tx()).

Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 28b62bd73e23..e7266e517edb 100644
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
@@ -4820,6 +4817,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	stmmac_set_tx_owner(priv, first);
 
 	netdev_tx_sent_queue(netdev_get_tx_queue(dev, queue), skb->len);
+	skb_tx_timestamp(skb);
 
 	stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
 
-- 
2.43.5


