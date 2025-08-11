Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7C8C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yEICwzwwwRaLhCcG1cQOxzwurLWc9XkHOs+XEL3udM=; b=aSyneNUriJ3HQdhscwv31Vqfth
	/ehE52IU53rndfcglLy97ZwKJZEhyJ5P7PO6IUpdVd9noHq5WJhzqpRQ9j1uj3me/h6S0XIFnTwqg
	kG2qERd/qKB0XTSDHUOPBtjbEgWd+k3JHkr6dUb+Qfaa/5ha3zs5KW9uMsMVXNJLrH2NtkYPFMUVb
	Lmp7vKvn13xG9gBIeo/cwLVU0rwntLbj5j77DbbSWQkGvMDHN+USaVOad9CEYoVx0rj6Z/Oud8liJ
	2ZtcPTicxIwllb0VOhPtS1161Cr994jdj1O9Xj1M08+R9sPyWo2IdZ23L5phWM9IaeI9AnalGrGI3
	JCMEEqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTps-000000085nq-1F2Q;
	Mon, 11 Aug 2025 14:49:16 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSzm-00000007tw3-1pCm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:55:27 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76a3818eb9bso3906014b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920526; x=1755525326; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yEICwzwwwRaLhCcG1cQOxzwurLWc9XkHOs+XEL3udM=;
        b=PpgwoaV/MCpBYTpGbi3L9Nch1Kg1cwKiuQD4AEeKHszXU+uuElhP6S77dTFYAgrjqu
         cvJBMApsIfSIKFv0QwggNG/NC0EBl1D9CtCYjISfLAsnx4ZzKPyfj529UzTB8AHFQNTr
         N74kZBNWPzaNU4fEC3/8vu1PVdcN9qSJd4x3yR3CpPKRglBmIKv1XABg91V8EOS8z0z9
         UXCXXUZNOrEl/OOGhAQdTGavP2JTUBBNAyeWCegXOUxDctHIe4I+17NKSQNQW5yCdGIJ
         3qOAwftncp/m2zALVr2ZYHarM5T5rzwbIV0De7n0pas0P49xi7gPc+QDZtMiWCY+MQNc
         5CeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920526; x=1755525326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yEICwzwwwRaLhCcG1cQOxzwurLWc9XkHOs+XEL3udM=;
        b=dDsaZw2kx+LkCHTshKzGXAOCKPwidHod5vRPTcH/xgomMHe5rCb25f+PlHjXoqmLEB
         C60F0A3cjlOnzi2FGH2Y+XS+AYB9SYU5X96dvw+IrTpDyNSbzh0/zD6i3HjY3fkGuGb8
         rpigbuLEQkZVzhDrX+Y/iya9JIlG0h3e4HJcUzhPTBTsJQ2Gd4dJClmKgWcwg4yTXOte
         aRKpISMFfe04ocV33/+cvicVmbIrPZ+He3ZGpzBnWKA+4+nsfqVP6339JzczlUs0D/7L
         OW86VVyuQ9R7P3MInZqnKEOPFL5opCmIAlllrujMjN5v7ZiRaosP5Sm3s0jVypVoQYGC
         ytVw==
X-Forwarded-Encrypted: i=1; AJvYcCUcw+Vl1CS57MbuJLRSMELGGo0+jjC7pJdQV9xXGBVcml4qB8OtbWPCKiNzyU8TZDUIRIMlZxpOM2encEY7JQ2K@lists.infradead.org
X-Gm-Message-State: AOJu0YynFdzexeCCtYBff9D1A36bdsg9ZdpFV/YxyFVAnhL/4Vvo2Jnz
	2gWSoRXod9XMt7eUgQCO/43Z0VrgRnGA73DEYcjPR9nRLjmcwNmqqUeH
X-Gm-Gg: ASbGncv9vAiwHAfycWy9QhNhs83IGi6Omn9zbXHtOLVZSCIubP9l52BPIdSBFMGzGqE
	rztLgHxxmC/PgyDzu3GD9+ye0xee8ICTO+BE9aCESVebol/WnSv5MgpaSCS6SPSOoSB70R6YmUc
	5HtN3a+knbmUHeV0DDcKTvPM7t5ixn7YkQKuAw6SkMQwEAfiEVOj3y7anMumLN7F1110lB0Pihm
	CI142GlivejIBo+O5T0DCYKamMk8+TmoAAnhnaKhsxp5/Rk5M2l77c+Rhq95RBOVzSgnITExN7U
	r9Vl/YMESy3wG3qQJyDsGAj7g5XI+QA9FBueQTpE/dkXQY23yTR0awnmUYnewV9dnQcIS7TUHWB
	RVKpavRPVuTytug01bQbWeK57g+xP07lBq+ePTRyL9CFD9YA=
X-Google-Smtp-Source: AGHT+IHrxdK71Sac1/zqsEValssuJOnISop/ofjKE/WS0pXxDgvF2hjTi3ciKyUhy9KZJyYZ01xtSA==
X-Received: by 2002:a05:6a20:2443:b0:237:89a6:fb00 with SMTP id adf61e73a8af0-240550453eamr22616449637.15.1754920525762;
        Mon, 11 Aug 2025 06:55:25 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:25 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:33 +0800
Subject: [PATCH v8 01/21] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-1-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=5SPeH4B0HCgQ3mPJQ2F9oSAh7NyxBKYYgDF4wIcu5t0=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZAO5K+imeOa8Dg5N4+Q+5ghWt5CcWmhnuwD
 QW3eaYi3JuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QAAKCRABygi3psUI
 JDWKD/9QBGFFlKRW8463W701zQkmmFBupQgVn7DNzI60gxpZrl6zbdgY0GYMCNYZghcz2jbhOUY
 XechMJLG/nhbRUvM3SunUisReUoZ8RyOdd8+hQNLPGt2raNZnuw3AJlC9mse+vpTFAiN7r3bPFk
 cndw31xaSCtRKxcFjtIuD6zrasEzIkn5gHPwhgj/4n8lkbVB4J0YqVCfJooAUcG/Wmx8eSuXV7E
 a8bRkvIiUJ5vzDjGfP78bhbk2rjhPIvzSov4UJeZUo67a2HC2LDDUg0NV9kFVVlFabbjD8Dtb3A
 dBnkNy1+T5faRIhDNnxCr06QSMX56SqE4MHLWXaS2zEwzQnFcBhy/O8oyihWbIqOGEmAiJ0I2a9
 m+jJ7xchh4jFo8We8SiXdc5vZe8QZqWlXoq8/BVnEAZpf5BXEkYQYJXxs2pGBqNUj9Cvu/cJhUc
 QwohgEye2EijPCbmT0TvQ2ouzjnXiQ9zC/O/LmCqtOlSW98buKEBPC2G6NrPlys0PWddBLe2xZB
 k7CHuuIDoWij9kxdtvLDC2wFovfWrlDIoHK8jjgOh77NfB7KMJNdQCvMVPrJoKozyFJZHtXYFLt
 KSDOTS9NxNP4jvcP6sVcaaMKs3rgze7vdbKAeQC0IHAHrsu6RgsIe53F/wfuW0E2CRDzIAREf1Y
 LB0pE1lHU/YtNoA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065526_478446_7B287801 
X-CRM114-Status: UNSURE (   9.68  )
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.50.1


