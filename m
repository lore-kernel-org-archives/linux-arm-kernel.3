Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165B5CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sANsrQm+/9rauufhu0v06B+xNWc+JsN4ukD6rF0U2uA=; b=RQIIwZKhyEF1/K3gJghXCKE0TK
	8NhGI4FuT387mA9kgS4Rg2Lbyn1ChuMWB+ViKw4y1i57+9Z+zd69K9yrYkST9vdF+8umId0b5qP25
	FyvdTMdvzdafM68lL2ncUF3hS0yzH5IDIMiwIufLzaGGjVrn84RA6u8PwBHmxxZ/Q/7NL5ZXdZFZ1
	4tjquxmq5BNeMG5797Dfr7Z3Pf+vXEU6njZaxF98Qk8UueEt6xzDU0qVx2I+Z/Cnati+w99P2W5L5
	7wmtxXtsQgUP+Tjr1OQQG7rOECpCEZNzBsnRDUcUi8yoS/7OaAZOBHIFyCWVsEiqRxBxlVGZ4yozc
	loZIp9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsT-0000000CASB-3YtU;
	Fri, 22 May 2026 23:02:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsK-0000000CAJi-32WE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43d7dab87e1so1005690f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490911; x=1780095711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sANsrQm+/9rauufhu0v06B+xNWc+JsN4ukD6rF0U2uA=;
        b=VJ+8L+B2Jv1OwTvyZwYw577zRv03oE8CF21NkHpik/6tqkJV/GkLHByJI33YZHUzlg
         +bltKQdDVtaesaPtLaof4N5lhzrOvALrXZDJCF24yN5wT6xkY5fnyl3dfFXUVzLXyGj6
         UsMcu+wKsxhmPeFewaxEhc3yW7eN8S3Z52jlA4oKCEfFASeQAQfU6Si+U+c9Wm08J1aF
         K8O2jpeZe95XEk++jJ65TM8inD4w9G/4dEZ+JCUKNzRKul95o/hakMMpwoP8F5BXU74T
         ksk8T2dhY6s9n/g0ux8kQk0Ta7V/oGaeyZeWT5Y+sKTQrD7GwaTBOE4XzwRvH/1rLHyx
         QBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490911; x=1780095711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sANsrQm+/9rauufhu0v06B+xNWc+JsN4ukD6rF0U2uA=;
        b=JmTq4ngtrPsysGrDaSTWqRXlb55Aj05dbiuyR710u39BhDKqVsPC+tF9dXzoG897HS
         F59Z+4ARGwP5o1iIXqVgWmCKQjkRfOxxNxc2xmCiLaWhTaYn1ucNC3wD2a0AVVlxydug
         +9SvHDhJKRukoKa3ola0YYUMoADiEjIXakM65B4VfrbDrfGguTfIftPrvYDkhjAroFM/
         Gt12qSaWZn6XTZVwgU1RaW4sKErrwA3AjfOmOP2tC/mvrlZRrteKGm2GXxVJtA49FCI7
         CQRQIZdrlccmHmMneGaLe/CEmrwxGGCr+q8jBCj//Z2j+GhDE97iXK/M8nEkxRb6FqvA
         MOqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IpZGPGeMbZzzcsC2ZLQXZnffvPBuu7iWqlYXbxN7zPIJPlge+gaYg9yw/yQWD7XlfwOd3T8WdV8cAzGy6jnCV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxee5+Ni/dIIyKsucIPtj9NPqoSXRMv5iNMFgEPOcoJbY/eF83b
	3wqH9hAvU0Wyig2CX5dqInHlOZOMR9kqAGxRllBIRYF27m3Xh62/T9pF
X-Gm-Gg: Acq92OEujxy16Xutn6e5zkgnd91xiBmZejMC50odEstss3xXTPfUlMBwxKll/HAxF+l
	JgeVJ0QInc6c+juYmkQ0SQ7qOWKb/Azk5OuePTsmiP/n6Zdn76o/2OH0Qr7Pwb2CA7MjGj3ylIN
	DOMwklewsj5Zi/0EgITNeaTPALWtI0SGFCGX4vRhKn9+MUnRXObzfMhVX8DI8eFaLf7xLkpc45J
	AobnwnxS1HHQgc67cHCDp0EyZPPLeGA9lcWRcRwXx4+k5k5sjpjtPVP8+UioCmSpWY5VMWISja8
	YUsxNwJ336jSkrM3xXvo3ycEYGkIxzwrzN3No3JVsl2vDXaWg7SZMh9z5BPdmgVL3ffBfA0cPTs
	i3GBmcR+fMLEYdJmhsYPr7kAZRAMuA4Wx4obR+fH62/ErxJrxsjjclI55bavTpQNateBXuw3gNF
	FQ2Fi2BeDYJQhln5k0+TKCha77QgEWyV9smvxBmZUY5uBbOEztKfXWsK/GoVIwmd3Jukni94FfP
	g==
X-Received: by 2002:a05:600c:4fc7:b0:488:a797:f099 with SMTP id 5b1f17b1804b1-490428cb441mr41259825e9.3.1779490910803;
        Fri, 22 May 2026 16:01:50 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:50 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v4 08/12] crypto: atmel-ecc - switch to module_i2c_driver
Date: Fri, 22 May 2026 23:01:30 +0000
Message-Id: <20260522230134.32414-9-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160152_781675_01ACEE90 
X-CRM114-Status: GOOD (  11.02  )
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
index e6d3e6574251..d2490693a198 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -442,18 +442,7 @@ static struct i2c_driver atmel_ecc_driver = {
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


