Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F3BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJdRMzE2sMirb6Tls9X/j5sk41mA68F2wG8ZNddDp4M=; b=mPjyyGxie9QdRr3o6ar3m0FrXV
	rGAd7KxO/6u+YkORQKtZoD5F5ZxPH5Ysq3esp9KTk2ULXwSky2CuV9qqpDxoYr2pPqHoM5G9en5Pd
	f7MWR54t46+gJYVb5JNVwxZioHglKrRTHawmTkA9gcbTvYK2oNHtHJbthCe4IQRg/EwvQS5hoMpBr
	tGze945mi4NVIYyfG70iTdmloh63z5VsakLzY5gobcHYWzZui7AKMd6W0udhc7xyPGAMomfl3gISe
	WuSd4OlEAe6eKgZHayv8mV1Km8EQDwgCBjMDGx6qihJ3B9AMUEZslDsVtfcTXVQU3Nxum+mdDSjgs
	sr21GBMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHe6-0000000Gr3O-2tkG;
	Fri, 07 Nov 2025 08:16:34 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHe1-0000000GqwB-0Ows
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:16:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-429c743e701so65473f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762503387; x=1763108187; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJdRMzE2sMirb6Tls9X/j5sk41mA68F2wG8ZNddDp4M=;
        b=RbrTZpzLKGMTaSqXSp+4ueVgXrLXGGtcE2dI/jbPU+acmCppZyLImAHqtmaetq5IIy
         ciPAKSq4361XUqEg0x4xJdTLgrtSNQsQeN/czuJFxqv98hAqR4g/NMSJribEDq0ETM2W
         a4ybrVu7EKl+nBttr1KLG8eswVVujG/Q1i5aTPPV9t+AJ8Ztk4IoBZSr138klc+A4CXc
         yRCFPjjYp64viD5Cmf9FaJiOhoZkemW6MYHRgyRBs8qVygMAFw7pChRtV87u7akbcZGI
         4EAA8Ugio442B798M+CV/pb+f+K3DGiFH1uI9I2EJQwDImREFHh+Ir4tYJTOJTz0OO2F
         mPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503387; x=1763108187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJdRMzE2sMirb6Tls9X/j5sk41mA68F2wG8ZNddDp4M=;
        b=LdBHGCbNlLoAqym+tWUhda4eFFmYZkglat8acXhm1w1sjW4a9vH0OyQDSLSjoGPuOo
         s0aUYV0+uhjC6CNFAW5Zo1eyJmn/KyuPjbCv8iBgsMCGoKpptj9StYp75trL0Ox86V39
         yB5tllzCpnfjFK1N8TTkBzhrCnKVKls9zC90CwxsmvAJvGFsuM7nhAsZrWc5pCEl8O6l
         b8wplFianMjUfvAWUZYQ60hKKjc1IWg/3NfF5KJLJY7eo4COjY2KYUJmtyiwrZcGX/gf
         fMlKWrk75V9gRLqT2MmG+SQD02Izn7O3AKxQ+bTWxcnIEUD6X+gZUzUnKaNdWtyuhXG+
         VIlw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Q+GMSCrR2itjh2vyfKpoQwvvzPgyBmuVMPW2ZCaGt3CfPgXi2CZWAI031jREgof1L79yGHy0VOKQqw+2kVYD@lists.infradead.org
X-Gm-Message-State: AOJu0YxyZes/Iw3/mYz5uhLczs/4gE0uHXt/f90ZfIKeXtb97beFbkwP
	sR/ErZ+L3tMuo4pjzykr2fxW4LU/kNrqOCScQb1nY92NZg8oZBAFW4sxM1kdXjSYwqs=
X-Gm-Gg: ASbGncsZoq9oU2KHKDUcgZMmegvFQrKsvGHRbCqeD+R7t/ommp4DuWHKsB+pJUZm7Hv
	q32fQZ+IldMq9mNjAT9SzT2br4TItKZvfY52CrBe28Tt49ktC+a9BeuvaVaBvk0G8AeUPFT7yDf
	ge8jK/LVLbIFqb9yIWmBMmkU7sjB1G8BY8xcKQWhUisJ/V8gRy5FLo7r35774ugpS5phHOWkH68
	AuMLtZPt5pNQgnqADSDVEmQ4sTzCzyUbzMNRj5sjVNspQwhM8RQO+74Fq/ofZMNtci6d2xOI0m0
	IBdMAN4VqWqbflUhJlS1WYZ3QNCcZAB0tPEu1kRgPuo6hfBsby34XLDkwFvmQg7rBpnrEtaBxy1
	o2D2dNBP/R3PP7/PI/TmOO4fOwDnZKgyh1EcoYblyl/Yk4wFNGViUMI5nW4vQ+9nPvoko7CdA+I
	gleop2ma2kwhdOrVqqlliSjyG1nsJ0hjMxPTNIjQ==
X-Google-Smtp-Source: AGHT+IGFP+Or1TYRkIggpm74Ke6SdN/q9dCVPUOpMov35dYLEJd55ABeP11Qdy6D7TpbjVv7dJYVeQ==
X-Received: by 2002:a05:6000:4308:b0:429:d084:d210 with SMTP id ffacd0b85a97d-42ad6a771ddmr843479f8f.0.1762503387155;
        Fri, 07 Nov 2025 00:16:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm4058381f8f.46.2025.11.07.00.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:16:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 07 Nov 2025 09:15:52 +0100
Subject: [PATCH v2 5/6] crypto: ccp - Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-crypto-of-match-v2-5-a0ea93e24d2a@linaro.org>
References: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
In-Reply-To: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EokAsdidD5G1bR5/UOxAtpT3N5gkiVxF5vZQDUQTwTc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDarPXV3bvhby1HPb99NpppHEOfCQPiXP0mxXL
 SPMezY6nieJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQ2qzwAKCRDBN2bmhouD
 17SqD/4sJRvlNLj9QaFrjoihtn4kBTpBm9DNcJcEdDkpBrrZRHV5vbXHsL19SheBL+VcjF9nb+K
 SbcDaGWK8AB00dRiJ1ITbkQa/F5OWgeFnhLn7iMdnO+dgGySM8EtgxkVVembbfubkJXNczRGevV
 GkMvt80eET0LpLsk3W/7LGBiCm//if1txGfFqys2QeFpsWFCQk1wVrbp5zzAKKd3I8f9lvssNHv
 jhTDj4W6Azu84Qu0cSZEXv4lOhqyDkGnA6amZzPyNak2vsTbKzi8RPSETuFKjNhi9e/gkA5WHwO
 UVTq6cRtUxy1o4z19Elg8Wgjfb1mIJ/OBC79xSRKUqDUA868qJOghxDoNpPM5Nj+0B2u17MAM4H
 4jo/KJfLbFM5ziArw4QZKC8JJSdCWjJNwPIwgiPoxqI2PApv0mA5NtUJVAiRPLyWM063PDPzMhs
 TBm4rDhmnpCR7YV/XyCbJ/YRGFl8vTpWeooJth8f5WXG6aNnZ+Zr8iFrNj4s90tTp3Z1bSFxQn8
 nMR27brFMMM9b9DgZdhvwNLVG9g9F0WBlUr34sRBdTAZ1gDR6oOxhDvu07HEErc0C+wfJ0KM01z
 37LUf+owsWufXqLfPa6Q5u0Ci/VcUIYm0XHOZULuCpWshPQA12J3DOwZBkAgUzr/DiR3wgOUtdw
 uW5+O/ePtzNubvQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_001629_177411_E5E443A8 
X-CRM114-Status: GOOD (  13.20  )
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

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/crypto/ccp/sp-platform.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/crypto/ccp/sp-platform.c b/drivers/crypto/ccp/sp-platform.c
index de8a8183efdb..3f9843fa7782 100644
--- a/drivers/crypto/ccp/sp-platform.c
+++ b/drivers/crypto/ccp/sp-platform.c
@@ -52,17 +52,6 @@ static const struct of_device_id sp_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sp_of_match);
 
-static struct sp_dev_vdata *sp_get_of_version(struct platform_device *pdev)
-{
-	const struct of_device_id *match;
-
-	match = of_match_node(sp_of_match, pdev->dev.of_node);
-	if (match && match->data)
-		return (struct sp_dev_vdata *)match->data;
-
-	return NULL;
-}
-
 static const struct sp_dev_vdata *sp_get_acpi_version(struct platform_device *pdev)
 {
 	const struct acpi_device_id *match;
@@ -123,7 +112,7 @@ static int sp_platform_probe(struct platform_device *pdev)
 		goto e_err;
 
 	sp->dev_specific = sp_platform;
-	sp->dev_vdata = pdev->dev.of_node ? sp_get_of_version(pdev)
+	sp->dev_vdata = pdev->dev.of_node ? of_device_get_match_data(&pdev->dev)
 					 : sp_get_acpi_version(pdev);
 	if (!sp->dev_vdata) {
 		ret = -ENODEV;

-- 
2.48.1


