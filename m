Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4DACD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 22:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FW3Lz2dkj/BvPnoX47K8raPJn2eGQ3HHuGdfSzXvUi0=; b=UiDN/q7WcTi1rkm0O3QWviz06k
	pn2xAN4B/aalOPk/7jcIU6p1mEpmpEHsxLzd5amOdfchM1ku/zzvbUNiBTKbYWeiQhQyV+9oEqVRY
	1MMkZSyK8++19SbLg+b4lSQhlz3qqUOLMrtJzJFkcw6TfN1nB8mTPqT9lnu+eLonCadOFcPhZVDVI
	mm/nq8rcgYxcMHfLsD0SUiiPpMK6XmW+LYZno3uc2gtdFbsOkqHl0uVFSPtNd+jQBwXlv8W7P7d27
	aU7IX0dz9LP3LE1QNxiO25La1XDT6CSBeSHO7ZSCJ948XRARGgYDWPaerSgqALLvPcR/n3u9U085s
	OSh7SGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpt-00000000c2i-28S0;
	Tue, 12 May 2026 22:44:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpn-00000000bwP-1jcC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 22:44:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891b02a0acso6258465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 15:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625853; x=1779230653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FW3Lz2dkj/BvPnoX47K8raPJn2eGQ3HHuGdfSzXvUi0=;
        b=ivZqoKEa+YqlsyYd4Esgc2vNkpNdqk+InY4Wc1U47KxHYpkBB/JdzO9VsTuGrFlWUB
         xMJxGSu2iJZ7joZQnnAD9YqeXyRKFqKoe7W0pwxEFP4/4Nhbclba0yD8TcqEipa3EXYX
         MTbYH1BltclaCK2KMTNPATwJf3IMIu9opUwxnJj3vsWNO0cacjIlnAh2QphmDbEYxWIi
         1WpTLEtGFVVfR528admP/cVY5O1KoZOr6mitk4I3KFbPl167L0VAuJ9zmDz5rw6iiOUW
         dWDS+RTsRqCaft94jv93VFBfpupLA5lFYRwGWwlXzTf6uJQNNF1wJ2uk54iCGy3dOUw1
         NX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625853; x=1779230653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FW3Lz2dkj/BvPnoX47K8raPJn2eGQ3HHuGdfSzXvUi0=;
        b=T40UQ4j/nSqu1gosKPAlyeWbhvefLQCrQChX0jWxgjCYql+G1EEund/uB1ipH7J9vm
         MxncLpENrdqkmXCSJHIfFzDcTl95NIpCoQ04ka9Apk4nKC6u8n5GjSNDAOP9aizcvdTr
         mgcRpQUtrLFN8YnnX7OzPbG9DO31nlIsxyH+TkDsLLzFLsq+BXbwLn2YJ7z81p4yC3XY
         zLXvermoOv1NUwFRSJ0WTMHP1qINekz9TJnPbP0jYFSP6IXUwvS7gXvKXOCUMcDMAMXd
         zb0Ec+qZH/qlLF8P6t3iG98rU8/GbtVVf2LSUKLLWxnGJhqVHamel69wP/g7r9314dNe
         QLYw==
X-Forwarded-Encrypted: i=1; AFNElJ8Gs5CFVrpt0T1z/IWkm3v+uWcd+2axrP93Jt6UxmbORtJAvB1Ighnn6mr+pxS3zZPWVHkY9oEHCx4fHfk//XoB@lists.infradead.org
X-Gm-Message-State: AOJu0YzkAlmo7OntUwoh0cwqekaX9p8mGWgIQLljJDUTLRl/hiKdmW+Y
	QhiVyo/68V33Ypu0+Y+YE92HQDqJeAhryIxBdfAYZuSZSIDWwozTCGlU
X-Gm-Gg: Acq92OEw1TX0gxFKaRa3FGUOw/ME5JY2d/fzBpRh9cgJPg9x17cVrrya9nz3vASIart
	+uuZ/nPNHbMBosc8KLZiW8QXuUDJW3anbj3tAsg4e1G7IRbqHialHH91ZBsBKr+MOCFCYmWNbnZ
	pVp9DeC4w9Vi4tfMZt1DIqhRU1D/JqtSDlZP8bLq8Mpo3ZN1AolAODvikqkGZqUD8bB/hEM4UWk
	eWeEpNYCxOlg1dkXQ0mIyTVPUMSVrooVTdKiLarw/4CwCOpVWIvEbLXJCHevYw0/46hHE3rX3qj
	ScDrUewkWxd860HmrLsoOtmypDKroqWQJ0LQt+JSkN9U98OkbbbedmLR6UpmJ718xy6DGJnkbDm
	J+FKeX8MOAXLwodPu7QROdEscwZoSWDqTn3dCL84OqAmONoiLwNRsc6Qgy/vGhiSbYaGG6E1vDS
	aOlQjdXS4UI3KKurjRsTVI/rxA6yw4vG5Xz2QSKQsQ2KBZ60aFj08+EocFX+/Eh1wY4r+X6/Nlq
	Q==
X-Received: by 2002:a05:600c:3149:b0:485:f1d6:2b1d with SMTP id 5b1f17b1804b1-48fc99a8c2emr4963905e9.0.1778625853300;
        Tue, 12 May 2026 15:44:13 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm3194025e9.14.2026.05.12.15.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:44:12 -0700 (PDT)
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
Subject: [PATCH 05/12] crypto: atmel - move RNG support into common i2c core
Date: Tue, 12 May 2026 22:43:42 +0000
Message-Id: <20260512224349.64621-6-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512224349.64621-1-l.rubusch@gmail.com>
References: <20260512224349.64621-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154415_516153_164DA4D1 
X-CRM114-Status: GOOD (  25.38  )
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

Move the hardware RNG implementation from atmel-sha204a into the
shared atmel-i2c core.

The ATSHA204(A) and ATECC devices provide compatible RANDOM commands
through the common Atmel I2C interface. Consolidate the RNG handling in
the core driver and provide a shared atmel_i2c_register_rng() helper for
registering the hwrng device.

This removes duplicated RNG code from atmel-sha204a and enables RNG
support for other compatible Atmel devices, including the ECC family.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c     |  12 ++++
 drivers/crypto/atmel-i2c.c     |  93 ++++++++++++++++++++++++++
 drivers/crypto/atmel-i2c.h     |   4 +-
 drivers/crypto/atmel-sha204a.c | 115 +++++----------------------------
 4 files changed, 123 insertions(+), 101 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 7793f7b4e97e..67fa5975fa7f 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -306,6 +306,13 @@ static int atmel_ecc_probe(struct i2c_client *client)
 		      &atmel_i2c_mgmt.i2c_client_list);
 	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
+	/* register rng */
+	ret = atmel_i2c_register_rng(i2c_priv, &client->dev);
+	if (ret) {
+		dev_err(&client->dev, "failed to register hw_random\n");
+		goto err_list_del;
+	}
+
 	/* register algorithms */
 	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
 	if (ret) {
@@ -349,6 +356,11 @@ static void atmel_ecc_remove(struct i2c_client *client)
 	atmel_i2c_flush_queue();
 
 	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
+
+	if (i2c_priv->hwrng.priv) {
+		kfree((void *)i2c_priv->hwrng.priv);
+		i2c_priv->hwrng.priv = 0;
+	}
 }
 
 static const struct atmel_i2c_of_match_data atecc508a_match_data = {
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 7fa7cf9ab3c1..d451017171d8 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -208,6 +208,99 @@ int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 }
 EXPORT_SYMBOL(atmel_i2c_init_ecdh_cmd);
 
+static void atmel_i2c_rng_done(struct atmel_i2c_work_data *work_data,
+			       void *areq, int status)
+{
+	struct atmel_i2c_client_priv *i2c_priv = work_data->ctx;
+	struct hwrng *rng = areq;
+
+	if (status)
+		dev_warn_ratelimited(&i2c_priv->client->dev,
+				     "i2c transaction failed (%d)\n",
+				     status);
+
+	rng->priv = (unsigned long)work_data;
+	atomic_dec(&i2c_priv->tfm_count);
+}
+
+static int atmel_i2c_rng_read_nonblocking(struct hwrng *rng, void *buf,
+					  size_t max)
+{
+	struct atmel_i2c_client_priv *i2c_priv = container_of(rng,
+							      struct atmel_i2c_client_priv,
+							      hwrng);
+	const struct atmel_i2c_of_match_data *data = i2c_priv->data;
+	struct atmel_i2c_work_data *work_data;
+
+	/* keep maximum 1 asynchronous read in flight at any time */
+	if (!atomic_add_unless(&i2c_priv->tfm_count, 1, 1))
+		return 0;
+
+	if (rng->priv) {
+		work_data = (struct atmel_i2c_work_data *)rng->priv;
+		max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
+		memcpy(buf, &work_data->cmd.data[RSP_DATA_IDX], max);
+		rng->priv = 0;
+	} else {
+		work_data = kmalloc_obj(*work_data, GFP_ATOMIC);
+		if (!work_data) {
+			atomic_dec(&i2c_priv->tfm_count);
+			return -ENOMEM;
+		}
+		work_data->ctx = i2c_priv;
+		work_data->client = i2c_priv->client;
+
+		max = 0;
+	}
+
+	atmel_i2c_init_random_cmd(&work_data->cmd, &data->timings);
+	atmel_i2c_enqueue(work_data, atmel_i2c_rng_done, rng);
+
+	return max;
+}
+
+static int atmel_i2c_rng_read(struct hwrng *rng, void *buf, size_t max,
+			      bool wait)
+{
+	struct atmel_i2c_client_priv *i2c_priv = container_of(rng,
+							      struct atmel_i2c_client_priv,
+							      hwrng);
+	const struct atmel_i2c_of_match_data *data = i2c_priv->data;
+	struct atmel_i2c_cmd cmd;
+	int ret;
+
+	if (!wait)
+		return atmel_i2c_rng_read_nonblocking(rng, buf, max);
+
+	atmel_i2c_init_random_cmd(&cmd, &data->timings);
+
+	ret = atmel_i2c_send_receive(i2c_priv->client, &cmd);
+	if (ret)
+		return ret;
+
+	max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
+	memcpy(buf, &cmd.data[RSP_DATA_IDX], max);
+
+	return max;
+}
+
+int atmel_i2c_register_rng(struct atmel_i2c_client_priv *i2c_priv,
+			   struct device *dev)
+{
+	const struct atmel_i2c_of_match_data *data = i2c_priv->data;
+
+	memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
+
+	i2c_priv->hwrng.name = dev_name(dev);
+	i2c_priv->hwrng.read = atmel_i2c_rng_read;
+
+	if (data->needs_legacy_hwrng)
+		i2c_priv->hwrng.quality = data->needs_legacy_hwrng;
+
+	return devm_hwrng_register(dev, &i2c_priv->hwrng);
+}
+EXPORT_SYMBOL(atmel_i2c_register_rng);
+
 /*
  * After wake and after execution of a command, there will be error, status, or
  * result bytes in the device's output register that can be retrieved by the
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 5224a62c16c9..5f6c9ff0cf64 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -66,7 +66,7 @@ struct atmel_i2c_max_exec_timings {
 };
 
 struct atmel_i2c_of_match_data {
-	const unsigned short *legacy_hwrng;
+	const unsigned short needs_legacy_hwrng;
 	struct atmel_i2c_max_exec_timings timings;
 };
 
@@ -209,6 +209,8 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid,
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey,
 			    const struct atmel_i2c_max_exec_timings *timings);
+int atmel_i2c_register_rng(struct atmel_i2c_client_priv *i2c_priv,
+			   struct device *dev);
 
 struct i2c_client *atmel_i2c_client_alloc(enum atmel_i2c_capability cap);
 void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv);
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index febf9891b167..ae24d8fbabf9 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -19,88 +19,6 @@
 #include <linux/workqueue.h>
 #include "atmel-i2c.h"
 
-/*
- * According to review by Bill Cox [1], the ATSHA204 has very low entropy.
- * [1] https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html
- */
-static const unsigned short atsha204_quality = 1;
-
-static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
-				   void *areq, int status)
-{
-	struct atmel_i2c_client_priv *i2c_priv = work_data->ctx;
-	struct hwrng *rng = areq;
-
-	if (status)
-		dev_warn_ratelimited(&i2c_priv->client->dev,
-				     "i2c transaction failed (%d)\n",
-				     status);
-
-	rng->priv = (unsigned long)work_data;
-	atomic_dec(&i2c_priv->tfm_count);
-}
-
-static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *buf,
-					      size_t max)
-{
-	struct atmel_i2c_client_priv *i2c_priv = container_of(rng,
-							      struct atmel_i2c_client_priv,
-							      hwrng);
-	const struct atmel_i2c_of_match_data *data = i2c_priv->data;
-	struct atmel_i2c_work_data *work_data;
-
-	/* keep maximum 1 asynchronous read in flight at any time */
-	if (!atomic_add_unless(&i2c_priv->tfm_count, 1, 1))
-		return 0;
-
-	if (rng->priv) {
-		work_data = (struct atmel_i2c_work_data *)rng->priv;
-		max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
-		memcpy(buf, &work_data->cmd.data[RSP_DATA_IDX], max);
-		rng->priv = 0;
-	} else {
-		work_data = kmalloc_obj(*work_data, GFP_ATOMIC);
-		if (!work_data) {
-			atomic_dec(&i2c_priv->tfm_count);
-			return -ENOMEM;
-		}
-		work_data->ctx = i2c_priv;
-		work_data->client = i2c_priv->client;
-
-		max = 0;
-	}
-
-	atmel_i2c_init_random_cmd(&work_data->cmd, &data->timings);
-	atmel_i2c_enqueue(work_data, atmel_sha204a_rng_done, rng);
-
-	return max;
-}
-
-static int atmel_sha204a_rng_read(struct hwrng *rng, void *buf, size_t max,
-				  bool wait)
-{
-	struct atmel_i2c_client_priv *i2c_priv = container_of(rng,
-							      struct atmel_i2c_client_priv,
-							      hwrng);
-	const struct atmel_i2c_of_match_data *data = i2c_priv->data;
-	struct atmel_i2c_cmd cmd;
-	int ret;
-
-	if (!wait)
-		return atmel_sha204a_rng_read_nonblocking(rng, buf, max);
-
-	atmel_i2c_init_random_cmd(&cmd, &data->timings);
-
-	ret = atmel_i2c_send_receive(i2c_priv->client, &cmd);
-	if (ret)
-		return ret;
-
-	max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
-	memcpy(buf, &cmd.data[RSP_DATA_IDX], max);
-
-	return max;
-}
-
 static int atmel_sha204a_otp_read(struct i2c_client *client, u16 addr, u8 *otp)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
@@ -169,7 +87,6 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
 	const struct atmel_i2c_of_match_data *data;
-	const unsigned short *quality;
 	int ret;
 
 	ret = atmel_i2c_probe(client);
@@ -193,25 +110,16 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 		      &atmel_i2c_mgmt.i2c_client_list);
 	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
-	/* register rng */
-	memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
-
-	i2c_priv->hwrng.name = dev_name(&client->dev);
-	i2c_priv->hwrng.read = atmel_sha204a_rng_read;
-
-	quality = i2c_priv->data->legacy_hwrng;
-	if (quality)
-		i2c_priv->hwrng.quality = *quality;
-
-	ret = devm_hwrng_register(&client->dev, &i2c_priv->hwrng);
+	ret = sysfs_create_group(&client->dev.kobj, &atmel_sha204a_groups);
 	if (ret) {
-		dev_warn(&client->dev, "failed to register RNG (%d)\n", ret);
+		dev_err(&client->dev, "failed to register sysfs entry\n");
 		goto err_list_del;
 	}
 
-	ret = sysfs_create_group(&client->dev.kobj, &atmel_sha204a_groups);
+	/* register rng */
+	ret = atmel_i2c_register_rng(i2c_priv, &client->dev);
 	if (ret) {
-		dev_err(&client->dev, "failed to register sysfs entry\n");
+		dev_err(&client->dev, "failed to register hw_random\n");
 		goto err_list_del;
 	}
 
@@ -234,9 +142,12 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
 	atmel_i2c_flush_queue();
 
-	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
+	if (i2c_priv->hwrng.priv) {
+		kfree((void *)i2c_priv->hwrng.priv);
+		i2c_priv->hwrng.priv = 0;
+	}
 
-	kfree((void *)i2c_priv->hwrng.priv);
+	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
 }
 
 static const struct atmel_i2c_of_match_data atsha204_match_data = {
@@ -246,7 +157,11 @@ static const struct atmel_i2c_of_match_data atsha204_match_data = {
 		.max_exec_time_read = 4,
 		.max_exec_time_write = 42,
 	},
-	.legacy_hwrng = &atsha204_quality,
+	/*
+	 * According to review by Bill Cox [1], the ATSHA204 has very low entropy.
+	 * [1] https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html
+	 */
+	.needs_legacy_hwrng = 1,
 };
 
 static const struct atmel_i2c_of_match_data atsha204a_match_data = {
-- 
2.53.0


