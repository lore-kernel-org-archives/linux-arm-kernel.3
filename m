Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB2BCD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 20:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RpOFBj23taOxwcprfVeftqLa7EfFOLIHW3Oby+mxG4c=; b=0OG3Qo+HP3kJvUMdbLLl/nqtgY
	J/yBnOFap9998ZT+QzhzW4plCRd8ImE8N3KyPahmTxwcoQ68d3aeeEXjWmWBZzXO3TT7OJMoUo91Z
	yxsTlRRLzGjPvfQwlgs50zw3UHXkqTF/TywuRjoltNX9+THPrMdhscnw/Gz8N0CQ81P46HFMYKuvN
	md6MvyI+MZ+GaNEk9H/0Y1aMVkPmAXDScpwYkRkmEf8mMiuyg3KnDZHG1tQS6AAyhM5T1f0xDizZ7
	Rb6sp9US5eMkU5MpBLjbucaL5MVGbDh5dKB3hMkhK70HvUDnwLsue63ouoiQskZ/FlQ0UeoCwBFUC
	Nabl+oqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWJhC-00000002SjE-1pdo;
	Sun, 07 Jun 2026 20:02:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWJh9-00000002Sip-3sak
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 20:02:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490c28f84fdso5031015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780862526; x=1781467326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpOFBj23taOxwcprfVeftqLa7EfFOLIHW3Oby+mxG4c=;
        b=SwZupWEH+E2+o+/snoQtgEZTJ79aMsqo5dG97Fuy2cQS0g/9TioSdU/KZR5u6xSXNg
         kpoCMwy0JeA20TrsyMCpx20/9g2nVRcD6Nc7ACherxC5b9SeV3io+VaRLCpeUsiX7iMU
         cIeqrZ9pyyj9i7jxzLpNhJJzpAtPGtfaJMU7GEqW8QqQYse3AcOjAK038chNcQCO5toF
         IpY9qEk6V89uFLVe8IWyZY1VPrOAL/izSIiu//g2ByyMozNlbrEbceoGzWKPzI7M/Zhh
         3vyRZxeuwduKNDbzqQ1MsjV5A99G9zo9rIigbLvCUGpuTtLuhcL096NYmtXY1ozT+8GX
         nmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862526; x=1781467326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpOFBj23taOxwcprfVeftqLa7EfFOLIHW3Oby+mxG4c=;
        b=k3krkUOEZ6P9GRSG0GNmIrO9sbWSZm3KqVoqKn39oXx4aBVZYknTD2Z8aW7KJJocjD
         V4h2Y33bSwtqXvoppIRT2gtI8CYQR8+FsDnHlmXsp5GDrPo1haYy7wrrjlfUh+vpAJJz
         +PMFdeux9Bnz829ZbjnDyqX8u1zUzy/NzTG+9qvJGnrxLrgt9yab5mVcX1gwK2NHrzhI
         RFePeluWg9ZMImAHJGAeA7QmhLr0h1xfXGj+vfIpl/BUeE5a5gJUo+1T1rznmeCN2OC9
         qsjiE6J4RCRigqg4qRzR9Bj+ZYBAQz0us/34gIwntkj2DFR8asfAfeKHgWoPtFwml3JV
         7ceQ==
X-Forwarded-Encrypted: i=1; AFNElJ8u4+aG/eu6KX2qb0ylcN8eAK5ltw7fnofO+mDMspG+uT5Q4VoDz2ybR/FcO6f/6uDPEMOSn6Z/s+NtKCgIBEH9@lists.infradead.org
X-Gm-Message-State: AOJu0YwXQiEL3Z4+ejU2+wPIcH1gP2QdpUBZ9Jy+5sM7Kr1Zy/spR61r
	/hTbwMfqWOLcGzEtLUEFdoXrpAECcN2O5IeTwpJ5XNcqxUmnCxPiixhr
X-Gm-Gg: Acq92OGoN6lvacuBhUY3fAmfkBaU/ezQe9/qnWCGefXCmEYcaJmd6t35jaIoaIh4tTA
	Gylb761oDt6hAFL4rYSFdGXmG7qvRJniZT2SsdYBgOVXMHkYjP4shNFgVPI/n4Xt5EEDN6OwiMc
	sRblJf8Ci4Wiqlf8neaLd07SOnfx0pJM6wkaWh3n+8Huq36RZdSJ0aZeUbYwlQ01TQH/lipfE8e
	0ww0KHjDh7gXvYzXticwnt994iPl3VBmIspbwhemonagj6lA4xw8d/XeQAhBU/VrSZ5pQ/E/YT7
	J5YOVWap9O2jAohizqNdvP8KhV234f8Xo81T46lB/7yAXXmvlr+tg4pz5JfUVyEg67Eaw7N0st7
	FNkBwoAgy71+bRvP4nOanFa8aI9eUJvwnwN5YnUZXSKFLx1jDxZHgjdGm+mNrL3Pttuut8XGzJI
	IkAK27clJAGZTEkr3k/HNYLAUrQDIEn+NDbcAdJEHoP0jR6O6xRkqTvnenT4bKlkuYBEe8d8qcU
	Q==
X-Received: by 2002:a05:600c:190b:b0:485:c456:5e4f with SMTP id 5b1f17b1804b1-490c24f5f07mr94700135e9.0.1780862525816;
        Sun, 07 Jun 2026 13:02:05 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b59f0sm388946455e9.2.2026.06.07.13.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:02:05 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v4 1/1] crypto: atmel-ecc - fix multi-device use-after-free and registration races
Date: Sun,  7 Jun 2026 20:02:02 +0000
Message-Id: <20260607200202.39550-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_130208_025272_AF612019 
X-CRM114-Status: GOOD (  36.38  )
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

During parallel driver initialization or driver teardown sequences
in setups with multiple atmel-ecc instances, a race condition exists
between atmel_ecc_i2c_client_alloc() and the probe/remove paths.

A concurrent transformation request can fetch an i2c_client instance
from the global i2c_client_list before the kpp is fully registered, or
while it is actively being unbound, resulting in a use-after-free (UAF)
risk.

1. The initialization problem in probe(): Adding first an i2c client to the
i2c_client_list, and then registering the kpp algorim may result in a race,
when this happens for a second (or further) probed device. In this case the
algorithm is already registered, so a TFM may arrive, while the latest
probing device is added to the list, but not kpp registered. In case this
fails and this last device is going to be removed again from the list, this
leaves a window where the TFM might obtain a pointer to the - now deleted -
i2c client, which opens a UAF risk. Furthermore, there will happen atempts
to multiple registering the same driver to the same type of algorithm.
Note, a simple reverting of the order: first register kpp, second add the
i2c client to the i2c_client_list - is not possible here, since the kpp
registration immediately triggers the self tests, which then will allocate
and require an i2c client.

2. The critical race condition problem: It exists when an Atmel device
instance is rapidly removed and immediately re-probed, before the global
resources are fully cleaned up. In this scenario, the asynchronous
unregistration sequence in the remove() lags behind the incoming probe()
function. Because of the global algorithm structure being not yet
completely cleaned up, the newly re-probed device incorrectly intercepts
the static, partially-dismantled global context. It then overwrites active
pointers and re-acquires the global instance prematurely. In this way, when
the deregistration sequence finally completes its execution, under the
newly initialized device, it may lose the tracking references, leaking the
older driver memory blocks, and introducing an immediate UAF risk.

3. The removal race problem, when a call to remove() starts removing the
device, but another thread executing a TFM, a severe Time-of-Check to
Time-of-Use (TOCTOU) race condition exists in the teardown path between the
asynchronous remove() sequence and completing TFMs. When the device is
unbound, the remove() function evaluates the active tfm_count and decides
whether to wait or proceed with resource deallocation. However, if the
final active TFM finishes its crypto operation and invokes the client free
function immediately after remove() performs its reference check but before
it can sleep, the completion signal is fired into a clearing state. The
unbind thread then misinterprets the zeroed counter, skips the
synchronization barrier entirely, and instantly deallocates the per-device
private structures. This leaves the final TFM worker thread executing code
inside a completely freed memory area, triggering an immediate UAF kernel
panic. Note, simply calling the kpp unregister here won't clean up the
situation in the context of having a setup with external hardware on a slow
bus.

Address this by implementing an independent subsystem reference counter
kpp refcnt protected by a dedicated mutex to ensure the static global kpp
algorithm structure is registered exactly once by the first probing device
instance. In multi-device scenarios, or when extending the resource
management support of the i2c_client_list to all atmel-i2c based device
drivers, such scenarios can become realistic. The particular algorithm is
registered only once. Each i2c client (i.e. each probing device driver) is
added as client to the i2c_client_list. This guarantee that only the first
probe will register the algorithm. The list is populated for further calls
to probe, and subsequent calls to the client alloc function.

Concurrently, decouple list mutations from registration by moving the
global list eviction to the absolute top of the remove lifecycle. This
keeps the quick execution of the list allocation loop intact, ensures that
unbinding hardware is instantly blind to the rest of the system, and
completely bypasses the recursive deadlock condition previously triggered
by synchronous crypto API self-tests.

Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 130 +++++++++++++++++++++++++++++--------
 drivers/crypto/atmel-i2c.h |   3 +
 2 files changed, 106 insertions(+), 27 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 0ca02995a1de..7336c3661e52 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -23,6 +23,11 @@
 #include <crypto/kpp.h>
 #include "atmel-i2c.h"
 
+static DEFINE_MUTEX(atmel_ecc_kpp_lock);
+static int atmel_ecc_kpp_refcnt;
+DECLARE_COMPLETION(atmel_ecc_unreg_done);
+static bool atmel_ecc_unreg_active;
+
 static struct atmel_ecc_driver_data driver_data;
 
 /**
@@ -241,7 +246,10 @@ static void atmel_ecc_i2c_client_free(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	atomic_dec(&i2c_priv->tfm_count);
+	spin_lock(&driver_data.i2c_list_lock);
+	if (atomic_dec_and_test(&i2c_priv->tfm_count) && i2c_priv->unbinding)
+		complete(&i2c_priv->remove_done);
+	spin_unlock(&driver_data.i2c_list_lock);
 }
 
 static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
@@ -276,7 +284,8 @@ static void atmel_ecdh_exit_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	kfree(ctx->public_key);
-	crypto_free_kpp(ctx->fallback);
+	if (ctx->fallback)
+		crypto_free_kpp(ctx->fallback);
 	atmel_ecc_i2c_client_free(ctx->client);
 }
 
@@ -295,6 +304,28 @@ static unsigned int atmel_ecdh_max_size(struct crypto_kpp *tfm)
 	return ATMEL_ECC_PUBKEY_SIZE;
 }
 
+static int atmel_ecc_wait_for_tfms(struct atmel_i2c_client_priv *i2c_priv)
+{
+	unsigned long timeout;
+
+	spin_lock(&driver_data.i2c_list_lock);
+	list_del(&i2c_priv->i2c_client_list_node);
+	i2c_priv->unbinding = true;
+	reinit_completion(&i2c_priv->remove_done);
+	if (!atomic_read(&i2c_priv->tfm_count)) {
+		spin_unlock(&driver_data.i2c_list_lock);
+		return 0;
+	}
+	spin_unlock(&driver_data.i2c_list_lock);
+
+	timeout = wait_for_completion_timeout(&i2c_priv->remove_done,
+					      msecs_to_jiffies(2000));
+	if (!timeout)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
 static struct kpp_alg atmel_ecdh_nist_p256 = {
 	.set_secret = atmel_ecdh_set_secret,
 	.generate_public_key = atmel_ecdh_generate_public_key,
@@ -315,6 +346,7 @@ static struct kpp_alg atmel_ecdh_nist_p256 = {
 static int atmel_ecc_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
+	unsigned long timeout;
 	int ret;
 
 	ret = atmel_i2c_probe(client);
@@ -323,49 +355,93 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
 	i2c_priv = i2c_get_clientdata(client);
 
+	init_completion(&i2c_priv->remove_done);
+	i2c_priv->unbinding = false;
+
 	spin_lock(&driver_data.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
 		      &driver_data.i2c_client_list);
 	spin_unlock(&driver_data.i2c_list_lock);
 
-	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
-	if (ret) {
-		spin_lock(&driver_data.i2c_list_lock);
-		list_del(&i2c_priv->i2c_client_list_node);
-		spin_unlock(&driver_data.i2c_list_lock);
+	mutex_lock(&atmel_ecc_kpp_lock);
+	/*
+	 * For cases where the same/last such device is still in unregistering,
+	 * and now re-registering (refcnt is 0, but completion still exists).
+	 * Safely capture the pointer, drop the lock and sleep until it
+	 * terminates upon completion or retry limit reached.
+	 */
+	while (atmel_ecc_unreg_active) {
+		mutex_unlock(&atmel_ecc_kpp_lock);
+		timeout = wait_for_completion_timeout(&atmel_ecc_unreg_done,
+						      msecs_to_jiffies(2000));
+		mutex_lock(&atmel_ecc_kpp_lock);
+		if (timeout == 0) {
+			mutex_unlock(&atmel_ecc_kpp_lock);
+
+			ret = atmel_ecc_wait_for_tfms(i2c_priv);
+			if (ret)
+				dev_err(&client->dev,
+					"probe timed out, former instance active\n");
+			return -ETIMEDOUT;
+		}
+	}
+	if (atmel_ecc_kpp_refcnt == 0) {
+		ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
+		if (ret) {
+			mutex_unlock(&atmel_ecc_kpp_lock);
 
-		dev_err(&client->dev, "%s alg registration failed\n",
-			atmel_ecdh_nist_p256.base.cra_driver_name);
-	} else {
-		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
+			atmel_ecc_wait_for_tfms(i2c_priv);
+			dev_err(&client->dev,
+				"%s alg registration failed\n",
+				atmel_ecdh_nist_p256.base.cra_driver_name);
+
+			return ret;
+		}
 	}
+	atmel_ecc_kpp_refcnt++;
+	mutex_unlock(&atmel_ecc_kpp_lock);
 
+	dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
 	return ret;
 }
 
 static void atmel_ecc_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
-
-	/* Return EBUSY if i2c client already allocated. */
-	if (atomic_read(&i2c_priv->tfm_count)) {
-		/*
-		 * After we return here, the memory backing the device is freed.
-		 * That happens no matter what the return value of this function
-		 * is because in the Linux device model there is no error
-		 * handling for unbinding a driver.
-		 * If there is still some action pending, it probably involves
-		 * accessing the freed memory.
-		 */
-		dev_emerg(&client->dev, "Device is busy, expect memory corruption.\n");
-		return;
-	}
-
-	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
+	bool trigger_unreg = false;
+	bool wait_needed = false;
+	unsigned long timeout;
 
 	spin_lock(&driver_data.i2c_list_lock);
 	list_del(&i2c_priv->i2c_client_list_node);
+	i2c_priv->unbinding = true;
+	reinit_completion(&i2c_priv->remove_done);
+	if (atomic_read(&i2c_priv->tfm_count) > 0)
+		wait_needed = true;
 	spin_unlock(&driver_data.i2c_list_lock);
+	if (wait_needed) {
+		timeout = wait_for_completion_timeout(&i2c_priv->remove_done,
+						      msecs_to_jiffies(5000));
+		if (timeout == 0)
+			dev_emerg(&client->dev, "Teardown timed out! Active TFMs leaked, memory corruption imminent.\n");
+	}
+
+	mutex_lock(&atmel_ecc_kpp_lock);
+	atmel_ecc_kpp_refcnt--;
+	if (atmel_ecc_kpp_refcnt == 0) {
+		trigger_unreg = true;
+		atmel_ecc_unreg_active = true;
+		reinit_completion(&atmel_ecc_unreg_done);
+	}
+	mutex_unlock(&atmel_ecc_kpp_lock);
+
+	if (trigger_unreg) {
+		crypto_unregister_kpp(&atmel_ecdh_nist_p256);
+		mutex_lock(&atmel_ecc_kpp_lock);
+		atmel_ecc_unreg_active = false;
+		complete_all(&atmel_ecc_unreg_done);
+		mutex_unlock(&atmel_ecc_kpp_lock);
+	}
 }
 
 static const struct of_device_id atmel_ecc_dt_ids[] = {
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 72f04c15682f..8e6617422191 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -129,6 +129,7 @@ struct atmel_ecc_driver_data {
  * @wake_token_sz       : size in bytes of the wake_token
  * @tfm_count           : number of active crypto transformations on i2c client
  * @hwrng               : hold the hardware generated rng
+ * @unbinding           : unbinding handshake
  *
  * Reads and writes from/to the i2c client are sequential. The first byte
  * transmitted to the device is treated as the byte size. Any attempt to send
@@ -145,6 +146,8 @@ struct atmel_i2c_client_priv {
 	size_t wake_token_sz;
 	atomic_t tfm_count ____cacheline_aligned;
 	struct hwrng hwrng;
+	struct completion remove_done;
+	bool unbinding;
 };
 
 /**

base-commit: 79bbe453e5bfa6e1c6aa2e8329bfc8f152b81c9b
-- 
2.53.0


