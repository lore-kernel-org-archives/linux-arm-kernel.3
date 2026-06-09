Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C04CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHX+Uqp94Mx/sL3KWNcxbSaBfKGgYhEKd9xG+2kJxy4=; b=GOZG3imDff8loBMG+jbH8cLrhb
	0y91XnToy5Z5S/h6hJtU2Wso04/I2C8Hj5jWmAAl8I0c41VZPnxFOCfyyqEeiwy4tHnF9LBi2AAyV
	6xAlznbXlgj7qQAU+lbyAYz43eqA1sGk/KF6CnRA5Sm1ARV6ZUlVjl/xbDtaTcyJgo0XouxG2w/zg
	wEiJVO6egyRWBN+tdNhnctrhpgXDx2KS5wFm6r1uk+ctwCjdCnVwq6QzHYCMdMTu7+ljWwaf7my75
	NXqRWTIL/n19HGEx3ZcU+as3o4xDmlAcsHszh6iNAtvO81w9Rjap4u8H6Qcf+vtEZxvW39HyMLT3e
	Od9IkF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtLs-00000005IR9-04FC;
	Tue, 09 Jun 2026 10:06:32 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtLk-00000005IOI-3jc3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:06:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780999582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CHX+Uqp94Mx/sL3KWNcxbSaBfKGgYhEKd9xG+2kJxy4=;
	b=oSz7YhaY/xmNlGBLjNf8NbSwjaCfRdSX+ag3nXokSPBFQuwJo/NRFsR3kqEqera5PrYVok
	DSZ6pWeAn+ZAhHDSOtCeEm/xJ0HSXhLQebHrIHs8wFX+Cq6klPxdjjPmEiWxoqypMl4SMX
	pey5kdTSeKimNayC1yqQCiBMXNUcrAI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] crypto: atmel-ecc - clean up and improve ECDH comments
Date: Tue,  9 Jun 2026 12:05:54 +0200
Message-ID: <20260609100552.233494-4-thorsten.blum@linux.dev>
In-Reply-To: <20260609100552.233494-3-thorsten.blum@linux.dev>
References: <20260609100552.233494-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5396; i=thorsten.blum@linux.dev; h=from:subject; bh=KeHEHRQE6UbIsPx/FC1558S5CUfVwEVG4iZDQD9tJ0Y=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnqT1sbnirMcOst6nF6U1tz6dITwe5Fd5cE7TvhseB2w nEL83fVHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRuqWMDHMlTfS+Wu37X8pQ pJUQVptz66JX47O53zU1694mMG7cZcbI8PyW3Z5O7UTriW36i14wfJ0W0l2ZXtB15oe+11O3nAl hXAA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_030625_078846_FA898166 
X-CRM114-Status: GOOD (  20.33  )
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

Improve the kerneldoc for struct atmel_ecdh_ctx by removing the stale
"unsupported curves" wording, since the device only supports a single
curve (P-256), and move the set_secret() constraint to the description.

In atmel_ecdh_set_secret(), clarify that the device generates the
private key, and drop the redundant "only supports NIST P256" comment.

In atmel_ecdh_done() and atmel_ecdh_generate_public_key(), clarify the
truncation comments. Also note that a P-256 public key consists of two
32-byte coordinates in atmel_ecdh_compute_shared_secret(), and remove
the unnecessary fall-through comment and other redundant comments.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Adjust atmel_ecdh_ctx kerneldoc formatting/indentation according to:
  https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#members
- v1: https://lore.kernel.org/r/20260603192708.1237715-4-thorsten.blum@linux.dev/
---
 drivers/crypto/atmel-ecc.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 0ca02995a1de..cd33d3f132cc 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -27,15 +27,14 @@ static struct atmel_ecc_driver_data driver_data;
 
 /**
  * struct atmel_ecdh_ctx - transformation context
- * @client     : pointer to i2c client device
- * @fallback   : used for unsupported curves or when user wants to use its own
- *               private key.
- * @public_key : generated when calling set_secret(). It's the responsibility
- *               of the user to not call set_secret() while
- *               generate_public_key() or compute_shared_secret() are in flight.
- * @curve_id   : elliptic curve id
- * @do_fallback: true when the device doesn't support the curve or when the user
- *               wants to use its own private key.
+ * @client: I2C client device
+ * @fallback: ECDH fallback used for caller-provided private keys
+ * @public_key: cached public key for the device-generated private key
+ * @curve_id: elliptic curve id
+ * @do_fallback: true when ECDH operations should use @fallback
+ *
+ * The caller must not invoke set_secret() while generate_public_key()
+ * or compute_shared_secret() are in flight.
  */
 struct atmel_ecdh_ctx {
 	struct i2c_client *client;
@@ -55,7 +54,7 @@ static void atmel_ecdh_done(struct atmel_i2c_work_data *work_data, void *areq,
 	if (status)
 		goto free_work_data;
 
-	/* might want less than we've got */
+	/* copy only as much as requested, capped at 32 bytes */
 	n_sz = min(ATMEL_ECC_NIST_P256_N_SIZE, req->dst_len);
 
 	/* copy the shared secret */
@@ -64,15 +63,15 @@ static void atmel_ecdh_done(struct atmel_i2c_work_data *work_data, void *areq,
 	if (copied != n_sz)
 		status = -EINVAL;
 
-	/* fall through */
 free_work_data:
 	kfree_sensitive(work_data);
 	kpp_request_complete(req, status);
 }
 
 /*
- * A random private key is generated and stored in the device. The device
- * returns the pair public key.
+ * If no private key is provided, generate one in the device and cache
+ * the corresponding public key. The generated private key never leaves
+ * the device.
  */
 static int atmel_ecdh_set_secret(struct crypto_kpp *tfm, const void *buf,
 				 unsigned int len)
@@ -83,9 +82,7 @@ static int atmel_ecdh_set_secret(struct crypto_kpp *tfm, const void *buf,
 	struct ecdh params;
 	int ret = -ENOMEM;
 
-	/* free the old public key, if any */
 	kfree(ctx->public_key);
-	/* make sure you don't free the old public key twice */
 	ctx->public_key = NULL;
 
 	if (crypto_ecdh_decode_key(buf, len, &params) < 0) {
@@ -94,7 +91,6 @@ static int atmel_ecdh_set_secret(struct crypto_kpp *tfm, const void *buf,
 	}
 
 	if (params.key_size) {
-		/* fallback to ecdh software implementation */
 		ctx->do_fallback = true;
 		return crypto_kpp_set_secret(ctx->fallback, buf, len);
 	}
@@ -103,11 +99,6 @@ static int atmel_ecdh_set_secret(struct crypto_kpp *tfm, const void *buf,
 	if (!cmd)
 		return -ENOMEM;
 
-	/*
-	 * The device only supports NIST P256 ECC keys. The public key size will
-	 * always be the same. Use a macro for the key size to avoid unnecessary
-	 * computations.
-	 */
 	public_key = kmalloc(ATMEL_ECC_PUBKEY_SIZE, GFP_KERNEL);
 	if (!public_key)
 		goto free_cmd;
@@ -120,7 +111,6 @@ static int atmel_ecdh_set_secret(struct crypto_kpp *tfm, const void *buf,
 	if (ret)
 		goto free_public_key;
 
-	/* save the public key */
 	memcpy(public_key, &cmd->data[RSP_DATA_IDX], ATMEL_ECC_PUBKEY_SIZE);
 	ctx->public_key = public_key;
 
@@ -149,7 +139,7 @@ static int atmel_ecdh_generate_public_key(struct kpp_request *req)
 	if (!ctx->public_key)
 		return -EINVAL;
 
-	/* might want less than we've got */
+	/* copy only as much as requested, capped at 64 bytes */
 	nbytes = min(ATMEL_ECC_PUBKEY_SIZE, req->dst_len);
 
 	/* public key was saved at private key generation */
@@ -175,7 +165,7 @@ static int atmel_ecdh_compute_shared_secret(struct kpp_request *req)
 		return crypto_kpp_compute_shared_secret(req);
 	}
 
-	/* must have exactly two points to be on the curve */
+	/* A P-256 public key must contain two 32-byte coordinates */
 	if (req->src_len != ATMEL_ECC_PUBKEY_SIZE)
 		return -EINVAL;
 

