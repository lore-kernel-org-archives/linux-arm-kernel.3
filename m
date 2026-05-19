Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE35CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlj4B3tCS1LCg0o2cK8faWQWBMDw4ejqDx0TgeFPOz4=; b=RTDudf8bZa9pBWMhs78QP6L9Z9
	I00qUw14b+6iXIHVQT1TPM838g1cQqWBMJFfz0zEpKC+3uaZqWNbbxj3h/+3LigMzReUfaYnd81IN
	NXWtSCN/tyLMLQh+DAzd6GmsTewBvIG13XKx296KgUj+Sr83IJQBAcqgiiIRyk3DRVetuxQSZgA3X
	IcG0DYGyVLfIOt168E0ARZ71atEk6TpfF0nJS+cieEwqTukf5GWcHRSz+PIQUZeWUMFIplbn3LgvJ
	7YPc5s44J0NksISUONXNHaspwEZj4rmaTkhsxO521OpYFvvimlcAIGxvy5xMvmk7rYBI6zHqsoGq1
	P3Cb6KMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMe-00000002lNw-2Uyt;
	Tue, 19 May 2026 20:48:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMO-00000002lAZ-1ZjP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891cd5927dso4338235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223694; x=1779828494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlj4B3tCS1LCg0o2cK8faWQWBMDw4ejqDx0TgeFPOz4=;
        b=kTJeSfvf1ISZgtR4unx2yuW/pN4XJNGGyxt56WbkV3DxHoHBDfTSvD7nM8v8Uok7h3
         yjnKQ54tOFV94Ai4jdh+3G87CEevwE03IxqhibTrBoDaqKPGp7xMk8cQfbMGa6DX2fEY
         rFGnD9gmVsONMb2ET9XaKnrifrev78IINuXaDyp37xx4smsougF/uTNYtrXTO6gTVKYe
         CtMIL6Ni5IOiX2nYBi8LaLdbdpQkkR/7a7M7tbdT3gdD09MfM5/lPSyblVNSNcvvx4y6
         fwD47r3ch3brVEnbIgjAdZ4lH3obv2DwuVen99TeZJlSX8y15Ex1w8KU2Uaki8pJ9Z7I
         7MbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223694; x=1779828494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dlj4B3tCS1LCg0o2cK8faWQWBMDw4ejqDx0TgeFPOz4=;
        b=gZ0EJfGO45SS1Rifirg38Vzu38LQ2dv9mpzc3g/lgU4ATt2MP7McfymNwCfXb+pcDY
         9pof2IlM6vhi+DNeZZHHayaFacwaFkxQNx0fw8mbj8nq6LJZTjnrMNc2ZzWDXbL9dz4q
         +838foWBQnbdffb9Oq+iC/0EYgoQ04pb8kNm4uaG3hAsH6T2vVhkelg0+hUWPX/KLevk
         hETpnWcdhox5+tZvPLUxmK63qoJs1IPn0fbnAMGG6sfQMJNd4Vv+Dh3HYON0I083KhTt
         E5bmCc1bUvtEvwOYmvN4p8dCCWtRUUy8QSqyAzEe7Ttt7Qq7Zkrihz+di7h1ooKqxSaE
         9K1w==
X-Forwarded-Encrypted: i=1; AFNElJ82McdSzy3NqXU6UMw9QNkKFpB8sXqzTDo2IPVfC0XUAQrY66+AIdF7QaCECOsaGKLBC+dfevE2m+9XtsMf8roR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy32iy4ZGnFwGffQ1sJJbEah6NAbclO73+2dH8yogbngc/ZCAIe
	OERQYxoAUoG7BX9NgvN01X+2OCzld3I4UytpF8fXN5uTmg8sgmO/38tR
X-Gm-Gg: Acq92OHyAguNLVvUTptW02cl6Yaeh99N2NG+Gej4ez2jWA1F85Lc8h6ETMFXG6efJ8p
	rydvDXv8Z7+DcOxViA5z95/D+ZVUE3HQRQt4atmCI+VaLXoZuYTMoL7rDj1mLgZbC5rkN5fzN9d
	vCUqnZ6cTjHYHZYRdlDlvHUq0fYj1mmcTf5nJ74VnY3ui5AbDrQ6vvhJJ+GbxNl14wte2h3FaH6
	iz52Sl6WJnGcQcEQeNFAgoih0py3moI+kSS0X/y67EMlqDtLlalSREAT6QB+5JNNLnnufrNX52D
	+UCtDKTrvT/VHmWVEBfz4DdCORxNeRnnGlH8/BWiOaqywlCRIq1cG08LsrI4CaoJUmqlEUHRnPB
	h+PnqRQmZ/8zAyaVAKGMeRpipA+X7tD4O91bKpxDrr2jOnfeHeWZfQKFjFZJlQzJQBA2xMI+BBl
	ZLfl/y6z56Mxk4Krj1vi7Ii9Q09Yq35+n9KcBmrkvmZ2N7U7ca+FsJf8A1t5jBwfI=
X-Received: by 2002:a05:600c:3ba5:b0:488:7e7b:dbc2 with SMTP id 5b1f17b1804b1-48fe61f7b16mr195362275e9.3.1779223694200;
        Tue, 19 May 2026 13:48:14 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:13 -0700 (PDT)
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
Subject: [PATCH v2 05/12] crypto: atmel-i2c - move client management instance into core
Date: Tue, 19 May 2026 20:47:56 +0000
Message-Id: <20260519204803.17034-6-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134816_435845_E50B1019 
X-CRM114-Status: GOOD (  16.78  )
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

Move the global 'atmel_i2c_mgmt' tracking instance out of the ECC driver
and into the atmel-i2c core library.

This change consolidates the shared I2C client infrastructure into a
central core driver. This centralization allows both the ECC and
upcoming SHA204A driver modules to access and reference a unified,
common device-management context.

As part of this relocation, replace the explicit runtime initialization
calls inside the module init block with static, compile-time macros
(__SPIN_LOCK_UNLOCKED and LIST_HEAD_INIT). Export the tracking structure
via EXPORT_SYMBOL_GPL() to make it available to dependent sub-modules.

No functional change intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 4 ----
 drivers/crypto/atmel-i2c.c | 6 ++++++
 drivers/crypto/atmel-i2c.h | 1 +
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index aa2dde99b2b1..33b90667c872 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -26,8 +26,6 @@
 static DEFINE_MUTEX(atmel_ecc_kpp_lock);
 static int atmel_ecc_kpp_refcnt;
 
-static struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
-
 /**
  * struct atmel_ecdh_ctx - transformation context
  * @client     : pointer to i2c client device
@@ -411,8 +409,6 @@ static struct i2c_driver atmel_ecc_driver = {
 
 static int __init atmel_ecc_init(void)
 {
-	spin_lock_init(&atmel_i2c_mgmt.i2c_list_lock);
-	INIT_LIST_HEAD(&atmel_i2c_mgmt.i2c_client_list);
 	return i2c_add_driver(&atmel_ecc_driver);
 }
 
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 0e275dbdc8c5..db24f65ae90e 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -21,6 +21,12 @@
 #include <linux/workqueue.h>
 #include "atmel-i2c.h"
 
+struct atmel_i2c_client_mgmt atmel_i2c_mgmt = {
+	.i2c_list_lock = __SPIN_LOCK_UNLOCKED(atmel_i2c_mgmt.i2c_list_lock),
+	.i2c_client_list = LIST_HEAD_INIT(atmel_i2c_mgmt.i2c_client_list),
+};
+EXPORT_SYMBOL_GPL(atmel_i2c_mgmt);
+
 static const struct {
 	u8 value;
 	const char *error_text;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 30ed816814af..d54bd836e0f5 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -119,6 +119,7 @@ struct atmel_i2c_client_mgmt {
 	struct list_head i2c_client_list;
 	spinlock_t i2c_list_lock;
 } ____cacheline_aligned;
+extern struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
 
 /**
  * atmel_i2c_client_priv - i2c_client private data
-- 
2.39.5


