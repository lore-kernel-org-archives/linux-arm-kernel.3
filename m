Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580DBC44524
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZbKZC90lt57E1POL/jmjWN3NoQ7bSkmvoquyJ2AsB4=; b=LPuN1in6c2PR+pCfts8fMljf1j
	zc5qg2Qe+Gu1uGonA5bsug93gvbk929eUIcVaxKGJo08NOpAstx2lP4XaaaImNFHjI5q8UMFA8rb2
	ZdXVXvYjcdv/tH3JW1rK6wd0T8nhszKRf+bRzY4XOZ9J+BMso+0ZA2SEI1DNF0ImLn+BbN3o8ly4A
	deKxfp4mfGGQ+0kp+LtooSh736dOj3RB5iu0IvNdHYEivwvz+GmQoaVeUh9Hq8CxJHPXPLIEKVtK2
	b4p1Du1qsI5Qqa8+axzWnIwGr5xxQFZ4iFE2KUXL3G9b+pEdR8bT07LU67trMla1H1CtzgMOJJbuf
	qLActO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGr-000000056P4-2iIl;
	Sun, 19 Jul 2026 15:17:37 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGg-000000056IT-2TMw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:17:27 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so7980276e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784474244; x=1785079044; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZbKZC90lt57E1POL/jmjWN3NoQ7bSkmvoquyJ2AsB4=;
        b=FldX7lsHNT1QalFchVSviFygzha81TkldzTRWml1KXfsPdcXSGJzHaIgfflTObFh9a
         7Mf+BssYzdoluLXLriBHxz02HZ3HjDaUuI2lcggKj6NWg/BazwYSHGX0ogvrFxZKXdsF
         As88p2lkLGi2QyszqR1qWgo5CfZou9nnpryiX3z/w0gidnipPWkTnqW4lTxsltVqulKI
         bTcDUrcBTTnoz8u13NwQEU+s+L6Dm/wp/C5dO4hky+rtTIo9eqP5oAHomzfmAg58Ekgh
         2Os+aGScFHoJYvy4rU5ZW4Aubi/SMEunuhtAYznVJGH2MbFhL5P9DTbJWXStHUNmJyeS
         BDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784474244; x=1785079044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZbKZC90lt57E1POL/jmjWN3NoQ7bSkmvoquyJ2AsB4=;
        b=JpQuUNOhTuHwbl4OXNXCfokmeFsERLF/RbL++kKQoMm6azMIj/DCXaB80TJBZ+R18d
         fCvClFwcprZVgHi+5jt0eRLEk4twuGjLpS/1Xi/DAaXVdIap6wICBfWYMIo4a6xuO5I3
         0EDPyvVslllEmdbVo/B4yBRm3LQcgQHzcGgmgUZiOOGzq0hXC+dO7DcAj1yHRLn0FZez
         h3ipk2d1UKh1K1JaZb2uEn6HoEVU9/iR0+CEvcWi9w31yj3rSF4BkmCW83CV7/TsBlIK
         Xd15YH1Wpd6vCdZirdrBjZgLgQRcY0hEIlVRCdNNmZSnBOgdeW7YJui+GoyDUWjd6kLI
         gTEA==
X-Forwarded-Encrypted: i=1; AHgh+RoD9qcFxrjUz7UdRJaRqhN512jvJrapb0c/bDlPUDIc0Jo2BmKD2VCTZqOZzI2UgPwDsDjafbR08GK92DwWqZVP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9vDhF9bJkRtndJR8IH7snOqu2NJo+wMWr7ksztYrIZzJol2y8
	yqvQlL8UpUh6CVv03wbdmpopm4pLKtOeKMbRl6s/zeXpj2ZrJc9LlevaQwOuR3Yy060=
X-Gm-Gg: AfdE7ckgJUxseZByT0LdfNgJ8fAXy+pvwD1STgztIz42SHx3ZTQXy0Ym+3RSJsAq9CQ
	WivPZeMnn8gD4wP6+LfbK8S8RstRnqYUV/VYuFeiNegOTXsanNF0LJwKOsh7t+/Z0pP8umRmx2J
	kJpFcmzgb7Ac2WrI7bdMtDCn9yD6NWN+hlRfy4r3Yv7vwChQ9n4RYLG2/R227zy4EU04luI6OKs
	WwBkjNNnWUJ/2z53I3UMk8ouZM/v7deekl/NNYFjUCvIAZuuIDhPO38jr19zidWKlgGIBy30qlN
	Jn/g8CHVyEMjVQHvF1LasIJUG1UKUmFwOnaTOGOBV3+fHlMOvB+8JZKtH8Wwo4tZ6NdLVLZx88T
	hRed8o2XH73ZpiQjrthRUI1hdplZa2fOyplo+hsaMS/n1fCMgH4FOc+3sJUP45SUEXoJKHlmEoj
	Egilgkf5c9AkGJ2u6d6vDppKJI226JBnmGS/BVYI5UXIw8+vA=
X-Received: by 2002:ac2:455a:0:b0:5ae:a9eb:eff1 with SMTP id 2adb3069b0e04-5b28fabb075mr1708930e87.58.1784474244144;
        Sun, 19 Jul 2026 08:17:24 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e26e5fsm1835096e87.80.2026.07.19.08.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:17:23 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 19 Jul 2026 16:59:46 +0200
Subject: [PATCH v12 3/7] i2c: mux: add support for per channel bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-i2c-mux-v12-3-a5010d623a57@gmail.com>
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
In-Reply-To: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9225;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=YG8BYZkd6HTx8BUh6LrDh9EFQErHmuXWXTr5T30njJQ=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqXOp/KZnLcuCWA2pGTPKguNRXwtXMkauRDwo2H
 maddf/ItWGJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalzqfwAKCRCIgE5vWV1S
 Mo/FD/9Ulecov/E5wbrfvNooC+4ObhgHGozcDB69wh3tQzASRrc+cE7YduB0EeCErzULHmy3QVi
 YEngNnTlT9mgqrI2CwIRh/INzi/sGc/XrbrM0YkDJas9gZfO0/TPQH3iiOs/LlXrDCT6h6mErVg
 mj2pX2v/wMcg02opxNjPkrzTftYx7R+bbl1r5y12GfQf623W5Dx1h8hWVNwJW+tXZUeEdSRaGD3
 7Qab1+/0wFiJlUit0E5MsM1RyYHeMW9jZn1lx5oPzvo/pcqaWqd5ZQhy9Oa5ZroYir4tbpjYoTy
 HMGtzaMFAD3nlLAOqPsT2HCb6yOCHK1q0pZIBQWPQH1wVUT96vGU7aRsPJwXBQ14IadE7mPHdbJ
 00yMQgC4FsxFS7tYgzrF6cs7VNfyXsZ2d8lWHsffSsz/eGir+zDJ6anrRI0xsVLO/u7JLphSljP
 Ea3n8QPvzSg2gfRyCQNH6Px4V0cGtuPvjcMBESKW5MthAZZLp6aTpUjp7coPmj7hIrwgjouJJvA
 i2U5tTeTUpqrHMsy9DRmrTZd3TXZ/x4P3rgzgcwWA0LsByWbMipFhzc6ST7tZiCm7Sv6RoifZ9l
 01R64dwNWe21DOjQDP1RngXPfg81GqDP2+CuHU2ntjtztp/3lsvnb9TXH0rrOPgKK/xVoxYzsmq
 6nDlbkU+SYd2UiQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_081726_694262_262F8AD5 
X-CRM114-Status: GOOD (  25.24  )
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
 drivers/i2c/i2c-mux.c | 161 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 149 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index b126ce7338c2..00de5f124132 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -36,21 +36,118 @@ struct i2c_mux_priv {
 	u32 chan_id;
 };
 
+static inline int
+__i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_Hz)
+{
+	/* If the clock frequency is already set to the requested value, do nothing. */
+	if (adapter->clock_Hz == clock_Hz)
+		return 0;
+
+	if (adapter->set_clk_freq) {
+		adapter->clock_Hz = adapter->set_clk_freq(adapter, clock_Hz);
+		if (adapter->clock_Hz != clock_Hz)
+			dev_warn(&adapter->dev, "Could not set requested frequency. Requested %uHz, got %uHz\n",
+				 clock_Hz, adapter->clock_Hz);
+
+		return 0;
+	}
+
+	/*
+	 * If the adapter is a root adapter without .set_clk_freq() implemented, this feature is not
+	 * supported.
+	 */
+	if (!i2c_parent_is_i2c_adapter(adapter))
+		return -EOPNOTSUPP;
+
+	/*
+	 * Update the clock_Hz for non-root adapters, even if .set_clk_freq() is not implemented,
+	 * to allow the clock frequency to be propagated to root adapters that do support it.
+	 */
+	adapter->clock_Hz = clock_Hz;
+	return 0;
+}
+
+static inline int
+i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_Hz)
+{
+	int ret;
+
+	i2c_lock_bus(adapter, I2C_LOCK_SEGMENT);
+	ret = __i2c_adapter_set_clk_freq(adapter, clock_Hz);
+	i2c_unlock_bus(adapter, I2C_LOCK_SEGMENT);
+
+	return ret;
+}
+
+static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id, u32 *oldclock)
+{
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+	int ret;
+
+	if (priv->adap.clock_Hz && priv->adap.clock_Hz < parent->clock_Hz) {
+		*oldclock = parent->clock_Hz;
+
+		if (muxc->mux_locked)
+			ret = i2c_adapter_set_clk_freq(parent, priv->adap.clock_Hz);
+		else
+			ret = __i2c_adapter_set_clk_freq(parent, priv->adap.clock_Hz);
+
+		dev_dbg(&adap->dev, "Set clock frequency %uHz on %s\n",
+			priv->adap.clock_Hz, parent->name);
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
+	if (oldclock && oldclock != priv->adap.clock_Hz) {
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
@@ -61,15 +158,16 @@ static int i2c_mux_master_xfer(struct i2c_adapter *adap,
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
@@ -82,16 +180,17 @@ static int __i2c_mux_smbus_xfer(struct i2c_adapter *adap,
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
@@ -104,16 +203,17 @@ static int i2c_mux_smbus_xfer(struct i2c_adapter *adap,
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
@@ -363,6 +463,43 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			}
 		}
 
+		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_Hz);
+
+		/* If the mux adapter has no clock-frequency property, inherit from parent */
+		if (!priv->adap.clock_Hz)
+			priv->adap.clock_Hz = parent->clock_Hz;
+
+		if (priv->adap.clock_Hz < parent->clock_Hz)
+			if (muxc->idle_state != I2C_MUX_IDLE_DISCONNECT ||
+			    muxc->idle_state == chan_id) {
+				dev_err(muxc->dev,
+					 "channel %u has improper idle state for this configuration\n",
+					 chan_id);
+				of_node_put(mux_node);
+				ret = -EINVAL;
+				goto err_free_priv;
+			}
+
+		/*
+		 * Warn if the mux adapter is not parent-locked as
+		 * this may cause issues for some hardware topologies.
+		 */
+		if ((priv->adap.clock_Hz < parent->clock_Hz) && muxc->mux_locked)
+			dev_warn(muxc->dev,
+				 "channel %u is slower than parent on a non parent-locked mux\n",
+				 chan_id);
+
+		/* We don't support mux adapters faster than their parent */
+		if (priv->adap.clock_Hz > parent->clock_Hz) {
+			dev_err(muxc->dev,
+				"channel (%u) is faster (%u) than parent (%u)\n",
+				chan_id, priv->adap.clock_Hz, parent->clock_Hz);
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
2.54.0


