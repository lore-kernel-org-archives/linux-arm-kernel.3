Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8066FCD5BBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1V+f8VZ/BVcHT7ioxjC934CpqH8W/zfFq5YGMNwGR4=; b=eKqRmNV8ppOtkjH9ZuJp/6qDdD
	4xQmealiOR9sfp/+q4W5U1iOD5yH5si/I3/bmIxPYFZ4Puekfkqr6cloY4kAMCcJV1rqxAupbwiIz
	8QR8Uy/hNxZP6h8Q2caehkPLQJ38jwCuP9qOkpWvfxp3R6DVnsQKYt69GFDgEoC03HR4ZgQPYqb6h
	2rVlWXmhmktsOnXHB5mRtBZTFOpEMKBchtQFtsSx54g+wqZzGeK9Zb/ysF6wfJh5A04Cp1Ondr9A6
	Cs3kRIUH/bb2V7xOrO4n4nihAObPx4Hbo/L0VBshAzDXV5mtMgio3yVdbarWxJkd9cVSJNW2UJ7Cn
	9FsVUyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsH-0000000CAHQ-00cR;
	Fri, 22 May 2026 23:01:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsB-0000000CAEW-3HOZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4493cf2f982so705283f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490902; x=1780095702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1V+f8VZ/BVcHT7ioxjC934CpqH8W/zfFq5YGMNwGR4=;
        b=ItHN4QHK8Cqu5FA53s6kc2pe16JycgbLhC2u4vw77x5LmquNl3lzBL638F/VXpM7vs
         4NxsdPLwO5yHcV5tYtD2svRoNVaNf8wlKQKdfFoUYfP+XQrgTQJln+VxiGNe+L8JT0/E
         WrXbTK31qRMWRhlh/eDsZkSokKTou6wPDvBQJ6vaK9OsvQied+k4DmTY213uCqX9hyQI
         uySLIpkzzwCXidYDnI23ijTpRxgPuoYABxRq1EblXt3aqBV96WFhlQYzrwLnpW5geq05
         Dn5yh0xzCwW7LKQX7gIvpS7jnXSr+cv/0PZr/Z1ps1OBwMOeGA2QS6q7qtQtNGZBlSvH
         PHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490902; x=1780095702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1V+f8VZ/BVcHT7ioxjC934CpqH8W/zfFq5YGMNwGR4=;
        b=biljj9+A/dTGiz4SWNcZrW88Vw9O6w+tKPbM2qrWaFGLQq+EAy6ZRYUjXdoGEmd8y4
         eoN1dbTmPBZ/iLZvjKWJ3CIrinzog1wGZT8iCx0pzVDneHNLzLFpAuxT9/Qj0FY+PVeS
         IzpRaRd65I/FwlpIMs7zs3VSWk5ouqA566Ado5FvAp0OFikNx8R9sVJZi5fQPUSUoLQQ
         s6BjkgkSxhxGLSMMuTnivfErTNqohgyXSfXReSLEJlOrjS7i2wDxOI9GqNDKPnoUdSgx
         jGOq71lm1IHwp05qWF23bQ8KaNOZ7GB+QB4O2swS6Z16+NyI8vuDnC5c4TDUMh/I5cm+
         75UA==
X-Forwarded-Encrypted: i=1; AFNElJ/sYSu/bi4+Ts0srpcABjNd0t7DwaBUWV0AKcsHqjf242LrfCpWrpx5n0dmQQ+g97Hl+w2gb6CNS9EdnOf2Wa6q@lists.infradead.org
X-Gm-Message-State: AOJu0YwLdLA/LxiVw7pytQSuS6mQ+6SM2h4SLPoOKsS3W/vmGXXJxXbf
	rmf5X7qsom+MPyzkrNKQ/QC1UidY9H6YrXWet1NQ0w2gDexetKciz3nX
X-Gm-Gg: Acq92OEcipmKgiiiHeZkX3ogJREkAvCB9FOR7VMktxy6m8U4O+RTdM2W7a3IeGV4RwL
	70MqDMjGbmccoxgduYuSfGiS2PtLXhXnaYt70nuR437CeLv2+1C69bzBHKRly6SRIU25tBkrKCR
	BKMjPIf1s3X7h0X9s2gmjUvjNYTIyVD9StWd9XzIolArdG55IOJ3RQQHCPvcTj9eRcmwEi28DSQ
	OtCL8as6Wk+hr3YCJU8vLIZTBkiPQ946mTOfAH4X4Jg2SWu8+wl3FBYg1p7steCWlryFUcfN5TJ
	0fzJOWu/LEwaUy11LAyByL2Qs9aKeZZAmgrt31h8e1DTKK88Dld4mpyZo93jOz95YrZUArkc0YK
	sh4UvzR16g3Nl9KxK7zpxmJNUYvzlAHE8wAE/c4SS3dlsvv/QOfnuY/iOn/Qk2CcSToDDoAtikH
	C23g0MGHChU2nhbWtPnRZ7dzueIgNTErETYBJgK3pAH9+nQ32EjQ2fpTmgwa/t/AaryL/YyM+XN
	A==
X-Received: by 2002:a05:600c:4fc7:b0:488:abe9:86 with SMTP id 5b1f17b1804b1-49042aec1demr39859485e9.7.1779490902091;
        Fri, 22 May 2026 16:01:42 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:41 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v4 02/12] crypto: atmel-ecc - fix multi-device kpp registration
Date: Fri, 22 May 2026 23:01:24 +0000
Message-Id: <20260522230134.32414-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160143_869231_3C81911B 
X-CRM114-Status: GOOD (  26.64  )
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

When multiple atmel-ecc hardware accelerator chips are attached to the
same host, registering the same static kpp_alg structure multiple times
corrupts internal fields used by the crypto core's algorithm list. This
leads to immediate list corruption or kernel panics.

Additionally, removing an individual device via sysfs while active crypto
transformations (TFMs) are running triggers a use-after-free (UAF) bug.
Because the device driver core lacks unbind error-handling paths, the
underlying memory allocated via devm for the i2c_priv structure is freed
unconditionally, leaving active transformation context pointers dangling.

Fix these problems by implementing a centralized subsystem tracking matrix:

1. Introduce a global subsystem mutex and reference counter to ensure
   that the static 'atmel_ecdh_nist_p256' structure is only registered by
   the first probing device, and unregistered exclusively when the last
   supporting device unbinds.

2. Maintain per-device allocation tracking with 'tfm_count'. On remove,
   mark the device unready to halt load-balancing assignments, and block
   via a completion barrier until all pending transformation contexts bound
   to that specific physical hardware are freed.

3. Fix a critical re-registration race where a high-velocity unbind and
   subsequent re-probe cycles occur while crypto core asynchronous users
   are still purging. Establish a global 'atmel_ecc_unreg_active' state
   fence to force concurrent probing threads to execute a 2-second timeout
   bounded wait_for_completion_timeout() rather than unsafely mutating
   static lists.

Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 107 ++++++++++++++++++++++++++++---------
 drivers/crypto/atmel-i2c.h |   1 +
 2 files changed, 82 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 94360d29f9f9..005a9a3d919c 100644
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
@@ -243,7 +248,8 @@ static void atmel_ecc_i2c_client_free(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	atomic_dec(&i2c_priv->tfm_count);
+	if (atomic_dec_and_test(&i2c_priv->tfm_count))
+		complete(&i2c_priv->remove_done);
 }
 
 static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
@@ -278,7 +284,8 @@ static void atmel_ecdh_exit_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	kfree(ctx->public_key);
-	crypto_free_kpp(ctx->fallback);
+	if (ctx->fallback)
+		crypto_free_kpp(ctx->fallback);
 	atmel_ecc_i2c_client_free(ctx->client);
 }
 
@@ -317,6 +324,7 @@ static struct kpp_alg atmel_ecdh_nist_p256 = {
 static int atmel_ecc_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
+	unsigned long timeout;
 	int ret;
 
 	ret = atmel_i2c_probe(client);
@@ -332,50 +340,97 @@ static int atmel_ecc_probe(struct i2c_client *client)
 	i2c_priv->ready = true;
 	spin_unlock(&driver_data.i2c_list_lock);
 
-	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
-	if (ret) {
-		spin_lock(&driver_data.i2c_list_lock);
-		i2c_priv->ready = false;
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
+			i2c_priv->ready = false;
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
-		return ret;
-	} else {
-		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
+	if (atmel_ecc_kpp_refcnt == 0) {
+		ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
+		if (ret) {
+			spin_lock(&driver_data.i2c_list_lock);
+			i2c_priv->ready = false;
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
+	bool trigger_unreg = false;
 
 	spin_lock(&driver_data.i2c_list_lock);
 	i2c_priv->ready = false;
 	spin_unlock(&driver_data.i2c_list_lock);
 
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
+	/*
+	 * The Linux crypto core automatically blocks until all active
+	 * transformations utilizing that specific algorithm structure
+	 * are fully freed and closed.
+	 */
+	mutex_lock(&atmel_ecc_kpp_lock);
+	atmel_ecc_kpp_refcnt--;
+
+	if (atmel_ecc_kpp_refcnt == 0) {
+		trigger_unreg = true;
+		atmel_ecc_unreg_active = true;
+		reinit_completion(&atmel_ecc_unreg_done);
 	}
+	mutex_unlock(&atmel_ecc_kpp_lock);
 
-	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
+	if (atomic_read(&i2c_priv->tfm_count))
+		wait_for_completion(&i2c_priv->remove_done);
 
 	spin_lock(&driver_data.i2c_list_lock);
 	list_del(&i2c_priv->i2c_client_list_node);
 	spin_unlock(&driver_data.i2c_list_lock);
+
+	/*
+	 * The driver registers once an algorithm, but maintains a list of
+	 * supporting i2c devices. Unregister the algorithm only, when the last
+	 * supporting device deregisters. Use completions to assure no inflight
+	 * TFMs and/or re-registering driver probe will then loose memory
+	 * by over initializing the global statics.
+	 */
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
index e3b12030f9c4..b320559e50eb 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -146,6 +146,7 @@ struct atmel_i2c_client_priv {
 	size_t wake_token_sz;
 	atomic_t tfm_count ____cacheline_aligned;
 	struct hwrng hwrng;
+	struct completion remove_done;
 	bool ready;
 };
 
-- 
2.39.5


