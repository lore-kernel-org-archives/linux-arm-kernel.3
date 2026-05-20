Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C335DCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w87C2HO3mgnApoyvB+dNnB4jQakb6mNAOv8hi/O/IbI=; b=FVJQLczXQqC2SGR+jFe70T+Oef
	d1UzME2g9frSB9iWUKA06JW5/YWC1uBZH2L2EtdrkGW5wUTU/AyKlnfr81nRW4jxeayvOT6pSAg/2
	LNjPLCNWHaMSCmN67GZc7D//YSkvaLlFJcdPfryXKyLmVMw9K4sbJa8w8HmtI+fnCJnGxr1OeB0sb
	EQaewPFyK16sJ7S1J2U0NnAZVR0UIj63LzuSonhx9OAwiOclF4/7d/em+13EAfyhF5WJTDjuiO3qe
	tLYz0tPhwT/A84fUIkKX58G2ykph1aaeJszop0TsitTB30GAbPWxVnLwSUE6ef/w3W8+rbHYFaiV4
	P0RF9ztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIO-000000055HH-3J4k;
	Wed, 20 May 2026 15:57:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjII-000000055Dl-2x7j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a8f97f6bso7689195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292633; x=1779897433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w87C2HO3mgnApoyvB+dNnB4jQakb6mNAOv8hi/O/IbI=;
        b=saeXw8GKh8R8TbVrhGMSOttzm64VlhfvIXsKTkDSM31237y7L8iREtMoRk2fmq+kUi
         71WX7GpYQ1MyYhc2NCSLiRveNJLdZypfhpEzc8MaKHvKHAG+a+7xB1sM5jiRsNpChlnB
         7nUkSD8OuOOnXnsOzlXOydOFrTPnQcyJEDv1OPBOpgT45c1wjsZlVA59OOQlP4SGu6pl
         vh5Jf9XmwBjum7nr4ISh4JiRIHsfUTlwFtmdAvuYqFmDcbZvZ3A1jMzaiBXg/+OpGcyE
         me0LTRDsQRMYw4++mWdoTbk8gPJVSMtcG3kN4dUQcwtFLfeSXTuLrAsmICleLr/5oKDD
         0TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292633; x=1779897433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w87C2HO3mgnApoyvB+dNnB4jQakb6mNAOv8hi/O/IbI=;
        b=ZCg8HC08DFxlxFrqXb0s/gDsED8yPYMgn3fPUAmgjoTntEr3TKjc/bEBCB0s8xnRWd
         I5yEU/kRzBDhPMi/dJ+PkMUJYEWRMXsvtVzK84fNpkWAgQDrcfr6DTL1YROWSEufF6eY
         ObZ53EX4GvyyyVQDDv+QxyOV5xasIeLstXIDEbZng7fghyQNEecrlfgJvnumhq3wJ0q7
         tRNx6PvojDHC2XRr2m6o6L+Qw7JoZAwpFR+Nr3+ZX4wzOeCdPDi5cRcOMjo2JK2D1x6C
         +z8JTEGkdE+nDxtk73my6bJWnuf+e9shWD3NuEFd9kZPDMt8iLS8kvoX1xUKrNkbvOus
         gTpA==
X-Forwarded-Encrypted: i=1; AFNElJ8M/rzqKfYM/7ZF47F6IA6qzRQ5A0Y2IMgAQtGmAqJtYK8XnNTHRE9WYR1axuPeuYqKMpPY9iWpfCWFyOxw+HSa@lists.infradead.org
X-Gm-Message-State: AOJu0YwN7hfnnfLfjF5DIHX23LmvovtQRfYvH733P1AbvY9/R+h0rGLa
	JtGn+fUyaxkgHsO5hr4Luzy+SjFDOvNwa/aAqGrqLNV6uYesHn0T0IQd
X-Gm-Gg: Acq92OGxE/LW2JOmriHeqAIIB3/IeeQSlbZna5E5qfPYYOybCwwcTsZBlLKMPW786/v
	6Baar5QfRH7E1YaDAR862cnMWAYlKptyG7e20cgnYZg/onYyZKCP+lLNiiouyVJ6v2p/ZzvOaV3
	yepGliv+BO2HIrOVH73nzmLMnxga5Dpy378PLnmmD/sqLMAu3wONnGbgg3IiSjkoY8STPdvUpa6
	olfVEzOrnrscusKuXdoZmwxQ85b1e6IWc98ItUXq2e2RcobLScCxFz+EzLGHgY/Y4xG4KXiNIPe
	MDmE+Z21GxRg6RBxPFFxQXupKANNAILBfSBkbrVraCWU07bRvNMBdgn4vbnDxaww3tbcyz5nlDq
	5x31VMLJrlZrxN23bgwnwNuEJ1Rj4d5kxTrjG2h/w88QmIbI1PJpIFmuk/hIVUmCXjLUVms9YAw
	HgC2XudyAwAzYFHPYAvDPQF9603frQy0TULTm2pscgiV1yIwoGbC0ZzCeF9grruheFNRYMP8fP4
	A==
X-Received: by 2002:a05:600c:4692:b0:48f:d410:6072 with SMTP id 5b1f17b1804b1-48fe6302a9fmr208044465e9.6.1779292632702;
        Wed, 20 May 2026 08:57:12 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:11 -0700 (PDT)
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
Subject: [PATCH v3 03/12] crypto: atmel-ecc - fix multi-device kpp registration
Date: Wed, 20 May 2026 15:56:54 +0000
Message-Id: <20260520155703.23018-4-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085714_772597_2AD169A1 
X-CRM114-Status: GOOD (  22.61  )
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
 drivers/crypto/atmel-ecc.c | 56 ++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 4c6860fc3dd9..2f82f529228d 100644
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
@@ -332,20 +335,26 @@ static int atmel_ecc_probe(struct i2c_client *client)
 	i2c_priv->ready = true;
 	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
-	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
-	if (ret) {
-		spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-		list_del(&i2c_priv->i2c_client_list_node);
-		i2c_priv->ready = false;
-		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+	mutex_lock(&atmel_ecc_kpp_lock);
+	if (atmel_ecc_kpp_refcnt == 0) {
+		ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
+		if (ret) {
+			spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+			list_del(&i2c_priv->i2c_client_list_node);
+			i2c_priv->ready = false;
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
 
+	dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
 	return ret;
 }
 
@@ -357,21 +366,16 @@ static void atmel_ecc_remove(struct i2c_client *client)
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


