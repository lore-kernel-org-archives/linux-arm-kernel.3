Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3F2D3F099
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1M488vXqKcrQj+Jd5yyT2ZpNnjcHsZKW7NNZqOuyYk=; b=CNeTtSOzFk69q04iUamBBfvoBt
	64dD7da4WCjPt30yElve1TPLSC8eCV/WuogKZZY5eEsIJq5/37BBuluEKWDqL/mhTq0hFHBGTdR5V
	Cu58HPd1c8LiMG6XTaP0IwwRDlymb10riWO5XpVJMsh+bH2D82UWqDZn7sK+rrcYofGsIFuMBGqeK
	mL6ZdTzjLL+ytZ8TrWGp0VOEpa7pweN2R1XMO2+WCnlcXjCfNmR140B+/aqkx4h/Dm+z3ghOUSKYj
	KCSITNxEqA1g9n1oq1AehHD85r9GxuBtvAk5U7aFibU4RGcRtmS0awny2U7JjOCepZA6OGQOVj0k9
	2gHTSUTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88A-0000000GLsZ-3WcH;
	Wed, 28 Jan 2026 16:10:58 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl887-0000000GLqW-2PQA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:10:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-65808bb859cso57702a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616654; x=1770221454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1M488vXqKcrQj+Jd5yyT2ZpNnjcHsZKW7NNZqOuyYk=;
        b=LyLlJ1IE5WSklQjmGQ1VT0lltjc5sOsufhTRmic0enZpqZ+FGbqT+48/dYN/pCRKuT
         iHMnpXZElFbCmdfFmOD+qN3pfz2fR/VFcBAschkpFbv4InbEF5zy38iZLmZ7eYUYsfgT
         XiffQYNQFE7tcDC6+TRkhZ4pzbtXf1cf2s3uFci5oWf5Rj0AmJ/0Ces1Hw2v0X3Eg8Gv
         9EoYFGfbvXDbbD9He5xI+g92EiMXS8Z522pdy46FHFuXzVsqg5sE22/oTfw0oawZ/Bw1
         Npdw8AHjpe6QuGEaSO9FgxmF+kR9zHi/B9dgdLEuIhOIgYLr3e6+gwEsQo+FX+DIiCvn
         GRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616654; x=1770221454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c1M488vXqKcrQj+Jd5yyT2ZpNnjcHsZKW7NNZqOuyYk=;
        b=q+tmlcYX9Nr92xe65iglQoSfaO5u25alRfR9Dd3jEwvwzoMGQg4vEBpD1KIOHe+hbc
         viT/KDw66Xhi5fqzOkDRi8PO9C+sb/LjFnYrMTQzxl2VWJOfzbFWHuvXw6HBAsaQTkrE
         ZmxcnNO3E8Ke2RBpECjsHqzED/EE9ZBUR9IsjCQOsKeNeokKGmrktXcfxBjwYGl4PrjN
         1l3IOfcehZW+BMFeHOQakWlhKDtlBDPbv29fUGXbNcfpytzEDWpB+4g0rCYw4NtwHNhr
         FDH+pJFyH3jTva+JqNu3cfHMjsOZCwTwqCl/DQVMWA/SCBz6bUzSRa+JloCmPstlNn6J
         /sQg==
X-Forwarded-Encrypted: i=1; AJvYcCXF56dk2lk5rU3mKLY1FeloIrgQTSl3UBx+xmWvFJC0oGJL8Zk30TD8QWoTg8/f/coqlaLecqEAmF1k5gBKN2mb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9zLk5ysYvBHBIrAqCQ1gABp+fp7CAZe3FWD0meza75eHYg+QS
	pKCpCo4v9AR5NLDpYF2rv+jnehg5ZWh+5ts/bDnYZMCP+EU54K0Fl/AwE6SmSuHAmig=
X-Gm-Gg: AZuq6aLtjIUTVKZWEQqWmnGmOaZ5ZtUOSI+Z7SxzZi0Q5LxcEygq3MKmeBFXpdMZ6PA
	ex6rK2OyPr/+Dgie4XG7noGf9rIEqNY3e3KlTtM9FGw6N2ilgAaMO5UQdTzKXlAaOLFBzdObS59
	RiEPzfXLQEnaA1pkOLL3qYZRtl+6Jw7SNDcBJ+0GsNwkEIqp468KYjcd2XFl6PMU84ytYI8mwdS
	1/nrzoTYSgk/6SCxoDgl9TiyVTHb9NJGGroMZq6XjV+VFjfcpI6sE2TcR5nHns8GqsWGNc81zpl
	/6OcvjlvbMyQqBL6iyztJ3DLj+vlAk/g1iO/S87wh2L/jBWa4SuMJr7Tgnh1zuS2c0xVTY17Loc
	MJtb6Hdiq6UGUp7dSQRPtQY7aDeyEH6DTGIHNkOyBALouFq1E3SEEgNGiaGYVveTWDHcnl3XERC
	0QNrU02XLgmCR4fYyDdp4KbKg4vwTB01uNiI8mmwx/hhkfnW8BPj8t59RIUtNe0bQHVSSERWVoh
	u3xfA==
X-Received: by 2002:a17:907:7f8f:b0:b8a:fae9:5c60 with SMTP id a640c23a62f3a-b8dab3aa7a1mr404537966b.51.1769616653505;
        Wed, 28 Jan 2026 08:10:53 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:50 +0000
Subject: [PATCH v4 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-1-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
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
X-CRM114-CacheID: sfid-20260128_081055_625709_FC8EBD4B 
X-CRM114-Status: GOOD (  13.05  )
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
index a56f8f00aebb938aa765a8a6d66dfeb7f062dac8..98b2ef47c809ac0232e6941c9483b19d7c798bb4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10833,6 +10833,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.52.0.457.g6b5491de43-goog


