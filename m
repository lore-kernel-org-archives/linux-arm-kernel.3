Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0DDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDye+gKIi/Rk3nYVOD84e7fdc0ZI2E6vHlmVYEwZkRM=; b=3gjsDOFv+BTwrRDwt+KgkSm9fJ
	uqyVrU0PYl+y5reSCnla++LKAiLysZyFK/rMgI3baScUF27nDyeU4C/E+ypEPDmJNDOElPWgrYVAW
	A0T8swbpv1sBc6Mym9tCkWHpVT2sJAkLznWj4M/8mOgh91+ZUrVFVwwjH9c+b3N39v3j0qFv16oUH
	VBHi5667roGCyJbK1qbxBoF0GQcpMVaeWkM2ThRCtMIuUNKyrrhuFlB7JsNL8umhq5QpD9gaftTxe
	aYX6//J/84P4RZKB8tC6dKYkD/VJxuInkbOnxLApnT2lGPdDtFdgd9Ix876IZiet2I0BC4ivfKu7B
	ehu6QNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIRQ-0000000G1kz-0k1p;
	Wed, 27 Aug 2025 15:52:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFTm-0000000FSHy-254K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:42:19 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c79f0a5b8bso3399671f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298537; x=1756903337; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDye+gKIi/Rk3nYVOD84e7fdc0ZI2E6vHlmVYEwZkRM=;
        b=YLVP3Man09sssn2r++7UAWTWB0sCmbYGz7eIt8FexFRL1S4dWcnqE5vFhxgDnwzpMI
         gXIegeasFl3q9oufoKd80oFIeuUuZLthefcRC1s2p6s+DTTCSJQN1SXAVHDv2oLTigNR
         lHMTJlvFxEfFlQQv0pA3jV1Bbgp16jH6K4NmUewjDYkFkG90kRCYIPgp8mKdBWixJobe
         /UJijfaZm41X/CaAetIAadSDoPdKF/5hmw2VMg3NYnoBwMYgRN4/AhFmXRxkPlBfZfLZ
         wtULENA5Eq4D0C4wEJNp5+2XyhsTMU49+13HlM13ct+GIopmjrjJLJF9RMZEu9NGCQsh
         jOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298537; x=1756903337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDye+gKIi/Rk3nYVOD84e7fdc0ZI2E6vHlmVYEwZkRM=;
        b=jxiZhgqUszH6PYmEtBTeJ6hImefPZeOaBUo0pq2tlNxrHDawg73NkTPRqc5UYL2/+I
         vkp3H0U1AJqMGpbQH3jyUOl3AO07lPAHapphivrZTRtenHFQrJM/lRaLX28d5rNdhJfC
         Ge5mcy/6Np5cYa/rVJNAgni1Ls6naW4bHvalW8SFtYhnidbBufjI1uTXLMnq50DrE/Jk
         sPHsA6YNzJePwHaSKFK03ejBMdwRz47qDV+roDrhTG6REl/poaJodyJbn2Qj0PwZXyTz
         b1WmEUBn6TZ9CBP+2/wpOzAIrIWetu2yAwRcuY9Kbg/uooFHabX0q/kYhE8MINzXvDYu
         WUNA==
X-Forwarded-Encrypted: i=1; AJvYcCUjzC1e+W8KNQmpdK5yx99r1Ps8HGi0tfq/bphwyHGntK61/bB60YbvCksYOFMOL/bY90k/8gHrW8JJWxwhmszJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Ue/yDqj/NPuF+J7jwRhK6cB6izUrlc1gPW1BMMEfYVwh5Bc6
	2M5WNNalaqn2PHq8TzAouhVR2aoOdaZdSGJd0znp6vyR3FJU7kcKi7t+ramHVD8Ynck=
X-Gm-Gg: ASbGncs1I8FuNIiIj4QNCPjKE4bJ/hulMtT4HryEg3tjVsi1+aD92ZNTH8H0CtWdp4q
	lk/KysY0V2RSLcZz/4Qg7lslm6W14b8IwPF41KGUwjVRfXaJbFeKxeKo3gDIpcjYvzioLKx6IoV
	7VCwm68VtD7DUMBO+tEIbMHBBnUNejpHZoOqVcXZ1cEoWBmleQE6oB5zvS5TAWEaTDcaYYfRSUG
	BWZTYUIYVWEJsn44V69zHniMVxnM3A2mMnWJJ4BBIG0Qr4+N8RZT1AHJBXvvtJ8BOoGpFN1l9iF
	jcJPaH5pkTfsHcxoaFxhBsd/UDLE/0G8tf+WR6TeX2GRYwyeM6/2kEkXhL0ZGzmzUbXM+oKjT2Z
	2ZUUR1H8LifHsq3sTU96xx5uL17tztAaiFv/NaPn9W7zYLG3MjQSnsiRrQz6/TFApTOdAqRexuD
	3z1A==
X-Google-Smtp-Source: AGHT+IGJa/ivtNwr9Cn8nr8S19TCpPlSe2lNev3w6PEXYrBlk05kENqWzqwjRqOSSx/1cACZlesaXw==
X-Received: by 2002:a05:6000:1a88:b0:3c4:bc55:65d8 with SMTP id ffacd0b85a97d-3c5dd7b4175mr15803099f8f.62.1756298536777;
        Wed, 27 Aug 2025 05:42:16 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:16 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:11 +0000
Subject: [PATCH v2 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 #clock-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=2754;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ivbLWWSo2AaBA+S6bzVV0jpPuv1cVq4qNDd5/EibisY=;
 b=jl6fjNfftMkX+rPDiw2pF9HsB0qXrHHMzr8xpgTmZfEOJY03K4MIPCWkyzWB/j3LgkvZrBT68
 GDx/C3dBu+4A66KQUUz7VWUAOuuKPFIsClt1SzgoiSICpAyQE4+ChYq
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_054218_543884_57FA678A 
X-CRM114-Status: GOOD (  13.56  )
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
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml          | 11 +++++++++++
 include/dt-bindings/clock/google,gs101.h                  | 15 +++++++++++++++
 2 files changed, 26 insertions(+)

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
 
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 442f9e9037dc33198a1cee20af62fc70bbd96605..f1d0df412fdd49b300db4ba88bc0b1674cf0cdf8 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -634,4 +634,19 @@
 #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
 #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
 
+#define CLK_ACPM_DVFS_MIF				0
+#define CLK_ACPM_DVFS_INT				1
+#define CLK_ACPM_DVFS_CPUCL0				2
+#define CLK_ACPM_DVFS_CPUCL1				3
+#define CLK_ACPM_DVFS_CPUCL2				4
+#define CLK_ACPM_DVFS_G3D				5
+#define CLK_ACPM_DVFS_G3DL2				6
+#define CLK_ACPM_DVFS_TPU				7
+#define CLK_ACPM_DVFS_INTCAM				8
+#define CLK_ACPM_DVFS_TNR				9
+#define CLK_ACPM_DVFS_CAM				10
+#define CLK_ACPM_DVFS_MFC				11
+#define CLK_ACPM_DVFS_DISP				12
+#define CLK_ACPM_DVFS_BO				13
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */

-- 
2.51.0.261.g7ce5a0a67e-goog


