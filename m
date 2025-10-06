Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DC2CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZygAzCt4BgJHIzlNAdvVKPmowO3lR1rw3aDJhpq+oRQ=; b=mIqEbJwvuZ47PQ+lfE7P4HuTR8
	EvSJ6b1mPPvg0BPULWC56ucfGEsUvCjwffVrRO9p1ccqUJm54kHnZFlmWb/etNZRFdmbiuSJObVSg
	ogrESjlVPD0fM9aFBnFQqM/lwZldwQ2kYDbRVPH+pCl+BS9oegayegXM3achBKO17N7lMMlF1PQd8
	rffgFi3G/BXuABctXlmXL7q/J5wXjrFdNBC5530blpnZyXB2guo+Z3DpOBhywptZMc2uwCF4YNswM
	EWXMM7mq515GGT01zuSSSZXfs/+fJqf7hWY0TjUA1JWaiTc760c3oXXtOYHkI9Wb7QPjKJnIBhOrY
	61J+xmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJB-00000000QTZ-3uKR;
	Mon, 06 Oct 2025 16:43:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJ8-00000000QRL-32um
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:31 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3dbf11fa9eso960433966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769009; x=1760373809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZygAzCt4BgJHIzlNAdvVKPmowO3lR1rw3aDJhpq+oRQ=;
        b=qreydj2eyYqd+Fc9wjl9ehOdrIrgwOSt53aT+LufAT392JKMDfeTxfIC16SP47SeFJ
         OUdF08IeVPuNuSeDQrDiPfsEdfG5Jgtywzkurnx244D2oBOKOXfMuOhguqu5hX0Kl5us
         q34i2CxQRFHq2/Uc5B8DwkUlsqSGJItrI9AYvY0n7h23My5S/UUpqCfIAWj1HQLMSjBy
         0u11Z/2EG5PU9pX/HxwA1tImrfXyeH4vQfKxLFlKy8ip7KXe1eXyMGDJFwycq8aX2n4r
         PInCZKjY+mTTqRzTGIeLmvENbL1dcPIW8jBjowocOLdeNwIuSW9Uyh+nduqRIKKq4t03
         Vb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769009; x=1760373809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZygAzCt4BgJHIzlNAdvVKPmowO3lR1rw3aDJhpq+oRQ=;
        b=vKKSFEZCGt1ExBJBLQzfxFAH8F8vqB1wMfjOFLMd5wO2i1CMBF+b4IXjZvaLwAPkA5
         0JSDkAjn1A/7+T1F4yKR+Swp4IZ0JdwRlpvxRyL4u9ZegSzkcKCNO7czt9FGAZXY7fQz
         WmtPfdjcky8A3gWU0IzjA16/AaTTBCipWxgWLJ9+sbGfOFPUlHKmEkszFni9GqXovLat
         jKuAxp2b3BGKtRrEuRr1qo0AVv8yu6iIypvLu6B8TZ5rtPGXioKM/Jqk/dpN7yHaRzMc
         wpmscLH6mcHWmYsxZpQ1DKabbd2C323ZYV91tW0MOCdvejyEO9iN9BQA99oDxmvMBUsd
         KK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6EGlyjGw911PYMDQhv98VOuJ0Q8VcGaPnmO7UoKt+KKQTgNEX57+5gKFZY9XQ0eK0fixAyhV5V7OJRYpXDnqi@lists.infradead.org
X-Gm-Message-State: AOJu0YzTEzCMNkOPL+LklIcq3CHt/Qxj9KZxa4BAStT3QDJmaOXh139e
	guUwzF0CwrCEP6GoewS6wcyz9HW6L6jkrmCPuymH6WU7JSetkYV/MpnYIZW+6YXRP8dJ5xtuxm2
	p8KW7Eb8=
X-Gm-Gg: ASbGncvI/fmJmMhOHOrtt50qvtLVN6tNbjbVfjmSW1VwfKGIsT0hxS2F2lN0J7ZW4dc
	nPPL4fBcuohXqLe2eMgIUsuG1CNQJtvrumvd+HILox2LjZ2MiE94cGzvM4lTEDH4e5s7XQxQ0QV
	B2ee/fnHkz5suuskP0pSTUVf2GruBMReJzP1rc4MMnS8q6vnIx6Z+GiXqzRZ4oFIbfVe8iGTx8J
	A3/VjsV6nvYSdtghmAL4zDWWQh+alEp1NQpxIC/IgerusoB4F6RrZYMYB2hmICyl7Mlpy+Uz7wX
	iLbtJ17NAA2JnOVzLmabNDlswScasSAtCabd55SDciAP31eeJrLb3D54Ut8XOqrvE/eZ2SlclOV
	YAS9tDH/FZPHIX70lkMldYuiTW8DsodY3Gz4u5P580DoXfYOAFdS8OJdWDESCqJxKxyk8+eZ47X
	zREEDrridAOhkofHUdx3Zyp5C9iYMb1nnfWpIbKW6D1xuZbmds4XU=
X-Google-Smtp-Source: AGHT+IFKZW5wiQTkUSviOMSQIOsmLTTkBC5m6wYT7o0NG+U9VIzLggcGukVJvrDeFkRocqCcAImACQ==
X-Received: by 2002:a17:907:1b26:b0:b45:1063:fb62 with SMTP id a640c23a62f3a-b49c1d60b06mr1448559466b.24.1759769008797;
        Mon, 06 Oct 2025 09:43:28 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:27 +0100
Subject: [PATCH 01/10] dt-bindings: power: samsung: add google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-1-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_094330_783922_B5DCB705 
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

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/power/pd-samsung.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457112ca0098c043e123f0a02fa1291..c35c9cb0115d79e5c36142da2c2a5dd30cd2ad47 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - google,gs101-pd
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
 

-- 
2.51.0.618.g983fd99d29-goog


