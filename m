Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A0ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hltXMUlkzirB7nFSN76+e+DFNg+q24PFFqRwJUD70Q=; b=NJe4AulsWr5qWJLwFisOQBJU61
	CbMUzUcLCKcFl0rdl5/yWmUdu/LRAAONmlkeCcL6EP4SQpzjCiqipnf8vjmi+xxBA59mHFb8dlqf5
	XvUcojS+LKpprDN37rI9Sfz0YRX9s+xnsjio2L65biEc/0CndBWmeHr2t5L7Oclsy5PiyGUCBSx3T
	G0wcIqByNV5eBVFBLYbMZQwACcDnQEI7nuSvvpkjG453YXztX4LP+YhZ24jAtfovRMGxgJIpHIvM6
	lf9H6VBd7yI4ZuRsougieTfTQkXPbQ0wljSAKsKHyj8LPZt1AMh+WrBi5Ex+tZ9fzNheTCJZALqy5
	LAr9YERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9c-0000000CB5f-2uVT;
	Mon, 20 Oct 2025 07:18:04 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9Z-0000000CB3R-25ZU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:18:02 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3778144a440so48335731fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944679; x=1761549479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hltXMUlkzirB7nFSN76+e+DFNg+q24PFFqRwJUD70Q=;
        b=TDQP7BXaR0LTQNF2CHzCR3jkbbAdnhhGf4PELa0LtLdaUOMpzQpk5sFbe3XEdcY3Br
         57ZjnVz6n2Yfm9vy3+7Tkupz/xmGNTi7o4leetSeOcj1gLAl4SBSpBdjpc+2jGewby3W
         VzSGP42morpdFSVReWF1pZ1qmARPpK59a9SMRgLLvbIaPoaF8x0QFAQkkuGuDnhKVvYs
         X2spIwY1nP45m7jgklPAb8btdEU0PDR7xCCS/sWaneVjQ2nYTNmzR3qprYUN/KACSCmt
         dshCXqhspFFKiGBahUggjf/0vR3/ahaya1S338AbbJMyRX82zP4qfahi+w27ZYIc9R6y
         xOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944679; x=1761549479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hltXMUlkzirB7nFSN76+e+DFNg+q24PFFqRwJUD70Q=;
        b=VJQwXHKliofjHuDv1h9YNat9SFwTSSQA2TbAlhjg1dygNSnKgCrTdgzm8wyzdAtKIR
         WLdUGHfrHj89OzrZZNGxdU19kXPTo86iqWu8tD+cZy1n7fElhh3G9SxyZ9gq857HYi+T
         hIuNW9mO0KqnDyVkJ181EgDamTiVq8Q0YvKGHiTfsa71NAA3gbnC6dZ8/bZYxOJL+N4N
         74YtGEX5TydJZhBcxorkbMqQWTv4kcNXOvnVEXwDuKWnMg3kG1LvKN7EaggDhZG0phns
         FudycfmeTWmp1B60Jq6SINvesMQbPUO42guj20Y17DO1AqEAlM5oqA/bWaZcSfqtJIWX
         v6fw==
X-Forwarded-Encrypted: i=1; AJvYcCWxZtRbxZwSFxhL3TkpOreDGauY7pJNQYVp6NBLVHjAa4sgBNEjMRi8/sOj/RK6VWVaIFeotG2VfoQkjIATnokY@lists.infradead.org
X-Gm-Message-State: AOJu0YzUwHlAq7i7eHX6B31phcw7cFfPnbRCCo5m8XBQlnMA4dXi0Z7K
	yYVVyPPM0LGYiitkmxcURfmVSKcWSBdyO4CfymdKgpE9ajyXKZIFDyxg52oYWP4W4hc=
X-Gm-Gg: ASbGnctgojwQqBHd0Oq5nioa3YsMjKyukS0jdMcAaKKtiA+Omt3I+0uRywMYg2TpJ3g
	PJ88PUL0N07qK2k2IRg+FBsJQ+EL7b9NErMBPPztFTGF899Y1ULB83wm/ezi9P76KFjdMrfpu0I
	AxklUCOKT2y23j3M9iTJStAbdNGiuMgFcdnWCT8U8IuAU/Kxc+D5bBhaCmTNnQX9b/lFmoMIotH
	ju0eCALW0vzD4p7AgxU/tx6NrrIdaquTXjJnNRPjwAyyypS2Kyj52BplmpviW2ZS6AlPaOUGhLA
	Uo0LkdY/X9Yzb6NdNUStvViN1fep8x5+VvHG856pK7NZZkLXZLqGtu/lQvww+z+Es1hycgUBDmM
	roVKjY/UyWjoNyVQlQG+O/105MWpXFMBTCrUNQqlsYpptDtMRKT6tUrx3hnuUP89V1CwxtcdwHi
	6p1kGYMe16PqDDmHhL+GRHU545UMrhsSVf5Bnjye3a0shGqiRo3irKCYw=
X-Google-Smtp-Source: AGHT+IFOSjHzTf5ZFSeasdKYfpp5nWUGM93vqKy15Ur2zTONCZTgOd3fOAO7IQLpuPX2GBKwktXROg==
X-Received: by 2002:a05:651c:1608:b0:36b:ee68:b022 with SMTP id 38308e7fff4ca-37797732121mr38865791fa.4.1760944679264;
        Mon, 20 Oct 2025 00:17:59 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm18863341fa.21.2025.10.20.00.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:17:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 20 Oct 2025 09:17:25 +0200
Subject: [PATCH v3 2/5] i2c: mux: add support for per channel bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-i2c-mux-v3-2-908ac5cf9223@gmail.com>
References: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
In-Reply-To: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7517;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=/iS9Z/pm4g1MBRBvX3jA56ZzUhOrp48L5lgjzmLwrLc=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo9eIONuOu9MR9C01xqdAkdsU2YF0UumOJnisww
 xPainNZtPOJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPXiDgAKCRCIgE5vWV1S
 Mn32EACqdMDBYVOF0BCZ8ACrLGJ6qmLQFWSX0rPDx9CeQbzxnNNW2QbkS9HY9O0h8WaZGx3we1i
 sow6pCp8/1o0vkiwPSga/oaTY/kWsg2jX2RQfDS2LqnpSMIRmPCAV/qOAWUlj6/txmC6q7wolbu
 FkHECeEkhcQzkiFEQgBzHbZWHAW1OZjdZK0JENwxpWbkoV4MGhT7+PJHOV62KbX3MEiEmkBT3V7
 XY1tvk0v25IPEAgG6vRtsRU37j/rE0nZIMlzmWPQzN81JiLIUq+Rc9sVWADtLejAXy56c/y6CDd
 00jtKU+zZQNAw9EtooSKKvw0QWkOO+bl/DTIslG4MWzv2nACaMEvZ5zSTomzo2gWF9Is1eJNLIO
 GDxjxDe+lB3+/dPfJTbcokQPxZr4ycLqZm/VxqGhu9kr4iF/CDDXkY6d8fCR6udsc3Wb6zdK0jt
 ZlOS35/THU8eeubnx/mrZGcNlROQDnyCcFT6yK7ajdki64Sf/eUWBcXpb15dxkawh7QbQyOaDnG
 WhikllJThAu2i1QJlOi9J8kH9HfYWOFpTNhogRf0hvzULAuNBEweu8b+UooFRUdeCD7qCXeB0BJ
 cYkopOvnDpCv1UQrc77xxXVnh1ruZMXJUY3uJiET+m+UPyyFOiXrK4tZwFYdySR4e5QjAZEMsQI
 j7H431bMcOM5Frg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_001801_600767_F076D055 
X-CRM114-Status: GOOD (  24.07  )
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
 drivers/i2c/i2c-mux.c | 116 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 104 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 4d8690981a55dc0e1b35454971923791e6ed9f7f..67ba33a13dde42335ba4e289afdccb2419b6e4ae 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -36,6 +36,72 @@ struct i2c_mux_priv {
 	u32 chan_id;
 };
 
+static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id)
+{
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+	struct i2c_adapter *root;
+	int ret;
+
+	if (priv->adap.clock_hz && priv->adap.clock_hz != parent->clock_hz) {
+		root = i2c_root_adapter(&adap->dev);
+
+		/* if we are parent-locked and the root adapter is our parent,
+		 * we already have the lock we need. Otherwise take the bus lock for the root
+		 * adaper before changing bus clock.
+		 */
+		if ((root != parent && !muxc->mux_locked) || muxc->mux_locked)
+			i2c_lock_bus(parent, I2C_LOCK_ROOT_ADAPTER);
+
+		ret = i2c_adapter_set_clk_freq(root, priv->adap.clock_hz);
+
+		if ((root != parent && !muxc->mux_locked) || muxc->mux_locked)
+			i2c_unlock_bus(parent, I2C_LOCK_ROOT_ADAPTER);
+
+		if (ret < 0) {
+			dev_err(&adap->dev,
+				"Failed to set clock frequency %dHz on root adapter %s: %d\n",
+				priv->adap.clock_hz, root->name, ret);
+
+			return ret;
+		}
+	}
+
+	return muxc->select(muxc, priv->chan_id);
+}
+
+static void i2c_mux_deselect_chan(struct i2c_adapter *adap, u32 chan_id)
+{
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+	struct i2c_adapter *root;
+	int ret;
+
+	if (parent->clock_hz && parent->clock_hz != priv->adap.clock_hz) {
+		root = i2c_root_adapter(&parent->dev);
+
+		/* if we are parent-locked and the root adapter is our parent,
+		 * we already have the lock we need. Otherwise take the bus lock for the root
+		 * adaper before changing bus clock.
+		 */
+		if ((root != parent && !muxc->mux_locked) || muxc->mux_locked)
+			i2c_lock_bus(parent, I2C_LOCK_ROOT_ADAPTER);
+
+		ret = i2c_adapter_set_clk_freq(root, parent->clock_hz);
+
+		if ((root != parent && !muxc->mux_locked) || muxc->mux_locked)
+			i2c_unlock_bus(parent, I2C_LOCK_ROOT_ADAPTER);
+
+		if (ret < 0)
+			return;
+	}
+
+	if (muxc->deselect)
+		muxc->deselect(muxc, priv->chan_id);
+}
+
 static int __i2c_mux_master_xfer(struct i2c_adapter *adap,
 				 struct i2c_msg msgs[], int num)
 {
@@ -46,11 +112,11 @@ static int __i2c_mux_master_xfer(struct i2c_adapter *adap,
 
 	/* Switch to the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id);
 	if (ret >= 0)
 		ret = __i2c_transfer(parent, msgs, num);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id);
 
 	return ret;
 }
@@ -65,11 +131,11 @@ static int i2c_mux_master_xfer(struct i2c_adapter *adap,
 
 	/* Switch to the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id);
 	if (ret >= 0)
 		ret = i2c_transfer(parent, msgs, num);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id);
 
 	return ret;
 }
@@ -86,12 +152,12 @@ static int __i2c_mux_smbus_xfer(struct i2c_adapter *adap,
 
 	/* Select the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id);
 	if (ret >= 0)
 		ret = __i2c_smbus_xfer(parent, addr, flags,
 				       read_write, command, size, data);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id);
 
 	return ret;
 }
@@ -108,12 +174,12 @@ static int i2c_mux_smbus_xfer(struct i2c_adapter *adap,
 
 	/* Select the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, priv->chan_id);
 	if (ret >= 0)
 		ret = i2c_smbus_xfer(parent, addr, flags,
 				     read_write, command, size, data);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, priv->chan_id);
 
 	return ret;
 }
@@ -365,6 +431,32 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			}
 		}
 
+		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);
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
+		/* If the mux adapter has no clock-frequency property, inherit from parent */
+		if (!priv->adap.clock_hz)
+			priv->adap.clock_hz = parent->clock_hz;
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
2.50.1


