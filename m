Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C9DC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vprohxk3JreCnU/aMQ3Cwcsm8vUQGIhxwt5YLfMxZE=; b=AF3ywfOatV+9LxM9Lrardq6sHl
	Y4TPcfMYihHTOOlXAejyM7yatZJ+4+7ii1IKUzWxF+BWv0d/ZstPGyv7KpbeBnQ/ampvwhXdeDsLs
	EFL7USfAQOzAFex03YZFlJDSLq/996AyGe6iPQdwhckadvHrg0m/1l6L0zA+8m2MNw9uZv4BrqSbv
	WyY/gQPm6uPtuVSAuE+h9y89dUH/yn16mXeKxKg0lze7xactodXxlWO0E/zhWsJXXe6ekIQqGgj4T
	2aQ8s1ZWPi/XZssplsotc9oDrJpdSNT2JTeYe5Lk7T1AsccPbepoW4538zx0rDVP/9837kePnDbCX
	hHOoygYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaLk-0000000BNJ4-1dug;
	Thu, 13 Feb 2025 14:37:56 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaKJ-0000000BN1o-1MkB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 14:36:28 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fbffe0254fso1767882a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 06:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457386; x=1740062186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vprohxk3JreCnU/aMQ3Cwcsm8vUQGIhxwt5YLfMxZE=;
        b=R8m7fMtVPXZweOOAYTj0OotPjYLt+/l4nVSPzEcGSf5NIZEsJWsKkNQSWijlfpqmy1
         yCAe45oHZoEPrnzbJlLgeI64Kc9hrF5B9i+h1lv0tY1tYZHxz1Fw4DcbrfU2SkrO64jY
         H0pHt989qY8/hVpcwR1u3xxPR50T6TXi+yAk7NDgeNAx2dLCnAPgJ+rULo/HJNmQERV6
         qbzsOJe1KLXysiWOUVH1jaQ6BTxrMxLUZC4WNKMPkd0IE43F2J0vjxLA3/aSilLGn/vD
         KrgjwLMqRDBpxFygDLLhFmTMzK+3JDbqXrzz2z4bt2jNKoebZFk00r1k79eaMzLuGH7g
         7T/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457386; x=1740062186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vprohxk3JreCnU/aMQ3Cwcsm8vUQGIhxwt5YLfMxZE=;
        b=COtNuNFSygn6FuhCo161CvAdeZyM+Q6umj3QVEKPR1Rv1eS2QyHbAylinIFTI1Xrxi
         7kss38eOGJV0PWKE+zfIYuIMfdrCgrUyEKP/W8i90QUxbBegdNZqM3GauHAIf/IZgAUA
         wGw5hCu41hTm+Dji1qvlWIRKpSnjK6MIBfRO+4N0y9EJ03kcnyCZDY+P5iYNOzfRG8Kl
         vzETpAz4BhX1vtTJt5bIHFDdUupMSQmo8EypQR0qVwYGhHX8N4PPCNF/0V0h6WECGAMi
         /X2rpSXE1OX33SdFbZ12Kjo0m4nv5dSjGshg5w45cpOtfKWlGggliUR9LP+oZiIx7Je/
         hQOA==
X-Forwarded-Encrypted: i=1; AJvYcCWUmICnSkW07Y5iTbW8EzCk8OJoEebxcDiC8AdRiU450csc4tL1NQZzpbSaz438m+NLAp/UKMVTlvFh90qkYprd@lists.infradead.org
X-Gm-Message-State: AOJu0YyjxhrZ8OHSRQGGy4tbj3ZhJlKnjEsXcoKRoIkMCC20no0d4kh0
	P+fjwQ2EQpTYnuM8fxU8arEr3m3ZRG+2f3Q0fHQBan/Xvc3+pD2q
X-Gm-Gg: ASbGncunc9dbvKuoGQZVR8CSnXNoFwKq4LLm4YwVAEplcyH5mHnMfKbTTZLK3B2kgOC
	AlkyJJl7fSEUu15fxx+8BuT0xCf6UCgStmsoOV5hfGA1I4+eHgSUbk3WfR8Yjk4bQv3cuIAajzf
	r8VBfXBzez8Mfqa5ugatVBUPlscj9gIdfUypdxwmHVzmj9t2aYwKxOWa3HbeSM41YlMdS62Dggu
	RxhLGSskk6eG9RAKgylHaVdMCqLwnfZED3zOfaS5kXvf1dIGVoAAZmPr+pVCoQZmJn3NVatNwJL
	xuH2Z8oguyj7tc21qA==
X-Google-Smtp-Source: AGHT+IF4RaBshAbsZAbU0d+7OJwZz5y9P8mEbE5ZRo5bsmk6xrlhZCkCowKA/tadWVVR+OksLyqQug==
X-Received: by 2002:a17:90b:264c:b0:2ee:8427:4b02 with SMTP id 98e67ed59e1d1-2fbf5c5e239mr11221868a91.28.1739457386366;
        Thu, 13 Feb 2025 06:36:26 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:25 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 22:36:03 +0800
Subject: [PATCH v3 01/10] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v3-1-be7f8aded81f@gmail.com>
References: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=IvblILNfK65nRmNXFfVq27lzQtZVkqPdlXpIO65Xo5E=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNi6bH9gq/2V1s/QQdHuEps9tUpFBbFo4avc
 B9WT3691ZiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYgAKCRABygi3psUI
 JJzMD/9JKed3nvtgK9t/Ni8ZcHFenj8Iiwp/D4Ve9BJ1bFG0fhvJrI+hHA5klcqShBgQOWuqsFr
 yHR5nRlQFoeSHj8Bv0JyO2eONb8ebbYwA/XBkTvbZ31m2KRtDISJJdwsL0vdWO91li87Yr2aPIK
 b9HTj4ZyitNTlZe55/iiLXFHPd7KjAJQ/tYu1cnYgUSa08myxtyZ2yhWe99ka1mwsFtiJZdrXWb
 3nv6uxg50Ufg9mi7+10vUOLpxjTtRbqoYM3Vo5SZEUyMGNGSx5AKyymujuwS0QV5/EdiqnAutme
 jE1mJXD/eJAtbE2yUaGYtmsNrvcS73bfE/JQlr3gvBZX24t/Qa1NcqgsmTYq34RzdOC2zW/LnkC
 pZ/YC46UqKPe48tnPgYWOSGJ7Ek3A7QMgqRVViCtlK4/GkcaQTWrxzWFXP8mPh/3crSN7MC05C+
 6RY1uZV/jFbA+GZvxzg3YzbbDs1HBagXnJu+52StdCvRjdd0548KzCxIgwdnMsHZxm4re4QtlT4
 TlsZPCDlDlq705jcV19amdlPkXQCBYil9tOlpw3XA5LDxyJ+W0eX6veaaj9rZTjqv+ctqGzT6FC
 tMCCe9p03k/evtLh3khQQ5cwm/jybS+wIfPQfba4F1aBdy3uCXUs9cdD5UQqi4MesSIfpq5tDIH
 fefeh9ckgm2E7Aw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_063627_366632_1D0231E6 
X-CRM114-Status: UNSURE (   8.95  )
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index a148ff54f2b8a92fa3fcfa78c1bcc525dba1c6dd..d2e7f19cf6a2d7d2348d163d37c2787c7a36bbd4 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.48.1


