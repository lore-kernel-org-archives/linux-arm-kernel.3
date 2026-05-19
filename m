Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F238CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtVvthz/7+lTeRk4aPj5gp54GNbJ7oJJBTGPkd/6zCs=; b=q5eTRYhWpnoH8ROI3aug79ZPAZ
	IH43EqKlKtAeWztsfaG5or3CWglQWqgh9rImGBtbPBXCau6gwyDSwY7isqEuUSaXk4nELKM+1yPG2
	BTxY638ik7QD7V/2eNnpTZOGKoidkfUBlXV1jmT3X9Ouie0iFNyOlkIisKuzYK0P0y3qan76MKAIo
	VkvSKB4oT+KuyIcWjeKe+Udan914TDhkS+cfKxS5qQOUnUzId8p2Lm+AX3LsGqdrNxUWUUlG+5RbH
	5wJcxaZMxAE52V+zebzesAsv7jq2VT89IbBPDYyDPAhYoL4VT0Q6R2ho5cV9/JUnS5de/ZYK/SK5+
	NbMrZoYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMe-00000002lO3-33eC;
	Tue, 19 May 2026 20:48:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMO-00000002lAz-3SkZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-44ad87a57f6so218943f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223695; x=1779828495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtVvthz/7+lTeRk4aPj5gp54GNbJ7oJJBTGPkd/6zCs=;
        b=FZbiER9kuA3Mp9sivxwdHSUKjA19c3O2q4zQRC8C3s6QzCCJwnmkDBv0wWPf5GqkYt
         ouBlzKM0x+caFsRt6FbJ7wvXgc4ba2UKJ9PlhNKPZ/weSEvunU1jbl2j8CIPO4oxLiah
         M9l+cBYmyaO9NrydJmzBw6tYNAMmC2epCpvkcF7uySMsucpdfAczC8Icp2DOAIyxK95Y
         uhZOre1j90gib+xZVO1B5wACWysP52+GhfVUt/WRUWk/dBuMslDaMu8vlk5769B/y51K
         01mGsghMA3G4dotitsNKrVya4tCS1ne9i90syWfBw+II6llqrrDutVMpDHXqdKcJV5jS
         1Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223695; x=1779828495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QtVvthz/7+lTeRk4aPj5gp54GNbJ7oJJBTGPkd/6zCs=;
        b=tUrKo9fM9XrTWQWOjEFokFrYlyWZg7g9ImvEZ1OripyCIODEDnLpti7D6D6oK7ZACi
         edijL0sNPEtt5v9qCCoa2H57BKnutkA8UdNx8D8VbJVE4meQdxHlP1FDKBs4/yWm/t1V
         xtLS5WOZaQR9GVpt5cnk97MAx7hupv/nc0bLNelSQMMVNDxILRSuT8aNuZyGfkZ4PhZG
         XeWA6g3WT++aBpqZq42IXSfTSLvfbhKJKu0jmPYCMjCQmE8lyWupQTpoX0mh50G9GX3+
         g8LqI1nNUnvhCYNhAySCTyMx1PCblBgpxllswt2UdFlfFHQFYuziK0W/j6i4QqXG+Uty
         pbkw==
X-Forwarded-Encrypted: i=1; AFNElJ/uzaqYvc77/Uvy18DXiK/lA6rpReB/Wysq8xoN1WkKFZHGzAzU8IPLd5ZuFKnSdsLJOdIxCkkX17cCGHUiJplp@lists.infradead.org
X-Gm-Message-State: AOJu0YzLckMjs9pTZYheGkYhDWCqEmQnohSeJxiPyH4CVhTKdGhgRdi3
	WqvvFkbr0THgvzEmrOJGyPhl0EjbNGTECc9lBJRRXrmRJvNJTOuP5oDP
X-Gm-Gg: Acq92OEhMM63p7yWjyDZ2dvvVNj1mIx7qUOGXMJcwWW6kI08cwQ5HMHaHctyNv97lXO
	uGuTKTpQ7GR+7PFctxoMN+flEogm/4rRU+6gH5Su37D8Bh/PffpmJH9yH3iJLf8+GvJVsgOdgzi
	QDi34HpGqkXKvEnU+kze1NRGznihqZOfSS9LbsAy3RETNI4JuOUJz6qXQ9rDBgNiaakwF3EzDfi
	DIRH7JLkBqvpsSANo+29hRK5juQYgUPo6ghecI3gJdFwKv1aH8vv4DajHRNRvwjG3GYzB9IxhWK
	aV1QJb0jVymkmLgkrmx/MLXkrqiV+1gBsk8K/o9UJQ2p2TOrvfhRafvrx3RaHYAm0SsLI3Fe24+
	M21oLiM9QHwz+Sw5oS/IWj/f74fE+vjgE9RvGmEpVxrG1VbV/M05+HM9HHTG/gDsRnpTXaSeFNZ
	Q3QDLnpZfGe6z/Tm5TJ6Q6fflPZxK9LOsi5/SfQUNwnWJKrMf9hW5cpHtkddeMCOK90t0kTFg4G
	FfE1KzXOjvO
X-Received: by 2002:a05:600c:310f:b0:48e:7a10:1f5e with SMTP id 5b1f17b1804b1-48fe5fd5b3amr150010695e9.2.1779223695175;
        Tue, 19 May 2026 13:48:15 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:14 -0700 (PDT)
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
Subject: [PATCH v2 06/12] crypto: atmel-i2c - introduce shared teardown helpers and fix queue flush
Date: Tue, 19 May 2026 20:47:57 +0000
Message-Id: <20260519204803.17034-7-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134816_912857_FA801DE5 
X-CRM114-Status: GOOD (  18.65  )
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

Inside the unregistration helper, use list_empty_careful() to safely
validate the membership state of the individual node before triggering
list_del_init().

Additionally, migrate the atmel_i2c_flush_queue() call out of the module
exit path. It now runs inside the core unregistration helper under the
protection of the management spinlock. This configuration ensures the
shared workqueue is only flushed when the global client list becomes
completely empty, enabling proper scaling for multi-driver setups.

Export both new tracking symbols via EXPORT_SYMBOL_GPL() to match the
existing core driver licensing standard.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 13 +++----------
 drivers/crypto/atmel-i2c.c | 22 ++++++++++++++++++++++
 drivers/crypto/atmel-i2c.h |  3 +++
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 33b90667c872..29706e4bfa04 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -336,9 +336,7 @@ static int atmel_ecc_probe(struct i2c_client *client)
 	if (atmel_ecc_kpp_refcnt == 0) {
 		ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
 		if (ret) {
-			spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-			list_del(&i2c_priv->i2c_client_list_node);
-			spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+			atmel_i2c_unregister_client(i2c_priv);
 
 			dev_err(&client->dev, "%s alg registration failed\n",
 				atmel_ecdh_nist_p256.base.cra_driver_name);
@@ -363,9 +361,7 @@ static void atmel_ecc_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-	i2c_priv->ready = false;
-	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+	atmel_i2c_deactivate_client(i2c_priv);
 
 	/*
 	 * Note, the Linux Crypto Core automatically blocks until all active
@@ -378,9 +374,7 @@ static void atmel_ecc_remove(struct i2c_client *client)
 		crypto_unregister_kpp(&atmel_ecdh_nist_p256);
 	mutex_unlock(&atmel_ecc_kpp_lock);
 
-	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-	list_del(&i2c_priv->i2c_client_list_node);
-	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+	atmel_i2c_unregister_client(i2c_priv);
 }
 
 static const struct of_device_id atmel_ecc_dt_ids[] = {
@@ -414,7 +408,6 @@ static int __init atmel_ecc_init(void)
 
 static void __exit atmel_ecc_exit(void)
 {
-	atmel_i2c_flush_queue();
 	i2c_del_driver(&atmel_ecc_driver);
 }
 
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index db24f65ae90e..c73ef3cadf0e 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -354,6 +354,28 @@ static int device_sanity_check(struct i2c_client *client)
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
+
+	if (!list_empty_careful(&i2c_priv->i2c_client_list_node))
+		list_del_init(&i2c_priv->i2c_client_list_node);
+
+	if (list_empty(&atmel_i2c_mgmt.i2c_client_list))
+		atmel_i2c_flush_queue();
+
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
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


