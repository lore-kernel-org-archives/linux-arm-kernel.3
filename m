Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEDDC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7pE5Ysu98qvM8Dtr8qK+BXt3i2KN5R1lxlItWkqUL4=; b=jB4t9sdWFPWLV9xGsxcrJsh3dW
	APQxF5gVTbKnIrshliswQ46gib7jMezzCAQCTGfwiA3BYyBTsr0ApVg1OQ1tnRjED8og6TpZR1AZf
	Tv+OgW5ondSrjERLlCIdkSXKAwQB1ZbvtBl8kHrtGZMUGX7CzCTmCPMrzr2q43Lwr9KYyBBZKfVRX
	Ox9D/2J3deqTjbPHlHdfa18qdlWSo3AAPz+vwjVcSIjWwZ84r9qAKfUQAVX1/3CPpVSGYHzpQZmPN
	cNwCvGx+T05M1jMQO1OtFTtGFSnkG8FuKvhQqa39oyhxV5zcor7SM3ODpSU5tNIVmVUM7JpOcAIND
	Oxu2kaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdq0-0000000FDvX-1Op1;
	Fri, 21 Mar 2025 14:59:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdn3-0000000FDVP-3iRU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:56:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso13739905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568964; x=1743173764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7pE5Ysu98qvM8Dtr8qK+BXt3i2KN5R1lxlItWkqUL4=;
        b=Frrj8G4BDxDQ0pbEBldVJxOXfaqPmMWZcRwNLS+qPYTNYFxkUhOTGXhp2Ck3luUCUo
         pMNvtK1h9Blq6tHtbs1IATI7qTUnWY2CWqLuPwq9Do1g5fdqbySCkMqLxZKeI9m/u2uK
         XH8SD4228rFFgQTEnDN1Sr4ihjbskE5iOQLz7GJgcKrtxbKb7EmbyJvbKrSuo3ppcG65
         mzz9jW1j3/3K7szp4Pja6k91uyEMf2szXzu0qxMnOrf9UP0tfjKsMxp4xzSktHMCFG/y
         GqVqqKhf7maNwXLVDoCZ+RYEKvJN0K/Kb2MgA1dXQMvqjDzNA5IFbEZ3SfkdVmUJ7LQC
         baKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568964; x=1743173764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7pE5Ysu98qvM8Dtr8qK+BXt3i2KN5R1lxlItWkqUL4=;
        b=UwBbt+9KxluffOdyzjvFsP7PEsDcr4RBcNIu9DO5rNiC8n4SgvbjK5SDBapliRQdFE
         o1C0PJXs7dr/6bNqdQQuuU90buY++jaDWY9K+7aKel+PTzY4/IT8i1xct7ze0il1rutj
         a52yqFb8ZM8wxG0f6vgXtrKiYFjJVK5ICMvE0ElbdRuSlFLITwipr+et7V4/n81vtmkd
         IR+UM73jliVsGCBexicboB19iG+pKy0sDUddTrAVpgsBzt/GeEodSSOQiVQqEjrYksyq
         BmRIp1ppzmFMw2+1alWDo07bRP9woC8G3/y3dBXszZv/7r/Xl9wIMBs8syKNdO+3j4xh
         202g==
X-Forwarded-Encrypted: i=1; AJvYcCUo6KVcbWAAbrfiaEoPU05qFdR+w5MC10DTSpc7Q+j14KK0TYIqdgnO0u4cd8GjQnxwRwoFE+eh/uquFOd68Q3E@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmdd+z5bpi+uM8IYQDBSYI3cczHZOYxZCbWhaWE9Kbqn4SBucQ
	3GNiYYrFrTgzUx0ggw0uazkb3+R4ZAbvbN6FAxizTJJPaWJy6BDd04HhoQ==
X-Gm-Gg: ASbGncusr6FQ8CAoBqcV6NmdBgzLdQg4ynQ/wFHOArnY75W4M42FZQF2OHPU75bQ4+x
	PuWOgNMwbzMRShzm7ykD+dJQxk0cQ7kpfgd1P4K4NqSZ6iVuyInjGpU/+u6IXIyx+3GsmnDq3Yf
	xQfiYxAJx39bC+wWpc52Cl5bDMfAyQ9gfEXywMTX3izimmxtKGL1cevYGo+Yf9yxMlWCU/KSB8D
	ohg3OKXQeXD4SmpNyglAwL954EI2V+nnacfCydi2FAxJ5PXCj/MCN6Lh73IHNkdHZWIHrUMMGWm
	O3mrggIkIaMkEw/CNOzffE1du1zeatq3C+CKf5/kqGnof35v/hYIKeSPCaf90Jv3uR3z9IcHn+F
	3QvbRoi6vpjSq6/8TRrue
X-Google-Smtp-Source: AGHT+IFy7V7yS49SBSh4QivpSyiHP2fZRhsx5j7YhDnnawlKq2OGpMgAznt0LvIAwZuK32tG9Lq3pA==
X-Received: by 2002:a05:600c:cc:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43d4915e6bemr68812115e9.3.1742568964237;
        Fri, 21 Mar 2025 07:56:04 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm29217095e9.24.2025.03.21.07.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:56:03 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: arm: samsung: document g0s board binding
Date: Fri, 21 Mar 2025 16:55:53 +0200
Message-ID: <20250321145556.1436201-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_075605_935642_F3E6FF6F 
X-CRM114-Status: UNSURE (   9.55  )
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

Add binding for the Samsung Galaxy S22+ (SM-S906B) board, codenamed G0S,
which is based on the Samsung Exynos2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d..bb3f6a0e1 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -45,6 +45,12 @@ properties:
           - const: samsung,aries
           - const: samsung,s5pv210
 
+      - description: Exynos2200 based boards
+        items:
+          - enum:
+              - samsung,g0s                     # Samsung Galaxy S22+ (SM-S906B)
+          - const: samsung,exynos2200
+
       - description: Exynos3250 based boards
         items:
           - enum:
-- 
2.43.0


