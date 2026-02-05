Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1F7ECD9AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82wBgeiecw8diioZs9d1L/8/7KXtnNKqceYMhdMY7vA=; b=cgi2jkoQW0R9iHJjJCZ9XzD12f
	hYdLka92fyP+enOJGiipRY6+3wWB/o5+g29cIrXA1maq3Y2rxVkaB0Hz1OTAv9v8F/8wHZcI5BldM
	cdhReHZ1sdYmbCy7NvDo+stSZJhkvnVdQA03tGjuaviNEIatO/m48CdvVTbOVha+yXV3drrso/u6Z
	kYR1OuAW5dEB69M8+1Ee5YFB/ob5MogwRnwT+M8AKMzoBSycXqd/Lw1goSwh+xFcgDSq1NrQ9Awsa
	OD+hdfqfRtPiI4RkD97Ti/kFzr8Y57H6k2eGQvxwvPSTnQe6TPhzKab7EtbKUGYLs41EqTNxSwAAU
	5+Cu6BlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77W-0000000AWsD-1CnX;
	Thu, 05 Feb 2026 21:42:38 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77T-0000000AWq8-0luU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:37 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so3465566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327753; x=1770932553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82wBgeiecw8diioZs9d1L/8/7KXtnNKqceYMhdMY7vA=;
        b=idRll4YZpnqdf1QW5tqfoPV/wvpCqy5yHQKsIk8BzTkm+sW6z9rZfEH8IhynlAGyC4
         Hd4nYO23iS8D9tCdJCdzMMbJUVlI3lQ4a/q/YqDcvzQn/yIvQDltNyWs5zRmAGV20x7o
         KVtWaYXVsRJNZPj8gAlI7g4hKes1T0sby8C/OqKWevqXUPG3YvyHonMqnsNAQKprxYa3
         XBUzJKYnJJgAkDQ4p2Fh31FenLbSvPwK5tOYv2k8Vnv7vfsxjX2lGMMAu1CPTNzv5k6C
         /VJ/CyRQMCJCzG8fNE828pwBOOHFbfmJ8bVLsUipfEUpRg2KY0cV2SIE4HCN5JyVHsnm
         MC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327753; x=1770932553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=82wBgeiecw8diioZs9d1L/8/7KXtnNKqceYMhdMY7vA=;
        b=HxR5li4YaoqLTqxI2RW3h3ikRxRi6kbBiPznvS3RRsU6nsIF6o8eWVQr3YaRT5Yyi2
         cswZ1+BZTQY6HmE3BhNSpTjiSoGdJO2sXKovTRqeBbQYg0h+lOOEoSlGuwqt60+wea62
         +Fsy7jjcmNumoCwR6wzvx+SY1c9HSfLK3K235qN/DqdrhEtOgQdnrC2QpsS4kJdJ3Opr
         /S/z22HvdD9YWQlYuBZLy+JCad3lFTuScUQa+4ixcZfDHRfJb4cS/ad2E5HfbRr2pDG/
         q9GQP+bsbxMrj6Dmt7ci3QgIOV4bepeK1rrjquOUaNXZjjfMji5xhFk1eD0V5tTgOPsf
         vLlA==
X-Forwarded-Encrypted: i=1; AJvYcCUgI0xwGJcvd5rpUdfr56fOg2PSfFgQQ4VM5D6aByR7jIc/C6EzfaDFdmF/Dhn5QJ32BkutK4fl5DuNUWSypNhu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8KBglCqPJE3t02h2Wi9TbUKFhT5IbvxVkPTomC5dFOS7jGldb
	jYlQ9begJNTDp+SkTO/BmFtm++5vAgwyCA8I8a0ZxVAuMCslZe4iMqSGgV0Fml2rZdI=
X-Gm-Gg: AZuq6aLk32rjjiYP1d3zDtlmHIruQq6KZCJBu9X5nV9+npleXPoudfsS0cTZcVqAdpH
	umeLl8fuH8I8G1fUrs7vSqZNJh9e/XB/tOkfKoV8Wxm73VHG4SRSQIjyQFJAHrQNlwRthNF8A5L
	HI4KCvlwX16hV7V1RJiMB6/QBNm1rcxLC3CzeEUkVoSHzkJ0JIChEezs4U6P+ergM1AEI78FAUD
	SGv0vjaU4uInEXb4LlpQZDpGP/VHpRhhgMftH4PC5KTIlXbUmLLzDPbp8kDHLjjt/pYhOFFqirM
	PRAGyyi4rl5SkqHFCP1ZW12NPY6BAc1nFYVX6qBCPrz9bq8JVy6YW7dNIRp87DUI35topuHlXSv
	0LmGO2PJ1BUUMrk5noU/2L+GoO8kgiUVe2/Eyk//XwlisMajUptOFgIg9yV68uQH/iMKb/ssEd8
	w5AWkYnTIegV1Awy4b26D/dMgFE4Dcguz7iXfPQGVJPEGGoWAm/Mubzl100jqDEctZOnoGNnBxo
	Bmg3Q==
X-Received: by 2002:a17:907:3d4b:b0:b88:6542:86a0 with SMTP id a640c23a62f3a-b8edf36813amr26650466b.54.1770327752702;
        Thu, 05 Feb 2026 13:42:32 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:29 +0000
Subject: [PATCH v5 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-1-ede49cdb57a6@linaro.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_134235_238198_E4054834 
X-CRM114-Status: GOOD (  13.17  )
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

The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
an interface to the protection bits that are included in the TrustZone
design in a secure system. It configures each area of the memory as
secure or non-secure.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/soc/google/google,gs101-dtzpc.yaml    | 42 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a8c61ce069d6910c47753bf14a792eb58e6ae182
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,gs101-dtzpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Distributed TruztZone Protection Control.
+
+description:
+  Distributed TrustZone Protection Control (D_TZPC) provides an interface to the
+  protection bits that are included in the TrustZone design in a secure system.
+  It configures each area of the memory as secure or non-secure.
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+properties:
+  compatible:
+    const: google,gs101-dtzpc
+
+  clocks:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+
+    dtzpc_hsi0: dtzpc@11010000 {
+      compatible = "google,gs101-dtzpc";
+      reg = <0x11010000 0x10000>;
+      clocks = <&cmu_hsi0 CLK_GOUT_HSI0_D_TZPC_HSI0_PCLK>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 900fc00b73e6d17443f7cee12fa7589b56facaaa..7fc1964b6beaf835a398a9bcee4ded191034d2e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10855,6 +10855,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.rc2.204.g2597b5adb4-goog


