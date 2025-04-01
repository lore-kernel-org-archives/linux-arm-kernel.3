Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2175CC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 07:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MOOc99waxVZabi2Ytb5QxIM6jcyNAh7G14JWyJa6TT4=; b=SZKQV1OXK/mCMvgGPXJRaZV7vk
	pjkMpugqyRcWV97kE8Tbt04SxyEtRkkFmk1FKT+nw/E3tf2E2C7Sq71WDkUsDtsc8guqZWfCriMfS
	mtjxo+SIzB8giSK3oNYjf0JcWvXda/t08xh2LQ7Mw5UwUtDS+KYpRJyybGbbJQfO0DoRnCg65u1B0
	nWR6k9jLw+PyFASy82o6M09/06iecnXgGaEV7XeTMglKEyTBUb868tiAj+ER49v4wxI2IagP2Lejm
	4XWsRUv0smRFfWmIh9nNeUcj2x8gs7CXpVSl5vXShmX3ri3P74mtZsNW9WYIJyeattRiIcQprbx2Y
	JOg4Y7Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWMg-00000002Ew7-3w35;
	Tue, 01 Apr 2025 07:48:54 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWKt-00000002Ed0-2tqq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 07:47:05 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2260c915749so72412085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 00:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743493623; x=1744098423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MOOc99waxVZabi2Ytb5QxIM6jcyNAh7G14JWyJa6TT4=;
        b=LX5NpXnZ45Efy5l4oz4If0uyCb8SubfRpS8S0v9daXh+ilvmoB+TRm7V+P5LEj0A0x
         P2b8PNcKAPz+1ytdHZ7b+xd/cdxTdq9vukNeolU1WBrLfKJ54Yr/ysjpHUxCYj5q/ZsM
         MuEOMXmtg7SLRRcNIdswghQawIxCiVxXr/febP/P4LxbqSskhDykQhkm3hkCgNClIrFt
         EiRpTwHvVetjQzFw3nH4jDO87+dGg30jIBjT1f87hx70KXVXFDk7dPcOtPQlWE48Kqs+
         NjGZzuEh5aPgoAJQnIG2bxmaJTAlnRJFIzb4mRczdV2vEQHmJsnybsPq5tXCmPeK+D9D
         o7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743493623; x=1744098423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOOc99waxVZabi2Ytb5QxIM6jcyNAh7G14JWyJa6TT4=;
        b=Vm8eY/N02VdCc9R+mq31q1XTlMMLO3mnr8XTiK402cThCHthn5NdbkpsPrZ1Oiwmex
         sUoZbqb288gxT1mNQCr2BG5KZhvKcavmpqKw9DSxpiVrrQjvtrdyy86RRkfyv6fuXyjM
         JMLlXeLqCPLTk4jhueMkLfHi3MdNos1SW9NRYP3zuZXqhglSVoUTj1OKDtUXGv1TmoV4
         xDFm6FGaDf5zBOipHYCm9vv0eU1vkWk1xj80RfIi1R9URNf0bzcI2/Y3TR0IG1lr+Ha4
         oA2A3+X+ZvK7lF4oJKgTMjBGlLh1hHAYNvFIJ6J2csh6x71oqWm6cQbQT3Rdxnmy7ZFS
         PzzQ==
X-Gm-Message-State: AOJu0YwejbTJEnfXH5NqZzQ7jia8dE8v8Fcst65z+qw4TlWVSnEY+dD4
	OErMdCR7jVqeCTPutZhpJ6oKef3aksHuxazjLBVpNMy0VO39603P
X-Gm-Gg: ASbGncuH6DgbT9qDgZmVA2iUr0c7ikLtfCY3srZmk8m+UUD08OVt4igASYx8sQ6i/4c
	ywX1CgMRx5oxCWFLLyhr/nfFv/FiQejRm19TWiI3Y3xq2CR/choDJwL9qHx/TWRSahl1GdftwqV
	SA0MZQ5G6GEOLsqAPcsXb0SX/Gw8lvJYR6DB/tDNGoaeRnwYMxLB4wScnjcriQzIUSwg3Rn3wLR
	pwFdBnrC5gtWlDYh7FDNalRoq0Qj+9NDI/hIzESqnOOujkiTkmwxusx7WSyt1eWOXiH65hobJYd
	FQCW56iBmmN0XdLNRpc6IrAoABQOGo3X9T5wpju9txg2llgdtJjLimOrQpC5cCiPL8b0fXM=
X-Google-Smtp-Source: AGHT+IFZy01sSWuQIVITMC/7GCZ0VOUQ9l5P25t3PEDAJzmDMq/S0RjaavN8GMJVclcwJerUhN7Uuw==
X-Received: by 2002:a05:6a00:a93:b0:730:95a6:375f with SMTP id d2e1a72fcca58-7398033f039mr19324112b3a.3.1743493622478;
        Tue, 01 Apr 2025 00:47:02 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e2a0e2sm8512745b3a.67.2025.04.01.00.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 00:47:02 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	gsomlo@gmail.com,
	heiko@sntech.de,
	arnd@arndb.de,
	herve.codina@bootlin.com,
	andersson@kernel.org,
	u.kleine-koenig@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v4] soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()
Date: Tue,  1 Apr 2025 15:46:47 +0800
Message-Id: <20250401074647.21300-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_004703_756365_A6DED6E2 
X-CRM114-Status: GOOD (  13.03  )
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

devm_kasprintf() returns NULL when memory allocation fails. Currently,
aspeed_lpc_enable_snoop() does not check for this case, which results in a
NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 3772e5da4454 ("soc: aspeed: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V3 -> V4: 
- Add proper cleanup when devm_kasprintf() fails
- Ensure kfifo and miscdevice get released on error
V2 -> V3: 
- Simplify the array access and correct commit message.
V1 -> V2: 
- Remove blank line between tags.

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..3e3f178b1226 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,11 +200,15 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name) {
+		rc = -ENOMEM;
+		goto err_free_fifo;
+	}
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
 	if (rc)
-		return rc;
+		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
 	switch (channel) {
@@ -221,7 +225,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		hicrb_en = HICRB_ENSNP1D;
 		break;
 	default:
-		return -EINVAL;
+		rc = -EINVAL;
+		goto err_misc_deregister;
 	}
 
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
@@ -231,6 +236,12 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		regmap_update_bits(lpc_snoop->regmap, HICRB,
 				hicrb_en, hicrb_en);
 
+	return 0;
+
+err_misc_deregister:
+	misc_deregister(&lpc_snoop->chan[channel].miscdev);
+err_free_fifo:
+	kfifo_free(&lpc_snoop->chan[channel].fifo);
 	return rc;
 }
 
-- 
2.34.1


