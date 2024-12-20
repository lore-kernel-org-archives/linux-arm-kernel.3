Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098B1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h557sfpCD6pzztMbKFx7XhfpV8rTpdinmEFFBb6Jmvw=; b=4YYebTMAALSeQGxrzMqorY+P8n
	vDOZOWsn4xJIaqkdp9++jKxTyGESzsKDkVBIA0W5EwPo2gzbJtkTAdJN329WTX3MhuHo5LzYv2dI9
	UIzLxXf8PzOGf2OBJowE0ELOm2fFSeE6d4Rhqg8OxT22dHgKhxumSb8VnEeLQlJOiFD+tQbuKMtt2
	ndl1orCx260keCVu55TiVdZ4O0p/ROrs2gFrYJW/im/F0Zr+qZf3M39zop1zzt0/6pu2lhldpog1D
	aIFaQayX/ctFdkeru1URSoSKPmhqO91de+sLDIs1N+f3C782MUdPLmo9AD4m8IfKO1I+4h0+l67Ct
	x3ZD57rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObEX-00000004mVV-2LRV;
	Fri, 20 Dec 2024 11:31:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObAn-00000004lg2-0lsT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:28:02 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso3124383a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 03:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734694079; x=1735298879; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h557sfpCD6pzztMbKFx7XhfpV8rTpdinmEFFBb6Jmvw=;
        b=IGWPr82yZfNbmfkI86nzMQtoghyPYXZm6WEiQLFTrcIiWlnTzcI+XGnO9lFOfQwso7
         UfNEAzXAqFQNj/q/ayF3X//4LOrjE6PLXaSUC9pHg37CZjwCzWWgAxv88/uCYbu3SM0U
         y2rdZy87/Uk+KjnE0JZ7rWZzypOYHyOgYfsY4ApOx5ceqIMYnV7+hwkPcSrmdRbPfntq
         0u8dRpm35n78dZNnScSQw86CX8A80/foTnJOjSPBDzla2lnFrdGj99oapKECuaBs9eD7
         koC5skKXXz9295vpOkWga27qCd3abTgfROY+r1R8QWdpGzGVsMyQdptJcvRc8aa/RgAz
         RrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694079; x=1735298879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h557sfpCD6pzztMbKFx7XhfpV8rTpdinmEFFBb6Jmvw=;
        b=Da0phDF2er/H8Vw0AcaiG6WWHeoNrtjFO18bQkxQuEjg40bdrzv5vb+pKDE4TB+BUm
         bJnCc4ERtJFDvMTEU+syCiYfUdLouikKWZ50RG7PEbVrVblCE7xPLBXu7gOCxB2YaAAJ
         55zKOJuD26aNTsFGnhctXUgS4RQJEPNOC/aLvUw4Hhg3C9KwAXoyZCQO2Njl7G4PPqG1
         VEfBW5CfjTdpF94odbi9ZcNuJMmuXfUuvAN/X3urEkEHOsTEPpg74dg0vHYGyrBHoF8C
         KENXB8clfqMIBWurbeMxOwUbJrh9yt7UlXCfnO7EiwkMJz0X3QQ4ny5YkO6XysWiiR6b
         Er+g==
X-Forwarded-Encrypted: i=1; AJvYcCWXQ+E6hggXk729OM7ngRFnaYBc7fcJShYt0zjsjAnjiGS6cs1Om9a+w4rKaJ0xEQcEjO5uZON5fuJTrnHXYp8F@lists.infradead.org
X-Gm-Message-State: AOJu0YzPcno6fdQqM+E72tvQSOKx32L9op/ImDQbKk7OeS+QiBxdLMjo
	LKy2Eav+ejtYbKoU2RP58yHhP0DWHA0nEaKxggFlHq7XpcSD/VVsHJ9pq98jAbE=
X-Gm-Gg: ASbGncvxgxE+Alkrlh7nnqi2zXTabdzmTsVimsx0KS1KD1fx1oO0pFcoujYlKHj/NaN
	IRYbIlKMC7SN79PvLQb1p6fNxXkdo9qPMuwPvx0IpwLGctJMUD0I1kn0mYhIwRzEZr3db/yScW2
	k/F6koyBS84eU7bdrpzdbPVkiT9yvsC4EarYU4cdglkWWcpXOxBVYbVQAWXgFUAngBN0tZFtNd3
	wrW4q1sVE9Eif3LrClZI0/n4B8p2e3p2Qp9B4PcrqYGPPlJOdkCJO7XOsKbjtgICv3disfWOlqF
	UQ3CDljb/R9sSkVmjtl5k/fA937Wh8L1SRw7i8Ok
X-Google-Smtp-Source: AGHT+IHjmMU/3zmiS3Zl2m5JwsXhRMD8ZylySaBxTKE5pjFRxO1xqf1fl9ZBq0GagyZwjvHpy9be8Q==
X-Received: by 2002:a05:6402:2794:b0:5d3:d8bb:3c5c with SMTP id 4fb4d7f45d1cf-5d81ddf3bd5mr2035503a12.12.1734694079483;
        Fri, 20 Dec 2024 03:27:59 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701abd1sm1632634a12.76.2024.12.20.03.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 03:27:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 20 Dec 2024 11:27:25 +0000
Subject: [PATCH v2 2/3] arm64: dts: exynos: gs101-pixel: add generic
 gs101-based Pixel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-gs101-simplefb-v2-2-c10a8f9e490b@linaro.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
In-Reply-To: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_032801_235436_B8A05B20 
X-CRM114-Status: GOOD (  19.56  )
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

In order to support Pixel 6 (Oriole), Pixel 6 Pro (Raven), and Pixel 6a
(Bluejay) correctly, we have to be able to distinguish them properly as
we add support for more features.

For example, Raven has a larger display. There are other differences,
like battery design capacity, etc.

To facilitate this, we create a generic gs101-based Pixel DT that can
work on any such gs101-based device. At the same time, we move the
Oriole specific parts that we have at the moment (display) into an
overlay, making it easy to add support for Raven and Bluejay in a
similar way.

Note1:
Despite being an overlay, we instruct kbuild to create a merged
gs101-oriole.dtb and a gs101-oriole.dtbo. This way existing scripts can
keep working, but it also gives the option to just apply the overlay
before boot (e.g. by the bootloader).

Note2:
I've changed the simple-framebuffer node to specify the memory via
memory-region instead of reg, as that avoids unnecessary duplication
(of the size), and it avoids having to specify #address-cells
and #size-cells in the chosen node (and duplicating this in the DTSO),
which is otherwise necessary to keep dt_binding_check happy and DT
validation working in general.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Note: MAINTAINERS doesn't need updating, it covers this whole directory
---
 arch/arm64/boot/dts/exynos/google/Makefile         |  6 ++--
 .../arm64/boot/dts/exynos/google/gs101-oriole.dtso | 33 ++++++++++++++++++++++
 .../{gs101-oriole.dts => gs101-pixel-generic.dts}  | 24 +++++++---------
 3 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
index 0a6d5e1fe4ee..6e6b5319212a 100644
--- a/arch/arm64/boot/dts/exynos/google/Makefile
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-dtb-$(CONFIG_ARCH_EXYNOS) += \
-	gs101-oriole.dtb \
+dtb-$(CONFIG_ARCH_EXYNOS) += gs101-pixel-generic.dtb
+
+gs101-oriole-dtbs := gs101-pixel-generic.dtb gs101-oriole.dtbo
+dtb-$(CONFIG_ARCH_EXYNOS) += gs101-oriole.dtb
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dtso b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dtso
new file mode 100644
index 000000000000..43572039cd07
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Oriole Device Tree
+ *
+ * Copyright 2021-2023 Google LLC
+ * Copyright 2023-2024 Linaro Ltd
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Oriole";
+	compatible = "google,gs101-oriole", "google,gs101-pixel", "google,gs101";
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		splash@fac00000 {
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			status = "okay";
+		};
+	};
+};
+
+&framebuffer0 {
+	width = <1080>;
+	height = <2400>;
+	stride = <(1080 * 4)>;
+	format = "a8r8g8b8";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-pixel-generic.dts
similarity index 93%
rename from arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
rename to arch/arm64/boot/dts/exynos/google/gs101-pixel-generic.dts
index 4e1625e3fbb4..48dc37afcb86 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-generic.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Oriole Device Tree
+ * generic gs101-based Pixel Device Tree
  *
  * Copyright 2021-2023 Google LLC
  * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
@@ -15,30 +15,24 @@
 #include "gs101.dtsi"
 
 / {
-	model = "Oriole";
-	compatible = "google,gs101-oriole", "google,gs101";
+	model = "GS101-based Pixel or derivative";
+	compatible = "google,gs101-pixel", "google,gs101";
 
 	aliases {
 		serial0 = &serial_0;
 	};
 
 	chosen {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges;
-
 		/* Bootloader expects bootargs specified otherwise it crashes */
 		bootargs = "";
 		stdout-path = &serial_0;
 
 		/* Use display framebuffer as setup by bootloader */
-		framebuffer0: framebuffer@fac00000 {
+		framebuffer0: framebuffer-0 {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
-			width = <1080>;
-			height = <2400>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
+			memory-region = <&cont_splash_mem>;
+			/* format properties to be added by board overlay */
+			status = "disabled";
 		};
 	};
 
@@ -86,8 +80,10 @@ ufs_0_fixed_vcc_reg: regulator-1 {
 
 	reserved-memory {
 		cont_splash_mem: splash@fac00000 {
-			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			/* size to be updated by board overlay */
+			reg = <0x0 0xfac00000 0x0>;
 			no-map;
+			status = "disabled";
 		};
 	};
 };

-- 
2.47.1.613.gc27f4b7a9f-goog


