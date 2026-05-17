Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35F9CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msTE632b5gRHZXchhXxhyfIjZMxg97RrD6+uOCX904A=; b=BeNVWjrhuc6V1yt9rN5OoMOOA4
	JONZpF+z6owMMCimQYf9dTSfxS9eLLJgN55MclNILRWCmAbhIXfdi+9Vx/P3Z0hLBxE6rKL7QoV59
	wKQDgtWCHVIFMc0bvtyyc2k1sQIThA6HH8k6U6lMnUKE4EnzG2Ea1G/6Jir6JsLuwIUpVU0ZPATE8
	TTmmk9yDHr7VJN8hDQiGE0a/3G/BzGf8swK+eR0wh6wP0zbKwNVlXXgNr58isxLhA3fO4rhDDUgDg
	f6Ue0ALwfg4GedHiAiqvF2eXn8phZA02reMNpDOzG6Q4ZYuxVwnmQ9/4k0Ju1nGYQAz4mAkjUYnPN
	wzflgXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftM-0000000DAZz-3s8P;
	Sun, 17 May 2026 18:07:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftA-0000000DAQc-0wDC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488a8f97f6bso3337745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041215; x=1779646015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msTE632b5gRHZXchhXxhyfIjZMxg97RrD6+uOCX904A=;
        b=iKVAsIPCc/U2V0NiyTQm9dk9yZvysbycXHY0BmExJz/BfhjYcgBDfw9UaZorWlUeln
         YssPwDj/acKR+oVTDdyS4NcNmrpGj2MtLtJ8YbURvE+0Xc1lHm1PhjyYUEXZuYnGFEVI
         0FnCtEt+Y+NxSUvp+aewjt0OiHPOIqplHETCS27rbiY2W+QsK5hxCYq2g+DYdclkib8o
         aQYZIuuMzWMYYw9eCCdgSscrtl3L8HfOI33PWDQW5otkRKFf18jZlRzQY83D/GmDxgVe
         p1YZC5kcBNLzn/bkA45j7TJwOFNDNwcnH4tC0sa6I8fHGJOF0QD1VWjXyzcjFmd33b4H
         /rUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041215; x=1779646015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=msTE632b5gRHZXchhXxhyfIjZMxg97RrD6+uOCX904A=;
        b=gGoDVDJaou2lqfJM6sV9hBHJLBqIVU+vLrIIX15P4oq0GN5KUV/IINJYDVKhuqPeYB
         OvE+hSvsDEGidGoybv8rOQZh7tgBfA3nTqFQ3bRkuXMW/Adb0Q5XeLUmXkJ9nCsn/ecJ
         adNKrk8ILSju0IqOqfHquCSKRNQDpxwTIYVkrod7bNtY4nxSw1f/jXpPKkieJBZ2+DMp
         glgN65jGRDFhlrYevv0MrHk21vnqbUapOfvofUnoh3VWOuflf/jbB4szMUkXrEUsjHhA
         ekbRBkOyTiYl+CHiFcg8MtyEqzMVTtcvUK6eQNoQRWoC5SZpwy/kTrSJh1fYR7Pd3sLr
         OsWA==
X-Forwarded-Encrypted: i=1; AFNElJ/QlNpT77tWjRRNyRByye4OZk0dtEqf76kbDohqangJEeZGq4MNWZ14Metsg+IFVDZymNA9CmIhFJONtOR0XXL4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/rEUv5/brj5oSuCf8inh9Qy7fRw9H5TujwkejG3YUpTymVOlf
	TGVxndcTK5ZfyKbT0kjS+z32wXY4P4++ZlozQWyzgoGM70KA4yZ+G0Yj
X-Gm-Gg: Acq92OEB0oLYTMuiG4lNlTQBL7ePztt3+cE+n4qLtiLluhwLuTOmBygdbL8Ntjx+9u0
	1jpJtquIa3CzIhfYlj931QDbm199duvbYSLQDc2CQBb/DHydKK2RfUIGpkEXL62RLen1l8Ky3iO
	koeuHwVIca82+Nwameoor8VCFjYeK7567I+St9GCOA+tmAzfHaEtA/n3K9uZZ5cX65unVPkyvBQ
	txkzG+/dI+c92RJxK/y2azllA17ZECcW5K99Uzema34NvuFtFRZyF2O9Huz8mjs6AEcwVSYpv5A
	ATWqRINNQYGoPyzeqoHLGQgwfwADm1l8+UA7gf5O6Mn7RCcOC62vl7owuJ1Nvg7+nRuTO2pTMhy
	olO6QZVv2D5+B8S/lAeyxaUr9QqZZyGPv/HrmUg/EHwwgPMwaUbKXulqCDmhMwxZYLPgQaqsEa7
	yE/Sn/6Io1C0qwaXHA5QsxGDtoPfPuyjJmwcygjrLw2HHqqmZRglASZazZHAnK9/g=
X-Received: by 2002:a05:6000:4683:b0:45c:e615:56cc with SMTP id ffacd0b85a97d-45e5c5edef7mr5526552f8f.7.1779041214493;
        Sun, 17 May 2026 11:06:54 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:54 -0700 (PDT)
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
Subject: [PATCH 07/12] crypto: atmel-sha204a - switch to module_i2c_driver
Date: Sun, 17 May 2026 18:06:34 +0000
Message-Id: <20260517180639.9657-9-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110656_788693_C32D7F3D 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
 drivers/crypto/atmel-sha204a.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index cdfdcf2e43a7..613ed5e7b3f6 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -216,6 +216,8 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
 	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
+
+	atmel_i2c_unregister_client(i2c_priv);
 	atmel_i2c_flush_queue();
 
 	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
@@ -246,19 +248,7 @@ static struct i2c_driver atmel_sha204a_driver = {
 	.driver.of_match_table	= atmel_sha204a_dt_ids,
 };
 
-static int __init atmel_sha204a_init(void)
-{
-	return i2c_add_driver(&atmel_sha204a_driver);
-}
-
-static void __exit atmel_sha204a_exit(void)
-{
-	atmel_i2c_flush_queue();
-	i2c_del_driver(&atmel_sha204a_driver);
-}
-
-module_init(atmel_sha204a_init);
-module_exit(atmel_sha204a_exit);
+module_i2c_driver(atmel_sha204a_driver);
 
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_DESCRIPTION("Microchip / Atmel SHA204A (I2C) driver");
-- 
2.53.0


