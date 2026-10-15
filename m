Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB40CC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhrogpInrHDbhterqGtAmQBWlA/ZRMWIahc1n13ojCw=; b=zZh8628aF/cm0AukZCruhNT0YD
	LgOaOZvrnSzSRyph+kVUSVlSc0beE5C5/GRxWcnDV265xW/tMuBqGpm4Pg+RlnyfQ5fnhLcMWLooF
	My914k3lIXWKbQXmX/eIh27igpbqpAXxAcXA7A+Kiu7Qxn0/f1F0Mo9hovK4uDaIvLfkyreU0iqG+
	7cE2pWj5VhRDpvJ3J8AO5UJ1o427N/G20cKXj4ATXcbIY10uPpaxfiFLZ79eH5bIwTiHg0UMyFC3H
	MzIhz1xh3dMrrn5XdLZh52JbMGrdG29B8e9nhmgNwenvOmVIb7EA9Qt5nQHyK3isfKezpX0MO9oTT
	HNnwrVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJER-0000000HVcl-0pUr;
	Thu, 15 Oct 2026 11:02:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEO-0000000HVam-3XiR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 11:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zhrogpInrHDbhterqGtAmQBWlA/ZRMWIahc1n13ojCw=; b=XEOQYQB/TNjXD6q9cGhQyR7nlI
	cdGBE9qYjhFyTqk18f1qOCsCGHXiZS5gs5Fd1c+et8PFN9lCA/eoxdZHLjMj1N0UkRfRA9RCNz8JA
	4wFkzLB+9Ducn55s9h5B2bUP2n1CWg56ooAHjLc3SmwguB67vy4Yu9yxIe6c5azR4chuHkXnRbFiI
	bCIIOSUlZhTWQf6S5Zfbq1zes8gOPoG3yQ+qan2UgSAhtPLkiPXHVQ3D/9YM2s/ctCr2Op3PK0BSO
	pdUAJgiSjymozl66ZCObyi9bZFDMuaN57s/IFlJrgg/Au9FP+s5VqQczi+hH5Mx612oJq8SPBgw2t
	7jNLnsQQ==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHJEL-00000000HSy-3hir
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:02:39 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5bce4e278baso2168282e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062156; x=1792666956; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhrogpInrHDbhterqGtAmQBWlA/ZRMWIahc1n13ojCw=;
        b=T2KZ6yejb4mmW6SpoxROw6w64kLOdkFxm1VsdJ7E6ELiXnlRwpwCN+Jfy0mt3uUsqw
         sZSehfj7Irw/qLSwPV8Xuq0i6+nAbzBo7JhPX+X09DAuHOiETmheBTt1jnrm1NcH1Qwt
         xVjS0aa32vGKZt3h1EYbPx3CCWVFdwJXaOCsE3BLrYyf/Ui8mKIn/IFHttUNGv6CLj26
         X64lS3NWSky4YitHkhNteyC3Q3uMcbECkLqDFsROIMfbCNo+u/4S3Yip1KcnWCzxZlqQ
         /kPXhNeffKRXYOH6agmjncNznXTUe/b9Fcwl4M11j8UYYVXs5Urnjt+f2xw4RGth21sx
         hGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062156; x=1792666956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhrogpInrHDbhterqGtAmQBWlA/ZRMWIahc1n13ojCw=;
        b=fyaTb/qnuiW3N6YXgA4UnXqL2FFIocQxOO8RJuaDaZRiRZ9/UclrjIc3Kp1PwxR/YE
         RyxhBzpkBMDdVnWXL+NYmcQxwBJxthQ//XTs6rHxGrjO5fq87qe588HpFntdFBP5i4v/
         ZoUw0mYRyrDJYHoKjbTR5IMLfvy56Q+PPfeWaTzHsPb2A5OOxumdJaUU9f/fED+lal6h
         Y1L0PGATXXun9nLXHFqiUMBpT1oxeb+/X+FfJWmj8LUF3PXWdAHarrEKBv1yRmO0TeFP
         adUf3oUQn0YqhaVNBv+pQAPLS0CbyQhwN756fXJCJOzDKCmp/QP7nOWONYB7A02yVgOn
         NP9Q==
X-Forwarded-Encrypted: i=1; AKwUvByN/qNEeYq1PsV2T2nylDJB1I8r0R8Wm0H9yo9bzK9ZdSHbbkviKLe4fWSJSmJfr8QWvVioPHtQKKGRtTktXG41@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5znCPllsLlXfPyv/tH/vxnzUg6DIxTgDBl79IK53aExC5YsFp
	OY/tXiTd3pf5qwUKAn4j74o2tfMGZh4Pd0j+qQZbVm6Pvbeyd/R4BaFDrnAPGGcV
X-Gm-Gg: AYBFou2IYcQiBqVfAuOy1LPEpzvrg3FwR9nA8y9NnZB239mSlAfekqI512ycixS5PNX
	m7h2l/n+Gcwz5MlQdm1HotNMQpChyyBLu/esc66WiU/0qkT9Ux+xgcqTBbEbLZVE17LJjPsHnhS
	zqghl/Rm1RDrCqsz2iNjmg1F+gvXEIYgwd8axs6jVqN0b5dATMxSx4DZHxrTigHEYtETo5gx0Fw
	OHHUz6E+FGbK+oM67kTHpbUVqiEW088bxY61BCI6LalyXHI9MjhKtjpGU8nZUpow/MoQ2GzArMh
	Vs/U0hkxEQUD0UJ4F5qCKS2q0H1ZyjTFqW2P21dA8xkyHwFe6Fej/ounz/M9ua+/7vxMF4fYWf/
	cgBWjQpMF2S4qqTm/yuDBw3rs0BTbUFO4X/v3Pb7rYOpSbXxY33QLkrG1da8JYeA8Ccf+xRa7nO
	wllL4+/Mb679j57+1Qmq40NFvvhSNwNUnEEEOM71+FXC+GVIm0/rjPCZlh9VbQRCIUPM2SSYhHg
	yYXI8cZkbN3LvChjSbPUfSaEMUz4ysBkOI1jkwtxhAyvRGQwU4=
X-Received: by 2002:a05:6512:b1c:b0:5b8:e9cf:daa6 with SMTP id 2adb3069b0e04-5bcdd4f080cmr6760391e87.10.1792062155605;
        Thu, 15 Oct 2026 04:02:35 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:34 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:50 +0200
Subject: [PATCH v13 3/8] i2c: mux: add support for per channel bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-3-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9989;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=exMpd3cjGy/5DzcDxw/bxloMWbnVNyP4rtgPVcTa9gY=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LKtsBX9nyJ/cK7w2ug+K4Xj9Psgt3AuwClZJ
 CF9goOxovGJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCyrQAKCRCIgE5vWV1S
 MkPhD/9Z8GqI0j3myfmp2x/N7fzHDhT6d9ab/ToTLGVDwYPoVi1cxh+Nz7+/icnLfnsf/F0qyLh
 sOCw7/CboQLMyJVZHLtcyPZf8goFnrC+mOLL0/s0XOIUowhwx2C4tCFFQVRt/NiY7HrQVyfapOU
 tBw1K9JeOpjv6MevkjNi4H8pKi5wUVaWsIz9UUUzgXW9fV/Xi4I4q4DnwPZpLPrTooDOl+9S+jE
 cucxi6wU0ZzbVDJbnZQLNu/imgqPNLlsYkDnKGq86/UzDObA3YqzfZndKz6FemUAOCHSC4MvaPz
 bJZbyHa7gFt8nMa1Z34VSiTTeOe6RC1FYpstdmMcrxw8iBr58qNglv2Ky8OfYnB50wPJs0mN4yT
 eEYJiQKo9ABuQlAlnExFTO+rpniP4mc15p2n4QnkBglhOxNrCi88qNEnFffcECD0EG6FYcloV4a
 SDW+Hy/Aj9A4c0jBAACID2IERJqD1R/sq8R5bvC29E0QE/ckqEuOWCKKpoX91PcO6c5YfEdQRoP
 bVccHvVL81VAyXKD1l1mXKevm44js6uD1jI99a5LIc8UE3YytA7mSynXIY2sGJdNOwosvY2pg9f
 lRT3uaVyw3iDz6LCJhV8kmGtw0e3MC2jThqcK4KrIpyK4KM2ofyGhLFJy6Mb+vdE0rZ/Cgu5x/S
 sknk1/8b3QrRVSA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_120238_140229_AE19BC05 
X-CRM114-Status: GOOD (  29.20  )
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
If no clock-frequency property is set, the channel inherits the parent
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
 drivers/i2c/i2c-mux.c | 195 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 183 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 94cc019b222f..008257624ba8 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -37,21 +37,141 @@ struct i2c_mux_priv {
 	u32 chan_id;
 };
 
+static inline int
+__i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_Hz)
+{
+	int ret;
+
+	/* Nothing to do if the requested frequency is already set. */
+	if (adapter->clock_Hz == clock_Hz)
+		return 0;
+
+	if (adapter->bus_ops && adapter->bus_ops->set_clk_freq) {
+		ret = adapter->bus_ops->set_clk_freq(adapter, clock_Hz);
+		if (ret < 0) {
+			dev_err(&adapter->dev, "Could not set requested frequency (%uHz)\n",
+				 clock_Hz);
+			return ret;
+		}
+
+		/* Everything is fine, update the clock_Hz to the new value. */
+		clock_Hz = ret;
+	}
+
+	/*
+	 * If the adapter is a root adapter without .set_clk_freq()
+	 * implemented, this feature is not supported.
+	 */
+	if (!i2c_parent_is_i2c_adapter(adapter))
+		return -EOPNOTSUPP;
+
+	/*
+	 * Update the clock_Hz for non-root adapters, even if .set_clk_freq()
+	 * is not implemented, to allow the clock frequency to be propagated
+	 * to root adapters that do support it.
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
+/*
+ * Lower the parent bus frequency to what this channel tolerates and select
+ * the channel. On success, @oldclock holds the frequency to restore in
+ * i2c_mux_deselect_chan(), or zero if the frequency was left untouched.
+ */
+static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 *oldclock)
+{
+	struct i2c_mux_priv *priv = adap->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+	int ret;
+
+	if (priv->adap.clock_Hz && priv->adap.clock_Hz < parent->clock_Hz) {
+		u32 clock_Hz = parent->clock_Hz;
+
+		if (muxc->mux_locked)
+			ret = i2c_adapter_set_clk_freq(parent,
+						       priv->adap.clock_Hz);
+		else
+			ret = __i2c_adapter_set_clk_freq(parent,
+							 priv->adap.clock_Hz);
+
+		/*
+		 * Never transfer on a segment that is still running too
+		 * fast for the devices behind this channel.
+		 */
+		if (ret) {
+			dev_err(&adap->dev,
+				"Failed to set clock frequency %uHz on adapter %s: %d\n",
+				priv->adap.clock_Hz, parent->name, ret);
+			return ret;
+		}
+
+		dev_dbg(&adap->dev, "Set clock frequency %uHz on %s\n",
+			priv->adap.clock_Hz, parent->name);
+
+		*oldclock = clock_Hz;
+	}
+
+	return muxc->select(muxc, priv->chan_id);
+}
+
+static void i2c_mux_deselect_chan(struct i2c_adapter *adap, u32 oldclock)
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
+		if (ret) {
+			dev_err(&adap->dev,
+				"Failed to restore clock frequency %uHz on adapter %s: %d\n",
+				oldclock, parent->name, ret);
+			return;
+		}
+
+		dev_dbg(&adap->dev, "Restored clock frequency %uHz on %s\n",
+			oldclock, parent->name);
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
+	ret = i2c_mux_select_chan(adap, &oldclock);
 	if (ret >= 0)
 		ret = __i2c_transfer(parent, msgs, num);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, oldclock);
 
 	return ret;
 }
@@ -62,15 +182,16 @@ static int i2c_mux_master_xfer(struct i2c_adapter *adap,
 	struct i2c_mux_priv *priv = adap->algo_data;
 	struct i2c_mux_core *muxc = priv->muxc;
 	struct i2c_adapter *parent = muxc->parent;
+	u32 oldclock = 0;
 	int ret;
 
 	/* Switch to the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, &oldclock);
 	if (ret >= 0)
 		ret = i2c_transfer(parent, msgs, num);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, oldclock);
 
 	return ret;
 }
@@ -83,16 +204,17 @@ static int __i2c_mux_smbus_xfer(struct i2c_adapter *adap,
 	struct i2c_mux_priv *priv = adap->algo_data;
 	struct i2c_mux_core *muxc = priv->muxc;
 	struct i2c_adapter *parent = muxc->parent;
+	u32 oldclock = 0;
 	int ret;
 
 	/* Select the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, &oldclock);
 	if (ret >= 0)
 		ret = __i2c_smbus_xfer(parent, addr, flags,
 				       read_write, command, size, data);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, oldclock);
 
 	return ret;
 }
@@ -105,16 +227,17 @@ static int i2c_mux_smbus_xfer(struct i2c_adapter *adap,
 	struct i2c_mux_priv *priv = adap->algo_data;
 	struct i2c_mux_core *muxc = priv->muxc;
 	struct i2c_adapter *parent = muxc->parent;
+	u32 oldclock = 0;
 	int ret;
 
 	/* Select the right mux port and perform the transfer. */
 
-	ret = muxc->select(muxc, priv->chan_id);
+	ret = i2c_mux_select_chan(adap, &oldclock);
 	if (ret >= 0)
 		ret = i2c_smbus_xfer(parent, addr, flags,
 				     read_write, command, size, data);
-	if (muxc->deselect)
-		muxc->deselect(muxc, priv->chan_id);
+
+	i2c_mux_deselect_chan(adap, oldclock);
 
 	return ret;
 }
@@ -374,6 +497,54 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	priv->channel_node = i2c_mux_get_channel_node(muxc, chan_id);
 	device_set_node(&priv->adap.dev, priv->channel_node);
 
+	if (dev_fwnode(muxc->dev)) {
+		fwnode_property_read_u32(priv->channel_node, "clock-frequency",
+					 &priv->adap.clock_Hz);
+
+		/*
+		 * If the mux adapter has no clock-frequency property, the
+		 * channel inherits the parent bus speed.
+		 */
+		if (!priv->adap.clock_Hz)
+			priv->adap.clock_Hz = parent->clock_Hz;
+
+		/* We don't support mux adapters faster than their parent */
+		if (priv->adap.clock_Hz > parent->clock_Hz) {
+			dev_err(muxc->dev,
+				"channel (%u) is faster (%u) than parent (%u)\n",
+				chan_id, priv->adap.clock_Hz, parent->clock_Hz);
+
+			ret = -EINVAL;
+			goto err_free_priv;
+		}
+
+		if (priv->adap.clock_Hz < parent->clock_Hz) {
+			/*
+			 * A slow channel must not be left connected while the
+			 * mux is idle, or it is exposed to the full parent
+			 * bus speed whenever a sibling is accessed.
+			 */
+			if (muxc->idle_state == I2C_MUX_IDLE_UNKNOWN ||
+			    muxc->idle_state == I2C_MUX_IDLE_AS_IS ||
+			    muxc->idle_state == (int)chan_id) {
+				dev_err(muxc->dev,
+					"channel %u has improper idle state for this configuration\n",
+					chan_id);
+				ret = -EINVAL;
+				goto err_free_priv;
+			}
+
+			/*
+			 * Warn if the mux adapter is not parent-locked as
+			 * this may cause issues for some hardware topologies.
+			 */
+			if (muxc->mux_locked)
+				dev_warn(muxc->dev,
+					 "channel %u is slower than parent on a non parent-locked mux\n",
+					 chan_id);
+		}
+	}
+
 	/*
 	 * Associate the mux channel with an ACPI node.
 	 */

-- 
2.55.0


