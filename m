Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F4CD0C601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n31FK91HeIKxLr9ZjvHM0e9Nu8fhYX7UDQp+Ji5Y1y8=; b=1PLnAuzIWZxg7bp0diVPLIRjF+
	9RiF8xXvYkHKPA83VL/P5TDmq7xZxz9aC/UhDB4zaVOsyYvjYEM/Sdn6nSZskA6LcpeoVxz572ZE2
	HigQi5TsqNITb9PRiax1io4cmL245luYjllWutyoC0iTND2c/cv2oSoHojMJCELSMlXjk6eJgvoj5
	YXHKg/l2Hnl0qPolVKIqPSIG/M7bjMARGFby8AqJ0PdoKDGPSm0ta6GPd5v90uW21SQ/veKcFUW6z
	8HAfLGnX/QjdEQ0uAiLKlNLya0XbOE1jvNR0GrGblWF0gIG+SfS6JEjnSzhJtYkOXFBpG6kKzrTTG
	YaMD/nCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ifa-00000003XKl-17cz;
	Fri, 25 Oct 2024 11:39:54 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IRL-00000003UxL-44Ru
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:25:13 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so2702014e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855510; x=1730460310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n31FK91HeIKxLr9ZjvHM0e9Nu8fhYX7UDQp+Ji5Y1y8=;
        b=HOs+0wf8Uv2fyTvze+PuVJkZWV+W3ntbogzKM/FE7LUSrFqHi92y10JLGCBxNKdztI
         8kcOSi+ydbKp3Q7jAPBMPTcZfICSGaf2yuKcCBhBl8PcgMDyvH/Y9xf+2hXZxY3UPW8h
         UMvfmboOdJh8oIehovhf3AEY0+KMajeNKcTf/4EVY2zbTn9BcjYP+K8zlLcaxPba0p8V
         /JKZQ+PaQq2WD+ll3q7Xs+Y6xYYdaZjoAkoOekYieKV93zjD9lpiNDIQeFFS4AaGG+hL
         hvQ20yvYri/Ruo2iPtWbJsZAswnY5WkaM9Lx5LDUSmXbzv2CuSFFpmMBCYKjkpXjC3sy
         emxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855510; x=1730460310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n31FK91HeIKxLr9ZjvHM0e9Nu8fhYX7UDQp+Ji5Y1y8=;
        b=oGX54jBQpNkfvHInjvLy9k8+jU4foctCovPPaAjFgLTCAineeqLYcopOd69u62K8U3
         o2jMm66feIP24bIzPMA5THOJBf+CZfLrnCtT2AkX4zXWCoKurYZorkED0MEISyb6QsvP
         elegB0fC6m0j640PSGZlWQirlEjs7K3p0dmpdwMGWbGCw3AtfBVOcG0C+A2aT8dJW7xA
         RoDrzswLgkeh+/JMBu+TwyCr8UkJBR+RZ+fkGaZgKpyWOjCJ9wElfwga8NBmkia3Lnjt
         Nm/EZu7A2FNkxbN+cUlBXnPUF/4c9I1NuQ35SODwNC7y7V3YXvwWPc5mT1RlmoOEPeK0
         jcVA==
X-Forwarded-Encrypted: i=1; AJvYcCVMoSq1yfMfxa602TarbK8vl7QYVwg1q9S9Y5MdbqDcqYSI5mQvwWc4GbuSXqmOuAoUh8g8PfOOljc7QHwslDfx@lists.infradead.org
X-Gm-Message-State: AOJu0YxDnDkZUqhJ1Iqxd8D0W4XTqwO5OeCfZpyfrUmO7Ftdqp5CKv4h
	Ln7Jns9eikL3sYvBrb9pHg65GIqGl5TnNevvcilIUdyrbvTlWmz2
X-Google-Smtp-Source: AGHT+IGB+97DmUjhobKZtZFZKzO3erQP6XakxXAE4z2q3ZIafndHZtXyuxWp4pz/XPYWWQEkKJdH9w==
X-Received: by 2002:a05:6512:33cd:b0:539:fd1b:baf5 with SMTP id 2adb3069b0e04-53b23df678emr3299322e87.16.1729855510200;
        Fri, 25 Oct 2024 04:25:10 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:09 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:48 +0300
Subject: [PATCH v2 01/12] dt-bindings: arm: cpus: Add Samsung Mongoose M3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-1-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=860;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=5q28gk3qAfUZIRDnybYg994BnJdNE3X1MHgLAQpU+/A=;
 b=Mr4netPYKpH6mR1BDJd56vc/yQdBg713KYkd0ZBApqwxS/yGyh2wVv0xoF9ubCKtmjhdFkhR5
 sHyDJeN19I9DLa713fffVjFx9WQFyZloOuwhaKHfjI1alVY3GKX9tjg
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042512_107655_1F4425D2 
X-CRM114-Status: GOOD (  10.21  )
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

Add the compatible for Samsung Mongoose M3 CPU core to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c54d20dd9d7efcbbfe73e5a63fd2f61d1e010d29..2fa7d3513da839ddfb2844628b1249567226a025 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -207,6 +207,7 @@ properties:
       - qcom,oryon
       - qcom,scorpion
       - samsung,mongoose-m2
+      - samsung,mongoose-m3
       - samsung,mongoose-m5
 
   enable-method:

-- 
2.46.2


