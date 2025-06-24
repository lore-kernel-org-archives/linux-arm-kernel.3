Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B89CC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwUHxKJnp5cLgpgYva+rlNxvXdISl3ekGoJdTDdzRBo=; b=k/xy+OGDr44rdxaMVWuD84sus5
	bXhWHryzHgbwV9DR8DU/9PsOiBtHNnL3SQjmLreuTk14snISvGv6qyMdf0qPoaXU7Y9UyKrgcfIRY
	+J2+KC4MggU+RHakxUhWmrtpx81EbZCSvjYsW3tOhMS9Zg9PT3GW8CwdPVzMOvigq/wXhySDhoaV5
	1o88Q+a1s4jzTIN66CCEDSbePKfDQIgVYUNwF1QLrH+2YXO37yzPRYASHs5CHCWP6WjKjCiA6aPp4
	F8goblF12TVS7W7HvdvsA1bO0N+RvygPiDTk4JPi2ALe8SuO26amLslw8hw+2NHAofIDblCChjfdQ
	0HOXU4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5lu-000000069nG-3euz;
	Tue, 24 Jun 2025 15:41:18 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45T-00000005n9d-06g3;
	Tue, 24 Jun 2025 13:53:24 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55350d0eedeso518540e87.2;
        Tue, 24 Jun 2025 06:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773201; x=1751378001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwUHxKJnp5cLgpgYva+rlNxvXdISl3ekGoJdTDdzRBo=;
        b=gepXE/ZPma8OQSSmWlhSgLgXZNZgRC6/Yniz5oMIIvh+CThprMMHVzjT3cvm+hOHzn
         wPgV2VGHxrD8/FTswhcSwUfVJI5AggkcHIW1Ltkg5DKRLWpp+VfCdVyNEuJ5d1qISsEW
         t2ftqPfnXjeM4MEibUBMIJVB+H4t/f28xvsz3uNpKHRCucNS88QVQ7UHz/0LehaGvoxQ
         RNOdfFViCQnk7q5XaZB/tDqufO0m8LhtxBbPu2dDDbUNT9mCtzWJ1xkGXLXeZRm/dHkE
         CEpzd8xVgt372KQcylZ4EhB8wH9kcZaMnc5DFaB+JMXGZ9KZB8z89+jrwJQgZrPk8Fwv
         clfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773201; x=1751378001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwUHxKJnp5cLgpgYva+rlNxvXdISl3ekGoJdTDdzRBo=;
        b=IwotcRyYmYw6spjn7pw5P95i8z30XZV3FG3hdBOGYVZxv1kE8DcQzg3t+EvERk0gCg
         waBc3T74YoNQmfCRt0iSr+i6/lLu3bO2Fs5k5LUO4PSHOtHKZggRFiOdxnc+cggzKBbL
         EqUbSeyuQ7Py3EtoQ5GtBoBon2VmzgmDIBFFFocoUcw6xowK8ZPafercBvO8ZJD/C47H
         NASHbmApYvArsyuDKShrOjgIDNeLkrfQFujV/maUfIfmckpBgWa/4vZijz4bS5gstIuB
         9hFUet1o7/764jE6fLE0lSfWynQKSjGmx6tcy6e4fKNi+d6QrCw7NNRMisYi3H1/cGnk
         isww==
X-Forwarded-Encrypted: i=1; AJvYcCUBNlY2dyHI+WOthg68i15McKsyZH4pYMq4lJ1B1KCcoK+/b7L5Bfv+YAE/mgwGx8iWxt8u3FHPIRBB+3XI@lists.infradead.org, AJvYcCW/PR1B7BNrBCOEvv6VN+5g1tLwN2c63qNQuuc8G98qIrHe45LyHXAVY9RHsrU0svQLudtK9uTE1HFeBvS5NudKWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZZ3JJEEmSmRayPZvGwA/3nJ2dz0yZ5eU6kKSQjAU4mlc0p1OZ
	yXRidSLpBKtvyiOzIdnq/96e3TRyuEgOFpBZz8ou6sQIjsRvrmJ8NV3U
X-Gm-Gg: ASbGnctfvKvuqidIWFwezoo4nn8e4YpeS9esgkR5xSVaon+6PjeJe9lo0k/whqSWH3V
	P84CefQyQJXJNp5BtVo7GFaYwtutnAZnwgiyqVHbO6ZJJfsTWC5R5pmO8DRhpty/Jk4UDHDcVVs
	gRigHls5Ty91stjIX2KCGTM/FGmBakhxSk2TGvmPSOnpJTR8fKYduwI7FdeAMYGrfwvuVqBsEtN
	WbWQ+5dFwvouoUeKwmrCSS8yWeuE/XLV9PBhcwrNBi9tAzwTJJyeMT4E4ENgFzuKslC3vRw3ck9
	KSMJyAU6AuwlrXQRBAJqLOS0x9JgakF/qCn7sBJOV1yDUZcWuByVeiGvU9pkLxMaQJhfmV3kdWr
	yuQohp8cInSw47hUhHs5fZ+DgZa9BEgjeYcr2rO2R5KjxAVS5MLQoP/KULQ1U1A==
X-Google-Smtp-Source: AGHT+IFegUQyNWlfR73jyIeNSbKb+PL10eoaOMjltkUPqUsmae8e48puBzwbK+rUaYB2E2lscqlytg==
X-Received: by 2002:a05:6512:3d04:b0:553:28a6:4390 with SMTP id 2adb3069b0e04-553e3d0ce96mr4929973e87.47.1750773201274;
        Tue, 24 Jun 2025 06:53:21 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:20 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 12/22] crypto: amlogic - Use fallback for 192-bit keys
Date: Tue, 24 Jun 2025 16:52:04 +0300
Message-Id: <20250624135214.1355051-13-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065323_069944_C536A115 
X-CRM114-Status: GOOD (  12.93  )
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

Unforunately, not all Amlogic SoC's have a 192-bit key
support for AES algo. In this case, use fallback.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 7 +++++++
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 1 +
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index df42940f1112..6070ee6b488e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -41,6 +41,13 @@ static bool meson_cipher_need_fallback_sg(struct skcipher_request *areq,
 
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
+	struct meson_dev *mc = op->mc;
+
+	if (op->keymode == DESC_MODE_AES_192 && !mc->pdata->support_192bit_key)
+		return true;
+
 	if (areq->cryptlen == 0)
 		return true;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 706db22b9f65..0f4b3db85031 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -279,6 +279,7 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.status_reg = 0x4,
 	.setup_desc_cnt = 3,
 	.hasher_supported = false,
+	.support_192bit_key = true,
 };
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index c4f65b541f83..1a15e6c0bf50 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -94,12 +94,14 @@ struct meson_flow {
  * @reg_status:	offset to status register
  * @setup_desc_cnt:	number of setup descriptor to configure.
  * @hasher_supported:	indecates whether hasher is supported.
+ * @support_192bit_key:	indicates whether platform support AES 192-bit key
  */
 struct meson_pdata {
 	u32 descs_reg;
 	u32 status_reg;
 	u32 setup_desc_cnt;
 	bool hasher_supported;
+	bool support_192bit_key;
 };
 
 /*
-- 
2.34.1


