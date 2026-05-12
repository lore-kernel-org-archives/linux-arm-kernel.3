Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA95CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 22:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdncnFqQOgUiVSEOFhs+0L3Uf5+UCLHNWz3msC+HnSs=; b=Jd+UPATOWIOB27GysvLmrDAxps
	OBPdaXr03U8PN9apXKS2NnSkvLJp5rslRq3rskHgTrN9LPMI7zanK5vAFPyEdR0Q2B9AAkv3i3B2K
	ArThdrgu6tgpkKkzGQQnG+sQkwHGH/uVDmD4FixWnHUPqRnX43bX7IzBjb1Dl/BFKFc4+BXX0zSft
	eKo70xxhowUPReO2kSypKHwGNxvFhPDiG+TeEfCOfdCoQvBwu2sVBqaZQ1RgXr3wEg+UBqLhUt6lM
	V+E7wgQGo3JIy21wQXvN7u93lenOzTN+LDw7uQSgrxDPK+OhgvtHB4VR86J/1OFXFzPLvtvIvpQ6J
	mh70MKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpu-00000000c3x-0KpL;
	Tue, 12 May 2026 22:44:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpq-00000000byi-1H1Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 22:44:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48910865133so5132195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 15:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625856; x=1779230656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdncnFqQOgUiVSEOFhs+0L3Uf5+UCLHNWz3msC+HnSs=;
        b=gaN7sJ6ciZ3YGy+1G+NxjvPG5r+NS2NNZlM24MEflvTaU5ZIGMdp0Ktt40yoyYh2yG
         5MRwjoWpkBBaeeShMTy4zwcfVduvweDfYW0n7JqreMzFrNA9ovrMYqsG1Wo9ZcWOwGfU
         ZIE83tDIZpPhy0Vcd/QDVgB9LV6cRK9MaszHeH2gKek6eouauKylNrhFt9kI7Bny2R2F
         fYMX9MyUVTH5OXg0cnsSh8tfgyikhyES2ZxRRHyww+NQQtQeuiubIDO4EjlQsYiwZY6u
         1ZV+BUHFMnNr9g74igy6dZoI3KcmmsEReVJe+7uA3IH2SE7Ul0hS/gWJ6amjIVWD4VWv
         ThYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625856; x=1779230656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wdncnFqQOgUiVSEOFhs+0L3Uf5+UCLHNWz3msC+HnSs=;
        b=SEFFnjurBB4HUeQ1BeBKQyFGeRRjVJrM0vQMVCq1hLcyyCd30WVgDozU0cAyGflAWb
         +lzJt2aWd6fNU7o5uDrtKmpvo6+fv74dnmCUG0Qv0VYT9WiKMDYoOStrlYQaYVt0qLD2
         MnmoJ15sILHycdENowPN5aYbtKdF6TnOtmaIeR3qKkuxkwaN63xwHqeLDkEQBnn2nEq6
         TcadTsfqONdJiGWKfmbRJtq9/O/8sP3ywHxqMqjJFEHWqJzecXl1YHJgjDxI0ToHwvDo
         leSPgFsqs9dhVr6rCrDAWOw6sOgOpCCGpfjXX4lYRm0tzxWH4vUkDQR60PdeVCmV2W3b
         9GVA==
X-Forwarded-Encrypted: i=1; AFNElJ/0coUaiq+Ue1pCGvObwk+/2krjeKDDWz6jY8d38rNb2t5edQUaYuvy07qHbd2UOrE4uAn8mRS+Z4j2E2RUpjEU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzit2kq8XV5vymJ819osabP5CFd2z+e6A+T/j4y8Fi3LyWcoZ52
	0MXu05XMjGYNW7yto+LFxHZug4zK1whus2ym+yF6x62C44weSyaDu8a0
X-Gm-Gg: Acq92OFy8/cblwvxZ57KVFhb6i++iI1iFOYhMYJA5rbhoL039WZCtVOl/SL+c2Qynxw
	ohOFyZpvOvsVOu2VKM+qGTSjnFXism5lhiu9TsH8sw0cNpBKkcCKmPRxDHEqUWfJ+GfFRwGiviV
	7PjCSY1ahObYPTPifYh861DterR1FMHHbdDea08ds47NdBoI7To30ehjabpPmyHAwRqMZmBvPVd
	YeT1Yy0uTdTm5wEOw1QhI4UFnkvOeQiPHax4GLKbgqeJQhgzyLk3XdRi74aCer6MegcUJnhTTH3
	wUaUgB+DX6MIiJ3d7xRIYNomtSbLP2MWjyC//k0OVq9IWYerJVurTfPqxW1S1PFOEIxORBvLiu4
	T5rAmZ935gqCbuT1yJkPp8/tEJrEaJgXiBnq6EQ7AKiMarcWMh3njQnLKRNVh/W0KLaQMb1JzqW
	OOMy+NBRVU84ONupdL2TFv3Q4lfcsXvHeghSOBKCyDnsrRM47bljukK0r889neL/Y=
X-Received: by 2002:a05:600c:4447:b0:489:1dc6:d6e with SMTP id 5b1f17b1804b1-48fc9a04fa7mr4375945e9.1.1778625856210;
        Tue, 12 May 2026 15:44:16 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm3194025e9.14.2026.05.12.15.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:44:15 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 08/12] crypto: atmel - move device sanity check to core driver
Date: Tue, 12 May 2026 22:43:45 +0000
Message-Id: <20260512224349.64621-9-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512224349.64621-1-l.rubusch@gmail.com>
References: <20260512224349.64621-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154418_392360_F9191458 
X-CRM114-Status: GOOD (  22.32  )
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

Move the device sanity check implementation into the shared Atmel
I2C core driver and reuse the generic EEPROM access helpers for
reading the CONFIG zone lock state.

This removes duplicate CONFIG zone handling and consolidates common
response index and lock state definitions under the Atmel I2C core
namespace.

Update both SHA204A and ECC drivers to invoke the shared sanity
check helper during probe.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c     | 10 ++++++--
 drivers/crypto/atmel-i2c.c     | 43 ++++++++++++----------------------
 drivers/crypto/atmel-i2c.h     | 14 +++--------
 drivers/crypto/atmel-sha204a.c |  6 +++++
 4 files changed, 32 insertions(+), 41 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index f08fdf284b60..f6d1a9694d63 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -81,7 +81,7 @@ static void atmel_ecdh_done(struct atmel_i2c_work_data *work_data, void *areq,
 
 	/* copy the shared secret */
 	copied = sg_copy_from_buffer(req->dst, sg_nents_for_len(req->dst, n_sz),
-				     &cmd->data[RSP_DATA_IDX], n_sz);
+				     &cmd->data[ATMEL_I2C_RSP_DATA_IDX], n_sz);
 	if (copied != n_sz)
 		status = -EINVAL;
 
@@ -144,7 +144,7 @@ static int atmel_ecdh_set_secret(struct crypto_kpp *tfm, const void *buf,
 		goto free_public_key;
 
 	/* save the public key */
-	memcpy(public_key, &cmd->data[RSP_DATA_IDX], ATMEL_ECC_PUBKEY_SIZE);
+	memcpy(public_key, &cmd->data[ATMEL_I2C_RSP_DATA_IDX], ATMEL_ECC_PUBKEY_SIZE);
 	ctx->public_key = public_key;
 
 	kfree(cmd);
@@ -323,6 +323,12 @@ static int atmel_ecc_probe(struct i2c_client *client)
 	i2c_priv->data = data;
 	i2c_priv->caps = BIT(ATMEL_CAP_ECDH);
 
+	ret = atmel_i2c_device_sanity_check(client);
+	if (ret) {
+		dev_err(&client->dev, "failed to read EEPROM, is hardware attached?\n");
+		goto done;
+	}
+
 	/* add to client list */
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 26863573a10f..50b6bce478d2 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -23,6 +23,11 @@
 
 #define ATMEL_I2C_COMMAND			0x03 /* packet function */
 
+/* Definitions for the device lock state */
+#define ATMEL_I2C_DEVICE_LOCK_ADDR		0x15
+#define ATMEL_I2C_LOCK_VALUE_IDX		(ATMEL_I2C_RSP_DATA_IDX + 2)
+#define ATMEL_I2C_LOCK_CONFIG_IDX		(ATMEL_I2C_RSP_DATA_IDX + 3)
+
 /* Command opcode */
 #define ATMEL_I2C_OPCODE_ECDH			0x43
 #define ATMEL_I2C_OPCODE_GENKEY			0x40
@@ -129,26 +134,6 @@ static int atmel_i2c_init_read_eeprom_cmd(struct atmel_i2c_cmd *cmd, u16 addr,
 	return 0;
 }
 
-void atmel_i2c_init_read_config_cmd(struct atmel_i2c_cmd *cmd,
-				    const struct atmel_i2c_max_exec_timings *timings)
-{
-	cmd->word_addr = ATMEL_I2C_COMMAND;
-	cmd->opcode = ATMEL_I2C_OPCODE_READ;
-	/*
-	 * Read the word from Configuration zone that contains the lock bytes
-	 * (UserExtra, Selector, LockValue, LockConfig).
-	 */
-	cmd->param1 = CONFIGURATION_ZONE;
-	cmd->param2 = cpu_to_le16(DEVICE_LOCK_ADDR);
-	cmd->count = ATMEL_I2C_READ_COUNT;
-
-	atmel_i2c_checksum(cmd);
-
-	cmd->msecs = timings->max_exec_time_read;
-	cmd->rxsize = ATMEL_I2C_READ_RSP_SIZE;
-}
-EXPORT_SYMBOL(atmel_i2c_init_read_config_cmd);
-
 void atmel_i2c_init_random_cmd(struct atmel_i2c_cmd *cmd,
 			       const struct atmel_i2c_max_exec_timings *timings)
 {
@@ -247,7 +232,7 @@ static int atmel_i2c_rng_read_nonblocking(struct hwrng *rng, void *buf,
 	if (rng->priv) {
 		work_data = (struct atmel_i2c_work_data *)rng->priv;
 		max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
-		memcpy(buf, &work_data->cmd.data[RSP_DATA_IDX], max);
+		memcpy(buf, &work_data->cmd.data[ATMEL_I2C_RSP_DATA_IDX], max);
 		rng->priv = 0;
 	} else {
 		work_data = kmalloc_obj(*work_data, GFP_ATOMIC);
@@ -287,7 +272,7 @@ static int atmel_i2c_rng_read(struct hwrng *rng, void *buf, size_t max,
 		return ret;
 
 	max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
-	memcpy(buf, &cmd.data[RSP_DATA_IDX], max);
+	memcpy(buf, &cmd.data[ATMEL_I2C_RSP_DATA_IDX], max);
 
 	return max;
 }
@@ -338,7 +323,7 @@ static int atmel_i2c_eeprom_read(struct i2c_client *client, u16 addr,
 		goto err;
 	}
 
-	memcpy(buf, cmd->data + RSP_DATA_IDX, 4);
+	memcpy(buf, cmd->data + ATMEL_I2C_RSP_DATA_IDX, 4);
 
 err:
 	kfree(cmd);
@@ -542,7 +527,7 @@ static inline size_t atmel_i2c_wake_token_sz(u32 bus_clk_rate)
 	return DIV_ROUND_UP(no_of_bits, 8);
 }
 
-static int device_sanity_check(struct i2c_client *client)
+int atmel_i2c_device_sanity_check(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 	const struct atmel_i2c_of_match_data *data = i2c_priv->data;
@@ -553,7 +538,8 @@ static int device_sanity_check(struct i2c_client *client)
 	if (!cmd)
 		return -ENOMEM;
 
-	atmel_i2c_init_read_config_cmd(cmd, &data->timings);
+	atmel_i2c_init_read_eeprom_cmd(cmd, ATMEL_I2C_DEVICE_LOCK_ADDR,
+				       ATMEL_EEPROM_CONFIG_ZONE, data);
 
 	ret = atmel_i2c_send_receive(client, cmd);
 	if (ret)
@@ -565,8 +551,8 @@ static int device_sanity_check(struct i2c_client *client)
 	 * Failure to lock these zones may permit modification of any secret
 	 * keys and may lead to other security problems.
 	 */
-	if (cmd->data[LOCK_CONFIG_IDX] || cmd->data[LOCK_VALUE_IDX]) {
-		dev_err(&client->dev, "Configuration or Data and OTP zones are unlocked!\n");
+	if (cmd->data[ATMEL_I2C_LOCK_CONFIG_IDX] || cmd->data[ATMEL_I2C_LOCK_VALUE_IDX]) {
+		dev_err(&client->dev, "Config, Data and OTP zones are unlocked!\n");
 		ret = -ENOTSUPP;
 	}
 
@@ -575,6 +561,7 @@ static int device_sanity_check(struct i2c_client *client)
 	kfree(cmd);
 	return ret;
 }
+EXPORT_SYMBOL(atmel_i2c_device_sanity_check);
 
 void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv)
 {
@@ -633,7 +620,7 @@ int atmel_i2c_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, i2c_priv);
 
-	return device_sanity_check(client);
+	return 0;
 }
 EXPORT_SYMBOL(atmel_i2c_probe);
 
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index e30e0c417de2..2f76e107340e 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -82,18 +82,10 @@ struct atmel_i2c_of_match_data {
 #define STATUS_NOERR			0x00
 #define STATUS_WAKE_SUCCESSFUL		0x11
 
-/* Definitions for eeprom organization */
-#define CONFIGURATION_ZONE		0
-
 /* Definitions for Indexes common to all commands */
-#define RSP_DATA_IDX			1 /* buffer index of data in response */
+#define ATMEL_I2C_RSP_DATA_IDX		1 /* buffer index of data in response */
 #define DATA_SLOT_2			2 /* used for ECDH private key */
 
-/* Definitions for the device lock state */
-#define DEVICE_LOCK_ADDR		0x15
-#define LOCK_VALUE_IDX			(RSP_DATA_IDX + 2)
-#define LOCK_CONFIG_IDX			(RSP_DATA_IDX + 3)
-
 /*
  * Wake High delay to data communication (microseconds). SDA should be stable
  * high for this entire duration.
@@ -195,8 +187,6 @@ void atmel_i2c_flush_queue(void);
 
 int atmel_i2c_send_receive(struct i2c_client *client, struct atmel_i2c_cmd *cmd);
 
-void atmel_i2c_init_read_config_cmd(struct atmel_i2c_cmd *cmd,
-				    const struct atmel_i2c_max_exec_timings *timings);
 void atmel_i2c_init_random_cmd(struct atmel_i2c_cmd *cmd,
 			       const struct atmel_i2c_max_exec_timings *timings);
 void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid,
@@ -207,6 +197,8 @@ int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 int atmel_i2c_register_rng(struct atmel_i2c_client_priv *i2c_priv,
 			   struct device *dev);
 
+int atmel_i2c_device_sanity_check(struct i2c_client *client);
+
 ssize_t atmel_i2c_eeprom_display(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf,
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 341554b7b7a2..88726f6ef87c 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -64,6 +64,12 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 	i2c_priv->data = data;
 	i2c_priv->caps = 0;
 
+	ret = atmel_i2c_device_sanity_check(client);
+	if (ret) {
+		dev_err(&client->dev, "failed to read EEPROM, is hardware attached?\n");
+		goto done;
+	}
+
 	/* add to client list */
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
-- 
2.53.0


