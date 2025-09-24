Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444C2CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09aADhRx97hgFBUXBrs2wpmXKNGHwu9T21ONWFuPPkc=; b=xP843O1DBxRXfz1bm2pXFmRo7D
	zzPmZbY0c1IkcIiU/JlzxdMzBiTOOvlMlB+ulhwQhqX0/t1r9pgLRJjY76FkW+5KyqiW7ppEHZfUV
	F3nurxdHPWT9SQqVY8HoOkLb069WxjudSvAelAjLSx4NA4qm/ROTHKmNv0BXYBW32DdVWkI+mPeM7
	m/P3I1xhJgD7mZFFNAXM6tOE2JsUY5eHy5Sm0GuOEG4ru0aT914h/mOlVLdCf4dOBepKeKLN8oxy1
	Oj910wctXqP18cM58PB14NjGoJt/LpFVfz1IgH45MM2a+dFOe6KsCxHv4ugAZF7x8JzcLG1Nrzfaa
	mfS+9J/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R9M-000000015Y3-0pTP;
	Wed, 24 Sep 2025 15:11:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R9E-000000015Q6-1kr1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:11:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so66307695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726670; x=1759331470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09aADhRx97hgFBUXBrs2wpmXKNGHwu9T21ONWFuPPkc=;
        b=FUwxY9Tc03ml1yEECyp1noxC9bUNgkO8tt9m6MK3nLFa/p0eA5ds9PMdZPejtXgtJJ
         wo7ODAkollVNWFyDOxTHzRM3MDCbl093klDIHMMXIzEsklhWNtFTgyZcTDT56LzWHU/v
         YZtNsp2HDI4KY30zrwUTEd2CvepgYGGLja5Dmh7q8zmpqktUDYzZ1NwYlI86BoJmj5SV
         rT7ZDHwtyqS7YL7BgU6ScHiaQrne6PPHsGJtDVHDUPVNnBgG8f8vNDB6wq72CAYB/OHV
         e/CUF6EuP0IaMs1xCdMaSvwgAcwg8MyYI4Lxn4IWisVFs0+1lQza2/8t71UXOsTMZN9T
         /Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726670; x=1759331470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09aADhRx97hgFBUXBrs2wpmXKNGHwu9T21ONWFuPPkc=;
        b=mQKLBKGyoojph9ljrZwnmTMYS6i9Rq/IPhjaB+hG5w9lUyRBXnYuN8Msx3Ii8GUINl
         EjAHs3E2EFujEZR90FZKq5vdmhXp8cCbhw7Hwrw3sUzhFPtXqz+MVgMJry1WSZWumRLS
         Zq7V2LwAdIcWJsvE7XgUhROtLw25bjmlpnyRVyXvjIPoYDKcFC+o+Kz31e9JpSZHvJVW
         RtkcAmMmCZvrOOOwYP/k8Ycxtg2acK7I/T1PeeKmCJPf5vNuGZmkWq0dxLuLS+P35uxb
         +3hqFXiEwP7CmApUWkOHTX4AHl/E3LpoXEibI3Fgb89IinN/7eRkNIv8MGmNm8EkBS7w
         VcZw==
X-Forwarded-Encrypted: i=1; AJvYcCUHcgAiNIzZBaL0y22VnfOwpDykkQfeUH8OtczYnTXxUqCf6tjk+JYsHljWpcAcAMYLenphXWmpJAqgZ3xYD22W@lists.infradead.org
X-Gm-Message-State: AOJu0YxfSB0gpoX2ExJNTlMOzDsYvJLANZg0AEPa0+ljg1iGIqsjYv55
	PcO+kz5xUyBtM/yky0MA+vgnqJoVTgBm8Bze4XmArfwz4YWwMzjKn7292/fULB5FOS4=
X-Gm-Gg: ASbGncuFIXci/f7auEKRxByM/VziG5m4HtteQX1O/uhf5TloQ2zx1DeoONUtxdDe3hI
	7gSUi/9Szq1Ij4XRLHdIfQGPfMJlV5Gmc0x+tZxwjpF7gtIsuw2VdQsJbPqoW8ecNlmjeendOlu
	esWV7Yt6cBjr0lKfmNSLET0mE4flH50v4ZgVAiHxYh+9ry0MEt99OwqzbRy8WEQ/iV6Ii6j6GhS
	GkpZTCvIq5AGpxSh7fJbh88HrgWUVqzTXbLPDbLsy3W5X6RtwgJcNjyiXZwfk4OMKOeDG2Sw0HP
	dkeeMoBOd6rzdsuy/1TbKzAfhPZmUWVBuGHZ/SSZSYm9DEmRzgVkC21H47Z440ZT1y22J1KoFMl
	JTkCL2SXoG4Tw3NY1G9zoZyLm6oGE+6ffzsZtx3tDKK+DU8Dk5nHnec5sW68Vu0IaLCy4l5zAiv
	A=
X-Google-Smtp-Source: AGHT+IEs8QQ7m3gKJ792ZHmSzLEcZBZ4i1CTXbR5D1PZeV8nN8Q4fLpYid2Xg1E6ZQRkaWTb8EXBNg==
X-Received: by 2002:a05:600c:4686:b0:45f:29e4:92ff with SMTP id 5b1f17b1804b1-46e329e4e87mr2559865e9.17.1758726670313;
        Wed, 24 Sep 2025 08:11:10 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm36045145e9.0.2025.09.24.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:11:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 24 Sep 2025 15:11:00 +0000
Subject: [PATCH v5 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 ACPM clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-acpm-clk-v5-1-4cca1fadd00d@linaro.org>
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
In-Reply-To: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726668; l=3182;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=NkT+Yg9cYGQ08mwihOyEX0wXQkJh1dzuD63z7Z//UsU=;
 b=XV1rlGn+zByellycKzW8IPoG9nI0fOQeoVrNmoZlVgT6Gi5o6TgZ4a67vO6MX5vbPdR65Dv3R
 aPujGM0WjaOA27mL0pW6hLtNDiuiCIpedYIQ6aCyTj6JTkwfMz+UUXQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_081112_488953_FD6E94D5 
X-CRM114-Status: GOOD (  16.22  )
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

The firmware exposes clocks that can be controlled via the
Alive Clock and Power Manager (ACPM) interface.

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference its
clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 11 +++++++++
 include/dt-bindings/clock/google,gs101-acpm.h      | 26 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..d3bca6088d128485618bb2b538ed8596b4ba14f0 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -24,6 +24,15 @@ properties:
   compatible:
     const: google,gs101-acpm-ipc
 
+  "#clock-cells":
+    const: 1
+    description:
+      Clocks that are variable and index based. These clocks don't provide
+      an entire range of values between the limits but only discrete points
+      within the range. The firmware also manages the voltage scaling
+      appropriately with the clock scaling. The argument is the ID of the
+      clock contained by the firmware messages.
+
   mboxes:
     maxItems: 1
 
@@ -45,6 +54,7 @@ properties:
 
 required:
   - compatible
+  - "#clock-cells"
   - mboxes
   - shmem
 
@@ -56,6 +66,7 @@ examples:
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
+        #clock-cells = <1>;
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
diff --git a/include/dt-bindings/clock/google,gs101-acpm.h b/include/dt-bindings/clock/google,gs101-acpm.h
new file mode 100644
index 0000000000000000000000000000000000000000..e2ba89e09fa6209f7c81f554dd511b2619009e5b
--- /dev/null
+++ b/include/dt-bindings/clock/google,gs101-acpm.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Device Tree binding constants for Google gs101 ACPM clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H
+#define _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H
+
+#define GS101_CLK_ACPM_DVFS_MIF				0
+#define GS101_CLK_ACPM_DVFS_INT				1
+#define GS101_CLK_ACPM_DVFS_CPUCL0			2
+#define GS101_CLK_ACPM_DVFS_CPUCL1			3
+#define GS101_CLK_ACPM_DVFS_CPUCL2			4
+#define GS101_CLK_ACPM_DVFS_G3D				5
+#define GS101_CLK_ACPM_DVFS_G3DL2			6
+#define GS101_CLK_ACPM_DVFS_TPU				7
+#define GS101_CLK_ACPM_DVFS_INTCAM			8
+#define GS101_CLK_ACPM_DVFS_TNR				9
+#define GS101_CLK_ACPM_DVFS_CAM				10
+#define GS101_CLK_ACPM_DVFS_MFC				11
+#define GS101_CLK_ACPM_DVFS_DISP			12
+#define GS101_CLK_ACPM_DVFS_BO				13
+
+#endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H */

-- 
2.51.0.536.g15c5d4f767-goog


