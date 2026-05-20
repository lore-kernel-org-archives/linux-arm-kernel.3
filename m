Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC41CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqqB3wEr5ZYs4DFpxkY8toYweVvRXAfc6YYqHonw/aw=; b=j0T2iZcVA4bpWW67HUVNtJYX/A
	kCpW6oJWBWfde2gNc1A8Oct3ireIG7VErzkNmeG+bXGsmr3BfvF77oZ/CJuJcXXgza/nBfsqwC4TL
	x2jpCBvTPdHFzSQawkuFqYjxOKn4tPn/k6Fi/0etfIwwCn/brJUKogNvKZ71+C1GsxrpD/cXQUQZ0
	3eX76Y/6llKqsPsMZdEJuhnRnaCAQi8aPgBGOkfofAtDsJlZZdrGZ1njEc7bt0Y2cE6V9V1KMylR7
	kAEIdYa7PM0oKDMOsYKsQO6Dai8+yco6BpfEnKUWAqHlbskqbAoQaD3FlYrxQKDZ0jQtHjvWdiXZ0
	Za7DKTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIO-000000055Hw-4AqS;
	Wed, 20 May 2026 15:57:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIL-000000055Eh-1nWv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48962cd0864so5390525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292636; x=1779897436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqqB3wEr5ZYs4DFpxkY8toYweVvRXAfc6YYqHonw/aw=;
        b=EGm7NiV4Qf7+RA1mQa+RKxPS9c+lwshEzmfDQ31Myr1n6dJ5dkg6sBYFqtR09QY+34
         Kj2ei/GPcoRYrIUmie3zFnzHYGECoGgozEjpMG2hOW2J4eFrpEy3KnQQgRel9W2nWcDt
         57GeHekkknCNzb4Dys1V8e6sS9XFdvheAzfUw17DHJaig4L726bzlDSLQZU+crjJ7WCO
         Oc4rADHQ38zZqKT1ZFd2LsVCAZSBw709WJsfPVXBeviAHITV5ZyOtMOACBqzWTM0GlDc
         X/2BRqMEIbNeCg6m6AohrFSQJfo5kADAKr2TsZl9fNhEIYcKLmbZZ0AR5iDkLzhsIhyc
         u3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292636; x=1779897436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqqB3wEr5ZYs4DFpxkY8toYweVvRXAfc6YYqHonw/aw=;
        b=SjpsdAYhuVsM0fUTL08Pc2VsSmAGXhXPQsGGXQjIahdQ7qDdjdJ15pndde927SfwRX
         /1KWw6LwpXkVvKmCwiQ47kRizuyAlEPOdnlsWqFCUXwT5KJzPnkkvtbu+ZPi0siTyHum
         ZpGgU+6k92Wq+M9VE7Nb7qPRjYB4mL6VtvR6f0J9fz25bYl/ni4oNBYxo0QLnQGJBDKI
         k+4vIPhP5g79GCR+504xMGQsSeJH5szgnTuo8AbUZftIjlRi6+cbtrDB0P/tFMukPSNX
         AhO5sNmrtb5OhmY5EMC/2lx86Gz3KapSGEPxRLEjUHmZLw5RNxLCZiF57Wz+DJ0izO0b
         A7lg==
X-Forwarded-Encrypted: i=1; AFNElJ9hF9DGbOTKVXGdW5ClOsuwPHSAZplf4Qs7lcm206BuPzJrP34pNXNkUgTEtqyeTfhHoHos3gfCVriH3PiYaWPl@lists.infradead.org
X-Gm-Message-State: AOJu0YyLMqJ+sLyXIyyQhgymBIfawwUCJ1aMJrbj4QOfDAi3JeeBN/q5
	G8Yg8/ukGy4TFdb0szLDI3oAyjc6+/WvsEAdruGfm13an8A9GWvClBxv
X-Gm-Gg: Acq92OEhnDFY/t7L+0mv6gDRo9+9HUOlzgMe5Q7IQ7nrpXzeIwjwyjGVWNPLWZYphiM
	KSsVqxYyA/Nx7UQGZMzI/1zVDpWOxTXfDFekDWCZy0J7ZrHLmrHMF3z5WMYUpDW0OvBfb4+pkdR
	PO2KTfscFRDuWTE7J6XDc/7KoA6GVCe0cG4DlODnGENKOtd08iYqFeDJ9bVxn697pXaTninJ3ZR
	Osuujh81Np1ceG+EB7iU3zcNxKnW6CsOqs/SRs/YRnvAG7m60UrszlWh2Mhsq8CTQJoHbv0PPUr
	o7MgtqYOxhYiXiDDNWFYWLeFl6rOaf9NTQFEYGYp4Le8J7isRMIgqzd3pXHL2sw7Zt1sjwL11Cv
	kw7oZyiBhf4ehujvWpxsaih1xHpy4w4JZDtkq7zF8PZ3jgSfVb2+Mm6+e0XgOumlVrQJdYXm61n
	wKtwE7mh6nUy4j32Gk/1KBrgn9OpnDznRTs98uXym160T96oLTFHOcHmGyK231CcA=
X-Received: by 2002:a05:600c:4fc5:b0:48e:65f3:a950 with SMTP id 5b1f17b1804b1-48fe5fd55cfmr179726255e9.1.1779292635532;
        Wed, 20 May 2026 08:57:15 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:14 -0700 (PDT)
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
Subject: [PATCH v3 04/12] crypto: atmel - rename atmel_ecc_driver_data to atmel_i2c_client_mgmt
Date: Wed, 20 May 2026 15:56:55 +0000
Message-Id: <20260520155703.23018-5-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085717_498215_13445A3A 
X-CRM114-Status: GOOD (  13.09  )
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

Rename struct atmel_ecc_driver_data to atmel_i2c_client_mgmt to reflect its
generic role in shared I2C client tracking and locking. A subsequent change
will move the client management infrastructure into the atmel-i2c core
driver.

No functional changes intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 2 +-
 drivers/crypto/atmel-i2c.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 2f82f529228d..b06d47babd2e 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -26,7 +26,7 @@
 static DEFINE_MUTEX(atmel_ecc_kpp_lock);
 static int atmel_ecc_kpp_refcnt;
 
-static struct atmel_ecc_driver_data atmel_i2c_mgmt;
+static struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
 
 /**
  * struct atmel_ecdh_ctx - transformation context
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index e3b12030f9c4..30ed816814af 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -115,7 +115,7 @@ struct atmel_i2c_cmd {
 #define ECDH_PREFIX_MODE		0x00
 
 /* Used for binding tfm objects to i2c clients. */
-struct atmel_ecc_driver_data {
+struct atmel_i2c_client_mgmt {
 	struct list_head i2c_client_list;
 	spinlock_t i2c_list_lock;
 } ____cacheline_aligned;
-- 
2.39.5


