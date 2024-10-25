Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0617D0C601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dq/rBsz2NNFRmkY6+lVKp+BodwGY3KG6DCpN92vktQ8=; b=hl5XvBJkqwioE8udN/BK5+u0AO
	/2ZG5Lg4NZ39EIoH8DISVNjhdWTNHisPQMiJbbPai30CWr5gdll+k1ZH0iaQpW7nkScPzhyJx9hqV
	oWcLkpzEcVAGJunYiI4Ef6J3JfAsK63+SdeIQtPr9Nb1s/Ay0AOLKJtgLId6MB5QMeDlA2p5C3jXQ
	iJFBK58ATBQhYtwVQj4MCVHmZbBn0VXxwQ7Uyh+HPpj0TbXqj6SF1BF4ARIWt0vfgI5lMeE1NZ0uC
	ci8S8R5tT19SanBBRPtTrK+szCTKBpoQul1VfEVpYQxzLH1TtSifBg18aLBicuYm2cwrYEV44LthG
	HNnzLg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4InI-00000003Yn7-03wx;
	Fri, 25 Oct 2024 11:47:52 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IRS-00000003UzR-2jOu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:25:19 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso29975531fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855516; x=1730460316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dq/rBsz2NNFRmkY6+lVKp+BodwGY3KG6DCpN92vktQ8=;
        b=YJsVkAhT8UUh4wHtKLNM8QthNEjOSCar4VdqceovesX2hY6KzET/QYuIGxOQg5UsLQ
         wkXKv74hdvJgf3rFBQu0IrHlwMpRSCGkxatHzTe721wuFTr3RmPWE3xbqLAe65WMFsT4
         QrarRo7TEaVOF/o0QJQuPXZbta+mHDWU3TOt9lKMxyvq2/QqgrJCbaQymZyjC31rT19k
         d1n9zAwCbx3I6WJSG1wjX9w9ILwVfIsufolywf3eL+EqIw1Zg5TdSnqVZ2aQvhbQc8WP
         UWJNQMcp6k2zbif4bT3N9nts0tYIB8UASd9/ZsA9c96o3u6DnnkvBvv+IzNFLdFrbs0Y
         n9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855516; x=1730460316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dq/rBsz2NNFRmkY6+lVKp+BodwGY3KG6DCpN92vktQ8=;
        b=ognDfrXyJeZNACy+W4F5Rm3HA5CqXj6YAVXCUOM6kInQRA13P3eiJlV0laDVgPeMF3
         z8d2W2aCaWhRJC6LdjU8em/DMgIpXVUpA9Qjmx0Bo0pknkhkrHcrqz5ol47TzE9HMDiP
         cZHm7KVRZgEMxpruPQKkOObIVrSIRg8/Kf80B3hYDpdqlbKYbF8GfjbwbLFP1v3DqCUj
         3Ja5CL92R4qEUWv5OWoqVTXjSZycEhgcHntI9h3mSNwx8rUvf7YVQhHXwTzM/UJDkrpE
         7cd685YSfVxooNJy9Rn5DPhBmBXyBFT0L86OspylOaUmfCY0TZQoqFKrV44QI5ZM/Q0j
         +ulg==
X-Forwarded-Encrypted: i=1; AJvYcCWCPYS7Apga7zKd7HoRrVmyvy4Y5zFGJF8Rjo4UMhwmyscUCXyn01XBQLfAPpqwXVma44aohzhuJd2TTNhIQCeY@lists.infradead.org
X-Gm-Message-State: AOJu0YziYLX4nbaEa0niON9iWWe/8vxIQ0vFVEJxcbPcxQD8doibFp1u
	xTzwHMsroWiFxA5ZEu1NaDrg4sOi+0lAucPd4x5pE/V0xqaESCdu
X-Google-Smtp-Source: AGHT+IEoGnK9HtNPYcj0srNrK0pE4zJKU1523ypWxDLogLufFQrVDkefq4lkrpeUeQjY70p05SL7zw==
X-Received: by 2002:a05:6512:3d8f:b0:536:542e:ce1f with SMTP id 2adb3069b0e04-53b1a328380mr8381074e87.18.1729855516137;
        Fri, 25 Oct 2024 04:25:16 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:15 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:53 +0300
Subject: [PATCH v2 06/12] dt-bindings: arm: samsung: Document Exynos9810
 and starlte board binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-6-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1237;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=wJq9r0ywpF+U/F21JjpDFPiTiDgeAY0OfPL9TFD6z20=;
 b=cyhMpCuNS6CZPtIHrXY+B7GQEuyo73CRXCgppXOZkGv53V0LbIPEuKjFHjz+ZgBBe79rktv82
 7o4L1mpgke0DoGvU9FyMdZkq87oQp/FS13XBJwWkEgWimCwkxhatcvS
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042518_725050_FB13A018 
X-CRM114-Status: UNSURE (   9.58  )
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

Add the compatibles for Exynos9810 SoC and samsung,starlte board to the
list of boards.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index d25a17e697256f8d868e24bea47d21accd1184ed..b5ba5ffc36d687a6fdbc625e6d95c37a8a2e2b93 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -230,6 +230,12 @@ properties:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
           - const: samsung,exynos8895
 
+      - description: Exynos9810 based boards
+        items:
+          - enum:
+              - samsung,starlte                 # Samsung Galaxy S9 (SM-G960F)
+          - const: samsung,exynos9810
+
       - description: Exynos990 based boards
         items:
           - enum:

-- 
2.46.2


