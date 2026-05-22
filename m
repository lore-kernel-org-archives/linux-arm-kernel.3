Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B79CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4hFlokuo7P4aQz1gprT7L1r7NqG5LdGzkVv8qgvK+0=; b=TJD4TXtKmR9UV3SrkCNr3ahwh8
	qqZ0G0zGro+KgHqvL16WmkijyADt8Spz76P6RhR1zx8o5uqqx2lEY4WxNXwPK5WN31AGvK5+kk3PU
	G1+5ovhQdHq20xyOafsRDlo5DNaAdfl69FgZmZHufYaQm6q+eIVyuU4wGMFjbw/Cn6Ho0NdiebfNe
	iPIM4gBjONjDPOZ/+zCNP8XZvR2d6ZS2QDvd/JLoVWZBAakRomEc39F/eT6H4BMEY2a0iEH3WWZL6
	6rKgGzQtuR26PQJ0xBGIRXnj472cL5bc7nmz4p8/C328nfI+IWU3A+1WezjCWl3zBu5RqKf9pbL3S
	a6W6q41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsH-0000000CAHh-0hFR;
	Fri, 22 May 2026 23:01:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsD-0000000CAF7-1bzf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44a7c719151so592668f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490903; x=1780095703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4hFlokuo7P4aQz1gprT7L1r7NqG5LdGzkVv8qgvK+0=;
        b=WvWgA/wns0ZhcUs+T/EmwxmKccAsFsAaT6Lpe43Vq7fxUM59PS0RQXTucgjh1VL7TZ
         FbIJ+GoUyF3OLL6Td9f16+uLg+R4Mp31WfY3rReWDgFES9uC0A+2IHVCwI1V8ITdvjPP
         F/SluDMQv2h5o2wGh61wgeSs9bIBEOitjjxwm6sIpGfiF2JO1hmGPM8lWQUjF0dzQUId
         m5YT1vw7L1C8vvn55MDHs0btjcfHzrz53UWetvvaP4iJ94Zrq5jYTNTQEQho3reGNH/0
         mESqvvHYcRjeZZCo5G9x5KQ+Wga2Ji/elTxrZlsPvFwlS5LThBoG+hu4W9SRcxWQZdsf
         bOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490903; x=1780095703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4hFlokuo7P4aQz1gprT7L1r7NqG5LdGzkVv8qgvK+0=;
        b=YQLReuYqXFq9HSxusEYFG8iAfnoWbRtB7FoSEzzDON24uJUx9azlu3pQW+vxXVmYkR
         7M6Sbyf+oRJoQOyic0OhwJs7OH+LUgIkMhDaf5wjqFZb7McnCtu6sQ1bqUyNT0pggG9l
         czkQM2EUrZVynh7sVlFSKLkAbThKZBo6Hz6wf47ZNSB3LMMGVVoz34izOwrZHj13fjyR
         oihUqJmzt9RIGlNdhGJvFTFNUuFEBl1N1Hjct8sEX8xm13a8aUo67gATty4s4/6OPI2w
         735vbri1OjBMp1RiWdUhpwb/50g1AMMSfneoRec1P/k5JGjPeu2Ga+PybxDVg255iEEU
         vt2g==
X-Forwarded-Encrypted: i=1; AFNElJ9TZS6/vpDE0/gywuYPBymU5RgeKn3T/YW1tkSenQM23Hxb2KvSKpdTLRyyRbTKe38A+SGd70otwfgI570zPOO5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Q6aUfDoJxyN6M/qULU8CCPBjKRB39X9b5QocrUMJ+mD5oL2o
	uaTisA6/KfwudVslupRpbzLbf/1rmIYKfOwHtsyAqWAaunDxu1y4mD2H
X-Gm-Gg: Acq92OEwPql4znfObFCxhek4/1DpRMRTQ2xmWdTRj2s5UpEfAlKcraeJH+qmlg/D5ag
	+qAIqfntQPRRz3y1R9HWxOMyoNJZEMvOWt4AqlbLNkkBwv5hGq1/UWLlttov8evYeCNfA0gB+ko
	FyNlTeGSSuz0KWHzgU2V4GMGFkJFIcARiIP6r+ETy1kawoRUYwpKFnCy1v46rgzJnFBO7BzQ55+
	Yvl9EjTH/HU4r9hpKxIwB2kvagBCBFdscA7b31Y9YzUMHIBo4qUWqyevDd+uQcOihVd5XS/Z6LA
	PSn3mCmM4FiKnhZKF+QF9lce9R2ONzQni01Ullxtl1RCFzWWkNBAoDOKYV0Nuavd65UIEjC7KHL
	p0V7PlIhAxqlxEKUz5ghJlV0RrSH53H+XLTFY/xgNUA+jDfyBPncXCibxySJ9gPgPZH2u70/hoK
	GTbxgAmymjQdAhLitgr2xe05UqVk71ln4v6lwYwZyi5PT+oxfMGppr2GF4Eziw7qc=
X-Received: by 2002:a05:600c:35cf:b0:488:7e7b:dbc2 with SMTP id 5b1f17b1804b1-490426bb7f1mr44203705e9.3.1779490903199;
        Fri, 22 May 2026 16:01:43 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:42 -0700 (PDT)
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
Subject: [PATCH v4 03/12] crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
Date: Fri, 22 May 2026 23:01:25 +0000
Message-Id: <20260522230134.32414-4-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160145_440302_7E38F84E 
X-CRM114-Status: GOOD (  15.06  )
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
index 12eb85b57380..33e5a66b843c 100644
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


