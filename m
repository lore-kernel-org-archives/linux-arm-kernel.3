Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C21AFD8FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmmAx1S14LmDHsFx+ndwJCjg5ME4U7XjD590Zfkzuzg=; b=wY+RZq5d/dRSrZD6qStBrQRF9w
	+/bMuTgjMhHKURWMmiRnFV4zTpcQkF8KHdNo2YFjLcjkx+ubZ4k3cXHrFXJgsiUr6uc9jCkHXMErZ
	/Wep+3AeWZf23sS3qrcTjJSU2K8rYdd5rAai8fyUOX7rgl5064WcC/cA4mUNVxUvJxbjaj63w7m5w
	3zMbiauvYLqzl3hT2b96WIGu315rIoEIjaXY+qIupjv0OH9OR21rnv6rtjGIa+8CqONTGgJauTUNQ
	n2MLQK1HPhW1wFQ1BYhG02uffI4lLaxUNKv/BifQHekLV7oxW/f+X0/N/59jljCuPNuEH66pMCTg1
	gEXueSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaC-00000006Y5V-16rN;
	Thu, 26 Feb 2026 15:47:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda8-00000006Y3w-1o0F
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zmmAx1S14LmDHsFx+ndwJCjg5ME4U7XjD590Zfkzuzg=; b=SKTSTLNVCFlVbzpH5Rn8IUPeHW
	jCVeL5bceQaTGn2qjf0bVuASi4JrcM3lIDkwOIXYN5pzcMpvsMQ2Tok4pBZwTZ6lWJyvBrh/8OPju
	HARk5279baQsSrjDGoiZIq9nkH/MPF6SkuyTx4uZzEdqC/b8KIwudZhaK5c9LMiYKioRibbft8Diy
	eLmUd+4RS1qsfeKyEnhsC4uCbzy7QMwyogAHYGA2+Geir6QXbtPbl64rOLdQxodD3PxjYmfUJ3Gj2
	9UWK+e0Z/FJ4nJ2K2DPR5IoVyU8QbZBaUoAtA3tGNQeldGlFo2JtklHwWHmuGc7vogissQtn/dVMr
	cLTLyKLQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda5-0000000BMxf-2W2S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:47:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso9185845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120832; x=1772725632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmmAx1S14LmDHsFx+ndwJCjg5ME4U7XjD590Zfkzuzg=;
        b=broWECBdjFnH5nwgUMqai2kg989EA1VNct01bUPKR68FmDvEpPNPPZX6QlgyKsgs3t
         jJygbKLpA7Y8Q+mhuSiglUi684ybZ4hQeg1WKxjKcFdVO9HyZaxT2RL0O96eGftLzFha
         yquGrt9oJ0qj4FRZBqFhdREkn08Z1qS6CICby3i6cjrr0a31vV0RZORZMkkeJZ4BgErH
         Fv9Tr54aiJICEWlkGudZY91o9uX3ywhiFKBCR7RZkwz2OsSiv2NDAVnSEwHiryujosh4
         CX4IDFd+utHPi1Fasf/qczsL9pXKCaJICd2qtVZZKFNb+Pnl70FGaFEF7fc3ZntnRKJN
         r+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120832; x=1772725632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmmAx1S14LmDHsFx+ndwJCjg5ME4U7XjD590Zfkzuzg=;
        b=LWaHCoCjkP8uT6BIY2HhX5bWYtwSlJB8z32AkK65HZSIyntaIMkWoL2RRKapDZC15G
         6z/bQK3ZKNoTp2vOuHLhptMVblnCRiFMrg4hWudEMThDGOPx+FBVovclfHgVaRRHJmT9
         sV9EZcgi1KydN9RwRhGGniv72Kv1UVxFxWS4DzB/Cibq4UUnJ+bD5qyDss/y+uPYwyt5
         wa+o/blWesH8H2K7r66pB3qT+tEa0SQnEePDy12jxRdg56FpZDJzg0t7rwychN7ICARy
         1nWgjuxXze+KUExY20QX1ksko5GpbPmcaMKhn2CIzxb1FBRVg4zJd1Dm5xR5EkYkYzDA
         z2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVBomzEO/M96uMNVdfMbkcoKS32WCrJFtC/VOGhvVjdpT2S0jFOrmi7ZeJit3tIxCL1OuNwXadSafjeYmQ6zwNT@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ5BSkrrYU/ZCnLu94Rx90f2rLbaQoYleem8qu1BIgGAysnFSP
	qusRHAw8pWYn2pF7j/WrQ3smvw54jJTGVWDuq5u/AnPv2V32dpZrg23nYN3mGyRnLlg=
X-Gm-Gg: ATEYQzxfpWaahPkXuWf40oCntHplO2OUKhw/nBmlwV61pAuwkCXVnxy3MvpkUbucMyr
	XcAR/yXqCLI44m52dWvniK36R0M8CI8zixXn1lBmk8eIorAekqKq2LA+ceLPWmd+JbCuIdLAudR
	AB/QCA4SSpRhM9F1YWQxsln7ipfXM5PiLoSTFoxvnhIVaEH7w+NvW05XfJc/WBhD7FKypYRe1Bo
	F9EJRxqo0Ju92Zdeo5dVNqtWwLLmgumSQYk5qUI+Xv+YUN6nNoO+vfBejwGsWk2MTmKIgJaVa+X
	X5X2iV6Zii6RRzF5EP0js3iQ0T22WocQZpXZ/1VCk3QLT1iIf8YRTtltPMJd0gvEsZOQh1VGwTi
	csWLcTzMk6OT9odSNftLgTyeHfaWK+RaDQMWpvY91f1ucS9L6iV/CNuyJjyc18NOC0xUiHvPgkX
	AiwZeNQctch7oOgm/fudWm8Vrl/bVE4PsGqCnCYV9pmq6gaQzM56hLrtEw3SfKhrNaxcsC+b1GZ
	ypt/fDSz7BKVPk=
X-Received: by 2002:a05:600c:3b0a:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-483a963df7amr351710945e9.33.1772120831805;
        Thu, 26 Feb 2026 07:47:11 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:11 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:08 +0000
Subject: [PATCH RFC 2/8] dt-bindings: soc: samsung: exynos850-pmu-intr-gen:
 add Exynos850 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-2-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_154713_844174_867DA487 
X-CRM114-Status: UNSURE (   9.99  )
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

Add samsung,exynos850-pmu-intr-gen compatible to the bindings
documentation. PMU interrupts generator block support is
required to enable power management related functionality
like CPU hotplug, sleep states, etc.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index f9b40f3fd165..df23467d0e0e 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -15,7 +15,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: google,gs101-pmu-intr-gen
+      - enum:
+          - google,gs101-pmu-intr-gen
+          - samsung,exynos850-pmu-intr-gen
       - const: syscon
 
   reg:

-- 
2.51.0


