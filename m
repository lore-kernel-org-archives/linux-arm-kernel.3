Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9394F54ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AASvAwH/C6MYHGsYw3qf0hanl2I5flhOZHJJpYjf0HE=; b=BsAEBsqN13N7MjIaHgv9/ErnrJ
	rT1UR3xJEka5LtecnkvVZYX15Qqf6fkRbYPhULDFkeMCOBl84nzQ9yydbt5orApdfIPKxsofuJ8gS
	U2xiqIZdCfBIrOwUPwIHm8s1Dnii0fOkuMoOQ86b2O4MCgAtfc+rkJLBfBCMePm+le+R21k3ZUodS
	ZnqqOs2CX3XxCise/jZ0cKbD2ubIpKB3/K3EenIUdhcjWlZOKGsBImIlzKlzGzsgH7ryqRtGc5rmk
	VqR8j/wNpbp4zdKc5AzGoi1dv84x28ctLv5lxTHWqGlkwjF7FQFnmFiBjflh7fVW5J7LFi8JIUz12
	z/XPfYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Dg-00000001aOW-3coP;
	Tue, 24 Mar 2026 13:54:56 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52DV-00000001aHh-3Kcp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:54:46 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a27c021b58so1400913e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360484; x=1774965284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AASvAwH/C6MYHGsYw3qf0hanl2I5flhOZHJJpYjf0HE=;
        b=mTITNYYxf+1cNr3rZSB3eg5GiuYLVxjv0JCZFQ90LKGcLVJkoJ/TLeFtB+rbENo1X8
         IKmaL51/hqlG3v4Iacl18j4g21xDVP2rfloNCSNVb02Vx2eAqhyz08Bg9uP6+BZh8a7z
         EfkXFAT5UZv1eOIUSwKkY9lharSYBuCTHxX0wZctgw1fA1ftUUf2DqSuK8D0An0cz4Lc
         vVj49bx4AKbIpWI7ic9SHf1i2/MOPYxI24ShdOUjz94iijNWSPJJr9yRyeqrqITMeTPH
         z+4S1WGS21SpIocziAmFdlxA2z7v4BTldbENNJG8ZpCnI7V3KrXzjqOpBSyqcwxv3Jiq
         w1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360484; x=1774965284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AASvAwH/C6MYHGsYw3qf0hanl2I5flhOZHJJpYjf0HE=;
        b=BAZdOr+UHhJZO7aArPR6LJBQ21gPu4zWqZiwfo2zO2Slx/10Zc2Yq2dzU/ipaCZYzK
         z4NO+TUiLvEGL/DcLQTh8XBqQ82fG5YtGIGAqj/C/Yzb2sF/kiCYuvQyQGhHZJrqwq8S
         tv5T0LpaemrYiRdbs2XckjeIMcivXdGTQ7feI9HQNF40CkGJmcxQvHvRXYvhNdrsziAg
         HZI5apzIrVfDGZdJmg596hc0p3O+xQvpO2QneVK/viqeUbLn3JjIKIltCzOU2Oz/hCmY
         PPScWJ1ZzaLJJnbzGonXWCOm26ApvFL7tL2KVCaTGirPJFP7CZ9bDGj9BqhMO0U4OMUc
         j61Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyq9e5p/faSr14+h+RTwcBvfNNytAlUWGWWaCpUt6Xl+nBSpmt8wVV1dBIphn3LasbN0A+pwOQQxx5/oG3Em5X@lists.infradead.org
X-Gm-Message-State: AOJu0YyGnIjq5SWsQvb8xT3u787kp1Aypi6vGtTE8BdP+O3EHzn3UOZm
	HVfc9jXTSawBqTQaJCRm5XDto8xX9gwUvhmM37BHqUh8eDq7dcMdhcop
X-Gm-Gg: ATEYQzwxh4AC7yV6wHjj97EKdxGArn79hd6RjcPdK6YdXHhFDk+LPTsX/1KmTB84sOp
	dr0og/lyYMjB6qC4C3PkZEkrSKqMXYdW0GZThxs/fP5GoNDCdIF+8k2SUehoflYgQ07p8cQPTYo
	TjvhiPtcxvHL/Ad7ELMeA9/V1lkY6g0nJFMxyiXNMtFeAxLGJGztqiGvbHkRF5d77DX2TrhVcht
	o/OEzOEErO3HwJPR8Tue8NhgrsC9BBHVw9Cyrd8/GdPTkZdF3RKc08Ft8GgqRHvB465479DHKaW
	emH71ij2SFKkd/8Pi3Nmu6k3AxJov8t04G3Wg6aaUQjUVohD7iH81zuDlYmGbZsny4tcvrmtiac
	562A4QaDa66wF44TAlbWWlwY4tEWHKn5jNsuPghrG/bzjNWm5X6vmopZLfJHy6n+SOqz4jm+6J7
	/rpt6BTw1jxNC955i+jpONKvqB/C1Q53llknf3WD624JWXyyTcZX+CbmVXs4jkreuGQT9N
X-Received: by 2002:a05:6512:10d3:b0:5a1:7458:c17e with SMTP id 2adb3069b0e04-5a285b55dd3mr5528724e87.37.1774360483376;
        Tue, 24 Mar 2026 06:54:43 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207454sm3162823e87.48.2026.03.24.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:54:41 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 24 Mar 2026 14:54:16 +0100
Subject: [PATCH v9 2/5] i2c: mux: add support for per channel bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-i2c-mux-v9-2-5292b0608243@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
In-Reply-To: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpwpeS17UHmxhJ8CGOEdifxF/PD0KJwhBW/q8sM
 6oYa9EFnq2JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCacKXkgAKCRCIgE5vWV1S
 Mq4kD/wOYxLZGglFGcP1qoL6GdhHXQO/bjAa/srPJEh7UjC7KC/0tc0ayxEKJfdrGAgrSXGcP8C
 hA4gclNC7vYdcQu2W280HT+hQjL7KRrJ16cPdK6zqO1IEAksvJyiLaYh3VDux74cUyMRUcHTAIp
 X+nhE/eJLLtQU45xEx/FB4GaxBO1ociPSjkMPRJjsgflDRQNL4UgB+1xKQyS533qnsr18hrfnMz
 R08DRT1IyxAzQzZu6Z9prSkmYJhQSKLKw8+zGV3hGaSBfdpkwGWGwbIJnzTJ1I2eO2/cf/iGD7k
 QBVg/3/Fx9w7mVBnmOQe0MqTzL/wkxwrq5+3l1gKHrqfHuQ4llJHKFopPpQV6oRQB5F0ylxe2Sp
 OD0KISytWmYJhMHCTSldawhC9eeEYopuEplmQEXExGtnjcQcYt6GWkx3rPYBEb09xLoNW+Q4sIo
 iWPMZiprIlkJTijf/JQ85Z9Kq6oQv+H0vqdmbHTZEXO5f35rQN8qwORuziDKvvPsX5197F9qI1F
 Wr20d9i8SejoK0uT7ewowtxPGuTX+O+4a2StViFktLGrpAWLc0Sz1bLu54P32cztNLh4HQtVqv+
 5e0Y/fBmUpqzxFOt6PwfGFh8p+1+swNWcWxLomOcdTE8BELjSjEHkTgefMFwp3vSF4JVUymba2l
 +dkAzDbOX/npvjQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_065445_891261_9BBCC64E 
X-CRM114-Status: GOOD (  22.19  )
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


