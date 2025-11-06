Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837F2CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTiuGCaVTAiVJKKKlWqCv6SA9W0CyzxAyfEzvBxFcPU=; b=gzHzm0DGbplRW8AUsk3ofK8NMH
	5KJEMLtvEAYQhQBk0DCoBxXnIr9abQ/0Pv97MyAD3eDbrnj5YPDCVV86Kzw6DzbIxQFvuxl028pN7
	dgkqKeI1VykqW4Md7PyNywOBDQZtQoCdyErP6NIIQGVNlwA0OFudwRhH9ZP7V3DLdWPbjpapFoaby
	rCAV7hOCPvvCh8YLBQoSkKqwQJjsnU6Ycy/kabMz7jmT4tsIwRjihSS9sqwvp/MRO5/ocSlZTQmZp
	wkbrVNy7cyfeK2Reb8m6soYvtWPiCWdUkFN65aotglCZVRaTjHWZ3h9jHXPaItBKcmgUpWW3gE1EJ
	h7tThOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2u9-0000000Fvr0-1RzR;
	Thu, 06 Nov 2025 16:32:09 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2u6-0000000Fvoe-2cMo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:32:07 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64124874e6dso131681a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762446725; x=1763051525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTiuGCaVTAiVJKKKlWqCv6SA9W0CyzxAyfEzvBxFcPU=;
        b=pEWjo1RFBqWirpvGvOkgF1nS5mSXnmlyFCw1Kulb8gR6GKsmwHfRBgxjC2ac+KjAq5
         3SokXetty1UKTv/BkhkVoV7fzGVPcXLgXnxAPXOABmNQGxI5yZ3lZg2m+7IE155xqavv
         zgBt2MwCtlK87Xunw1vdBU6SZCTX8R6m0Y8RWuRPw/BWJE9OORDwUTeLBldunQ4p3qOy
         g7NnL/XZ77qShlSyk2qCIgtFt2G+0yZmm38PPie5NZrDRU4rLkBmhJg9JrGYuazBzXwM
         ZPPgs4yHVOxQC+23l5hVQxISoBSspa6MYqMxLUwwbWs/yxw+2ydLJDdSfo4gL2Tdwlai
         d5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446725; x=1763051525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTiuGCaVTAiVJKKKlWqCv6SA9W0CyzxAyfEzvBxFcPU=;
        b=Gc2aZDnc2KCQ6CQmL/YSmWH0D1hAm6dvXl/+QSLlBwk5s3zaRTcIFvMQCTGnAjthUa
         EAyJ2il82KfvLBj4aorWfgli+HPZAhtssBI9dqK7gUd5oOUEj5OW3R6qcWnyeahz/H49
         ds6yflhS9n4g3F/Kgkk6f5dp0Dcbks7H7/+zMm6QVjiAxmVosHBOQsu2NkOuUez35M1f
         +qjG9QXOnx1pJ0f0Fp52ouOoogQQ0XExq7MgEb6g9/S5X6Ua4zac4GWKkhjhMu5oMpTg
         +AX0zckmINf8DbcobZFxM3OlhfbV9PD2W2gVVusTzDAbldQQMNfSkZhq/0QQU8dzMqt1
         KKUw==
X-Forwarded-Encrypted: i=1; AJvYcCXhvzbfYoQb51JfWigq/erTUcdgbygxJcljR3FNn8C8DXw+SWDhD2Pyk1MD5j4rdaIqwrmbcw7ICeKIuI0GqNgN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpkv2FYvMFUP974bIhAdwYZClbEsMAqfZJd62YslVtGGEWzx6W
	2Nt9ldH6NCzdYnN+eFqdFwf8mYpwwELDOrlA5itTbemGj+iZ4i9h8MeZ3WAeg5ohPjE=
X-Gm-Gg: ASbGnct/sHI80ultQo65rXXrwrn9ONwMCKxbHyvIv1yCxbb3qRs/zwCm5CqmLI5UFFs
	meKrqIzQv90pPrO1jlSWV6tc8DvSovSX1ftwYcaYzIs3F/pK6ayJ8BG0XfR3aRSk0UvxFyu0khb
	/nMijtynj6AM+CGSCgD7eiMp8NltK/COQ/NmhDqIBGeP9e0v+jhNkMv2LJaJlTYKJC8/3Fbq7dH
	Rr4r8LIahuiDF6ImV6zwbaIaK0nq7Z9+QC5pRW6YdJktsv8/zLrQAN9XnqN+oxhulofycskpk6F
	YOJv5AIt6bGe6RoIjccz5wPxd81MJemELqQxtrTfAoKyPEVNcetg8pHgXieX5257efVMLf/LLIz
	U8swSRz7S1IMkj76GzGC3PZLS+XjmCfVYhGQ/M+a7ZXaXJTWM23lNzTVg6r8a8nj6WnCTNzY3T5
	rddzqXurWXF6I1F+W9
X-Google-Smtp-Source: AGHT+IFJFC9RL8ABDmFdtdRmcZ3Dy1rT+k2Sx6X6okxkxPVdsUhn4dsPyGeIOTfuz4qNIhn0Sy5VQw==
X-Received: by 2002:a17:907:1c93:b0:b5f:d4db:731 with SMTP id a640c23a62f3a-b728b816db9mr234127466b.0.1762446724660;
        Thu, 06 Nov 2025 08:32:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289682544sm249625566b.53.2025.11.06.08.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:32:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:31:53 +0100
Subject: [PATCH 1/6] hwrng: bcm2835 - Move MODULE_DEVICE_TABLE() to table
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-crypto-of-match-v1-1-36b26cd35cff@linaro.org>
References: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
In-Reply-To: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
 Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@axis.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xg80kiqnHSCNXwJUc4z9P8NCrVmVT83uMX9FIiKX5sA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDM17upx0MRGUBjQ/tdX5Rem+B0vFDSLjscqjV
 RxcfXdfCVqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzNewAKCRDBN2bmhouD
 12mjEACNaUET4bG8Ms53cjywxTlnDVDM4fOiiJTV0eNuYz+yQxopkwfslu+z+XpGpp2onkBRQNN
 q6OdnMGXee/pVh49eofDDW+dZ/hGQ6yL89U8WIzM6s3/c56dxppov1yJMj5LlrMSHeU0FF77mDs
 U0fsPQtPxjj9Wm6ScwPdr6iIyR+P+7WonOVJI7J5Tw05cY8deLC67d5YTsjFSg5JtsWYPfRD62K
 IthSFNol6ep5g5H5GzxLzVwQq6CsSmh/cYQZcbf9uLpVLxcUxveU7cKj/vNwmiachL7KlYmKA8+
 y4ZNmA2Fp5TlE/SiLb19tVsvNlO4W+EyucS9aiAtSpXMsWoLJvUe3gxQJf9kzdAzCZEUHk2DxtQ
 Coeth0TfNVAhAvo7HTRETnMR+96s/zYAfIGYVXy9Uj/sFMLH0Gnm2fZMLPNdxr5UXACsytnPiE5
 i9sYVtdf3iMxuwwgEeKozPJOnBn6vEdC0qQCSBl6/GwLdZ4FlcSnS/s3a6TQGzlUm+vRdJdKHOg
 aOpfw67z5/6anqIQqofjgdxNboUQUxnK052bwK1+8DhvW+NJzdmgZDzU69XLO+TOtyEA5oXLWS/
 5tBcJIwCkATSjUWVfT49f/FAop4Xw3oCBAh+KkVWLRkvN8+lc6wJ2N9NELiXOG/Ez3sTmWOBG33
 uEcbGns5V48mkVg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083206_681556_298078A6 
X-CRM114-Status: GOOD (  13.07  )
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

Convention is to place MODULE_DEVICE_TABLE() immediately after
definition of the affected table, so one can easily spot missing such.
There is on the other hand no benefits of putting MODULE_DEVICE_TABLE()
far away.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/char/hw_random/bcm2835-rng.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/bcm2835-rng.c b/drivers/char/hw_random/bcm2835-rng.c
index aa2b135e3ee2..0b67cfd15b11 100644
--- a/drivers/char/hw_random/bcm2835-rng.c
+++ b/drivers/char/hw_random/bcm2835-rng.c
@@ -138,6 +138,7 @@ static const struct of_device_id bcm2835_rng_of_match[] = {
 	{ .compatible = "brcm,bcm6368-rng"},
 	{},
 };
+MODULE_DEVICE_TABLE(of, bcm2835_rng_of_match);
 
 static int bcm2835_rng_probe(struct platform_device *pdev)
 {
@@ -191,8 +192,6 @@ static int bcm2835_rng_probe(struct platform_device *pdev)
 	return err;
 }
 
-MODULE_DEVICE_TABLE(of, bcm2835_rng_of_match);
-
 static const struct platform_device_id bcm2835_rng_devtype[] = {
 	{ .name = "bcm2835-rng" },
 	{ .name = "bcm63xx-rng" },

-- 
2.48.1


