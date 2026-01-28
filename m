Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F72D3569A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REfkVDw73DUSzPUXEtYPoiRdrz+NhebKMlsheaDJL7k=; b=AksulUoRT/TSDvqL+UktdpcSmk
	lpguoG2TlkSPQgfe51SxNKtMpnQddAoFAUMnGg0vD0q0Bo2ta6K2Q6WoJNSFwP+RF+7b+OoPbxWji
	zIknkrDPoC0Rjy4AviRD+9T+fIedgunCqZ4b5CIik3O006901h3hpr9rn2MyTyS/Ewfe9N6bKD77f
	aElEa36q8tuxrqMMs9hMcxzE4nDp+IQ8XduDLjeUoHj3l9ERYX8f7NMf7V8W063xFD6Z1+Hz682L9
	mFHuQIrkXYsha1MUh/y2stB1MZkvz0eXZ/KDGEV6idR9CJDpAXb99GuFLdssvoqU8cv3ErfSe6YDO
	UhTD39tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2GZ-0000000FmjY-0770;
	Wed, 28 Jan 2026 09:55:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2GT-0000000FmfM-44G1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:55:13 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso1086292e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769594108; x=1770198908; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REfkVDw73DUSzPUXEtYPoiRdrz+NhebKMlsheaDJL7k=;
        b=hQiWwcJyJBZHTKyRzCGhZA3oI1OT1Va0LV/C067HcJC6A6ae+yfTmkenZI560zcxu3
         lIRHwljVAmvgcXuH2UeiEWPiTjK6XGshBU/9DgvGhLMGgkHgKUSUgoGWH8ySJRGa5srT
         dE1izjbcFCckUMhMLYB/esxipAk1De8/MdbVrLy/zlILqYS9x5pKT0NYiIcm8MJj/ILJ
         rRYh41tT2dhxsLBUtQMWgHDoGFJvqAA63lPENedr3zRYPVJWDVBbWJmisALekgb8jzZ4
         PR3rq/3c2YM9Y1rsMazdh62FABOdb3lUpOgwdaKkLNKKVRGq8IXaGGBBGx/fcLyLXKEq
         AJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594108; x=1770198908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=REfkVDw73DUSzPUXEtYPoiRdrz+NhebKMlsheaDJL7k=;
        b=qbLv99V3m9iNmjB8un17FPq34GsLd/19GdL/YZSsLzUATDTPxlAtNom33PYdp5PW6m
         yaTRdGrhe8hTZ3zaH3qRf37nKjLkfqOhz24zeogEQrmZX48mb3R655OVJIOwpdZ7AkqN
         rRdxHKAjK+uyxLVJQyNpqtHBQZUsFWf/Q4zqHRye9p3w/lzNUJR47ZvQcPKwxjYwEKml
         UrPQZi7+N4S1z2uxK7lhSeDlMgoW5AgKt9k7l7Tj2bfmUreTnnBecXF5QFSSC1MpOyeq
         WzQumKje7kFz1Xom4Xb190Iii18OWkdBVxp4d8jvkHgXGrLN8RUGoapF2kaW1bH1O4q3
         V0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW3o9shF7xul38dmodswTCMUidge3020d0JrBP61tKt95B6zWdmVtgNM2A0jvECOh7tYrlk6Piq362k4vh98jvy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4AWV+wR/6uGTg3KzWqmCqcZCgQa2fHJ2N8QMrKMsNyTQhaAsq
	KAzlGgRsMn/6vHm6bZkgYK1mWtfPOYVm3NjuDHVCz8LW5qssnX30wgA5
X-Gm-Gg: AZuq6aI7p7FiMybfNtcHHMK2byXjIY96OhbLfaexLVpP/NVKuEWrKogNYfR1tBPz5jS
	DXntbjhn43yDeAmuoucXj6uE6+JsK0qOd7aWxSta0g636IEeozpBOGETwrfJlNBGBH9/7t3jKS8
	IyfrTRQEJ/fLJOOTXfDEVuYyHlI98i9EzKKWujPcQU77q2jH4MKCm1IS6n48mvWXA2dzg02x9eg
	0PZIiJXavhjpgog31v/EX4or41RBYQiqjXUphQLzCrR2ITbJsQVGO2iuSJlT49CCQobejqeVfxW
	hPnbceB+lvaS5D4lAmWMfSae5eQNN6RFKroGhiP/svEGkWLSbxVGbtA/lpQw54ZVYCLXekNTOCR
	Rqf+UKDa/MoweboCnMnRP9AYXuVgUeNTqgo8viiS9vjm3/AEkyRpjns2pV4MRHcru4PYfp52uAl
	LRFUw4JuB8DeSg2RAD9PkzrUGASD9PawhcCcNxJM/mQBWbVTYChJ4MhVM3
X-Received: by 2002:ac2:4e10:0:b0:59d:db30:8848 with SMTP id 2adb3069b0e04-59e0413824fmr2086926e87.16.1769594107272;
        Wed, 28 Jan 2026 01:55:07 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bfe83sm459483e87.97.2026.01.28.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:55:05 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 28 Jan 2026 10:54:28 +0100
Subject: [PATCH v4 2/5] i2c: mux: add support for per channel bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-i2c-mux-v4-2-dee49ce276c0@gmail.com>
References: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
In-Reply-To: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7463;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zGbz+pVrLmaMtnSNrlYn54fESL7esdXmRLMMNcwIf6k=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpedzm0S4PL15YJnIkLNwLSsRAPOQD+Ms7LXZSU
 Nq5cqqtauqJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaXnc5gAKCRCIgE5vWV1S
 MhOeEADTIxXYKIPxrPfFpvluokTAsbhQb0ncWTgS4dNJ+H4iFQUPs6mVvw2aLi6tRkFd12IN38z
 kD7v3jJ2b8w2IwM6Qd4CCeAqiSUklrQSiA4beaQt2Akh6pOlsWXejatmLZdta84hSsDQSEs7Dr/
 efMnf6gyV+NuLovi1qWP9KeTlHBb80vQvbmH5oJobUwuemVP7GR/UowDN9JyUhzEGAftHOdtlEn
 4vH1tmnf1DsxR5JwMjszsCrnK4ykPdoJY4FRnnCni/hhr1rtFXSpFptHCSa0Ncr0kL6ptJXkYZc
 3Fw7I8lOSCRYxhJtpDd2QxQ/oJGa6moQF95VOI2Nix3LT6vZPppt4ijI72KB2a26FQiBOgae4uj
 xSVBaNbBD3hu/0qznCpYwSW6MYv+oGWCCu8a9zCVeyQfX7sakTladFxBLvUk7xwTHNfdv1D60lV
 wew3trRfE9mvIODbRz+IC9lIxbsOSwSjSSDqXMdo34akdh6yTybk503NdcFwrfIJJCNzkdrbXNC
 Gk9+8LEJCaYspLKV/nCfW7nR/isiMUWV5zKe7WtcJQGfRyBi1O23Rn7pi9ecEPaGP5wH//NPfoF
 9I/GppOi3KiGlQYw3crh7BAK1oJ5SObwylvujkYA6M0xav0cA+UDPTJSvr+55z7Qe5FxUsu9Bk8
 pkE2rqQU7+EviHg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015510_085104_CBE5A64D 
X-CRM114-Status: GOOD (  23.65  )
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
index d59644e50f14..b7974161be4a 100644
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
+		 * adapter before changing bus clock.
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
+		 * adapter before changing bus clock.
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
@@ -362,6 +428,32 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
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


