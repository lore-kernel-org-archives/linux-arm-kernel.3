Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64651C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fU0HHdQ1hyz6Oi/pxgyRXXgGFlp0DgTNlBw/r19mLUE=; b=oNMdX/eXR4O7HuPONLJ02yxatf
	9PdeOpt8DUWzyhJWl7NFTDLXm/3o4nAoNI4Z97YVsOLacccJYiCZl/4UMFh46lVKTnDIBc3sRsk/V
	d4GJn4CdHifG2nBAVbq3L1pS73x1+ge12fNdef/w8YvRnBp7uQqoqJcaQp6G4JfF9ehYyy1DKSIMk
	9BkQHWXZHqye1beVdbugmpSfZtu9TYjq0zRQvDZQJMGO73O29HpdlYeSMOso0hLI7j4DPmFlOiTT3
	SBko3ruW+JTGvJElaNdOeJTvJEQbWM9SEa2HYYOhBNTQZ0urhWCTkmv0CKY7F/HCMOhZe1s/XCNcy
	9rzZD1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqU8Z-0000000DjvO-2RSX;
	Fri, 07 Mar 2025 09:36:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqU4x-0000000Dj1M-2LEr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 09:33:16 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso246696a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741339994; x=1741944794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fU0HHdQ1hyz6Oi/pxgyRXXgGFlp0DgTNlBw/r19mLUE=;
        b=R9gWkMLrzJUCsy0Nce+HXb+6FI9Of9JLAEdPwsc0cUqJsnnC8nImAkIOutUsgHo/ix
         qYoop9cuHV+ktJM70t8JljdpeB4F23OIEgM+9d3LQzjEW7c1wDaJmItBvsNON8c+itHZ
         RkxJUB6hVePRuHR1h0U1BAmNhWFT0YCkIamEWZx0mkBvKjNaaXS6w7YwGIjiShRbDqVF
         EkrSdJi0d+2k5gpVRvuwp7pT+xm/VcaZ+cgr92rlbcP04wPT0HnEBS71Pth/+Zj97PxZ
         rmpMJ8Up0fpxNYpukTgfiQ7AbbIaheTIBC8AMZUIMfzyByZYkZlGCkAMgSpMOy9VdE0u
         hk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339994; x=1741944794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU0HHdQ1hyz6Oi/pxgyRXXgGFlp0DgTNlBw/r19mLUE=;
        b=qPPrPdysLIj5xxQ2XJYDs5dk1UXlTxugg7tTZG/PzU4QqodYDVQJ3beDSAicfZ1q7Z
         iX9X9wV5j1lIBAJw5NTkBNUvwB1x4wGpbIWpGT++aokI+MdnxOdPBIYwJFaTfuRqcdYD
         hyDYrdk09dUn90r/LdWJh81fJ28gBpbPXu18mWVBXCdw8CqDU/fptSZRiAvwfuFlVg0K
         yTJM/QbV30l8sR2NR0Ewk9AKFJDJJajF7sK4/TQ3NhxfV8jHqhfoD9/F0j3lR+hlGw1R
         QzuHpmpAtnc6YwYVPDrauBN0zQdz+GVuXoGasHC6x0tgnlMwcMe7Bu6s3nEx2IJvlKpm
         LWEw==
X-Forwarded-Encrypted: i=1; AJvYcCUiDb40LAU56r/Bgfhn5onMDCsKo0irNkBNrOIKrYIMUj/6W2sOpohV7EmzlfuYsErwzkStn8kkTdRZbVVLsHVR@lists.infradead.org
X-Gm-Message-State: AOJu0YyjFiREjb9Ap8sTpawjoND961GgjIkRKNu8kLlHS6+HbpQhOe0a
	6oc8wQY4mfmVPBZ8RFY8R5JXuskNdrshH2tmoCvn/SSb6v/dNZUQB/Z43INuxSM=
X-Gm-Gg: ASbGncuj5V/G3/jWKJZsiEtfmTID0yDGUMRuzNcUGrFukY5hN3Qep2OhKcAh0sd3IvM
	xZYsIa0xVdwABBgDZgevNG/uxx68DiJX41nDaEW2+LhbIyjkOBoVWV38laeqMFxoqkGYLttWzjk
	8DILrO/JgVawkcdj1NHLlwPQ7SMGdOwRDClF0muLaKlVARvfgLLDdi4bCq5ecTW+SWF6UxKQrVf
	+gQPpsseRIXmbmvaWAMvlB4eoaQJdE8AsI6/vLus0YsBGGgJK8X4YPkykME2jk/yqf2goP2zL+P
	T44TfbHsZLGIygIlHLOr35Xt3C9TNIepzkVGY/eRJNLMdGDAIPUhB2u4FGg=
X-Google-Smtp-Source: AGHT+IEAJGcNFFbHug7ITx5iMdjawlkckyUu9cdR2GxHKINK8WVBM4YprSaxysEv0Z5OJYbITLcdkQ==
X-Received: by 2002:a05:6402:51c9:b0:5e5:e17f:22fc with SMTP id 4fb4d7f45d1cf-5e5e22ae3c4mr1030915a12.2.1741339993683;
        Fri, 07 Mar 2025 01:33:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a82ecsm2275091a12.37.2025.03.07.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:33:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: rng: rockchip,rk3588-rng: Drop unnecessary status from example
Date: Fri,  7 Mar 2025 10:33:09 +0100
Message-ID: <20250307093309.44950-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_013315_610996_9EA7ED11 
X-CRM114-Status: GOOD (  11.58  )
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

Device nodes are enabled by default, so no need for 'status = "okay"' in
the DTS example.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Drop unnecessary full stop in subject prefix after ':'.
2. Add Rb tag.
---
 Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
index 757967212f55..ca71b400bcae 100644
--- a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
@@ -53,7 +53,6 @@ examples:
         interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
         clocks = <&scmi_clk SCMI_HCLK_SECURE_NS>;
         resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
-        status = "okay";
       };
     };
 
-- 
2.43.0


