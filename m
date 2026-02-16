Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BF3E7BDB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaNXPqSzXRni0/7DZfH0pXrm0ku9rx2g9K/sQobHHbo=; b=a5qapIY1Nums4Ti+y/5CDi/RYw
	vZR9Nv9kY3glh9jZqYjzhueXygz2BWPzMrk/tWdjP2ngbHvYSK6QVeF/DJAe+V0nOinr0F8Fl0eht
	p+8l0RgI5XwAkISAld1IzeAYL6Uh7mFVnYloiUc7Ypzc0dyxPE9fMxu6wwgtSp4nnH14V6gyWxFIJ
	9WxED9QrZzPTxHdHZith7K+wqYZsP6KzdS3GBeGk9VT9WhuPQY+jfS5q71Dv6eGnC+38fjKMlTwDO
	u2PxHFarfHGU2bqTbNaMBTtCReIP72INZHG1uQ+91942z29iZrW/57AGMPLzzoNpcd2yZCzvYkfae
	13x1g+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxs8-00000006Wcn-13sK;
	Mon, 16 Feb 2026 12:38:40 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxs4-00000006WZX-0gq5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 12:38:37 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-59e4989dacdso3242660e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 04:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771245514; x=1771850314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaNXPqSzXRni0/7DZfH0pXrm0ku9rx2g9K/sQobHHbo=;
        b=V0U3yiPbLgjDmNrhgQt+ccO+6tlEXmEpiPXq1ebJKQHcK3xOi1++PG9w396ldlQKkh
         RfLzRrUT9DH7BXCCeZNPXuUf2vklEyw0RsSyEk+dyam7zacMJEHn9RPMYT3HL6XetU/8
         epTVqQU+w9C+gzJHo8P+O8ADAC25Q6WkES/El1IEkithWydTtv7Zsxhhj2kOryrfACqv
         Lzgwy5TlNXLVBcZVagN2mF02AdXZadgH+WQK33orguCrdJfTziLRbiaKAnK/seexvJYK
         1U/BercJaVcBm47v6626xyxPwkbGKdL8jo8hp7y+DQU3BCCB09mTLPk5TDcEjfRVCThL
         opzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245514; x=1771850314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KaNXPqSzXRni0/7DZfH0pXrm0ku9rx2g9K/sQobHHbo=;
        b=gVGca59WU0PuYXwEZfBCi7xQYRcfYcwc+B6XBPlWEsDlFR081HE1/gsAogXZYma3wo
         8pdYw529fwMsYDqV98H96wzOppixVhadRaiNP9C9g+vHMSq5RWaoduonJn5kRUA3xC2t
         4aqWcVUFY/85ZnIscuOI4R4R+MOGbTb3R4OzEnwrr5BX0QoTDjl03QyXo5ZFhAG9MV6R
         epbi2g4UorNh63nQob/ybt5Ooov37al1PkljG5jFG16hRlm7PtW4Cs9oK2YuHcArP3Rb
         mHlgOhJVJF6h9NDN+IvJAOzlQ4szIMyHNLOuidQOk2Xx27oNdy9eapO1vKVKYwrF5dkl
         6K1A==
X-Forwarded-Encrypted: i=1; AJvYcCXTedmmBzgWFGUqaNysgyNe/DyS8JdfhV5QVSRm+F8feMfA+Vt8yTvZGln//r8FQAeedVsZaEIp8pDvcmqMqU3m@lists.infradead.org
X-Gm-Message-State: AOJu0YzELZfzgwC7Xm3AkgS6cFGqhMCg+lI70OL4FPpzmQo+VRBAZ6eJ
	SIv+pCZCxtYTlfu+DqVkzTnRmUTQr7OGlLkEfcRmco0aUmiMJA0L98Qg
X-Gm-Gg: AZuq6aIus0NOus6NWbauyo0bFDw0/0GpVX0bYNXSh4LSHq0PuuMteUcAY4ueARv+67m
	cwxhQ8s0UoJvdDAhwvPiWLMrdqkr3CrT+MfE68+VNWbn3/LEWfpbqhbNgvTP+yrMJywcrSGwudV
	d9z+bisfhWUOIj4uOZzmydRrrTEYlnB/dBlUwWPljQYqoiPYUsg8u7+znWEOBqt+oo4V6825YhV
	VZGunnxTEn3vE5HPgAvZsMxVpzK+1XVyIRC9Uxv/1YBV4hFb47MxfjDQd27/queTjwlTurpe2F7
	7GIXDCHQoErDgz62T6u2+x71oJIfcQLZkHL2FKAXMEmeOSVDZO8tpQevC7RtJzq3MtTh7hqHW5V
	faDgeJiDaYfDu8hD5hW/iIc/2yPVzF0KpBgIFbVbdYsFqs8J18rhfLk+65dMCCUCEctfyR8LkSk
	xjjP9FSIlUXAEU2lGVYi4JRzgvIn/rZK2Kta8W6d+QZPc+QBQHiyTjwTbyQLNfX7ZzZ+iR
X-Received: by 2002:ac2:4f04:0:b0:59e:459c:15f7 with SMTP id 2adb3069b0e04-59f69c23b4fmr2689862e87.14.1771245513793;
        Mon, 16 Feb 2026 04:38:33 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b0577sm3175920e87.71.2026.02.16.04.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:38:33 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 16 Feb 2026 13:38:14 +0100
Subject: [PATCH v6 2/5] i2c: mux: add support for per channel bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-i2c-mux-v6-2-9be28ecfd7e3@gmail.com>
References: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
In-Reply-To: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8944;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=/bBzf2R/gDr+xFsEvUjSSz9V/1X475MKmehIdfO82S0=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpkw/IPz4xzOf0GygzsdQUR9jYSoA8MYUX8kYSp
 CwhsOUu8/KJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZMPyAAKCRCIgE5vWV1S
 MhlBEACRSkI9YUbj+XI6UXMYW3BF06vIgS/RBysjCddJxOIXqoFXdLXo+HvGzpMSfsebQ662nor
 yMP/mDH/4JANEiwR/QgPu2K8FanwF9u4vhC9lyc810zQPOjtIvvh/2DWQCXuPJsjbY0ktw2I80Y
 vApTtlcrnhdGPyF0I7rUe8cCPqjz8Ghwk/Esf1zc2xGlglsGXK+9TyeUOqffP/BwnJ3SB1p1L/p
 rALCgYGrvki5sK1Ep/AZ/f4dj5PnIpN1COZtWuoD22KgYFq665psaZeTteuxHeDKKV5U3GMLwaV
 9ONe5HrK4g0CXpfsv7Y19cS+N93MMzRbE+sF/X0jXbgfJaLz0KQwACwJdJTCAQaIdIJ7k4rkCHu
 cAgOyyuR25Mx1uh501QQaheYBAFAc5n2iKtC3tAbgumsd5oDNuWRsa4UmneGTTjDGUGkzVO4SGG
 99k76a4jH4G8XRr1lPYjjiaimtzZ1EsJlcyilUzBIZpcWwRzcoQa9q5iBIcKdzaYeHWGJNblt7l
 4vxpPEAFn2ZvwtniWSPzofj8iWOf2rGE4hq585/6tRMKt0e0ni0bFRkFxbeG9S2JGOkx5alYp//
 6dOUIoZeXUmk3K9yVNUbObftrCg0J+ifKpkfbQ6sFohpuZHCO/zwxt0M2d4lgYhRBj5WkH8fLb6
 n6/Z9zCHfqQ9SUQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_043836_266757_CFDC4129 
X-CRM114-Status: GOOD (  23.28  )
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
 drivers/i2c/i2c-mux.c | 145 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 133 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index d59644e50f14..f125b4b8ae58 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -36,21 +36,113 @@ struct i2c_mux_priv {
 	u32 chan_id;
 };
 
+static struct i2c_mux_core *i2c_mux_first_mux_locked(struct i2c_adapter *adap)
+{
+	struct i2c_adapter *parent;
+
+	while ((parent = i2c_parent_is_i2c_adapter(adap)) != NULL) {
+		struct i2c_mux_priv *priv = adap->algo_data;
+
+		if (priv && priv->muxc && priv->muxc->mux_locked)
+			return priv->muxc;
+
+		adap = parent;
+	}
+
+	return NULL;
+}
+
+static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id, u32 *oldclock)
+{
+	struct i2c_adapter *root = i2c_root_adapter(&adap->dev);
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_mux_core *mux_locked_ancestor;
+	int ret;
+
+	if (priv->adap.clock_hz && priv->adap.clock_hz < root->clock_hz) {
+		mux_locked_ancestor = i2c_mux_first_mux_locked(adap);
+		*oldclock = root->clock_hz;
+
+		/*
+		 * If there's a mux-locked mux in our ancestry, lock the parent
+		 * of the first one. When locked with I2C_LOCK_ROOT_ADAPTER,
+		 * this will recurse through all intermediate muxes (both mux-locked
+		 * and parent-locked) up to the root adapter, ensuring the entire
+		 * chain is locked.
+		 */
+		if (mux_locked_ancestor)
+			i2c_lock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
+
+		ret = i2c_adapter_set_clk_freq(root, priv->adap.clock_hz);
+
+		if (mux_locked_ancestor)
+			i2c_unlock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
+
+		if (ret)
+			dev_err(&adap->dev,
+				"Failed to set clock frequency %dHz on root adapter %s: %d\n",
+				priv->adap.clock_hz, root->name, ret);
+	}
+
+	return muxc->select(muxc, priv->chan_id);
+}
+
+static void i2c_mux_deselect_chan(struct i2c_adapter *adap, u32 chan_id, u32 oldclock)
+{
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *mux_locked_ancestor;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+	struct i2c_adapter *root;
+	int ret;
+
+	if (muxc->deselect)
+		muxc->deselect(muxc, priv->chan_id);
+
+	if (oldclock && oldclock != priv->adap.clock_hz) {
+		mux_locked_ancestor = i2c_mux_first_mux_locked(adap);
+		root = i2c_root_adapter(&parent->dev);
+
+		/*
+		 * If there's a mux-locked mux in our ancestry, lock the parent
+		 * of the first one. When locked with I2C_LOCK_ROOT_ADAPTER,
+		 * this will recurse through all intermediate muxes (both mux-locked
+		 * and parent-locked) up to the root adapter, ensuring the entire
+		 * chain is locked.
+		 */
+		if (mux_locked_ancestor)
+			i2c_lock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
+
+		ret = i2c_adapter_set_clk_freq(root, oldclock);
+
+		if (mux_locked_ancestor)
+			i2c_unlock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
+
+		if (ret)
+			dev_err(&adap->dev,
+				"Failed to set clock frequency %dHz on root adapter %s: %d\n",
+				oldclock, root->name, ret);
+
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
@@ -61,15 +153,16 @@ static int i2c_mux_master_xfer(struct i2c_adapter *adap,
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
@@ -82,16 +175,17 @@ static int __i2c_mux_smbus_xfer(struct i2c_adapter *adap,
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
@@ -104,16 +198,17 @@ static int i2c_mux_smbus_xfer(struct i2c_adapter *adap,
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
@@ -362,6 +457,32 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
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


