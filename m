Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA66D10C06
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yt0YV3G/Lz+aotZMK2Qv9/6LIC8i2CceAvIskO4P2nY=; b=YSX6w+vMYQ4TwHBkw9FmwLJMNx
	oq/sbqGBmWS0mcJpX5cLMnlP3XRUMJNByNAUcWHxDxqpbczU1DyHvi2W3B4+7aIZmFf4UZFlBy8af
	KDAkpHirhB8LrLTraxZSag2Mdfwe+bDRT/GHJsNRFDkZGgYhuwyEh1FYvzAZFCIsJXMZSwEpahCbt
	t9gAWLyr7Qzc3us52kV3wPbjwCuSlTJGIoRpzMojY3M/7/wmXCVoDEuO9XZCCG8K9UlNNsZXA8CUK
	6W61E3yr4v8vng0g5QKF8co7ufBtMcd5d4XHsRKOfplb1/XfkaZKcZ6kUbgn4kfDmMoxe7ipB/UUi
	fJuD8DAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nmM-00000007EVr-0BKp;
	Sat, 26 Oct 2024 20:52:58 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nT2-00000007CAl-03lj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:33:01 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539fbbadf83so4090084e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974778; x=1730579578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yt0YV3G/Lz+aotZMK2Qv9/6LIC8i2CceAvIskO4P2nY=;
        b=NtR/qOQDfxP1DNqziuo3C0eysVyLYlxOs0Hjf+SOiCZvnU9KwiA6UdvsfTELhjUef8
         rvCRrCZ5iu7RBzF9IzYKcRGVwBL8jeLwBPdQyq2QYioJoXs1KbVfCwzOeky22TovhV84
         /5sy8ZjkVWXFEPXv8Kp2CDV/hLx0ylhkgomChkV5N6WqzlL4i6C0Shl6ZPwE9o5wLYmu
         GSeL4lTubHb75Jb1pLhmgN/yIvkU+DGNUdDw4N62Mhn7fW6QkVmyJsTfWhsRneYEoPaN
         qnfnAcoNozkWVH40Nucnnni2AHeZRlMP+OjnYawQKgrLbTnyZNxQyCBRwaW7psd3luTC
         BgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974778; x=1730579578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt0YV3G/Lz+aotZMK2Qv9/6LIC8i2CceAvIskO4P2nY=;
        b=fnrQaaR3bqSejabCDl7CMMqzpcXzHWOg6vj0FQSrmBU4vjTq10q/0oz7pCmHhnuty6
         fTrjRg0LY7xjalzNKdZTunDkJUgg7B7hs0a9djbxZj4YyePwlLgW6hZJFFTjS7ZALrXB
         Eaae9HGEZRPE2xayZrxuXR97DFaLZ7lmIOc1o//O6e+3YtS/QlNaBjz0sKcBbpDjs4KT
         kOdQu0PXKOCUbakBmwFtSxWTQzV2yfyDy2ObQI7Y0pqQ1xxG2T7sjgvWyDaZgdy2tn26
         nptRXmRDm3Xm8VVPz+lJW1pezq+rSxPO9lRxGf9zBhj99ZYsDSWv5G2dWtrEZsLgkL4u
         f+HA==
X-Forwarded-Encrypted: i=1; AJvYcCXhDwwCWGD2w+E9hG9y1F3CaAtRoUZvj6qJBK0RRIBEu2lTkaHCp+KISUfN0N7LcaA4okcWrtLk0SZuklTqwiZR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4R3uDbQ+iEO/Zl4Y38/AGYE+leoQJUy6ySCISBEgU7mJr9iUi
	syfVn8pGGsBHPovOWelzVhUvuPLOERHyg1FWfIQZfBWW5tIEqsIs
X-Google-Smtp-Source: AGHT+IE94seOWjt2vhWS2tlD1plFCn950iTFoMq3FqH1akUBlIephQUCBaDTJE0ncDjQg1eAFgLidQ==
X-Received: by 2002:a05:6512:2304:b0:53a:aea:a9e1 with SMTP id 2adb3069b0e04-53b34a1afd9mr1629513e87.54.1729974777564;
        Sat, 26 Oct 2024 13:32:57 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:57 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:36 +0300
Subject: [PATCH v3 05/10] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos9810 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-5-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=1139;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=BYkuQEvmBOjDeOJiyY2S6irVYNGpBs7FyenLcNADI/8=;
 b=gh2voepCAWzOdRwEp6EGoiNM1UJuCN8nlQjrzfp0lhXDOIUobIKmQErhH3P2veI/Ysa90ryWQ
 FExTP4oPA0zDOUyGoTDJAxdOb5rEXpB0kQqefZHS0fIim3KtlfDxzvP
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_133300_085458_F47E3EFD 
X-CRM114-Status: UNSURE (   9.28  )
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

Add compatible for Samsung Exynos9810 PMU to the schema.
Like on other devices, it contains various registers related
to power management and other vital to SoC functions.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5c4ba6c65e6926467ff0e90142ad62fbd0b9e1e8..6cdfe7e059a3556dfb872818f1b2649ab6b0e8af 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -54,6 +54,7 @@ properties:
           - enum:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
+              - samsung,exynos9810-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu

-- 
2.46.2


