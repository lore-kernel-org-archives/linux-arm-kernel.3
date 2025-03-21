Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D267C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ds7BknVAdabTLEhH2HFUI1w4pAkvUlVXuhpf4N1Ja8g=; b=bFUbuRmZZr+xJv7fAW9sDgdP5y
	XCX8WDUY+4RBjNz6cKrzaNR3NMyU98OQgvJnFmciaSjV7ViPc3P4WcUC1xIbj5cDyc3YyOJT5L1AW
	qO33v2Wk/qZhpTXHX5VpdcxwSKYJc3vdWRjOShpREBQN/ULjQiKMdF4FMKMK1FmjZcVP9fH9hE9h+
	hZRL+vf8/6UbGDBRzWwokkKKGhVGKjQDGlXE+Ejc8cuzl1KQEoaEkzV3iBuytJji20NLOwXy2vsS5
	7tGeDwYkLGSDsC/JdW/VASj03xEk1QWn+/inC6Gb0fA92Dw9/OJoIQjbPK7TydNmPT1JLiVECr5zp
	e8SMOQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdkn-0000000FCpW-1kyG;
	Fri, 21 Mar 2025 14:53:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdfN-0000000FBV8-3NBV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:48:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3913b539aabso1144818f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568488; x=1743173288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds7BknVAdabTLEhH2HFUI1w4pAkvUlVXuhpf4N1Ja8g=;
        b=UcfZmr4dJ7TGs5G52PypjhQQuHInMBZ9I7+G30F+OV547oXfM8okjeWpSW1LIlffx0
         pXqVqI5Brg0G4nJ0tTFIHjoA4OVJlL3AmQQw9aEO/d7O6mt0OFxGKDxSu+q/JvyFYjKR
         GJRKAFluGCSfXgKFobdjJ2IXAGgMw7z0ixKrPO7XoU20weDdOEaAU6nQb3wpNQMgLeCm
         2GHLC86xelfKhm7Ev9LxHavRit6gd2VLzvBh+NgXBmLU/zQ7jzrajDct6Zt+cjBgWant
         KE2buMBcbHHo9IBPK7v1/qkxZfa8+o6PWZaKhrnF6YdiXItwNSadcCiGxC6G3hVgUwuT
         8IAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568488; x=1743173288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ds7BknVAdabTLEhH2HFUI1w4pAkvUlVXuhpf4N1Ja8g=;
        b=TKa4IJXqrRpxP+NGPJXnLUc0iXRrlrLQzkuz6VcwAlOlzo5ZvqO4U8TbV7wE/UdgR7
         BXZknyC5UbcHswvTT/XrWCkVaEWlpHtzuAC1/29mekoXYhwsbFFJvrfOOwKjVa+1i5K1
         BiHqv/XOQzOUB18va90N3zkaO2vjtwXLWGE25jC2nNWd57HJAqyjbyqFKItZLIwZA7Fw
         z52Lxt1vVQjds1nEcBg26aXDKRyOmXi3na+lzB1fl3kfMyKVLxWSQM8IjwSU4wUFWulk
         gKDzyBA3BAcJeeuWTH85FxylNW8dLjrge0r4ZYzA2EAkTHKc0OK+OefbMrPVWrhlhCwj
         Vbtw==
X-Forwarded-Encrypted: i=1; AJvYcCWra6e+4cvLyg8NeUiLP0aNoI6nUhGANufJVi9A0+ceSKuUVtcseNWrCj/1TPTB5YErt9CPXcDQl7JtWR/fYS/J@lists.infradead.org
X-Gm-Message-State: AOJu0YyrqBt8FydqXkOpJ6XqGS5bTUY+Z9cJ9xQwkBpql5EW/ETtVUIG
	z9mfGk6ZecCzE8r/gkJXe9KB8cY7cCjjdHxmlwrJGyf9vTyjkQwp
X-Gm-Gg: ASbGnct8rSt+DQACRPsLlJnlazxDgKanm2P8ZHF+81rvBzDbRZaAgDieUj/InV5ARFu
	Hyqskx7auEJOYRc7yMUPTr23ZT1ZS/inCGNL01yNQXJqwv90Nw7GdbUEY/09U4yPyF8GHTruyR2
	qUiVrquZNQN5oWJhRl9lGJO2SnYj8RtarkShjSIryjon/P+DWJp6BEnA1Hfr3oWVgbBGZC7GUQp
	G/WF3dfCyRKeDptUyc5V6lqQn/AOKl9oHXVgdWB6R7obV21azUN/AgVRPHDfGapN1LQXnOex2K8
	rj6VtpLMfRQKifkuforL4dp8xuLt3PHcBixngOsGVSEW3coI2J9wXzsVxGeb2OCKces3xVcfH7m
	VrTO0vz6pzkOGdsJI1Sh/
X-Google-Smtp-Source: AGHT+IFPDI/Pf7uJuDugPQUAmhTZQ5bzGZ1oAYjD7fHEX8uEws8lBxGpmn2UKiXShmLLWmp7jLF+dw==
X-Received: by 2002:a05:6000:1788:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-3997f900d5fmr3705692f8f.9.1742568488180;
        Fri, 21 Mar 2025 07:48:08 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3dd5sm2533851f8f.45.2025.03.21.07.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:48:07 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
Date: Fri, 21 Mar 2025 16:48:02 +0200
Message-ID: <20250321144804.1435502-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_074809_841149_AE2A3FCD 
X-CRM114-Status: GOOD (  10.24  )
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

The Exynos2200 SoC has a DWC3 compatible USB controller and can reuse
the existing Exynos glue. Update the dt schema to include the
samsung,exynos2200-dwusb3 compatible for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430ceb..679088c91 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - google,gs101-dwusb3
+      - samsung,exynos2200-dwusb3
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
@@ -73,6 +74,19 @@ allOf:
             - const: link_aclk
             - const: link_pclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-dwusb3
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: link_aclk
+
   - if:
       properties:
         compatible:
-- 
2.43.0


