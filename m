Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280E3C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qsp9CaqkI2nnPLo+C7isQc9cYVKQaKUwpPDF4hWhLBE=; b=KBn6A9374v3m/VYbhFkBCn9NAk
	dvDgx47Alwu9GBrWhm5D2OGMm1mSCB8O0NWVHlxgMiGam6bbUNzkUpOG1jm5l//M8Sx6NWvGabXSn
	V47fbKXxX4JWCQOYxeD7DK39fGu6caGky18jgLkPmJ4P14ry4ERLNkc6Vv4kP6vVfIGyXQrBCrtLD
	rKgOkFxeSMZmePX6SLL7JjKYK3okMmO4I6ATWpDlzvh2vgbsVSQRxSTBwo2T5HxkbYjY/RgiqYu1L
	mvBLeCrH9lNhvCjk1prAmJkZEsTa6Hv4/5OhLL8SXvHQp0znFp/dQqZBhg5V5RHZGSIkw5bfYmSax
	AMACgGFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZJn-0000000GSUR-0aV0;
	Thu, 01 May 2025 19:11:35 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZG1-0000000GS7h-0PrC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 19:07:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac7bd86f637so437002666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746126459; x=1746731259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qsp9CaqkI2nnPLo+C7isQc9cYVKQaKUwpPDF4hWhLBE=;
        b=D7qXiewoZmBN+G5hXL+CwloSi2+lIfHl/YLP5VnF5Iu5tdBvZDV2Bx0zdm5sSDZpsi
         sTzrhxxv9J/UkgFbKuEH7t7w8lBhCj68Pirx7jz1jZo+WUuuXtciXn01FtLPK6rHhnnB
         4WaxA10I5AywxNj1a8hxZ9E7GzesN1bweNpVWpcdAdRhkJmZrLEOpXCL8Dpi7gjGPSp0
         F4HPQJ3ED3Cs+LJBlAsscwKo92HDX2l58S63B7D3q5mGNj+GeEhSmmiOcbiuEWByMHlS
         FEa2btolwO4MF8z2TnydiJb+V69o1d/moJy5B85JNzr2mi8wkbu06IO0QBEYJ/pmSUQt
         0b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746126459; x=1746731259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qsp9CaqkI2nnPLo+C7isQc9cYVKQaKUwpPDF4hWhLBE=;
        b=v5NQpxDzrpGIxF95Ie7eWb/PNbS2vmP7BRanl3wuY3SFLCDE+ShLYG7XXHPZN1qkOw
         WJkVJnRJVzdK1W0+rNXATWSJU2RapIgu+EblRnBErpChOy0+ZtCsODa5sRHmEbBwkuKc
         SOFH1FwSUshXHacjSVn3Sh5eCE7PC+gix5yjel+rL/BJKW+2k/Bp2GjdQP4zpTVcjK5L
         ThcGZfFv6tfJnN93MeLSweI0tTG9/4D2RETI3k1JqDRJb5Qx+zU10HQ4pwb5PzIp7S42
         ATYc3ri3BMug6UbFtKsa4LCyTJlhWERi9T3/L2CXYLP3MAaTIJugME2CorG61II5xzNN
         X7wA==
X-Forwarded-Encrypted: i=1; AJvYcCV0y7PcuTOl8Adc1Azb4R1k9Cdm256s9BziyimUSIpuTqZdItUo8TUlf68xFYAv115lcsmVtXJXjVihit+5se4s@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8VQRmxRKMesUNEAr4fsa1/V7Z2DoYc0XPUUWYLmFb0aZsWfkS
	pq0EmwCED2QqhiClXLNqEc1F8G5CX/oS8JTLqHtkV9xo2hmT/2Sn4CTY7Q==
X-Gm-Gg: ASbGncuOKKvmxfqm2bU639YoXPyF8Ox0csJOa/TauE7J9UC3zEU01BcM9OJualcwfI+
	kMxeB9Od5NNClFy73DHLLWQFy4mXbY8J4YeEsTdRQxiqa7P2+JZgSJuWx6UL8loqamG27JEUJq5
	8nvg3/KD8AaVIkv17KvdCmPlXJzZNxtly0v1sxouJnVYE9/xlP2DeDQOZAYf+Ev6W/YTQBc9ngm
	VjZ9mpSBEfrhWEPabmx5bydMSAlh/kAdOY3UMzd73P1/cnbHouD+ROjWbgXUP3BCYlWGPHpDWg8
	AA/kclNRtIRgeE+LtLuYhAi7gzRTJD1FH+W/cz/27FeIHPjxb1BpdqucBfCk/gKFzw7N
X-Google-Smtp-Source: AGHT+IFPbjdkqPWUcDwWn3gcKgKCDuCT59+nrEo/GOkvbNTeX+sbsXL7iBibXH8JV2ff9RTUgMaADg==
X-Received: by 2002:a17:906:4fc5:b0:aca:c67d:eac0 with SMTP id a640c23a62f3a-acefe63defemr318866466b.0.1746126459184;
        Thu, 01 May 2025 12:07:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0c70c6917sm80349266b.4.2025.05.01.12.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 12:07:38 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 2/2] crypto: sun8i-ce-hash - use pm_runtime_resume_and_get()
Date: Thu,  1 May 2025 22:06:51 +0300
Message-ID: <20250501190651.3863582-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250501190651.3863582-1-ovidiu.panait.oss@gmail.com>
References: <20250501190651.3863582-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_120741_135822_18E04F70 
X-CRM114-Status: GOOD (  11.60  )
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

Replace pm_runtime_get_sync() usage with pm_runtime_resume_and_get() to
simplify error handling.

This is recommended in the documentation of pm_runtime_get_sync().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index ba13fb75c05d..bef44f350167 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -65,12 +65,11 @@ int sun8i_ce_hash_init_tfm(struct crypto_ahash *tfm)
 		       crypto_ahash_driver_name(op->fallback_tfm),
 		       CRYPTO_MAX_ALG_NAME);
 
-	err = pm_runtime_get_sync(op->ce->dev);
+	err = pm_runtime_resume_and_get(op->ce->dev);
 	if (err < 0)
 		goto error_pm;
 	return 0;
 error_pm:
-	pm_runtime_put_noidle(op->ce->dev);
 	crypto_free_ahash(op->fallback_tfm);
 	return err;
 }
-- 
2.48.1


