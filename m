Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9C4C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Prze7KarTtiEr9ULuOe3gPur17rt7b2Vlkz0iOaKSnE=; b=s2THiLADqODrCeFNk9dGAqPQsU
	mGZ7Ms7l2QuF5VJ1yAqYWY9NDEeQoZ/Q99E1nCbhsyjiJfWs89AxiAi3o/e5hrQyb3piw2M3G9t8w
	SlvIFbvAsApVFL2UOiGLW6u/ualtG4z+JqUw8paiyfhtBUVfzP/0WemROAOkEvqTTJZwpPTRghMDH
	9eJNRUh2ZOseSbjrKOK+zAzH1Q5YDvyoJ/9D9P7JxK+MnjcyfEwM5BdctQoxZUqAl1Kt97Te7IR3Q
	5YYFT+X8MZN8p8QCJSPyCSx3A5xHrRUwl3KX57P4HOCZEvv4q05eJB2tWJ9UON6wNMKyPObo2OrWn
	nfKXhZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4S0-00000003fUE-0ZrO;
	Mon, 16 Jun 2025 07:40:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4CW-00000003dGG-23eS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:24:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2885289f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058655; x=1750663455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Prze7KarTtiEr9ULuOe3gPur17rt7b2Vlkz0iOaKSnE=;
        b=n4/zolbHz2dddZF9t1uQZSo44ekNLF9J0ZAtMSqe7PWhPZk0dn8mMX7cB/GxDcuiaa
         mrtzrZYxYDF3IRlPOjx09a4XvGa9ENhab7M4jH0GMorDf/uztN5GvEDSoFHAOLsMwyB/
         TSlQb8M9PkLsbAVd7IHCEvO4hwbsdsCYUJ9viJ4m20049vTMLFNe4XM3/WTnYTb79pOZ
         2dNTuWsXyZkfMy9xPGXlnBC5CY5vo+72447e+KsFAJ7zKJTbuDvjTbhQv1dVuw7pZFWz
         st0q3LsgOwdPVchlSGr2eC/kCMUKAJIx14Q+40zUBe6ECpMNsprNrtXN5AhcHvPA4uAV
         osvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058655; x=1750663455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Prze7KarTtiEr9ULuOe3gPur17rt7b2Vlkz0iOaKSnE=;
        b=Uv1Y8BXeGCcfVtELewZdUGBM55ef3FuiobCdNW1P7MwthEBUcet8JxeCcL+c+Fdlxq
         iXT2ARA/S2bjy6cWyUyF9aNr2HQsmB1cmFD5lKtc0xxI7O+rnNXlFpi1gLnZ+nAUln8m
         VBIIKW9BSbjKc/yPBDmK0l+k8QCirNeCrfojMZSEQmWoU3p7ZVSMBqbV46FisGSwAmgh
         NMuXj8GmdHYz2wMRNdykwSIudMlU/Azzr2p2JxOl9vXyVU147asc7Ud3ap8NSzp7/ayK
         fREg5Jc7S2rhjJ21UdmnuFHxv523AmTlybxY/cXI0/U21QA97e5oMYVmja7b2mwyx4Xp
         f4Og==
X-Forwarded-Encrypted: i=1; AJvYcCXoFo9JXgTT1r+B241639limqA2El7NoFadizlLtq+iWy8sNloP/M+dmeXD0cE9xRd/aJFntqx/YuYu1dJDdVkz@lists.infradead.org
X-Gm-Message-State: AOJu0YwDHA1fLALYytGJbqjru2Yfbcp1EnO8Ptc/WteYifNT34DjoXA0
	6ThlzADBv5wM7GN2J1cHZFDzzs2bWsyTSzWYeTyKMmJfqFNjNggHGKuhwl/azhRQ5DY=
X-Gm-Gg: ASbGncvltfW5MgX4jhzuoqqLeyL0/PEQePcseOKFIA25uLeS+23U0t9+PPqjZkRo5e6
	tZKNWUBAg5ZcZx4aspMyc7EuT98QMgS3Lbvw9lk5cvi0MSwmZ/Z9HTfvKkcmNfdsGhosjS4zd1g
	KKb4wOJUDPTLEVpzhujhTD3kcev3Gcw7++fmt5lTo7IYtUhRNwEkqm4+kETLDs/LvJzshdMZmwj
	wZfbCes3d74V4zeQAeS9YuMwyf67IPWvOv4UVcC/MdiL9aO/2AjenLubc0vDOkDPdmuuu48P/iK
	P0Lb6svdC1nbZKndbr/fOmVDn6yFedyHO4fTD+LDlMqaIDpeWlY2cTpQ
X-Google-Smtp-Source: AGHT+IG/lAGJDXz/7A3CvJT8e5vgl3jiY1Lw3i6jYgkiFDTNWEgx2Zv5/09zy+DHigY6izksTnVhjw==
X-Received: by 2002:a05:6000:310e:b0:3a5:1266:3e96 with SMTP id ffacd0b85a97d-3a5723710afmr6864057f8f.15.1750058654687;
        Mon, 16 Jun 2025 00:24:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:24:06 +0200
Subject: [PATCH v2 3/5] net: can: mcp251x: propagate the return value of
 mcp251x_spi_write()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-net-v2-3-cae0b182a552@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9MP33N5pSy3OGgT8wnmaqvxECSreBBEZS21KtQDntIg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aZLt+zmsPfXHGowMV7wiRrZdvT9d0pjybCs
 eRaNCJ9eEWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmQAKCRARpy6gFHHX
 cr8SD/98aDqkM/VGj5uwtBE5gFWYPj5Z1zIx8qY+nCaRVn2DKwC2Kg4yMV70J9jSdq4ekrRinZV
 RnyJ7ds9/3L20t39TnghIi+GiIxnfHsIawEWyCLFFyEa+b4Fke0iOl/kx2jqaDSFM0C1C3u3ENG
 GbhKATNcf7F7G6DJ2xccIinHhEu+mBXrCrceO+kijsDh6wbut7AtETdESfZaIpQQXFCqwzKl/XS
 6Etd4fE9UpLJ2bmyzW7Yn1/TFo+/OBPgyujTYD2t7FkbOI4ytp4QF/Wl22eeoB7lysoWLzZyI8n
 nA6GYs2OMox0U1nnMmlIEaY2L/73AbfJwzTOV9wnUgLFPgZSW9JGRtzYINWTz9/DrCHmlMwljUE
 VNcYSKhQL1LOduvDgcp3j2z8rI9/aOKxIVCFkXTr0FVHxM2Y7rh+JPFN5sV0TVIDNX/H5h3LMl6
 OvVOPepI/+66wgHuOlV4dGNmeV/6yi2RcwONb7FHZq9wYxDJZtLX2fk6qLjQw8a1vXBfsiO/+Ci
 YULlo87CssHva7nhnuEC+iTL6EiiynLq4/MDVFCaCCFyAz9/cCdRcbyQx34tL8jxS2RAtH6OV48
 dm/bkqz6CxfJxgmvOTb4RBiJdfLXyyoctwXbW/4h9irmuYzMUuV9rctiyHDtoR/H4R1bWJ/dhf1
 u44dRSvvUN2+JGg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_002416_560960_3D4BB69A 
X-CRM114-Status: GOOD (  12.73  )
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

Add an integer return value to mcp251x_write_bits() and use it to
propagate the one returned by mcp251x_spi_write(). Return that value on
error in the request() GPIO callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/can/spi/mcp251x.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
index ec5c64006a16f703bc816983765584c5f3ac76e8..60b7fd3040d02f114693cf66d61c8a075a32e278 100644
--- a/drivers/net/can/spi/mcp251x.c
+++ b/drivers/net/can/spi/mcp251x.c
@@ -388,8 +388,8 @@ static void mcp251x_write_2regs(struct spi_device *spi, u8 reg, u8 v1, u8 v2)
 	mcp251x_spi_write(spi, 4);
 }
 
-static void mcp251x_write_bits(struct spi_device *spi, u8 reg,
-			       u8 mask, u8 val)
+static int mcp251x_write_bits(struct spi_device *spi, u8 reg,
+			      u8 mask, u8 val)
 {
 	struct mcp251x_priv *priv = spi_get_drvdata(spi);
 
@@ -398,7 +398,7 @@ static void mcp251x_write_bits(struct spi_device *spi, u8 reg,
 	priv->spi_tx_buf[2] = mask;
 	priv->spi_tx_buf[3] = val;
 
-	mcp251x_spi_write(spi, 4);
+	return mcp251x_spi_write(spi, 4);
 }
 
 static u8 mcp251x_read_stat(struct spi_device *spi)
@@ -441,6 +441,7 @@ static int mcp251x_gpio_request(struct gpio_chip *chip,
 				unsigned int offset)
 {
 	struct mcp251x_priv *priv = gpiochip_get_data(chip);
+	int ret;
 	u8 val;
 
 	/* nothing to be done for inputs */
@@ -450,8 +451,10 @@ static int mcp251x_gpio_request(struct gpio_chip *chip,
 	val = BFPCTRL_BFE(offset - MCP251X_GPIO_RX0BF);
 
 	mutex_lock(&priv->mcp_lock);
-	mcp251x_write_bits(priv->spi, BFPCTRL, val, val);
+	ret = mcp251x_write_bits(priv->spi, BFPCTRL, val, val);
 	mutex_unlock(&priv->mcp_lock);
+	if (ret)
+		return ret;
 
 	priv->reg_bfpctrl |= val;
 

-- 
2.48.1


