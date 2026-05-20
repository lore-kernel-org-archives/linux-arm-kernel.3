Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462F9CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2r8ZfbeOANY+fmktsmJzHagukEdKQO9jPLOS0KSMVw=; b=aaRuzqst2cDvS5DG181baXZ/6x
	OsUCfJSJo6wmEhr9OQvORmJ6HPDkXQWw3NVEuegqUFcRsscX2XZ2IVfFsf4hZ4EDp/Fs+TKwPQRGu
	/1ID2RwbYSlOXM7L08nh/FMjFKPrTyr1XEct/aDzK8fhy5COEJLBvF+kfk1FWlahha7J9Er02DG/Z
	frM/VpqgFlMJnHb5bG7V2B3oIy5kJMDUmiyxrx6OF41pFJL+xoHU+NQqlj6DuZ7iiMEsP7M//wx0N
	C1lbJtnwoWrWigCWn99ZTqX617XyCKKU9deOG71Skpy/zJBwsi4uhHpvyF2uHp9gtKByfMb/Yo3Ez
	ju9837Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaxS-00000003jtJ-13hK;
	Wed, 20 May 2026 07:03:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaxH-00000003joN-1ekk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:03:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so52930075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779260578; x=1779865378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2r8ZfbeOANY+fmktsmJzHagukEdKQO9jPLOS0KSMVw=;
        b=CgnNVllmXi/SvAZfqWWhHW6dzmmy8b3ujrYQjP3i+C6tjpk9R0kd8mpR9owJy68kz+
         zoc+LLcFEJhLEz1EerUC89hr95szozzE28ySJRggnk6MHqJWnsYvQJlamFtyV3AGk0HF
         ERW9qmWPhFdgef+lG2/1jExrb/CovvzJ210l2J7KYQlqoKPFKQaKOiI1Ck0xfXH5c0+3
         MD4m4N1ajTldLuQiwJqeEPdh7P6dej16UeGV8+c6o0XSXUrfF6RNUeTA7B8dxXC3YdZZ
         BKL/XUp07fi0cCswPtrppvkuePso8FQA8voben/9DbZZUIIocsXNuMfhZyOkHeyy7dHx
         3jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779260578; x=1779865378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e2r8ZfbeOANY+fmktsmJzHagukEdKQO9jPLOS0KSMVw=;
        b=MeSXA+mLkqXKd5C7dyP5l8HU9Sqd5AgxKXnsd5SvAgA+g8TLZQyFG5tgjVSbB0dKse
         rnEqgOTpX8aPbcObMimjJMbPzLeVpfBiKop3PcpQHuClRmwbQ9J3EJ224Bq51Om3ZqCj
         R7LFjlblw7IeQfGmqgTQv59hx2WVzMYu60vDD7AsZzD87sOjuyElkvI5gB3OfqzwfCmh
         I/6b0Ua/1ejuvULz0QWzpcKeD98FEoP33ZRJbQR3sxgbSVZf0+AtrQthswaNWUsj0+OW
         uXWHMmSIxa7tMyXyH0FB1cARhXaEo5Y5aCElTMEd6iCxXo00YlF3AnNKyvN1FKf1uccm
         bwvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wcFQD2lgru8ml9FHour49KIGQCoNJs+KzTFLVMHkbgKUheYkLB5GjdDsunhDo+dmpWF5WfIp3w+GqDIkyEswT@lists.infradead.org
X-Gm-Message-State: AOJu0YyqreaHKYakNgcxCbAlWYCra9diuajlXdesrCeJK39eZqRbCgET
	uOllmhOY8J5bB36cDe/gSPTKzjC7pOK6K+hIWsT0EEFJ7TxBwdz5uzAbr6MB3WcYyK0=
X-Gm-Gg: Acq92OG/RKIqTD+h3q5/x+LwiHCKY/4lzxvNA6NizX39LRc2WLWq3g/JTUIHBzUc4gM
	imdW/DQ3iSOvG5I+BQ9ThzFaAUbrFbrzPxbG05J0FitMdf3qvZ4HLAuT2VUixIkB1Ks4KXvH5qZ
	5Uw13jAoWr1xk7WV4b0FQwXbsnlPfQU0Jl/8Scm/mOcxR8wFcRT8wULJcQdZ9/hsSAMhWqxcmFQ
	ZL3SOA/oO+rosjH/u6Wrnx/Mnwl0KTnBUK3Z6ig9ls61C2zeH+Vpb9OXdR91BCBIn/L2MswedBL
	71g3+c/RcW7RronX0Q7dGhNeIn+IKXbgKQva+erDfFS5aajcIYMqWYigwlHP10MSwciRGWv7wr4
	5hM+Gxn16V5aI9RbjiR8ajrJbzYKgmBTNWxybvLuohujnhvy6lyqNPQ6sVzotvS1hQRdogyS2PH
	Ah7vjIBA2IO/EZLAKFM4EDVnWf1xcSt6uayqYBbErqtl/5yYf4Nut+/JuzB5wL/D+POM+/ILptG
	2pqMGycwVBMnaM=
X-Received: by 2002:a05:600c:3f1b:b0:489:1c5f:3a9e with SMTP id 5b1f17b1804b1-48fe60e7fa1mr350925945e9.13.1779260577642;
        Wed, 20 May 2026 00:02:57 -0700 (PDT)
Received: from localhost (p200300f65f47db04a02ef40d8e5825ac.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a02e:f40d:8e58:25ac])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4900c16c744sm209846985e9.3.2026.05.20.00.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:02:57 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] crypto: atmel-ecc - Use named initializers for struct i2c_device_id
Date: Wed, 20 May 2026 09:01:30 +0200
Message-ID: <5711bd2d85ba402b7185f181971fd8a88e27b93e.1779260113.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
References: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6sHnZ7ZDkZwO/ELA32fLjOM2FmreNobcp5iTRFP1biI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDVxRwXjR/8wFPq0ijLyNy55GxgoYBTKHbOY36 ppHF0wfoeeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCag1cUQAKCRCPgPtYfRL+ Tjf+B/9w8fF0Z+d/3nEoVS7IKcFvfRGIx8sDafLeNK2XmWasfB3mIYSs+Q5iDqoCDCQmt5ap200 nVoHFy/+28/LiJXCnGIOVK5XD0JOcu0mCfS/qfuMSAXhGDEGOIREPYW/jolkPOXyGwUDqzFw1tC GWIdDkF0xkXciXakvlhZ2BNqXIMlAMKwJLvLS5+DaGfR0ihqgCPJFfOtSObMOPCDIAziqCNe6MZ ajwne2qSW1SG57U/NDgfR1OemzWQLsIOaalbHlohvBZIFGrByCZsYv2ffEf51mrAsGKDIUgTa33 R53syq42tDq9MF8o4JWoQcy+PmSJZZDChKecHekAi21iduql
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_000259_446980_3766F073 
X-CRM114-Status: GOOD (  15.77  )
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

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled array, only its representation in
source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/crypto/atmel-ecc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 9660f6426a84..0ca02995a1de 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -376,8 +376,8 @@ static const struct of_device_id atmel_ecc_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, atmel_ecc_dt_ids);
 
 static const struct i2c_device_id atmel_ecc_id[] = {
-	{ "atecc508a" },
-	{ "atecc608b" },
+	{ .name = "atecc508a" },
+	{ .name = "atecc608b" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, atmel_ecc_id);
-- 
2.47.3


