Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75241D68BF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 18:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZp2LLELhHXaHE6P8yqyIkdBBd7fnVylmpcd4GsYhTg=; b=IPUAXkbKPJZCJS75oZeOGvkZ0g
	UTGBHUPErgwQ4Q1q5fqbpNQ1Ix7PUSTSO9wj7/rdt10+DDSnM8etQMLvtS5+xnbVmMp7Tux3oX8e4
	56+ZfGOFXnA8R1lhC9DTagCqxr8PicdNSV+Kqc6uS5PpopQgeauAbiMJZGHomJJl6FHQ9r9SKG4TS
	edvEfuBFj9XnpghzBNT6ftiNmVGZcikbD+iqonbCNfo7MsEhoDb747ULqY5D5afvEGfz4VKmWLi1W
	y7SntP3QMuiRobTAK7fPodGvwvMELQoGByKhj4Kqr4c1DcPY+BZjzSIzMDwe1NvT9m9r7WINIaGpQ
	6ASwIIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCNAN-000000060vt-0qoV;
	Sat, 16 Nov 2024 18:05:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCN8g-000000060ZD-30hm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 18:03:19 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa3a79d4d59so472924866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Nov 2024 10:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1731780197; x=1732384997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZp2LLELhHXaHE6P8yqyIkdBBd7fnVylmpcd4GsYhTg=;
        b=fJRwgbqgtqSQwOYz0PuJYykcuQ9Hd0lg2sM+5IRZ3rHsc/Xnq7X5DJoJ9Fha/pEmNO
         vRySjBfisQrqq9gZ90KKiSM0/F7BK7N745e9ldmCHhaeqqEzcZJJOcC66iiONv0TLoLy
         lOmBPuS1Kzy8xErm4dKi0ejVRgEIVNofFAp/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731780197; x=1732384997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZp2LLELhHXaHE6P8yqyIkdBBd7fnVylmpcd4GsYhTg=;
        b=MoQOjAzaoAnSUTxc2PgwC9nIkfhpzpPRbKws6rYdNCEllHEU3Y4JFwjW854TPIVNEE
         aNO8A2KdbFCf83X57+Rt9gwIjbs9faZ3xxBSTaoeG7dZyHCXlfatdlvNuY8Y1ZmEoqLD
         uSeM43xIOtCuV1KjHRsMi5dnWpqZmagDR+9yQrP6yBluDDR8iSQ7gYMI/jX+gM3YbitU
         7eMDoXOvnVXN+fLJjbN2XIBpPAzPX7CXyCwlg73rbmfzkmwc0FoSrVBY/ccxbAW3/NQK
         4tZ/N00VV3dyWcGopJPBgJwMPJ0dB+Q3u/QYxHdS1uTFTpIjjMW10zRGLLwOqArvSIhd
         j10g==
X-Forwarded-Encrypted: i=1; AJvYcCVhu4L5sWrcGX9k5GzPA3ID7dnEWE0JNgF4nbatNb5ZxTKjl5h8pyku8aSqjAxIPzOuWLR3y146th5dn1jYMsZn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwx/QxQtl2O387RW3TEeE6VDLoNPz4fzMOLd/k/uteXyEaTLR5
	UphqpAIPl1zY+lJFJXU6UOt2+aFsmTQN/zyG+kyeG/bnJsClCXM22jcM3x1BdZ4=
X-Google-Smtp-Source: AGHT+IHco/HhB19U8GRhXEYmlvtasr6hZ6h72SXfmIX9BAE4Ibve8haYdY+6mq7whoM3rHFNs0pSVA==
X-Received: by 2002:a17:907:d24:b0:a9a:bbcd:e63 with SMTP id a640c23a62f3a-aa483421c58mr612801466b.14.1731780196892;
        Sat, 16 Nov 2024 10:03:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dc6d364sm329549066b.0.2024.11.16.10.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 10:03:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH 5/7] can: sun4i_can: fix {rx,tx}_errors statistics
Date: Sat, 16 Nov 2024 19:02:34 +0100
Message-ID: <20241116180301.3935879-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241116180301.3935879-1-dario.binacchi@amarulasolutions.com>
References: <20241116180301.3935879-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_100318_753619_5015A0DC 
X-CRM114-Status: GOOD (  13.26  )
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

The sun4i_can_err() function only incremented the receive error counter
and never the transmit error counter, even if the STA_ERR_DIR flag
reported that an error had occurred during transmission. The patch
increments the receive/transmit error counter based on the value of the
STA_ERR_DIR flag.

Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/net/can/sun4i_can.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 360158c295d3..40939141749d 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -579,7 +579,6 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 		/* bus error interrupt */
 		netdev_dbg(dev, "bus error interrupt\n");
 		priv->can.can_stats.bus_error++;
-		stats->rx_errors++;
 
 		if (likely(skb)) {
 			ecc = readl(priv->base + SUN4I_REG_STA_ADDR);
@@ -602,8 +601,12 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 				break;
 			}
 			/* error occurred during transmission? */
-			if ((ecc & SUN4I_STA_ERR_DIR) == 0)
+			if ((ecc & SUN4I_STA_ERR_DIR) == 0) {
 				cf->data[2] |= CAN_ERR_PROT_TX;
+				stats->tx_errors++;
+			} else {
+				stats->rx_errors++;
+			}
 		}
 	}
 	if (isrc & SUN4I_INT_ERR_PASSIVE) {
-- 
2.43.0


