Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72668E6ADCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 22:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koSu2Qr3uUTmv0FA1/R7W/a8VprfWgcqXI/05k6MgFU=; b=t/frJYwlaWOTC0AD1GMRuFIybu
	9U33h7aUO2C1GbmyynEB5HPn+39w6S/ggV8oP6485uhMd2C72tu6ZkSdJg9/cF+5Pef8+a4HjkL8B
	iCo9dz8owI4Z627mGMcVksmOXLDFWn7d+qX1+Sxi+jWrJmY85NiqrPrmYVYBb+e6+nYyzSxbRaDIP
	x70HOtNTs/4CfKST9vw3qUlNiHTszsHsiZW9xn7ouy3xb4adWkfAnszaTNsH7M+Rob3HExH1u2ZOj
	35O8Pu3ZoVp7dvZrIYCw6y2h6nTRfOQB+D8KG856u0qw5vRT7hGmCrtyfUM1hhTF+LmXSL+KWGAC5
	F0TBH5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEc1B-00000003POV-0exr;
	Fri, 22 Nov 2024 22:20:49 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbxc-00000003OU8-0JyS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 22:17:09 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a9e44654ae3so358182666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 14:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1732313826; x=1732918626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koSu2Qr3uUTmv0FA1/R7W/a8VprfWgcqXI/05k6MgFU=;
        b=jgEIT7k1z5uVUUDknb07a9q5JclczcYkjGLNINt9p8e9vi82QWCnEeZOUtUjDHJQGW
         b2Ro3z4XDJlNvJQXLsTZoZSrTiD9SQeIMCM76V3JLdEZEE+ASoZq4QZRLQGh7AV49Kzp
         Ubp8/MTYurnOYh0L8GVL15nMz/lYw6NxWvdKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313826; x=1732918626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koSu2Qr3uUTmv0FA1/R7W/a8VprfWgcqXI/05k6MgFU=;
        b=CAPPQrLRTxpK6Kb5Dm3VsokA0xwOTLJgH0cH66XtI2MRI+LyP9GLpiZJp+u16q7ydR
         augJLbeJTLzyfCXnawik2WBiIRXHjM7Lv+xyKOftR+c7A4w/J76LwRbU+K3dQMhrbhu1
         XAAK/Jl25mn78z6z+qDDH6BBj4KBES22RUKqMfT9gVU2FgRqY6vDJ+QDGFfs5f/8IaOW
         rLIBt/KZVIF4MiLp6fb8LdB+yYoa5qSBdh0vtLfL0FzoKuksWYnMgnJdUQFrcsDQL0qw
         qgtr+itUXvQ7c3cwcCgS86E0GBlMOCHNV0OJX6aTlEb7hjq+TFKef0pdZAIGwjJYUITb
         OEGg==
X-Forwarded-Encrypted: i=1; AJvYcCVGtIpozuzgzRaGyWOzsU2jhXJexZLNfZiIAECD9/5xA6eQJNiWhk5z4SHPAMwSp/y7KzCxFQYeZSw/0MitEoW/@lists.infradead.org
X-Gm-Message-State: AOJu0YycDIdrXHuxDXj4fj9X6VM3d6vJPpRUE+xFjXIBgMMItdaNoL/b
	aYtVwKSqg87229VqXQbIh5QooIyLkfGcRiibsBsRyh9/VS/jx355Y7aP/YfrstM=
X-Gm-Gg: ASbGncsIu7YXDLiYdhpAMpGSmA6ncfq4HV70wOdYIqvO5FMCFyMCx2K9/31/mB1Wbdv
	vvAGVGrIT/IF3VZ7zb4rCtbMB9S5LNHLeIuCXhyfZFts7ioFq+gpwgG7BxR1eBTsZZ2tXLAo0Tc
	LRL9u/+/sSkG9jHIM/pqzqDOR1TsyGF/vuKOATH+snGEptSo3bIBnUn5jUiYxr1XqQrk8+EbspK
	jc8XzwaGhoJqleva53h67Xrds0LLYiLTzjS3jWIYp1015QpvGyLSVoyNDOocNuzNl7shz9kuQbr
	Q81okh6yFnvEnw4HTtAWF+04P3wukDJeQRM7sSQUN5funoG89rjSlz0BVLJB5jmoEpHE8APBcwA
	8crG/XR9V1wQgbEps
X-Google-Smtp-Source: AGHT+IGzFnZJs4h2n/iV/ioahj7WXElDTwCpUUULB2OBEylU5ouM6Ybr9FJMu/M15S4g4KqefHT26Q==
X-Received: by 2002:a17:906:31da:b0:aa5:30c0:384b with SMTP id a640c23a62f3a-aa530c03aecmr47395466b.24.1732313826492;
        Fri, 22 Nov 2024 14:17:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fcebsm148226466b.127.2024.11.22.14.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:17:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 10/12] can: sun4i_can: fix {rx,tx}_errors statistics
Date: Fri, 22 Nov 2024 23:15:51 +0100
Message-ID: <20241122221650.633981-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
References: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_141708_110021_936C55B2 
X-CRM114-Status: GOOD (  14.05  )
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
reported that an error had occurred during transmission. Increment the
receive/transmit error counter based on the value of the STA_ERR_DIR
flag.

Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Update statistics even if skb allocation fails

 drivers/net/can/sun4i_can.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 840b972498c1..5285bb0b7c69 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -579,7 +579,6 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 		/* bus error interrupt */
 		netdev_dbg(dev, "bus error interrupt\n");
 		priv->can.can_stats.bus_error++;
-		stats->rx_errors++;
 
 		if (likely(skb)) {
 			ecc = readl(priv->base + SUN4I_REG_STA_ADDR);
@@ -601,9 +600,15 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 					       >> 16;
 				break;
 			}
-			/* error occurred during transmission? */
-			if ((ecc & SUN4I_STA_ERR_DIR) == 0)
+		}
+
+		/* error occurred during transmission? */
+		if ((ecc & SUN4I_STA_ERR_DIR) == 0) {
+			if (likely(skb))
 				cf->data[2] |= CAN_ERR_PROT_TX;
+			stats->tx_errors++;
+		} else {
+			stats->rx_errors++;
 		}
 	}
 	if (isrc & SUN4I_INT_ERR_PASSIVE) {
-- 
2.43.0


