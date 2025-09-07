Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB32ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 21:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=; b=bpX03KiH6Ce3FipkCgejxbvjyC
	74JS1iR1FPv7QAE21smRO7tUZt2//98XOLSUCSwYsu+QGqAUKgilqLJBPKjrzwkAhAhge0Dx34H45
	g5x6bAi/etVj42vD0EyGuT3yphNXv6+QB946zuu8E6War88iq5Y45J0s5Bo2+/aF+EAHjQwBkVmll
	DHvDpyhQosyYlOZZy56mOPeVNOjCHUbRkcg2QGy+bimNsZUSzD4TZQBq9tktJrvOvUV/70XAVV2iv
	1LagW2AqvcdYiT1+2Lw73G/eh5nCp4lARu7PUZs8vOQii9e4a1+oOdprM0muPJQjKa15UbkbsRfYI
	yRP0XlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNCg-0000000CyZV-3OSp;
	Sun, 07 Sep 2025 21:45:42 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvN1a-0000000Cw1i-2Qr2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 21:34:15 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-726549f81bdso38064746d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 14:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280853; x=1757885653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=dbQRHVWdbZSVS+ebymSkmA4YsKMALDGTVUlQcSXFlsrrg/9wC6loHUB3xGuhj9tDVg
         8O4gbxq1pN4T+D7zzstOuxW2DZkiK3JrY0ULLREwsBnCVMffVVSeOjxRPZsOwzyzezwu
         9+Mt60C1Dk3kjq1bFSS92OA70uTKhe7TpJdqpXTV9/70fmwz1vKTlBN/Mur+PAh+ua0M
         KW1b+jLs3WWqDFTeIgnf+1TvMG50GaWMeF+mpmqGziQfOB867y5g6IKDlLMqxzJBi8T2
         utYmqlsUjj3dG3XfJdYFJ9Am9kKBiJ13gnzZ2fTbC0BT/m+QOEddZDV+SEh0xZFKPaDo
         1kyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280853; x=1757885653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLjc6vgKJXwelgY/kFV/7fD4NVClmcvjL7QnlQQl+JY=;
        b=HMqhty1uny4s3NP3/FBlv8HRwVmcpw+YkYXhDJQ5iyZJ4XUrJMaKpKv1mvGNIt+MpB
         YNMRngg6jl2l8Qbl5CsQOI965Cr8fkPz3oRLIy9LlLbiN7efDi5zZvD7vIirJc8BSSaR
         R4MBqJ0F/FMmrc2udUJa3WgYWXwRe3GfQ6C9myt7GD6/jxGBXRGqoHekC2oGoYhrQVL4
         ZijRM3Ddxj6WuAJ2XqyMmblS2cNNivbkqda901aql2JzimeYRJ9eqVY55lA6Qpe6G68L
         /yy7CNzTDl3B7SLyfqm81IiC79kvXr3PIZpvzjKTYsu9pAp4BsXVYW2bv7JDH7QDgK9r
         G26A==
X-Forwarded-Encrypted: i=1; AJvYcCVanD9AVy1qQlgfMmOvEiIGjr9utd2AvwX1NktRtjAJ8VuLtoTedUv2hSPKaK+4sjQ2MtiMoRgDQPAuFZixpvVg@lists.infradead.org
X-Gm-Message-State: AOJu0YwhgVlcOsMtcCDeZ/Vw6oJQ8+TvpgmD0ir1YA9SACMOjuwBMflY
	lSbHKs2v6Ma8Yulw4hWUnhapSzhjaIoUym7YqcVLC1zfzr7KjHZaKSjn
X-Gm-Gg: ASbGnct1hfU5WN7OdxaKoOs5zgUW+95tCX2oIJF/8WTNbSImc7IWKG3/3XBeFiIpe+5
	kdM3njr3ZhnVgRfn1vLGIbrtcUL9q2+TmPaoWE+nWeR8JDDHAnJ2USE/T0rv/EOm3IVui2hUtN7
	sMxS8mDMvo6IU7wRVBgpA1nJ0aa52uK/4kisE94gxnNb0W4P6htkaLZNHpiDFPV7nSvm1DafJKi
	ZfNWq6jxzrzgR5Y6ia4tPRZ8SzZ8BC/f6k/ccDVTT2VxCqVrspokquMjWbPkM0A6y+N5kktkPvY
	MlH9z3DFLChJLu7KzOQyIsFak3tiOCDW9619xuk5/7aEJOp+3qacauAP0shXiPhnr9avV7pJhc6
	shiV096Mdu1x8q4Yk8/LBz2RKOijyrWSsuzDcTBft+g==
X-Google-Smtp-Source: AGHT+IHvQSkv5UMBAORhjrysclu9NOkPSRFN9PIE3JvrLhNkL/nfXO7mCnSw8Az3mTsHJvVnnGZyKg==
X-Received: by 2002:a05:6214:2386:b0:71b:6414:fd06 with SMTP id 6a1803df08f44-739256bd5bdmr66881696d6.27.1757280853407;
        Sun, 07 Sep 2025 14:34:13 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:13 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:33:59 +0000
Subject: [PATCH 3/8] dt-bindings: soc: samsung: Add Exynos990 USI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-3-ae7600491a7f@gmail.com>
References: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=951;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=r2bRl4B4OF/qKIhdCBGgWHHiscJkRg/BHw+S8XdcwM0=;
 b=DxHmMNHSx9WiukarP0O/RBSvX/Q0s2sHRbFhrNVtKsNp/eXZ7T8uQY4OesFXy5tww4GWgY7OM
 zk+/zTkxd8rAGcpJHYEYl9aWg7092Wipie9OcN9ca+uy4F1u0T8sp36
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_143414_623073_3503CA08 
X-CRM114-Status: UNSURE (   9.61  )
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

Add samsung,exynos990-usi compatible string to the
Universal Serial Interface (USI) bindings.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index c694926e56ef991965153b94d704fd53addb5cbe..4a719cea81f9d3c3b5296ba2d45b05dd014a1d9d 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -39,6 +39,7 @@ properties:
               - samsung,exynos2200-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
+              - samsung,exynos990-usi
           - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi

-- 
2.50.1


