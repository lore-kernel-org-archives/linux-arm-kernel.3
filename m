Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF79CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Isv7N56R7GLLyxOJRI4a7jcx/LSO3hI5hjNg+m1oWY=; b=eEhU5Plw+I2H/qdc86baW3oBln
	mknIoPDx5na6D3ERxB5wmDQlBDks99CJ0LPrjG2B8ifiGEQ7Tib77nRoUbEibmXQm6X4AH46WMDke
	bPIwsrmPvwFTd4kotfqWpxQgY0gKF1kap4otjSlVNyJEjIBnmIA3uDh/rqLJkx6YZj7Jc0CzkRDkz
	neVHFE46jpvbWT+8eYJm6hz161bXaL2qd0bA4Y/qCEDXOK5Fdh6EFpcahEXBL8ujJiO7F74iqdCEq
	jxJL4OfuvyUnjU8FusKtvY1YDn92mFDZorrF7MBRKAaebqdPbL7LGBX954rQfRY3b6qiOqHdSFbsf
	WJs2AOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvB9-0000000Fjzb-1CV4;
	Mon, 17 Nov 2025 09:05:43 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvB6-0000000Fjxs-16yA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:05:41 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5957f617ff0so4477025e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370338; x=1763975138; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Isv7N56R7GLLyxOJRI4a7jcx/LSO3hI5hjNg+m1oWY=;
        b=eOH3TkAFv66gx3vqgFML8qHr2yRjjBbZKii3NarNGj+m7ACosbBEirut9Fp4re+Qgn
         M6bBCZvZCzYraXY6CBbiKCOv4d+SQjJhmodNfEpJ4WAWiK5OIVAeXqPa7q93gofhLW0y
         CBMI0WSHV/jz50RYw3Y9Li8p6+eMhlscdaiZxa8OJ3ts49vWGvncvppZZyJYQX3DJvnH
         PWrbiR+vlwvjlkp0kdOD0k+K7yb5JDxvuJrhoqU6RYM4rNzkrkFjAGFRrYZtGjmxLYnh
         SfwzdxKnceCWy/ooZKouDPSRU5dNBWgCHbvpwjq6Nrt5otFDdWTLqr5AWHwS6FLoxYNN
         8X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370338; x=1763975138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Isv7N56R7GLLyxOJRI4a7jcx/LSO3hI5hjNg+m1oWY=;
        b=q4xTBTP6f+g7lRuQm4kgKzPtTh1emqEkshr0eeuNgnLyJB7nFsrMAmuu5C96ZZyfBq
         ephSJFQjwomHTJ4IzrULMOOtqEFfVcfgPhmbnql0oNO61S0SfkG8EvxG3jKzi+X48XxT
         GsQGMsjlT3qSaWPQ0uWLV2U63X4qt9UmS6XoV2EI/vN0giUb0j/ln58P6+YFjhWST/3z
         mIgIHVR00xB3gYj94jD/DMulecaANg/fgz73nd5MlW1acrhX9XPQBSqdpTMnmppKx3Jz
         rTqRA7ZKEReQlJ2GKtLNq7kkXmX6zXeSkglths0KYT1wEjdz3Mlh3KFBxcAFmeRx1UHD
         w/yA==
X-Forwarded-Encrypted: i=1; AJvYcCUnGZe4xlJ1znAGX6dNOB3x3v/GRoUqRtqLuAtFe6OV16+Bojl7dMnB6mY9d+ZINUNwAgIgKc+nnF0Q5pEIrVTq@lists.infradead.org
X-Gm-Message-State: AOJu0YwrToF1l+iMQT0+rBR73AC66YzG7iSzf2mtjqZvtnpecZMR2zs9
	BzGavKLGoL+yYoYvvDEkRUlO1n0124CrtuQbbtKKKafCUcYA5IupjPOV
X-Gm-Gg: ASbGncu9crrOaIBULDMMfAN+s+J0yU0ViCEskIJAuZzaUEbT20G0yL2YKFnoL46zet7
	KtsYfuQhL1XDMvGmZ9gch50LCX39tTA+c8R6xTVoreNiDQP7PI+9nKaycgsOF8zE9dBnvSEtaxa
	SYH5s8e9rQJ5djFKDlKC2jMzW7af+os3YvoVjQdGJAD5NSOcNEEojNrnUbTIxUMAxNNBIhXFnsb
	nvJ6OI+gjgHuSAiLi8ERuWq0R1ztpiMnIeUW7kmtNy2FhFlP4QjWjMZcykbGSNpOcmMYTSlSnAc
	6X9VzLKmBCbMafsrX9zC+03MlxxsVp5AXyEe/3D9Dyl/pf8Nj4C18SYuAYSxX9oGT0MQizJwxiw
	RwbmWlC58R4iyiK/cmTG5KvDhKti+PrQ9QvZeG8Tmk0aPTxjO0dJB+33meJCyHm6LN2+WVFGh4c
	JKdipYLOss7EyDSfzvAnKdTBBOiYQS0N1mgG3k8KKtJzk8pvDKmN/U1MWZ
X-Google-Smtp-Source: AGHT+IFq3bjLXgXR/l8QI5stld2SKVhIi0p87VE5kMCDBF+BlgvJCbu8ZfTkjkZ+90HinEcjUZaNbA==
X-Received: by 2002:a05:6512:3b9f:b0:594:4b7f:f946 with SMTP id 2adb3069b0e04-595841f981emr4477997e87.33.1763370337911;
        Mon, 17 Nov 2025 01:05:37 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:36 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:04:59 +0100
Subject: [PATCH RESEND v3 2/5] i2c: mux: add support for per channel bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-i2c-mux-v3-2-696c83e3505a@gmail.com>
References: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
In-Reply-To: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7461;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=o4Zt8X+zyI6wUYVNms/IgvHSL1cE9RhNZwSvJA7JohU=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVKENJzVneUYEFrwizPAt/EAZgk8ypOAZ42j
 uXyyfqJ9DeJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlSgAKCRCIgE5vWV1S
 MpIMD/0fxUebzVqxVVOGqSGh8svawNypcAjs9Vr7oeAwSxK6XVUDHoPmWgE5VNm1JHyC6cPIPhP
 huRtbhxKUIF+n9UoHGbeXPrR5oR+KWXbzofEs+OfY3tFS0ITmkBOkvHoVGwn502PObbn3b+q+/b
 8Le+qjwaAh9y0Th+Kt69iLQ+NDSmP7Idt1Nr8JWPek0PRAXBVlJbxwIlHS6OYcO8a+HgrkHcqYi
 FDRLrwJnXYJZBFgsKR6Ujrl2l5yojDL+IQiTHpAQOXRvmo9cYHSJGgN5QH4mqb96xjsFnaNoldc
 ly6R7Ep5l6Klzrfnj5EdPXJUMvGOda22jBcZ31u368R60Zbxchune5kfw82d1ai5jwEtIuEMUx5
 vGQqLpWKxjj2zSiRnRO8jzekfBCucrzhFQoTHx1AkC1zBLxDK3w8DvSlHP6vDNUs+VtxCKJUL0m
 dzPdcgsaKm4ltmQPw+E9eDDid6dLG6vQBk3k8obC13ksvnAdOXPrOFYUHbFmRNIEFOn8ecpe1xg
 73VY7CmzZx6d1Vgo7fprBuia3W0953PUbnZ30iDSDeB7wV+PDR80L7RerYjayywC9fXehxbx4nt
 fDLvlj9mzn+nfbgoRdlLgqNFpRNtwzwj0Qq7RMibSRuwY3pMGT+kuIzXOjNDIh7wBeP2sCyiuXE
 DYxno5+lE/DABLQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010540_372377_86D86EDF 
X-CRM114-Status: GOOD (  23.48  )
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
index 4d8690981a55..67ba33a13dde 100644
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
2.51.2


