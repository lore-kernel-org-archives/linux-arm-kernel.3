Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C007CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Isv7N56R7GLLyxOJRI4a7jcx/LSO3hI5hjNg+m1oWY=; b=QPSkeNgmp08x9hhr+QmwBxB7AS
	icFEO3CXDzw7BILj1vCPl5WPOtwskfNGglBHn7keEDCi1HFv73woyQyEJi9dEzg6gYGf4bvMTDR8p
	oIYBDRXt8Zj6bJK5jwMyw75gDPSoJiasUKx7JflIDsamIQEOLi7QjN2YL5HNl89SKsBn7TChlomJz
	DEVqWtX4KNMBKeYgWmmFDmQaj6StDK1OxVm3oWsRYOxUUDWRQjP2hTJRZtnOPh8UC5GAhL6bqh3jb
	s/K347uXua00fliEWGNYdWhVvmrTRKB4ssylBmxNAoaA1J0anbLENBHQ69gCODCH2PI1o0742oHtM
	x1vQPc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTh-000000051wF-0K6r;
	Tue, 02 Dec 2025 08:11:17 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTc-000000051tr-2UBJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:11:14 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-596ba07504dso4115935e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663070; x=1765267870; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Isv7N56R7GLLyxOJRI4a7jcx/LSO3hI5hjNg+m1oWY=;
        b=aMC8Dl7LVG1cyFOjAdraNsR8Yqrv53XcA2GeCraVxmbDMVUoSHFqw68kA45X5Tlvf/
         hLUYP/qF/WmHZ4eJjQjcvOOyhpJlKapR7zlQqxeG2BPx/LVNpbHVMFQqLCpO3IZ2LKuY
         2xz41oaHN6ii9N1LqowwIsQKGo5TvRhfpio8yLQ0oBg+ObTL4I2ZTEmKYSr7000zH5uy
         Qk5Fl14ik4pxnwzk21z1KInH+6ewAj7FnoG9Wdl9CB2cAG7jPN4Kh7ri73Sgh4ynyr5G
         kJt531JVS5/OvavwLfqFO6DwiMCySPwDQFEhOyDSoyqC6M94E+dookFbyeeKv6Fh1QU+
         DGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663070; x=1765267870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Isv7N56R7GLLyxOJRI4a7jcx/LSO3hI5hjNg+m1oWY=;
        b=dB2arhwTsRx3cNlR3cIEpxgX7dV5mnPtZQCgP1HErnsEl4W6w9c2fL5ZPIj1tHM8ra
         mtSk2ST0NUjJGpxLnqPIgxolNfB+onv+1JDMm8DwF/KXZGQKsAGV5UrB2mv5lUqVg/Wz
         RVWKBFGcMe+flnU2C1NPHvgi644yLhjoS5XZEQP5AA70SSbTXA/y/k+5qu2maKz/SEO4
         xr4p7S15pFdSePijj+1mvm1TJgid+mLssY/IG/Wbz8Y2jm5rcqnOnyD0ncubAOeCHdOR
         SmsxLiJuKFp0c509Fnk2K4/Gfn5U6b8TEoB9Y6P5cKihRE6HmfRg2HzdbHn2MLGDsm/Z
         3lxw==
X-Forwarded-Encrypted: i=1; AJvYcCUFD4X7iJc4gSdCniF6YRdzax2T2WeBWG5OOmBI/ntRvL2Iqe9xXabdk2BZ9TV1tRSLf8Lt/mT2ergMfLEZsoEC@lists.infradead.org
X-Gm-Message-State: AOJu0Yys3z9jcVL2NwMR85cVyA3aRiKf+jaIu6P08zppYkPkAKbbkJ4Q
	itt6EvN78mYGwyt8+53Xe9svo5KpYmdhGoMphfW9H617038HvOW1u4fB
X-Gm-Gg: ASbGncvsVeDkm3vyqplmeoS0c5t8285u3VCm/ZIzhqpI2Ce1Mvmsb2FdXFqry010ZMh
	pbKS1Ndl/rVJ2bnsCubXb3W2XFlu6jdLiHgC/NzVVCi391dtIQac8oUOOwezz/oSlPsbR7uscuZ
	MvSb3EpCQZjoP9JKU75rAHdtakA6tIoDbgDzAmTqZd2U9iqPWxSV8gnSMoujUdm9VvoL967jN0Y
	uULBDLdRLVCgJ5xPH5GYBXx4ZRY+Yfr8pGcyutZUoikB1WUoknE1IOeH0s/zD07FVOUGL1J94KT
	Yu+lh/bicEq/Wl0cZguhWtSAAm+zsYBWWD5/2xCXukqdvtBBqZdVNg2pRO4K9nUG1OR4jA6U4l8
	bZeNX2kVUG3FZCsolF763guM08EfCqNxW8wIM/yleIOrWNQb6mtSQczHtvITZOvH4NSCP93TPx1
	sl1CPrjxGtP3XB8KOSQdsCQleGRclL8CG6NLUxt2Cl+R6jUnyPsAj1R3HH
X-Google-Smtp-Source: AGHT+IHkt5mBmHjh8rKVDEwEazUYb3LbQJH9Zf4gjO1RvE5cDpXQpDFmQNw8GIcrE1CEb2c7kqd9CQ==
X-Received: by 2002:a05:6512:696:b0:595:81e1:2d00 with SMTP id 2adb3069b0e04-596a3e565b8mr17685671e87.0.1764663070131;
        Tue, 02 Dec 2025 00:11:10 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:09 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:09:49 +0100
Subject: [PATCH RESEND v3 2/5] i2c: mux: add support for per channel bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-i2c-mux-v3-2-877dcf478a9f@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp8GR85xUVqPcFCzvjQEr/w1FRhbGmHJa4NlI
 JK1I2W1EvaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6fBgAKCRCIgE5vWV1S
 MkYxD/45TAxdHFF8XrvCWZ7OBTehcN0YcL1u2e8zUHg+1dKZkoOEaCpyNIqpNfT49w62Psid0rC
 Iybl0QZLD2w46eRd2booPOZ/n4LnRaFLPGFfQSa41W2JmUFO0a8n5TqeLrUmNbi0kUtOVAnEL89
 S2nN7rMbp5QFFJ/l7Zq/RAm81mwUBz79mw3NJht8N2qC/xvw2KXVnAs0YmiAOIdXPfPiP5iu2RL
 RUJMIt3IPz6VRkxR1BLvr6wp6Uvwg6+DseVerX6J8bcWMh80yM7AYIVcu0MMj9EX88Bnjsqo0eN
 3LFgiIu1CsvOExEuqr+CkV78Joi6kaiJJ8AVompM7kFF7bSOGxJza/NsBMXuPhqFpCSDLdP33cn
 4I0urkVV4oeukp9fU5NK6+jAehTRoETVvYAUWFggjaulf3FLK3acl7/QMBOEnsqXyqoexO3fMOR
 r9oksT2jly2JEOmmnJ1CeqIeE8zQHaqlGLjfGj4G/uqY62M+S+TC1Dre2dXGVLyBRoKrtilEfHG
 LRBtlObeenMVd9SVpByUcJIgQ1sRqmouM1qNJBd59kBN4md+6P0U9nFjtRurlQuqpM4sRoiXVzL
 qZb50k9f3VTkAf7b21Vw3mnPLzaigHwKaNkirDgFsSYkXEynpioQTJhYzEAww9WPxyG29yHkswk
 rq6omxzUuVey4xg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_001112_693023_21B9C056 
X-CRM114-Status: GOOD (  23.55  )
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


