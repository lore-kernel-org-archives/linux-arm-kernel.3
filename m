Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A88BCD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46bxzW7AWDk4uXlyHvKMVMwj/OyP1y7/MWcuxerPlBc=; b=KGTLJyMSFTGF78aARUOmsVAKGg
	HgmrTAChp17sbl0p0aeO35NSIXvRp4Yl7PnNFbfeIzHTkYbMK7HLNZOhgVQ4Qrkg3KFXbVN68kiWV
	QFlmiEtyFDG3Qc36qTl0j1P4L3fuZLfUXqCXavoUd+m7VPJwo4mkAg0z/e4sslwNVDr1xk91P+GNw
	+b7cRlpN0csmbAL2b81SxEOXpeXC8lbGJUM7eYVHB7onQuApeOrSj0jWoCLTg0mRRtmLZfPr8FOGS
	4UjDoKAA1anYg/UGtPYYE4oed+Cxorbe9zZ+mQ/jnV3IlPDjYSjIca8SQbaDQk8jQMJMhff1LdHyB
	mS1SiuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMR-00000002lDL-0V64;
	Tue, 19 May 2026 20:48:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMM-00000002l9T-1Qej
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4493cf2f982so250114f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223692; x=1779828492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46bxzW7AWDk4uXlyHvKMVMwj/OyP1y7/MWcuxerPlBc=;
        b=AjZKe3aBHznCTMsVkjVkogqzjcbhNwgowXYne3RTAT1RlWFiCCOL5aqRGdKvZadUEp
         ZmuNACUhQktX4N0OZAoBt3V/8nYx3KfzWIVNHWn5U+jQDgRbpprF3DFDYlowpWql2yWn
         lFYqCl3OKsnAY7/Y1ke7adKBaW0Gy2lYkyFqNNiSt6/0xbU71LzzYiEb19l9ja6D40Qr
         /iqETUJ0HGBcpiZeDgynbThC/JzoEld6cIQrDtnC7DABM5+43P/nw6il2Eh6FafSSi8f
         eoh2imudRNQG/H4LHXRKS/wva5dfTNWDnMohlEboV6sW5T1bdsAqGe6Nop9w7deeMQee
         OBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223692; x=1779828492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=46bxzW7AWDk4uXlyHvKMVMwj/OyP1y7/MWcuxerPlBc=;
        b=rFc/gzju2RTLj2zRwZMNLgdEsw1z1C8qF60zAteKaB4HL9SkV9WY6LdwWJyMpABVqI
         HqiU5+clLzTUE/LGwZ/9kAcI9rxIir+O3HQW2FLj3iaYWG1FNIAxrHLYcskl3I5vviXw
         gTZWOkrJnARuWd3U9bQIz25aM8ANf3Krafd3aLOhH2K+Kmp5AUyLbnth7tPY1ndPFdZ0
         ciRUJI32qze5WrAcZBOrJAGhHhFDPoExbx8KF661oPhYAoNpzCWnc+jUV/DfxV8De4Hl
         6v4dYzoX9Kv1uugg6kj/XLmwKIKhCAraGpTqqE7X3L6pvZVOoYunlHQXpVG0WifGl//I
         81Xg==
X-Forwarded-Encrypted: i=1; AFNElJ8yrraPeN5w3+Y65Ge1NPf5vQEfl1bq8Ot2EIGXkmnf/TXZIovNNFWI1+YSSZ6AJp7EcPHfoSeIn/PX43fSLaRh@lists.infradead.org
X-Gm-Message-State: AOJu0YwhTb1sZlz4aW2k74vLlGkILQXUKNwYyow+McrfCGzli8MyHTc1
	zGSYNf4OUoKv9tBcaUvd19WpqD4RB5ZsXv8WsPHa+1Ldrb8r1eU8AHb0
X-Gm-Gg: Acq92OFencmT0maC+0rVrs979ha3Aub2/bR08Kf/3Mg5smGNb+84E+M1BHLOsnt3ZN6
	a2YSvQQEgDFHRKIVL0aypGPQeExsZpz0xrXq8fxVI+BfAj6rOZm7xMzRJDLuFxB9iQpy631u/Oa
	ZVXSmhArbW478zCXQ3s+GWUUnYfIiCD0POKPXZNIzTE1ZxPdoLxV6SjR5CeWEX5sutTIcTjlRag
	owPwQfSI7o53+05/Weu4okvIc7JkD1fM32tLjOymp9nMKe+imiJplUh0thUq63aZ2G9oRFgQeHk
	boQGlU5cfY+q25dkpLuB1mXYnp724aSEKdnsREKEYramPvHch2egmtNtpPHsBDdkWVi4WAsg4/E
	xfh6cN+o+Qqj7ggLdw0aALxmjkBd2ol7QHjrm8SSl/yiycBMTGdus76aWAJbvZfRNjhPPwxPptM
	pk3AoNi/od0sQ2+4o+bBXDa77VYH/mTgfEj7Zs4DasXm4biejCtBnTvxfSkSZDC4M=
X-Received: by 2002:a05:600c:8b25:b0:490:6ab:406a with SMTP id 5b1f17b1804b1-49006ab40f1mr111033255e9.8.1779223692230;
        Tue, 19 May 2026 13:48:12 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:11 -0700 (PDT)
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
Subject: [PATCH v2 03/12] crypto: atmel-ecc - fix multi-device kpp registration
Date: Tue, 19 May 2026 20:47:54 +0000
Message-Id: <20260519204803.17034-4-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134814_405286_603F2051 
X-CRM114-Status: GOOD (  22.77  )
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

In a scenario where multiple such devices are attached, the following
situation may arise (finding by sashiko):

Device 1 Probes:
Calls crypto_register_kpp(&atmel_ecdh_nist_p256). The Crypto Core modifies
fields inside this global structure to link it into the system-wide
algorithm list. Registration succeeds.

Device 2 Probes (Minutes later, on a system with two of these I2C chips):
It executes the exact same line of code. It passes the exact same global
&atmel_ecdh_nist_p256 memory address to crypto_register_kpp().

The Disaster:
The Crypto Core tries to register it again. It overwrites the internal
fields that Device 1 was already using. This corrupts the Linux crypto
subsystem's internal linked lists, usually leading to an immediate kernel
panic or silent memory corruption.

Introduce a global mutex and reference counter to ensure that the static
kpp algorithm is registered only once by the first probing device, and
unregistered only when the last matching device is removed.

Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 55 +++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 19d5435aa42b..e5dd166fd785 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -23,6 +23,9 @@
 #include <crypto/kpp.h>
 #include "atmel-i2c.h"
 
+static DEFINE_MUTEX(atmel_ecc_kpp_lock);
+static int atmel_ecc_kpp_refcnt;
+
 static struct atmel_ecc_driver_data atmel_i2c_mgmt;
 
 /**
@@ -331,23 +334,30 @@ static int atmel_ecc_probe(struct i2c_client *client)
 		      &atmel_i2c_mgmt.i2c_client_list);
 	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
-	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
-	if (ret) {
-		spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-		list_del(&i2c_priv->i2c_client_list_node);
-		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+	mutex_lock(&atmel_ecc_kpp_lock);
+	if (atmel_ecc_kpp_refcnt == 0) {
+		ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
+		if (ret) {
+			spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+			list_del(&i2c_priv->i2c_client_list_node);
+			spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
-		dev_err(&client->dev, "%s alg registration failed\n",
-			atmel_ecdh_nist_p256.base.cra_driver_name);
-		return ret;
-	} else {
-		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
+			dev_err(&client->dev, "%s alg registration failed\n",
+				atmel_ecdh_nist_p256.base.cra_driver_name);
+
+			mutex_unlock(&atmel_ecc_kpp_lock);
+			return ret;
+		}
 	}
+	atmel_ecc_kpp_refcnt++;
+	mutex_unlock(&atmel_ecc_kpp_lock);
 
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	i2c_priv->ready = true;
 	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
+	dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
+
 	return ret;
 }
 
@@ -359,21 +369,16 @@ static void atmel_ecc_remove(struct i2c_client *client)
 	i2c_priv->ready = false;
 	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
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
+	/*
+	 * Note, the Linux Crypto Core automatically blocks until all active
+	 * transformations utilizing that specific algorithm structure
+	 * are fully freed and closed.
+	 */
+	mutex_lock(&atmel_ecc_kpp_lock);
+	atmel_ecc_kpp_refcnt--;
+	if (atmel_ecc_kpp_refcnt == 0)
+		crypto_unregister_kpp(&atmel_ecdh_nist_p256);
+	mutex_unlock(&atmel_ecc_kpp_lock);
 
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_del(&i2c_priv->i2c_client_list_node);
-- 
2.39.5


