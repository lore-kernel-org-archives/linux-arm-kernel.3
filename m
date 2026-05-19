Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569BBCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iv91Yr/xdaF4aAKWiyJjatlZadYEBC7HnO1idj6/DU=; b=eSheajwFO8rEhyViP+UgroNvXj
	X2BGg2bDFhn4Impx6OZgGsdbCXzSUAhKntVMV6IEZASzp9VyQf1YeTmNcvjhMrCF0rLQDRVKtnsSO
	r3n6Y9n9tH18UMD7KyycxjgGFXiZBXCvEizB4j1i1NoyB/+0Puyid/ySURde7cK4O9uSnkZgMzsx4
	BEGqmlBxUsQWlHsqeS0mCjoo/8kWB1lmoiVxcVWCs39clrewoLZ/zXmsnLaJGhch1a3s5oe5Cks2R
	cxVwVn/hmFLp6PQ1GzpJPpJvY38wOuuX0EQ8dNqiwktkVTxHdHOmVOY0JqoAAtRX1CuFFr8NoKV/8
	rl2uqHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMe-00000002lON-3lHI;
	Tue, 19 May 2026 20:48:32 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMP-00000002lBQ-35Xg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:18 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4493cf2f982so250119f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223696; x=1779828496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iv91Yr/xdaF4aAKWiyJjatlZadYEBC7HnO1idj6/DU=;
        b=NcpLnHhPcQnX+hCSQd30tixQPtrBvf7JZUmf6csO62+EjhkEtydpnca7FpTTMy4ZYd
         iY4w2IXhA0qQGHq5OcQTYKVgmrdGTlkLwqraz2xZxEwUeh5lbfYr4TneJJ76xUfXuBSt
         ENRBLaW+rAHKwE2nBsioCowAtBmoUD7GbrY5plrQsf1jft2SO2QYyA6byweY3xBgcCBI
         Egp7z1tLwaVfCPr5sB4bpebC60PkICgySKoZU4/WUybj0rLqBsMsNAewgeOzSaBuvKYd
         gppaMI3e/aq8nOuqDLpXYv8AVhNlESWTiaOO3bi8QUcKiRGe7WGRt/vBR1/+HORSmrVk
         QDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223696; x=1779828496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0iv91Yr/xdaF4aAKWiyJjatlZadYEBC7HnO1idj6/DU=;
        b=Yyu4OQE7t+MelpSxMCdwEOmejmM7Us6zYTT+fGGuj0ttdzIHDFTbspeZGBOV7LMqMd
         EgwetIiCuhD/ImX1zZN54W7SR8Uxs5AR0P2cwdk6ungTKBUm/s0DEbNmTh3Ycg+i7Gk3
         NPqbz4V6wgmR3aW4pFJMzJOY9BUebMkxa3M0/5g6yio9QItFF4D/EedTR3VzpW3muk+8
         HIfQvNSlyAivIhc6sVtbkY1XIzMeQIVGFJpvcMkxL3yMWRQKsbV/NRnZC45bp+japzjZ
         nMyvR0l+GeUJyh4GbdSqXdsYAVrR4H54t4j0rz3X9e8ZqVQjAaQ/JdngubdpYfe+UEyS
         M3Kw==
X-Forwarded-Encrypted: i=1; AFNElJ/9GK5kthApcoUV1S5cQ1wXzE9bprVetM209kKwFs4/6zV0+SG2ZvYscMHI/UjJepFnAwbk/HAd98cjglSPnf74@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcdu3xWJqJlTLfXk95tZa0eN62Wu44Ds+I/bC+mak8B4eGnbEp
	ewWVV9dSkjUtVPxYXgsUYbgEUISLHGH2QxhgRWdNZhX4YzuaWT5sZIwA
X-Gm-Gg: Acq92OGxba9SgxSXlzGzhbzbmDDRC1kX/nXmAebIDcwoD5E+ovHwfmZmabNzza9jS5V
	4J+OmiyNWB5WHTBzhB6ffi3utNjysXuNfMZc25DAqtqTYNp9EomRR9K6dfga4X4098DjYgm2E5z
	HrJhvmxH9u3XAk/xQHsTDzKPpw7q+GKbM5YON/Dx9x+tKHEUiFRJXr9TvHpy+QtUYTw801l5gNg
	fB1rUji60oXrs7ZuvS5S6pIxj73r3R3M1fzf+/E/W2fNy/E1yZjhEpGX4hMzO2e04/kIJPB3wcP
	p4gVyFO4p66zMxeaLb4924KCv0monZpZuOO7Ky1UAY+5N8xwWaJTYzXbgTbhYjwjeTn8ZcY1bIA
	s4B8kQOAkLyEH80XLRGCHjMMy6V7kVB8/uDfUrO2kc8TJMMydPpn1koUQJKKEUTx5S4yCeIo/L6
	lSFVbaM3mMeaQqb30XKI9nzf9D6J6jWNyriBQEJPWvdDiMXQKVlZ6NHVtGuj/fqMGUpkWUNTC4K
	g==
X-Received: by 2002:a05:600c:4692:b0:48f:d410:6072 with SMTP id 5b1f17b1804b1-48fe6302a9fmr178240165e9.6.1779223696104;
        Tue, 19 May 2026 13:48:16 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:15 -0700 (PDT)
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
Subject: [PATCH v2 07/12] crypto: atmel-ecc - switch to module_i2c_driver
Date: Tue, 19 May 2026 20:47:58 +0000
Message-Id: <20260519204803.17034-8-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134817_816765_C9D936D7 
X-CRM114-Status: GOOD (  11.88  )
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

Remove custom boilerplate module configuration code and convert the module
init/exit paths to use the modern module_i2c_driver() helper macro.

This shortens and simplifies driver initialization. Custom structure setup
is no longer required here since management tracking context initialization
was already safely moved into the atmel-i2c core library module.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 29706e4bfa04..4f27e1caf106 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -401,18 +401,7 @@ static struct i2c_driver atmel_ecc_driver = {
 	.id_table	= atmel_ecc_id,
 };
 
-static int __init atmel_ecc_init(void)
-{
-	return i2c_add_driver(&atmel_ecc_driver);
-}
-
-static void __exit atmel_ecc_exit(void)
-{
-	i2c_del_driver(&atmel_ecc_driver);
-}
-
-module_init(atmel_ecc_init);
-module_exit(atmel_ecc_exit);
+module_i2c_driver(atmel_ecc_driver);
 
 MODULE_AUTHOR("Tudor Ambarus");
 MODULE_DESCRIPTION("Microchip / Atmel ECC (I2C) driver");
-- 
2.39.5


