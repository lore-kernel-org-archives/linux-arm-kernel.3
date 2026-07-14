Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EBEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=; b=r0yTa80yv7j3+914uMK7aNJpAk
	2whgz2MbTp90xXm7UGP+WNVU83rqDkbAxLwnqU6fb9yOCnftYd9ZbYYGbQSklOqRNXLUgSfsC5H1s
	O6O8kmFhlaWZUuup0dJCCvEotWS8vy59Zi/Nd+Cccy5k/k2mFqGoSu19CCkd1eJM8160P5Mv4c4Wa
	LSyL2e8asqBOe3DMhR4DgRGJy4wO8uCasWyrfR/rerRoK/FNrLO8OA6ybvpdrgXFSXqsKXrZIMEPo
	MPwr4b1wFNUD5y8ApnOTBDX1/W5Q0nrk5WB7EOvwJNCGYIxrALMzjbE73XNwFBYiXJLaRbtEuyhAR
	bCu4ISuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdf-0000000B2eO-2Axi;
	Tue, 14 Jul 2026 06:29:07 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdY-0000000B2X5-40kw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:29:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cacf197759so8955325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010540; x=1784615340; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=rNptqA49JIvH+LH5H+NgqDVIYrvRhvgDx0qTYR9YnRuLwVoVvi+hNFbR89U4cNCCMJ
         tMlCGYhoCV7KpuwJiFfd0mwx1Kdw4fgMEKQDEQIxjlVSb26AE9W+QCu/3XkdYWQ2UBiW
         9lTLz7Sb0G7zSNIHP/pp4XxrFVHSI0K/aO7/e0aZdSeBz9lvWmDJzQ3jWCp5ZsE6WBBk
         zmNQtMkZMemn/xQXmoHJKqz/ob0Z/2opyJSTFYPQW3i5E2uOCmXvYCsyITjgfexdXx8k
         WFeWqF7C7ta047oXW7li+tRHi1CrCGLnis/A5I69WsDzRqv0ZzxwGxOb1JmRaN9+yQX1
         V/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010540; x=1784615340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oaLKWhSSM63KZpE/iwvlyOdiJ0F5jeAA8qCl6yAcCfI=;
        b=OqRWM58Wo3RQXh1p8Tl7J3XikoOw04jAuCnW8rqJ5Fj2h3P0mc391SbQSvD7ouzk3U
         +FVsTQqzRXoIF/PUfmdTsrMq1oWwWyII19MQO8j5XtigAmFWZC9MVKDa3OFN6SZppYBZ
         uR82xzGwrGw6ubLX0qFfup6b2jA63YjCpj2cqP7g5sE93LwVmMKxVtslRXsOcQH5Uap8
         oTtB5PI23tc+KoOwwtF87I6XRPOmEQ3yegOy6t7148RwGU5k1kjYWzwXukq923uo1Lhg
         bUzGey4nRtbwHrXM0xFcZwQ1UAHUv9swNUYz05iLZiV0mczPSO3dbk4zmmq6zClZcw1n
         aGBg==
X-Forwarded-Encrypted: i=1; AHgh+RoXjAKmbSIY1I+yAstHv2nhFVq9kg2pDq9th+iKDY3SVR1AeMtAqchvSa7ZiyhlYDD6GpzjinTYCrBsEjHlBRZ9@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn0wm3J+wv1KbQk/llcZDKAFER8V+FxHo24b/0PTADYiCOPNzs
	8LGfCl/n2Go02tdZUrOBaI83+EYipwTB7W9SrNtXL/DFw8ripD57nAHE
X-Gm-Gg: AfdE7cla0iiQpagCPWOIRY1nfi0feIftj1kLFakFVF5HM51XPQlKFiaz39NIM5b6NnU
	wJQAj/NHdVbgdYOy8WucmH15avWHeT5N7QpCWc8QplwtQQTaUg3dnnUN66Maxc50SBGdhBYagRm
	dL+oYA3bW8J+ycz6P/l4r0IwEyTTQhFD/6Krs+5DCmlnMebCTIppB+PA2nER1xoOWnQVEtSqobI
	lcHH9sMpQmG+vVT+Xe3wWNxGk8NV9u9rhKolrkwbSOxtkcullmLeEQL1TbQEet2lQEkghBIqAfJ
	gYqRR/cJ0Au5LafjcT6HO4JqjDnwHPqUucw+zFO5puJ1e6GnDMp631udII45NZAxYzs23pgP0Ou
	iaxGGMqxx/PvUWb599gjaxk6/6P+qs6TdWY0cSkrEh4Zn+00nC7EFk96+CM7AF1bKubeDA1bOKj
	P12HMplY/Av7KhaJvx1tNXD8vx4FSM0Pv1D+pUN7V8RTmx5emxbgZ4skp1gVbAod5sJ++aLtucE
	ostGJ1Fs9vgaVmf4xVDLqpoU/QchpFBsrLRowj+WlmyIYTQiYrVlTRQYShLgIsx
X-Received: by 2002:a17:903:4b2d:b0:2c9:ceb9:865b with SMTP id d9443c01a7336-2ce9eab3aeemr104195135ad.21.1784010540252;
        Mon, 13 Jul 2026 23:29:00 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:16 +1000
Subject: [PATCH v2 09/12] arm64: dts: apple: t602x: Add common SMC hwmon
 sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-9-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=IymUvUUOlIyUk7vYIWm4si7rSp3+FNzQ5/l7gdZ5Phw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xnvaiyaG9S2R1lJb4a1+uHH4be1GJ53PQ68NWXil
 /sZDFe6OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9zI+R4U2df62balzCnA0azfndWv4Tj9zITVqTUmwcKnM3SeTbE4b/ObItDyy
 Pb92Vn5ze9/74olf93pqh0o3ms7OOLdy5ov4IEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232901_042461_15A49D78 
X-CRM114-Status: UNSURE (   9.21  )
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

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6021.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6022.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6021.dtsi b/arch/arm64/boot/dts/apple/t6021.dtsi
index 62907ad6a546..5175797baf62 100644
--- a/arch/arm64/boot/dts/apple/t6021.dtsi
+++ b/arch/arm64/boot/dts/apple/t6021.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g14c", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
index e73bf2f7510a..7585fd609d34 100644
--- a/arch/arm64/boot/dts/apple/t6022.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022.dtsi
@@ -347,3 +347,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g14d", "apple,agx-g14s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0


