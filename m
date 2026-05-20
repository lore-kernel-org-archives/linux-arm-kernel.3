Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F845CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d00Co/CPYFX5ZE7rQHh1/lw+DiNtp4wsDbvq3jgMwnU=; b=N697ObUJyZcjjnqb9VOEKY2pDq
	MB1+9W3v+KvNZnnENRa21lz03eW/N1IToMssSvvBloSK37Rl+bY1rByS+y67UBViliW9OSeJFtqVc
	n+0SKxhM9JpOKQ3PhofvU2XEVDh2buFLz0XkROAEiY4JO9oJdiIkC1tao+yEzFetazeiCX68LnioY
	+QfJy2+U7CwvHZljsHY9G0o+3pLC0MNyMq8zmv/YISNfJ8pYgQE6RK6agd6aHvRGhbt8b7QlnK8gk
	eadZGddWwcReMqrrFcQSbTLlySRzJ3X1OV0Cd/BFcDOpCwsyrxcb/XerYWs0X6y5FWLz6ubdgirbB
	oSY8+PLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIu-000000055ih-1Dcz;
	Wed, 20 May 2026 15:57:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIb-000000055SP-3Ovx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 15:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=d00Co/CPYFX5ZE7rQHh1/lw+DiNtp4wsDbvq3jgMwnU=; b=TBipEPZ6oy+0YFY6KvWyqJgHiA
	qoQKCObqIHsn8pQmKm1KDUemWZIqLxqvKOXNHdEzR3p+c2v2IDKdPbyWjvd1Wr620cOVR9Dnu4UV5
	cVdLwKcd5mCqxfc31OoU2Tf5CklCtg5trMHpULWEt325vAVpIVlonbMVI5JtzZmBvG93JKXR46uUr
	KZVjXoucFOespy/RpnI2FvPj60rDMfVgIfnEIRZRnGdcDWs3KS/pYBCU4hlzCCwrVuuQNx73aJZMv
	+rBtPNuuPb1+S2AhSD5EllMZyPPSj2UKPMzfTe8X08DptdAfWBQJGu670OhT/p/s2qCNDP4TIOwiE
	ODt68w9g==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIW-0000000HIvE-0yfN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48910865133so2904345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292647; x=1779897447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d00Co/CPYFX5ZE7rQHh1/lw+DiNtp4wsDbvq3jgMwnU=;
        b=oCDq99Wsicr1rYEVrV3MFG//EL0zCRFaq+mRYqAA7/OujYBfnuZXAEnqtbuKtIgT4l
         Ykcuu/HYi5uThQUcvwUdJvQxH/a/Jg5TUR1PY2TIqAWir9QkOxTo/E/ZqYJA6dA7vqra
         2ipajbdVxzh/STtK9Ibl4DnCnuMug3p6RSOqWIkncoGSSXZ7eZlVIkG7zhTtreYBFXqx
         aLTwoSMiAu+5hULqEqbWw2i6as7Ep2KIws9q02L23z5yMHkSnPNx2KtaewKvYw8IJgQi
         6Bf/ZUiPrFh+uiQdw3HmW7NDY6avfvRENTtdAXugFUkGfp7vL3O7rOKBoBEVZT4N5/SK
         Rkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292647; x=1779897447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d00Co/CPYFX5ZE7rQHh1/lw+DiNtp4wsDbvq3jgMwnU=;
        b=rXqkWLWgb+wYaqb9Un+rOwKnovGkc9UO9wXMutKB0XXCCBvdQX9MvPc390ExKxMwwn
         aw2Q1gaBKzgexjhySNI0zoQxj7yNkWfPOnigw4i2bUsYKMDFqDLBNcigFc6iNdpDfR8x
         A7NpcrZ1ZFSwdOO9XiaPgTyVzPlttPEDzTOU24KK1dXZSvZ4UeKotmYteoUSvHYz7PH2
         4EDrGbSdyy8UVFzHNXJV925efVgrD8jc5CfF7fcZD00sVhk5NmbMkvwtsxIQw7kQzy0b
         /WjdNHaLOqrd1lVlq90hMJPyxtH0+44YhcHYMd+WNWn393ML+vZYt3xzkhMBrrc/gNgp
         3HQw==
X-Forwarded-Encrypted: i=1; AFNElJ/sTLnBghRq/A4akEzFIjQI2bM3LUSJnaGKSOB6nNgDHycEgBEZjef3WBHMlAUuBqq95Jnq9NSGNqv/8Nmc+7tp@lists.infradead.org
X-Gm-Message-State: AOJu0YwqSNxiaQUsX2Ilba5W0uZeKNq3+mK1ZTH+y3cwlGaYJBBFFQA5
	b/ps27MWk1KvJc/6qbknpL5e/mzGnAhJKU06ktovofImw+qLiximynQy
X-Gm-Gg: Acq92OH8k6SvEHDnUg6xmaIzkCPwj2YWqhqEHY2Vr+DzYrYdfD0TXA+d3Rny3QEd1By
	MTCp/wWmVmx9ynJOkG2lwrtujxW0VYd28j2aDa7WsrkYOUE8NKHABDRGejYlQ675MlQZy8+KgwE
	Nl7Q7ydA34jwq8fnm5XpDSFqebsDOTCGGmkC97rmW8nayaPXgYdV2AiVYlkXSLHpBk0/PFyamym
	7NZO3z6A3dqW5Fy9nDOiXhI0cl4niC2qdpohBSIV55QBMXF2PVsL+J76d8oDjjJTUjyUBpRWGJQ
	VKvflB9zB9VobQQU+b1UfS1VoaGV2kxBGZeXJ+6MhfV2vGOJTy7yk8lDbYBSZ6c0y4QuqVmKD4a
	s5TB8mccQb9deFFMsKzpUwyUBEtu1nbHKGF+Qo+bMp+h5ChWPE2AidJCnlx5nuwhW6yTh5ttX2S
	Ed8anR9hA/YmKWhX+udWbt6lowZli+rt0+aKCj1vsZcTtTQUeUr+bRsA3ALBHm8wc=
X-Received: by 2002:a05:600c:3594:b0:490:502:8422 with SMTP id 5b1f17b1804b1-4900d55ec74mr107484465e9.6.1779292646691;
        Wed, 20 May 2026 08:57:26 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:26 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v3 11/12] crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
Date: Wed, 20 May 2026 15:57:02 +0000
Message-Id: <20260520155703.23018-12-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_165730_489954_092DA8B1 
X-CRM114-Status: GOOD (  15.66  )
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

Additionally, duplicate the tfm counter decrement within the new error
path to ensure the reference counter is properly released before executing
the early return, maintaining the driver's availability for subsequent
requests.

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index db61ac0177f6..b51031ced7d1 100644
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


