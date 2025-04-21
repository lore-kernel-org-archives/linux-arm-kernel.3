Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EC8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0m7jP2wxTkf8fGVipTvtdJjuwbLzoj/2wX/3RGTjBVg=; b=5DdQQl66lNKCu+jmDXOBmfKWqU
	rSiStnJr385j8L9rEmicPGC0ghyCul14AUqxMce0zTZTzVSAv40k+OiXPcaFB+aU4Hj53J2295WM/
	MzmzgjvUijMKPoL0YW9eI90Xxo4Xdvl8UUZrGfkSfFh6fOm4xSNlN0Datvh3Y2tPCNGgPS8mTIXrw
	xHoYFYW7ALnTYMwKA0YAPfFGpQ8lSKk87VQtTj7+rv16S/JVPRC+FsRF/MF5FUUnwJy9/kfXRB3fk
	6Xt5NbZk8TgAd7IbHCixRvh4x44nSDVk/Oze+ErBWTdd2AyTLvSwRT0iYXZul4OpFyM1A66GZrupD
	+JhknLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ml4-00000003vlb-3cSb;
	Mon, 21 Apr 2025 08:44:06 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mOA-00000003t7r-3Ct6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:20:27 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so3236613a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 01:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223625; x=1745828425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0m7jP2wxTkf8fGVipTvtdJjuwbLzoj/2wX/3RGTjBVg=;
        b=aZJr2Nx0ZMtBgxCXijqRnCRVdUKc8qeB/7VZz6G7SRtq5kCv4jsLg2g+eoiZpCDij6
         EpDJHit73IhsMYBM3i8i5u4dNzxGmaDjLFzEeu73auaJS/Yc6qEKpsQRYOAFVrlTa200
         L7LStCM0nCplWpjUMafR2fi5Uzv00AiTB6ySAWXpUU/4D2WyAwXcBcUHDZ+GLVCf2tj8
         GKf7msK1iI6QENVRCkfM3QKBDUbmsLapCMEPPyUENiQwR5Th1i6A4b2YPtmlsZJhH5Lg
         JBcIkGiEYrbO9YAgJV1RRSlHWgfgLpwYxuO4JlgJyksoF8YEAT9rkNpqgiupaVRloBkm
         Nlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223625; x=1745828425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0m7jP2wxTkf8fGVipTvtdJjuwbLzoj/2wX/3RGTjBVg=;
        b=u6AtFsg25XPuK4zSrvYvAsYM8jXudpAcgubMAvcytp2kCUcBVPdy0B+d2KrIxrE/7M
         Vd19UPqOD2pMwT0JOjyuYMjjNu7v9fKweL2yMT0wgKJYg8cQ+m/sYHNSkS6r8W7qS3b0
         BRnnM3kUzmp3QawDMpUaoswXCzL4dC4QyW/u7GI1TC4LIbcbgv7iQw53ji0ksPtg9L2j
         Kx+UfMhYPbpHFUcOHgzEVdZIX60l75Pj3ZKf0OzqNZANnbOorid2pUeXGAlCcE2d4P46
         LywXcrLDOGfhLNL3Najx3UPYOWcolD+D4YHIAWmyIy8MmqgtP7GiToP43/d3s1uDQr+J
         D2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbAYqsvTKZ+Cq/ZleKA9F77QwQeSSLiD0duxvwxeYjmiSsVItQpLpIlPBS3jQldCqPtBaaQsbhHy3HwT17WDQj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi6sTj44yNSKpz+aq73UA20QJnZLiRc4KmU4nW/lFY2G3+/fTr
	OY5VPkgnwMniozUIPdiRYuXILH33S+SDPaEHyMnJEv66Vo4Ma2snBwVlrG9MTkw5SVkjREeidWM
	B
X-Gm-Gg: ASbGnctvqzmQpTakQ/ZcbNLiatWSbLDLhXBAZdVI5vWdxrFsY/jH3pzdIYZ9R0Gxu41
	XGMAthuizyH8PrXnPKqZbvAVr3yuGs6SKoyXj94KGQMFJJWs+arHy4erx7b+7nH4XW9TQyiG/AD
	OKjiLs0maEo7CCkVFTI4It0oJs7osmTZOLBpHA2kvIWWQOfWi+apK3ESou24c03GyamDQdVt2xq
	5AdQwXm+f8NF3w9bQR9XI/mRi4B+6H1kyafi9qYxZiGJLJi1nphh9kMmDfKgbu1C+4BZaY4sG6F
	8zwHe5b+j0L6X5munkFKZJYRSNXiKotFA2DXCVWhE+Rd+w==
X-Google-Smtp-Source: AGHT+IHNHbUGLwb08K8zTnsZaX9K578r00c2tp5U+zBU23eG/2mTEsjbZofE8waPRYo5HOQNKkFHmQ==
X-Received: by 2002:a17:907:868f:b0:acb:893:8c40 with SMTP id a640c23a62f3a-acb74b388edmr1119224166b.19.1745223625191;
        Mon, 21 Apr 2025 01:20:25 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6eefd888sm477891166b.115.2025.04.21.01.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:20:24 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:19:59 +0200
Subject: [PATCH v6 1/2] firmware: ti_sci: Support transfers without
 response
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-partialio-v6-12-b4-v6-1-3b5cefab1339@baylibre.com>
References: <20250421-topic-am62-partialio-v6-12-b4-v6-0-3b5cefab1339@baylibre.com>
In-Reply-To: <20250421-topic-am62-partialio-v6-12-b4-v6-0-3b5cefab1339@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642; i=msp@baylibre.com;
 h=from:subject:message-id; bh=IFSBT6v25qjOVZm3VodtIQq2tdjsQ6B1Axqdspb6A3w=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzW/3vcn9uuqZa4FSeoGr3tckK5kJxIj6Jn+1HtzwEmz
 h6ueZwdpSwMYlwMsmKKLJ2JoWn/5XceS160bDPMHFYmkCEMXJwCMJFHbxj+h8y4821R9/m50uIb
 jRZsfjXP+I7Oy5VJsr/Y5I/mchRdtGD4ZzbxitMdps9uKq83+Hw71Xrk785z56bKsb2JiAx426K
 RxgMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_012026_806121_A29B7369 
X-CRM114-Status: GOOD (  15.03  )
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

Check the header flags if an response is expected or not. If it is not
expected skip the receive part of ti_sci_do_xfer(). This prepares the
driver for one-way messages as prepare_sleep for Partial-IO.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 806a975fff22ae00ecb88587b2c47ba172120bc2..09d11e75e14e6a6a82f6d99ab1852c142aeb7e5f 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -398,6 +398,9 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 				 struct ti_sci_xfer *xfer)
 {
+	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
+	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
+						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
 	struct device *dev = info->dev;
@@ -409,12 +412,12 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 
 	ret = 0;
 
-	if (system_state <= SYSTEM_RUNNING) {
+	if (response_expected && system_state <= SYSTEM_RUNNING) {
 		/* And we wait for the response. */
 		timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms);
 		if (!wait_for_completion_timeout(&xfer->done, timeout))
 			ret = -ETIMEDOUT;
-	} else {
+	} else if (response_expected) {
 		/*
 		 * If we are !running, we cannot use wait_for_completion_timeout
 		 * during noirq phase, so we must manually poll the completion.

-- 
2.49.0


