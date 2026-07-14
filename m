Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E2CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=; b=0F+m6VRaPGt+ZsisBX4/CD4GMl
	HRw6Hh/p74wibf9q1T96d2ev/wCBQ7OvBm8MRI1UjMBRuxPF4WnppIa/4Kzvs+i1WojGtgzwIKRnX
	gJI3PM3a/FNtb5xMoC5ay/D+LmJr7xIkzosPKw60C+JyCvVwoYOz+9tf1GV5iJasZfmPhOSDUbFaZ
	00uE2fMn2j10ZfzsYB79Dunmct+0lCCFlmQ2FQvitJly3HOe71qers+M/qdseiwPSJ408PSSwYbhG
	10BbtL9yxN5HJYZWmnjrCbPqpuo1Fwr6COzS7yd/GPYv2LcApoNS3CAwo6l6RpEODQ4r+Jgn13yaC
	Bg4J8/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdM-0000000B2Mg-3HBS;
	Tue, 14 Jul 2026 06:28:48 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdI-0000000B2JI-1KL9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:28:45 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-383adaa461fso463423a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010523; x=1784615323; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=;
        b=pJ/OFvD7PPS0noOuXHSyCRAwXn5o2j2sYgtUMphuSBmxuqRiTIu2MtTEZbr7T0L5qn
         m6yKaczximRnciS+lnQQEwZIsEWILOGw+kizJ7P+BozI4N15UyYiNCOEcs1hAvSuY3Vr
         /drT4U089Ph9zta8hM5mwQuGbVtw+CE4uXozHRRqVNwEgiqkEiKB/u1IiQu+AWJx/i6G
         Wr2Uxn+qQZutyBPkFwUfEtTyQBpvLlZ78v3VVAdN35pJk8CAr3FFTUhXC0q9PYywnPTY
         XpWxq0fmkfrw/QG2qElu8p7P36LRDcz+mFJwxy+zf0EtAibAz83dKRtAyKenzCoWyHEi
         FMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010523; x=1784615323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=;
        b=SMv+MCZ3MP7p9XZoGai258FChNPEKRfnoqeHeKIALk3HX51mh5nmPbmGunonD7Vydb
         2sH+lcxmEIcC7fAay5A27dwPdDJYZFRLOpOrXctAXd7qoGfbpmIcicC31ZpOndH+tU0n
         n9TDYqf0HHo8U8SlpiZsyoIeFSTQViuVltXsWnioIe9xF5ugQ/UlTDwHooe4poXL94BB
         FuPeKQ1JS82HLDQb7qZqlBWIvskKgdS5eRprmVdugAUB0MnZZd7UQsQg47dkjhluZlPt
         irdWKM3c0OFQPZTjdxiLkZ6hQeBREaLP6s4QwAeeAkB3f+rN+U3/fJZPMNc5kpMxhLcQ
         8Veg==
X-Forwarded-Encrypted: i=1; AHgh+RqZtlCM2kOBewS78yBMepKSJAwcB07uoIl/0YJfPLROK9Jdd0WKlMI7/wZH5KhQ267/vH4i14uRg5dgGqU0xzMG@lists.infradead.org
X-Gm-Message-State: AOJu0YzalfxnxoN6DLRH85fhLTqm6cTR9YS/HvZCYdxGjwkBzfeNrHHj
	CCMhFHtFo95TgqTUHQuVXwRWFYfl/xyzqf6ysDM7mByqLYJBbJgGrzXp
X-Gm-Gg: AfdE7ckPG5vCSbT0vkit3wXG+fz4tJxnvGJ37b5Xi3pVOE99s82Xe77bEIqa4WCq0MX
	Xgm+YBs6mrp+A0hJLl1Gw6Fut/hpAOTmF08NbzDZdr9Zq3/ID7ak0T9411N9w4aI0mgcxDUQSGh
	nuwyksrjypz7Z66ScW8T75/qcsP5TsEgYZ1nnNqp9y6NNxS0mBFjEqoZFVmy0pz6XPHlp+KUjFh
	xjING/1g+IgOXrHe50s1E6ufbilSXHf6RyzFvLZML/sDpjVlh0iaP6L7knNkf3mZIBkzPgSEpU+
	pn/JDRDQz2OEnOK4wNLSuKSTLQ+XPzTNLDH2gsqZwyGYU+i0AK1pzim83yz88iovq/y+crTtsRZ
	Cz3qOBaPRNXRRp9KJ7s+vWGLh8qJ9Iz+xcC1A32VhRO4byyzl9Q+yeacVW1I5B5njYFOButcpNN
	tHurV2a6WcZ2vXfe35bB2CxHbS2RYVaZlcC4qd/UGWDhkCa1THB/2D2aJzsYUfXZTpNljw7EcXH
	tt/xiyrm1ejF+g+TazPWRyUGrfRr8LaL+aRNkgTqJWBjo4RSMCr3KrJEwMK40j6
X-Received: by 2002:a17:90b:3e44:b0:38e:21da:9257 with SMTP id 98e67ed59e1d1-38e21da9302mr1670a91.37.1784010523324;
        Mon, 13 Jul 2026 23:28:43 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:43 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:12 +1000
Subject: [PATCH v2 05/12] arm64: dts: apple: Add common SMC hwmon
 infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-5-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5127;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=S7RyjJPJgk8bM8bSvDin/ELs3Q0NaOfmTEAFhGjIglA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xka6jk+65YWZOUf4s7+HZpuvFN036yOdsHm5IUWS
 W9D553tmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPWxJoZ/minvdaRu3zLs22cnV8L7I4LpiP6550ad2eafcw+pxixMZvgrFRk65dW
 D7+YBO3OeK8g/snqz4ciGi/I5F4MP/pzaoPSXEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232844_366233_3BACBBEB 
X-CRM114-Status: GOOD (  14.32  )
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

Apple's System Management Controller exposes the readings
from numerous sensors scattered around the SoC and elsewhere
in the machine. Some of these sensors are reliably common
on all devices, whereas others are exposed at SMC keys
specific to either the SoC or even the particular device.

To account for this and expose the right sensors for the
right device without tedious Devicetree duplication, we
can include fragments of increasing specificity in the
per-device .dts files such that the individual keys
(of which there are potentially hundreds) do not need to
be copied in for every device.

Add the initial set of SMC hwmon sensors that are common
to multiple devices so that they can be included in
the per-device Devicetrees.

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/hwmon-common.dtsi   | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi      | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi   | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi     | 16 ++++++++++++++++
 5 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 000000000000..a35c7b14fec8
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors expected on all systems
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PSTR {
+		apple,key-id = "PSTR";
+		label = "Total System Power";
+	};
+
+	power-PDTR {
+		apple,key-id = "PDTR";
+		label = "AC Input Power";
+	};
+
+	power-PMVR {
+		apple,key-id = "PMVR";
+		label = "3.8 V Rail Power";
+	};
+
+	temperature-TH0x {
+		apple,key-id = "TH0x";
+		label = "NAND Flash Temperature";
+	};
+
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "AC Input Voltage";
+	};
+
+	current-ID0R {
+		apple,key-id = "ID0R";
+		label = "AC Input Current";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 000000000000..e87997d21e22
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright The Asahi Linux Contributors
+ *
+ * Fan hwmon sensors for machines with 2 fan.
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	fan-F0Ac {
+		label = "Fan 1";
+	};
+
+	fan-F1Ac {
+		apple,key-id = "F1Ac";
+		label = "Fan 2";
+		apple,fan-minimum = "F1Mn";
+		apple,fan-maximum = "F1Mx";
+		apple,fan-target = "F1Tg";
+		apple,fan-mode = "F1Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 000000000000..180eb8d7441f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright The Asahi Linux Contributors
+ *
+ * Fan hwmon sensors for machines with a single fan.
+ */
+
+&smc_hwmon {
+	fan-F0Ac {
+		apple,key-id = "F0Ac";
+		label = "Fan";
+		apple,fan-minimum = "F0Mn";
+		apple,fan-maximum = "F0Mx";
+		apple,fan-target = "F0Tg";
+		apple,fan-mode = "F0Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 000000000000..cadffd000c76
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors expected on all laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PHPC {
+		apple,key-id = "PHPC";
+		label = "Heatpipe Power";
+	};
+
+	temperature-TB0T {
+		apple,key-id = "TB0T";
+		label = "Battery Hotspot";
+	};
+
+	temperature-TCHP {
+		apple,key-id = "TCHP";
+		label = "Charge Regulator Temp";
+	};
+
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temp";
+	};
+
+	voltage-SBAV {
+		apple,key-id = "SBAV";
+		label = "Battery Voltage";
+	};
+
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "Charger Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
new file mode 100644
index 000000000000..7fd86e911acf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors common to the Mac mini desktop
+ * models, but not the Studio or Pro.
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temp";
+	};
+};

-- 
2.55.0


