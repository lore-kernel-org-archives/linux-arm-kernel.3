Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEC7CD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dOOnGKhqXgyE5tvsSDo31ys2lneC3zZUQbZqWGyQ4jY=; b=zcd1KI0Y9WehDeV5dgDxtnilJ7
	tlhaOwU+1lQIQJrtnuu0qAMnJ1V8yMFK8Ht+VoeuYjpstfShS1zGSe4cDz4W/rTcY9Xh9PscHmMTS
	/H+xowZDKv/Ul7lAKesQtZwX75fV20tnsGPplVJvoxZ+ciJalhGMOMz2YDD2egNusr7+Dsok0uI/A
	Zw9lRf5yDneaaFobxI+yoApbEXRUPhhdNKR+gP0XOG7pO4GX+1MXyoJrzKq1+edyDNpN+LnwR1Qx6
	1BKkMVfJ5v1rE+NxkyPBjGNFJ/tWxx36PWlmAhWFBN79Jk/aQZxMZSNtCacNE6pTSKjmGQSHcxLdN
	HXHnsLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVxMm-00000001nxu-24qj;
	Sat, 06 Jun 2026 20:11:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVxMj-00000001nxW-3l31
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 20:11:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490a78fbd7bso3044385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 13:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780776691; x=1781381491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dOOnGKhqXgyE5tvsSDo31ys2lneC3zZUQbZqWGyQ4jY=;
        b=QrsQgR5FAnbRENwIO2bENbJZ/JKlaiVRRldnP95W3IW3Y+q4ts9uaZp8MG5qgT21Bf
         Ji0LRIEnUxTuirj0Qfw01+N9Imx8o/BYAQo6+tPxonk70aluKTAgwBzb0t/fSTOv3qXt
         M59+RP+PJIm3/e0knyF+vRMZwj+BFO6s4J15+d0GvT71HcRRr7T6EDHf8WMvuF+/43YI
         y4DxfJ8m6jLC4I+CJFuLyHRJajn451SJCiPcAEKmOLp7/k6xCY0jdRxbvy+nRtKQyhbq
         58/ci+0sf9iUub/ycj4DHe7pfGWmgy+ne30dwHirUKDndF5dmR29fIuP4UoOVCf6iAoY
         8SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780776691; x=1781381491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOOnGKhqXgyE5tvsSDo31ys2lneC3zZUQbZqWGyQ4jY=;
        b=nVdZ9lK4e6aHgb0XSoDfBJj1jGf+30Pupu5Toh7YI0waksFCpIMBJ/EKu6nzLhWKfd
         qbwMZoCnKcGlVq9aVv5biBLqFq0eZFOrBNNRDYKJymT07uJH6cfOcXmU+DvUW8L7Z+EQ
         1fj/xgEg8EEUr/cbcY9HAra7DE0QTumSWLTM9r7zbBsBUNHyFjAAWTFpkyN2oIhgT4xc
         DPwmqFiH7dGXwIOz4zcr3J590w5LV6eAJNrkxDI1o6G7pmbya/iUX8YqWZYvdLRLJqfO
         gbveUVCKsYWDLhR4HcHob3pZjeFtWhT6CK0r0+tMV+xIMSgI9Qdo6qVxp00ZcvIjO7WD
         H1ZA==
X-Forwarded-Encrypted: i=1; AFNElJ/sOUmm9sc31PFx6czcIXHOUxb+o78ulEmhRdMeRJzdSe4U1fe/ZLy1yIscPQ/BgSIHV7EK0KfrQqJVIDapJiV9@lists.infradead.org
X-Gm-Message-State: AOJu0YyXDRx0LTzHwJohZ11u82SOqxzsVmUFdbga9ielBSTw7yvnXNWh
	6t5INm1QQqyqKj6esM7lMt+6NlTJ4xUzCJwLEUaiiUd4Wqj/xMuFvB9a
X-Gm-Gg: Acq92OGEVrGECE5p/KFSJTNh/HRIezssn2ud4wILt+6I82FMjIrrI7OL8StllaOU20M
	BsVR56HHR7uHP3ddfB32zFtV0L3WBBLF8nZbi3peYYxqlyWWW88rIgzngSl2+y1B8qiNXwSjmmP
	VZfo4VZzngqTIT/kqG7hXaHe/BaO/VBCTCCkJcGQKbbXqqUdcA1JH/eG3ZQ4bqUDpKfPkvyayKI
	mBNAIrk+8APiS8aL8lVAmF1KS/hf+0yvjDnyHzovUPiA5mBzQuOQ5+KM/lasmq3wJ9s7OZIrP0q
	noRp0g6dYHAKqMhqy/RAGlm8z7DuhM17HQ6TLv/OoKmNxj4tXl/GceUxOyl5Aj1oVMw6faQQwby
	eBFJgWhE+p5v1My/A9Dvxb5TInQtKX44M+By2ShzTNeV70zpib1Gjpqcc1u6kgO8GN7yRBrrHmw
	kov/M+wXW/6n+W2RbJVzO25SL0rSwuX1TvRtKgwbcNXsERcYATFfmnc3qH5uzq0SxqSJV/rQS0P
	Q==
X-Received: by 2002:a05:600c:a011:b0:488:7e7b:dbc2 with SMTP id 5b1f17b1804b1-490c25dcc9bmr64016335e9.3.1780776691198;
        Sat, 06 Jun 2026 13:11:31 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd663sm289512465e9.10.2026.06.06.13.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 13:11:30 -0700 (PDT)
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
Subject: [PATCH v2 1/1] crypto: atmel-ecc - fix multi-device use-after-free and registration races
Date: Sat,  6 Jun 2026 20:11:20 +0000
Message-Id: <20260606201120.35536-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_131133_980907_E4F1AA38 
X-CRM114-Status: GOOD (  33.19  )
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

2. The removal problem, also related to the re-initialization in particular
scenarios where this might happen to quick, might result in overwriting not
fully freed memory resources. The remove might still take time, a
re-probing then overwrite the (still existing) static resource without
having it before cleaned up before. Here were additional issues with the
order of when to remove the i2c client from the i2c_client_list but already
having removed the resources.

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
v1 -> v2:
- remove the initial approach with "ready" state bool, replace it by
  this be a more comprehensive approach

 drivers/crypto/atmel-ecc.c | 96 +++++++++++++++++++++++++++-----------
 drivers/crypto/atmel-i2c.h |  1 +
 2 files changed, 70 insertions(+), 27 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 0ca02995a1de..0f1567bf23b7 100644
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
@@ -241,7 +246,8 @@ static void atmel_ecc_i2c_client_free(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	atomic_dec(&i2c_priv->tfm_count);
+	if (atomic_dec_and_test(&i2c_priv->tfm_count))
+		complete(&i2c_priv->remove_done);
 }
 
 static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
@@ -276,7 +282,8 @@ static void atmel_ecdh_exit_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	kfree(ctx->public_key);
-	crypto_free_kpp(ctx->fallback);
+	if (ctx->fallback)
+		crypto_free_kpp(ctx->fallback);
 	atmel_ecc_i2c_client_free(ctx->client);
 }
 
@@ -315,6 +322,7 @@ static struct kpp_alg atmel_ecdh_nist_p256 = {
 static int atmel_ecc_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
+	unsigned long timeout;
 	int ret;
 
 	ret = atmel_i2c_probe(client);
@@ -328,44 +336,78 @@ static int atmel_ecc_probe(struct i2c_client *client)
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
+
+		if (timeout == 0) {
+			spin_lock(&driver_data.i2c_list_lock);
+			list_del(&i2c_priv->i2c_client_list_node);
+			spin_unlock(&driver_data.i2c_list_lock);
+			mutex_unlock(&atmel_ecc_kpp_lock);
+
+			dev_err(&client->dev, "probe timed out, former driver instance not fully deregistered\n");
+			return -ETIMEDOUT;
+		}
+	}
 
-		dev_err(&client->dev, "%s alg registration failed\n",
-			atmel_ecdh_nist_p256.base.cra_driver_name);
-	} else {
-		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
+	if (atmel_ecc_kpp_refcnt == 0) {
+		ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
+		if (ret) {
+			spin_lock(&driver_data.i2c_list_lock);
+			list_del(&i2c_priv->i2c_client_list_node);
+			spin_unlock(&driver_data.i2c_list_lock);
+			mutex_unlock(&atmel_ecc_kpp_lock);
+
+			dev_err(&client->dev, "%s alg registration failed\n",
+				atmel_ecdh_nist_p256.base.cra_driver_name);
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
 
 	spin_lock(&driver_data.i2c_list_lock);
 	list_del(&i2c_priv->i2c_client_list_node);
 	spin_unlock(&driver_data.i2c_list_lock);
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
+	if (atomic_read(&i2c_priv->tfm_count))
+		wait_for_completion(&i2c_priv->remove_done);
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
index 72f04c15682f..d957c2ff60d8 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -145,6 +145,7 @@ struct atmel_i2c_client_priv {
 	size_t wake_token_sz;
 	atomic_t tfm_count ____cacheline_aligned;
 	struct hwrng hwrng;
+	struct completion remove_done;
 };
 
 /**

base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
-- 
2.53.0


