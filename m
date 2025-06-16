Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DD1C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=; b=O3hzRsYKiPLyKsrpOulkVTxeJE
	h/UCxx8a3L0otKCNVma6CtO5W1sOOlJBwtERQCI38ZMnmCaYLALY+9XRnUuPut273b1RtJ9OHmaWH
	UmVHFy8s+dxxqxR8C/HQxZkJ3hp9wiuPr7iURBdL9wXr3KX9DICn9YsRWzzjf3JS9uX2UUyNqOZqJ
	6FscmMXZdoCqwoTzguNf47u7n4MZlF+OLytMVh4YaQDjwZrYH8iEjuCyFSAyu8Q69RF1FCPMYVJX6
	ks971oMlCopuPf8o7jwwQFyiu3xcF67SeU01x76pxOtgLxnegSHbz/aQjz9o/DschDg2IrrIT7ntL
	fRd7KxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4Pn-00000003fJM-1CVl;
	Mon, 16 Jun 2025 07:37:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4CV-00000003dEs-0eQW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:24:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso2761951f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058653; x=1750663453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=;
        b=W1NPvoftlRYMBnBO5dKNM3L+U9+++7Q7WYm7fBuE69Sc8W5A+YECUeZWl+UNqDrjv1
         vqz8rUu3HW7cowAP7x/YDznJvv91t+uZaPIXXcDjQaKLfnomIN1Z0Gd08lcc4VhG4NHy
         1BbJ7G8l1S4OLthUbfZVnRZQptI2tc1lozdgeybXPGWS00IDnGpozHZdBU6OJHNQY6Gb
         a3unCnGGRLStLfqE5nYt6ACvTyg+A264se1OX610lYQu8wYtIonytmXw+zz71Po3Ibs2
         NwlYTdeWcPMNYcficmS2tvuhmKcljxMRXxvnROvY4MmwcG+4FeRYbC4MoQ/di+j/lTb8
         a8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058653; x=1750663453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=;
        b=A82Egb3T5Dw5XUjnLFZnmE+jDROxdJ6DWz+TlJ20KGAIcj8mldmImlxDdWWjNiD/sF
         MdXXq0/zvxszC1WKFB2s4cutZLqAaFKNFA2uwnVJeyxfpZT5akNeYUPqNed/HHFuH6+M
         FUIWweXeBvOAFMFB9uwaBk2SzqakEJVXcapP2i0gBHv04kUs+wD/DC4/Sv2xCYP6WPMb
         gzEc8p8P0IOTLkzaW61tBxd0hjFHimqAUAm/l1phiRvPFJ+AfHbD5CrKMK+goKVlnT8f
         Ozzw7bPRyhMKmtZ1OLIVJuazw1+fEL4Seevf1dQ360EjuQWuuIycCkZ7sj4EDY2O67jq
         0JHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3dc4TFULjscAxkwBCA/30QLBELhsN0vpbM1xHe2nRwVKUXtWXWoSjfpIMbxZ9IjHzzm3TKy369+JdZe73BTT2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ANbGmjAhVGskpZPlkG4euH1D750zKTN5+EK0/fbsJJ5b7mc9
	Ngwqwr39iSxxj58yhHmbSF75GPAMkSYuy3bbtk2G3gqZ8peygT/ITxv2EEugHnMhG1g=
X-Gm-Gg: ASbGncvi6TXBrh82OIuNPA5eAL38MaB/8Vm8Z0NbUE0CZb2wQ3bHep6DXcTm224ORmx
	d6trNhjytfcF/OMVPOpEzpBqKzxwFI7XY5WcGmrV4ZqwTtpwBxJRe/VoQF21Mu9mCf1pvf9fXl4
	RYaSFxfpIuWgodOC4MH6A4pkWhK3euhBLzyc8JNT/IGy7JXcphlhPnRxNt3Yt0nrMbbCQmPsbKL
	tlLOAxN21PMV5y05326xCsUqLD3Nj2nBK/rBtmO2dWZKbgzRJ+vJBWii8WbgJlzTFIGhgDObuWe
	OSADV5elIqAjZx7nSi5eJLTZpHWYtAbxiDghtk1REE1i9eVmihHon+y+
X-Google-Smtp-Source: AGHT+IE48oE5eDJIxJr49h4oPA9YTDo3yEljfvV96IR3ebuis1Y0vz3HpGqAPiP6g2TbjN9gjF1/TQ==
X-Received: by 2002:a5d:5c84:0:b0:3a4:eecf:b8cb with SMTP id ffacd0b85a97d-3a5723a2912mr6781229f8f.28.1750058653481;
        Mon, 16 Jun 2025 00:24:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:24:05 +0200
Subject: [PATCH v2 2/5] net: dsa: mt7530: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-net-v2-2-cae0b182a552@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cOyYyWO13YQfp2ycss27bUpedNvkM8EVvpF8/6G0QtI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aZqs67TKrhqmdTVUjIoXv47OQEQk4qYQvii
 bxg3qrFa4uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmQAKCRARpy6gFHHX
 clNmEACl+OMZ074SDpTO5quUC0oukmH6+JnHqbSET6X0mc+EKoxRFJtNYk1S7dEVI7pnlXXHqFJ
 EYqqyONv4VGeyya19QXIVGMTQ5YxveS8KU9oJqadT68LaqtzeN80I/jytXGjosU13hfPq7ik3Q3
 VK0wciohlIegPmNaiWvGcrTEq9+N2kDt1z2tSvqOOa8YaSJRsjOaVdJ+33G69qAhVeo1QpR0sFy
 27L9k2LOm1kLkB9h1D+eXYXdd1/zxNirXig639IS6937NDqd+qY1hREQVFfRxmukLIBEfqBPhoC
 hssFvyR9bfn6eUhrAIbdwRlaedEal8z8Kj+Q8c+5TFfxhwGAWYl7kHPvF3VpEglD2DRjfjSYRdF
 Ec2pHhXTAk5RLj0pI+h5d7zfLEM3VHxPbjWduO8UuYxRW9xxG/wz0djaFo1b5l7/+GiBVg68xuA
 nzpCHL4yltPGaSEHPgi6LM9spinJ0ltWp7jLvZNpjon/s7g9JNyd9l4IZ8tke3r4oZsQcteNgnq
 v0AC3pvn5aXiElHgDk3A2UtMmDi5LSNT7rwwmH3LPr7eZ1S54gUIXzS//yw6rBXShyicjaMI0Ys
 J5HE8b0C3wj5NlYstP84STJxDCgmHrH7Q9nhez6HSV5b0r/fHguIQzfuT89ndCGVn9QazsU2EQD
 exXyAvqd8zwLlYQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_002415_209571_B27D388B 
X-CRM114-Status: GOOD (  12.42  )
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
 drivers/net/dsa/mt7530.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index df213c37b4fe6ab85fc5b01c62297a35b7b6b2ed..e5bed4237ff4c46457b46598f07b65d0daa84ae9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2112,7 +2112,7 @@ mt7530_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(mt7530_read(priv, MT7530_LED_GPIO_DATA) & bit);
 }
 
-static void
+static int
 mt7530_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct mt7530_priv *priv = gpiochip_get_data(gc);
@@ -2122,6 +2122,8 @@ mt7530_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 		mt7530_set(priv, MT7530_LED_GPIO_DATA, bit);
 	else
 		mt7530_clear(priv, MT7530_LED_GPIO_DATA, bit);
+
+	return 0;
 }
 
 static int
@@ -2185,7 +2187,7 @@ mt7530_setup_gpio(struct mt7530_priv *priv)
 	gc->direction_input = mt7530_gpio_direction_input;
 	gc->direction_output = mt7530_gpio_direction_output;
 	gc->get = mt7530_gpio_get;
-	gc->set = mt7530_gpio_set;
+	gc->set_rv = mt7530_gpio_set;
 	gc->base = -1;
 	gc->ngpio = 15;
 	gc->can_sleep = true;

-- 
2.48.1


