Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D982BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KYNO0guAuD1jSVG7+Mn2jJuelOVJmSNitmxA0BfO1/0=; b=e3UVtZIygXFbBEqxO7M2egAzWo
	j37h1pO5nEADisqsKTDEA+0K+CiPiSuzsW8QWrsBSLjBGywkjfdIQFlIJ3nBaRcdF7W6mexHnWTyj
	j6n2pV5fMmUH9jh8BASgGvM6FTisD4tOJqlPJRonU3eLTUHwLXcAqO36YDcxMc2QpmqncBSMwiL4k
	H0KBWt8czIL7PVAiGThppWEy4DZMZSaE+BYjKFo0WctZFyifeYV/TpENKxV7GphKMVOw5+ln2erWk
	DscVCX3dkXLU0reJtjW77raaA0gB0hK1SM1qDn9XZsQCB/o2t6CuD+KuEqKVMDcAAVUHLaHw705dA
	cwC+yEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTd1Q-0000000CSlG-0rU3;
	Fri, 03 Jan 2025 08:27:08 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTd0F-0000000CShJ-0zko
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 08:25:56 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa680fafb3eso152180166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 00:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735892753; x=1736497553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KYNO0guAuD1jSVG7+Mn2jJuelOVJmSNitmxA0BfO1/0=;
        b=LDABs43dBjvsuvcnfRUIdsOLcUm3IdkgQIJhVExumAKD9EVX6NG2qv0ox5xARdKXgL
         oz8Fce599ecwjSvZGcA7cpqIMnaT6eyzJCtv00VRlqrQS9ERM8cgDjr3ElyyCyFfGE90
         vB2iEdk4tzhS7ZBhUSG2d7llhO+3fxylaqCYtju9Kb7VUr38XTDvzlqjy/0uz6msY46d
         VAI86Y/Rbht7SptWMwmemV+1Cw+S5Mj6pRjypWXHeIhTCTLEoDISYxjTyD6aZaB3yXPe
         Sqyt6ByoNFdSsWnv06BD/4c0xuK+tFn58QomgCXaEQ+tP2SGcGUE5q8e5f0cGajQpm60
         kF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735892753; x=1736497553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYNO0guAuD1jSVG7+Mn2jJuelOVJmSNitmxA0BfO1/0=;
        b=DkNnMFmRDolEWbdN2pPgQJ+xUl74cEvgM7TaZzCRW8N7dfWhJohcHmz2oIph+jjwoV
         1l3nG61zYEJUvKpEcDqxXmRDHzOrgY4vnxzhxvKsxRnzVEdbhxUbKglj6SfqL16wV1lY
         lxm62aP03TgpHgtFlTyQV8f730Kymw+oRIQIoXRwUrMJO3EDOTHi6S+Mf2nYDojDBUhO
         jKQQEcYidZCSBLX4HnqcV0bZ/51lSaBaJ1MviDfNbWcbKPt0bl2RodtwwxH/I+FPp/7F
         xUKLWm1h00nR5O/mRv1JNvVvPEkS4CVQ3wga00DFIznMPwhQcL/CXoLRIVkzIUMMmHTO
         2Pqw==
X-Forwarded-Encrypted: i=1; AJvYcCV9CDzYenqYMqa1Db3a8vGoGgk+ysjJi5U5nEqvLBLGLU4sG1T4B5Af53+9mJdCYVLYA5ZNE3Cp0W0u0P+I7xF3@lists.infradead.org
X-Gm-Message-State: AOJu0YxJzz2REVREYob/JpcxWB7v4tVQSfNx1tFxFZIZL2xVXrWn5gMe
	cNgfaf/C1vxe9BzrZSrqSmvTsMEDwyzsIc0kJ9ntRe89tUemnbY5t8RFEp7UD24=
X-Gm-Gg: ASbGncssKf+8wzUwICO6nl+A05zPyZseL7l5v31sa+tEzg6Wv7yPqs6CEWJjtgpLRHS
	+hzCfWnC6H+YpGIfTuik18CA2n7jtH0wFMwonPyRmmObpz6/fu1tM239NU2TNpqBsbXkeuLCzsA
	s3SpID6kmt4y71jZzfXklE4aUkCX2i/upNs+9+KISU57zMYStTDt5lizDphGHZ1ri3QYw1xFGi9
	AjEGbNCp8pLaQ3ieag9mI0vn6yAvwS6rkgkXVObQUptFw6/yC2YCLaEn3YmonJhBG6pGhE=
X-Google-Smtp-Source: AGHT+IGWWm2fDcYRYaz/N7szhgJEWFmaFTDYJU8U6ZmPuis5+d3SHG8JFgAZM8+mDcm3BEoTvblddQ==
X-Received: by 2002:a17:907:9692:b0:aa6:91ca:3674 with SMTP id a640c23a62f3a-aac2adb92a6mr1572179466b.4.1735892752966;
        Fri, 03 Jan 2025 00:25:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06dc7esm1868462866b.193.2025.01.03.00.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 00:25:52 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH] dt-bindings: samsung: exynos-usi: Restrict possible samsung,mode values
Date: Fri,  3 Jan 2025 09:25:49 +0100
Message-ID: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_002555_278165_48BDF690 
X-CRM114-Status: UNSURE (   8.23  )
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

"samsung,mode" property defines the desired mode of the serial engine
(e.g. I2C or SPI) and only few values are allowed/used by Linux driver.

Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index f80fcbc3128b..5b046932fbc3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -64,6 +64,7 @@ properties:
 
   samsung,mode:
     $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
     description:
       Selects USI function (which serial protocol to use). Refer to
       <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
-- 
2.43.0


