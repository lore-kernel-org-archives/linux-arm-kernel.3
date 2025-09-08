Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1245ECA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dqFZom65YcEQkXmUqTDd4+m17RatDWu3bIoNbEjE50=; b=yTcAx28/Aza8X+6gOXvUVW6mk8
	y0+KL7f0eCEVGScWGh+Dxb6EwyRLEN2lCf+dp19Wzwrhi5W5RSu0nlze13pH9QUBNOuz6DYYWvoHK
	9fUHF2Cz1kt0MW5/FaMOWby9Qwx4X4RtbwJ1TySpQ34yK0Zg8nj1DHbLTTjTYxCda/GHxR8fiKJ33
	qMR5e7hH5FOCOPvXqQNeSDoI0uIjIDIoELPn49vOt/eCy2Yt5JYro1imCRGJbICAbfttXNNRPJgD4
	46UBunThWOZ41AgKzw0CrZ+1x7iEawkTbDXRj081wY9AMb+56FirdfyiSP92+VO1OLGJSHnu0OB7B
	fATKjLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfOG-000000014YM-0bZ4;
	Mon, 08 Sep 2025 17:10:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbg5-0000000HIOv-2HKw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:13:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45de287cc11so6435945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757337180; x=1757941980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dqFZom65YcEQkXmUqTDd4+m17RatDWu3bIoNbEjE50=;
        b=baUzVp/zv8amUJg5dzEzFYoHjXPJNBeCNzX03BfwvWETsRTg9QLZ9zlEUcTt0M/t1g
         kmDU4/zfUaYS2pTpUDvywLggQyumiCVybp+2bKxcNGfq3hKj2KQ5soI7lHc/dqW7bk4A
         5jsfECi+VLLafBbM/yMadD42l8IkjzWcjz2XCJf/DtRVgiCQMguFFbKECUbtEeNKzPZL
         TENZa/EuhqM+j2xOlfbyOj5jVXfDpmkadHfRXf8adSD6kTTZvEAnlDTZnUUUIZcY58Xy
         M9rkBwv5xe1JRFjcRQLJOxH8ZwwLwD4J1gtu+423Xv9lLclSsUKmqt0gyEziing7+dOo
         rFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337180; x=1757941980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dqFZom65YcEQkXmUqTDd4+m17RatDWu3bIoNbEjE50=;
        b=nFMudfnKLTt9BGkHSEXqlbtKmiRFVN5/EgaMRK9VOyi3vgL75ddxawVqdM1LLIFpN+
         TJ1H0wal+FO62Ozu0vzLkVOgRPkg7aDXxRzpsSMpzAP2dndnP2fmz7+UDvRW/M2cxyqA
         YENVw/T6cERgGEeL7OK/TdgwE6xP4Mo/Q+Km+Ryq/QGphoAj55PDS4QPTYc7ufPMHk3L
         rrAsS70NvBx7Ptmmc9jBHS1SHX8LXAwHBcGIzBNO8mK47nWDtJ41HJqOBF25GmUDo93J
         Mc84xeUpFwcuRbFyjyT/s8iTEJLYBAPdA5z1mDJu81TCPxmCBJrmwcBnawxlO0osAjd+
         K01w==
X-Forwarded-Encrypted: i=1; AJvYcCW19QAk/O+Uvplnz5CeFySnPVG/DdfRRAUuvDLOD8DzNP+k64p+2Jsq1UzKeau6c3hucpKxl2+dfM3Y+NGikMQ9@lists.infradead.org
X-Gm-Message-State: AOJu0YyC3DAwdsO+3hUwt3TjDIWqW5NFBX9EW4WNivIbJ+sjc4Kz4OKP
	FUnBtxEzYfcAb5MqoYgXuQ3CygzQ3kwRLdGUIuB3wSvT+1RQJ/nGTGuWZ06HVr0tqSM=
X-Gm-Gg: ASbGncs2odmJqK6VUMikfrH6DSBxkkdZMPRCtoZWGLu9Amy+RD2Qszk1ZR/JCYEfFKJ
	xnhdDwaWY/F7P/va9tclUwCqdCPd12xN2QzlQDdqEoFQZEdAYdVBhTpIjiL40rGwSa9PuUIATQv
	bIfpd7Goo8FVg6CsxHUpDcwlQa6a7nScfhd0/vg5DVjmqbPctS5ibQMZB4gutJNwXwUL0eupvEC
	Kyt8TBPVlXlZ6UvMjS1DR1RCXe4aesoL0YOb4WKtzoA+EILRRr6BpIeW0aiiRr1RBo5QUO/P7cb
	dR0TCQl/Fs/zBYWgHrLMZWO4I+hl9up30hDA7b6Ow92ELP39q7N0+JT2JYUnIhv9RL1GXBCnj/w
	8Imy2z34erETgE+/iZSi0PUjVQbQvNrS7xJFDF9dHuKWS00wjt6qgxxy0XVwPG1wPas+h4p0aPv
	f+GA==
X-Google-Smtp-Source: AGHT+IE7mUMhuSHckm+BOVWYPNlPL88vc/oJXt6OY3cNSKgPrAVUivteuSdEdtgHuOKT9kbXSWZ9Uw==
X-Received: by 2002:a05:6000:400c:b0:3dc:2f0e:5e2e with SMTP id ffacd0b85a97d-3e628cd5aecmr6211828f8f.13.1757337179849;
        Mon, 08 Sep 2025 06:12:59 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm41650181f8f.43.2025.09.08.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:12:59 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 08 Sep 2025 13:12:42 +0000
Subject: [PATCH v4 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 ACPM clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-acpm-clk-v4-1-633350c0c0b1@linaro.org>
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757337178; l=3056;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=d16ATURJXaVteyF3Qps5PT9fGye6OfeD6faAj7tSV9U=;
 b=suYt9exuHS5pnrnU/6Dl3RDrK+E1WIxhvGPdwwQ3FPHy9Br2xJnfDunovLjDzC9kuHFmAcIiL
 C/CqsWwn9aPBC/3KL2PvOOXAQkSEBn7TCUXkTH/9eEvTIYcZoUOWhDe
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_061301_587341_AB2EC649 
X-CRM114-Status: GOOD (  15.96  )
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
2.51.0.355.g5224444f11-goog


