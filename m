Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA35DEDF155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTB6xTbR9YUCnAVo0azw412iafjXj/Q1IfEGCYfMv3Q=; b=AjN5R2flydrU6LsGzVNA34mV5w
	9KwdQBU2QliEkxm+iauvOAj2OhtQE+szZAGNNCstA1m5sJI0O1nvlv536j6F6k55fXZPJP2LRQ67o
	t2FXEihYJN8NGWT2LO9QMmO5JIPOv0vufZ7HJA3BsAb6syiyq3WX9QPboKB6YLDcp+5ewSDyup7mw
	M6F83spetdS/1UNZ9ryeOhAuVu+NyLUvKDSaQJI7ioXyFP5REbBGOvPRi2MsQazHDgmhVJz3BZ5/F
	djO5mjC7GkqFvzcKRJDgH8Yrg1rKoLZLfbSBIHtY+AvdJPjtaGnOF2Xv/APiAq/Ufwz7EMG3z2opf
	9MBeYNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1n-00000003Mrx-3Yju;
	Fri, 13 Feb 2026 11:08:03 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1i-00000003Mp6-3lnU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:08:00 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-59e5c540b9cso730451e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 03:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770980877; x=1771585677; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTB6xTbR9YUCnAVo0azw412iafjXj/Q1IfEGCYfMv3Q=;
        b=hYYs9cRag5+jPNIIYJjOUp8fkjW00DmAoAsM8adsFJ9OL12us03wqxNxBaI7tx4omr
         hgXDswXqtNLg//e2HC+619HURvbE1+KovMjjrfBFywl5yMz+mIqtVBzHzDzI+KTp7TF8
         KKFRFkM5PLd7FPSMButAWkEKMCwYJ8g1fayZBZuxRjSd8re/Ar7QkIXb9tw3GeNLc1WX
         lrWN6kWN3TOhDG33kcSaKZUog0gfVzdiqbUuM55B76nNKhQNkDRLAKQyc6P9UuAxqGY6
         HdfvV7hkzTNZ/dDOxQewDHx4n/eDP8DPSpzE1Ox6aklkDTuV4x61vnZwq4A2TMZrdXJC
         HSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980877; x=1771585677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zTB6xTbR9YUCnAVo0azw412iafjXj/Q1IfEGCYfMv3Q=;
        b=Ka3LEz/TKsJ8K2kxTBzlLoYJV9xL47Dm/E5Y5YB+era9x78gu7MOw0yhZkm01p70ML
         HWaJyhB8xoiwm22dNbHS1CIoP5Kv9HMxplwc9gxp8HhprZ+yjKubJ0ZgQrLfxQ5RHv3P
         +dvbdxOBbdXXg5fTjB0b2FL0jYx0rMnSs0i3ADirkeyWuzAGhCgP3ei6QDxlnDzMK8OU
         4uemWxVAt26z8Lp1cCfqjp/bBfhYNyFNdgKA1qEjR6wEQF3oXCWhipQB80n5GgSbDIUd
         2m1alHxCQNkFbzTQj+sEqx2ZSgm6NGqf4CdFKXmku9Gv9WcLGov9nDovUbleLFs/eeHu
         vAdw==
X-Forwarded-Encrypted: i=1; AJvYcCWPIr/3Ee4/i/iljt01LFQG5wqSj+Y5I+Y44aTfg/pdpnDO96OzFnTnqKMa85MVzIjMfgMiCUPaX7pl+pzwUmug@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+6wqh+OOSrR54HhWO6N6y3scJFdQ3JuxWirUO/hWv4/Xcp0K3
	ORxqGwotTknuIAatF0EaL8MkZHzHvdHzDJIX/+2XeJ2Q/YuppUxHnF8Y
X-Gm-Gg: AZuq6aLiezvfiw1sbK4f6MctEFUZ+mUDcoqw5INvviQe3+R+HSRVDgTL80f+OzTPWfa
	+wr9BjW9yGnVPLBo7phVtGkMynpj3/lRqsRfuB4pHRYiilIlzrKSAT9fGg9zP4OoQhRqFISKS1D
	4vv8bQMELgN8mmpKOVG1QivTTCX+F1nggRRbz1ikNb7Sf2E77lRDOJkBQLZM9yyfGDzC3rkqdmD
	cq5uiH2YT7jsIqeCRv2iO9YFdr2nYeoiSPj4eROcEln8XZzm1GrRXvbJ6n/riBSfpod3fsWcfyw
	gdfXi8E8/xKEviDAWc55FEoMNGyISBNZZ6KcP4JXJSTA3sDzzw4m5otgY2y9BlukfuVcFVmQ2YR
	1wUnduz6yCF2WKsEOv3t0KYjgPYDbeV8ujxk+0qyfLzg8ltYutC97lHEDnYWkAOPo+A0LG6j8j7
	bYCoJdvwthlBcxgKeLH8SDN/B5ab/MRXB9OUiYcdfTGIaWHIiBVM1vJe1t3yrbSQcqzAwlkBZuw
	EihwXg=
X-Received: by 2002:a05:6512:2211:b0:59e:627f:7dac with SMTP id 2adb3069b0e04-59f69c26726mr549708e87.11.1770980876428;
        Fri, 13 Feb 2026 03:07:56 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068924c3sm13635831fa.1.2026.02.13.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:07:55 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 13 Feb 2026 12:06:51 +0100
Subject: [PATCH v5 2/5] i2c: mux: add support for per channel bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-i2c-mux-v5-2-fb2cbf9979b3@gmail.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
In-Reply-To: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8549;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=GAwGUaz+GqwpeQvnl1X7ahiwstVZRIvpf/1yMqLpIBk=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpjwYGuIK8exFqsvf3DBLtCgfwK6lnbHil0tXTZ
 Aas9o6VEqGJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaY8GBgAKCRCIgE5vWV1S
 Mg74EACm7dC1fqEhgRgE5JXfEyDwBbH77gywCuRIOdeyj9V9C82JIK4FmHsOKeSkiIbKk3es44d
 WG4C7U2KzJgAycihRJB5utVeK65J53nrnRvF4obR+Mae/LDkJRKnr/71hteNBx2og9T72plfmPp
 1cTBBC/uK+vX2R27qaSZ6S1C6kHXvOQhANQTcuurY8trP2qangIPpFnsZXzrvyw0dGVEp5FUWcr
 rkEkJCrSeg4SdJzXFWIadFYpMehHfvCLYcB28OLFigOmMk2IKpH7+yWEoeoh49ss73/sBgEgJtj
 KprPDX/Gu9M+LeGbjs15MzsafBr/VwCrs+gAKPukbgV8sPlNU+GlaF13tHJmfJ2KKDhXQL5SDtu
 dW/SUpf9o4NMhBlI1U42CAP2BQuVeT2qjiqdAcqJiZ6KOjaHsOsEUH+8FzimBX5p392P14aAqY0
 t2VZHTBmna+RAYLKTlUG4hvl/AGasxT9roOCS4AUKrJm1vRAkiUHa9GDM+buy9KgxggwHvgG9b+
 fv7xDYjz2uTrPcpp6kpxScsF/ZFfMP0Xd0G93j1utlAJG7zBZQFT4gOXvaamwMxXZhlXpuajE7T
 Chefgjvqdvi6J4MtwXnYADgybTXPmDufSpmJoCnqrERkEXXtdo1wGE+4MiOeHvo455rOgfdz3/C
 3rBSZQYm6fCuxkw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_030759_019481_CC36B101 
X-CRM114-Status: GOOD (  24.56  )
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
index d59644e50f14..9116ee3fd979 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -36,6 +36,100 @@ struct i2c_mux_priv {
 	u32 chan_id;
 };
 
+static struct i2c_mux_core *i2c_mux_topmost_mux_locked(struct i2c_adapter *adap)
+{
+	struct i2c_adapter *curr = adap;
+	struct i2c_adapter *parent;
+	struct i2c_mux_core *result = NULL;
+
+	do {
+		parent = i2c_parent_is_i2c_adapter(curr);
+		if (parent) {
+			struct i2c_mux_priv *priv = curr->algo_data;
+
+			if (priv && priv->muxc && priv->muxc->mux_locked)
+				result = priv->muxc;
+		}
+		curr = parent;
+	} while (parent);
+
+	return result;
+}
+
+static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id)
+{
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+	struct i2c_mux_core *mux_locked_ancestor = NULL;
+	struct i2c_adapter *root;
+	int ret;
+
+	if (priv->adap.clock_hz && priv->adap.clock_hz != parent->clock_hz) {
+		mux_locked_ancestor = i2c_mux_topmost_mux_locked(adap);
+		root = i2c_root_adapter(&adap->dev);
+
+		/*
+		 * If there's a mux-locked mux in our ancestry, lock the parent
+		 * of the topmost one. Mux-locked muxes don't propagate locking
+		 * to their parents, so we must explicitly acquire the lock above
+		 * the highest mux-locked ancestor to reach the root adapter.
+		 */
+		if (mux_locked_ancestor)
+			i2c_lock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
+
+		ret = i2c_adapter_set_clk_freq(root, priv->adap.clock_hz);
+
+		if (mux_locked_ancestor)
+			i2c_unlock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
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
+	struct i2c_mux_core *mux_locked_ancestor = NULL;
+	struct i2c_adapter *root;
+	int ret;
+
+	if (parent->clock_hz && parent->clock_hz != priv->adap.clock_hz) {
+		mux_locked_ancestor = i2c_mux_topmost_mux_locked(adap);
+		root = i2c_root_adapter(&parent->dev);
+
+		/*
+		 * If there's a mux-locked mux in our ancestry, lock the parent
+		 * of the topmost one. Mux-locked muxes don't propagate locking
+		 * to their parents, so we must explicitly acquire the lock above
+		 * the highest mux-locked ancestor to reach the root adapter.
+		 */
+		if (mux_locked_ancestor)
+			i2c_lock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
+
+		ret = i2c_adapter_set_clk_freq(root, parent->clock_hz);
+
+		if (mux_locked_ancestor)
+			i2c_unlock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
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
@@ -46,11 +140,11 @@ static int __i2c_mux_master_xfer(struct i2c_adapter *adap,
 
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
@@ -65,11 +159,11 @@ static int i2c_mux_master_xfer(struct i2c_adapter *adap,
 
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
@@ -86,12 +180,12 @@ static int __i2c_mux_smbus_xfer(struct i2c_adapter *adap,
 
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
@@ -108,12 +202,12 @@ static int i2c_mux_smbus_xfer(struct i2c_adapter *adap,
 
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
@@ -223,6 +317,7 @@ struct i2c_adapter *i2c_root_adapter(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_root_adapter);
 
+
 struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 				   struct device *dev, int max_adapters,
 				   int sizeof_priv, u32 flags,
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


