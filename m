Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7481FCD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMbnbZ8Nz1p+R9q/BNLPx2BmIZnFVuHesrx4qEEwkQQ=; b=A/sLUVzB0DgVLqPrHU0BtcmkNz
	XL2yy2ZXxNmJFpzLhEyHTJARsqgVhhn2mOEPddt+dVvkvkAfcXGXcyvkieRRGO3TosaUw5MZSYBGm
	TRjsA+oqi2uR5DQPFDPLGFp5do2hc9eyTk1xbsnnb/GVKnIPUO70SbR6vfvwE8PjiP1m+cwgwmAUG
	vZ0+Oo6UfNl9b83xwjbVsc0m2em2vyDYZWCTLvYO9+g+ddPIC7EA3fT0v69DlD9ymxWq/fHgWcAFC
	aeRYCf/wMSnp1FN6GVdErXdodnhvtUBZ2eAnBASSG/TqfOzGvgDxbKQo1Sw2PYtD/tkYCu79o/5NT
	YB+qMehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIa-000000055QR-0WuG;
	Wed, 20 May 2026 15:57:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIP-000000055H4-3HJa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488ac04e13dso4569735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292640; x=1779897440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMbnbZ8Nz1p+R9q/BNLPx2BmIZnFVuHesrx4qEEwkQQ=;
        b=CRNEV0hcuAA8bmE0qjnAUH+Dae403uC5Q4AsbJDO7COVSVjPpHTteVblu/VzP65vYy
         YAV26tf7ooxtRtzRe92/QbLdrXY6Lga6YU1QpRN2KQM0Iipz9WtPuUR6NYn2H4c2acSt
         y3RFfKB//1n4iu2/+uPBfhKX3YDBIGCTf7s6uhsNB6/UZRAf73vFlH+QgcXwKQTiXbNN
         PtKXc9imk0Z3On27KI/0YRksqkVt0AIQhO78VTj2DKAafxH0utg4mS5zmknm35Ymoo2b
         qvWKJt4ZexRTj/nukv9dMdjKq2Yl8Q8dcphhsIdbh02cI0WZmryyij9SQIY7UwC8JKkO
         SDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292640; x=1779897440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMbnbZ8Nz1p+R9q/BNLPx2BmIZnFVuHesrx4qEEwkQQ=;
        b=ASOKDtQ2+736jgv0nDT5Qjc8iZCi0hBzFL/l2rQWmKK5wE10vWDRvPoVLrjRlrPrtF
         rJxTA2V8j+8tHVUv+hW7s6qGtH/O7pwZqix3zUvJSCw8LIatYZcSBkfl/JlvtNFX3NW8
         OuD9IImV5WZiH9cjhIuZI+hIcp8exglohUQy7cUyx2LY86NiyNgzIL1Ac+IllnPes7ln
         ugymq7Y7O521KV+WM9qo02SWc7OvicZqmt+c39QsF1tQUkQA0iQZY3cIkNjSLwaBYDdG
         +laaIHjXHzdkACuBOHubUJnmVyz6G/4NhnODMSHcmCpvCs+abIDoXlBnhv4bnSrw6GUB
         I+kg==
X-Forwarded-Encrypted: i=1; AFNElJ9++TfieZRxSEKqKMtjBrnqgONXOMW4jWfujn2jHxKxgqziD87MAkktORcp91IZ18hWtCjednmaCy4aVIl52Rj9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4C9OB8qR9SolcffNhQyXL4iDJNlicShL+GOBTnALKVMbliROh
	bXVkOolnB3y+NqPYeuK/4PGuR8br8GFLd+KX9/lfBpJtmir4hnp8opYC
X-Gm-Gg: Acq92OG0BAHDgoQM7HAUfMybgJgpqL9ItpZgb/ibF9rc9jydO42YxtG3rEJzx4w9c8y
	En5pb8Xbsliinee3Pf9PFCBOCCiKm1jbuVDI+oN7dHKtoYw7vQA+QJuGPXb0/3jbvEH9xFo/Liv
	RFl+lWqb0uQb8m7Smq1UpVASvTglH0N51QdUDsbiSctvTJDqlegWypNOWydGFk47OoUIU6fdBoI
	AVYrujfj7+x/51iaS8K7JtN3UEP8MpdiLpEY6ydrET5SuJpwTuXQQ6gqKQ3eVLT+A4UZyN0oCjW
	B4tOrMMRcWtnkv8GX6Q6NEakVcom7c5C0If3W7rSFNxoiJ8HgnCCbMYbpTsO+ESj/2mgSrw9Ojq
	mign1f5h9ZVV0waMzbo+ZtPlwZ5vY93z/zx0hpGkjgKHkg6NQW5U+dVw0hgnjym6NbfGfrB/Nia
	Fd9Lm5bMzqWCgpwRLOYwju4YLIBUA6BJy7wAOCdfamExadJ3E5kzQoLmB6siPAbNARx9xCuDkem
	A==
X-Received: by 2002:a05:600c:4513:b0:48a:5501:799a with SMTP id 5b1f17b1804b1-48fe664c27cmr188890905e9.5.1779292639549;
        Wed, 20 May 2026 08:57:19 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:19 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v3 06/12] crypto: atmel-i2c - introduce shared teardown helpers and fix queue flush
Date: Wed, 20 May 2026 15:56:57 +0000
Message-Id: <20260520155703.23018-7-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085721_854162_085B115A 
X-CRM114-Status: GOOD (  17.87  )
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

Introduce atmel_i2c_deactivate_client() and atmel_i2c_unregister_client()
helpers in the atmel-i2c core library to modularize client teardown. This
encapsulates common client state tracking and list manipulation operations.

Convert the ECC driver's error recovery and device removal paths to utilize
these new helpers, ensuring consistent execution ordering when modifying
device-readiness states and deleting linked-list nodes.

Additionally, migrate the atmel_i2c_flush_queue() call out of the module
exit path. It now runs inside the core unregistration helper. Export both
new tracking symbols via EXPORT_SYMBOL_GPL() to match the existing core
driver licensing standard.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 16 ++++------------
 drivers/crypto/atmel-i2c.c | 20 ++++++++++++++++++++
 drivers/crypto/atmel-i2c.h |  3 +++
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index cf6abc94d6c9..433f40224be2 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -337,11 +337,8 @@ static int atmel_ecc_probe(struct i2c_client *client)
 	if (atmel_ecc_kpp_refcnt == 0) {
 		ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
 		if (ret) {
-			spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-			list_del(&i2c_priv->i2c_client_list_node);
-			i2c_priv->ready = false;
-			spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
-
+			atmel_i2c_deactivate_client(i2c_priv);
+			atmel_i2c_unregister_client(i2c_priv);
 			dev_err(&client->dev, "%s alg registration failed\n",
 				atmel_ecdh_nist_p256.base.cra_driver_name);
 
@@ -360,9 +357,7 @@ static void atmel_ecc_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-	i2c_priv->ready = false;
-	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+	atmel_i2c_deactivate_client(i2c_priv);
 
 	/*
 	 * Note, the Linux Crypto Core automatically blocks until all active
@@ -375,9 +370,7 @@ static void atmel_ecc_remove(struct i2c_client *client)
 		crypto_unregister_kpp(&atmel_ecdh_nist_p256);
 	mutex_unlock(&atmel_ecc_kpp_lock);
 
-	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-	list_del(&i2c_priv->i2c_client_list_node);
-	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+	atmel_i2c_unregister_client(i2c_priv);
 }
 
 static const struct of_device_id atmel_ecc_dt_ids[] = {
@@ -411,7 +404,6 @@ static int __init atmel_ecc_init(void)
 
 static void __exit atmel_ecc_exit(void)
 {
-	atmel_i2c_flush_queue();
 	i2c_del_driver(&atmel_ecc_driver);
 }
 
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index db24f65ae90e..cf3c57745414 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -354,6 +354,26 @@ static int device_sanity_check(struct i2c_client *client)
 	return ret;
 }
 
+void atmel_i2c_deactivate_client(struct atmel_i2c_client_priv *i2c_priv)
+{
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	i2c_priv->ready = false;
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+}
+EXPORT_SYMBOL_GPL(atmel_i2c_deactivate_client);
+
+void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv)
+{
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	if (!list_empty(&i2c_priv->i2c_client_list_node))
+		list_del_init(&i2c_priv->i2c_client_list_node);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	/* don't sleep inside spin locks */
+	atmel_i2c_flush_queue();
+}
+EXPORT_SYMBOL_GPL(atmel_i2c_unregister_client);
+
 int atmel_i2c_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index d54bd836e0f5..351306c426aa 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -192,4 +192,7 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
+void atmel_i2c_deactivate_client(struct atmel_i2c_client_priv *i2c_priv);
+void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv);
+
 #endif /* __ATMEL_I2C_H__ */
-- 
2.39.5


