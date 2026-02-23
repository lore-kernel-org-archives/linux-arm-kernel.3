Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEF4EA4FC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdwzVEey6I7USs7waZMdzZIVAgnmK4BTn29UGHk3ryw=; b=ae349SB+F+QTZxnrnjJSagoip3
	ixZfSRwu7wi1aFMTILjBBAOz4fnsLU9AbC5zwoj2i2eUz+WCdyzTF3XmXcv+kSFmQbFWQpM/p3Jrf
	X1/b37HYfGUmNdW4V1CJRrFSA3AaGtd1ieVcuX6hk7JywGk3RHGRcLa4ZEj6MNldXYDwZwXRbbX1T
	N2BQ/Z7oQL5CFh0kUJUNSzxnUAnUhFGOwTceKAjQaby/yN8/gv8K9KzrMbkGiF5brGMlgEA4EFKbX
	UgpJiMHatjLy+griL2sG8JhnqYGWfitXnFNBNsZlGrW3wThrFGJiagt/8bCaLbyOuJ3dJ5CgE2zDz
	/y/akbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0X-00000000TWs-0IrK;
	Mon, 23 Feb 2026 14:33:57 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0S-00000000TU4-2idi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:33:53 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59dcdf60427so4874384e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771857230; x=1772462030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdwzVEey6I7USs7waZMdzZIVAgnmK4BTn29UGHk3ryw=;
        b=czGgcFqaGxEAIajZjUJmEKsXj7YANG5lJkkLypzQ5nsP0HLTyH5RCD5UDdQ7GYM5ps
         PRqSlZeeHjj/ADOGNzHbcQLhFD9P0tBWR9MXf7/QTWY6ISgWStl3U77sveoBzfDDFJ5a
         /0p3gD7X2mOZIG8jatPSxgvbFk90pQ4B9aXyoxygJ3DEJ6fwnIAmTHUj/rh1vaQ4Jni5
         3gW3Ynu3JKspw4D6T87Zr9FakSxxPpwD8BYUaFmV7LBidAibT9gV7wQrcgU3jG+JR7qG
         KUWd/bF5RJyy/TQuGk4qTHFbTd8XeS7gJ/dC+UB2HKiKPAiTmPtzehfLML508y9o5vr+
         rF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857230; x=1772462030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bdwzVEey6I7USs7waZMdzZIVAgnmK4BTn29UGHk3ryw=;
        b=s8/MOiLMKtYy8VmR65evnfVdB1iKoEqCnOL26+EhHgkBGkAo3iaHkNMZi42ZZp5mgE
         On6Fxy/bAxuuJxs8wCeyfei49OJ+SeMqoIOPBjyd2leEHyNSYD+FHfvkD3AloiYBTxWS
         O/w/Xo7lTsluRHo7+gUS3N0J2VO9QxghVeGsgIX63J3HJKm2YgIBO3/LrSIRZg3/aLNY
         tUHf/9bj3r/tvkKDJYo2SsYOsxclpC/zoABlzgLBhn8kCFMKB+tiXZGj1Lsg9Gh5c+Ff
         W0hFiAljsNnNdTdkQqpq9SgTUChCD2NMwFsu18di+3vsV8zhLErQh1L0Mh6WBNx/cNcS
         AjGg==
X-Forwarded-Encrypted: i=1; AJvYcCUfUoPuJPYTaJGUdj9ypnrmaUrjzUgJeba0IhLWCITP1mjqMKU5C0JyNZfWq6kLGUCnfx44/vzRpWnK7g65v0Az@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6S1fNaMKDozkZlXhs6qBxmy+dFYksl4oSE1pMHgBKrbYCypT/
	tifRBDNN8a9DGNgUu1u4bKTCOX9VJnMwiCkNcb+Sfby4WZByh1Eo9BMW
X-Gm-Gg: AZuq6aJ5fKT5Va7Sc5vYvXXh0UhpkOZjIWAZka5Kl7MbN2nuxZgFtf1OYnNRO7+YA4W
	sGbt5UQ+aUqIrgAtxmud7nIUAo31ArUCOVwxUY3nQB4b/EBOer8wLGZudEi5wPtmDPy3IuyXLGo
	c/S/qQAovuwbZ3JX/0wdMGBRqKK7tGMgBYfsRfTKg+yukaH2iRpugqrXXdL4hafklguL7lECgl0
	Q4HL0FTBYDuAvbHkRbljTIp9wzmmuOJq64I33Z9/eZfyWlIYaX+P4DB7Y64Mnn8VDjHuk3UIvQr
	Zno+wsT1F3cAshf2yjEdmpZefrLnYkH5bBnsz9FkTnUb8wDzdAmH/w8lonlkXce2btQrDQzWgq7
	pEXgCxIl8ikDTi/c+WRe1OXl/2Z6LNFhcuIiPR8hianCHNrFEB6Ui/CjZYWxnVwybvdPlgeXKlX
	3Dr5Jrqf3f/oWuVXdxxLuTnG4BrO2WoKIRVef6ughVmbxv+ZTUJetMDwa2fzDBMITRgd3G
X-Received: by 2002:a05:6512:3b88:b0:59e:2242:fbc with SMTP id 2adb3069b0e04-5a0ed89aaf1mr2837745e87.22.1771857230118;
        Mon, 23 Feb 2026 06:33:50 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb16344sm1631709e87.37.2026.02.23.06.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:33:49 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 23 Feb 2026 15:33:51 +0100
Subject: [PATCH v7 2/5] i2c: mux: add support for per channel bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-mux-v7-2-ec75b214718a@gmail.com>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
In-Reply-To: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7623;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=T1ZRGejY53iNiPMBXm4VnJeMfnzHH7k7DvyBHsdYhe0=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpnGVYCPqM91GgwZmF9aiuRWi3kupzj47baPEtT
 DDralVjMaKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZxlWAAKCRCIgE5vWV1S
 MofrD/9GqYIqO2Mb3oj/ExjXYNRw4CPXDesKMiydZsbTYzy/0s1Iosvhblktu/xEAiziD8mYldP
 JnntcUhFXTn1pIfGg/oZ/QHx49ZPAnVJdnzgu0U5UEoKE5pPomoIdRjs3bgIKiOUWeoPBjaHcK+
 lHmySCknIiKLafDQnlTH7MPJAcOKNCYy75nNEC4b2bT38T9ujKvFiwlNiax0qKWuSn8KGjYKZu8
 PtSFwvnNqK3GOLSdoBMCkSgvVLPzRRBHH3G7GHC6V+nNFpv57vlM93tLm3lD7+pa/fX9KCW2zvl
 sQ1g4XPoZ3hQclD7XhLRRLY2SQpCMBukenUjjysClTZzEY0bJ0jBcU1Y/2fQYKEsbMl0+er9ebJ
 GUeewjvEtKJ6gAKUgJ7TB3yy4mW7IP2It2JtfzCxjelNfl18gNpaKtnw6WXtfSbpSLLIkPFK98E
 jGkSNO06Mn4c3M94+ohA5db/O+WdOMFNZM4d6OXRfVfG5dxXrJdA6590srMDl8fS2yPuRrHYO8j
 u9dNCOiLyJ6CJ22pSXak4GBLKcEH6nwtM/93isyTZxjpYDhd7bgnFTklIHHeBYOQE3KeRAxQ/xk
 7Kxwl2SHt0ZTLDynJ3LKdEN0wvnR52pNaZBxYKQhFQOO5L2odiR1khuTMAweoU1wdnPHm01mx8V
 IRfl5jMG7k/p2+w==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_063352_750955_08E380AC 
X-CRM114-Status: GOOD (  21.62  )
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

There may be several reasons why you may need to use a certain speed
on an I2C bus. E.g.

- When several devices are attached to the bus, the speed must be
  selected according to the slowest device.

- Electrical conditions may limit the usuable speed on the bus for
  different reasons.

With an I2C multiplexer, it is possible to group the attached devices
after their preferred speed by e.g. put all "slow" devices on a separate
channel on the multiplexer.

Consider the following topology:

                      .----------. 100kHz .--------.
    .--------. 400kHz |          |--------| dev D1 |
    |  root  |--+-----| I2C MUX  |        '--------'
    '--------'  |     |          |--. 400kHz .--------.
                |     '----------'  '-------| dev D2 |
                |  .--------.               '--------'
                '--| dev D3 |
                   '--------'

One requirement with this design is that a multiplexer may only use the
same or lower bus speed as its parent.
Otherwise, if the multiplexer would have to increase the bus frequency,
then all siblings (D3 in this case) would run into a clock speed it may
not support.

The bus frequency for each channel is set in the devicetree. As the
i2c-mux bindings import the i2c-controller schema, the clock-frequency
property is already allowed.
If no clock-frequency property is set, the channel inherit their parent
bus speed.

The following example uses dt bindings to illustrate the topology above:

    i2c {
	clock-frequency = <400000>;

        i2c-mux {
            i2c@0 {
                clock-frequency = <100000>;

                D1 {
                    ...
                };
            };

            i2c@1 {
                D2 {
                  ...
                };
            };
        };

        D3 {
            ...
        }
    };

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/i2c-mux.c | 107 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 95 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index d59644e50f14..df18930d6ed4 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -36,21 +36,75 @@ struct i2c_mux_priv {
 	u32 chan_id;
 };
 
+static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id, u32 *oldclock)
+{
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+	int ret;
+
+	if (priv->adap.clock_hz && priv->adap.clock_hz < parent->clock_hz) {
+		*oldclock = parent->clock_hz;
+
+		if (muxc->mux_locked)
+			ret = i2c_adapter_set_clk_freq(parent, priv->adap.clock_hz);
+		else
+			ret = __i2c_adapter_set_clk_freq(parent, priv->adap.clock_hz);
+
+		dev_dbg(&adap->dev, "Set clock frequency %dHz on %s\n",
+			priv->adap.clock_hz, parent->name);
+
+		if (ret)
+			dev_err(&adap->dev,
+				"Failed to set clock frequency %dHz on adapter %s: %d\n",
+				*oldclock, parent->name, ret);
+	}
+
+	return muxc->select(muxc, priv->chan_id);
+}
+
+static void i2c_mux_deselect_chan(struct i2c_adapter *adap, u32 chan_id, u32 oldclock)
+{
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+	int ret;
+
+	if (muxc->deselect)
+		muxc->deselect(muxc, priv->chan_id);
+
+	if (oldclock && oldclock != priv->adap.clock_hz) {
+		if (muxc->mux_locked)
+			ret = i2c_adapter_set_clk_freq(parent, oldclock);
+		else
+			ret = __i2c_adapter_set_clk_freq(parent, oldclock);
+
+		dev_dbg(&adap->dev, "Restored clock frequency %dHz on %s\n",
+			oldclock, parent->name);
+
+		if (ret)
+			dev_err(&adap->dev,
+				"Failed to set clock frequency %dHz on adapter %s: %d\n",
+				oldclock, parent->name, ret);
+	}
+}
+
 static int __i2c_mux_master_xfer(struct i2c_adapter *adap,
 				 struct i2c_msg msgs[], int num)
 {
 	struct i2c_mux_priv *priv = adap->algo_data;
 	struct i2c_mux_core *muxc = priv->muxc;
 	struct i2c_adapter *parent = muxc->parent;
+	u32 oldclock = 0;
 	int ret;
 
 	/* Switch to the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id, &oldclock);
 	if (ret >= 0)
 		ret = __i2c_transfer(parent, msgs, num);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id, oldclock);
 
 	return ret;
 }
@@ -61,15 +115,16 @@ static int i2c_mux_master_xfer(struct i2c_adapter *adap,
 	struct i2c_mux_priv *priv = adap->algo_data;
 	struct i2c_mux_core *muxc = priv->muxc;
 	struct i2c_adapter *parent = muxc->parent;
+	u32 oldclock = 0;
 	int ret;
 
 	/* Switch to the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id, &oldclock);
 	if (ret >= 0)
 		ret = i2c_transfer(parent, msgs, num);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id, oldclock);
 
 	return ret;
 }
@@ -82,16 +137,17 @@ static int __i2c_mux_smbus_xfer(struct i2c_adapter *adap,
 	struct i2c_mux_priv *priv = adap->algo_data;
 	struct i2c_mux_core *muxc = priv->muxc;
 	struct i2c_adapter *parent = muxc->parent;
+	u32 oldclock = 0;
 	int ret;
 
 	/* Select the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id, &oldclock);
 	if (ret >= 0)
 		ret = __i2c_smbus_xfer(parent, addr, flags,
 				       read_write, command, size, data);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id, oldclock);
 
 	return ret;
 }
@@ -104,16 +160,17 @@ static int i2c_mux_smbus_xfer(struct i2c_adapter *adap,
 	struct i2c_mux_priv *priv = adap->algo_data;
 	struct i2c_mux_core *muxc = priv->muxc;
 	struct i2c_adapter *parent = muxc->parent;
+	u32 oldclock = 0;
 	int ret;
 
 	/* Select the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id, &oldclock);
 	if (ret >= 0)
 		ret = i2c_smbus_xfer(parent, addr, flags,
 				     read_write, command, size, data);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id, oldclock);
 
 	return ret;
 }
@@ -362,6 +419,32 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			}
 		}
 
+		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);
+
+		/* If the mux adapter has no clock-frequency property, inherit from parent */
+		if (!priv->adap.clock_hz)
+			priv->adap.clock_hz = parent->clock_hz;
+
+		/*
+		 * Warn if the mux adapter is not parent-locked as
+		 * this may cause issues for some hardware topologies.
+		 */
+		if ((priv->adap.clock_hz < parent->clock_hz) && muxc->mux_locked)
+			dev_warn(muxc->dev,
+				 "channel %u is slower than parent on a non parent-locked mux\n",
+				 chan_id);
+
+		/* We don't support mux adapters faster than their parent */
+		if (priv->adap.clock_hz > parent->clock_hz) {
+			dev_err(muxc->dev,
+				"channel (%u) is faster (%u) than parent (%u)\n",
+				chan_id, priv->adap.clock_hz, parent->clock_hz);
+
+			of_node_put(mux_node);
+			ret = -EINVAL;
+			goto err_free_priv;
+		}
+
 		priv->adap.dev.of_node = child;
 		of_node_put(mux_node);
 	}

-- 
2.52.0


