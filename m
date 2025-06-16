Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D911CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWpvlitNQyjX/3TaR360oAQrBTAeMtXI+WOaWtAQaSM=; b=XDMtVjzNppMNvT2jqd5tYLZvln
	cru/Iu2jvPbqtt5NWT4YWfIVpWeDOxowN89N2wBkIPPc1SPBOHPlhTN6/TJqDa5eLRQXt2YjeVVni
	SczvnqQ6mXWqJP2FF4Aop0R62sNNpFkMKTfXEL8XA9TyceQ0xKdf+hqanWuXXxOAEORD25NVudY6k
	dAuCV3HIinuT9tRqS4QC6XhO5mr4hmb+dy2m/mrVQ083zsO/JKZo+AQzwMFkRtJ1hOQ1vLia0zpNd
	son7J0E9mtLyCiy5dicZQLxrjTBqIWSbHb3shDVkFQAIcILxrO22UQTfVWN2RGqJfD0WCGcQ9iIU6
	+gzVRS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4UB-00000003fyS-2VxM;
	Mon, 16 Jun 2025 07:42:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4CX-00000003dHr-3fCB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:24:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-453066fad06so30621575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058656; x=1750663456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWpvlitNQyjX/3TaR360oAQrBTAeMtXI+WOaWtAQaSM=;
        b=RSmH88nPL/WLd+ko5ELEpB06dLJlAe778vjpmrHRU/fXswA53Dul9skSYIgOGFnaYK
         Ilv5AixGs1hpLGKVJtVRrj/uCTzjADaXFEiyqpDquyR8szlLgOkuPEejT2lLQL4DH9zR
         JctMO56ENh9esdT51IpUuhjMA01BWJZfbgonTMQyxyJHhAFvTzdPJQehc9Bp0845trJ4
         GKYr6fYTFVk+rjBy/klcwmFkYwJ8oJ/vZxfGabAw0VR2a5KhrMC6jtAyXxJ6fZAPityW
         95BSFzibNsmVDTk1sbbVkc+lxYO5jc/SG4PNhxQ6XS92dmZL9eMHg8+Agx31hJD3Yg7x
         5CEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058656; x=1750663456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWpvlitNQyjX/3TaR360oAQrBTAeMtXI+WOaWtAQaSM=;
        b=vEVl33ChpZVKpRAzbrN0S+3j/cmUTjsVDwKNInr0sFeYuw8ppO74HfB+LlzyB4alIp
         gMDcLSzRVxoLmgIqXRBFrBgqjwI4EJeFh2ZGzzfsTEj/L5ETZmiRnX0qSoVxV42eH+XL
         Ck1aeKgokS0LCBt58T+00SlrYey8jRwQcH3sBbS1y3KyWTgp6zc0MXsXVSFOB6FjVywk
         Pn/nx0eRuuVbjXFWV68IJ1SEKMFETJ8Dov0LIe91lD1MnlAaRCldQq9Eupq2I5SUkK2j
         ivpiip1xvkXTuiWCGX1BiF73/IQoZMGA6bun+qnjpU6s6oNpOgfxfrwRTqd9LadE2APc
         Svtg==
X-Forwarded-Encrypted: i=1; AJvYcCXvpq7tu6wtstZ16yGd0W4B44F3Nh+ki7PC0q+pVJ7aZd5vnIyD99utTxyRzjWRPyR5Ow9XQXCtmA78QZ9rTfki@lists.infradead.org
X-Gm-Message-State: AOJu0YwMMRnnG1aq7KGuVt56hOYd8KNv/rXRGrwRJONDwaozS0l9HMqi
	jl6xZAD1pDPA1Bs/B9RoY/KnELcmsa/5pKEVaPXYymIqvfM/h14U+Jcq/5rpBc2sH1E=
X-Gm-Gg: ASbGncudAXbyNQjm4RiooegmNs6KgBHnIs2j5kGQjoyprNHWZdEwns7e824p6JueF6p
	ZBZq3wjZiw1PQBwqftUt60pUr0sRT1HbGm5Hq/bxt89BLKPlls1KX6FXOzv06pBHLfsf/dtL4wu
	XdfbuygsLrK9MlO+AWhIn43555mMlHT46nUIE2BcJbWUvkUIJruywgEp6kVuYMSELGE/GGsTh/h
	y9mytDR1PYRdsdVj51Pfym1fStKoFWzu1wRFe4f8Vmd2ICuIOVZ56aVYDf1muo03HF+AquTUY5r
	4GGACD0RURcpm1VaxDcmN3GGcChx930AxSzhuu6echbzBxs0l9Tdl2S0
X-Google-Smtp-Source: AGHT+IG60Qst8hEoeVHJrOe8WgEudvUhx+mpO473XIVAY3lrRn/4uizUbO770sqASh+Stcf20K9q/w==
X-Received: by 2002:a05:6000:1887:b0:3a4:e393:11e2 with SMTP id ffacd0b85a97d-3a5723a22d6mr6934662f8f.34.1750058656267;
        Mon, 16 Jun 2025 00:24:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:24:07 +0200
Subject: [PATCH v2 4/5] net: can: mcp251x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-net-v2-4-cae0b182a552@linaro.org>
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2706;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lkJ86orkP2RFoVEY51zoeHCrs4bybXiW/Oh3wEXk8Lc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aZQKikr6KLr+7sJ83F72c4Qw2op7eIEQMdv
 SZWIKBUqIyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmQAKCRARpy6gFHHX
 cmMMD/91tStvBSl3Yl2SLPgO2b3FWoqjotFtD9nwyncmCBZAaKQaMsQe9bWB7/9rqiuJTzGliVu
 rlXPWr9hparqPA5clW3XAkCo77zYB8ea47eoILRXc/zdlqkJ6x+zgY6LrugVt8Uviz/0d8/z47x
 KZBnL3k+VnNoAIOhiCp93MvuBcGJjh/ufkABKWOxleQqVxAlwaEjdeGpn6h/EzHECApiZy+w9C1
 WEgI2Wx+xQ0FUrvhc2/GNSV7vQ7dtde0zYOK/T1R7CuGMsXQrMcBoY3/1MwKBbLstuPTmZ3nRa6
 Aw/KQO/PInbLvdftJA0kNzp3PZlBiG6EaXCwxN4JDNy6NamYf1kD/bGN69y45Ug1A1V7+jQVAUm
 G6OnyqsTaVo+xHwv9zs23rhRM3tdiXIwLzEhCahGLa3POsNGle6cmp04dQEUOgNmE0oEpWrB3GJ
 fWpEh0l6ewJWmPUMB0YjfYyeBQkc1mmo+cJd5nrhyNxNrmnB+MyMlxxuOMhwXHymJTwlLk0qztO
 deyO3oZa7k42NQcrmz76wLzL3IRRhC3K6JqMRUj36MtULNvrKNNM6xS34kAKd+CIuNCuElPWpzX
 rzMsMO6As+RxHRr+IVZB1SM0jlr2VvYCXu/pXDUCayEgXwQgo4KEBWnN1OQqIg80E22J+g8ARGL
 WXvAcETCA/XZPWg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_002418_003448_074C415F 
X-CRM114-Status: GOOD (  13.28  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/can/spi/mcp251x.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
index 60b7fd3040d02f114693cf66d61c8a075a32e278..5a95877b7419b4644664b2115c6b43f4b586cf4c 100644
--- a/drivers/net/can/spi/mcp251x.c
+++ b/drivers/net/can/spi/mcp251x.c
@@ -533,29 +533,35 @@ static int mcp251x_gpio_get_multiple(struct gpio_chip *chip,
 	return 0;
 }
 
-static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
+static int mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct mcp251x_priv *priv = gpiochip_get_data(chip);
 	u8 mask, val;
+	int ret;
 
 	mask = BFPCTRL_BFS(offset - MCP251X_GPIO_RX0BF);
 	val = value ? mask : 0;
 
 	mutex_lock(&priv->mcp_lock);
-	mcp251x_write_bits(priv->spi, BFPCTRL, mask, val);
+	ret = mcp251x_write_bits(priv->spi, BFPCTRL, mask, val);
 	mutex_unlock(&priv->mcp_lock);
+	if (ret)
+		return ret;
 
 	priv->reg_bfpctrl &= ~mask;
 	priv->reg_bfpctrl |= val;
+
+	return 0;
 }
 
-static void
+static int
 mcp251x_gpio_set_multiple(struct gpio_chip *chip,
 			  unsigned long *maskp, unsigned long *bitsp)
 {
 	struct mcp251x_priv *priv = gpiochip_get_data(chip);
 	u8 mask, val;
+	int ret;
 
 	mask = FIELD_GET(MCP251X_GPIO_OUTPUT_MASK, maskp[0]);
 	mask = FIELD_PREP(BFPCTRL_BFS_MASK, mask);
@@ -564,14 +570,18 @@ mcp251x_gpio_set_multiple(struct gpio_chip *chip,
 	val = FIELD_PREP(BFPCTRL_BFS_MASK, val);
 
 	if (!mask)
-		return;
+		return 0;
 
 	mutex_lock(&priv->mcp_lock);
-	mcp251x_write_bits(priv->spi, BFPCTRL, mask, val);
+	ret = mcp251x_write_bits(priv->spi, BFPCTRL, mask, val);
 	mutex_unlock(&priv->mcp_lock);
+	if (ret)
+		return ret;
 
 	priv->reg_bfpctrl &= ~mask;
 	priv->reg_bfpctrl |= val;
+
+	return 0;
 }
 
 static void mcp251x_gpio_restore(struct spi_device *spi)
@@ -597,8 +607,8 @@ static int mcp251x_gpio_setup(struct mcp251x_priv *priv)
 	gpio->get_direction = mcp251x_gpio_get_direction;
 	gpio->get = mcp251x_gpio_get;
 	gpio->get_multiple = mcp251x_gpio_get_multiple;
-	gpio->set = mcp251x_gpio_set;
-	gpio->set_multiple = mcp251x_gpio_set_multiple;
+	gpio->set_rv = mcp251x_gpio_set;
+	gpio->set_multiple_rv = mcp251x_gpio_set_multiple;
 	gpio->base = -1;
 	gpio->ngpio = ARRAY_SIZE(mcp251x_gpio_names);
 	gpio->names = mcp251x_gpio_names;

-- 
2.48.1


