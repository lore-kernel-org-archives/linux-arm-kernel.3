Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3611CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 20:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2h1pIz+Y3QiNp1EUEItf+otEd0xBBWZpK67JdzPkqGk=; b=IxIsAyzIiDdoshqhaqkuodFiyO
	yo/MzcvIuhIXI5+uMMfGQnnJ2f6UFeNdfptT0+6g8s/Jj959wuavdpkMErW6F77eQP8fW708aTLHB
	f4B44Bfc/cfVs9YWzU9zOQmTTHZeBpgJ1Hw1E0cnW/+8Uf2KpRDrqs7mkDMAIx/R+D+Uv0Pc+zAUw
	7j5CIc/I0UhZ+8Kg/+6XID7vdPWHOU4swgD6En5YPSf2MWHxhs+CZq2Yd8oGh2mKlOg24RwhZOG1z
	1ZzTktvpR2uLd3FoRSTTCF9aQdKN6jmRB/cS+UxCc9wrepuMYPmxOLqp0uk2G45sl3Ju1gw3zKI4V
	pQ6WKr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYUqT-0000000CX3Z-0qyL;
	Sat, 13 Jun 2026 20:20:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYUqR-0000000CX3C-1Yan
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 20:20:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490c28f84fdso4690285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 13:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781382041; x=1781986841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2h1pIz+Y3QiNp1EUEItf+otEd0xBBWZpK67JdzPkqGk=;
        b=LgD21BILc2TnTFYrljOqCcPhoWKjqX9tLK45Y35q6kADkLY9HuaR9bQ6S1J6dPDQ4G
         2wSlx7ZjgKbvitxcBkXbtpOCFCGsz1xT6v3ZUvxrG2hHbPIpTVrdS+O4r9KzyW9BJZiG
         YVd57Awjm+D0QUV0u0hSOR/Kl7DvCktwa4NoGCimStSPKnyC2mRe/NDqxV7Y5kFpDV50
         FnNA4SLgZw4SDwTnF+AxgkxnR0PAV3vhFMpLJ7n7DqRs/9gwPiCZD0DiPUh5Xq+kgJBC
         Mm9M3n9RR4sRhHC99nXUAHKRX2ruoNaBM9O5eOpckZnGakDYLMI8r0hZL1qOY0r/1Qu6
         yanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781382041; x=1781986841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2h1pIz+Y3QiNp1EUEItf+otEd0xBBWZpK67JdzPkqGk=;
        b=N721V8mLXKIPt0Bf2naXD6zhMFIzFe3GAnMYGLtPkHs3P2eywunUDcRzkFX7xLf1N/
         jxKNc8K3CtIbFmCW2Qv3dYZwzjtuhVlblFs29yf7tggCe1XIECNB9a7Lv5ZNWS8vAbal
         YJgNGuU3qno4a9QCajdpa+24seTFN+c/COOz6iRTTmJuYiXQKziptTPZU7RvEB4xtbjd
         ODR4IE7s8qykcTAkBUY3sI3eCKMCnxIRJ1YL8Rh6IwQ+0viMJRvwpYYYwbIydNSwQ93+
         E3R/zmSlsJwdsVV86s+JDmCPplU0crvG1YMVCnvXHdFhVUYyGTmTklwA75xU6PHoEwo/
         Fc4g==
X-Forwarded-Encrypted: i=1; AFNElJ+M1XmJZNkdpCCFu3ApgxutSq6ApCht8d42UrqtpcmO26F4SW9USByX7h43ioIl5bNC/5ueQ5trmdGR9VMTWQZA@lists.infradead.org
X-Gm-Message-State: AOJu0YxwYnqOdGH/XKwgzq4O++Bhl1q0ecsjUZeODRUL1d1mB5PIXF8V
	QVDEf+f268rNIVASsqrgpTK5PtI2UBWLworRjvh1cs0RMNYTsDrlSw1R4AmLEw==
X-Gm-Gg: Acq92OEFD54fzdDcmbDevPjJL+zgD1XzjxSC0mcGmPaOsKIYDu9s5Q4jHvtu0R1ILcZ
	kAIdzAA1kIaOcE4UNifbmNuKW8al2SGxGf69jO1o5CzwhsfYkolphWwXC6Snc+JftK5wCDSKQ3C
	njILNLW8BIFj98rN+H4lRiwulbmgsYXssWlUcK8NqVJo/qITDAkTgW16gsymo6v6Nhy9DVKYVUw
	0Uyp0Mv7Ngj7677aqZCLT40kwutCcr8jNTqbacd5/sWp04/VZe5va4Pu6f7ErN086fqs8+jfGZF
	K/aAciO0kWvkucN2PoHBU4xaoWWYeotvCWNqEADKSD1WW5O69phgQRzOrn62up7o2NZ41etinWa
	HnQGHiIHgjDOfd9q6ALvbN30BXO5tJ/KRpNT/e9wzdAbp3oKCuBfA/e1Wl5TzwnwXVEHBatmc3Z
	qfn76CgXn00UVPNKWgb3/WEkmapNRapZ0Shr8MhhymeoILGnCYMe0sa9QE2pVuuIA=
X-Received: by 2002:a05:600c:3492:b0:490:b2b2:87d2 with SMTP id 5b1f17b1804b1-490ec50492dmr42515025e9.5.1781382041044;
        Sat, 13 Jun 2026 13:20:41 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm90785635e9.10.2026.06.13.13.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 13:20:40 -0700 (PDT)
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
Subject: [PATCH v3 1/1] crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
Date: Sat, 13 Jun 2026 20:20:37 +0000
Message-Id: <20260613202037.47744-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_132043_455267_8F45A81D 
X-CRM114-Status: GOOD (  13.38  )
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

Fix this by freeing the pending work_data. The I2C transaction reports
an error. This ensures that failed requests do not leave residual state
behind that could be interpreted as valid RNG data on later reads.
Clearing rng->priv is done at the subsequent call to nonblocking read.

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Assisted-by: Gemini:1.5 Pro [google]
Reviewed-by: Thorsten Blum <thorsten.blum@linux.dev>
---
v2 -> v3:
- remove existing error-path cleanup behavior [`rng->priv = 0;`],
  update commit msg
- rebased

v1 -> v2:
- reword commit message for clarity and precision
- keep existing error-path cleanup behavior unchanged, update commit msg

 drivers/crypto/atmel-sha204a.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 4c9af737b33a..5eb76245347d 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -31,10 +31,14 @@ static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
 	struct atmel_i2c_client_priv *i2c_priv = work_data->ctx;
 	struct hwrng *rng = areq;
 
-	if (status)
+	if (status) {
 		dev_warn_ratelimited(&i2c_priv->client->dev,
 				     "i2c transaction failed (%d)\n",
 				     status);
+		kfree(work_data);
+		atomic_dec(&i2c_priv->tfm_count);
+		return;
+	}
 
 	rng->priv = (unsigned long)work_data;
 	atomic_dec(&i2c_priv->tfm_count);

base-commit: 6ea0ce3a19f9c37a014099e2b0a46b27fa164564
-- 
2.53.0


