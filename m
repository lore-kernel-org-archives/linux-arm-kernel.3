Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F3CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M6rUVQEFS5/jNeoXoPCKPjNpkLAJHhSt0axTVWIBaNE=; b=dGyigPFErxNkTARCn6L1jCDqcH
	O1+vC6lSaARSB/bPn/1ir0CBAaAiJfCIGLn0rEM1aMakUyMYsmawUIcFxbnc9m2bRWD4p0W7UrYOT
	KREXCpC1T4Rm2uU2jBZjR3AsFSUXL3fp5DapYH/9+jgXdTGctq/t/lJJfh3d9WG3RcNfEeAa59U63
	jejB1kLgKUlXLjnPsmr/CYBJA5UTal4Ocie10eWxpGw5d1LMUUk1DrQPdBBEoTuMZZPGKg3w4/2st
	QjxR17K1Wmvb2xHbP1peiRU0cSOWNqleyBZ9ONbYwqfyXUKtVKO25wvtNkukUTWYqsKhYlex1ZWr7
	IoCeg4VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdO4-000000048kU-0XDs;
	Mon, 08 Jun 2026 17:03:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdO1-000000048k7-1Pzn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 17:03:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490a767521dso5368745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780938218; x=1781543018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M6rUVQEFS5/jNeoXoPCKPjNpkLAJHhSt0axTVWIBaNE=;
        b=dPcTPykPQn9sWszef3SdGlDX/YZOkCs7YMrPLgiry0gnNS9RWkP3y8lgAG90IVTxK4
         1LumPfwfpQFHZNOpdYZzhpPw3RB4RlMHAlLbNc3tWG5hBAQAEA2Ouu/qecvFJymgUZzC
         vM2wesBoXKcGRSfrrJBVhypDP1xbTNBhkIChiAtG9+GPnd6ReCVOtReHfU9apqDgtHje
         QfWFL+PAVluGyzxNC9gZM2U/X/QBRvKPXt36Hsh9yiMxRl66Z0I1cJIlW80ZF1xVpuCp
         ctcnEGZsCe+ekLLpp9wUBlt5jYgdlIbWorPqmpKb5Hae9zYSP9XkMczuMP4Su5Hd1NnV
         I48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938218; x=1781543018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6rUVQEFS5/jNeoXoPCKPjNpkLAJHhSt0axTVWIBaNE=;
        b=f5x/eCyhIXV3wvWG6iBoxCFloN6kK6RLgw1fHdpga1MkBlhLHdTmJzLHMbdpqG7hKR
         hBUrSdXz5BXg4H5EHK9F4AMLraMIu1EVRYehJO8yB4/FNd2IFGdoi1TN3D3Ieo27XBl5
         QziCJO75XRTRlil5FBLR473ZGQ7kgd2g5Xg71N+SYZyIDWLGPjt76soPxf1pq3CAYwgp
         jo/B4SxtGjpVpak0Z5vqt0i0TZIFmtXjRhtoYm2tErRba75A6TCv/RBhJ0UBMjLt1K1J
         77RfkCHi7Igaim7zOsStB4dArHHJq9W1TtZlRZE4jIKWRBfRYyOtO0468+ZNpptmaB//
         SKCA==
X-Forwarded-Encrypted: i=1; AFNElJ/ecPVv/1Tnt5L4EmsCak8hfIGxDIHWVGU3vONryk84EumcGEkmEiYyQzqSHqdRFYQ2OZnwn+86vBHeI1vdXjee@lists.infradead.org
X-Gm-Message-State: AOJu0YxU2wy68ffwziNLZkF3CN5OgauRqegS77arBSBV01dWW2MBxOos
	TuzLqYWxbXtKndwbw7Hz1ZwbrSmajor20RwBs+DEOofqVjFiL5ToS8OT
X-Gm-Gg: Acq92OEQKWxvcovUa72JUc9yePBW9gm+9cCznLS0DJDws6mFgarVyvX3gd0jKYcmt3E
	Sl53vT43t9g4qmxwwG9d9ee+BWQz3qrYQHQTf2FK646KVcgfPJtvB40OJULFydKVbn3hlAD7wEB
	WbikuExCbxw6XJM6MnOJZ+zZORWXHLN1ko3o89fPmnYqUsUq8wLuf6oaZ+R69W4GLX4K31aDLaR
	809wV5B0iuraq7leztgUdUuKoj9g9GTEsQiYVoE9NtQ+RAxBS1/CZ2KvezN53F+Gjd3wBO+UQDU
	JEJhVd+vkYNInbs8kaibRScr32I9iq6O2vFMXy5di37IjpVppGb/m1oDdUWqEjIaD0ioM2DpZuE
	F3A9Q0/suYWOAVu32lI1CZXb0GFIo2T0YEaHqE3yfeV40rFhStbNxnHOGXdIQ1OL4vETKQWkhRk
	YRFVm5n8lx2vPhwHTflm63ZdyXEfnsq6z8h0b5XkPEuCRk/Mk4fA8uPECYtYKok6Szl0XiHs61g
	w==
X-Received: by 2002:a05:600c:540f:b0:490:b71f:2ed with SMTP id 5b1f17b1804b1-490c2603746mr124100355e9.5.1780938218113;
        Mon, 08 Jun 2026 10:03:38 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm375437735e9.3.2026.06.08.10.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:03:36 -0700 (PDT)
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
Subject: [PATCH v5 1/1] crypto: atmel-ecc - fix multi-device use-after-free and registration races
Date: Mon,  8 Jun 2026 17:03:27 +0000
Message-Id: <20260608170327.45788-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_100341_443177_E4989CED 
X-CRM114-Status: GOOD (  36.54  )
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
v4 -> v5:
- sashiko warning: revert wait_for_completion_timeout() by
  wait_for_completion() when former instance still active at probe()
- change return type of atmel_ecc_wait_for_tfms() to void
v3 -> v4:
- sashiko warning: replace wait_for_completion() by
  wait_for_completion_timeout() in remove; decision is a kind of dilemma
- move redundant code of this fix out into a separate function
- make also use of the wait_for_completion_timeout() function at probe for
  convenience
v2 -> v3:
- sashiko warning: fix missing init_completion() for remove_done
- add comment naming all three related main problem situations
v1 -> v2:
- remove the initial approach with "ready" state bool, replace it by
  this be a more comprehensive approach

 drivers/crypto/atmel-ecc.c | 122 ++++++++++++++++++++++++++++---------
 drivers/crypto/atmel-i2c.h |   3 +
 2 files changed, 97 insertions(+), 28 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 0ca02995a1de..be956508edcc 100644
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
 
@@ -295,6 +304,21 @@ static unsigned int atmel_ecdh_max_size(struct crypto_kpp *tfm)
 	return ATMEL_ECC_PUBKEY_SIZE;
 }
 
+static void atmel_ecc_wait_for_tfms(struct atmel_i2c_client_priv *i2c_priv)
+{
+	spin_lock(&driver_data.i2c_list_lock);
+	list_del(&i2c_priv->i2c_client_list_node);
+	i2c_priv->unbinding = true;
+	reinit_completion(&i2c_priv->remove_done);
+	if (!atomic_read(&i2c_priv->tfm_count)) {
+		spin_unlock(&driver_data.i2c_list_lock);
+		return;
+	}
+	spin_unlock(&driver_data.i2c_list_lock);
+
+	wait_for_completion(&i2c_priv->remove_done);
+}
+
 static struct kpp_alg atmel_ecdh_nist_p256 = {
 	.set_secret = atmel_ecdh_set_secret,
 	.generate_public_key = atmel_ecdh_generate_public_key,
@@ -315,6 +339,7 @@ static struct kpp_alg atmel_ecdh_nist_p256 = {
 static int atmel_ecc_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
+	unsigned long timeout;
 	int ret;
 
 	ret = atmel_i2c_probe(client);
@@ -323,49 +348,90 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
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
-
-		dev_err(&client->dev, "%s alg registration failed\n",
-			atmel_ecdh_nist_p256.base.cra_driver_name);
-	} else {
-		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
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
+			atmel_ecc_wait_for_tfms(i2c_priv);
+			dev_err(&client->dev,
+				"probe timed out, former instance active\n");
+			return -ETIMEDOUT;
+		}
+	}
+	if (atmel_ecc_kpp_refcnt == 0) {
+		ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
+		if (ret) {
+			mutex_unlock(&atmel_ecc_kpp_lock);
+
+			atmel_ecc_wait_for_tfms(i2c_priv);
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


