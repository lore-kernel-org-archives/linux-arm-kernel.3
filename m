Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D130D0C601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvC6tvQpNPhsh9+31TY8jiPxbsRMSiM5T6Ner8SFI7g=; b=NCZXylzk71erA6wMS1nxHFN5Ik
	qV9QXuQ71pz75VpI/++bJpe8feckdn8FF7TEO1386MhtZfdV6420FrglKKdLjNWtuti9zynZPLouo
	Xg1aWG/L5Quf5K0j5fr8b9f7rOg50NMyjr9MCmg6I0ZSGh8Q7X77LRntufDjuIKYuZBfQYGyF1CKB
	ciO7nDQQiOcsi9YtTS8K+uc9d30ZS1iFKHW2/rBkrjMo4WAkUFQ/qEC5R3/5ZuT2GrRUCybj2gCUi
	/rTDHPJqtMmk5zshiClvWx7atpH40sKmqMeVSXlkgg1qDjy61vkEnfsRSUNyIwOV9atrvrLnpJNtF
	qdDGN6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ioo-00000003YwS-083b;
	Fri, 25 Oct 2024 11:49:26 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IRT-00000003Uze-26X4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:25:20 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539e8607c2aso2244285e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855518; x=1730460318; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvC6tvQpNPhsh9+31TY8jiPxbsRMSiM5T6Ner8SFI7g=;
        b=VzxVVN0AJBHxfS32XRUbwiie2TsGnEnjMp1lX2lfO9SgKJC2xggTbNzs2ZVrgAs+ei
         YoXcIVF0gPDk9MT2SAjFfSn5yfFN60sXF9PyPOONKrFzh/mI3GPkkreuuzbXGCLIOmWv
         EkBpCMEztmMIvQy1F5eeTXZjZa/GKqRlOlYhQehgFruVhlMgK1xvqPLY27UkFOEkLv14
         nXq8dIBL97aQXogUdCpQzC0Eissq7vPm8jyXNjY0KBlXrMJ3aYSJpZxNmctrbkUh09oQ
         QGIe8Ui4cwqMNWOeULDJaI0QFIuXR66ttQCcT+it5kC/5AS4Zs8TfW1icmsG7BqHN4pD
         EFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855518; x=1730460318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvC6tvQpNPhsh9+31TY8jiPxbsRMSiM5T6Ner8SFI7g=;
        b=pfIzi3cewkC14nlv6ebVmjMdzelxD1tp1VUHmDp86Dk605EPQtCS9AE+qyr0BH33E7
         XXp8L6SlE2pVIXDmJaRJM/gfP7b4HokEgygNP3CFbYWK968JjeQuSPJzxJw5y2TLo1WC
         NIxYT08jp5HCYpC7z6pGlp/zj3X2PKbL3buj4vMHv9Jyrduv8mpUWi4/o8QRS6/msThb
         m4DbNBb0pa6rhKudnen0fCJEbg0Apgda0MTx/XnpVKqjv4bxgP4TXtn/8CwZk6KObe2w
         /CRuy8xyRufXNw0Kecyn83FdXc47Dj6RqztOAuWW3PMA55ZZPMyE5+ilnZI/77+jMjZw
         YitA==
X-Forwarded-Encrypted: i=1; AJvYcCXk46jx3t110wS25cmowpe+pkSY/r2Xj6yg28z1IwlPS/sdcvWwZa4lcD1Rrr2XE49/i8aKrl4TwmF5252R6LsX@lists.infradead.org
X-Gm-Message-State: AOJu0YzKR6IqEW84b/SLKtAMWPi2trwGh1iqQT143TwJGwHUi5CX0frf
	BCfyz2PmxV609DIM7IlfzxdRQuNEcxJ8SXwpIZ1kuHacWelx8a34HCX8cA==
X-Google-Smtp-Source: AGHT+IEONmK3EqNWp4ION2KugVO6B1hwdllH6wTUgZsutfMNSrjvSI/avK47fOi+sOs5xNNmozjsLg==
X-Received: by 2002:a05:6512:b0d:b0:539:e6bf:ca9a with SMTP id 2adb3069b0e04-53b23ddee9amr3249227e87.6.1729855517710;
        Fri, 25 Oct 2024 04:25:17 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:17 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:54 +0300
Subject: [PATCH v2 07/12] dt-bindings: arm: pmu: Add Samsung Mongoose core
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-7-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=909;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=gIFcDF3Nn6a13khPJ7KdJaPJmVQk2lFc9U58rW96C90=;
 b=Xzf7ozUZ1q/1szWYfZVgSzhsL4JnYbG8DEq99qnIfLpVmOvmJOCvyh0nKtj1bvGBmRExXcn9E
 YF7V9B58yKTATw5eyOEgWrsP9PyqRpzj2XLIpfup9Co1vU0qKMFygZp
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042519_580881_62F43C88 
X-CRM114-Status: GOOD (  10.29  )
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

Add the compatible for the Samsung Mongoose CPU PMU to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 528544d0a1614c9f9bddaafa8dac4782d09ac7e9..a148ff54f2b8a92fa3fcfa78c1bcc525dba1c6dd 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,krait-pmu
           - qcom,scorpion-pmu
           - qcom,scorpion-mp-pmu
+          - samsung,mongoose-pmu
 
   interrupts:
     # Don't know how many CPUs, so no constraints to specify

-- 
2.46.2


