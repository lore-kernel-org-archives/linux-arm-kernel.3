Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E5CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfyuHu7f2fQho6DT6kcnt03GbK0UWs35JdS1BwwuDZw=; b=FduHeEAi6MXnT1JxtYh4W4h++7
	YaxI7Z1kCOQPJFIKCifXcMheB/9quhgCKNOTOIz0AeJOidd95fLtrG/al3nJElhmpN4SYRLYDSVc4
	LYed2p7kdnacK7uc6iIDwx9kxh9NncnqxSht3cdT29DIDj4R5HDy+fGA82WbHhVqR8EFx5qKN1KC3
	+Yj7Gsk+O8k9E9NBS/YGaHI0fcazxWlG1ixvBBexhzufawjDocjc+CXdo+qZyufYrY/KchvTwA70H
	FkdGb4UFc+X6Wy7a4/RwzXVbBweSi967vcLtTC48fuQZAEs1xBc0Efi1wJO6skCHG5B9MrQ519zoI
	wzgTPxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVg-0000000Adrr-2N8x;
	Thu, 02 Oct 2025 14:42:20 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVc-0000000AdoB-0k0T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:42:17 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so1173685e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 07:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416134; x=1760020934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfyuHu7f2fQho6DT6kcnt03GbK0UWs35JdS1BwwuDZw=;
        b=mxxF76w1yHiFudTtlomQv3v9g6us2uxZ46uh/HI6MIt+cGHPrIPL732b17OyOBM3YW
         w6oP1yZq952WC7JXrX1V5Ys4un+XTOhWosjNiPBHPjOr/7un+y2uLII1SItA09zv1nif
         5KamrNM5akTuDYdxpzupOXUWorBuEioJHPMfvgcCojSnqfSwbVwFCNpNRDBIJctBl9d0
         2/lgEX3IrPhQrn8ReFcJj0nQKlFDcWy3PULyY0L8mwlR8zb+M0HRHw8Ys5lcJfSZeEg2
         3eI6KMGdGFo1QDZg/SPpcXvxeFBCl0tL3xYH3wJLMjE146HoMtOjxKgHxdDaOKrBzFxG
         5ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416134; x=1760020934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfyuHu7f2fQho6DT6kcnt03GbK0UWs35JdS1BwwuDZw=;
        b=BhakkW91b4aQHhmXXMbtMeURWNk+TCo4jwYlqQ9BM2mpvCNfxUfvqw8cwFhLN1WmQX
         xgHAEgv2UsJSyDZiatT6OGjSO3l9FZn5jyDXzQFIGkNj/tnva/no5tox3MBbxdmiknhn
         nJKiBp/4HfMUFM8/Y97W5olr4yTtNF1L6DUAqBz0PhS/b6JCOXlca4ZMupBmPoLBJ42I
         ACUrplARhOlNAqDoi1C8DLMABTQgbQ6ZZsaR/dllCY1FcNhQgfNCPuzRAgsIJEKygKQ4
         vx488SMx3GmuKeuGM+EdDRZWvAtMNESOZKwaTLV3DQPvRP+FK+wu77I4BXBeZm5w4DnK
         2VFA==
X-Forwarded-Encrypted: i=1; AJvYcCXp+Cr6oNkA/XUG7e9BE1EdVWKQaDhBl/YZETvx+VY7emy+aKn3jDsIEbWToZSSh3819yF5GPaCwWnCtjQFKd4x@lists.infradead.org
X-Gm-Message-State: AOJu0Yytrl1m630Buqy1rR2adx1M/ntgSrxQqb7T6A62OpEZMH3O/FYr
	k5kbeLWwXVDCq1v629IDAz0V1iwjTCp1l5U8lgjZHw9+CfOYQfkogeyS
X-Gm-Gg: ASbGnctWu68vs0EV1qd1GEHP+ucYB7Oq3HT9zucv9s8oVEEM2fhPV8AKCud4sIQrQlF
	pVE36xypFwXyG3KeENORrauiYnet2yZNi/39Pb1MJLvrg/mjd5OV8D+9cJvbqD7zrLtcSy3HigI
	SNbvdhC5nsp4X2/LDosUy/RiqnQucKOxSVL91jL5z16sqytfm+6mzXRPhY9DqUZ//unAPse4JgF
	W1JuLYj6u6DdlSMyeW5YF+1gITn6y570uTlBV/TjeXHazQ8WrYrcM4r8DLndhoihALCwqgM3alJ
	TYrAzzc++n/Qm5sHDbCyEmeuVi9Xnv1eTKVtqx7JZeLkQtfELzRAmvSxI8z4O5FwIeGu7QAAfwn
	QHOvogBAsNZP/NOtbTSesUiC3atDNneFMDQMVwHZadi2EPvNB6xIDpDYytKBFMUet/b5nAmTxdl
	kYRd3OFn6GOGooy/s=
X-Google-Smtp-Source: AGHT+IHvlF2spZ+hnhw5AwvVnmf222TFfcTBJgdlsu4qB7yk4mCTPKnFgGpIgM5bjJFAbuhn7c4yJg==
X-Received: by 2002:a05:6512:3994:b0:586:83e2:228a with SMTP id 2adb3069b0e04-58af9f4a92fmr2258097e87.45.1759416133957;
        Thu, 02 Oct 2025 07:42:13 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:13 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 02 Oct 2025 16:41:33 +0200
Subject: [PATCH v2 2/5] i2c: mux: add support for per channel bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-i2c-mux-v2-2-b698564cd956@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7497;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=CnKS7KgVbqNJeBUIwvWBcCBehV2jOZtzW9PNcQI/CnE=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o8uMaRwZa8DTWs5SZOYWDcoIZ4pXHFz+5S3P
 ue9nMSTMCaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6PLgAKCRCIgE5vWV1S
 MspED/4gVppfP67fZfYX4b17MuAi36CT5f+G15I8IWwI11Mh48RloIeylQQvVa7JL1KMEAx34ZE
 WIboQKCSMIHQc3wMNvODVCe3adi2Lfhmrxwed7hFmT21xlEeRu2KLXtdBeByxUYOZDLiKUHDsHT
 WJHxvJcilPDBEN+ibki695c/SQkshy7xvuNsA7FOY7Ci2Tpc5+Qfyyqr0qaqpQ89sPLn8Zv8EoS
 2TgzMOJfMBndWxmPTKlY9uMT9keD2p+fYgZ6xVNc3ZJuvXWbtdOKh5ePuLQiWWlrmccO+M2kqEM
 nXvJqCGFQq+qMjv3msXfDOPM7LKK7XdiM38PPzDRs3sntxL5KsqOa4Nmu35fBMftpyJGEILvwMl
 2r9c7yTlb7SpwrFTAb6YDvvK5CW8MMZP+hTWqr10T1Fz9IxTi1Y8FIuhqs4Y++pFRJ6Kfcm7Wql
 jVWxZhhUTQL0RWj0f+vhE67FUi3ZjaaXA+yqYRzCgC9LCZKEIScdyVwUqwFuXs1ids4WEbjJxMH
 dyRnr86y2xAPil7VJVBanvftkG5R6N6PBI9dkaDcvx6Ut9tcy7tQJK8Q4U+Cx6TT70JpJvqA2nU
 RgFqAPLNuqvuH3HWAaILH1bB9lVsp+dtY9YJD5XhBZ5iXCvOgofuvzXCGFCA/TYFuBlzNOPBa1H
 QSy5WB2sm2+k/Fg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_074216_278816_F0E77F04 
X-CRM114-Status: GOOD (  23.84  )
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
 drivers/i2c/i2c-mux.c | 115 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 103 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 4d8690981a55dc0e1b35454971923791e6ed9f7f..5987853afa75cb58e1c6af6c7e7d52873ea53507 100644
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
@@ -365,6 +431,31 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
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
+			goto err_free_priv;
+		}
+
 		priv->adap.dev.of_node = child;
 		of_node_put(mux_node);
 	}

-- 
2.50.1


