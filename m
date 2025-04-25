Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57FAC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYqogGLC2cddLPBbS1CDWY2diLE+Y0sNiNUFT0GEwxU=; b=NNzqX1nvkoG1pRkx4sbTLcy0Rr
	Xjdur+wH8O/zcGXvyZIG+1uX9YCnrX9KJvpPW4D18shtERiozpjUa70skThLefNFKokq7ABcNN7Ef
	BafqbQCVUSCTzIi75XeUHbN8i57lvwLGIaGfHue9ThbS8oWebn2AWsj1V4NfjGOjUzHKtupnQjqOW
	TTztN1LjOTRgJ3+IC6KGOg7FsKVLMo0f8rcVq39gEcvl2+TRH5NvXs8ouP8oKoukNzAOkiis/iMrl
	9twdPiPROpdHwz2P1NnggOc6wQ3QvAg5HmUJsNcfs2rnify3oEcToQxn2IL+Tk3U/jXQHFaJ/YirD
	BdnlDzxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MdW-00000000MPY-12Qv;
	Fri, 25 Apr 2025 17:14:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LrX-00000000CYE-3JP6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 16:25:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so23926435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745598314; x=1746203114; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYqogGLC2cddLPBbS1CDWY2diLE+Y0sNiNUFT0GEwxU=;
        b=y0LHm0/CQmi6I50k/ThntBsp9E/G5PGefYpR8gfLBNH4yImFmIJAeKQskz+IRe0Sfw
         dmdvzkVE9xLFSmxqzEuHAWdO7KO0P3pyJPfqFTDBF/8yZAelNzSWdrYntDqTeE57g4JE
         MsfjCBFH/VvTTZLiyexotq37IKSvwLHrkcadK13Oir2OVtP2Bg71c3oM0AcGY7F+Vaqi
         8wFaKzvLMP8ETlFtuPSQxLZ2OBjXppTr0ufhg9m4BpikME23wWgrwWnnSZJkZ30j21dA
         c2xsrAxzkGOII/FSKlZdG8BF408dZZZN7MQkl7gVKL76E2bSfLJWmvlcy74dIcywbjKy
         /N8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598314; x=1746203114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYqogGLC2cddLPBbS1CDWY2diLE+Y0sNiNUFT0GEwxU=;
        b=uHiy/8vycAnWZoI/oHoAP+yhFthnb2xSbZ4AXea6AHuGG5MnsnyIxztPRKY75oFkwh
         F8Lh3Y+Zt0LvsyBenNuBZiApTBnJ/5ZQHy7lqM2h/0fUH2YFMUF/cQpSsCwF337UIgy+
         L7s59CTbnvZDZekFRvwmbP0lMfOQSUwJ8R/9tBtP+4mq5P4dmnzQ/3tvSaleJtnoknBK
         mrZeeP1dqBYCUzTiNizsSRG9QMyO9HXhrAuw3sipMvfC4/SMOPjS+iGHuI8+aMfuSOtF
         wTAZQIwhXAt1fPkYvl2ywc4ZSJlWFmvW4OTQA41MJcJGPyypQ6UdBer5xJbWqb1+HZNg
         dwZg==
X-Forwarded-Encrypted: i=1; AJvYcCUa5vdJcCaCFxCq/MbnAPS35JVL7MmurH3CiiQ7Sl4K/UBhY63tKH8RrrsDBhDTTkV2H6KYkKN4qlUx0bGASXx+@lists.infradead.org
X-Gm-Message-State: AOJu0YxkbpeNpQGs+AXduuq4rug1kLQ0QgBxbUSRWUeJkSXchapNNGVC
	aKXKfDA3gJZ9LiZWbnC/Wkw+22DBAsxGets2clcaZ93eqp/FenogiNUfFPuWvWA=
X-Gm-Gg: ASbGncsd8vNRbbP3pAUZ+9Xfv5y6LnUsyJirG1sjEOAQKYFa/SfL59BBjLlmGhp2rbh
	pPaYjIcZtmI9MppXUmwY4dsEns+Do5kT8nKV7B+r63Wz4OCafL3t2XACavbkInIdpZa1F+Foqw5
	MlnzbfIePQcr2TZ01dYtpTVReDjLL8LHHSggfYv7x19fxWwBLQ0tmemf1VMmaf98keCusqtaOtz
	krY/mOCAiJnQC5LiZYwZfQODsUH8XFct3Zfnyu6qNpT+seeg5pJB64I2BCUkDgQJKqq1S380BMv
	iisEYvZCh+R6QiYCfn4LihuF3Qb0Fvng2oTLTEYHUd5VaALPHvxNqfxf3gh6LtZ/wJz81LwK75u
	hUwoKAws=
X-Google-Smtp-Source: AGHT+IEoUTVhmuAxWok9q4iOOc7aAuIl/RZYfIJKhfks0tAcJlF/1Zv2cSL0eyMG6m9wGc2v6oqCTg==
X-Received: by 2002:a05:600c:a418:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-440a66d91cbmr24459615e9.24.1745598313967;
        Fri, 25 Apr 2025 09:25:13 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm61263715e9.27.2025.04.25.09.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:25:13 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Apr 2025 17:25:05 +0100
Subject: [PATCH v2 1/5] dt-bindings: soc: google: Add gs101-pmu-intr-gen
 binding documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-1-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=hYQB0xZ67lZhdVZ8Rt7JeIuM6JzDat6vMQb2LC4ryTs=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoC7dl0fO9aWiyJAYUMFyeTxppJc1TurFPqfxlJ
 e+kZddHU/aJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaAu3ZQAKCRDO6LjWAjRy
 uvfOD/0TCWaz/XJ7+sF6TYUHwykA7Yr7lzGpZ9q3aqgqVLiJ4luaXyQ8Ob9aGBwCkA8vyrPaUQp
 TH2m22EOmeEjBPVJW1pyObwU2pHrIu46f+KCzJwL6GiiA/He6ZqhjMkFkRnH3nORmmsWoG/rcdf
 YLykA+AhagK3hgbY4520BUJ70waMgXM2UivHw64r4wrMIdzQQVwjGCNMKIhCMNY5whp3p3GYtS5
 /CauPxyjuL5ca56ZNjjJGYsuAvExNYswU/QUXDKbC6T4EpDYgMPNtMrIwkkFBiSlNj+nLViq6in
 uEDVWm4Z47clBZ95I6b47SgLz1lv9L/ums3ci/r+3Jmt4C3qzDrwkkqcHPR6gD51vbgRlSsDGcB
 moe3zec5Jx/Xi8It8QVS49NG7DeSz4eZKCMV8JoaAu5cC7cQVMkeZMYa945BZMeOMB+IA2nwLIe
 yuNUW+bfIQQyHLS7AKztyGDhq9+yu83OK53wVv6TmKmjVyKG6rnmi4dvK+LZU8EmFGuVz/VYhjb
 efbAW60e4PW5Sh6MBdepjccRkY7knOdXdwiytjIJl5tDV3+R8YnTx9ri8YLksHIrvT7JZsf3DY/
 rbinCK8oV/m8ELlxyZvF7PKhWBuhqfb032KalnVE4xw+PZNiy1ydgdDYujCripu+vC9Di4fVUSD
 AAA/4k0Ey48IVgQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_092515_834080_668EE2A8 
X-CRM114-Status: GOOD (  12.09  )
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

Add bindings documentation for the Power Management Unit (PMU) interrupt
generator.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f358c5dcd1b61e271601359bb15091e31b36d245
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/samsung/google,gs101-pmu-intr-gen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Power Management Unit (PMU) Interrupt Generation
+
+description: |
+  PMU interrupt generator for handshaking between PMU through interrupts.
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-pmu-intr-gen
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu_intr_gen: syscon@17470000 {
+      compatible = "google,gs101-pmu-intr-gen", "syscon";
+      reg = <0x17470000 0x10000>;
+    };

-- 
2.49.0.850.g28803427d3-goog


