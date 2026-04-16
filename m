Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E50F8D778
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 20:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKL1UApwli0vBwJCTHGaBiJ+JuL3QPXRKM4vGc8erbQ=; b=EAh7XPq18KUjUcNZZfF9WyDz8i
	iw/u+E0bbTmvxA5knJg6n+bk12ce0grCDF0Fa+BjDgw/WZRjqDUfjvoK41UrwhwXHBK6Xo4qU5ZOx
	8cbQF6KBflqbPs9b/uDi2cI98Dg2KQzYzFCrgM7+0Ne+ESR+wHckcIXD+vwjoiYOt5LhfanR7P5bb
	QyZ8RmGKKPv9524vDxHCWIqD3Zke0jZg9AGM8sA61r99r0sobFIuxtEsxGxgp0xZS1cRVGp8NMSlx
	1GKSLJubrW0thXWIzKfCwAcotxIshXUh6CsOCuvuzQOgp8UOSwZViBZlLt876rJHzYCrp7EZQHrjo
	LlijpoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBj-00000002y0Y-1wr1;
	Thu, 16 Apr 2026 20:19:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBh-00000002xyx-16RY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 20:19:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so60071835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 13:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370783; x=1776975583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKL1UApwli0vBwJCTHGaBiJ+JuL3QPXRKM4vGc8erbQ=;
        b=KdHUs1dYMxiF0j0XlKriNGbF6bDvQbBGBDM8FEwoMrmvJ3BxKROu9jw/rOXR2aE1ga
         9Uf8fbT41nCBBJKVFUbU1F5GMnMvkH7UjLusS6/M/0oCMvw2z8mlaLmXqjfVsuOdfrgL
         FKFunKSYypJ6miHonezi+izsN8YPbqJ211h3ZEwHGOuLDDe1XYWRwYcxqNZcbl+ZXsa1
         VGLnthWJnpJKE2sruSAgyGYpZoB/jrrwqktgArjINjaBLhmlYTxNwF732MSG7NJo26w/
         7+WFWTce/fuhDVB367/2W9aEV4QC6vJ61dTiVx13mEjLAQnBZ4LDh8Q7UrbMfbF0PpeE
         Fodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370783; x=1776975583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKL1UApwli0vBwJCTHGaBiJ+JuL3QPXRKM4vGc8erbQ=;
        b=cxOp8o8ejD6XOvPMwe5LGvX6K1U+2jEYFpgVyRvgEVP85Y1U8C2Chpnf73Tj5xdIS8
         ZU0AKgQmb7QEEnnH1FIozKmpEP5uGcc5bc6uTkSp5BlQcr7q6OGfLhNtPnpue1qjpV/Y
         rvjxEgbAa4RZgwa2hBA7Nzp6D/GFPdNB0w4nDsHYM2RmZeEPePRp9XwJMVMp+EofDdvS
         Bz24X5C2rRAsy/s4rVJNbArjwtDumV2ff4TsmkTIRM1b8mCX/1YVOStaWK33XRhPshF2
         /iWrRfHi5Hrqbgba+i2ZPBCsMAJrfV44fziZn3Kl0WWBks/tR/60KtLlynH92b3qmRiq
         bg9g==
X-Forwarded-Encrypted: i=1; AFNElJ/90sHNCbq3pMw+TE3VHcleqi+192ut6HObYyggOF8uqqOiLWJBEe5Ac0mmui88854sIuNWfyC8oxq6XoGGLsqo@lists.infradead.org
X-Gm-Message-State: AOJu0YzPqBLzPtwrWR/DUTM7cICwtYDqLEWzdSuxOTyQ7ZJNW32/0H9Z
	ClV3JUQSYQkDnTITkc5hXg5X2BYgBxyvRgK/satAzNhvfN/ruhwqLXK7
X-Gm-Gg: AeBDiet6Is2ylDX+mu45pBOAsSmSH/j+zaM/B0nwpcGn1U1JmiOyOOKd2QDkQf8xPvn
	kMdeJdWXyj3Afp5JgnqGEytyGPnrbTA7VnhsOy/tiV6BbeSZm763Q2xGKKBpexUbXOQG7A2Ln6a
	4EX/ARlg/qPb2NoBBJh/+MlEF1KhAnkTCyHhFcB49Y5ho0j/GdUqsEGTzu7z2G6O1v3ZFRwRFTK
	7Ovudo4wiBrUA7f1DRSMvZon9rm2gbFaKG+3lQsXPFO4MlrATw85U8zUANnfsJnc0fDYKagwdZe
	klzP+jkPd4H+lYQKQ4qaliYBoIykCobOySyCW95KEJlV31w2r0IFDlQdEUPxbu8DXLHrb4v6P8L
	0PQcbYhiO9vRKIbl+5TFLMI1NHa6Po07Pq7P1RjEbO4utoRQTSQZkIJ3GFP2UkmxxC5YGyrrM28
	/nnbGP/80Jsndlo13gKq2AZGq3fm/4nPQrMeq39FX+LpLYEA==
X-Received: by 2002:a05:600c:c0c8:b0:488:ab1d:dcc5 with SMTP id 5b1f17b1804b1-488fb787ba3mr732015e9.27.1776370783286;
        Thu, 16 Apr 2026 13:19:43 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:42 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:11 +0300
Subject: [PATCH v4 3/8] ARM: dts: Add D-Link DWR-932M support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-3-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3027;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=DfFTCD7dR9UzG1/YZiQHT6WP9Ms5CofApjF0auiCUpM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URKMjgP0rIgBZerMAS04qD7fxmmvb4Dtqzzl
 qq0lJcpsFeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFEShsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKSgRAAhITFO+PosbwvE3BtTizQCM5HaxtoiNN
 PcknQEsqTA0dbu2+zLAYugjmebCwIo0Gd6QwM4l1TWj0iW9ti9QM9G+SQQBXFxrohZyh+U9ouIm
 gVclMgJnT86r4gWMVEf/f/VCzxERJsNXencypr3FPpTorY2YrTYv98MPNEHMAlEdmeCiLImCzqG
 LP+2Yf4fi8t3ki97W6CjCRgTbUL7vFRFhBn5IHugKznpqcXqnFsc0qqn+NIyaEzS7DGYgCjFz1a
 D9BujFr3Ghcugdx9NxwyQBFxKk3EtnYdakq8lYFVTRKRj/ux7Ga4R1WgybucAHe3a2lz3n9ZVUd
 kH7JDkBMMTCHQV0KNSQsg71IFEB2ERUsQhzrHMtqDTFc1D6bWOYYCO4+TtNBi0y7ysD1da4bR1S
 kPd+om15RV4vPr6mUec3rPMmOPE2fvcp58LRYTqgErhXquMJAWt0+vq9N2EIATPyH/4a+oAZsxJ
 XWi7/qA1mdWYbZ59qWN90uayMpSsOkB1xEPoCBo5N7zYwR0K7aHwqW6QyfTRuvrKumb/CRN3I5i
 xf1YgbgpQrElLCF8kX8qy+Np61GmIS2MelINW+r34WUPytspWVh//Z7/Y/zPEzNGLuFRLxuVD37
 5P2OFcYy1ygGF8H2pGUny4dT3RJT9+e+JDpnItIQnI3U28+fPFSg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_131945_500623_EC08D003 
X-CRM114-Status: GOOD (  15.14  )
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

This adds DT bindings for zx297520v3 and one board that consumes it.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 MAINTAINERS                              |  1 +
 arch/arm/boot/dts/Makefile               |  1 +
 arch/arm/boot/dts/zte/Makefile           |  3 +++
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts | 21 ++++++++++++++++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi    | 37 ++++++++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcade90ca14e..f7ca0d478e81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29203,6 +29203,7 @@ F:	tools/testing/selftests/cgroup/test_zswap.c
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	arch/arm/boot/dts/zte
 F:	arch/arm/mach-zte/
 
 SENARYTECH AUDIO CODEC DRIVER
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe38eb25301..28fba538d552 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -39,3 +39,4 @@ subdir-y += unisoc
 subdir-y += vt8500
 subdir-y += xen
 subdir-y += xilinx
+subdir-y += zte
diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
new file mode 100644
index 000000000000..416c24a489cd
--- /dev/null
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_ZX297520V3) += \
+	dlink-dwr-932m.dtb
diff --git a/arch/arm/boot/dts/zte/dlink-dwr-932m.dts b/arch/arm/boot/dts/zte/dlink-dwr-932m.dts
new file mode 100644
index 000000000000..7b2a26aaaecb
--- /dev/null
+++ b/arch/arm/boot/dts/zte/dlink-dwr-932m.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * D-Link DWR-932M Board
+ *
+ * (C) Copyright 2026 Stefan Dösinger
+ *
+ */
+
+/dts-v1/;
+
+#include "zx297520v3.dtsi"
+
+/ {
+	model = "D-Link DWR-932M";
+	compatible = "dlink,dwr932m", "zte,zx297520v3";
+
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x04000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
new file mode 100644
index 000000000000..d6c71d52b26c
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		gic: interrupt-controller@f2000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0xf2000000 0x10000>,
+			      <0xf2040000 0x20000>;
+		};
+	};
+};

-- 
2.52.0


