Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ABCCDDE62
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ba/cw4au5kcFXJibXUgB+F+wGe28SwF33wetHiQmsUo=; b=kSXCEGYtW9Zp2s5622/T0JEWmM
	CLJKAHh0ADQ9krBJGSzou0UgIGt7+i0m+mwpHXdClM1xwiv7IDVcZ10GEV8ZPZMiSdh8/LW/7Q3pT
	zG+Dy2Ol7kx1ZKqEUXzJ+OmPihMgXWzbsODHGO8Zo9JH8PTOL1DDBwoGNlSWAdJBx4JuEVzMhtAml
	s9+xADT+RtcXChvr76pSvzr4gn9Qwr3XNO8akt5Qw1/yGZU5mXYwFYN8fYf9NGxkVdbvwZ5dIiOLZ
	s4+jy2U9b0qkfS81aSoeC+VtGuZTMIGwe4+sGY5kLoWucYe0bm7SVCh1PJjQ0iLod6XoFBgTcUx4+
	v+Xk+hDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ys9-0000000E1u3-1H8c;
	Wed, 23 Oct 2024 10:45:49 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XMe-0000000DioI-2o7y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:09:13 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5cb74434bc5so3133777a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729674551; x=1730279351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ba/cw4au5kcFXJibXUgB+F+wGe28SwF33wetHiQmsUo=;
        b=ZxiE/FKM1nbCKx93OFZ15txEjD7g8RihMVe21PGGX98BmDpz7W0DzYa+HOOWUpBrPH
         i+5LdArebio+YRmiOccLuQ9JOpeWDSevyuO/oQR9Qfzx8GWkiIXkrL8wDeYXI8yV7Dj2
         rO76k3qfyXgkjlAvdaFqTmovK7cp8afu5L2Yns5yJ0Itlj6dzUtkf1dKs/eY7WWTnTRu
         KfKS9OZI/askAgnpBDiw/qy6A+mAUaVL2ll1DEPj1JBE6MCGhAuR6NRngS3T2MVUJY/C
         AQPLMuaTL1fFu+0dMazySQ/YjE6Q4Ksiibg2HTIUYzQpLCl4ggcsCtryTmaxsqgHJ8N0
         4Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674551; x=1730279351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ba/cw4au5kcFXJibXUgB+F+wGe28SwF33wetHiQmsUo=;
        b=kQUEZ1dSXwdO+lLEaYkRx441N0UL/sJiXs5zuyZ0g4WsPnyINh8Yanl61gysCBvIpZ
         NuFOOjFtHDSnUrYjUm1oI7HRc2J3DSDHPdOLb4Fmcp0nxjqQMbImMYW+wdqSDYL/6otA
         vpc/6Fo7ja5QfYv5cOh1MYcLqOGjZ9GFLaQdZ07XuTuuzeA/gelyVlbEVMMbk5dPcFdH
         zWrzTe5IYVjpirMy4ltoYRV2nNoCiOjkxnHv8Woon6rbefWK/u9j2UkBcz52CWsKPuAH
         YxOU3p/6BZXuUeb1VqKC5EPpfLtQUWTGCHvkGhDaZyeH6j7ruseaxCf5IP6LCtK8c/UW
         41hA==
X-Forwarded-Encrypted: i=1; AJvYcCUxHs6teW5+W5VCyPc57NLZNCR4MiqQ2q3o+E2waMBXZKRQ6PIpsBDM+OnBb/xMVHNBOdmfQ42ywETZwzjm57DD@lists.infradead.org
X-Gm-Message-State: AOJu0YxPsXUEeKP/b+ZHv4gmo1lcAPWu/jVb45aEHdzPpXcCTpvKs5qO
	tG7M6EkYy1CwlCG1m3cpXcwWJFk2yt5EF27z9Gz7tlE9j07VBR1b
X-Google-Smtp-Source: AGHT+IHO2r2Fb0KSk//2ztDhmNspPxH2VnZgCoIaMT5NDnO0Xb49R+APqrWDyFGf+3F2IP9nOoiOSQ==
X-Received: by 2002:a05:6402:378d:b0:5cb:6729:feaf with SMTP id 4fb4d7f45d1cf-5cb8b1c24f5mr1519874a12.16.1729674550666;
        Wed, 23 Oct 2024 02:09:10 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a8efsm4133058a12.52.2024.10.23.02.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:09:10 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: serial: samsung: Add samsung,exynos8895-uart compatible
Date: Wed, 23 Oct 2024 12:09:01 +0300
Message-ID: <20241023090902.538040-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_020912_730508_872215FF 
X-CRM114-Status: GOOD (  11.18  )
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

Add dedicated samsung,exynos8895-uart compatible to the dt-schema for
representing uart of the Exynos8895 SoC.

Like GS101, it has a required DT property samsung,uart-fifosize, but
it does not exhibit the 32 bit register access limit.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/serial/samsung_uart.yaml   | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 788c80e47..070eba9f1 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -27,6 +27,7 @@ properties:
           - samsung,exynos4210-uart
           - samsung,exynos5433-uart
           - samsung,exynos850-uart
+          - samsung,exynos8895-uart
       - items:
           - enum:
               - samsung,exynos7-uart
@@ -160,18 +161,27 @@ allOf:
           contains:
             enum:
               - google,gs101-uart
+              - samsung,exynos8895-uart
     then:
       required:
         - samsung,uart-fifosize
       properties:
-        reg-io-width: false
-
         clocks:
           maxItems: 2
 
         clock-names:
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-uart
+    then:
+      properties:
+        reg-io-width: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0


