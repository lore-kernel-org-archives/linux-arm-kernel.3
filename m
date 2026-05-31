Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30FECD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 19:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZLcDEufKd/fZiYywVbHN7RhFQw/ohUiqZvEj+O+eN6o=; b=KoTRqFm62DEq2gjt2wTHMO2N6X
	DoMZ3B//h/Brcq4uGYd09z/KrUm8ACHtbe/xhg615gIWZIRlQqdCPLla40it4ZNKxzAFBAXm4IZPP
	vqdIjrUUi+s6e4xfst/0vb81PLC3Kpdy1caYGlqWV8P9L4NgnxDeDBC6pkJEIvVaxzTlwolQnld94
	xJx96sBE3hhz98HuxOFPZXs+vG4mzx/oryHvBjBMFEnmV4j8GR4CpO6NglveyMhhMsm71OeDOJrol
	+tXgFPhDUy/sCpK9XTGfg3PEhVUe//TeND47zOed7p+GdY+6fGLQ7hcfE4645IdqstKniaj4f/tpQ
	45pjlI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTleW-00000009qOi-0h7h;
	Sun, 31 May 2026 19:16:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTleT-00000009qOM-16Yp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 19:16:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490227b682cso8456945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780255007; x=1780859807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLcDEufKd/fZiYywVbHN7RhFQw/ohUiqZvEj+O+eN6o=;
        b=ig1EbodGoBYSb/hlAOAD1wXhRq0kBMqZB9wzm53UVn1Rl359/k1DlPtkwKXcTMrEU5
         H5xYKqXA4DjS+CPQXWVqnP1AQndlV/g4lfLLl06dEV5n5fVHHbCsCEmdoui9HVMXF0Cj
         HgWISZOJI1AqAeeh15XjwNhCpjJLOVHAMEF4dQNMJOct+rUeRV5ceBnzABOqqrILC70/
         v01q3JtacGZBlK9OiK6SiduUhlWY95mZk5N4FS/7w/eh/+WNgf3mb0LDzDFTec737ByJ
         PhjXppbUSXJyXhOFfZjwRVN7PVZfKqj9Z60xbVvbSAyMMTgoD8NIBPo5xM51TM14+/fh
         H2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780255007; x=1780859807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLcDEufKd/fZiYywVbHN7RhFQw/ohUiqZvEj+O+eN6o=;
        b=Bf5rR6oPq0AhLQZ5+LkS15I8vjLe1uUhGxKqZ4EpW+qzig0nPLKSEYUx9vJeuzFtDz
         17nEdg4jO6UjcHO7o70RjtIuURvdigL7SBM1YPl4Md3AfyRCbpniOh0FaGd0gglUAjre
         Gyc/3PGUMyjvaW6HP8kIMYzwE5b6xAnwhy+PsjxKekkxQfLFJvk0wrq2jkHZbCMvTw4b
         rk6UR+4RGOlUj7E3cpN7woX5FCz8nXdVLCeTNA9V/ofxQfHtdyGr/Dqg7LC76CQcdkoL
         aVycU4wSGFP0PAQZ3XIdevtGJSHrRcXGg7lWoT3b1SHsons3KNN/3eiDGZY69AVCMpoF
         P+Gw==
X-Forwarded-Encrypted: i=1; AFNElJ9btF9l6t+yF5IyLbsJSOAC6ddQ2KhwlKpR2oeIPc1friePQsyUCKqWYx64PDCk7sU0lmrLaUkxAU0oVstCbcFD@lists.infradead.org
X-Gm-Message-State: AOJu0YzXMOMe5WuYO/UeD7jInL7dxsovtjN7OrvOzDXbzl+RsjA8QJRk
	cKeNTA1boJqf8YDwNUrDRDUYXloYN50wQnWvx/TdpS2Zd4uZlb9t1w1g
X-Gm-Gg: Acq92OFKXXj0f1C7Vfplxs9n6VCXrX6RJl3U9MWhjTcAm6AroPD9C5WjUpTsBrAmYDJ
	vI5cXBuvBvoKNHJCwD+lg0zyssX4yMAJluHAiiGhYLX7c/qFAtJHzdV+HQXUoWMOtRb7kYLMoVx
	hq2EcKSol5U3c7j4HDW9ZexaL3jWyopb0aU3AJq9z7dgzR3LpmxEjUluKxKKeCP/5vQpfdIeVwr
	qPgIsCHCt/arAmBueJCk/iaUOoVOXabMBHZcdfWsx/WVFZQIwXoDCvL1RpKzJoVJbnQpS5Tr4rI
	ocxOI1h1mNq9fRSCdqHdeQmdu6k8w7/rgnDyGb3+9I0sBuuefrIm6l8AtRuhStETiUjCLNnlx1m
	dLzYh8IXKl9NDqeK/xL/7fV1AW+epOqebKQepudazTEoltgtBb99N6bgXOxR4zjtByHwbVXh7MP
	jUCuny4ZE8wRzt0ifwCk6arwyJFx000YumY7jkgWnY1qmfhQ0WTrgSs893Xj79UrLFNJSvIf54d
	A==
X-Received: by 2002:a05:6000:4b1e:b0:45e:9520:d73d with SMTP id ffacd0b85a97d-45ef6bd3cfbmr5328250f8f.6.1780255006822;
        Sun, 31 May 2026 12:16:46 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0674sm18142189f8f.8.2026.05.31.12.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 12:16:46 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	ardb@kernel.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v2 1/1] crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
Date: Sun, 31 May 2026 19:16:42 +0000
Message-Id: <20260531191642.33827-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_121649_321591_87196627 
X-CRM114-Status: GOOD (  14.45  )
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

The nonblocking RNG path allocates a work_data structure to track the
state of an in-flight asynchronous I2C request. This pointer is stored
in rng->priv and later consumed by the read path once the transaction
completes.

If the underlying I2C transfer fails, the completion callback is invoked
with a non-zero status. In this case, the allocated work_data is not
usable for producing RNG output and must not remain associated with the
hwrng state.

Previously, the failure path only logged a warning but left the pointer
state uncleared, which can result in subsequent read attempts observing
stale state and interpreting it as valid completion data.

Fix this by freeing the pending work_data and clearing rng->priv when
the I2C transaction reports an error. This ensures that failed requests
do not leave residual state behind that could be interpreted as valid
RNG data on later reads.

The explicit clearing of rng->priv in the error path is retained as a
defensive measure. While it may overlap with existing state handling in the
read path, the ownership and lifecycle across asynchronous completion,
read, and teardown paths is not fully localised. Clearing the pointer
ensures no stale state remains after a failed transaction.

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Reviewed-by: Thorsten Blum <thorsten.blum@linux.dev>
---
v1 -> v2:
- Reword commit message for clarity and precision
- Keep existing error-path cleanup behavior unchanged, update commit msg

 drivers/crypto/atmel-sha204a.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 4c9af737b33a..20cd915ea8a3 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -31,10 +31,15 @@ static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
 	struct atmel_i2c_client_priv *i2c_priv = work_data->ctx;
 	struct hwrng *rng = areq;
 
-	if (status)
+	if (status) {
 		dev_warn_ratelimited(&i2c_priv->client->dev,
 				     "i2c transaction failed (%d)\n",
 				     status);
+		kfree(work_data);
+		rng->priv = 0;
+		atomic_dec(&i2c_priv->tfm_count);
+		return;
+	}
 
 	rng->priv = (unsigned long)work_data;
 	atomic_dec(&i2c_priv->tfm_count);

base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
-- 
2.53.0


