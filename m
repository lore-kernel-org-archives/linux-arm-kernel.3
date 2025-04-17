Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF84C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iufXt7XGPWVnixx75DmjBxxr/EKI8vcJNq5OOoFoztM=; b=P6bdonrmDjpEoOLXoXhaxSwdB9
	2Bw1g1S4YJuu2yWG9Gf9X9eNKWhMmYuqDWINdl3AshxtZQ9KjEtj1jKxyptlSW7ZZOqLEvwcp/q8s
	ACzVRZlKUSzB1lOeHTGGdtAd/bIYKro+r9ssnnokOvZg/L9tbeL+ILkK2zbGPYfzhAvr6DC1yskxE
	nTf5/wM1ip2kIf4nfC65E6xSLERDuHUpzKZ4O1ajCjApcmgOJMnjXprP4oMMlnRuJfV0pZLMHW/mE
	SVfixqEZjyR3IbACc65LFy/ghbSqYODipcnKhyd7q/oHrRCYXLXH3FjRIJtPFE2+Clrx1owY9OAFr
	D8zqK6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JzI-0000000CAHM-3gqA;
	Thu, 17 Apr 2025 07:48:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JxR-0000000C9qF-2DZo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 07:46:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3912622c9c0so74809f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876007; x=1745480807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iufXt7XGPWVnixx75DmjBxxr/EKI8vcJNq5OOoFoztM=;
        b=vFUs5gh3NSYbTYfq7SE/iTwTPCqsedSFkxzFPB10GV695yJfy3oEJSyvfdN+ScDMfL
         VJEumRS0kjU8PQv506StD90kdVsmIus0AnDCaaEz5oy4Qc0gDuoE0bwMbJeqz/P/HNl2
         /dfXEmPzLMzY6G7bzIVKkTs1z68iJuk0x/xK0yGruauf9LYhGRHRO8rn8wvjKW0d6Yrn
         V43pDBiy4vNRTEXxgSuCe3it2jBx/nkDz5Gzl3IygoOUFIwN6YKk7MgQxAb9p7PSDKH2
         YDUaR7sxBR79k7AxBcbtvW6gN/mEYJtOfxUxUHHbff4pgl5RC4ZuU9qYR4S0YKOIFOZm
         jGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876007; x=1745480807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iufXt7XGPWVnixx75DmjBxxr/EKI8vcJNq5OOoFoztM=;
        b=v/0xVA+8h9lKWc96+utEbXvpdZiog+UmlHCKEinGVSitdgVEJ71FkI7V6jwMlKDTJN
         hXNgztVqC+EszGKhrAItkvkJf/X3GJKtJRpot2+ppNKN2D4LEo4qUyk0SkpUd1FMqKBB
         7fws24aYFKksbHA6JcerDJXWBYKBR7TBe/G8Y+XEj4haaXamHm2a7cpGNtOY1K/J3Ejz
         CfYu5M36UFzrI5vzKl5Jp5obpRc8/I1eWurP/ZBMetvL+5XJrIkBZUj6Uw5VfH5hKEGa
         amhYdm9A4iIiC3R4uzu097mwWkReKWaKt9rZFYitigATYC+EXWm8kEVFYKYuC+m90FmM
         RQWg==
X-Forwarded-Encrypted: i=1; AJvYcCWUBnAy4H+OwUeMv+NES/Qh8NcT733Hk9rEw1kOv2Jpms2AepDcTefxrMV6d0Kw68WTaGoenWoRziaHsgln+Dxd@lists.infradead.org
X-Gm-Message-State: AOJu0YxIa/BiLMmhi2IG+/6d+gdWaZpj6y8iEGRVLAGCe24Gb553HSiV
	AArbg56lrnAKz8eglgHwviFt3b8VXdWHUkzHsW2jHYDITcZ7um/TRRtW+8ZPzmo=
X-Gm-Gg: ASbGncux0WCf17l2FYtRoOnIkAEM/bJmjb3YbRxigJNolbl1oUE4BR2XXFzOGZNLjT0
	HyKXl9bBNNnfvInhHHi+7AUSNqzJDJjx5ymoFfyINniFZoz3pCH0zOv41f0j4nta0/SDohCxRT9
	la7utO9gLc4x89Qj8ki06JYM64rWZ1iJgVxk6eJZPBtQuSVtL4c595W+DemPKqEWHMoB742QxZV
	6FuErjG09tksE1kXAGcCQvlueQx1oMuWOyVYdi0CzABTm6gPbqMpA1fwaB+2fiNx+2K/wrhXd6O
	AN3HX873JfQY9vgzEd1S3nraigppG98RqTqzImkd8cGEYd014O2h+w8cSlNzQx6T1DpTrR/jufd
	RZ4h56g==
X-Google-Smtp-Source: AGHT+IHN0gCWGlfh6M10BCj9GpPYoIMHd3DPtjGO5OnRlWIDylaeB61eTs5nJuHYx+5YI8rHxxIREA==
X-Received: by 2002:a5d:584a:0:b0:39a:be16:9f1e with SMTP id ffacd0b85a97d-39ee8fd638cmr684683f8f.12.1744876007476;
        Thu, 17 Apr 2025 00:46:47 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d2ddfsm43130005e9.10.2025.04.17.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pmdomain: arm: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:45 +0200
Message-ID: <20250417074645.81480-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_004649_563618_3BE7234C 
X-CRM114-Status: GOOD (  10.88  )
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

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/pmdomain/arm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
index efa139c34e08..afed10d382ad 100644
--- a/drivers/pmdomain/arm/Kconfig
+++ b/drivers/pmdomain/arm/Kconfig
@@ -2,7 +2,7 @@
 config ARM_SCMI_PERF_DOMAIN
 	tristate "SCMI performance domain driver"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
-	default y
+	default ARM_SCMI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the SCMI performance domains which can be
@@ -14,7 +14,7 @@ config ARM_SCMI_PERF_DOMAIN
 config ARM_SCMI_POWER_DOMAIN
 	tristate "SCMI power domain driver"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
-	default y
+	default ARM_SCMI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the SCMI power domains which can be
@@ -27,7 +27,7 @@ config ARM_SCMI_POWER_DOMAIN
 config ARM_SCPI_POWER_DOMAIN
 	tristate "SCPI power domain driver"
 	depends on ARM_SCPI_PROTOCOL || (COMPILE_TEST && OF)
-	default y
+	default ARM_SCPI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the SCPI power domains which can be
-- 
2.45.2


