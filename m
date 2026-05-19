Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB9CCD5BAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dQdC9oLqGqR6Yemw3ngZxXH5nQjTXJGwmXiYcKTYls=; b=BeTTfP3GU5qjueF1ye1sJenYOn
	crV5GG/x1gqAMG0yi6G6WX1OMJBqrFbLitL83kVRzOeCgcGhj0iOrgnvQnQqEXbsK9fNv6RVH/iKL
	7k0pjJvtMRtE1cXyCr8FvLnY0WpONUjoTNR/FuDir/5v0WdMd1vhqImfO9/BD4UGunok2w29wPSCZ
	tvaXMVh1qTvfqlmWJMuFy8MsAXWSwmHtNf0Nso/jMwMGjF6/qay0McynfCteWKZ6J1jQooIm5LJMK
	ebCnl6gKlOIs1pVQLh9OYDWdesHevFpkK6+s159WltAS1BBSWovZPe4Rfjy+HOTb1L6GAaLEB88EZ
	ETrocx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMg-00000002lQL-04CL;
	Tue, 19 May 2026 20:48:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMT-00000002lFC-2woh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:22 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-44b729aa7c5so357710f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223700; x=1779828500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dQdC9oLqGqR6Yemw3ngZxXH5nQjTXJGwmXiYcKTYls=;
        b=M3msOWR3alNoMWuObpKE0q8/YQWd+cynkG9l2M8hypEHVxInpwh5Bx0+dqvqNBa/gw
         8+4RsQfQkUIzcTRsgx1KKLqEXKoEEBFSdEwVPJPirWUzinTkrkMVRipV82PL0DCLTeZf
         /iWbL6PGev2V80nrNcfWPplIrLWqnUkOx+ulmfqX8Z7+tFJU7Cl46O5w4RWmsEPBvzW9
         53oOJwXYLJJn+7GmznOaV/RGaO8GBnctpNRswD/m/JUUJluMzl1uQDbETAU3nWRzg97l
         +yqG1pThaBsDXpLDYUvcXdJf1SFfXxQ70EAYpWML4tRrZdwntDcPgb6rvUZvX2ng0muH
         W6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223700; x=1779828500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+dQdC9oLqGqR6Yemw3ngZxXH5nQjTXJGwmXiYcKTYls=;
        b=OmCj0OIhw2nLkHYc/gQEef9vXFoRRxtwpEbASMVt4GDFoTGwhyPBdRvdzhbL201o+0
         t/k/UXtf/FhIy7irPwrkGtVqXae26A+ADiwv/XrCn8McHNBOHWeNnhswlw+TggDxLxnc
         UZs5UjfIskD2vUQbWBIKOUy1wVABwnPhV6gxUeL3ei/RR5FCBgS9iuDEGOeWcRtcfENC
         p46KutsYXRl4aK2KdDzS/2emMiuIvNpXIX/9tqGQ6wrGa+b0c4/fG9no1hQr6NTJ05bN
         EIA7jRvmq57dgBXL5VmiqcgYRXZo6OTu5uGpw8S10ZkJzuIW4FH49aPC9him1ykqV1AA
         ZFww==
X-Forwarded-Encrypted: i=1; AFNElJ/QZxBRWVal9pnxmnLuEc8vSZKqzcJyG7L7WsfP0S0e/AyZFK0JuSBuPlNMNIODoVkPZO3Lisk8mdSIw2T6ylLV@lists.infradead.org
X-Gm-Message-State: AOJu0YwgEbB64YC2/K8MVbcra8C/wwbog4f5WvTG2NyZmc0rulzeryZn
	ei3POjRejZBMslZYt4ZvHAvZmPNKxEnB7wcS89lbQmuAySCVuDUbybJu
X-Gm-Gg: Acq92OFXXQWjhpkNu94M69cV3zqdfZZXhGtccld70xKpi38ukNHAl/cJ7mcJhJL7Xli
	u7B1T0IQNENFv+SZ4xCYpfPFAuLkZ9iqZZgsH+Kwv/EphLJxq7yFN+XWwrz7vsoVkhF33iLMJGH
	v6tqPBu8vWeIZisY1/qy67LphJidE1otrqkJCYnSNGW9kJC3FN54f+FtvhBXcaK8tFuJBcv5l+g
	sDAlBiD7NOOb7GJ32HpJ0WwXK7ESjxRC6lNZL0Hb0AKIA2lijd9W+TcuFqXSCnGyZ3zYtfxGaV5
	J/Spqh3E96maAlJaFwuCPRliPbiWmY5oMELN5J2ghaE62SwZ8fVeP58BihsKrYwGi984al1kFsk
	oDgxMCP9L4gjrxut7pSDrrx8ah0NKRZ1i9s9hCiIxWAYgFDKF4vPOlVAqsDM2ZBuZX3OtV0nDw5
	n5w7CYIeBXbYbMEZ17iGARqyvSZmhpvsUTub9YV2AxtirpuJLXPUz/G76nL4uDmq+Jafr97pBXV
	w==
X-Received: by 2002:a05:600c:198d:b0:487:1826:e138 with SMTP id 5b1f17b1804b1-48fe6309a99mr184655105e9.1.1779223700120;
        Tue, 19 May 2026 13:48:20 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:19 -0700 (PDT)
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
Subject: [PATCH v2 11/12] crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
Date: Tue, 19 May 2026 20:48:02 +0000
Message-Id: <20260519204803.17034-12-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134821_763881_929EA860 
X-CRM114-Status: GOOD (  15.94  )
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

When a non-blocking read operation is requested, the driver dynamically
allocates memory to track asynchronous transfer status. If the underlying
I2C transmission fails, atmel_sha204a_rng_done() logs a rate-limited
warning but incorrectly proceeds to cache the pointer to this uninitialized
buffer inside the rng->priv data field anyway.

On subsequent execution passes, atmel_sha204a_rng_read_nonblocking()
detects the stale rng->priv value, skips executing a hardware data read,
and copies up to 32 bytes of uninitialized kernel heap data from this
garbage memory pool straight back into the system's hwrng data stream.

Fix this information disclosure vector by immediately releasing the
allocated asynchronous work data buffer and explicitly clearing the
tracking pointer context whenever an I2C transaction returns a non-zero
error status.

Additionally, ensure that tfm counter is decremented within the error path
to prevent reference counter stagnation, which would otherwise leave the
driver in a permanently busy state. Finding by a sashiko side-review.

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 38a269186e2a..3d29543032cc 100644
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
-- 
2.39.5


