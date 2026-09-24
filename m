Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE773C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mH6UmZDnY2/1ICZZ8Pg7t2PX/T+Y1zVqUpSfOHvs/6Y=; b=GRracFox6PMuGDDsEagu4KCxWn
	KLzCkDNF//Z2L+6539SiWtPxaWPgfnWyeewSZYks13P29lAzXVWPgeXXJbPlMxWEU0AD07aId4f6L
	fJ4UIZWrGwq6UjwjysbDcEU9RdgdrGemLKKhgWUDIcKolqWSrL3TxjCNt4mr7QTSnTk2wb7RSkIrx
	YZ0p/KBuAhQbtd7i5o0iiQfxI80tz4yJz4jaPnjQMgfmQXJAHqc7PaeHOX6Z0W/TZCniGGblToAlm
	R4xS0rEnyO8aoDJb64L45sixIlR0dyUEgPIfQHyHFcJ4ROweoRXiGe4MztXhyjeu2v7vwjLgZuF2k
	GLF3hoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jrK-0000000B8Ue-1gGz;
	Thu, 24 Sep 2026 13:51:34 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jrE-0000000B8Qs-3HkR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:51:29 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e620fa473so12844315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257887; x=1790862687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mH6UmZDnY2/1ICZZ8Pg7t2PX/T+Y1zVqUpSfOHvs/6Y=;
        b=Hwgzvn4n5Wkw8sXo+4fvb+RcRm/QRw14Yj1zHOUHucALXB2jEIJMyNX+0c8XA6MjAH
         SdgaKt9LOsjktOm3XLTgVFjpWpGaUzeGBDwWhqzpeSoB0dgiM3qkEMd8bUkj5ks6VmuK
         pNcJBWm8bLFNYCIhvJAUq1QSknHopQdAVPQjvpD3EfqXB6cS3U0LxaF6oW55E71qg1kr
         /BA6I8RbFLBrCoEE8tYd64VDPZfYcZHpd4hZ4T4nL+f5hz7ma34AVHkv0Q+hJpnqZUIm
         kDVeC2bqi+BXIRbj4XW798BRbrC6ZvKKKqQ5SY354XVhzspRc7kZgjaW057mKMUnFw5b
         7hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257887; x=1790862687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mH6UmZDnY2/1ICZZ8Pg7t2PX/T+Y1zVqUpSfOHvs/6Y=;
        b=na2/ZDeNfxQgwXgg2XskSjwUA79LGY7gcKO8gn6MOmKFdy0WpwuBJnB1WC1rTiAZJW
         NnCWoznv5CAB2GPSBfVGub5/WprMKmBxYVWWQ+X0bgUAMdM/xEgzJ/PquCaSjRr0XLk5
         +4B12AMMSTP2JJ+47EtZxiwPL5gPcsZ7ZVjfCld7AsVUHw4MUwevC8u8zZsH0IO/Qpqv
         3HkOH2PhBHRvXJlJqoIvfQV2Xf5ET1xrzIFVh9G679XjS6XKoGcmm9hsNunAMX37SrtN
         roLtKwfp7yYMuOZyd5QQLQjEJRZAtBupe/QvPj3+Y7BkA9LTs3iR/zAZYgJP3T6cFWT9
         DadQ==
X-Forwarded-Encrypted: i=1; AKwUvBxizquBSjLxMAAMigkXu7YnEDqTAY27YzNSeWeFPwXO7/514yr0O6m8I7s3Nvk+ZdT90fPnDrMwYxW0KGc0fr3L@lists.infradead.org
X-Gm-Message-State: AFuF++lT2fC9/jkgGvOG0Y+SFGJDRprZ1nVdwLnFkAPRqreYAYG7N95r
	PdSN1m+c1gdPr0+lpX6qhcxsHug8VxxIkp2Ky9WuJLcir1Y7bDv/T7i5
X-Gm-Gg: AYBFou00DC4HEjQYAgw0n7z+iugr2pHFFmocyq189mMDMZLTJq7KvEUFQGBWfHxMFup
	Rq9Ct1vgZt7lu2w7NYQxImkGV/j5sI0ZveTFpF4FIHbpUcVwvCjPQiRw5XnLrAnvfmDIJUlArK8
	Y+RuQiIQE7XCE61U4sGB/YSiUVyxNLBZXXjM2bDrcnKB2i9fsUo5jPxQpYjibh6IlJzFPdYhsMi
	gH2RxUr/r4nvC8Elno17jg3FkZu4lUujaLERoL1xBaNg6Dnxx3cOVimuPCaziEM1PAwFipLwKGh
	2MYICxwT79wz/UuYuBtsjebAQ7fndwTNcVAzMdzfTas4XYcLX2TdZwt+V+h5ws/2rQRJGLVCRrp
	o/gt1EUMzDNAbJaoEE4sgiXm54kVaGWIeUGjb6xD9odbjnmC33LGpC2l06NNLPV5PwTZUIe9XLv
	ZAMBzd5YL9+oZoPbCpwpKq6B257EhdJ9zJyKVlK6s2HItrJlO/TiGnX9ASJg7hWgATOrP61XSfh
	1DW6lR9AsOhRnKvYbCXptI9eNqoIJyP09P5lVxAMz4PUQn1/I0=
X-Received: by 2002:a05:600c:1d19:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49fe66fbe9cmr45951715e9.23.1790257886830;
        Thu, 24 Sep 2026 06:51:26 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm12060660f8f.33.2026.09.24.06.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:51:26 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	daniel@iogearbox.net,
	andybnac@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v2 3/4] net: axienet: quiesce the TX queue across a DMA error reset
Date: Thu, 24 Sep 2026 16:51:15 +0300
Message-ID: <20260924135116.185161-4-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260924135116.185161-1-maimon.sagi@gmail.com>
References: <20260924135116.185161-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_065128_856951_D100B49D 
X-CRM114-Status: GOOD (  19.20  )
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

axienet_dma_err_handler() resets the DMA engine, frees every TX
descriptor's skb and mapping, and rewinds lp->tx_bd_ci and
lp->tx_bd_tail to 0.  It has two problems with the transmit path.

First, nothing excludes axienet_start_xmit() while it does so.
napi_disable() only stops axienet_tx_poll(), and the handler takes no
transmit lock.  A transmit running concurrently can publish an skb into
a descriptor that the handler then frees, and dereference it afterwards
in netdev_sent_queue(), or program a descriptor whose mapping the
handler has just released and kick XAXIDMA_TX_TDESC with a tail pointer
the handler is about to rewind.

Second, the handler never restarts the queue.  If the ring was full when
the error hit, axienet_start_xmit() had stopped the queue with
netif_stop_queue(), and that __QUEUE_STATE_DRV_XOFF survives the reset:
netdev_reset_queue() clears only __QUEUE_STATE_STACK_XOFF, and nothing
at all without CONFIG_BQL.  The wake in axienet_tx_poll() is reached
only when axienet_free_tx_chain() reclaims packets, which cannot happen
once the handler has cleared every status word, so the interface stops
transmitting until it is brought down and up again.

Quiesce the transmit path with netif_tx_disable() once TX NAPI is
disabled, so that no transmit is in progress or can start while the ring
is torn down, and wake the queue once the reset is complete.  Because
the handler now owns the queue state for its whole duration, the wake
cannot be lost to a concurrent netif_stop_queue().

Skip the wake if the interface is being stopped or the device has been
detached for suspend, or it would undo the stop that
netif_device_detach() installed; axienet_stop() and axienet_open() own
the queue state then.  A detach racing with the check is covered by
axienet_stop() quiescing the queue again before it tears anything down.

Both problems were reported by the Sashiko AI review bot.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes,
including across ten down/up cycles made with traffic running, with this
series applied.  The DMA error path itself was not exercised.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 6d448d0b523d..f16dbfc7dc93 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2724,6 +2724,11 @@ static void axienet_dma_err_handler(struct work_struct *work)
 	napi_disable(&lp->napi_tx);
 	napi_disable(&lp->napi_rx);
 
+	/* With TX NAPI disabled nothing else can wake the queue.  Stop it and
+	 * wait out any transmit in progress, so the ring can be torn down.
+	 */
+	netif_tx_disable(ndev);
+
 	axienet_setoptions(ndev, lp->options &
 			   ~(XAE_OPTION_TXEN | XAE_OPTION_RXEN));
 
@@ -2791,6 +2796,13 @@ static void axienet_dma_err_handler(struct work_struct *work)
 	napi_enable(&lp->napi_rx);
 	napi_enable(&lp->napi_tx);
 	axienet_setoptions(ndev, lp->options);
+
+	/* Leave the queue stopped if the interface is going down or the
+	 * device was detached for suspend: axienet_stop() and axienet_open()
+	 * own the queue state then.
+	 */
+	if (!READ_ONCE(lp->stopping) && netif_device_present(ndev))
+		netif_wake_queue(ndev);
 }
 
 /**
-- 
2.47.0


