Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA18CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fG/8r6Zh74ocis4PYV5dxG4SwOJqWmE0/JuYdwpI5Bw=; b=QzkputWlFEZsIZumrfpsqSddys
	rutngGLqMkPPPvsgoH0h6BneyL9bGKfnGx3dtc1OqG6rY/AQRc++zG8N38jahjHBdw3MoNfBRu3UC
	VA+MYe8HY2Umhh8CtPpKwCoBqT8qLP56i1Pq6iGvfpRfb1UFRRo86FBpKAwBi6pyE3lVL5qL6rtLX
	IrJIReBtWqxniTOKoQjNEUPFitSK/coxcOdqCHgjjSxNulPSU6aUvdX4ls8kLNRF2HSUyoz7ozuJ6
	TASoW/SkdNhObHJ6MNSCE37CswRLwI+6G2BhQJkWzTyF75T99FhekenLgKdWPcGDr6yYtkqp0NLaF
	eFW7ptpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v266f-00000000ZtD-1Njc;
	Fri, 26 Sep 2025 10:55:17 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v266c-00000000Zro-43jx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 10:55:16 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1887561b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758884114; x=1759488914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fG/8r6Zh74ocis4PYV5dxG4SwOJqWmE0/JuYdwpI5Bw=;
        b=EcjjSM9a8KvABBT6E7DocFp9B4VYLY3kjV6T/I4YXUploHSTzx603dsQIxrOE8GMSi
         9WGTlLhZ2XB9bCb/WYIaqKeUc9xN3ggJAasmAzaXj9MFVOkepE8N6GVK7Zm0pHvLZsMw
         057W6OC2gV/vQIbBvJe794WSpJDIccwuxYbc7JMrVBthG3dOzongQdk65kBXmfo1hn5Q
         oZ7rNlJj2PfYrpNSZ6r5Z+KRSxsnkHcp9uFAKKzVyxt7UcV12UbDopUGaHjaE+/2JfUK
         gyNuh08fUzSx54uXGdRBrrsY1MmOJ6Hu5+utn/48XzZNun7WIUffUNHMYwO4A/kPmF9d
         95LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758884114; x=1759488914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fG/8r6Zh74ocis4PYV5dxG4SwOJqWmE0/JuYdwpI5Bw=;
        b=KJ1tnUiLXSusSUkViN8Cz70K1gU2i27k0MzDG+BXw9TQTzgh84m6HV9J2rwFjyXsE6
         h6kvq4Kl2XFlrARz3GjOac62XGrUGgKPb6I6Feip7RDUn8XuaDgX7niRENJWW5Q+cfqv
         t5/5B/s7Kpak67i4rQkVROqRQDwdX6cUadx1CvkxbRJ3RFrN4rlkg5dLWIxsgj8MlanN
         yAwywud2SbXVSHKeEz0Yz3aML2bBiwd/FUfcUl/QK0Cfz2ZKhV35/YJaL+MNSohvXF4o
         S7k3f6AXJfyaqQNe+bn/vP6lTs+EqPXjoDRo/bFvsBy9oR7yjE0wuTJtJDHq10LEP1MQ
         6pfA==
X-Forwarded-Encrypted: i=1; AJvYcCXehFdV8Y1PVrKUUm8oi//7X6R/dRjE+7Z4EP78IMjUJU1xS4a0tF9iPUpEeZjCWu+XFGPlGq/7P1Yw0j8DI8p0@lists.infradead.org
X-Gm-Message-State: AOJu0YyYo/CfZZ+iowlG20nz4rmK+SA3qBHhMFGXNu2h5srBT4VjwCZH
	5KJnJD6Rj74/fY7HUOlplDoMu1RrYUR8ISTSDrvXEt78vQOWPwKyBG8=
X-Gm-Gg: ASbGncv+/q88vv56T1T2zpekIFMg7dbp5QR+GXWulN3tBcuv9rbhLvDQcaPhqv/dn2r
	oZ34EujtPogd0hDa81F+hm21PoVxwqLPoYPd8q4J9IFelYc4HSF0wX+z1ItGZyus8DHs1FLEu3k
	FFvmGwQFXjXay2YrRE9yzgup6QD/aog9Lcv0VQKPqz4dmWN6X5CzkGjy/+mQB7vH+DKI2iVnpZS
	01IAeta/nid7J4ESsS6kQcHSBycNzRjsC6FHx/UIq70sZPGTwba62oSXok8t7121U+nawN/JuZs
	rXjciQrs8OwOcfTD2PwLWIz/4ehe+O2+3eRzsXpmncLQgsDnDECMW6N1R4qqTPq3DjvYNNUWY74
	mknetJ8mnjNxwG6lsUNXU/OK2C2BcTe3TAzmjdoIl2z9OuZxxSaZ9XpbB9YMlYTP2srp1RJ54zw
	==
X-Google-Smtp-Source: AGHT+IHoR6X2imZeXiOqh27AKoNYEtTfZrOufz/4X8jbeOqzZcdMNwoD0bok6WOIEC6F/UDhsBRR6g==
X-Received: by 2002:a05:6a00:8d0:b0:776:19f6:5d2f with SMTP id d2e1a72fcca58-78100fd3661mr6495280b3a.11.1758884113839;
        Fri, 26 Sep 2025 03:55:13 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([122.167.144.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06b0dsm4062536b3a.82.2025.09.26.03.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 03:55:13 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: atharvatiwarilinuxdev@gmail.com,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Lee Jones <lee@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mfd/macsmc: make SMC write buffers const
Date: Fri, 26 Sep 2025 16:24:59 +0530
Message-ID: <20250926105505.33499-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_035515_018682_2B856452 
X-CRM114-Status: GOOD (  11.25  )
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

Mark the write buffer arguments in apple_smc_write(), apple_smc_rw(),
and apple_smc_write_atomic() as const. These functions do not modify
the data provided by the caller, so the parameters should be const
qualified.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/mfd/macsmc.c       | 6 +++---
 include/linux/mfd/macsmc.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8..0f8ed400b986 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -173,7 +173,7 @@ int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size)
 }
 EXPORT_SYMBOL(apple_smc_read);
 
-int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+int apple_smc_write(struct apple_smc *smc, smc_key key, const void *buf, size_t size)
 {
 	guard(mutex)(&smc->mutex);
 
@@ -181,7 +181,7 @@ int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size)
 }
 EXPORT_SYMBOL(apple_smc_write);
 
-int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
+int apple_smc_rw(struct apple_smc *smc, smc_key key, const void *wbuf, size_t wsize,
 		 void *rbuf, size_t rsize)
 {
 	guard(mutex)(&smc->mutex);
@@ -239,7 +239,7 @@ int apple_smc_enter_atomic(struct apple_smc *smc)
 }
 EXPORT_SYMBOL(apple_smc_enter_atomic);
 
-int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, const void *buf, size_t size)
 {
 	guard(spinlock_irqsave)(&smc->lock);
 	u8 result;
diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..3c5467854e28 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -149,7 +149,7 @@ int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size);
  *
  * Return: Zero on success, negative errno on error
  */
-int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_write(struct apple_smc *smc, smc_key key, const void *buf, size_t size);
 
 /**
  * apple_smc_enter_atomic - Enter atomic mode to be able to use apple_smc_write_atomic
@@ -176,7 +176,7 @@ int apple_smc_enter_atomic(struct apple_smc *smc);
  *
  * Return: Zero on success, negative errno on error
  */
-int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, const void *buf, size_t size);
 
 /**
  * apple_smc_rw - Write and then read using the given SMC key
@@ -189,7 +189,7 @@ int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t
  *
  * Return: Zero on success, negative errno on error
  */
-int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
+int apple_smc_rw(struct apple_smc *smc, smc_key key, const void *wbuf, size_t wsize,
 		 void *rbuf, size_t rsize);
 
 /**
-- 
2.43.0


