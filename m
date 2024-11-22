Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A76E6ADCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 22:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HrdX116se3rn9QRZsQ51ceQKyywuhiVyeVP2xiWD4c=; b=c3mMa/45FGKB96DcaVkbHHs3iO
	OsfJ0mjwY6V1+ctMXviltLUIbRIM1rgSkFIvw7nC3xjj4sdIrdCS1WSrFYhkztLK9VvuWlyTgUZnM
	ypgCtQgLfMBKyCvdd2C0SV9LNciLtT64jHcIMTcj2YJilzqcLVNQbEa4PaxGhg+kzrKf15UKJLMiT
	A2LlKRcAll2yzZSPr09Ra0bFgUVVdPGVCOxP4sKJBD0u49GvJvzJx/MH6/flbaFgXYTQTug6RG52q
	v4ddfpO/Ztob9vpIkmQ1UZNitTyc+YYD99ki1ITTbE9Yw7YAxsQVKMeZGMldFPgOdtV6/D/2HmUVs
	y3Z7tVfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbzJ-00000003Oug-3YAE;
	Fri, 22 Nov 2024 22:18:53 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbxS-00000003OSz-1zH1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 22:16:59 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa52edbcb63so51200066b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 14:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1732313817; x=1732918617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HrdX116se3rn9QRZsQ51ceQKyywuhiVyeVP2xiWD4c=;
        b=RgLRghQWUXlhTVNQ3YU6IRIv0MncJJhwnRf+HH9KE9mGhFVg7g5/Y21RxCyfQXd9tI
         qWvkKvWe24S7itOP+x6hg/1AI+8YzQ/8Dc4yfCmWPneTCxGsjn7eJRwnSl4M8TGhYfX5
         MpIKzZtmwEI9X7HMJdWuXM8IN457u04VSHFvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313817; x=1732918617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HrdX116se3rn9QRZsQ51ceQKyywuhiVyeVP2xiWD4c=;
        b=jISJeB6XWhErZcLGkcTspUZGC7Eh2F8WOehP3R4wtScdPkQpP7NJ3oAhevnBCUYpI9
         S1jVSeX2eLnqfPV1ldxMYL9D6esmVNsM8HaJYS7s5lUIBDoGxsMGj0s9DfCUMN1UzmQI
         6/MTzSRPEQXQajkxsQEOeTSA7O4bF8oosnlxYBsjTMy3bC+JxSF2x5efeoEcIkBCWQs2
         W/EzwI5NLrnnjju2UZQbFeWNmQnUnUlug0YrwdaSiYyUq0sbDIcgDfSHauIvgP3t/Pa3
         MyI7Rv0ANMZsvAXxbZjgJeBaewdtc0f20rBDosTtO6QsCxrrG3f0n+B92nYtRSXuskwW
         LUaA==
X-Forwarded-Encrypted: i=1; AJvYcCUlzhJkdTaHQbFLOTPfNKVkxcJSKmazwk86NPvr7qsQPcpFzupIJLvcsfNi5Gwu7HQ1oLfZLrVpDFgkAN8d+tVg@lists.infradead.org
X-Gm-Message-State: AOJu0YzrxC1hAo9LYXnNZiRZI1JgysGjLnJQCk9+Xmt8rPRdA6+KvG1M
	wjluYKpRWmNgZpOAwQzKp82DbqUAjVf2l4ukjsoYxYMBvXbyZcROSSiE67PdRgU=
X-Gm-Gg: ASbGncu9PPpMkjoDMhfZr7MBj+b9Wg/fswiCiADUX1UCLLb9JKcbvK0U09UDFjTrgtR
	9+e6lgp/EJ5pSbNlyqpHse/YliGwquA9fv9PrHwVrMTPUT80ymewxWL0kSVdb58PF4LKlIUSNk4
	tcnpI9+ylIxfa+Ns6wqZzuBoOWuSz3Qx7/cyoNGjSrkG2RhzzFxLoMn1J3LVFeR+7/KMB4P+l5O
	w2/ONH2pTosB1INGR+Oiv+MxsMCEYj8W7Kh0yaKYED0pS7noZZRG/7HOPtYKGJuvA/NE78Tx5b5
	0MHHuWYS0YmBuf3OQiPeQ7qZfmMkM/Fotd2o9dWUjGkQkEPs93Zv3aZIe1+eGrZ3fxAgt/2zFqV
	ydya3CB+SB28dWgfS
X-Google-Smtp-Source: AGHT+IHRSafR/Hd70o+h3rYpO/7VHYMjBwxEdj1MERjp9IAi6352iOe+u8OcuPheRZbM1LDn8364LQ==
X-Received: by 2002:a17:906:31c1:b0:aa5:24df:ca8 with SMTP id a640c23a62f3a-aa524df1311mr297959966b.18.1732313816670;
        Fri, 22 Nov 2024 14:16:56 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fcebsm148226466b.127.2024.11.22.14.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:16:56 -0800 (PST)
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
Subject: [PATCH v2 02/12] can: sun4i_can: call can_change_state() even if cf is NULL
Date: Fri, 22 Nov 2024 23:15:43 +0100
Message-ID: <20241122221650.633981-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
References: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_141658_508451_9B7A57AA 
X-CRM114-Status: GOOD (  12.12  )
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

The function can_change_state() can also be called if the allocation
of the skb fails, as it handles the cf parameter when it is null.
Additionally, this ensures that the statistics related to state error
counters (i. e. warning, passive, and bus-off) are updated.

Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Added in v2

 drivers/net/can/sun4i_can.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 360158c295d3..17f94cca93fb 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -629,10 +629,10 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 		tx_state = txerr >= rxerr ? state : 0;
 		rx_state = txerr <= rxerr ? state : 0;
 
-		if (likely(skb))
-			can_change_state(dev, cf, tx_state, rx_state);
-		else
-			priv->can.state = state;
+		/* The skb allocation might fail, but can_change_state()
+		 * handles cf == NULL.
+		 */
+		can_change_state(dev, cf, tx_state, rx_state);
 		if (state == CAN_STATE_BUS_OFF)
 			can_bus_off(dev);
 	}
-- 
2.43.0


