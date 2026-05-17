Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64A4CD4F4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2Lga/xnkIfsYMx9TVpbPnWyf/7tiVX1IsmYkQiqC5k=; b=fBdQswR4nXOawYGShkRpt1bIPt
	7Ga+h8r1BRab0jhdZx/YRk/nO7/NqTYMEapFnmokVRFLti3lrvoikQurrKFY7ZYdFjrdnmV4ShVrw
	bhANXgRiHGH9dbF+CjRdlfqVEdXlQ/uZUeOWtbdwE6ibjgbrHBdOtfmAVb+/KtPwIRPE4xu3sbK9G
	MumskjeqiXN7GxxDa3e6HCk9l8M6ApEd1R5OyRnAyUvxBpMB8pA3q5SexRRfidZHLTnw6vWx/ofzP
	UlFsVeeUS3SSt+VRlOKu0U7F/ccRbp5xytyq6iht8iv1vswyAIL1JqkL5zGPgbIB7B2vrVtgLq7ze
	L1rIrTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftN-0000000DAbD-1SUp;
	Sun, 17 May 2026 18:07:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftD-0000000DATS-0wCI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:07:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-44ad87a57f6so31176f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041218; x=1779646018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2Lga/xnkIfsYMx9TVpbPnWyf/7tiVX1IsmYkQiqC5k=;
        b=Yq1ADrmbUyvabSAD9VHigsKCjSqxPpsZugJeGOrCv3Z6Sr9PizvXO3kUns1Tq/ngdn
         NpaI0mhMGCTgM5RExdq7crBFiftjjcvDGGCpwGKG/BAjjzU1bTRr4ka3QywrYiKJJqnQ
         TGcJTkQWi8r4vwLW+46lzvU4WEL5aLcqiidCIaOg0xtMsEgI3EHqUFaK/8rDJfjali33
         Qh1h8PFC/vwaydPgWkzh+GJbQV4fjYsHxg/h9JW6Nh908UWDEWgS242qasGN/tQqFc/3
         Y8RVCf6OaqrmCzBxkOwUOW0fk2HyL8NZvqVBXepXMDfWIFM672g55C9VHBWJDaObpjvm
         2nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041218; x=1779646018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k2Lga/xnkIfsYMx9TVpbPnWyf/7tiVX1IsmYkQiqC5k=;
        b=A+ffQ32KOGNP6rPNbKcjFBzi3H1VJyPMidhyRDRFu78kUoqcYE5Zp07t8EaJM96Q9s
         jvVeLEghxbMSH5RPnYm5+djF41k0JikQPdvtOo63EmCkrpHbnJ0h1FuV2+mX9j/A5xZ7
         ZgKJhA3H2y15SRqmItE3c9eG5ForSqdK0DbiQaakscqTSggEM3AJJ5+gDKyJxbHpARrR
         YeT/0bHnTtVfjqfV1KCLzsLxaTF0s+0ClSQcWLzE2DphbgGJ4bJvP7PJ4kO88c43mp5p
         DnwgOVT/7nXjp3eEQXoh/rSNJoA1qPxvyJ1salbSNb/nIPK/48Rx1kp3tBG5owITtmlU
         UZ/A==
X-Forwarded-Encrypted: i=1; AFNElJ/FLidh3f5SikxMX6GPqXRrL53cdxCn6VFyJsGWVIXYmGJizANqTOhwp4PHRKb+DvdvGOQWrVFZIrtC7FxFOw7C@lists.infradead.org
X-Gm-Message-State: AOJu0YzUVhlIkCcRxOdD1ISUsXIM7m63iGw2Cmv926bMcFytm2GFrLux
	0BnPtGxKlsgnkmlSPgg4nRNrSoEwrpWmV9JdUsf/Ys1uVlSvCKSArI5t
X-Gm-Gg: Acq92OGDrCe8+KC8h8OCaPqyuNPQ2hJM6DKzXckwQ93EaZxXXWNy/MxOB4hPgBUrO5u
	ow4zotL6gAQNtjMN8H2ukQClaLf638NygO3QGP/Q7zB76cV/T+hxSEUurjUc9g+jkGjv2Eko1vj
	elbpUIDCFtl7aOhYVZCE/zmHZpAyHAV8I3s8ITH5cgAqgAIRhEEVMqhJi4MMKZ4+0JkDJ4o6xOC
	OKL5h08uBQj9N5Bm/oSjgowlfiiEASa2D1mYjQqb5+CluOGYZKO4b39d9CSzxVbi2Pbe+EqgLJK
	00lF0guihi+6bSSjV0JHK7iJYqXGFbrfPqpkblJQMenkJj047uxwCjzu3W1Ci4YmyZMj07v4wL1
	bFPI545YKRU70Npogj2+iyuw3F3aWgvlUslpp2qbH0SatSHBn0gauj11Bfzj+MgSnlnBOsw+TEp
	e3X+/ObGCNEYAPBO2Zyn7b0ygWu+ueCldR05dHO0kcUXK/1q0mGDDdNPQFNcnpFHiCIBvhvVd6N
	w==
X-Received: by 2002:a05:6000:1845:b0:456:3af2:852e with SMTP id ffacd0b85a97d-45e5c5ab792mr8453561f8f.1.1779041217551;
        Sun, 17 May 2026 11:06:57 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:57 -0700 (PDT)
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
Subject: [PATCH 10/12] crypto: atmel-sha204a - guard remove path against missing client data
Date: Sun, 17 May 2026 18:06:37 +0000
Message-Id: <20260517180639.9657-12-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110659_266853_9BF2E7A1 
X-CRM114-Status: GOOD (  10.70  )
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

Retrieve the I2C client private data in atmel_sha204a_remove() only
after sysfs cleanup and add a NULL check before continuing device
teardown.

This prevents dereferencing invalid or partially initialized client
state during driver removal and makes the teardown path more robust
against inconsistent probe/remove sequences.

No functional change intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 613ed5e7b3f6..923e462ff6b0 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -213,7 +213,11 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 
 static void atmel_sha204a_remove(struct i2c_client *client)
 {
-	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
+	struct atmel_i2c_client_priv *i2c_priv;
+
+	i2c_priv = i2c_get_clientdata(client);
+	if (WARN_ON(!i2c_priv))
+		return;
 
 	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
 
-- 
2.53.0


