Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACFDCD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zQKhvcVv1v1PdmzRN7tWxQYMtWPLAaBJ9ZJA0l4oMfU=; b=e+KRczDtrT/JcPlW5sa0Ios4n5
	1qUL4sXHIrvWtOPIvqOWsTNytGyMoZfu+LMugMxvfa7FIjaNlPrrr9w1Dpbr84OnBXi0cWMg7qzGp
	oK0/NxYqvKtK0njaD2BO4f7OlKpgT0xI04zmKU+fGNLlshFJO4XNBdbPeKlJivBbMrJwb2YnhLqf4
	/Ow7PcRynyD7LJSqWNeYAy9XjBVci7tPzjbjLeLAvs72f3FC2wxqEFqpO8lP9FbZVn1Oiio5qR1Ak
	szcPfoeWFFHBLpQXj7POWcdoAFWBIflt3OruXcaFzYOV6b8fEDZPmuoy0UqYSCBe53tcEzHSsWw1a
	5yVxxrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWEL6-00000002Hs9-1u2E;
	Sun, 07 Jun 2026 14:19:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWEL4-00000002Hrm-2kaY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 14:18:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490c28f84fdso4597595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 07:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780841936; x=1781446736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQKhvcVv1v1PdmzRN7tWxQYMtWPLAaBJ9ZJA0l4oMfU=;
        b=rxSIMZaWIe/00bhKBLYmdKGHvEmjwcKZg+sP9jZHsYQSKmREUXbrByJi6zyxAwpyhq
         LrA2F9x1M7UA21Q9mqmEt4dEi8ktv4RK9ewVHq9DgMfyzZPPUhZyLotRDomFQ7/+C4/q
         WXyYNs4cDasnhIdlsFwRuc084RxiIqUL5TjDKf0s8Us1gcJGL6hMdKcLZu0v45U8TMXG
         3pmOKOP1YEgyxM/ENRzlIJinjgTvmADB3L6z5wAiFEV5DJ7l6P9pE2Ru9pahdowqF5tw
         t/x7MJU4AnP+dh0TeIY5xDv/ffzwNbyWeh5rSL8RkkKBRVHL1G73kOsZRuFy48MpsYil
         VrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780841936; x=1781446736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQKhvcVv1v1PdmzRN7tWxQYMtWPLAaBJ9ZJA0l4oMfU=;
        b=d8JAgTVF9sLJGI2/g73uT0Mm4BVnss2J+PEQTv9u902KuKxeDqkeX8c7CCMmjaYnLF
         eSbojorWnR/B/jkxs1j3hn9KDknaw51n7mBkZUI4qOSRIxrNibToZX8DKztdQcyOfv8S
         JnbD/Ce4D/9fyyukf8HyHkxCug/ljBa8DLgDlKSFu+oVyr4UQ+MFPBL+/Z/jc+Sd6TgS
         XWIZRSOOjoZzjTzHwL76xJxPqrO1/vVIrWwjtyXjlVqv8/aBEtBmn0BquNjeTjXBIFE/
         SlH315TwbaoOQO5J+X3PduGd3sfLqj01h4dJ05zRHj91vcHmOZEyegNQL1xVP0HEtpQ1
         Y2WQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eW+10f1f1oEjbSGnywzWzhF5FhhQm+u69NxnMew529pCQ5fyuCTGQIwjIxZI1/FJ6kF3sjQ3CAoniPB4TRLyc@lists.infradead.org
X-Gm-Message-State: AOJu0YyfpZfFU+WVLNZV0u7JTBHOYNhTa6khR2mx+nyEqsDEr39nJbtv
	sYVYYEmrnHDNEEID57yihXfoxWMUJAPEpl374d95yIA8MAKcASdPM5q1
X-Gm-Gg: Acq92OF6fHKVihSU7SniH1SgMV2AYpaf6b14o8V7sig8Rj4TEA+bh8cqgmq9swSA8o/
	OJFOrgMcOhZJnl+CdQ1shAzRv3B4jqPeQo9+r8wGny0TCHM3py0edAFgDu5yX/756H2+CMnrKvO
	qlKpvDpVQ/Ei3K6EQ4Xwlzdvt0z2IQYcEDIFCZzoZqydveBruWt7tZcQ8iaYYJ1rRkWfawYNaXr
	PMtiFVUJ+nob3rYrE/wb1rRSx5sVX+gLprv6NK3NDkK6+MPvsifUGlFbgeFTteTZ7T0UdJsd5k1
	AK0rRDt5VEr4LUvd1uVJNSYM64peafsWJI+9P/HxespYHzvro4XLEXFNpuQr/hfiqkJz6Kc49t0
	F32r8hAuMS7WGVo8m0x6zWfM7OEZUujQezJoA9etLygUPATQaLnrB7QG974fDjEX1L596TynoyW
	LzS4tyF4EN0+e5heW+2+++Q6USFI/Lx1S1eY2WAjRPzzTjoHp4itMWyToDalyXgiH4l+ix5y65C
	A==
X-Received: by 2002:a05:600c:470c:b0:48a:5546:619e with SMTP id 5b1f17b1804b1-490c25dcc59mr85982595e9.4.1780841936223;
        Sun, 07 Jun 2026 07:18:56 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3446aesm47948197f8f.24.2026.06.07.07.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:18:55 -0700 (PDT)
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
Subject: [PATCH v3 1/1] crypto: atmel-ecc - fix multi-device use-after-free and registration races
Date: Sun,  7 Jun 2026 14:18:51 +0000
Message-Id: <20260607141851.37835-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_071858_777534_B4D638FF 
X-CRM114-Status: GOOD (  35.27  )
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
 drivers/crypto/atmel-ecc.c | 106 +++++++++++++++++++++++++++----------
 drivers/crypto/atmel-i2c.h |   3 ++
 2 files changed, 82 insertions(+), 27 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 0ca02995a1de..df285ca9a6f3 100644
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
 
@@ -315,6 +324,7 @@ static struct kpp_alg atmel_ecdh_nist_p256 = {
 static int atmel_ecc_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
+	unsigned long timeout;
 	int ret;
 
 	ret = atmel_i2c_probe(client);
@@ -323,49 +333,91 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
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
+	bool wait_needed = false;
 
 	spin_lock(&driver_data.i2c_list_lock);
 	list_del(&i2c_priv->i2c_client_list_node);
+	i2c_priv->unbinding = true;
+	reinit_completion(&i2c_priv->remove_done);
+	if (atomic_read(&i2c_priv->tfm_count) > 0)
+		wait_needed = true;
 	spin_unlock(&driver_data.i2c_list_lock);
+
+	if (wait_needed)
+		wait_for_completion(&i2c_priv->remove_done);
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

base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
prerequisite-patch-id: c4d6779c74f5ca16536803c314af99c4346a14e1
prerequisite-patch-id: edd38ca9cc59d9e34c0944e2e7b533cdeb422c81
prerequisite-patch-id: 55f668761eaff284d13ab86085686eae426fc524
prerequisite-patch-id: b96e5855ea503314931ff3184f96af049c16b19f
prerequisite-patch-id: 5a761e93900d75ef5f887324002c6e52ba47558a
prerequisite-patch-id: 77570d656bdcb6a9bfa3c70b730db8f22767a70b
prerequisite-patch-id: 10a90dfb8890f39c19ea4117ffbb7cf3c801dcb7
prerequisite-patch-id: 86c4da8c2119be06fe5d494066523f6b8507abe4
-- 
2.53.0


