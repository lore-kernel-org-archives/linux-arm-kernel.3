Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F41CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N8+mvEz/uros8or36J+62LaI0/57hxHXfoqkEFi7n/E=; b=S83/eImdOZO6FHiMSdNCXNGgEM
	Ze3nsyOCa6uCF6ciMh0PTAJgq6gsCw8L8G6V9wk9R1OKgDTLx86tn2UGRW8pwNUj6oXaAfx1c48f8
	nMmM1RdcsNOdj+PFz3reFOKo9xGm5NOdUkqTmsI5ZRVwVz3qyjOxlbNnD0Xg5JAofxv0dTVOtnpnh
	PDqF0o7j0ZbHT1kms7UdQ9Ueiq0tHaGn0lrQ5BH7NyMMraD8ScJ6vKYEAVmtWvigrFaCHCFOy7x+L
	rTFwmV7WKg4I6aznmNCmgdk8A+N+Fnk/fddsCt48UqTy2GgsGRjKKcQHd9EQ/8KOM5e5D3T6gNkF3
	QGXNR6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt3U-00000005Ezm-0BpW;
	Tue, 09 Jun 2026 09:47:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt3R-00000005Eym-1rpG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:47:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490a78fbd7bso6382315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998447; x=1781603247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8+mvEz/uros8or36J+62LaI0/57hxHXfoqkEFi7n/E=;
        b=NAftnlw8zB+Yyk3OQJwQy+26MZ5cSCi/OdVRhJZjtEk8xUveJiOsbKfCI1EFErcIuY
         aHEOYhKKvfSIlb+CawDunJLskBqghWhAeh8lvQUyrlsKT61Vmlq1DPJ8Lr5Myn6lp2vj
         1SYfwKfTWpmTiseMCIADRfIDgL4OIzCcHaHdtuu0OiWa5WXGYUstz/Eb0KeYzxmYKVJW
         GK7boH1Rapi9PsoyS8cPxz0fjCz0ACcglhzLRHWSbTpMqirYAPzlTQRqu3nXDVMKMZ4Q
         ruaoEYMSsW0pnA2GOibnPHlnhJGm7OB7Xg+A7qvaExOtrTeQZzc4u9UvDF6rGlV7bRI2
         PAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998447; x=1781603247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8+mvEz/uros8or36J+62LaI0/57hxHXfoqkEFi7n/E=;
        b=roqER3Z7NWRpEUydZIe/lGXFE3pnuiD9KANj5zKcqUB5K7OxKRTM791b4rx4ZUm5rG
         aeSrO30OUQlrRg6nHnmtsQFnD5gQ/H4eySkJGmoCzlzO9uhh2ayxZ7nOpOFKYgzHyxvt
         uVq7OVMgIOA1vr/DUn/LknXaPeo/GfMq/WMTrU9AYXr4PlwPYLf3sxdpXcxcjxafPbx2
         cysfxEe7bgWHQb6WN6tO5PfiXoCRgmXMqURS2/0Y62u3nywolg3Z2f3a9BlRRm7FcwX2
         1qAkeCOmUxn4dXgNKvBjyxCvYrFHa6AzAYFQGYQ1x/pOrGxV7Ze53yX0R1wyrOhNdYCY
         Ir2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/JvOqrjnugP5rvFk1ItkmY4ORo8ihbDU55UGvn11fsA9b43vlIdPvWUMKB9/weaBVt4BT2VU60mEj6OnvMkQpt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0AES6Fv/w6UZ56geei9V35QURmvWRRbCueNGa3bvzcy4kII7B
	h8qGhmTotR2aWhciqb3ZWF7rjkDp+56go6wFZkVprPUGumpcE/OERjNE
X-Gm-Gg: Acq92OHGF6y7LEPRRaJDmIKgRX0tvby0n2+Yrhd3OKcNB8n3pGrAyDrMoCX+EPj1YNo
	RdCljDJ49QRQJAxfO73DZe3rqQjbixDr9ncSvrTb/+mWNft6rIBL/QNNEcJDr0Yv8cwtRPRXyfQ
	Yf7qzju5P1v+/LtCvAl2wj3JQC89UMInVqeu6pAxsKFRkZ7ccoEshAgvQYu46AiYcBFqzmzjPkn
	Qpaa1U2oMaFwzxAZ1lal1wi3dou1kcLJj5c1BcwzyJy1zGFJvrpV71HoqwBd58Yu57MdZQbKrrm
	6LuVRYLMDv12Pog0uhe9qepCO+tOzqJsIHnczg5Jk46fDZRdASyzlDTc9r3ksctuRxK3HigLmDD
	mz3lW9kmMNE7Z5RXkzStX7bFFApMUFfrHZ2+rvLBQPf3Y/W7Q2nOMcVXDWRTuRDpCP+IEJDzhcL
	SglbW2z4yibnt++j5CEyYXDfpURKLuVfU/n06zjqyfYu+EbnYkfs8f5w9EsMyVZCMO+KEnIiJ/H
	Q==
X-Received: by 2002:a05:600c:8718:b0:490:b2b2:87d2 with SMTP id 5b1f17b1804b1-490d7255c0bmr10214735e9.5.1780998447423;
        Tue, 09 Jun 2026 02:47:27 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3e59f5sm496152705e9.14.2026.06.09.02.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:27 -0700 (PDT)
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
Subject: [PATCH RESEND v2 1/1] crypto: atmel-sha204a - fix heap info leak on I2C transfer failure
Date: Tue,  9 Jun 2026 09:47:23 +0000
Message-Id: <20260609094723.47237-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_024729_499813_F3E79B5B 
X-CRM114-Status: GOOD (  13.93  )
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
Assisted-by: Gemini:1.5 Pro [google]
Reviewed-by: Thorsten Blum <thorsten.blum@linux.dev>
---
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

base-commit: 79bbe453e5bfa6e1c6aa2e8329bfc8f152b81c9b
-- 
2.53.0


