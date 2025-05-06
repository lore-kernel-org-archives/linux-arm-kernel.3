Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36990C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtVVAvBNRNXOTj9ycnjiKhQ81sFidRMeXup2zFY3GHo=; b=kgzp+QZZR6l03wzT7vq8EXeocz
	6XYVFpp2eMTj/F81+AMspaLK2n5wdn40MOApUECFkO5Hv2UyZ/dXWlTR3VqwrvmQo2OXbYa7v7LMq
	EklM89jof6RXtbFhMV4PZHD/QIjQzi2rbjp81pMJxRSzdj6cWWRDJ8zobIBODtaZXs218BLS1DMmK
	pdbrnG+VYyaDSKi86n8yVJWvTTAhf5NDP95eidZePrwjqqfK47pTudG/DcNA+0P2w7OCqFrI+6k6d
	ddqBf+a0o/kmPzGgXVPa7PSYhhsl6Pn1pTnUH7bvBsm+fTvXJwruu2oc9S5ptEsx4JzkHwqKMKV6r
	x6SM61hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaz-0000000DvF3-2ejt;
	Wed, 07 May 2025 02:33:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPMD-0000000DOPu-2GJ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:57:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39efc1365e4so2978283f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565060; x=1747169860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtVVAvBNRNXOTj9ycnjiKhQ81sFidRMeXup2zFY3GHo=;
        b=FfEgmmSJxcULffFeLA95JRHfNCMB8teZfai/6FPDe1TjcAr9DQGdKY1YugQy9cc8Ft
         tWEG+CgJ4QelEA0dL3i+syrNdzQNUKox+wCD1zORrejyqzgpGxVWq8sZ8n2J0VRi+020
         MbZXMY4CDMsPX9txZVk2oTPPQGmzA68yMBT68gTifPraF97zwv8KaahTjHGR+qfT8NUy
         jjieo3jTbBr57cJj5ylhES+DNiGJabXN5XdDXl6Zjt+kB2yJI9z+PEARsWhyqLZRtrok
         swarSgEcktjo0/YZmb8DcTOWUb4DusUB/Gdc0S0bB9gRFOt22SWMqLAJIdH5gxlYnAOI
         Nk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565060; x=1747169860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtVVAvBNRNXOTj9ycnjiKhQ81sFidRMeXup2zFY3GHo=;
        b=cMKNhu0vURmyYBVIevIdB0FXYnyWfrbkxMObMYOA1DbN43ZdWPGsw9fio3u82j0cTA
         Pt4HLqRJWivTexMokFFR120Yx79kHqTV+SSXZbp0BjcInIZQTU71blLOTWjwXZRoClAA
         CBIeQYjBsieq7/hlxlMCe09X7yRe4qmrvyCygi9DuQ3TSxQ0p0fr+UJ+au3fbdpo6EUE
         owPxi8xqFWGMEtPYnR3bNC1woeNdHsNHHk1EG/Fg2qBXgAVupEwpGjva3drEEdTAMQfn
         Y2B+d6ekoX9+0npgb9rhbRVG++sjNArW0VMqs5pZvDMfiwPd1N7SOFLBa/H5CNBnKZ3u
         HTfw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Xt+BCihFuGi/9v8FSfp17ChPCQDfkbKhoSqD1eorCRlSmBNZYoXj4pJsfcHaM5E4owos/3Dajhr3VfCAhdqj@lists.infradead.org
X-Gm-Message-State: AOJu0YypcfqcyjBSK7gukc1CwhKDjjiXYre6zI/wlQApKknRpRtGOC3a
	zDnvlXd7WQ4xpNYoHZ3LAv8mSjWVa+9z2L5J3eNC2Mo4CmzGUEY61PhTblPUk4w=
X-Gm-Gg: ASbGncv8B+2xytPll6F3mJaaxJyTdBR1DkboAKyDjsxd+4lTCGwz7H1U8423hs/G6Vu
	h2niWykeAKBnpaTDUd659bzDdS4kj1IrRTE7xK5tE8kc3B9rw0tXtSbzqtIz24Uy0oyN+zDP8Gh
	zzhBN5ugRT6tW8ow5kDW2SMCOf1g2ZbphtlLu55yD9plds663SVO1WXOAGDaTmaqFnwZzt0k/Rq
	ZLma7BTic2gJoe5KfZREUtCyQBc69eWxxFr8UAGYpRZONEi6keL+ZdFb7ZOAlWvS2gRZyyqXfKK
	5X+ml+jHB43mwzczSHD+J5x+uuRM3SPWTD2+fja6825DKExeTFu6C9r+7gDsA7Ll+GYuM6k=
X-Google-Smtp-Source: AGHT+IHjjOZpvxXjJRqm1EBDvtIRg9jViARXQDNiynCwlsBktmak9gKLnfrD+JJ2M1IVcyYbpqIRWA==
X-Received: by 2002:a05:6000:200d:b0:3a0:7fe4:df6a with SMTP id ffacd0b85a97d-3a0b4a4a407mr683343f8f.56.1746565059782;
        Tue, 06 May 2025 13:57:39 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:39 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:27 +0100
Subject: [PATCH v4 1/5] dt-bindings: soc: google: Add gs101-pmu-intr-gen
 binding documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-1-9f64a2657316@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=mHVfdZqUplNPUuQlpTqhLpiAYdBfxBb099/0y8ffhnQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne9fwRgTCPtGjWB5xgUtQEMw/NDbt+Rmt2sm
 OgxappgTnGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vQAKCRDO6LjWAjRy
 uhh5EACBHRVSSR8424VBCwpWJmj8L/Pd5ZJ8uAUZL4RYy0ESU1SZFbn4HnDzr8MrhI/Sy0xLloR
 xnaPFOrDfz0OECmXh3EAmbSPCvqpArfU+56v6KQDFBCLouOmgXnXzDVeX+QV9OMkL1h4KJk8qyD
 Sazg67p5MfS/MHNPBZnKB2ZpwhmB05x14QNEn6QUY9A9gk25+WJkt3udIsLcUCAyzICwTWCqGTY
 nmksFGz0oiR7Uie8+zrBC7OJUYjyOHoW79GOHy0wdHQ+HrGbaH3CUK6T87spkKysKJYXBGU+aiT
 wYLNCDkjwHgfz7X4ikO6B2DbckHpbQHV3wtPuVMaxpTRSPcyPFo7z8U90I47wRW9bs4zVXOYPs1
 V5p6ymVUmnikwlj7V5DOqQDRDnkz82hfDccHROc4x114OcSeB8kdLu8vJZkE2aHjqJ7OncN8thV
 /eLegORccxHgj0Si1LkQqcudSY4/1RJo9skWsrwbWf9xiLWYKz6eeNMBG3xMmdGIS3PFdulCeAb
 9f5hLQuNhNOBF1PnCP36P2X7dYJmKiY7DyXkhBNEQ9X1iWxAOIhAik8yRz+LN6XD+TBPSWjw5nu
 o2+uUsYZhhGhKZquccWpS04GD+c35EyTx/PodQI332ZSXUuzX86pqcygHw1Qwj29O7QxwbHnhRV
 uwpU1IvJEDRrkTg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_135741_583001_3E54FC9E 
X-CRM114-Status: GOOD (  12.30  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v2:
 - Fix dtschema error "relative path/filename doesn't match actual path or filename" (Robs patch bot)
---
 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2be022ca6a7d0780db3163f1b774e4825a9123fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
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
2.49.0.967.g6a0df3ecc3-goog


