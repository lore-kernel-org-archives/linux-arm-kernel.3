Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1731F01825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gPeJxyuGY5/8F9b5AqNdyg2EFBWflmTDpqYPujzuFU=; b=aeJ/4PlsaBc7g+F8pnZqeWL24z
	d7MWqSBsFx0ll1CKAqqFITYWSJSQn86TzSL6eX5U45LQsjPrtzETbVKMWC+gtR0FvHITKwJxdV663
	7nBMew8dInWAjotFyVEtuvRmpJ8kiRGYmOVk+XUPQwTryKe5RBkyasHQwCIHKwq0aYCMX6G6Ph0ai
	0pgx1sxqWue9vMnSSDIrcW0U5jTdolCt3NqhswGPEVGnx/PQP25fj5KQKI5jflLpwVHYuEIjb0Ra+
	yv32DIsrAWnB0UvEXtZXdn24nisW4edd+/thRkzRYj3p7PQDX4ct76kVHvjHiD+OIGbQB1cFcW4++
	8Q7zyPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRT-00000003SWZ-24os;
	Fri, 06 Mar 2026 10:29:59 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRR-00000003SUg-18iM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:29:58 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b9424501589so128983466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792995; x=1773397795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gPeJxyuGY5/8F9b5AqNdyg2EFBWflmTDpqYPujzuFU=;
        b=CpMwWVQeJShq4lSYZ2Nu2G/emsN0b/mWtE6UjEmH4a5Zr1fIEizDmQHftc+MrTwPbO
         +T9krbQ9AWw4x2APBd5ts9Qy6kiapkKb16xw8zIwDGTvoCepiReTVN9tFhVrB/AfDO45
         PLSQ5YgSiFfbYoj9yl5y05sbiYlNp08qRKr8rV4zU+9TpyUYlpwEnDK7Qz59ET4zQsjH
         /F/49mwzi1t5sZLT7xEIf2j9LonvoUNhCoM3MhFXIhdLgt4g1fphoa+kR5Moxv1yQBbS
         aij/l0wBDrfWkgZhK3od6zSXSfhsGHdJw1PGeLa4spe4f5DSKsEvRz9W11W1VrjhMrfV
         VDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792995; x=1773397795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4gPeJxyuGY5/8F9b5AqNdyg2EFBWflmTDpqYPujzuFU=;
        b=qqVDjCNjFDx3ecCkkirPYHAuVyYmI6WDt6AWrcxkHNivNg/L/zgue2jXdMI/uuE0zE
         toQXzgs3iKzLNJVQRCeFh9+OeUQAWbLGwnXe7jF2lcY9ak1/J2Bd6c9p1V3IsadeDYS/
         VPiTLjpmP3mmCw6wfSaZD0FM5zLMQtwlpQUXmyAOqTkDVgGv8Jt0jcyJQ350Ql4dSM+3
         Rpr3K1P4w0BJMWIuow2bnQ2+7kYz7PUnntQ3hi+K77yJ7j1lIsQoB6A4z9NKE03//k4+
         EAs27oH4HdEGdG9twe+N2LsRdcGK1hU1QVlGqtuCrpX2+Aqh3WA2a6xg7MtLk3cWO4sn
         iXLw==
X-Forwarded-Encrypted: i=1; AJvYcCXiu6Fb66yLKtoI9PuFw57DMuB/uvRZOL9LPTaFq+Ty8tWcKh9ajJmmCEJAsIA8xhUdjcfi7rPdvzJtBn+RL/0H@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6n2bFnCwIbluQpRdIMsGoBOTuukkiXSfRpNP/hh3MVb2l5RdM
	0zycU/xd/hCb3V+fdmyVrs4FeWCttaJtNmMAfb2cG2fkyaTe2sAZkz0l3XVz38T1yO4=
X-Gm-Gg: ATEYQzxYJXNoAcaL94NZLR/ujTScWL0fNLmhPgY3gM6fwh0o9nn+pIyyrpSUWHm9coT
	NhLE69pL/T/+KxNJ28ES461A9Iq6P+9s+MY3T223whk9+MbEgqqd89avRTh6vBKo4CB00sUkyDV
	Pnk49U1J+meKTrJbbQi69p0RUK2e92SndMKGadTD37Sm4wQ6K6IWU18jT1DJUwrt9lvN9tdBS2p
	wSX2ulgZc02liDW+OspQMZY3OWbJz58V3VJ6aRQR3FPKnqcQzrEanhrTzWTN9zbYpFLh4CCt+Xz
	j3OYacqqCAdJnmPTYSVcDGn9i67hcMjTbealyB0N6ySiP4jlIGV2gU3DBZUsiuOzIQmLPVQVa80
	AmprDAlLbxvqa0FQpKdikZgXrHvvZdnvV4zOTsbt/9jQYgdIZXAlwyTi6lKCDVIOhQOvWhggNGQ
	iERaTsn24IQ5PGQuAH3FhkFCaQqdoQ79/20IdcCoykYaehB3KdXlf34oLYtBe/udQ6jOkxlezoH
	7e8pIsx0EvwU94Yonoyz4xPvQ==
X-Received: by 2002:a17:907:3d8b:b0:b43:b7ec:b8a1 with SMTP id a640c23a62f3a-b942dcee05cmr89065966b.24.1772792995144;
        Fri, 06 Mar 2026 02:29:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:52 +0000
Subject: [PATCH v7 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-1-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
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
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_022957_321598_49A5B257 
X-CRM114-Status: GOOD (  12.80  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/soc/google/google,gs101-dtzpc.yaml    | 42 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
new file mode 100644
index 000000000000..a8c61ce069d6
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
index f0b879760b6e..611fa8fb9f8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10883,6 +10883,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.473.g4a7958ca14-goog


