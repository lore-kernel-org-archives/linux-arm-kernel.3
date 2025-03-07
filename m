Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D1CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aWHK9yli0arAp4uGJvEOq4N98UZnlQVuehVV6E0itOc=; b=t5Jdc4+cihWkCD5phQJaX2eHB+
	d3g4GWAxZEcLd8pTwhTu0Gj7kz4BUgauXf5WsgJsAgyoSxaFNZGhFxRAAfS/5VXKbCPhd2Rp4twQL
	n8HTO3Yrpk5G5Hme7lfqyp2nQjNk03/Bd17RExpa/Hw8MnakQfTXWJ20bq02bA1jAd5HDjfq4BM4n
	gTXGXb1HZei8qv5/HnezHlo19q5hJvw4toG6jYYhoGKu++b1WIY7CiyGPsXJvJ0tJCJ3o+NKW37kS
	WHKY/F8mm4AI4+mieP5b64Hsw7p8TBpwqiOsTeNJY7xlrYPIz5tKsjZgbtFyffBdkL7kQ7x732ON+
	mYjJpI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSrh-0000000DWdS-0Gp2;
	Fri, 07 Mar 2025 08:15:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSq3-0000000DWHo-0afx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 08:13:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43bca8cabc8so1645595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 00:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741335225; x=1741940025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWHK9yli0arAp4uGJvEOq4N98UZnlQVuehVV6E0itOc=;
        b=w3J20infl/eUmDV8Q7/13Q0emON7Oc+D2Fw8Oi3gjIHZ9bYJ6yQVEXrM5YC001LAYq
         NkRWQv6g/zKOdA+mdh5LMyHBGp6xlqFodtXw05KBJIYZjYqdT9mtT2aIpwnm7AzfrHxm
         grwqLXqzseW5PtOttJpq1Qt0nkN/LEfhdi2t6T4K5bx0CcJkB8xvOfzP4PEf7tUV7dmE
         lllhInWECDTF6jVibpCIrImJ7L6yZqfpX6MkEK2IS7UQUV5Ffsa+2pImLZPJb16ByEXm
         /l72Sl8JN0NEubWNDWfzq3h3ejKI0cuAzB2RjpBL39xMIyU6cdddIkgG0ppnCK/L0Qmc
         RWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741335225; x=1741940025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWHK9yli0arAp4uGJvEOq4N98UZnlQVuehVV6E0itOc=;
        b=MaYQMXLZBkFwPf1KWVgA503a7PDyvGfEMab+HqLcdLD3job/cvQi1x5HQz2XWAlBES
         uA+YfuwArYL+04+s5gHqf9Ei9XyVkfEpRUWSKF0KEB2Nc3wi6OTynHVzszHNIfVqj05q
         l7EjJTAj1u5d48fVyIX+99nTOK4k+CJHIc/jGJzPIvOC3Il9hUTdshFccsou+Iv7sgpw
         w3B7RN4w1jILtkju2SKo6zd0H48euzJioMMGySC4jLWNGAo04CcxgOwlAq8AjmFftBKO
         VGbcg//PJRi5zxmPyLiPxDC8r9Um8yYbIwskpiUVws/ve/z1MrG6y/gbBD+vJiBpEvmE
         vELQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDooAv5iwNx5EVYAM5i1vic+6XvkRX5kp5d8G7SxKivAo1JHPSDZd+/RB5fwfZe5qbZN6vUAjSqzAZFDRvS2j0@lists.infradead.org
X-Gm-Message-State: AOJu0YxeYBWoHh0m3iO0MCGYeH/53ZqI7uvuty1dlLLCA/QGdE8KRwa4
	P+WM6Xv9oK9L6wnL16HhIRxO7wmx18PPKWS/BBbENwAFLTWxUDTnJz/UU1WOjKE=
X-Gm-Gg: ASbGnctlJ7KZeZUjsUr/o3OHpk7H1yIfPNnXRMQYQjery/Wy+XGHNBztq6WUWXZWsEZ
	r2cZiMWrEFmYneOYSe+uCATSYMfJs4NKPCsweyGSiiPU9tkUiquNWGGajUHE58tK/ZaI3uuZHcI
	a+CQJi7l5YBiKafqUuqxYLGCTFLTP5/l/XcHVGQ3StYQZC+9wNre0G13LPWog3E6hhDNYPD3Xa7
	JBzQr/U1bf7Cbo7ddQFG4ot8i2Rw0OuhAX7YV15cqU0tzJjYQ+h++oCvljheXB3scYSW3sc7xn3
	Cf7b1r4IZg2SYzCgn2zAkuSQLP+GFK549pI5FWl9rlP226HRGYSKGefXTkk=
X-Google-Smtp-Source: AGHT+IF4UvKX11yMkyXP1QJeL56hmM+u2mk3Z+n8AmkHahFOQAmYaNbSy5nTjDw60A7BEfx1RoKOQg==
X-Received: by 2002:a05:600c:1d9a:b0:43b:d547:6336 with SMTP id 5b1f17b1804b1-43c601da744mr6450845e9.8.1741335225207;
        Fri, 07 Mar 2025 00:13:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd91338cesm62267155e9.7.2025.03.07.00.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 00:13:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: soc: samsung: exynos-usi: Drop unnecessary status from example
Date: Fri,  7 Mar 2025 09:13:41 +0100
Message-ID: <20250307081341.35197-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_001347_175967_E5C7FF2B 
X-CRM114-Status: GOOD (  10.10  )
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

Device nodes in the examples are supposed to be enabled, so the schema
will be validated against them.  Keeping them disabled hides potential
errors.  Only one child of Samsung Exynos USI device node should be
enabled.  The node in the example already selected 'USI_MODE_UART', so
enable the serial node while keeping second - I2C - disabled.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index f711e23c0686..cb22637091e8 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -191,7 +191,6 @@ examples:
             interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
             clocks = <&cmu_peri 32>, <&cmu_peri 31>;
             clock-names = "uart", "clk_uart_baud0";
-            status = "disabled";
         };
 
         hsi2c_0: i2c@13820000 {
-- 
2.43.0


