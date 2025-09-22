Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C4FCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tflbFhpYb7LhX1EKPWzM1vNL9oW2j1u/K47rwyVr7HA=; b=dMiv+d2HamDfgULZ/ddWC8YqsO
	CEdMkCTtvaS1tA928qfbw5WHzugIUSiH99ko/ODxfZPCGda9xj2g9heD6gQ0VMU5WAWfQSAkmW84P
	AzEtvxXhj1LOWW9AOz58Mi7ElaqRpPDTnCONgTFM+aM4+FX5E4ZEVaE+fX+IqBk7sZ+pEdMkhOGQs
	ywzIBXziuS07IHnSzTWOfJSdhd3mjUUJ7EjAFhppgk9QjyRlOujdaTUl0Lkk08F4OO69QAJGVT94J
	6cBtxUC7BjXKVx/d6c3yl1pyK7SC7bmrrF+Yf8ksIHXMdel478ujKBZYQCkwbqFxNYstUwQorz/RY
	HT1KH4tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvp-00000008wor-2w1U;
	Mon, 22 Sep 2025 06:21:49 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvm-00000008wlX-3fH1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:21:48 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-363be237227so26369171fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 23:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522105; x=1759126905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tflbFhpYb7LhX1EKPWzM1vNL9oW2j1u/K47rwyVr7HA=;
        b=WhO5i/UyCT7ovBCHcU0KMgStJulTtG1CvpXY+tm7ejw5MceNHjzcTwamfE8YVJbewA
         x24WsGSJAg28UmBJ32zn4LAs+84LipPVjQXSmi3iC0IyuMosez/wpEE+sg7WOErctzWn
         MfLbrqZjeb37Hrv/+EUUzAnAVyy+13qQaaan8MAO+cRWkzombOpJql3XvN5IDXoIYcPS
         d0OBgDVlFBx/D9tTXINwWlDioOHPUTgh5zuTnAsFduOxFsUBGWu8CHeOYLqgk7ImtWYG
         BMwYpArqJBbuMuiEzX/Iw3aDHo4/Qgt4S7YpokHytjtxqRaRTnRumlrsYrGYCItf0FiS
         cM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522105; x=1759126905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tflbFhpYb7LhX1EKPWzM1vNL9oW2j1u/K47rwyVr7HA=;
        b=PgJj/AA8ncSr+3WtBevDLXT/f8vEhnLwJET0tg9T1woHVi9RbxTGCEyvDL8sN8BwFc
         Xkb7ya76Q2Pwq5fx7fdmrS6rV1t2KCOlJEIFzXEHlUzyMjLjvseR96Wf/NagsMQ2GNR1
         cSQHtfgvXOqLZistpYEtThjl+Lq5PzNFwf/ic3560ef+uCM002I/xuEivffq+7JlLsOB
         7ebOCqSNRaUML4sX8YxOv8wHOP1//J0TdjCw0q4OZno8lVne2XhZXWMNXlrsg8XkxuV9
         Nix1XvTv5Xj8IO65/u3kFU8kmQxlrsrcd5GBfv33BVY1vC6rRdTVcGAp9UBEd8PO8zBy
         Qt9A==
X-Forwarded-Encrypted: i=1; AJvYcCULKSgHZYw/h70h2tFnE1InUtf0/PpqyHaUW8FNhYaV3cGUIhdlmU9Q3rcRa1i/kfMgMLraB++w0o52lde2M1O0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0c8SOJmoQ9KKBxOhkeVYvnANi3aCWYBFj4IRkhiTGUJ9KZIkM
	qJriNJuGQ7knmAZl/UvziXj7AuqksEBAxAmdVavQGorbHYN+EBwNEi9u
X-Gm-Gg: ASbGncs4yv77odhkwwPaidJjXu0k3pCp0YHsm/UY5f1BBeyUrUgoFOrJbT/2nPjJx7t
	v97XS5i+IVM2cO0WeXuTrSFZQdEmRI6kQoCuDheFUB34j+Gs5YG0B//JFb9FW8APJULOMqIoEzN
	I8etvbiBuVFxdxLKbALswyEDFqpTNhRce0aYUudca0hNUorqaySZLlfafuByJqjwl6l7enkyWyK
	dpqQ6a4fOxm2cttSZ1YgAyuKpB9pv1Yv+BFz1nCW33z08GHCbgxTpxQ2q3RRYeIx2hO9zeqD36j
	36kde5s902ZlCEfX9n6OqTa8ivd7Yix6i4XNRu/hF2C9uxLUuA5XoKAUTTcPjaOp7BFelRW3SVq
	DsYk7/nXuTBq6dVQxCkBwIkAPyEzNt+oXTMinEkA5bsYh++RpCPeLVJ/FhUQ3IKIRj0M=
X-Google-Smtp-Source: AGHT+IGAP/9qoDwVGCmbbFJydkjjc+ZyIXD+1vfex4mQA579RdyZw8D0MQranCYlakKK9Oih5XxNiQ==
X-Received: by 2002:a2e:a553:0:b0:36b:7167:5616 with SMTP id 38308e7fff4ca-36b71675bc4mr6929961fa.36.1758522104533;
        Sun, 21 Sep 2025 23:21:44 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:20:58 +0200
Subject: [PATCH RFC 3/7] i2c: mux: add support for per channel bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-3-28c94a610930@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7882;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=UBc7AM0gSO9uZhPLncPbz9SMwH2LrhqeMCqUzN/cGpE=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OrY/VgoJ03b/XE53W/Fnnp6hsxPEZWuFyY6f
 vBnSPuSdf6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq2AAKCRCIgE5vWV1S
 MrkmD/9WfPS3fCHXOXE4yGJNyYvFXKN9UpVrhDhni7B6ty7jOOKH85wVttq4AMIyfLo6qIU2NOo
 jaq7UDZRrjT5KdEb5rECLnqXWVhRgv81m5zXHJFlIoz4+HMeMlZ9SuAaOXI+OVT4kckpZ6Ma1Ee
 cfRKdMuhEY94TOROSzvRWXrI+bwbVLPpBjeI3ue1wrOEPGbbfBwnduUdA+/xsrOJlcNSrxeCdal
 9IXeUHKW6eyIQX2j8qA2So3LIF6/GzPNMxdifLaIu4x8j7lStkuRvzhIR1BuKdPJ8WMMgevEmkZ
 cHX0oEx30f4GqPHyxwqbhFRDgYtQSjfP4bygPkNRKGT29Ar/1wVpHFDl+daCTC59sorkguQ3RdY
 npO6dYo2POofexUJyMkLRFYI9VWTQQJOWxJgsFt0XSaaBRYE+/mkAWqfbE3AxmKqSXqGwf9SjnW
 W0Ygrfc07saUkVWZYRkJIgKMbs82ROnB9UcBOXc8MGjXZe9vnunvlnzfk3jwHSQM9ymwNmJqrDL
 kvXmTZDFjZ+i3xQQn8gFTWO1HcfBnrIRn1T+gQ48LNlAsbiiaJ1V+mcLsM0iKZQ6pSKB5yecx/N
 1rdHH8xi/HtxRIMXJr4wWowsF9S8KKCFDPWXCapkyxXsfLsrqdUhk9eJtvx4ApVHaNE6h6hu1Ao
 7DlYHhMUf6Dil4g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_232146_986992_7743992C 
X-CRM114-Status: GOOD (  24.23  )
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

There could be several reasons why you may need to use a certain speed
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
 drivers/i2c/i2c-mux.c | 126 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 114 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 5caa927c0caae512af029f0d1ae9b7f845ba3f6f..22b404597ff91eddb965c48112fdc63250d71e43 100644
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
@@ -366,6 +432,42 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			}
 		}
 
+		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);
+
+		/*
+		 * Warn if the mux adapter does not disconnect channels or
+		 * if a low-speed channel is seleced during idle.
+		 */
+		if (priv->adap.clock_hz < parent->clock_hz)
+			if (muxc->idle_state != MUX_IDLE_DISCONNECT ||
+			    muxc->idle_state == chan_id)
+				dev_warn(muxc->dev,
+					 "channel %u has improper idle state for this configuration\n",
+					 chan_id);
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
+				"channel (%u) is faster than parent (%u)\n",
+				chan_id, priv->adap.clock_hz, parent->clock_hz);
+
+			of_node_put(mux_node);
+			goto err_free_priv;
+		}
+
 		priv->adap.dev.of_node = child;
 		of_node_put(mux_node);
 	}

-- 
2.50.1


