Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D63C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJZkOqtqIFJNQlkOlUTiGoivFhrWHNceh/fOrvQbc9Q=; b=QIL9htdAEH6yNlPy6LwTPkeXvY
	3z32TVPiqVUqfjiBK+BNs3lfuZfvIEpj+hekUbWLIcSPtfOqZROP9SA1YQLL1dk76UgE8uQoyBkDN
	Y9s+k2UWzwh6t92aNTB64ryHhpYMndmwqlnfK+fqyv8NEbrtnvYzVUNC+611/VopMvRawILGj4RFx
	T6k9PQLblsH3GoO0rXbqRr0h75MCPHT7blGul3nAHddgL00ug18il8lWx7btXW27Jyugdm6Q4mCTF
	EsbI+miFW0Kmk0Fi78UUs4D0bQyY/B0yOzZxq760VtPd/KSjODTs+xwgnlQ9hh5sq7NiUoiw2UNOo
	Dg6eLPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KZo-0000000HXn0-2HZV;
	Fri, 25 Apr 2025 15:02:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IRD-0000000HA0d-2jUZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:45:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso279507466b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 05:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585150; x=1746189950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJZkOqtqIFJNQlkOlUTiGoivFhrWHNceh/fOrvQbc9Q=;
        b=gpnHYySPCzhjPBRn1+5I9Sevy2INvCsB0r1ZHP6naNJUyCfAVdlIMBqxNnx5rbNfuc
         BWLMASqVCZJnEYU3CmcTgrVF1gN/17t2zkS46/BODwDGusqmKr+lWJR+GeO4iMPuCeLS
         hmfQyDmDVl6MK0an6FjA/hzQUOemrNFcMdhGq3pZHrCbT/OpKQliDYGB7dv8N3hPtH2f
         TUdQOhz30C4774zKqq4+0GjgqNcSQ0xYazkce1VSOHvsRepYPRME2JJdEk0SdDN7CN9/
         wVtQNwzh1xuPPL4isHUF6EGH79MGlMUXYk0E8yZTMAOmdywAfc9AQX2777DxUnVZMKUG
         +wHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585150; x=1746189950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJZkOqtqIFJNQlkOlUTiGoivFhrWHNceh/fOrvQbc9Q=;
        b=jotLNW3tH/z1K4rNDaa6RtoaNrOR+2fnjG/pBrVYuHyA4H40PHGoWXqBFQwqgFSWsj
         vzM96DaUX2q9JiTUVdv1zL7s9NP6CcLVSTwMBhAmBRmkFZumb/UyQJzmCOY9k4TQK4mv
         QvIIcP2P9gkkLeshsRYj2KH791S++NC7z2ZIbVhrit5/m4XLNOgEFzjAwMbQLnbeJpCi
         H0tRtAnyqdy7j7ksoP/QxSBq2qbVBYpuUtrY33zOVVuYEFk3F4nJzbGbybRRNGCZkzjP
         84joPPm+uXrhMdG4tTKXhs1wFmnwYQDlBz1R2SSFWkjRu6i2NeA+hQEiurwp0C3YiNgV
         5NkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHus+sBNdBkcjhuAgHDdpLSKo1u9IV7ly+acR5MW6kZvAGxwjbdXCfeTH+rFgT+zTrM7byNRtEsgkFlzn78oE2@lists.infradead.org
X-Gm-Message-State: AOJu0YwdSSWKtwo3qgCpQdz/+Vpv78mqPscXDgHrIY5T9DrAWkD+gKRQ
	fcnscZTJ75FpW8N94+q7lrxdLaopQk6OIL21CCS7AlEDyiFXxwaF
X-Gm-Gg: ASbGnctRJmvmF2scXc66LMAOzj5ISSUi8c8Eh1NH/lFjaHEawG+itUW2Wx9pb6/UCin
	peUQ5quvmGtZGn5+I0gHRCj6q2FFaz5lA0S/h6wTHSdN3eiiA3qsCp7RRfVzYqgMjio2UQR6MNi
	f/isHCRyXsFyCajBZJTv9Hd3k8iCv2/ShhFwkQOvogDuNNkVZdpLFA45Hrs3U4RJTPiniz9iLOq
	U/WKG3wPUX6vrqGfl+ctCrwFxTIOAwZX92zJNGUb+bXA5WSGZVG9DvzrLoaVWdeZkTs4SohuJ8g
	TMJ1LRVIKLlg8ppdlQY8JUFfX7WnGxR90MdstPQxnTLo1tHna8cfB45AiD72cz7rhIcq
X-Google-Smtp-Source: AGHT+IHX1fUvg5R4L0dWk/e/ZPWlYj/hBTwXn2LGbh3X7N19EfXlUA+lvP4IWHRCaDEIAuZ5mEtnsQ==
X-Received: by 2002:a17:907:7ba7:b0:ac7:cfcb:c3e3 with SMTP id a640c23a62f3a-ace7136ccadmr194648166b.45.1745585149643;
        Fri, 25 Apr 2025 05:45:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7094sm134641766b.56.2025.04.25.05.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:45:49 -0700 (PDT)
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
Subject: [PATCH 4/4] crypto: sun8i-ce-cipher - use pm_runtime_resume_and_get()
Date: Fri, 25 Apr 2025 15:45:17 +0300
Message-ID: <20250425124517.2225963-4-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_054551_689008_274755E1 
X-CRM114-Status: GOOD (  12.17  )
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

This is recommended in the documentation of pm_runtime_get_sync():
/**
 * pm_runtime_get_sync - Bump up usage counter of a device and resume it.
...
 * Consider using pm_runtime_resume_and_get() instead of it, especially
 * if its return value is checked by the caller, as this is likely to result
 * in cleaner code.
...
 */

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 433cd18f0b5b..471eec743f1c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -456,13 +456,12 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
 		       crypto_skcipher_driver_name(op->fallback_tfm),
 		       CRYPTO_MAX_ALG_NAME);
 
-	err = pm_runtime_get_sync(op->ce->dev);
+	err = pm_runtime_resume_and_get(op->ce->dev);
 	if (err < 0)
 		goto error_pm;
 
 	return 0;
 error_pm:
-	pm_runtime_put_noidle(op->ce->dev);
 	crypto_free_skcipher(op->fallback_tfm);
 	return err;
 }
-- 
2.48.1


