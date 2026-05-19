Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65C3CD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yTt0exYCuTu7jCoMn14Ieq943zuwmtiBW2wGq9ojPY=; b=USuto0fQPSKLCdHgZ6yg53Aerm
	7L8s1dWdSRgxpW8W4LwiuaSZ9yYlcCfA68H9T8mb2MXqXtR7ozHP325w7Xn9RtsR6wewShJjB+dsO
	Skm7uxmGRBSBFvikkPjbD9BKJeSTn0FKeFvtSdthSprlwt73SBxuvfXG6oxyUVST3bY4GYBZeR1Vr
	5FehikvMlhaSrrkfzSBqbLCXHBbDtaZTioPdesx4ExRPgmbT1ND35ynCdFMXdj0ttJK6NU+EbXG8S
	2HeFB+k9QOYIyspwGp1tMtMI5/mHGA3lrOBureuyKtvUtR0U3kqbVG0/Zkwg8FImtzCQtxymTiLHV
	CcPpEIXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMg-00000002lRB-1Mx8;
	Tue, 19 May 2026 20:48:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMV-00000002lGj-0vUO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d7828221bso225318f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223701; x=1779828501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yTt0exYCuTu7jCoMn14Ieq943zuwmtiBW2wGq9ojPY=;
        b=jOMb3kjnN+pQ7N1p8xsNwSzp7XFv86O7pLP7Zwzse80C5BWCNgujyJI8t8vOcy6nL9
         5q3StLsYWHSkGJ5hOrqCuBX9wq1NWubmS1R2O0eTU1yrHTlRDuC5PWG8+i2n4Ao7vcd+
         3vwWaDo7FGQwVmJ1+XEEHYaowzHBjtuPzAb8JZiUl4ZL6lGEPtJaZiI/lnLf7vaw7rOy
         G2YMlQ+uTa9vXHybdaFdJrb0uV72+Sl03njCCaNdaFolFwL/bX4zKRGrMiuC+Fm7e2YQ
         ARQHCHY/6X1HEiRS7evtXp6iMF0e/621yutj+DsEyZfFyaqe0IGMRknYB/x9E9dM2kBG
         BOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223701; x=1779828501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yTt0exYCuTu7jCoMn14Ieq943zuwmtiBW2wGq9ojPY=;
        b=PMi8eWzatgpEXWB9I/kZvFv1KSLg+Q3GcHAJYfTdYrgj+1W7aCjsi3MNqIRlsC+evw
         dFlPS9Z7ItWQdR3/r3NNkQFsHGJCk+ELIGh3X4bCcHbYEyf2l+f07HMvg4kYBaajXYmc
         2RuWDaCoc3HOskVdvQypZFu6Wpin+2FFCc07wKFRSQfy9A1oZ88HSMZlkAxATOUMgx3y
         x39nbnaYvHhXS8Tw7ZRAdl0LMA++UvynSIktUSOilcMVRh32VkJt8TQwFY6AreX1BW3A
         RtDJ4HDwwbm0BBSQI0OzlP5mjdgKHgUny5SeLil390P/CMbnXRpYjyEMXDyiUU2f3B1C
         pxqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BtRWgDXJRefypSkqUN4SKW61jx1Av9Wc0WiVM2O5H5fienvXS5UI1tCxL8lqfLiUX98rfqugPte7lJm1DwcM8@lists.infradead.org
X-Gm-Message-State: AOJu0YyfdnNf38AjfvCT0uIOuJ8o3ihSulOQBt70epq0mRnM55eBLC3X
	392LT0k4DuPF0qqt3LsBOjd2PoX+hoNXJ1viGZyU/vBtuOyMAqP/lMne
X-Gm-Gg: Acq92OHODb+Bvk0BUPeKN/2H2EdgQaa64l24miE9OAKpNq2AmiOA5SRbf6DQGYh+uDJ
	6S2o/QMWh1ChpoQGKt2/kdG2FsveTknJyULrxApJ9lYG7TfYk+PVomcW9SFC4a+ZoTjpOdnI0W1
	BjyWkhtsTvckt/SlhZOVjKJkVSabWZIsv8Ibj9VdD2Whz4r2PruwGYnqrmCr68EG+yZhZkKl58V
	EDl/IhiVUZ8LP4iMUsIJ2BK74beisi+BlidQFpNFhuHdKXYHuKjWMPUI4pknJmASVODIFifWL38
	gHIn5K7Gd8IA2ZSRSupJGMGJpcuAo3y0DR0dkOMvlzlgifFOwtNsgVmFto4TueSfdij/ix2CWRi
	YtGLEozxcwwGeEWsBZAzS76g/V8NfkvCbJmwtyPXq6xoWNDhHB851Bs8dzljpTnMQRCzDuhungy
	/r8uma7Y8kfeqFP+9s/YIGdCk1BGeAci3PMBMCRpyBnTJRB0g6+QGXVW+3DHyI/LGzKrVUCwSpi
	g==
X-Received: by 2002:a05:600c:4fd4:b0:48d:1021:e5d1 with SMTP id 5b1f17b1804b1-48fe61f717emr143199075e9.3.1779223701114;
        Tue, 19 May 2026 13:48:21 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:20 -0700 (PDT)
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
Subject: [PATCH v2 12/12] crypto: atmel-sha204a - switch to module_i2c_driver
Date: Tue, 19 May 2026 20:48:03 +0000
Message-Id: <20260519204803.17034-13-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134824_223416_696382FC 
X-CRM114-Status: GOOD (  11.51  )
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

Replace custom module init/exit functions with module_i2c_driver() for
driver registration.

Update remove path to unregister the client from the shared I2C management
list before flushing pending work and cleaning up sysfs and hwrng
resources.

No functional change intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 3d29543032cc..c65630a989a5 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -257,18 +257,7 @@ static struct i2c_driver atmel_sha204a_driver = {
 	.driver.of_match_table	= atmel_sha204a_dt_ids,
 };
 
-static int __init atmel_sha204a_init(void)
-{
-	return i2c_add_driver(&atmel_sha204a_driver);
-}
-
-static void __exit atmel_sha204a_exit(void)
-{
-	i2c_del_driver(&atmel_sha204a_driver);
-}
-
-module_init(atmel_sha204a_init);
-module_exit(atmel_sha204a_exit);
+module_i2c_driver(atmel_sha204a_driver);
 
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_DESCRIPTION("Microchip / Atmel SHA204A (I2C) driver");
-- 
2.39.5


