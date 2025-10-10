Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF0ECCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDFgROGNpwR6/oUQPsSAUdlelbgLvQg5uFC4b3ecjXY=; b=OWImMVyXQU1O7Ht9Y2Nd2R/WAk
	/kzgow4CsL39Bf945hERh/cZr0OYmsWP+5ZHFxz3JlqbfRcXqRsrNU22HJTTC6aYHzzgAZnqBGZQy
	E8Zg6tyIRAEPVbqOQI/L2QGsFBvMgc1AgDOdRX1NYjlsEvQkE+UlXX1xWOr4RuMyhgEJVqIpDlHo7
	4sAvZN6m3CS6cWTv5J6UABonSgk7jnimy6oqf4rzKJ5dpyWsgqxpeC6GJscpxnrn9sYL160L1zSpn
	DJAWfSX8Te8fptCBiYZYrYGAdnxf5dTb/YMMSmlxpld6lfk49YYlPPQtnFCjRU8sxsMEgPLtFq6FL
	zYvcp55w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CWH-00000008Tu7-0Wnz;
	Fri, 10 Oct 2025 12:46:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CWF-00000008Trh-0NPD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:46:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46b303f755aso16091155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 05:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100405; x=1760705205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDFgROGNpwR6/oUQPsSAUdlelbgLvQg5uFC4b3ecjXY=;
        b=aaccgk9Y8pVWumzlhqgL3vkYTqoopfF7OS/cgcEpHUdcoxIk0jmBVtMc8sZSMHyS8D
         R2X4yDmX8IG8xJzK3JCNe6eejcvb0qxlOeG5OCnX1F5yI8TMx+8UXOAOK6lwDEGqDlFG
         +NYk95hbPM82Rau+WgSGnXuAaCJlpS2NlwbrHy1HAqHsZ0xzoNfFLT0+KhN1raZrrVX5
         iaxByPCFOiM0HBeLc3z+/5gca9YeM9HcaD+CEMMxCGa5FX4od9oLWOLHnLlkvXZ/0ccU
         ZGMnKQqyjon2M7UI6fJDUtb1nKEBDru5hMvKAuQ4qGmSHPtZBSujepGks+Qioo61UvIj
         bvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100405; x=1760705205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDFgROGNpwR6/oUQPsSAUdlelbgLvQg5uFC4b3ecjXY=;
        b=jDZ6MK1aLj3H5vI5ZO+H2mk4Wc80q7b0dtVSVCyel//CyRppN9xcoYPH4OggM69DQG
         GRqWtxyYKMDzwZixSByqi60M0iUXaSrWUmNh3kg9x8CIQKjFg6fugZSnMEIrFc7UKgtr
         g0JeNfxwv1RC7fO9bKN2KpkEgz2YtrvTiRx8JsKYLHju5zswFmUFc0awM0xnO0yGN8Yl
         TYBQo/Yb4BWJhxOqQOXWto6fjc5G8U+wqCEzc/TyTcJNlSOPA5WsPJkS9b8PBpyZNWNA
         Hcf1L+r6AVFbKIQKhM+dLH7l2R/vx7g+Zi1AWjWrXKoyj0hCfq+oPanxIC5EnkpwApgI
         4GOg==
X-Forwarded-Encrypted: i=1; AJvYcCUwLe7BzBliCiV/IpQnDGhnuQ0gzUPq+aLeOwPVLXI1XbJ0MHu4nGbeeFFVeyFdniH1vfNyjl/+q7m8mhkxJzNd@lists.infradead.org
X-Gm-Message-State: AOJu0YxZLPUOc1/tsgLWNmGqBGTgcuQicCrpf56itwzR2BuOcj9fQrsB
	mbG0qlj8jrV+rC/0xfzclhpia8VpM2Je73ZeOquDkanMz44vZ+EX3apZk7ZVB+8bmuE=
X-Gm-Gg: ASbGncuJ7TIfVX+ULElNn6q2ePabHw0oZZCNoblXDyTGQl6I9g6E8c1t3wexMF0CXo6
	3PJgwEMUnqACVP5as0oB3iY64YEcl7jqjyTZNB2LcUFRulTpUWoFg4ndIEInOm1792xC+L8dzaP
	mGbeBn39/y9HU578fLI2XOX8lUwslEkj2qWwp2HO8q6ZNKhsoIRPlEu1c52CX38ywZuovTyimoM
	Z7Jtszb2lr5if7vvGG8RHMNbcwIuSfbWyHFVaJEvB0jgKYPnSNAUYTWPbo1eG9v8+eXg2TzyjIn
	aUeS9dm5DB/UcHbQaAgrCnY1RkAO99rP/n5u75h5Su7ldjRmaNgIL8LVyvnmeb6dheLqfSWCFK1
	au8+lOXYA1sVRlZKG+dkNgm4UjZvdxXCldEM730A1sKB/VGENWdQX4Dmt1kpvg+X9uwDGCFXDD0
	6dZyBCXkccL1dZKcpNvl+juw==
X-Google-Smtp-Source: AGHT+IE/dO3nGSvFVXAU6hqMkPw06wJHrP/9TuT1/Nqdw0LoISZ4HCImCFLqMx5Nn+/i3yWnu1kRZQ==
X-Received: by 2002:a05:600c:1c23:b0:45b:6b57:5308 with SMTP id 5b1f17b1804b1-46fa9a892a0mr78680205e9.7.1760100405274;
        Fri, 10 Oct 2025 05:46:45 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:43 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:31 +0000
Subject: [PATCH v6 1/6] dt-bindings: firmware: google,gs101-acpm-ipc: add
 ACPM clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-1-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100401; l=3182;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=k+x7SigsMLhAqxwhOrFdeHdHMbo3VM9te/+155p1XOI=;
 b=Ke/Y7Sr2R6ZDIsHTXGrUwLhr0AJiQlmTDXWgSuvtAxvGhdnCBNAIsOUzS7BT6IzHX4xM9NWih
 ZirIzmZMcgBBRu6RrV74nBO4fITr2q9dLgKAtAHoVv99PcxDDN8jvck
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_054647_158266_38A70F55 
X-CRM114-Status: GOOD (  16.04  )
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
2.51.0.740.g6adb054d12-goog


