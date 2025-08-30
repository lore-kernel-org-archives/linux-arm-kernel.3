Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C56CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR2F57pXZlUmDDCYEA5++08US32un21m5O7B8t3ZqrM=; b=NV5ZFYZsdy6iSid53jVetL/ln4
	xk/NX04t6MFfQnnndoEAqXuQIt4C90S+3N4LAqIdwTmvgsKU+DnnLfYtdeuKVPOb/oHeKrmchwXvz
	a6Uj+6uycLYRcQmsXz2x+Crye1P9ZM25KaGxfcC+lKecYJJF5OQKfxjnbB8QgUbPloars8b8sUTvA
	0mOSUF9SY8QM3RjC2WvDeFSbrSdTx0KiPF7GMDsl5yE5DVfsSVj5Wg1DDsBjsWZAJezLZoxPCy0XG
	F4HybIl36bFOagjb6ezxrVdWDRXg9TZpUL3nQDfJ6JZWHGpHc47MkNr8JHjxB9rkRL5/zPOyhFeLA
	cKgBrZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJhw-00000007oEc-2u8t;
	Sat, 30 Aug 2025 11:25:20 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJT1-00000007muA-2TMo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:09:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-61d1f60aac7so160225a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 04:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552194; x=1757156994; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lR2F57pXZlUmDDCYEA5++08US32un21m5O7B8t3ZqrM=;
        b=t4rf7eXrcVmvIe8wR/JT3bDn0WMV20uSn+8NXbUkDPT1o9fASY9EuogtMjYmbx7zOz
         IBRjrJJEWQnoRJhwnoKSuSq99WQxT5VyTpUXTyuRuLx6WmUu6EkSg8AhuJBEhAT942pZ
         +d4Obif6oXUB+ve2Plc/+INjZ0N10gxmqd77potpAM1i842PLUHq8R6Bd5r4bSGHwJdX
         Exz+ZjzsDlFC69BUUCFDUEejRPPrV43DSMJ8eOxMZDvFpsT6ZgCirMot7JRb8wkc6NVA
         bL3hPIU6yfaT1/RmQqpoYTtlAh1Pp21JDld9W7wbsjudEK8j1o5KPGQJ64o/06+CaND0
         W7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552194; x=1757156994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR2F57pXZlUmDDCYEA5++08US32un21m5O7B8t3ZqrM=;
        b=eakFKiXHCct/uoVI02f7tQjBHKNew/wJomu8n5GJc8WB61gRi4UFUfmdMVfbSwRkGk
         ZK/AY8xHUE+XfW+wj5smWkjHX+SOXIvCgltZXgynhzEPBKG43RpoQFMplZUbkSrcFsP3
         /Z3boJOpSoVYfNSBwO0jSAYxTQv8RTrBk6lh4gsRp9aoPLom2Vee/Y2Ben8Fh0bzNtrm
         Ws2o4PADL35ImrJusG7HTjGQFlTYgyx3Xjo5Blyk6HsAFJYcQidgLgjdF2n36eHjKwEd
         syQA4r5koOyEGrumdM4OmOecQ/nWmW7y8wzFmXYxxnagB4w8AjBNreRIQrMTuQdV1Tb0
         Tl9A==
X-Forwarded-Encrypted: i=1; AJvYcCVA9LVjRG30dErnTQrvHGBgwcB0gDv2uom6VUv0AnRjz5RnnSuB0+pEvD5eQcngMSvFYCzixRtunIgaEGTZaIC+@lists.infradead.org
X-Gm-Message-State: AOJu0YzSOBpFKjD0irAaUOvzajsyhwTxFfon2nqmyxW33u39bqMe5Svk
	UF4Ez8oa3DKWkRZZouVq9ov7LWYLgLqgRI4cS7a1fDUB3b1R2dSYw6bwRBP80clCIfc=
X-Gm-Gg: ASbGnctx5QuMQ2EtL9wlYAMOFLNFv08bFaB5btwWXisW1egmA6nfa505BHq8B/WXCmK
	kHQoyOnVEttR2cHyl2wYLc/697hjL9Y0/c+mUKfiERq7nXku0xgSPY/wxogiQN8LyMeput63f5q
	ls2inc6FYeO3W5fT63muYfj/1a1QkV1HlllatSN5Z2M/z+RI9Cen9oAo1c5ZJyf7gDj3jOTqKpF
	tT9Nqq6+sy/uQzl12IguJcsYHXrQuqNDU9EFwAT+2GR7wo/rK9I7yzT23Su+moAijBpjH3kVwl0
	tXd5i5Z6D3i05B3mFybXTNyu2/nj0nF7C/y/x2ue6U63iIdQXBtbH27kmBporAQ0yPBIb9ws0g5
	EdPzEEyWmbzcKBL4Nie0yfMbchfcV3o5I++M1ZGM=
X-Google-Smtp-Source: AGHT+IEHg6IFH3LpvUBk8gtz2eV/nm1aGFtWrmsvGK8L0WqQQZfDuF8JLAEJnGWmJwRCGuoJqDkE/Q==
X-Received: by 2002:a05:6402:13d0:b0:61b:6c51:4005 with SMTP id 4fb4d7f45d1cf-61d0d5f33e1mr2017554a12.6.1756552194001;
        Sat, 30 Aug 2025 04:09:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc21542asm3285666a12.18.2025.08.30.04.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:09:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 13:09:41 +0200
Subject: [PATCH 4/5] dt-bindings: iio: adc: samsung,exynos: Drop S3C2410
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v1-4-de54dfb1d9ea@linaro.org>
References: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ebjPcUawDuyYiStYmNU5ZL3R3L1PNedniR0atYT+P1Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostv2ZO/eRzqfN09DvckB8iOzzLArEcasEJY79
 KGtOMomiLGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLb9gAKCRDBN2bmhouD
 19RCD/4xQ3Lz5ArA1qhWwyYsVlyQlUrvZkfdqHYEi4Z3pihmEyrnxDe7VcRcaaLD5l5Hf32dvUh
 zkjHWB0psmPLTFsE/4DoNsY3zrb7K+pvqvyPzGOwO0rEG8V8Dl229/x16WBxhY5pG2Edn5s8Z7A
 asw6TY2NjoAQaK+oDCiskoRQDrAlif2cZNdNVuXnOt2k78SbnHcVimLj6zF5kwonj/FPfSonoYK
 ryXfKQkn3z5G6dWXHfgDtA4AZQ5UhHI5wSVZTOHt2h6jYkO+NEpE6d2CqdIbz2CWzA3POOJSYKl
 3fd1XN/yu104EEvJSPcbDdl6+vBj+9/kwfby/ALUtP4KXyiJ7LPWfau8DfZ1PK+9z5QE997+2vI
 nMfRgzL+nvN9A8ePeOCJy9HCpNDYCbDr3uip6Qb23fvPHgk3JJMx6oNeZktf7A6LGmo/FXZNBVl
 TYynjROY9z3MAaTYvzHBtZ5BxLgRVkSrGLlvQdba3HPFjZdFbqprdLoE+50cqEYb4Eam671dNtN
 Qc7wThoHCuER5UKtiP7QLTsTStp55A0RcXoDgLtSgVVwBepZYIezh1cmY6n815AnCErxAhuFRpp
 gcVthAWmYl0jzee1XHTrxwR/dWtZOehvKMDxXG+oJcyxqeugKVHoMrQsgfOddrfMiLlASAf8SWA
 GkMBVLmFCrHgKwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_040955_633913_BC041435 
X-CRM114-Status: GOOD (  10.30  )
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

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index 8069e99ddac860b22c793c3ef9479f720cfd8c65..73d7ba0fda1def433a97d10bce21e762a307e36c 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -18,10 +18,6 @@ properties:
           - samsung,exynos3250-adc
           - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
           - samsung,exynos7-adc
-          - samsung,s3c2410-adc
-          - samsung,s3c2416-adc
-          - samsung,s3c2440-adc
-          - samsung,s3c2443-adc
           - samsung,s3c6410-adc
           - samsung,s5pv210-adc
       - items:

-- 
2.48.1


