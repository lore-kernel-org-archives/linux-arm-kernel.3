Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D5FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOiSS2YmpGkuVbLupvrasgScHIbLrmXUCYTQ1Gz/BGw=; b=ycxOjIXEzPYR674BM3RIMf3FFw
	QL3e8+xrL57alO2mm7v234AyWIVi36kh+PuLy0La4E1NQfOWl7ZaTxGNQwJPkCsxmJhTMiHgSV0bT
	S64pcYwrfaf9hEnLqba8/DgQd0p1nq74YShQFz7iN1JY5PmYC6346vprkSwzXkTLcNw2oXqVH2czy
	sPhTG7TixuK/0PLnqxtfTsrE9d0CAx2kY4NW0jscPhmztCaB4eBvlhE+pBSr+nH+mq21osn0uy3t8
	tGY+Hfo/a/YgA8VnwojzmwYZZEkGvfjii2h30/bkumKUVkgYWzEhQhVmfOidg4iLLSi8w3kTnU9KL
	a1ujjnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbHQ-000000008IC-0HFL;
	Thu, 14 Aug 2025 16:58:20 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umazn-000000005ac-0W55
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 16:40:09 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-333f92f1911so8809891fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755189606; x=1755794406; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOiSS2YmpGkuVbLupvrasgScHIbLrmXUCYTQ1Gz/BGw=;
        b=JGih1vR9d0JB8hcTSx5Rs7oci24rh5c3+2vfGVhMYzBRTi+n0pVqJ5KoeCojOVOkvQ
         PQUU049zMC5kSIlx9ARXlmpBk4UhLMxJbBj34AMls1J7EiENfz+Wt0SGpTYPZDIQ6Mxn
         36ut3DiTICF2eELj3TJCqwLSAajELWaDpGIQOT6ALK+swBGWUFA5Urpv8P3OOFrcbBkc
         T057ydFUkxWHw/K1IyvaC85xzvuvmrP8pe4zKoJj/KoZbcimmwKw6umU7SCFuu/nY8uO
         lhLQGJFrk+gRQf7bTkWkME2chwrTWHtARHoUO1lnwk7e24tkosMjNhhN6v78KD+oW4Wx
         nsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755189606; x=1755794406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOiSS2YmpGkuVbLupvrasgScHIbLrmXUCYTQ1Gz/BGw=;
        b=JSakakKSn+ZGFHM5Fnk7n/WDbXUkNAIJM43teEVQoey2Jbd3yHVnVxFMPYfuHHenFr
         G6LCB4Ur2ycuBAmVwW6aV9xyLg6sQIpxhjZrUp0fJ0Nsjr+aSRlCstof7W3UNrwq6R1s
         tWS3g4nlc+ytS3R96bPp/eQjXq4ATYDWXxKmZkSmNXHEyCab0V9afjBNKtStNEgT9mC1
         4SDg7w6t/D5oHT3uQ+eTtzFzVG0YT9QOyEUtYIoLmXrAeVN2CoGHI/JwswJaT8ny7fVx
         xqWPOprCiIhHc9DOAonG9VIzrosR9duktSw+eyVDeQSZg2ZF3NiiEsaxF9+MbMnzt9oR
         EcYw==
X-Forwarded-Encrypted: i=1; AJvYcCUCmO0s9/OKqSNHg9opTo+cRkyLEcbXGSs5nXyjEge28hw1A9yU9eIBId8Qp+Oj5n8RppXV1AiOeuoFJ8zMnfBj@lists.infradead.org
X-Gm-Message-State: AOJu0YwVi/u+BP9PqcEfjHQa3gm4HL+2pdHTlfEpOL6IoMV2P5mmFljW
	P68ceTz3Pc0scHskCLR4RbvUVkIBcsGG4vQlzplA//ZsazvHtL5PMR/AozdRav34Kew=
X-Gm-Gg: ASbGncs6dXgAu4DSba5c+84Ebqb5TTl3mHkek7iwvGreglgpzg9bhiliQSujxYXs8W7
	8iqtoxRXdSIMuWc/DUg7GIeb4nlNEvQE9dRAYA1kTeLAHHIJgrWiOxeZQwzCYdsGl0eoSdrELA/
	hnDK4evpGl9NXMnX+jBLR9Z3fdU+RcczWZms3e0nxkJdnTWWO0rA3z/n3XoEht2TEo2vsrxVzEW
	A2Nm6H1afLpm/vdpspRC5JEirlQJZjN/+Emw6CShTTLn3w9GaGejHiQZD36QrDquXgBD8rcTDSp
	Sm06RhYjXxgs+KymgMjev4clKcF22cU73ejXaJ9EIcLDHTnDmI5z8ZDnl7lBaUu5PtYeIal5V3S
	ITB55LyngP/Weo203j/7PmJdcXLoJW7To
X-Google-Smtp-Source: AGHT+IGfH5F0Rjfp8cqhDaoIQBEk31TE9r3dqRydObKcWr5Q7Lj6Duc6dFCM5ga9hJFGEoP6TB/BFw==
X-Received: by 2002:a2e:8e36:0:b0:332:1c24:d32c with SMTP id 38308e7fff4ca-333fa8048e3mr9278461fa.28.1755189605550;
        Thu, 14 Aug 2025 09:40:05 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-333f8e1c71fsm3296301fa.48.2025.08.14.09.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:40:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Aug 2025 18:40:03 +0200
Subject: [PATCH 1/3] dt-bindings: Add Actiontec vendor prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-ixp4xx-mi424wr-dts-v1-1-b7c10f3c4193@linaro.org>
References: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
In-Reply-To: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_094007_167681_1BEB8051 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

Actiontec is a US manufacturer of telecom equipment.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47f54079a39f35b570d69f7c4c2274724..a0abe9e39291eb687793d1b4b4187524a004a413 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -48,6 +48,8 @@ patternProperties:
     description: Acme Systems srl
   "^actions,.*":
     description: Actions Semiconductor Co., Ltd.
+  "^actiontec,.*":
+    description: Actiontec Electronics, Inc
   "^active-semi,.*":
     description: Active-Semi International Inc
   "^ad,.*":

-- 
2.50.1


