Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69592C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdsAREnVdCt9SeWtKGm+rHn88INXvbkZnfp0wLc869s=; b=uawyldg3FgKZt1wN6f3fOdpf1O
	wpBcBHlIWTPnMHtCupxAlaVIiXCJ5bpKwOFyeKr91cn3HJA8sD9YRFcsn6+uiZo87EOEP95a0XToN
	glfdWJGZEIO/93/RBLr5JfmYU8bcfJObIxcUbNfOfT5e7yWGIGncczvdLu2wVM0YTavZN7m6zDqDe
	Ku85C8a0WmTh2cTCYBQZAxWacJqgj2kRXaivTiZAVgkPvEDT2yve1c4Cw2MfAcnwbId7tHw0KbLa8
	cbfP36DYdPcOpDng6BmxfsNuhuMnOKPXsooa764FhDh2SR2kOUze8ZoTy5VqKw3FkXIif71aJI9+J
	krUp6Lvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5Mj-000000063nm-2m4h;
	Tue, 24 Jun 2025 15:15:17 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45H-00000005n4H-4BMX;
	Tue, 24 Jun 2025 13:53:13 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54d98aa5981so7245475e87.0;
        Tue, 24 Jun 2025 06:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773190; x=1751377990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdsAREnVdCt9SeWtKGm+rHn88INXvbkZnfp0wLc869s=;
        b=NQzP8npfn3PUHhRIA9WifTcgyDNfzwt8M7jkGqEFXvWvgY1eK+K27lMnmy5/uOBqc0
         B1URHJnD3X3Lh6m95VmIxh65YyyjVG4Y+0UvM4DMrEYOCUMr6xqoV6JQPIAQ/8Id/d1I
         r09KBWGPHMV/9Xp08Orub2kcFwfuwUsH2h6+gKJCqJvhZ6qqI9fZZG24NfWE933gLDub
         1eTrU3sBjA14Xk+MlYWcli1Kf1NFhhr0QOM/rApJpwAK+6pdB/2IksciAx+E7ROMLooU
         WvD5I1HudLkRhBEttVIlR0lzhp1R7w0PyhWQHkEGyauknzaFXHJ99qZ2yqQ9Vme2oBif
         oSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773190; x=1751377990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdsAREnVdCt9SeWtKGm+rHn88INXvbkZnfp0wLc869s=;
        b=Xddnv0SJyIZjGMoLneGfdKAHmnLICB7uHCBDUKEsrJGjyXIKgivFmGtUpmw3zLCc/F
         D7jc//YDHTpXJeJnGEXoFYj+hLxaj89+2Jj7Bo6wBc8LkRJkq0MsWloRKfNe0vMmqSor
         31fUYLXT32kP4jkJiFDPXDeNmr48Q6q5YSpcP5OjmwGlb63XyRZB9BU9WHOoMovoNoc7
         xOUYwujs7+dZ+ZqcZFp8lYqRpn813OlvU+mJJUzCaU4Nq0fE84LcDEyTrRcY6ZRXDAW+
         vAK6D+b3ESEbCMfqUVW7lTuMXidLxFrcmirUzaCzq+1uj6iCgfl3ZD/HJS+FsOUo0d56
         71kw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Qv78WKPdAzcLow7W6f1P0IGoyeVNZRm0tZ9BjUeEYpDT0tIzOgGf2sUsSOFJWEf3i/A3DghD1/kwj2lj@lists.infradead.org, AJvYcCX4+0zK57zhB3j9sRWO1jX7gIqjkCytASnpTvf/w3eyn4xLrgmpNjMXT5t5H0hQBuSwuDykSvBpbv0/9ofs2JR83w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxljJhx8NJlBKFFmS0PvxK6/RT+0HPniLzwghjT6dGX2S1WrZ/E
	hdzvGs6C/liMUlh1I08hFeoSHk3UbkKW/4ixitq3vzLrtS12udi0Xcud
X-Gm-Gg: ASbGncvWcGSqz6BagR7EHXFO2wG9EWFOg1A/NXRzvlXt6i1ovijHD+fkXxBmJtErB6I
	oFsV285bgZAx/mqZOQnprn/lxe6j1lgUlyTt3qG6UEhPQg1dS09USFl9DMv0FxLT1k6biaiY9Mf
	BrBRiQxRqeIwGG8fyC2OGs2xJ1qmEIklRVMDShlhg5UoE/APOvIngT8UyuYpqivqUVb42b/vsyJ
	3PPBPptr49+uGgxsviJwCKBVm1ljzH9bBPnOMeNsYMneQyWNALnDXMMY7/jzp0kAk0ZeSYwWCWY
	ZusDmPL/hud9AEaEbyBgpuim3QTDzl+dOj6ZzwaRjdXIO3XyurpYe7Jxqkx7kNg8TxmQCzJXsCk
	iGW756nWdbHx6tXgbW++e3AzG+9AE7t7HzeW4DCtVoNq8YBYchFusNYFVhgltm8wF7tDEu8JW
X-Google-Smtp-Source: AGHT+IHRQ+es1ViPpy1TP/xCK8UXRNsKN+lvj7mDfW+b0g8VSAHmPjV3EZwtYNIFBaB5ZTamT7yIuw==
X-Received: by 2002:a05:6512:3055:b0:553:6526:82cd with SMTP id 2adb3069b0e04-553e3ba82ccmr4130662e87.13.1750773190332;
        Tue, 24 Jun 2025 06:53:10 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:09 -0700 (PDT)
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
Subject: [PATCH v12 05/22] crypto: amlogic - Move get_engine_number()
Date: Tue, 24 Jun 2025 16:51:57 +0300
Message-Id: <20250624135214.1355051-6-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065312_050314_455F3812 
X-CRM114-Status: GOOD (  10.00  )
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

Move get_engine_number() function from cipher.c to core.c

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 9 ++-------
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 5 +++++
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 1fe916b0a138..18e9e2d39b1f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -17,11 +17,6 @@
 #include <crypto/internal/skcipher.h>
 #include "amlogic-gxl.h"
 
-static int get_engine_number(struct meson_dev *mc)
-{
-	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
-}
-
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
 	struct scatterlist *src_sg = areq->src;
@@ -282,7 +277,7 @@ int meson_skdecrypt(struct skcipher_request *areq)
 	rctx->op_dir = MESON_DECRYPT;
 	if (meson_cipher_need_fallback(areq))
 		return meson_cipher_do_fallback(areq);
-	e = get_engine_number(op->mc);
+	e = meson_get_engine_number(op->mc);
 	engine = op->mc->chanlist[e].engine;
 	rctx->flow = e;
 
@@ -300,7 +295,7 @@ int meson_skencrypt(struct skcipher_request *areq)
 	rctx->op_dir = MESON_ENCRYPT;
 	if (meson_cipher_need_fallback(areq))
 		return meson_cipher_do_fallback(areq);
-	e = get_engine_number(op->mc);
+	e = meson_get_engine_number(op->mc);
 	engine = op->mc->chanlist[e].engine;
 	rctx->flow = e;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index e617dddf5e2b..44e71e917e5e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -22,6 +22,11 @@
 
 #include "amlogic-gxl.h"
 
+int meson_get_engine_number(struct meson_dev *mc)
+{
+	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
+}
+
 void meson_dma_start(struct meson_dev *mc, int flow)
 {
 	u32 offset = (mc->pdata->descs_reg + flow) << 2;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 0ccf6542995f..cb70277c3a31 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -161,6 +161,8 @@ struct meson_alg_template {
 #endif
 };
 
+int meson_get_engine_number(struct meson_dev *mc);
+
 void meson_dma_start(struct meson_dev *mc, int flow);
 
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
-- 
2.34.1


