Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8225CD0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqsIVZZa/U0N6/VUDWdRU6ufmGmH+Nhcx+B/uA68Obs=; b=hM5jK5KVG9MawI7p+goAI/MxAa
	et2s239vCbM+mmhE8UaFnuD9qGZK5cdCWeVuhCmRIHrl8Z6trmhebOEIkqOMCHssFjPaOlneGNVcE
	POjCFxH0/PQeAzp+nUloNegKmkXLfek7428HEcN0PxBg7skyxVe4CQy7A5mGIYZix4lUZrSUmf4Tc
	1JlHnAE0PDzDTKikoiVrQELHCh1AEP1/ienxXHXxuHviFwKFG/4/CRRViGlTrAoFX+cJhegbdHPYI
	wt2FIk+ttgqwdiQ8k6Q7sM/wfNcyrNyC9hzrVQIjhEiUtLVOzwYHZmnLK1fSRgeAln0JyvTsLdFnp
	xXwaK7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3k7M-0000000G9QO-1KmV;
	Wed, 23 Oct 2024 22:46:16 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyi-0000000G6wX-05nC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:21 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so324180a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723039; x=1730327839; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqsIVZZa/U0N6/VUDWdRU6ufmGmH+Nhcx+B/uA68Obs=;
        b=SerA3IzyLmgdBDqNnUZr1xhGZqBYfcYKS6WfJ1qR+8SkhVh1obBIfjzUrA4mEY1vJX
         yB5XxUgwnSu7rPv6va/p+WpTB0y5tHhmUbDS2ozdwThdL57Vo7Y0uEVIpQwxdSIa5FBq
         ohSBPbE+fTJ+bZTeu+o6nj9FkcVfb0bhZYlFt3UHcRKHQykVX5pLHA7IcJXqY18L1AiR
         sTrgep3/RcoIl9gIISg0tQGypCUvu8cvn9DnO8rQBqOstyMZOjwkBv1B1Cx3a3rr4Dob
         /YbfXWPwcKnJGojE2Su+rNEjoQTA0bVGZjgUS7cEIe6QrYREsgP2ZkHRtu9Qm/EHjrcn
         tkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723039; x=1730327839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqsIVZZa/U0N6/VUDWdRU6ufmGmH+Nhcx+B/uA68Obs=;
        b=j+mJbTTQ/6yfFP5uk/xvt2ap27EXff+OXAeD2lFvX5M5Kl6GSqnaXiivWrjKPz5wqz
         o9OpU98AkveFv2Vby99Qz6D5DQLsz1xG0UAspmOJlSiew7S+U4JykE5ZADXW9q6xH9xl
         ojOFrSS4A8s0i3zpbDLpA37jYnvxRPVUPfuLV+lWRpbz0iaQJDBr1JuLqRqoVmrwsKR9
         TY5r1lbksqFFhzll1hjeKrIvHpVZq27ViRv67vnarl5kdMGUVLltJ2fs871x9D89qfpC
         tvZiuZLLup+jtbrRfw2OLPIHAlSSHbDg/js8Gege5nlBCamP+iddgDmLYA7vv6aD5qFG
         7jZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5hM4/Ze1jUzJ3qh3Eb6vyP94Zm36yauIu0pxShRxjzMyTzBqMYGRaGUuRXP1wADZvo7PRnH26yhjRkZETCgz@lists.infradead.org
X-Gm-Message-State: AOJu0YwtPQNbdFXS8lRHYMKHS49k2QhJKvqxlB/Dhpx7ceyoC27SMqW0
	d2FzMgbyiW4OsgYLBDfrlDkelp20kh/N0gx6dTGQWXtmOVIG7R1L
X-Google-Smtp-Source: AGHT+IEoQzCmWtUmspfTlIND7cTu5IdZanZZbCzIh7COe/LtmuTSwHdea/4nRvUfCfZcZ5SxWklmIg==
X-Received: by 2002:a05:6402:13cc:b0:5c5:b9bb:c65a with SMTP id 4fb4d7f45d1cf-5cb8ac2d6fbmr3132944a12.1.1729723038599;
        Wed, 23 Oct 2024 15:37:18 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:18 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:35 +0300
Subject: [PATCH 04/12] dt-bindings: pinctrl: samsung: Add compatible for
 exynos9810-wakeup-eint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-4-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=1084;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=7H6VJtJFgWBJwnqC87mXAK1t9DhYQWbUHewXwVI/pEw=;
 b=erQFkuiY537nV6Oskge00QJ7SJyLbWLjp1lUt6Nm7JR+k8rWGNo+DDdqiqpzjcdfDxjYE5EIZ
 a8f4+kWVObYBxotF6PFP4rax7mUZrBhtLprZ9O7ZdGo7DcSehtKE+sS
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153720_096171_349E2792 
X-CRM114-Status: UNSURE (   9.49  )
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

Add the compatible for Samsung Exynos9810 pinctrl eint block to the schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 565cacadb6be77b1be1a7423f88564dd950c44db..68ed714eb0a178c46228bac142d69bbd6baa6277 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -47,6 +47,7 @@ properties:
       - items:
           - enum:
               - google,gs101-wakeup-eint
+              - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
           - const: samsung,exynos850-wakeup-eint

-- 
2.46.2


