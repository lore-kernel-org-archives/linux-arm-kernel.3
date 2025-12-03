Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FAFD12D56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQw2QNK0m7aXsFhROk4LDansnAN+1Su3gSOuHq49ol0=; b=zNq5gZYfErswV3a76vNmYYLOev
	VLXsj6k/2lLUXr32RV/Q4sv2fB9g6hmvk/33A4/P0UBEr1meRsYFU2MGB1gdWW1mH45rs4g8T65qq
	YEPdGAqPusV76BSrYI/DdaHk+wqOSG/tLJUbeo++1Zun9Cd5KGEcfF05QSR00XaIW+wfnjrfOuV7P
	Al2fPkuRE5ma4hiPWi4GEc4SG5wFZpr74CFh585/MLuydW8o0lP5/8kGpTyn3zfiJuFIEIVzQXAcX
	76uCvA+uaLihXjJdoFz0TVs8YMebTBMgs4os0lbMElDcn9BJkR0wk0h+mI/8l3znn8JwQ227kD60X
	7oINBBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQltL-00000006YKp-0EFd;
	Wed, 03 Dec 2025 12:23:31 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQltI-00000006YKO-0TRf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 12:23:29 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4eddfb8c7f5so60926281cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 04:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1764764607; x=1765369407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQw2QNK0m7aXsFhROk4LDansnAN+1Su3gSOuHq49ol0=;
        b=inyZoVI10nEyLCp2VlTDXAYt2HY5q4Yh3lBKKiEAY2/FjtAhvdvufgFsTnml0QcCpl
         rmFJZ3tSQdHe2bYFuTt2/dZHMO/XyHOiWvoI3VYKzKcDmsp5raOUqa72VJrQBrp1e8Tk
         hQ4uPhy1mNwpMziHF83ddwX/UiiLHtkSNygtahXPFdp1aRNdOQwMRNEfCTqzqb+BG49T
         +xSJ2tGB8sai91gsVKsMuftliF44a5YNh1Mt+RPmw63F19BvHe/kH8uLtfXwCR9b7n3O
         Ju7oGhy6LTweQnJea9ZHVdZCbgSDCv5Evyxl8+Uc2V5/khdtzUC1uPc+OPP+fpK4inEz
         iPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764607; x=1765369407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQw2QNK0m7aXsFhROk4LDansnAN+1Su3gSOuHq49ol0=;
        b=tDJIRPl/8RVrSfJNWuSbqncN3bmULftgoh74j+fkvBWt8KVgM2VAZN1BWEyXiaj6MU
         2aSpM/jA/PMgkuO2HKR4YQDlglrQ8UwJ8NKnDxKXryS/fVzf7G+4r7piyu1RkaodCm6K
         IBNm5qS28z0p3MsQW8EcxZoUZEl2OIvVKz55OjQ1ZtkA7yjo27HJ9vLYTHSOWAiC/cqh
         5Pm3wfFXpKmFLd/gULoVgMYbt98xH5axyus7OBiwpnNDxEmzkwsxC6kmiBiyzTthKVrk
         0oV0DGypQUC+uxqoDjT5QEI9v8qI0OHaXuJDJf5cFQMaC1CrYkRP7Q5oLfo7Y/Z7m/cM
         Szeg==
X-Forwarded-Encrypted: i=1; AJvYcCUqMcQZQJN+HtHb0Cz6pKjlqRPChyngBlTaSFDU6coUdn0FCDcCQrKJChMnTigON1f/aTNG2PIIzazLF7n1YJfY@lists.infradead.org
X-Gm-Message-State: AOJu0YzQfsoR+rSmYOqmFQt/gxmWb5s39VeHw5zOdB+kZZ4cUuYiU2sw
	vD5c1k94UTjpVh2HfmjIpF9Gf/siw+7EWgnbzJ40zimW2T0p/SgB0BykF6szuZMLhA0=
X-Gm-Gg: ASbGncu8qXtqISkX1lsYEujyo8DiZGlKwPIbjXDZ1HTW5nMNjsVuTH5drV8ZHCC8ZnH
	YZ6528ApuLZvMW5jvUGTcjRsmG8jySDuJG6hMrEO91yO6WRHIGiNIm3ioHtPU6A/vZzMGvuVia7
	mmZoHWFt/BTMcB3wfMxePCBbk7lHbsgB9SSwKO2YnA4yJ2Rmd07Q8WB2SThQMeCO4Wmypz0ZJlE
	yrO+j8us4xRPAWRtjRv5/5xEAb9IeOnZQl9Qqke6ZVMUfa1rhzL1j7c11OM2nQcD1Ufq3PwiMaJ
	0x/4SLDLjmOi3/1Zv9mQU7Um92CP0F5/HqNfU9JUUHmVKk5O/XPQ3EMwHh49YxX9SJXCni8iC54
	edh7BeBLiGRwHcQh/17UDPMjsjccYj/NWmIMioyM0Rd+G7lkAa5T1kzu7fFHvbonDyM/hI9YqOx
	p6TJpUKh9JOJsDMZZHUmOaQcXttFInbavPYDMEvHN4IX7N
X-Google-Smtp-Source: AGHT+IFBqItcO02HwRqZQ09Eftjhy8B/A1LUHr5yIyZjuhioLZT8jA3EARqXdnEATjeL7hbCsn7I/g==
X-Received: by 2002:a05:622a:d05:b0:4ed:423d:48ef with SMTP id d75a77b69052e-4f01f697666mr4823071cf.40.1764764606528;
        Wed, 03 Dec 2025 04:23:26 -0800 (PST)
Received: from fedora (cpezg-94-253-146-247-cbl.xnet.hr. [94.253.146.247])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm115214351cf.3.2025.12.03.04.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:23:25 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/4] dt-bindings: usb: Add Microchip LAN969x support
Date: Wed,  3 Dec 2025 13:21:29 +0100
Message-ID: <20251203122313.1287950-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_042328_167070_E50D2F65 
X-CRM114-Status: GOOD (  11.65  )
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

Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
speed, so document it.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/usb/microchip,lan9691-dwc3.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
new file mode 100644
index 000000000000..7ffcbbd1e0f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,lan9691-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - microchip,lan9691-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microchip,lan9691-dwc3
+      - const: snps,dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Gated USB DRD clock
+      - description: Controller reference clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: snps,dwc3.yaml#
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/microchip,lan969x.h>
+
+    usb@300000 {
+      compatible = "microchip,lan9691-dwc3", "snps,dwc3";
+      reg = <0x300000 0x80000>;
+      interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clks GCK_GATE_USB_DRD>,
+               <&clks GCK_ID_USB_REFCLK>;
+      clock-names = "bus_early", "ref";
+    };
-- 
2.52.0


