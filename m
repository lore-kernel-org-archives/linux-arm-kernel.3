Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB44C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 20:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=my9baOCRIbPqjbDoPiN9p6z8vQOZ+uD4vuxAZjcqRYg=; b=SNbwzL7FlCbhtmH6LYush/U2eq
	RCGfaKjIaIJiirrKlGYjZXoIUyu1ImSenXfF+f3ecqeB45xwWI+a2QmzK8/03aDTQQFpJTt0W73h/
	dpodhprBh6YssM//AMmDmgZaswUsxkk0jY1sKVzXxNskdKXIctrYUBXgrXKjkoUkFm0Qiil1uqK+I
	xHt/rUDX5LihzaDvs9ryI7RJNxAxhElbrHtVZHu2B9R9aWv79tfmp9j72Ls5YKWc8oYzZ+Ug5CUc/
	IQPh5U5mBmoPVy/RADbDQ4+KvqBOKm1TNK3znTveMCvTSa1+gxidt4wPPUlXmCkY5IMgh3rlMdcX0
	Oocy5RSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0NU-00000007iVX-0SwG;
	Sun, 12 Jul 2026 20:02:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0NR-00000007iV8-1qJe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 20:02:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490d6730461so2638385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 13:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783886531; x=1784491331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=my9baOCRIbPqjbDoPiN9p6z8vQOZ+uD4vuxAZjcqRYg=;
        b=WLVUGwBrIF/5a419JaQOM6HtqbU2oIRrCBxmR0SuAFTFHO/S7m435+MwZ95ew2gazc
         ZyjqKNPQ+Ac9hOsdy25jN3ax7U+dl3BxiJbxzaiM633+jC7ZHZ/QE5X6Kz5M1ImlIXm9
         eNJTAPJeOSqmI2V+aFwmYSkr1sG/z5Xj1Efe/fFyUmXihgIdwMoxiHAwi5XiyKvBokFv
         vhtDMC79DDpoSP44jAsMloBwE0N+K4Qoo6TsP0hjZtnN+PDGAekjwWLLDODphGE+IlTK
         tjjzOQ0VI5g/5Pf97xigjsueUet2kRY+ubQ0fZwskFLnxl8dicNZIvKSXAq3aiKJpDKz
         vQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783886531; x=1784491331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=my9baOCRIbPqjbDoPiN9p6z8vQOZ+uD4vuxAZjcqRYg=;
        b=GILcgFJLNGBbe+cbaHgcHby3as/gxIvDSggpG2kQ/Nbg5eZ6ElwWkpmlWrphwT9ddT
         NFyzTYgiE/+dhVEmnWULu55MpHwRBIHwpu7RCRCi76z6Fi1luaPkOenaNv1zg98c+XeB
         aSmCacEZ7MZRd+5ahLNr0zxEAonBIjvJGqHNyPI2iBr+sIpgfRuQjV7wmx9WId1LVudl
         csqIsov/LtlXDaljriGiJl9+PerF2y0G+Z/yO95Qc5MsrOmChIgsza6CP8nHS6XY4hXz
         657Hi32j22E5sZQ2zP9/hRSlJ2TRfsnNhFBLEV1EoxGAQ06fbWCSGMOmurhIYlGs6xBH
         gXMw==
X-Forwarded-Encrypted: i=1; AHgh+RoLuJcHDkTlcxaxE0lIhHg7irl10JQ6mModRpTr7TExmMVl49Ya9vdbgZ9bkYwJoMrzzGIbaT0KfL0yQ5a6f4/H@lists.infradead.org
X-Gm-Message-State: AOJu0YzRAbHWR8xIBP+AG08Oq9C9iK+HeashSqpzH/UOTXbuiBYk92DX
	4i8O9hbS/3YJMUlLgu1md5QaDof6rheCTv8f7JOminS56MdEwMFF3Uix
X-Gm-Gg: AfdE7ckFu8qgAIsoJLaKqx22Zpis66BAKbyV/n+/i0mCrq8LoKxYgcm8QRyRC74FPZJ
	HjxBZd1VFM9Z9b1OYkSBKY3FKsYKQH+xKfDBOWRIXyA+xNeKrxYTu5hoj4Ipq+6GnA4nq24MtF1
	OQ3Sk2H6/N6+z/HZsa7yzKN27OP+9vQ7fASW6s1v+uQ6rGJtt6pq43CD7zB42imUAe5bOphq/eF
	3zX2yK9E+uRDXRIoNQKEdawpMXquTxbS0BC6Lfw8exnq53Mb6huTcfF0QZfZjvytvV4A+7lvzPP
	A9ORV4kO5LdSzjrmEnHsLtN4WFE0mmwhx1HXC8nNcL1rS9x3vEXmDaaa5h3JRTqhUItm/O6UWBs
	MFlWfh8mGKyoukEWzwAS/AWPXaKlNhYv9PYzWeQdT1gBaUBZo/0ic9lE4XSQqo7w8ClWKnElfAN
	JLD1vz46bi0yB0QUBA8LyfUWVxKHPLMTebylFVE4nnBOwx5juv4DZf+gAq8+Qxj+4=
X-Received: by 2002:a05:600c:3f12:b0:493:e536:7bcf with SMTP id 5b1f17b1804b1-493f8865dfdmr40375275e9.7.1783886530426;
        Sun, 12 Jul 2026 13:02:10 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm277347275e9.9.2026.07.12.13.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 13:02:09 -0700 (PDT)
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
Subject: [RFC RESEND PATCH v6 1/1] crypto: atmel-ecc - fix multi-device use-after-free and registration races
Date: Sun, 12 Jul 2026 20:02:03 +0000
Message-Id: <20260712200203.47764-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_130213_544898_CAD988D7 
X-CRM114-Status: GOOD (  36.87  )
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
Assisted-by: Gemini:1.5-Pro [google]
---
 drivers/crypto/atmel-ecc.c | 136 +++++++++++++++++++++++++++++--------
 drivers/crypto/atmel-i2c.h |   3 +
 2 files changed, 109 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 8e13aeccf011..a9146f892823 100644
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
@@ -232,7 +237,10 @@ static void atmel_ecc_i2c_client_free(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	atomic_dec(&i2c_priv->tfm_count);
+	spin_lock(&driver_data.i2c_list_lock);
+	if (atomic_dec_and_test(&i2c_priv->tfm_count) && i2c_priv->unbinding)
+		complete(&i2c_priv->remove_done);
+	spin_unlock(&driver_data.i2c_list_lock);
 }
 
 static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
@@ -266,7 +274,8 @@ static void atmel_ecdh_exit_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	kfree(ctx->public_key);
-	crypto_free_kpp(ctx->fallback);
+	if (ctx->fallback)
+		crypto_free_kpp(ctx->fallback);
 	atmel_ecc_i2c_client_free(ctx->client);
 }
 
@@ -277,6 +286,26 @@ static unsigned int atmel_ecdh_max_size(struct crypto_kpp *tfm)
 	return crypto_kpp_maxsize(ctx->fallback);
 }
 
+static int atmel_ecc_wait_for_tfms(struct atmel_i2c_client_priv *i2c_priv,
+				   unsigned long timeout)
+{
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
+	if (!wait_for_completion_timeout(&i2c_priv->remove_done,
+					 msecs_to_jiffies(timeout)))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
 static struct kpp_alg atmel_ecdh_nist_p256 = {
 	.set_secret = atmel_ecdh_set_secret,
 	.generate_public_key = atmel_ecdh_generate_public_key,
@@ -297,6 +326,7 @@ static struct kpp_alg atmel_ecdh_nist_p256 = {
 static int atmel_ecc_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
+	unsigned long timeout;
 	int ret;
 
 	ret = atmel_i2c_probe(client);
@@ -305,49 +335,95 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
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
+			/*
+			 * FIXME / RFC: If we time out here, returning -ETIMEDOUT
+			 * triggers devres cleanup, causing a UAF for any lagging TFMs.
+			 * Should this be changed to an unbounded wait_for_completion()
+			 * to prioritize memory safety over thread liveness?
+			 */
+			if (atmel_ecc_wait_for_tfms(i2c_priv, 2000))
+				dev_emerg(&client->dev,
+					  "Probe abort timed out! Active TFMs leaked, memory corruption imminent.\n");
+			else
+				dev_err(&client->dev,
+					"Probe timed out waiting for former instance unregistration\n");
+
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
+			atmel_ecc_wait_for_tfms(i2c_priv, 2000);
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
+	bool trigger_unreg = false;
+
+	/*
+	 * FIXME / RFC: The timeout prevents a permanent hang,
+	 * but since remove() returns void, devres will instantly
+	 * free i2c_priv anyway. Memory corruption is imminent
+	 * when the active TFM eventually closes.
+	 */
+	if (atmel_ecc_wait_for_tfms(i2c_priv, 5000))
+		dev_emerg(&client->dev,
+			  "Teardown timed out! Active TFMs leak, memory corruption imminent.\n");
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
 	}
-
-	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
-
-	spin_lock(&driver_data.i2c_list_lock);
-	list_del(&i2c_priv->i2c_client_list_node);
-	spin_unlock(&driver_data.i2c_list_lock);
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

base-commit: e264401ce4776a288524e5b87593d4d864147115
-- 
2.53.0


