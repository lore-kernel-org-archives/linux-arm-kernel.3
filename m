Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DC6C02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a42DOBe1uqn7pmMlyPetZLEiqSZyshl+HGTpgvC7gGM=; b=f892wAauOlkaS+yLIwSn4u8OnB
	AwRVr6sPj18tayijFWmLrZR0M5x8yX2FDTvXgINl7A+4c8F6SZb3XbaiimnF9symugU75MUtS2V4F
	Tfy/cBtf95x711TVjCpXgyeAp4j6cyNQEPwPMQaTAywO6clCZv2MyFLTF9zEAD65vpU6g87lFq8Nz
	Ev1GbD6QmtEvIPLciSGfPRyUOFTX1eQWb7jkmRxOjL7w/jGK8qDHwaqFYQM3kQOkEBVtmnEVAmc5e
	2+M0vqb5MPnp/nCFGG3ttyvG9Xd1A1AyT7skcHUUhpYeEUe0l3cKMrNXcMfBcT827BcaL/JxHkV+l
	JzqOQb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4Gc-0000000C6X0-1JwP;
	Wed, 15 Jan 2025 14:21:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4Dz-0000000C5ob-0ndM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:18:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436281c8a38so48597695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 06:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736950706; x=1737555506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a42DOBe1uqn7pmMlyPetZLEiqSZyshl+HGTpgvC7gGM=;
        b=dCiSvh8lQHmgmTCTRG+CH0mJ/h6RwEEIpyxk5iMDBt7OB/fGjHZjIphxv0oLOjz5yg
         A7Og/GqNX2VAL10jcQhLjTxQAdK1rtnfa0XF52cOt6IbKvIgu2KZJrVsHVlitl5XrmlY
         jEE3uAjEbeXpROPtQn6Ty45EioMvcYWgrLndzyVXXEXSidGNBoi6BC9SFTvzCIazopeT
         EHqpzX2pp4+wwBpXGwVOKwin0ji2Qz/EYalzpO3ru6bUv0z8p81iRnnTKmUnbQEiqsI2
         XBCz2tOnq0XSLsoY/6ZDuQZ073H9iQndHoszwNGSQkoeIAFvQdDlvChDXSwMNF1XajKA
         20fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950706; x=1737555506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a42DOBe1uqn7pmMlyPetZLEiqSZyshl+HGTpgvC7gGM=;
        b=MsPgWP81MImK7eXA/TGXZqWICr2bxEffCX2mQGak/OvYO0Qhj1IBcQ3pEzKYbJrPZ9
         GCc7uOrsBB0lpcfy9IYnG/1+Fm2UEz4eELY7y2ss6ciy5ZOTK7Eew1xaHwiLI1V9Wv6i
         b94eLikP8llaEDWGrA+lYtqMybZNEgaQyhfVpv4AY8r8bHRfa+7osZ3FopTQTFxkGZ3U
         bEZ20uPt45+xwkxEHa7Kr9xXQWKeDmwewQ0mHvTrAkL/jl/Rto4IwLCn0GMQTa/sthMj
         MgS/DQW5PM2R0HSaRFJB+sraOOsKyiSqUrRzRcQUgfQwVc73VH9VmWuODC8t32lenOT2
         tk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6CbSe/+TtMckF0Ur5IuuX6HYv6Ajs2fkF5yBT2E1Bx6k8ZtWnodNUG7EKevWQpZpKJoKQa7XlGfSedGYXQgCC@lists.infradead.org
X-Gm-Message-State: AOJu0YznUPDLgoVsBt3UrgMqp2XZ9dXgqyXZYnWKuZcH8A9iNzLL70FR
	g25L2j/A0cRcPJOqh2JkYmPIVfAohSWBn9zWo8NUgjMFoCZ52POMimVcTHYYeP8=
X-Gm-Gg: ASbGnctA4gE6OTKkrpzOvMpNp8OzHrp0MDfyCtuubpebMBpWFpe+x0zjZECTzxZRdC2
	V1e++mgnLmt7CtSceU7o83JQz06XQ16JndCBwIzbgC6aea1MvHpZcb6uFzFEsUAXHXJ9eC6JJdN
	98XCd0GlKHrNbNKJ3INblNO2Ld18F7/mfCjFZm5/YcE50T2QzGktaJqYp8hf5nIcWC398C/Ybhk
	P7ojEfGt6Q06eaFKX2RStA9vOmn80tOWFkVLgGNPpzyU3slnNbU2lJ61ialn4KU5HlRtf1HZue1
	0Ku/SDdkknoFOUdICZSH7M/E6UKInpWF7Uam
X-Google-Smtp-Source: AGHT+IEhSosZqUJXLG8olJ1UCoWQCrVDewzF96mOttUN5/GBxHCh4eNVf1fIYgFOhcK75geW+AWZjQ==
X-Received: by 2002:a05:600c:3ca0:b0:436:1c0c:bfb6 with SMTP id 5b1f17b1804b1-436e270620emr239929715e9.27.1736950705682;
        Wed, 15 Jan 2025 06:18:25 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74d8e06sm25184555e9.31.2025.01.15.06.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:18:25 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 15 Jan 2025 14:18:14 +0000
Subject: [PATCH v7 1/3] dt-bindings: mailbox: add google,gs101-mbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-acpm-v4-upstream-mbox-v7-1-948e09fcb5f2@linaro.org>
References: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
In-Reply-To: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736950703; l=2400;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=5HGsUQ8DOjZ0Xsj5e9DwGxqdEHV2zqdEVfltYYG6Yao=;
 b=BWb4jQeZFy4QCExxs2qrhgDBCcW6TGsPvQ8HLUII0HvZxdebpZmFiFftHoddgvs0g1T5x+jqg
 GKCe8+3WaMmDEe+Ngs8gIWHsrY0JDO5cfxTtlzU4ww26Xh7b2vudpOA
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_061827_231276_7EC8CC8B 
X-CRM114-Status: GOOD (  15.98  )
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
 .../bindings/mailbox/google,gs101-mbox.yaml        | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
new file mode 100644
index 000000000000..e249db4c1fbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/google,gs101-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Mailbox Controller
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description:
+  The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16 flag
+  bits for hardware interrupt generation and a shared register for passing
+  mailbox messages. When the controller is used by the ACPM interface
+  the shared register is ignored and the mailbox controller acts as a doorbell.
+  The controller just raises the interrupt to the firmware after the
+  ACPM interface has written the message to SRAM.
+
+properties:
+  compatible:
+    const: google,gs101-mbox
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
+    const: 0
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
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/google,gs101.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ap2apm_mailbox: mailbox@17610000 {
+            compatible = "google,gs101-mbox";
+            reg = <0x17610000 0x1000>;
+            clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+            clock-names = "pclk";
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+            #mbox-cells = <0>;
+        };
+    };

-- 
2.48.0.rc2.279.g1de40edade-goog


