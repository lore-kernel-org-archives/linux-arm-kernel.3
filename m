Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B55C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPphbwPW3jRb14mN9MVqvjGdvmGkxh1ARNk78hKTSio=; b=G4ucZPvVyhS1oL9L5W6avQI9Na
	dQm85MW+CrW4Dv/IK8GTOqhK3Oa+uCCxxw+sAb0GgLbmiRlIo/3jRmv40CQFnqtFVwScXVOceCitO
	B8DOUf26tVoVZhPdWgZPDSZKsJD/bxQXHdFucWmNBu85PRTS1+fPyXV6EbQp3/auFbbnULwxuHf8a
	fjYrxWCf7ptG+15GMLeRU604YpIz+Hzs6D721YvrGXGC3ng/AT2ppRcy85/oKVqyyg+tWICoOt9dR
	raQ3f2N7CQVbXLB1UKlBlJrGMUSQin6d4vm24H9HhhUfmVtCZUVZ1LneJmE+VJaeNwWHl4hZan46+
	6D9+ULMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUb1-0000000DvHn-0RRb;
	Wed, 07 May 2025 02:33:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPMF-0000000DOQE-1jPM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:57:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a07a7b4ac7so2809175f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565062; x=1747169862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPphbwPW3jRb14mN9MVqvjGdvmGkxh1ARNk78hKTSio=;
        b=a3HgsUPZDRwXyLrC5ooyiahemdFUH1gOUJ4PklVSDdFltvhASLkGbHRdeg7ZH77i81
         lxcyrF1aPp3z2wxV2ons0Y7C25V4VwI0Y6LqQj1K/a506OXR99wARBKfBCu3+2t9tVuy
         k1zX4vjJn1cLZBUD85gSxJ4WyG4LQ1UZWOKzfpGbfyIgzS+5dURPmQy6z4NTOH+3mskq
         NrXc6SVSdb2M9MLxsvufgmTf5w3oKbJ4vpEyfW3/op3ouFmy7txmB5krOOTZYmWq+VgC
         53BE9K7/89CXqcKC3A6mrAgYm3lGOa8i5mMIxOV9VAkGzNxAbkCLJcvyY9OwCH/4gXJp
         gKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565062; x=1747169862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPphbwPW3jRb14mN9MVqvjGdvmGkxh1ARNk78hKTSio=;
        b=MM2PywGVaKyGwgoKHklaQOmefpzqiwnNi4IVH8MqjO7pMIXym2M1QKYAnrjyIC0ZhH
         0R7GsWkj7MWqPhG7U/yF0KMO3tJbCh0/7kvX/TySCoItTd8nZqijfGZfT4h3KNKu0V/N
         WamLB0drPU6UD2zdh/rXJl78v68lKI+UF5P0R4vXNkskDFtKkwcPveLLOIgVAhh3W+6j
         DUutMXZoM2cS0wqDhU0q7eITadlMqPD+a8W+JxWiKpzS4kZR5l1KKRO5yc7E5IntjqJl
         vF8tMKOVxdDyBOzJxnQJePZkcmgFXUepB/mJTr9WHUDh39vBybWo2gNAWG8+790dEeZD
         ZZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXd8jdJlOrvR9/RCNma/JUuxkmsTc86ZgIeomwETiTrYXpeCdKXCH9RB1vYdXkouix7i7WgBMOBgONC1mI3nqOm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd4P6tw4keWM/lPD4NWDSZESjC5IDWQ69wnv6QhaP0JM6ERi8E
	g94pZlMe6YUTVMjsMQsL7iwgPMszdlVkaPOh1qa4CaKrfiv8sZbceCRioJ3wwx4=
X-Gm-Gg: ASbGncuLyyB40TYY1rOtKzpU/yl39oO5fLWpmpkkLuU5+pqUYgD7Q9IpBWy+NXHabTO
	DJDFd3FxlsE0FMs1g/KZmrL7A5jTKS9AWNQas4/mwBfbIW4YC+rJ1TyIL/OFNf3uVU4pTQv1DsC
	UJ8eutOCIkNN0BD2MYo32CN7czVJn7XuwzYdDUEmn2RBxS+wbYiT91hSLvqkPMx0nUUg92z5ho1
	k6Ax5jXet2x2JVHDb2hxREsDUXYPH3EILdeDUyJgdGL+GTZwzuWBBaFn1Az+DnDIy9/Q00nnfX1
	Is07WQsnx0u7bK1sg2kY5kIDEuNX0zQ0Ab8Sn5HOY8xa40zRcWb7LnK3F44tXrvnm1oEggk=
X-Google-Smtp-Source: AGHT+IFSlhDE95SzY++0BnY3/6yTVPg9tSQuJShvecTP8iv8glzD71jC6MAKKuiKrPDEpfjMgkK6Pw==
X-Received: by 2002:a5d:64c7:0:b0:3a0:8495:cb75 with SMTP id ffacd0b85a97d-3a0b49ae884mr743025f8f.9.1746565061881;
        Tue, 06 May 2025 13:57:41 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:40 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:28 +0100
Subject: [PATCH v4 2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 google,pmu-intr-gen phandle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-2-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Dwi73w8Z6PrIgKWj8BhvUdNVPqAGEMJAhF7n320ltE0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne9FqRL4vyvavqCGSB8WiKiy95ngApArMCaz
 zSnaJhRQcWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vQAKCRDO6LjWAjRy
 umGjD/oCM4hr2TtaKL10ufwpnUe287uZhycwCFgtVwq8X/kssw87WV1sQqeAdEhvjjA3AUwy8/d
 dOsVU8TNA7f0OmgwKvtAmB5tmgiCwt1ng69S2rn4/1M90mg86/YPwxeV08PYMdZffJi+eoges0V
 B5zFC8IyYWK0NpRGRG5kKDEcuSZwbta2bROdJyh1r2Vfk3WFPJNeCBqusgpn7qZIOUWd8VUGYfQ
 rg+qHDEM1uvD7WI4HX2rKZtwvoLchyB0eAao0xhzIVar7ALp2v5BK+99TQp/n/9ClPUwdI100Ni
 bfDhWB2Vi2TRlwrECaQ5Cxh/xC1yxYz/oGYxc65Mo6Bfmx+MHoWuDVHOc9Cx3wD5mqgRmDS7GaE
 ufmexxfCgwQQkaNKwCzATJLPv7QETXw9lSsYUFW7m0QccfqEsDXAcxo5tcF8mbp7yn3VMYcS52B
 xv4FKTJDQl4DVRXNPnQGsYgDdzGM2pXyK7t8Y0FMrCx+I/MZNpLOpVpm6Cl7aNRRNjKJoJTgzVM
 2rcxQi9VmrGfKu9W5ygzhTe9LBybVMRgQn6EF+Ve/VTtpN7iQdLfBuswSepHiKy32jz5dcAsFIY
 x0u0jaGtemD2MBIBfB6zCrpTLUwdx+nkifTxl8IaNMLRgFhG9p4HiESrcWc6/VDWlMKdEzjDce+
 0F23juvsfaJoLLg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_135743_454711_0C5CE311 
X-CRM114-Status: UNSURE (   9.77  )
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

gs101 requires access to the pmu interrupt generation register region
which is exposed as a syscon. Update the exynos-pmu bindings documentation
to reflect this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 204da6fe458d2d4bfeee1471ebc5c38247477ae2..3109df43d5028c61cbcaa597e7bd8cb530eafb37 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -129,6 +129,11 @@ properties:
     description:
       Node for reboot method
 
+  google,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
 required:
   - compatible
   - reg
@@ -189,6 +194,16 @@ allOf:
       properties:
         dp-phy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-pmu
+    then:
+      required:
+        - google,pmu-intr-gen-syscon
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.49.0.967.g6a0df3ecc3-goog


