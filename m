Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1F0E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T64IvUv2v2ctLBX091YAC+zdH2GYdiIMlzETmbUeq5o=; b=sHXTokC6h7OdW3ByHMZZODaHk7
	EI56v6ivhhwiHsJdzwB6SKf5do9awgbc1raf7f3P39SC9BuTlEwd3lIKh1bDx1r+i+IrHW2OadYg8
	lnuQVLqBIsFdNtWWSalB48QL3XpYgkJxwH52abgopoBL2AsZvyEDeUqBFrGckBLzq/SsmUqTs45wk
	PfPNLLSCOqbClM9n7eB+JUz0WB/MJMKkRQrP8Og81juc+pBdhEwamSiBNzotBz+pbt8AOe3NKmpZT
	FnX0CiKFNXtMNjYnTQJBhSGhgO2NisInjXMYlKWQzaI9+35teC49Xtt0Sgjui9Vl3W6bxIFbLmVYp
	ryHyUYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7Ha-0000000FIOf-1mvo;
	Sat, 04 Jan 2025 16:45:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7FI-0000000FHuV-0jt4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:43:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso89732795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736009006; x=1736613806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T64IvUv2v2ctLBX091YAC+zdH2GYdiIMlzETmbUeq5o=;
        b=QbI7sw4US45G/ioUZs/cFxHnuYOikecYDIjtZjI/ZkEkkKtusOUeDaH4Fv5WaE+1uX
         HWnZqVGVge2f6YOL587fXkCKAQIY09f49A2Ggl2WfOE7JCePd4UWp78BtvkQukS8dHnM
         g/owRDjIqxI97mrpKEj77KdNN/DMzdn00WnOyleqLEa54sqxJTjfLNjq80AMCwAxPlja
         3VLV56aKsJwAp+l577m54TzfMtKgWE2Z+OIPucr59AOTIEFUqzlKY/4RlKMzhNTatMED
         quRPLhLjWAStVH/8epDdtA0c9BJ+Jc3AW/OS24J4QX0PPxlE8J6j7XJeMuoiTFCxdIMo
         wZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736009006; x=1736613806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T64IvUv2v2ctLBX091YAC+zdH2GYdiIMlzETmbUeq5o=;
        b=AE6i3vnOxLFqW0N3p2lgWWsYzIU1GHEooWpcRuUUeKrBzMqz1UvjA2a9BcYU2kVC5Q
         nDE0iIlTjuWgUxG6GL6edZHT4Jtybn10UFwPZTZEhvonrkkcQjeQmX9jnIoReQ2h1K7e
         C4Y/zJ3lDAJQoEenftSewwrtZsHjDqM3dVjbQdqp1TzUh8rMMvrpp+dwxZnyaBQbIW4V
         jRZjQmHByl/6su9U+KFLsXA7DbS9AzgJMR6dY61y2I9XuujhtqYhJeHlrV4zUuhWtJYE
         +b+y3CfPjurlXUsSRtJk/EEhpNT4Q5pa659QQ8z0d5JDstMw3ZiC3raaGpKnJry4hb5x
         7s7A==
X-Forwarded-Encrypted: i=1; AJvYcCUu9omoycr75S6Lw61aKY/iWUhGPq9VrjcimDD4+AocyPJaqxiB7/JvxPAIyH4Pu1IQP4FBisR8roD5mvYBhdm9@lists.infradead.org
X-Gm-Message-State: AOJu0YzPvsn9g1GyXZsfF+j3tsbczGPM43jV9WwJsklJ9b6oC4MEsa6P
	fLYF15PKq90e6eUGU/mTJxXGUMTmVEOZFqJuY2/wbKdfgj+RsHhq
X-Gm-Gg: ASbGnctUUuSGC3S0ZQhEci7WjwFLRkivTLrlLOote/HZNEoqThksTTJ3BQVHhIjp85X
	TgDs1puHA9SYBEs+qVqb2sv6S4a8xwmDrK0MHxObr3m2VB2nysKHFHQs85RkizGdhHFAnbgjpDO
	WpEUVTVkUpJiz8bRZchiheEzRFfxa8pP6xZaNQSExIppEh3eZ9EBVW5HqpNNcTQjrQaCLnMyTaB
	JndR84JLrLbr2rquCes0aQVr9XIFbsJ+IwxMOYWh1+ewFNrfeiVvdJiVDgwwAL2AfEXZgE=
X-Google-Smtp-Source: AGHT+IGNe3+mHP1LxgFUUCsd51sywF6ztvk2U7DFVGXzDM7T3XZT/xcmNAAdPmEOgQ2IwjhCdUOS6g==
X-Received: by 2002:a05:600c:450f:b0:434:f5c0:32b1 with SMTP id 5b1f17b1804b1-436686461f0mr493936935e9.15.1736009006271;
        Sat, 04 Jan 2025 08:43:26 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm513321455e9.24.2025.01.04.08.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:43:25 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatible for exynos8895
Date: Sat,  4 Jan 2025 18:43:16 +0200
Message-ID: <20250104164321.333669-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_084328_211875_413BF7FC 
X-CRM114-Status: GOOD (  10.82  )
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

Add samsung,exynos8895-dw-mshc-smu specific compatible to the bindings
documentation. Since Samsung, as usual, likes reusing devices from older
designs, use the samsung,exynos7-dw-mshc-smu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index 5fe65795f..ef2d1d7c9 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -29,6 +29,7 @@ properties:
               - samsung,exynos5433-dw-mshc-smu
               - samsung,exynos7885-dw-mshc-smu
               - samsung,exynos850-dw-mshc-smu
+              - samsung,exynos8895-dw-mshc-smu
           - const: samsung,exynos7-dw-mshc-smu
 
   reg:
-- 
2.43.0


