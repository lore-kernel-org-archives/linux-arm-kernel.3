Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65797D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4r3f1+NvBb+8lEJPQFzoU+pVWA5C1a/T6mdun4fd2Zs=; b=AWINVMrsV6NID4zY1z0/xsEN85
	+Xm62+ZGQ1icqml34NQPnrcPhkBB8jCe+9XQ2km83i0QJa9k9WRTU/Nm4kNLQjZHBOO0OAfUBApDN
	pQw4Q5QyjRxkffhLcOUG4MOMQlGyM4qKcHFdtkpWcxiZAvEQMNO8S/+oBLMARG/v45/ABElWfWx6s
	19B0W+p8fgi2fyoQY4xvAcX5mIM/IBPhK+nGvUOf5kOYr1o3LDiTKO0o94wMR3wZdKU1Y9lGRd2Po
	vAQyXnvoKPbU3Btz7/p8QJf+7Sr4AOtzeZIEh9l8EFhiCN/jXEk5rKXu5VrOTwr4FYiHWlIVJd5gd
	1VmTotQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5M93-0000000AFXi-07xI;
	Mon, 28 Oct 2024 09:34:41 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lxl-0000000ADgA-2Z4S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:23:02 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539e7e73740so3361300e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107380; x=1730712180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4r3f1+NvBb+8lEJPQFzoU+pVWA5C1a/T6mdun4fd2Zs=;
        b=K3zF6JoucAk43dd40YcIqI2oadcKphTmc3EOCBmDdOqWSBv9CAj80pLSEjAWKz3eqr
         77KYfA+3FIWhGAMqFUSNZFG1KTPJi/UP/nzGWKFIxg71nfjolvt66mppOdIDw7HEsX4v
         9gONrHNEmx/ykP4fZGyBzHtH4CxxVzVInvngx3YKLSHl6U4n0c7aFEiQax9TiDrGRjQa
         59irviVglrt+Fohidn5vSonsyeQYKm6eP4Vw0ukrEC39nX5LZqRv2xsLJxk66E4x3bl5
         Ho9YxKsR7yiNKTaKelkIL4obYr/d1RKs+Rh6KhX+UmNcWcTfxdWkiCDt+1HmxfaCnqk3
         isqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107380; x=1730712180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4r3f1+NvBb+8lEJPQFzoU+pVWA5C1a/T6mdun4fd2Zs=;
        b=SQVS55ATZWMhcvHYkjHoYlQaabEzUyULoT9mNr/73W/fVAY+IkhUWDQB1/OjzfhRt6
         w/cwE76911ojK/p0ntGtH2RBDF3T5VE+D5kE7nE8dQgx3HxD/cOApMsaP+i7XNcH2WXo
         dsFCYpnYSuBcA7HhPga9n+CfvUDqT/7D8rPdgeTDI6bhqf/CMCy//lnPdCF0PMmloj8N
         1kOlGWgLYKwIY3A7hyTcnPMcjhz1s5SQHic8W3HIjoTqDrh7KlwACEkBkLsL1lBSW/GA
         JeFr7aYejVpaFaOod2fg6bEGyeabo/IayJAB95hhjbab7kBHBeqySNjzDYQuAXMexLNV
         NQcg==
X-Forwarded-Encrypted: i=1; AJvYcCUHtp8fUlTCRyU8U8s5jMidLu326K6+oZ49b3I5NsKjun3kNgaOJghTVRNgziefOtTpxsWYpzzsTbjaxh4Cd6rc@lists.infradead.org
X-Gm-Message-State: AOJu0YzR1VutyCDubsHQkEdRKhekTuQHvROOA2PPU+YRzplN9spFq+Ks
	s7ZeyT3BlAbyXktDmdCMWKa42t2C3Y55q5AnKjMmD79xusJYS+wc
X-Google-Smtp-Source: AGHT+IH07RwlPseCZh3Qqq6xIql8XwOMCafaD48lvgI8JY9keCi0ZdDu5sKIL6X4mpiSYvma7Su+AQ==
X-Received: by 2002:a05:6512:2386:b0:539:e6fc:4172 with SMTP id 2adb3069b0e04-53b348cb8e4mr3184554e87.21.1730107379503;
        Mon, 28 Oct 2024 02:22:59 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:59 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:34 +0200
Subject: [PATCH v4 06/10] dt-bindings: arm: samsung: Document Exynos9810
 and starlte board binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-6-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=1321;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=tRiFoRgs2wnv5kkwhc9AnOYjzd7mmGEE34XIM9iDvVU=;
 b=NmelZtkcGbyG2Z/YEv0xQlsB+So1lJkC2PTIeVFmVgQ61ByV4QHe7sV6BX/jf12Ti0b2E2gSj
 PUCWT3VY7IfB524i6xOBTcnF+ayBSP7XK23ndFbkDYdLswsHd4gbwWE
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022301_657669_D49936E3 
X-CRM114-Status: GOOD (  10.04  )
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


