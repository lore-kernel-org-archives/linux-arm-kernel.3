Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D88106FD9E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AASvAwH/C6MYHGsYw3qf0hanl2I5flhOZHJJpYjf0HE=; b=ujb4XMCP2N7wAg9gSZYP7ohzhn
	7KuEm8zieOtLbHtVCH5t1cF7e/cTuTvIUI4aHLjoDLvq1EK4GRX9WqY91mtyvCosI9l7tOSTR98EU
	DOAyR793s+hfZfMeWMIF5n9P8HuhZfwyP5D8l8S7hCCN291mVKtGPjz2PsnDxpO87rASz8s3OHnna
	TqC4I2qc3pF2FoITZju6aIvcULy/zOVtiEjJty2khrDOo+GMeYDC2AWgfBTIfqPySHNcKBNbtQJz2
	LWFw0inzy5gbFefq8EpceyynQSO2a20kNcvQk1sjDZuK3v2IommF3wsoUOagthgc1COT/xoTvwEeo
	acJGsqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCg-00000001fmw-0kLN;
	Sat, 14 Mar 2026 09:22:38 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCY-00000001fjY-3Vuc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:22:32 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3870778358aso23855231fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 02:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773480149; x=1774084949; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AASvAwH/C6MYHGsYw3qf0hanl2I5flhOZHJJpYjf0HE=;
        b=AvH78HtPtoCS/TvkyBIs1xQsBgMlXKjrgFc7SAgl0BJbs7ERUWra8SrjXlVUHXwCZP
         6QoSMnOpEvXNMVcUFGcNbZAmInSfdR4aaTDW48irCE4Pxuat3wcdgHTLFt1Mu0sV/uGF
         n4s+SZbpqTq8TG8UulSUsm6b7M+Ip+xcRlxHs4TOpGy6lGCgM5qyX5k2Lcvily119/yA
         86M7GGpYgoU/W0y8rOXGUSzBZ9J2e/QNn0LGpy3AdmdWABxVdVIlOQt3mMNsQJJc4/lP
         mnBKg9eAY3L//d7ngPNvWiLgJrgSIlembG41TYVWNsLYpRoXnkqOv7me/QtZKfR3Ii2D
         +LMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773480149; x=1774084949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AASvAwH/C6MYHGsYw3qf0hanl2I5flhOZHJJpYjf0HE=;
        b=mQ95GDrsA9R7Br+H1zg7areYRodGlokN4/JPyUXNQarK0CBvskYiQpGec02nzbcvI9
         TIOWFjBD63WtKZRU/QeesfVQ+fd+b9oHcrCvdhnC7ReT0ZYulEZkNRyQM5Bl30Hai7tZ
         Gx8CAlzqlWhT95p7lf0R29wIIcKIy5aePEPA2e2AVpY61By/kqKXh+1oOZREH2zI5RjY
         leMvXlvLz/CK/TsL6jfP+MFqj+TYDgpKt+XtcxqdXxRmveNxPGdqXuvZ0dSDPFvKrKcG
         TW4dwZrU6LEVy/3s3UQW0UQGGYPXjdXX93XdNqrWTxiGT9MU2FUP9GTIU1Z9DDd3jAML
         g30w==
X-Forwarded-Encrypted: i=1; AJvYcCUONXz4eaQ+hte0opgk1GN9qPEaVaR1k+DXlaErKMYFNwOSoK5Z/csfdFrr+mbRUt0hXNUOW30EnwKAwF/siVUZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxOhs4etg9Q3HDFT2eqk2ECodJqfGA0daLh6s+LiSSEqH3T0zsz
	mBS5pntREjFzHuNYl+tQJrL481fF4jyNqFIiN0kckJAnpzuiYxv0gBSG
X-Gm-Gg: ATEYQzxRGSZrv3ro4G8BTbA2ZQNGCbm3psimngS61GcoKd/Qnyi16y9LN9yErr8IwAg
	8hC42QQA5aw5nEynWYJPW26RefhWAzikry15fn5rFGAokCGdJAPyIwucDbni6cT2SgjGFcWBPQ1
	Dsj79YLdZ3ZK+/tpWcIuc6SRlLL4lSsRKg0qLvRkmslAOC068mfqDjqCfqMoQrTEjgkSg9wN15E
	e3S4CFzV+qORIXMU257qYC0SYfGbNRiwcbkvDcCBwfhclD5DGUohQ3HD4o3pPYawU2KgspzN4xw
	2ty8kpAoAaXf9zDa5ZMSYaWfHXSIRt1mvImfO3jNhelgMprUBT+BDIVsglsInml2rjapy4Eu/oA
	9F4Or8Hjxbm5qjJGJBG/izwK0Q+mE/9GwNzZe3zp9JBpoONaI9oHs0jt83Rw9M/80XGOBxvALtQ
	P9u0iWC0YY4oPZQY+FDex3E+4wplsB800cfGBvZgWezCZcF6TsvvdZPErLQDjxVLbhqxob
X-Received: by 2002:a05:651c:255a:20b0:385:b6e7:8162 with SMTP id 38308e7fff4ca-38a897b6af9mr15582251fa.33.1773480148366;
        Sat, 14 Mar 2026 02:22:28 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm18454261fa.22.2026.03.14.02.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:22:27 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 14 Mar 2026 10:22:41 +0100
Subject: [PATCH v8 2/5] i2c: mux: add support for per channel bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-i2c-mux-v8-2-fb1738a4df0a@gmail.com>
References: <20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com>
In-Reply-To: <20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7627;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zzwP/dH6nVUsUc4kUSRaQrWbWPe+IT1e5Ig8MAfNhhE=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBptSj1C8TDAhIQpBI60mQB5ccWeB7QNalrfr8hu
 zgjKTD2Gb6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCabUo9QAKCRCIgE5vWV1S
 MpavEADKxjVy45nAOEczctYlkpyhTX3jHAGphbwfKmX1mosiif+XXwdgsxS3L1pbZ+NkdilxS05
 9kMxy/9RudKnI8gerWBmYAuQJT8Q4sfCEenOZcemlH51eIq9QOFiux1OLYbzOkutLIxFuTVrWt2
 bTU0oWzEsw6HZRPmYM4yBZACWs97rLOsj1M3JCfP4/w1ZKUfSYgTXoPyNpsiMI6EY3MQL3YapAG
 lQICjE/Lhq3rfDBKdbRo6UDukrMToHKwqLOUSX66GwHYYtxfJXlBx4FUnIYc7fS/s1Chk1XuyvR
 SjmJRaZZYOJej+Ml+of4e1XmGJOXva3744VvXGsA9fitwjhcuR6qTiPp3N0X5ea+EDiX52DDJFz
 0IwslOoJ6E2em3Q52GManFlwIJYnXRpHQsE23bPlgVY/QonG7cBM2wm1RsiPJ4AdDAejkZTcY24
 uv47WLc5pn1hyf67GSbUWBmn5taiFDJDL30MWs2jV013KlxydJzugHyf0FHHfRQruo8OqViA8wf
 rejh2KvOIcX4hIw4VNmlrlBjC2aadLutioqZp+zaa7fo6As90/OXCauZdOcvS6xXgwvwnlDUV2c
 epNXl2pk7KOcheruGcUINQzse0xOGoV+hvKhlfsyn30kFr5XdLdhrt3xRSlun4u7T70Q86X88sn
 3W2M4EW8rs5B9GA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_022230_939638_ED6CF65A 
X-CRM114-Status: GOOD (  21.45  )
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

- Electrical conditions may limit the usable speed on the bus for
  different reasons.

With an I2C multiplexer, it is possible to group the attached devices
after their preferred speed by e.g. putting all "slow" devices on a
separate channel on the multiplexer.

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
If no clock-frequency property is set, the channel inherits their parent
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
index d59644e50f14..6b5c9ae1efde 100644
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
+		dev_dbg(&adap->dev, "Set clock frequency %uHz on %s\n",
+			priv->adap.clock_hz, parent->name);
+
+		if (ret)
+			dev_err(&adap->dev,
+				"Failed to set clock frequency %uHz on adapter %s: %d\n",
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
+		dev_dbg(&adap->dev, "Restored clock frequency %uHz on %s\n",
+			oldclock, parent->name);
+
+		if (ret)
+			dev_err(&adap->dev,
+				"Failed to set clock frequency %uHz on adapter %s: %d\n",
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
2.53.0


