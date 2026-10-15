Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E1ECC6B3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97yo0fKsgeGFqhnBbCjJS8TkGeGMF2V9RqeCMW7ds3E=; b=nkAEYbtF7Apd/GMFJSevgVlDYh
	n8SBm+C3rufUafYoi/NMda2cPPNmMrs+yfJmdlB4Hr4qAn6fFdN0CblVIUdu9BAaqCXZtVe4aV0TB
	jAdzfPiZAahmdDvfansnRpfHy8reZzw4yu4sEFocg8/bBv3F+0fWuMT9oo7fd5C1KX59fG61gC8xa
	sOqtWRdisQNe8ONJqyuzngKHWlTpRJ0i/P1emEWJFft+7KsfO1QJso/I0XVyqtFRqdF7lAHaO+xwJ
	7NrDyd/Bwn0iMFYLE/M+JMx1uOlQwUgx5LiTsFunmpAu7FXKSEvW5nutHyTDRz3F4T34eMKCGLdwg
	skj5ta5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEf-0000000HVlK-0mq3;
	Thu, 15 Oct 2026 11:02:57 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEU-0000000HVe9-2pt2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:02:48 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso4756933e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062164; x=1792666964; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=97yo0fKsgeGFqhnBbCjJS8TkGeGMF2V9RqeCMW7ds3E=;
        b=IZAosjOR6PTMC5sTwc2W9vrLbpvM2BnR8UxOjuTh2k2MkqhpP8Q7sX51f63aHGprGw
         u+aIUDmj6MhCf2RUNdCjRU+6Q6so/JuZF6Cv4ydTQvQYOYsQ8zbRWaNKtMhsRWWa/yIU
         crzLNpU0HCcRbiGmwmDBD0ksjS5PdVrsATXbZmrew1FoF4RyDz//v4u8gfrXxi3C/Wx6
         9YOEL4wSCfATfnANKPjXp/jnQ0hUYsiCIKshkSk5OzpkZ3JFCKEf0AvHsXVBBnE2myi9
         8bt3pyG1eLbbfPVhIKCF17uScPJ44kWs9F9PSWP9k9PKxQyBF43aVXbEVrGnmjUzUr6T
         eZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062164; x=1792666964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97yo0fKsgeGFqhnBbCjJS8TkGeGMF2V9RqeCMW7ds3E=;
        b=eBCQe9/dhsUmXT8on40xKCINOQpeKenklvDeSPJPP9m2goGTKu+8WIqupC1DAwTWzd
         QLv7NxEqpLEWe40NE56qd/ctgWjeuG51eIRcYJZAbsKjeHEdwYK6J03fQ5M4DP+6Tw1Q
         6UW19fbwRFL9deiTGA1DhR1Bi2zOruJwMJ4SX7tUDXWiO47oP6O7LB4z2eU/wJRTxaSD
         /vZUqv/2fNDWw9F7dquT1ZLTyZUvUiOGesglrtZMifGedH2pZER+hS0jnaOqxF1RW7q+
         uAwh0CUt/ED5pnAYtiQIMvCd0qaw87DMNJBNCgPIZFV+jirt3m20X8CdZ/zr6cQQBqql
         aPpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgJZ84d7ZBB4NJZyRFt2Ix7761y4jWS4Vjt/l2kBYcqlereh0cP9aUcYyWzLNsaa7Db+8pfppiMlrLfNkXAxrP@lists.infradead.org
X-Gm-Message-State: AFq9FYLNZVITfpqvHflT56uaCrVE8QlK9Ks0TvfhAMnwvO4WssfSAIzq
	PkJl6kGQaQwWjYD2M5nqoq25oP41aD5Uh2ABAcMcPH92qL3X4AabtNte0u2dU3M9
X-Gm-Gg: AYBFou0AIIIeEbPuGByzPcB/ICJVMxiw3U7So0OlEGJGk6qPL/Cv5GHdWVU2G/y1cmY
	yJsmGsI7FdoWQiPCk1oo/85wZxUm94xEbYbUH0C13XTmLpiUOj6TgZ4UpnpV/PxV/BS8q4jUhB6
	KI4xjsTmj7IUWy6nTts3Jv9whXyF+/p7CzFAUcI8bS5NjnTCu4T8Fm53BSUjXzyJS9/dzCG1ub0
	5puRm7lZHaASEItM7PcqV4hw6ZKEiAQPd9RCxF6V7teJe4awnFhz2voNkb9rxhHZpOq0x/Cn+3r
	Yl196pyhkIz56SfisAEx5sn7yVknYrwyDTooj0EHdQoXYsyxnh2z7s94OBngDGNIT+mu7Y8HVP7
	Pyn1bk1GY3lk7FdOHV/RRgQ2J4XlNYgrkPuYOVSN7gzmpXKxfzLRTA75K65lwqYDUAV9JTjtsoS
	RV+9qfpyGMCcq6i+aaiC7iJSplypcmysEMCv45DhUoP0TPIdR0nfKAc5gG+Xw1WB6VXu27AMmuV
	NW/PyTyAeLEHxJ7BNFmS9s0aTAXWYa47XELkSGDA6nQ0kE+FVk=
X-Received: by 2002:a05:6512:3c8c:b0:5b8:f52b:8119 with SMTP id 2adb3069b0e04-5bcde6c3488mr6877310e87.28.1792062163946;
        Thu, 15 Oct 2026 04:02:43 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:55 +0200
Subject: [PATCH v13 8/8] i2c: mux: pca954x: use idle state from
 i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-8-778a12cfe93b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5947;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=9YRIh1kA+u4lYxkKWuQvSE5rfD/xfftps0tycTQULKQ=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LLFXHI/5KZNJWCwgy0qPKveBhWDSZ9kWT7/q
 AyVPJdh89qJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCyxQAKCRCIgE5vWV1S
 MmpWD/919NDmrYuCr74+cf9mCKMSlAM88yzdunn9MN3qlJOe/PaFY7PQ8qCZbg+rSuK4sfNLFij
 62v1RWkIFQDitVLa9VhYmXbsqdDH76x8UZwdf35/otVNZrcp81Fhtw6Hl7QrX2SryJo5r917uLp
 1Cfi4zXX6MBE7WDfeEluqtX0262zejjkPdESy7F4yST+v6AZcl0RcVf6IVKFDaguZCm1jBCq4rj
 S9DSm7IPLgMZaHO8klaa68hFfdpn1WfxtJ5Klx3X0hCY1eI8qugvMPf2C/R0rDNcCiQAGQShYoF
 QWYqek2NUlTInrcfwG275/NPkvKmqz1iv6IBIwUuvmg+/H74V2aIcBnG4iSMs7vZFDqlT7N1Utg
 rAduVUusJoI63uU90e3pQMlFVOBVmBXHrb5bumQka1tUJppdxhgYW3n/fHn4sbh9zjtvFJ+o7if
 5R99FvXlAvMcZTGN7RzXwDmZJMZjRnVQMOqrifp9Nxo2aVBmvSA+xqD6XK2ghaKBMKXWDnFF2X1
 jsVhMJ3apt9ONeXK6Js4wcDa4nK3T9TbwNct8cSs2o3tdPhjD/fbLvT2DJOLHPliypGSjF2K6DY
 KmcyC2b3KrYsMrSsGXMZ/O5fkwgp/b3YhVi/4TT9APdl+9oOP6phAprFG9SfvJRw5vusQ8dVs0/
 3jMhpLOgG33/OeA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_040246_807240_4FDD6D17 
X-CRM114-Status: GOOD (  24.91  )
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

The core now have support for keeping the track of the idle state.
Make use of that instead of handle this on our own.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 76 ++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 8fca709ed279..87bde07374d2 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -52,7 +52,6 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <dt-bindings/mux/mux.h>
 
 #define PCA954X_MAX_NCHANS 8
 
@@ -108,8 +107,6 @@ struct pca954x {
 	const struct chip_desc *chip;
 
 	u8 last_chan;		/* last register value */
-	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
-	s32 idle_state;
 
 	struct i2c_client *client;
 
@@ -337,14 +334,14 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
-	s32 idle_state;
+	int idle_state;
 
-	idle_state = READ_ONCE(data->idle_state);
+	idle_state = i2c_mux_idle_state(muxc);
 	if (idle_state >= 0)
 		/* Set the mux back to a predetermined channel */
 		return pca954x_select_chan(muxc, idle_state);
 
-	if (idle_state == MUX_IDLE_DISCONNECT) {
+	if (idle_state == I2C_MUX_IDLE_DISCONNECT) {
 		/* Deselect active channel */
 		data->last_chan = 0;
 		return pca954x_reg_write(muxc->parent, client,
@@ -356,15 +353,30 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	return 0;
 }
 
+/*
+ * The mux core only knows the maximum number of channels the driver may
+ * register, so range-check against the actual channel count of this chip
+ * before handing the state over.
+ */
+static int pca954x_set_idle_state(struct i2c_mux_core *muxc, int state)
+{
+	struct pca954x *data = i2c_mux_priv(muxc);
+
+	/* I2C_MUX_IDLE_UNKNOWN is internal to the mux core. */
+	if (state == I2C_MUX_IDLE_UNKNOWN || state >= data->chip->nchans)
+		return -EINVAL;
+
+	return i2c_mux_set_idle_state(muxc, state);
+}
+
 static ssize_t idle_state_show(struct device *dev,
 				    struct device_attribute *attr,
 				    char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
-	struct pca954x *data = i2c_mux_priv(muxc);
 
-	return sprintf(buf, "%d\n", READ_ONCE(data->idle_state));
+	return sprintf(buf, "%d\n", i2c_mux_idle_state(muxc));
 }
 
 static ssize_t idle_state_store(struct device *dev,
@@ -381,18 +393,19 @@ static ssize_t idle_state_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	if (val != MUX_IDLE_AS_IS && val != MUX_IDLE_DISCONNECT &&
-	    (val < 0 || val >= data->chip->nchans))
-		return -EINVAL;
-
 	i2c_lock_bus(muxc->parent, I2C_LOCK_SEGMENT);
 
-	WRITE_ONCE(data->idle_state, val);
+	ret = pca954x_set_idle_state(muxc, val);
+	if (ret) {
+		i2c_unlock_bus(muxc->parent, I2C_LOCK_SEGMENT);
+		return ret;
+	}
+
 	/*
 	 * Set the mux into a state consistent with the new
 	 * idle_state.
 	 */
-	if (data->last_chan || val != MUX_IDLE_DISCONNECT)
+	if (data->last_chan || val != I2C_MUX_IDLE_DISCONNECT)
 		ret = pca954x_deselect_mux(muxc, 0);
 
 	i2c_unlock_bus(muxc->parent, I2C_LOCK_SEGMENT);
@@ -478,12 +491,15 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	i2c_mux_del_adapters(muxc);
 }
 
-static int pca954x_init(struct i2c_client *client, struct pca954x *data)
+static int pca954x_init(struct i2c_mux_core *muxc)
 {
+	struct pca954x *data = i2c_mux_priv(muxc);
+	struct i2c_client *client = data->client;
+	int idle_state = i2c_mux_idle_state(muxc);
 	int ret;
 
-	if (data->idle_state >= 0)
-		data->last_chan = pca954x_regval(data, data->idle_state);
+	if (idle_state >= 0)
+		data->last_chan = pca954x_regval(data, idle_state);
 	else
 		data->last_chan = 0; /* Disconnect multiplexer */
 
@@ -560,6 +576,8 @@ static int pca954x_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
+	int idle_state;
+	u32 prop;
 	int num;
 	int ret;
 
@@ -618,25 +636,32 @@ static int pca954x_probe(struct i2c_client *client)
 		}
 	}
 
-	data->idle_state = MUX_IDLE_AS_IS;
-	if (device_property_read_u32(dev, "idle-state", &data->idle_state)) {
-		if (device_property_read_bool(dev, "i2c-mux-idle-disconnect"))
-			data->idle_state = MUX_IDLE_DISCONNECT;
-	}
-
 	/*
 	 * Write the mux register at addr to verify
 	 * that the mux is in fact present. This also
 	 * initializes the mux to a channel
 	 * or disconnected state.
 	 */
-	ret = pca954x_init(client, data);
+	ret = pca954x_init(muxc);
 	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
 		ret = -ENODEV;
 		goto fail_cleanup;
 	}
 
+	/* Set idle state to the default value, or to the value specified in the device tree */
+	idle_state = I2C_MUX_IDLE_AS_IS;
+	if (!device_property_read_u32(dev, "idle-state", &prop))
+		idle_state = (int)prop;
+	else if (device_property_read_bool(dev, "i2c-mux-idle-disconnect"))
+		idle_state = I2C_MUX_IDLE_DISCONNECT;
+
+	ret = pca954x_set_idle_state(muxc, idle_state);
+	if (ret) {
+		dev_err(dev, "invalid idle state %d\n", idle_state);
+		goto fail_cleanup;
+	}
+
 	ret = pca954x_irq_setup(muxc);
 	if (ret)
 		goto fail_cleanup;
@@ -687,10 +712,9 @@ static int pca954x_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
-	struct pca954x *data = i2c_mux_priv(muxc);
 	int ret;
 
-	ret = pca954x_init(client, data);
+	ret = pca954x_init(muxc);
 	if (ret < 0)
 		dev_err(&client->dev, "failed to verify mux presence\n");
 

-- 
2.55.0


