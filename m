Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0C5D0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qei8CZo1xxgUYcxPxXdEFDFdaNhWVZB63aMBYnQ5ovE=; b=OsUKvv2jO7vfRk0NXxagZxO4UP
	tOtFfeSupNJjiB0XafTSz++uvKzJsrtvqcA3AFwJkkwgVQ1OUjLayuOnIxHIXjt+OBqgY5Exf/XsT
	p+4UC/d4pM9L1myOAv7TLB6iONC8wXAzWumahAyynrZFS6m4x0Zdx223k7vU5p+skKrxLwM1K0oU+
	WZpAwmRrYECzG7+lLc3UfVjcL+abV9gzZzxyFyODyg/dxOBSJvtBx93EfMPXSHHHC5LwvQ9+UlnHp
	ajl2SAYIODyrcHpfSsJKt0zfZbpmG7ulij1eY81gnoSdnwkgoLlFPnrtcfSIV+Aav39RMvoYXGnIn
	nuayVD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3k5W-0000000G8az-06Cm;
	Wed, 23 Oct 2024 22:44:22 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyh-0000000G6wO-1ha6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so330394a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723037; x=1730327837; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qei8CZo1xxgUYcxPxXdEFDFdaNhWVZB63aMBYnQ5ovE=;
        b=RfhpoBaErHdRbXLcEa+eRrGBkMZ1M60ez1piJBbJfqSy8mioPqTj69wTFgvRqUtuzu
         VlXfL82s1Cr398KUfgzwIB5msWTYdMUmZerG8mbe2gIlkEynDVzZVqcZ03FbY6uNmRRc
         IAYY0G/BIYnNtQNNcixKv6FJYSutzelh74NYIUcCoswjqGPxaffeR5fBEII6l8LNQHWA
         NzTgV1OfK9Qc923RuMsaDvtZAQ7vcdrwAyWzQBX83yVEf4lra1AbleUdmkO0fYf7l++C
         tRbB5tSzPgqsUeJpYn2ToagrmfzBQ1wmuaz9KYBC0TtF3UveWPe9UENY4s5oyJpKdgB6
         LU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723037; x=1730327837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qei8CZo1xxgUYcxPxXdEFDFdaNhWVZB63aMBYnQ5ovE=;
        b=MgRDSRMvMTf1rywfdN6oXTIYAOXdKotsiGbDeRaptPpcTnUl6r40gHwpNgLBGQ3+zk
         EhZ0z+6CjphcWWQsAi4YSMNA04DxV2ye6gJm05URaBZcCPPlULYSW1Arkj/PXB5QQN1R
         xIDLtTImPWAM7VZCG0A6ZW315PN9F+KtMDgZH9+tlDEl5vy1c8epvHkBv5D1ouZaBo8S
         FPI1lBrr09GVUjcrDTmziCKMS2dPJMBszS1pyx3Su45QZ5NIOgB1DX6AQVgCxFvb9Muy
         j33ukUx21zFtkVY37+AwF4CyQIIKv9Nz6o7yaFmg+ZZ20ItyS2bQxdOYIu9QYD/03UMK
         2AkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAiCBHRtB9V+Y8lVBRJOYleOiQPmwr4MgSwsNZ0pd5x1ArkqBUhhjR+u7dS64O0bsm+DJdgKemryi7LZFm8zB2@lists.infradead.org
X-Gm-Message-State: AOJu0YybUMAjiQZ2janWc8qPzcegbyX2pOo2VDAVtJxROIAEttxNIyEy
	r3V7pljZcb2FqAH38RJGRlKv8DIdha/W6RoJBirnOpBmYQIgC3Ci
X-Google-Smtp-Source: AGHT+IG2MlYAKZYlvMe94SbaRQkSxgeMpGIF4mteKz7fCGGulUtwUDypDLWpSOzDNJGwBfuhu3Nq7A==
X-Received: by 2002:a05:6402:2788:b0:5c9:55a8:7e86 with SMTP id 4fb4d7f45d1cf-5cb8ac7c2a8mr3706827a12.8.1729723037252;
        Wed, 23 Oct 2024 15:37:17 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:16 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:34 +0300
Subject: [PATCH 03/12] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos9810 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-3-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=983;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=LDj646sRIM7Uye6b5RdWFtzBwFtKPZZl8lkysYdid7U=;
 b=kAEwpnMzOkTdaSE6neAoTeGyL1pqXstKKu3mWHnIj+Prn+7oSd5P+8qcN1ITXA5RZhJnuVEtn
 DL6spYCeW5aCQiu4WwNWXNJl631Z+tASjaRpY0AYdcJ1+E8VMM9GZfS
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153719_478531_C8144485 
X-CRM114-Status: UNSURE (   9.73  )
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

Add a compatible for Samsung Exynos9810 pinctrl block to the schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7e6ef8249de6c2eeedfaab0ad6316af135c2ec31..5296a9e4faaec691994cd567bc3805f870aaebf8 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,6 +54,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl

-- 
2.46.2


