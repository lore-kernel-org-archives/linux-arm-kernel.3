Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F27AE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKTSOcD5L+z2qw5+nXllrVScKZxcBqJj6UXu4K9Ii9s=; b=q/RY+E0dN0zo7B6+qLkL/tP5eJ
	gIquf7E47pAGkNJdgI8KqQU+6yQcA062ZgfZJCHzxuL9ZfYOXFbsrNwEeFtuEEwaZrWE7642ACV/h
	7h+WWieeyjdC99MqU4ZAZd63meRILKh5oSr52GpkPVepmYt6lwPaiZxbVp9bEP90licHvMysA4L83
	kT+d29C/8f69GvIMiqsCCRSxjX4TP0CY7NVaFq7G5KvWpqV5scxD1jWZ5RnoWBzESuXDpXajMf2+6
	3FlA+wUobsYqIaBaAYbTPtlEPGZPl9QxZc2NV6aMfIESRPcfxNb/s9t/HBjzkyyU4uuSMcVrSZMUB
	2VztyFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFtE-0000000GzxB-0cah;
	Thu, 05 Dec 2024 17:43:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFrD-0000000GzPZ-0nz5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:41:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so11846305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 09:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733420501; x=1734025301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKTSOcD5L+z2qw5+nXllrVScKZxcBqJj6UXu4K9Ii9s=;
        b=ifrGO0KKTlV3ft24aElc2ELJJmV70Rtr5ePek96bkavnwjm5C5WQjTTnAiGsHT2Ka3
         M4CmDaXHY40akChs4XAbkn9OrJI/RxW3WwsNtDb43ukLpE0jhM6cAdVmMOYHnq0pm3Dd
         jUpqJYuqYeqSoGSo9B+c9Td0CQvO25vx9N2k13BoctmETuen/Pgz2VzU5+uKfvfT5XHb
         YA35sG9K+54RqyBgqIyKr82cASKhaovKRWg4UdmwUMIPWoA5FTb9mMXubn+//YtuAeLm
         r12IrjZYexFYRDJyn/tNHI6NQZz3pxkqJCWD4nGrGkecyAjLggCTat53RB3BFIanLbVF
         J2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733420501; x=1734025301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKTSOcD5L+z2qw5+nXllrVScKZxcBqJj6UXu4K9Ii9s=;
        b=iaPk4RuQSAkLfnnra3DYJa6hlJoLrf4pZ64DJN21O91GSBNAMHDUed3WLZ81+l0+IL
         C7le9VBcaj4ngdTvi+UNktfGty7QW3RWq8zjgSd8IGOWOHqCMfyUAS5dKsI7MlZlTUyo
         MCXDPzOlk2Kp98z+ZBskdPXktFwH5qosXbsC3xsoywV7tWWVaFzPQyy/nNjA0eOs9X66
         YtCJPpiTD2rxCn7M/wimiEziWl9/U6rYR4uIAY5oYUFvlJLnFzE/OzsEYDk1xm/WA0O5
         CZunHs5JDOdC/8imBbEgc8G2PAQfIVaNreeYFFpVZ1nRqmwpbmz+RlSkEkhXS4ONiqMI
         Lm5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+JAXpFyOGasOGQZbK1qNH47J9q7H2w4TGGBogc9KRiQXbBd02CyPInLbEQ/OclnQrzpgq5bbaTgCPWPsW3RnL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfb5hlX8kGnJiZ+z/dZAvhqk3LANz819P90u5GDzmk6/oh32f2
	gVmQx2abZDgrCzD5+CYA50kooozOdM1QYtWyaAlbMhWUx2QDlfTQANB0ktuDH4c=
X-Gm-Gg: ASbGncsJB9O/Db1Qcog4pQ5NTT2WC8N3LBrnzSjIMbHBmvMKAYYqe9/M93RBBP2UiAn
	papvE3bd0uWbpEYK+cDkyJjeLv3DjlnVBXk+tp2jscT7k4uPJtyZrGLt1hUv3q1lB46P/f76Q/S
	cMPmoUpu03PVLQiv6+5RqzqPFYA4yzzupVRcHRfganNh2d8OEbwm5xhCG0jgVRKjvvKkwBdwy3V
	yOB0VDzBhLwANb+Di2Tz/ZqL/9wwmHgIMfUmzetQV124fB0FgPeYTOhL4H9q9Or05RZ2o61Trhh
	rAyk1+6G1LQTqfSJy1ETb0mNC07n3fud
X-Google-Smtp-Source: AGHT+IGqhJzyDS4e04vMn1WyVytA3R0WpmSjXAbWRrFlxmWxFGHaT0ntvkzlA3YzSBZ0INS2vdnPeQ==
X-Received: by 2002:a05:600c:3ca1:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-434dded7366mr1195635e9.25.1733420501143;
        Thu, 05 Dec 2024 09:41:41 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d6961sm30318525e9.12.2024.12.05.09.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:41:40 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: mailbox: add bindings for samsung,exynos
Date: Thu,  5 Dec 2024 17:41:35 +0000
Message-ID: <20241205174137.190545-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205174137.190545-1-tudor.ambarus@linaro.org>
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_094143_227662_873FCE49 
X-CRM114-Status: GOOD (  14.75  )
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

Add bindings for the Samsung Exynos Mailbox Controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/mailbox/samsung,exynos.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml b/Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml
new file mode 100644
index 000000000000..1fddec1fc64c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/samsung,exynos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Mailbox Controller
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  The samsung exynos mailbox controller has 16 flag bits for hardware interrupt
+  generation and a shared register for passing mailbox messages. When the
+  controller is used by the ACPM protocol the shared register is ignored and
+  the mailbox controller acts as a doorbell. The controller just raises the
+  interrupt to the firmware after the ACPM protocol has written the message to
+  SRAM.
+
+properties:
+  compatible:
+    const: google,gs101-acpm-mbox
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+
+  interrupts:
+    description: IRQ line for the RX mailbox.
+    maxItems: 1
+
+  '#mbox-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  # Doorbell mode.
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/google,gs101.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ap2apm_mailbox: mailbox@17610000 {
+            compatible = "google,gs101-acpm-mbox";
+            reg = <0x17610000 0x1000>;
+            clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+            clock-names = "pclk";
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+            #mbox-cells = <1>;
+        };
+    };
-- 
2.47.0.338.g60cca15819-goog


