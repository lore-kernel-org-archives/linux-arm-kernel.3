Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E039D10C06
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4r3f1+NvBb+8lEJPQFzoU+pVWA5C1a/T6mdun4fd2Zs=; b=TM4q4WVpdyD1+tAd9lVwgh6DfN
	vRrUcLH3+Bfb/wSzrM9GxRz3eozEBJiBpFttsI1K9Nr+rrHkjHxd0YZxdrEpQUbFOIDJ1AR2DuCpn
	BZNVdUGkM4DOR/2EYHwhZvka6TJhgq2yL0S5RGjLa1hLhO8cNNeN3mH7ZlDgf4kVuuOkGrybv3Rnt
	z8r6waBSzsLjf+fUOMwyTRLf5dkWEy+osbGzjwN3OLUtqmRpG+0jooB/0gUSOFbLbfCdJtKlcAz2I
	iv6URhpbPYsJRwjVHUBTZ2V3iL90fHtjJ3t4g8zPwEIgMCLAAFD5PieIDFnvY3Hy+mBK7dEbBJfEI
	fvzlPHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nYR-00000007D5i-1nw8;
	Sat, 26 Oct 2024 20:38:35 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nT2-00000007CBE-3RUD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:33:01 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so3757415e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974779; x=1730579579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4r3f1+NvBb+8lEJPQFzoU+pVWA5C1a/T6mdun4fd2Zs=;
        b=ZvrbUlTx1F7pWxzXN0cq3L0UvYCGyyj44LBYEuAH3UnsHufHAkwrvpMV6s7LVX/93e
         XiRRfkzFeMJzE9pP1mmIPOx8dUn1Uyhp7jJpLHLzdcl0dsKYUX5OlHg8fIDrBHsrqI3i
         775V3hQ2HJ5F2dtXtX8oP70LBpK/BfjmcrcHeYFRYM6EVLr3SsiRWvL3zSvPXwT8HM9t
         /lmxdkQ8WUA8wcodUnAkShLc/9SDM89mpAhifTJqxLnRxraeoRXEM27xwfYp+HvUj243
         CVuQjYriz1xq8NRvFFZoldC5ccTL2XmW8FvHs3nmSlW38g/RnP9P09ZKoSuBasqhNyZE
         gnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974779; x=1730579579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4r3f1+NvBb+8lEJPQFzoU+pVWA5C1a/T6mdun4fd2Zs=;
        b=iUz7JIoU7+cX8y7ypozvs9851HyFJmVFeue1ccGdMgOB7G9IUfkRq5l1StBwwlSx58
         xNBcJ4kNlYN6N4AuW2jto80a/saNj/XdQnHUbAJxC0bpx494eSp/M2y2SzF7J+wSeHi4
         XRn7tOUd9HQHt9CghGVRG6aiGwcuXFQtGe3uQpsyppqnk/zYWtZpyywaV4vSQ2Xu79tF
         mh9iH6js8SjVf6+EQJZ4iSmNgGOAvkKdlgatSZ2xDIMWqmCaCOnvGJ8iTFRq9DNG5flH
         ERZT8/vkqj3/lDk8RpwnN9NEUjQOLXZWagNUgb8VAabgyjfrQbS8iNCnM3+BU866hyGc
         ZedA==
X-Forwarded-Encrypted: i=1; AJvYcCUsGRCRldalOXrpnPKVA73vpfaWG0lTnukpurSpkoMP1vpCoKE5psxCAZNveRvU24AnSprVFvL67YRtTolsugZJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk+f6BbAWmkZudhuNhlxt+cZml4K8opERD65LN42iHDshuHxKE
	K8kmfRBzLY08sg8b+RSxt3mqREyU59DRQPUAlb3RVh9G59UavP6B
X-Google-Smtp-Source: AGHT+IEJyuv8E67spcRtNlhUzUOZP1zatqqU9Ahx6YEyDR1zWtyanVvxbI07DmW0sueikKHRZE0pWQ==
X-Received: by 2002:a05:6512:3e22:b0:539:9490:7257 with SMTP id 2adb3069b0e04-53b348da64fmr1269419e87.30.1729974779092;
        Sat, 26 Oct 2024 13:32:59 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:58 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:37 +0300
Subject: [PATCH v3 06/10] dt-bindings: arm: samsung: Document Exynos9810
 and starlte board binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-6-b89de9441ea8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=1321;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=tRiFoRgs2wnv5kkwhc9AnOYjzd7mmGEE34XIM9iDvVU=;
 b=fOUssGGgZXfjE+4gwDNznykMMOmyN0xkbPQepfQuqPXKP/unZ5AjK79B9+9tJdY6GPViWd9vM
 Z3xP7qy8tO4B+tcbM42JXxzJI8hlQBWeH+PvCefYxcIJ6vg75EJYIas
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_133300_893612_E6D81D13 
X-CRM114-Status: UNSURE (   9.24  )
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
list of boards. Samsung Galaxy S9 (SM-G960F, codenamed starlte)
is a mobile phone, released in 2018.

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


