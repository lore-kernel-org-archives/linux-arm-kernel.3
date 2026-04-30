Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AC8FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 01:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYgTJ4k5gmQwMKcZEcvg88X5/usv5yCN60/fnybmGoU=; b=uhCQybB7Fm7boKDzapeQQbz7yz
	iVY9o+KUnIJiOfU6dqvlLV2eiFuqJNgt0P2c0dqfloyjJoWiK7uOwWFpnJL/3ZBE6zl26woKqZGqe
	gtXttltx///+Uf2aFuSx1fHe8X5ErYMDgwjncndftDolFDUsAo8oCPZgG9rfCoIvDy4kDl736lnm0
	rRbhVQSr/9yzW5Rbd7AUnATjGHVCedHkI6z847KCHY2uq+zfrf3/aPsiwQr+vW0wkndYXImtrzSB/
	3YGm3xgdgKbJQhi81UkPhxa5daelB+14kbpj/aTOWGsDimZ4z3SlnEysZJn4SW5eJEUPEDK90ic/U
	GYOJVNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGeJ-00000004OqW-3rbm;
	Thu, 30 Apr 2026 01:57:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGeB-00000004Ole-3pXd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 01:57:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d734223e4so231006f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514218; x=1778119018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYgTJ4k5gmQwMKcZEcvg88X5/usv5yCN60/fnybmGoU=;
        b=NqHIcu6ceVUENhnO/zvZpV/IZGqdXLmjK6sh50zIeCQTX7SLjbt6RW22RMnqdyRo/V
         1QgRZkpw65VRzIPe7ojHx85wom/1/65dcEE6N/THTFIr+BxiKCAe2welNbkA4x9EfKhX
         pJrpWTHEACALPHPEl1C4TPCkHeIZ7uehednz/w5WgxoIk2xpqu84YEpoV2qhweW+KcGy
         bbC+rbydQqGaR/IhuqhYtL4t2RzZ+M5hgvCujy/ZhoapLN9d0Y+N6y5mUZCLN0zrgfzY
         NftS1cY+HFmmM3lIfUs1Z6ildCplOIf2mv8wluOyIm1TX5VpbnR5AOy8qsvbspWtLlGn
         qYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514218; x=1778119018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EYgTJ4k5gmQwMKcZEcvg88X5/usv5yCN60/fnybmGoU=;
        b=fp3xedkaglqO14th7U/HJ28xfzV+ga/6B3fXeuGxHmxF/RZK9/kzTgf+WVsLgJ77kS
         4bOQGG31INaj4ssbPha37TmZKMprXsZ98g6XRuhZUaA53UeMg5XC+evU10Pyv3DX9YGG
         iRaJAo2Jq3FxYYkqtvIw1RiSfhC314M/Pv2qvGluE6bnH1DMtFcdD3aD4xRJHs8lVcDE
         UzGYBgsgkc7Un4kbmGbWaOH3o1QE3hi1vzsiRnvlPBVZ26liPREXppM01yovaupzm9t6
         5ObemXnkGsUNASuH4sexP/L+pT3u9aWo/LzAZS9Swdp9/mNZiAzVx7EwzLzhutPHileO
         xiJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OEX7c9/GGe0vhbYDV3Gx7ms18C9n6gsdXKhUAB6IUKuVRF7zhrAumJk41koBtR33mJ02fKNU3ummPr1gxcPws@lists.infradead.org
X-Gm-Message-State: AOJu0YyEXdO6JtN0GiexBCObQcCRq72sPXDNvUbjXGtDirOepekRvhpz
	HED980mCOI4dc1VoM1XWu7r8Jhzn4D7jeRRWZsOiD6tjKDGSZsiy+ZaLFTk9aDN58s9liXLuQ0H
	6njQVXKQ=
X-Gm-Gg: AeBDiet4Xz8DFQhJZx2GU5etZ8EQ1zLM7gZTQiqMnk3HbjIxx7nZHd00eIEDA9cogEF
	aZeLRHEjZ9abWE1BKoW8IuQFPcStkL4Z7+5SlFW0LUsAYXqudOx9IfehkeAR3p7vuXgFIJq31fT
	uuNsaZLhQ6VXq/UvGQ1cUTbfqfZY6fwYchLtypLsYiTDjS996FDpWk6bGtRc9E5tXDVhMVhc5PX
	kxKe6fDnp37AcEbqZYH9IH5LerVPQ/JoVk66K7ElymXPDqSzeF0JdN14U7mvh0i6VytNRn6Fz+3
	nd3I+HJBBHfvHswQQPGUu9CnfXVME9Vkx5PNrsdLPcldsxmiVTlCvb9hOVZCDeffLzExN5H2714
	pMOA3EZvsCjdvquUDOoB+QwCjM7G79iyKmcFkHt3YRN5EKx8yYCNl1PDDvebVulFd9+8DtKJJsK
	c/DttF7p3/jVqLzaFn/BDWkC5KgGLeweHQnkDaJl/xeCn3Oe2I5awwLB/PTn48oaNo5lbgfNm4P
	rm6tgOl2NNbn4dj1taZjc+RIO4=
X-Received: by 2002:a05:6000:15d8:b0:448:6b5f:ce9b with SMTP id ffacd0b85a97d-4495025ddfbmr548070f8f.19.1777514217658;
        Wed, 29 Apr 2026 18:56:57 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:56:56 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:52 +0100
Subject: [PATCH v3 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_185659_972283_0C98AC14 
X-CRM114-Status: UNSURE (   9.98  )
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

Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
property for the 'samsung,exynos850-pmu' compatible so the driver can
obtain the necessary syscon regmap.

The Exynos850 PMU relies on a separate system controller block to handle
interrupts generation, similar to the hardware design of the GS101
SoC. To ensure the hardware is correctly described, this syscon phandle
must be explicitly provided.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..6550c3736a3b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -182,6 +182,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       required:
         - google,pmu-intr-gen-syscon

-- 
2.51.0


