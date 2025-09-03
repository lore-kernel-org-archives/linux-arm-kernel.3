Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B7DCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdN66op9i3NFpyozSjSkCRDl8+TcoAJ7grYzdeqCoIA=; b=ankqAkEVICwmxAKfBR9U5AH15G
	G6l31q9J0FrtNziflana/JMkvQvwWoPS3YjR6pDJs5X6ts3bH6X3W9JdYAvbP7y0w6fPsHH20mK6A
	cc0Ca23AoB74sn5Iw5QZ4P2HhW9Qf1nEsO/Tn5MOuv4IMg6FTTH9+ac3KreFx5VFlvOKA7sU4fRIk
	lsMHG/vWF0orTII0jjR60cPoqA8OUyjDtHIgpN9EPXFEawgTsySgiFQGcBgBNsC6PWiBOClv6Xfok
	BeQLEON6Ez9/IlZuvUw070T/ixX48T+z6thB7odYWN6Qvt+gDdfyaNX2GO7JvYUpksBzJz/Fj+X5j
	4/3XKtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrkI-00000007FP8-112X;
	Wed, 03 Sep 2025 17:58:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnyf-00000006f2i-3W2k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:56:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45b9853e630so17778415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756907804; x=1757512604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdN66op9i3NFpyozSjSkCRDl8+TcoAJ7grYzdeqCoIA=;
        b=AQZ6Irgcal6gzaCU+MCnlv2IhU7Tt3ar17V5CPDXQYKIqxey6ONHBS2zsilX5gG8Q9
         GNw9ffx3NXoUhl+/g8pgdILlpNM0dyDidv8fmyWDXbbiKY5D2ENhXtVbvkIAxgf3hJmq
         /hwHjy3/tQ3bXtrxWFc9ZS8ULEGZVqa+vx18LUJOqmORnUX7GN5R/XGRPOBAeaYgrvdF
         CRDZ+J7U2C39gbsZQKrOcZpMp2tAVKB21i/4yV3RtaCICIN02afPIUG1fweSfOl9POAC
         /JuhJUDVx5bjWCCYxu3sN7cn1C8e54aee0lbiwmX4CD32IezoZTAGdt4C4k2Uiy2x8u3
         JB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907804; x=1757512604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdN66op9i3NFpyozSjSkCRDl8+TcoAJ7grYzdeqCoIA=;
        b=hi561dG0EBEmPl2UrF4GrEwyjN6ap/Jl56OcnU7AStywGpY33wO4taa1JzM3vuUK/1
         odLRIYRuOpZBWuTiNGKnIioWutvR4DBN0chV3DyJBnXt5QIzG0+CKzPLjuRaErElnl6A
         kOEnhvA5huvmPQ8eOZOYv4jy0fFiLJzsYr4VL6kahPUjfTAhFZauZCIpK00h2kOsHQxg
         S8d5N9CiL9gC6LZJI9KG1QuSVg7Si6gLIsux5efIqsNuIBwj+nloNo1IJQiQjtKj7vbN
         5eMNUYIT88y2Db7mqHoJDcrixvB3g8gCGRyVumVmh/ptw9eFdv8jVDwFEu81vP2+nRtM
         GQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKWvFNmNG/6CM3L94bgyxIvHEz2zkpXUbuy3Be0vD3LYjhkPUPVVKnVhM9KMYffVjIDgOAxCJC+BweqLhPn4Yy@lists.infradead.org
X-Gm-Message-State: AOJu0YwQg6QwGIqqARMWkClLVOUh5Pgal+rJMx62Sam1MNw5xPCbnzf/
	1EtS3D1JSavQn6Bvqs1p1Q7AnuQiVBfS52gBb54HA/TQJiHu3X3nCV2fTBKu/r+ajNg=
X-Gm-Gg: ASbGncusCzWWgKzpVb8QCmDnj+Lq0t3Xct8eVyAMCk34MhiLiUTMJjnYW7HzjfSpTsY
	ovsJ8ZkLhErwwgUhd9a2vV0BWWFcy1VnKswC2ZRI64qCUvWr07HuTRYX5q5XmsUv44iRDnWrOy3
	2WkikOavErbJXsvovbIQeL4eIoNnJNEOeAip+SwAO/9QD/Vh045dad7GxaWbpfiENEe1m+4qQly
	H2+5cPyCHIq7/+BOIM7hvVJFU3ozuNZdQk3SlC4QYU8mzhDU3iFnN1E4UVpUBpnoftdKJzgr3fR
	mnocm4/k3Jx+gs0eN75CAILOBNjqeD8ZE59M7Fv9mASM57QWLYMHm+7erW1EZNe7POA62S2SOfs
	+nynGpV043mmi9390ayjaWUAkNQIay/b3DfJq/Xr58HXZDrT4pyuWVTpcwXBTuVUrDsDQcSnBa8
	4bxA==
X-Google-Smtp-Source: AGHT+IECR6paJMgzBY3Zw3h8Wf7Abdm7g6RlBanKKC46/zidpsFpNnDAQ1oCeBfUT0qxZEn5rcCT3Q==
X-Received: by 2002:a05:600c:a41:b0:45b:627a:60cf with SMTP id 5b1f17b1804b1-45b8559b8edmr151397345e9.24.1756907804169;
        Wed, 03 Sep 2025 06:56:44 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87632365sm197257135e9.16.2025.09.03.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:56:43 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 13:56:38 +0000
Subject: [PATCH v3 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 ACPM clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-clk-v3-1-65ecd42d88c7@linaro.org>
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
In-Reply-To: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756907802; l=3056;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ZAh+jVEjk+p7IOugFLPfvW1C8t+Wsd6E695/908UhEY=;
 b=LdelR0stuthQLZnXmrirVmjYcak2/o60K97PRS1iSdMsSt8ME/KFQNZUxXFvFnn3X+yQ10ki7
 84Cj4pTH5pdA4SKB7iyec3ofdfwJhKl3k+3XqAq5yNxcOimpT2VF11S
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065645_886775_B901BAA6 
X-CRM114-Status: GOOD (  16.21  )
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
2.51.0.338.gd7d06c2dae-goog


