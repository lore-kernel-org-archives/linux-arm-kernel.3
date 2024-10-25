Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB71D0C600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rq3hiE5NWT6GmSCtEliWrqDO8oFD5BU4/6ZWd5GCBSc=; b=C1ayqHT8dBhnhHgBCZeCMGcrsn
	J2kcxd9mJAu2L0tUThN/ht7AtqWL/4ZYKU+W+zZPCKsVVf+qwqVG0geJIs+yzvL4tFSgjix2CgF9Z
	wWUNn4Pu6V3g3s8pmZ/EmV2rRxk4fH6h5qDd0PajUQbgo6dYMmpAABCU9GcLT6Y51OqV52dnMbSaS
	ZtorTkTFoy/RVVeDaYAPAuYJhK5KSzjt63eMGfKQxRR+Ev+wlMi0E4xCn3fExVKE3CafPmf7BzdBF
	FcUlCSH91QfbN2fqOGebTs8K7z6zDbSGN7Cc+TIh+tqpu9jbB2VeDHTkpY5GCYKA+AwH2KMnFBP1G
	1Kw9F02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Iif-00000003Xuz-1WJ2;
	Fri, 25 Oct 2024 11:43:05 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IRP-00000003Uxx-1Wkg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:25:16 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so3199416e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855513; x=1730460313; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rq3hiE5NWT6GmSCtEliWrqDO8oFD5BU4/6ZWd5GCBSc=;
        b=CTs4+gqQJYE7rryg8S6luBjd0dpcLk8FXqzbgXp1FASuElRSuSFEBgaXV5fv9s15kd
         BlJDz/ud+sAgw9B88aNSTfwbqWEP1Zfm+8Hgn/pznAxL2ZuP3lCyE8wVLFkkXTf9OhZ5
         N+OLsJIrP8nKZDq/cga9tH5qygnAbdMrk/TJokxbgNhXbSrqibq5QA17X55WjbVWgbbK
         7Su1Baw+WwgcJVGMwINLnJZBQPfZJHqgzUw3RwXLzsdYGGmidLsUEWEU7uM4drhqOUV1
         E6Qhdyb/WtWc4huPbNxWg3AJU+ZMzbe5SL1Tq7sBxw/QCeZjPP6UfsE+5oQvc07e3TyJ
         MMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855513; x=1730460313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rq3hiE5NWT6GmSCtEliWrqDO8oFD5BU4/6ZWd5GCBSc=;
        b=UOqe20TBsnG+uSysyFxcKdpeGvXL0jbh+02GGVCSIREQdu6M5mu1M0eouzyEqnwQjj
         YTiCQaQV2gMXf3AkhDoKP3oGEXUNGuyIG5ePxqu42d/Fu2w37HKCJBOLLgX2L9X2J3ZR
         9ZFgR2LtcnWGi4w33tZ7SsGkeJB/wHi0qOqC1hlwYUfGlXZOHgBw/WU3tZJZoPJTy+0o
         eb0d6//Gsokeqyolh9VsAnOLNid2hO/lQH7uJGeSNNF6IjJs0RffuzU+Mc3WCjttJCXu
         6MtGtgUCJ/YksrMkD5awf5bnmrqlS6ojwDVvl8D/gOrg89txkyf/etxW+JLo2PnxKXpH
         nQBA==
X-Forwarded-Encrypted: i=1; AJvYcCXfhRBcqOGjxxjBjyxKzmL5Fkfd3W9IklzaO5DHKhVj2qvqF26iInClTkmB1FqorQA5sbVLY1kocO1wBehpBf3V@lists.infradead.org
X-Gm-Message-State: AOJu0YwFgG4TAbkGVjPlMLKQEkomDAPj1Z3/RiOQUMKD4CBunb5rXVgk
	9cWUH/ErxlKUxgcy8rtbRxsEsHK0ro1UoPWhdwaDpHssoPuY5bdc
X-Google-Smtp-Source: AGHT+IFRRU3fNnzxh5RyfMXe5uw/ibOQCtbNygyevVciL04O2/qAsYZUB5c62adLaw3ixad+jFJ92g==
X-Received: by 2002:a05:6512:3993:b0:539:89a8:600f with SMTP id 2adb3069b0e04-53b1a33d250mr8904868e87.23.1729855512554;
        Fri, 25 Oct 2024 04:25:12 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:12 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:50 +0300
Subject: [PATCH v2 03/12] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos9810 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-3-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1041;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=J11BKakW41EeIWO3xm1R87buOc94o8CAHWbow97U0+Y=;
 b=8Q9xi5rnFYrKFAl6oJ5fQ+KHXAWj47BsMmvGMPCB1rygrMfgVWqg5ms3ZfQ63+gekZHuUx7a0
 6+3aVw+80HHCkghT86ZdZWoLr66AZEUcf6SAOm0EOT7l+QpFFlg4UMZ
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042515_444383_9849ADA9 
X-CRM114-Status: UNSURE (   9.97  )
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

Add a compatible for Samsung Exynos9810 pinctrl block to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7e6ef8249de6c2eeedfaab0ad6316af135c2ec31..5296a9e4faaec691994cd567bc3805f870aaebf8 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,6 +54,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl

-- 
2.46.2


