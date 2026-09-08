Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE8DC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ThgDhRyE+Y72EBv7/U4oxOtCi6RtEmzsslCG/DRcvA=; b=CnekK+sAuMReqOncvogimfX+RW
	rEOREseEN8KAkqUIZcU4gEaRNO4PKP2E6rm/UoLOvr9pWhL0pJvT/iUNr3lA+jnvm8NXZULRPMmHT
	wcC2/ns8PoR6Xlne6xH/sq03NkV8abfX9/7eevV7CCjsUd7i1GBEraUqxM/d78KAGfa4DnGclvgjQ
	Yxvb4Re4ACGATa820Krj7KJGvwS0wFkt5/Q/CyRGY86kUAsSBKtF5yH59Q9FJYRSi/W8rq8+IgWKU
	A3KCe0MemUmr4wJXPxTr8O39bmIBgpczn9C84lyXrvFO1HqBg9/7XLd6TzRVsApQx4Qn+2P66dyca
	Eqy0gEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMw-000000084E6-0lfv;
	Tue, 08 Sep 2026 05:27:42 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMt-000000084CG-3R4f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:27:40 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cbee846deecso4957369a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845259; x=1789450059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ThgDhRyE+Y72EBv7/U4oxOtCi6RtEmzsslCG/DRcvA=;
        b=SBSBcpa8PfxBsqieT6YyZwF9tatMToWBJwAmrD8wK16D/cswYFxFMmylOGURroIPxq
         2XKZeK50RNObzmp2+i58cQfAUwjD7LDY4/clWpUGks1e9QE/VpgwPUgQPJkx6bksqWa1
         nERiOcdFdO5PYUDwtofDbeZQ/HFLhUeaMP9Fdd3rn6Xm47cz2tPSbbuC3rgwKcZwomm3
         4MCgQ5CPfoWfwWlaZiXgpfjuDxKCmQ6nSU4PaHdcDQnxvd87SHc/TxBDABd7ysApII+k
         wJX8WizLejdTeKPmjIHmGauXdzgb7tVFgl//ooooCsl956pqQZAj7wYXV7h7YWxXhMC8
         vDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845259; x=1789450059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ThgDhRyE+Y72EBv7/U4oxOtCi6RtEmzsslCG/DRcvA=;
        b=Bz4dwQxr9mVsJ/Yen/3SWkywBOrMEcREcejA9elybkACGOXf6yeLf3gG2cA0nkdfuL
         Jvifl7IiAqOlHZ2fJ7cAkb/tseNYyfP2Bbz6p7Nktip63MMMCclPxshf9vrFnUQqk+wK
         zGsaYx9+eWYzf9gt6+9SG3yTjB7twY4zZTLaIaoJo14RYLCVEVDPbHwXaXrBn9e2ldTo
         +yxLZoLbKjJ4c1kemB7cFvbIcP76K1vv0q49dMtgXuZenk6tYNGT7yQ9DgP8lzF6ljKr
         62ZloJ9HwZm87gGErUFFJE3Ko/arxGPztFETgUkl98jJJVgG5hzc/m/uyuBKVmaTEQw8
         M7fw==
X-Gm-Message-State: AFuF++kBFZavcpRtQvID8cO/73zccVCsGkoWrhs+GDiuiAGvW5B2ihFX
	ag+i0cTd5wVNsPFMP35t2lVPrXSj4Qhyfa8r+X8DKxOG+qEFYhp38pq5
X-Gm-Gg: AYBFou3VT4RDDHjVLwy1IxEBl9/kG1Auxp2ljmdaxvXAB5BxDLMiSWSVpFTC39jIvHu
	XQJjk+xYXH4dhcX3/4Vtgnbsn/lpVhu2A1H2SmJHYoU7C5j44oDzflSPzlcxS5x/nkSj40aFyZS
	L16K+OoFo+mWoRjqywxFPnax8vMFSVtEaRdGFWPN/OKomGgDjIGv88hR+jBqyLmF03ReHRhm6Go
	sxDG8gdNloKoqw4/uE2dfhode9dsBJgeWEVTDxOH3E/v4K9FI9bDMGNsp0TtnQ6ZLHJOVCtuCNA
	YOwvtqqOjLnD77bnBwplNvoiq1Cx7pw0tBbHcRkBGUQWsP6UOaLgE997jElM0BoQBhCVlJyVuxa
	tfMse/PuYl0p8bCVe193LZbUB82dI7jZraX4U+a4Ph4CT1eL1EmtshO57j3d4Ud96+TJcdo7XmF
	XrtQxTUPsmZxAYttz45iGv38gFEc6GFEHxYYuLiRhxOLKBjiY2vDi808pnZT5wGc522VUYOBhY2
	74qq1UVaYvXDA==
X-Received: by 2002:a05:6a21:3943:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3da3a0aa8cbmr44065672637.18.1788845258816;
        Mon, 07 Sep 2026 22:27:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:27:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 10/10] net: dec: fix typos in comments
Date: Tue,  8 Sep 2026 10:56:02 +0530
Message-ID: <20260908052602.27497-11-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222739_869584_F1B88A59 
X-CRM114-Status: GOOD (  16.15  )
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

Fix misspellings in comments, found with scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/dec/tulip/de2104x.c     | 2 +-
 drivers/net/ethernet/dec/tulip/interrupt.c   | 4 ++--
 drivers/net/ethernet/dec/tulip/media.c       | 2 +-
 drivers/net/ethernet/dec/tulip/tulip.h       | 4 ++--
 drivers/net/ethernet/dec/tulip/winbond-840.c | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index f38a10c79907..fa52e099409c 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -373,7 +373,7 @@ static void de_rx_err_acct (struct de_private *de, unsigned rx_tail,
 		  rx_tail, status, len);
 
 	if ((status & 0x38000300) != 0x0300) {
-		/* Ingore earlier buffers. */
+		/* Ignore earlier buffers. */
 		if ((status & 0xffff) != 0x7fff) {
 			netif_warn(de, rx_err, de->dev,
 				   "Oversized Ethernet frame spanned multiple buffers, status %08x!\n",
diff --git a/drivers/net/ethernet/dec/tulip/interrupt.c b/drivers/net/ethernet/dec/tulip/interrupt.c
index 0a12cb9b3ba7..8c02771b28e4 100644
--- a/drivers/net/ethernet/dec/tulip/interrupt.c
+++ b/drivers/net/ethernet/dec/tulip/interrupt.c
@@ -177,7 +177,7 @@ int tulip_poll(struct napi_struct *napi, int budget)
 			   pkt_len > 1518) {
 			       if ((status & (RxLengthOver2047 |
 					      RxWholePkt)) != RxWholePkt) {
-                                /* Ingore earlier buffers. */
+                                /* Ignore earlier buffers. */
                                        if ((status & 0xffff) != 0x7fff) {
                                                if (tulip_debug > 1)
                                                        dev_warn(&dev->dev,
@@ -408,7 +408,7 @@ static int tulip_rx(struct net_device *dev)
 		    pkt_len > 1518) {
 			if ((status & (RxLengthOver2047 |
 			     RxWholePkt))         != RxWholePkt) {
-				/* Ingore earlier buffers. */
+				/* Ignore earlier buffers. */
 				if ((status & 0xffff) != 0x7fff) {
 					if (tulip_debug > 1)
 						netdev_warn(dev,
diff --git a/drivers/net/ethernet/dec/tulip/media.c b/drivers/net/ethernet/dec/tulip/media.c
index 55d6fc99f40b..0c9694d2b38a 100644
--- a/drivers/net/ethernet/dec/tulip/media.c
+++ b/drivers/net/ethernet/dec/tulip/media.c
@@ -24,7 +24,7 @@
 
 /* Read and write the MII registers using software-generated serial
    MDIO protocol.  It is just different enough from the EEPROM protocol
-   to not share code.  The maxium data clock rate is 2.5 Mhz. */
+   to not share code.  The maximum data clock rate is 2.5 Mhz. */
 #define MDIO_SHIFT_CLK		0x10000
 #define MDIO_DATA_WRITE0	0x00000
 #define MDIO_DATA_WRITE1	0x20000
diff --git a/drivers/net/ethernet/dec/tulip/tulip.h b/drivers/net/ethernet/dec/tulip/tulip.h
index 5e010e1fa6f7..e39e5c78d4cc 100644
--- a/drivers/net/ethernet/dec/tulip/tulip.h
+++ b/drivers/net/ethernet/dec/tulip/tulip.h
@@ -250,7 +250,7 @@ enum t21143_csr6_bits {
 	csr6_ttm = (1<<22),  /* Transmit Threshold Mode, set for 10baseT, 0 for 100BaseTX */
 	csr6_sf = (1<<21),   /* Store and forward. If set ignores TR bits */
 	csr6_hbd = (1<<19),  /* Heart beat disable. Disables SQE function in 10baseT */
-	csr6_ps = (1<<18),   /* Port Select. 0 (defualt) = 10baseT, 1 = 100baseTX: can't be set */
+	csr6_ps = (1<<18),   /* Port Select. 0 (default) = 10baseT, 1 = 100baseTX: can't be set */
 	csr6_ca = (1<<17),   /* Collision Offset Enable. If set uses special algorithm in low collision situations */
 	csr6_trh = (1<<15),  /* Transmit Threshold high bit */
 	csr6_trl = (1<<14),  /* Transmit Threshold low bit */
@@ -274,7 +274,7 @@ enum t21143_csr6_bits {
 	csr6_om_int_loop = (1<<10), /* internal (FIFO) loopback flag */
 	csr6_om_ext_loop = (1<<11), /* external (PMD) loopback flag */
 	/* set both and you get (PHY) loopback */
-	csr6_fd = (1<<9),    /* Full duplex mode, disables hearbeat, no loopback */
+	csr6_fd = (1<<9),    /* Full duplex mode, disables heartbeat, no loopback */
 	csr6_pm = (1<<7),    /* Pass All Multicast */
 	csr6_pr = (1<<6),    /* Promiscuous mode */
 	csr6_sb = (1<<5),    /* Start(1)/Stop(0) backoff counter */
diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index a5581f1d0141..be9199f55a8a 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -1188,7 +1188,7 @@ static int netdev_rx(struct net_device *dev)
 			break;
 		if ((status & 0x38008300) != 0x0300) {
 			if ((status & 0x38000300) != 0x0300) {
-				/* Ingore earlier buffers. */
+				/* Ignore earlier buffers. */
 				if ((status & 0xffff) != 0x7fff) {
 					dev_warn(&dev->dev,
 						 "Oversized Ethernet frame spanned multiple buffers, entry %#x status %04x!\n",
-- 
2.48.1


