Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9B8E67816
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 22:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5vxf8MUw1KHlnGBa/1IMyXj2UG6JCewFqgb6iXxRDuo=; b=LWOTs8A5snJGr4ZteRvtPW0hBk
	mbsHK9jNV6vqSJToXONiejLdA1WZjmakuvNexq3slZOWJ0jKrg43vO7JCacRGdsfAdsQ3SNoqaSAC
	D4aY1Y1UGf2XNO3Jwy1xgXrb2MsCz4RHiS55MipTMJ9Cf8MLQBhfSNm5Vkw6lCkHSqju2je2ESkKd
	Fnbh4uT6moQi+K17kSo/sqefRw38Lcy0NspF0+hD2bTkHbtoycmlsZtpLORmP5i/NYuye256SffWi
	twXKBxKFp/jVcdcY9wR2/msujWR1pPMqhb7bTsiNJKXyNTKeg2kn2ZL0C82X7Zh7Zn+LDUjxjk8Dz
	+kpmyHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7MST-0000000AVip-3cSC;
	Sat, 02 Nov 2024 22:19:01 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7MQn-0000000AVUs-3PVi;
	Sat, 02 Nov 2024 22:17:19 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so506975066b.0;
        Sat, 02 Nov 2024 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730585836; x=1731190636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vxf8MUw1KHlnGBa/1IMyXj2UG6JCewFqgb6iXxRDuo=;
        b=YnOL4m5jCHPwJLeN4dNCPfUXYaGCFKH15Cf2zx3ViIA9pYdBu/lNgGyWOyi8nYULl0
         74K4weH8bI3mrXobPrwwob4YskKTajgEhYFXF6up/uodh+DMBydkxZfN0nFGsQYr5uGr
         qOak0u2oqwaS/qQvxOECp3g0J4ZzVRggZjY2ps4XZIWXN1st44F9nC7nKJmRWtjRH1bz
         dS/TpLGOal6Jz++qatMiaCSo3HWmPRUwCuesfL9soJRvCi3AsAECyxH3TPLZbQsoRal/
         TzSzkvQu9eELuC2ALB1bzrzP40E/wQFlQ9rOHMVh4wil3IUzHTtMz0kM6FKZn4Uv29TS
         Pj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730585836; x=1731190636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vxf8MUw1KHlnGBa/1IMyXj2UG6JCewFqgb6iXxRDuo=;
        b=R6oq1DtF8vHF/d9UEvFlGPV1fEMKRq+2iA4vo1tG1QnQvRKCtkxhrab9E0Htp/Bs6e
         tn9NynfHamkYw7hJnVlFpCvyxxNll9ziAbRrAp/8KmxtgSGOhydDeJNmVngfKdbIfKhR
         Ox8tHs4RoW+dHOncm9Rfe9psqQ+Jt8BA3w828xsmxcNmZfR9MjSQhz0RbFFfFe4BEG90
         Eh/cRe5js8zj2aX/cukF5oeelR4hkI0l5Qrk5gOAVF4nFfEb0uFvSuGJWez/QXmOLI0T
         9gTVkdGOxkyRhqe4X9d6jBjlJp1Bg1DYW3tfa4oFYefWCAsPLY2vW/FSpkwxyzIgducx
         bcRg==
X-Forwarded-Encrypted: i=1; AJvYcCVhgepPwsjCrEbIR6p3Q4RFXLTKbMFIRNzs9Of02urJT8jTzThm55anAbSDlxa1ra3W4vygzJdroJw9LOLNjZLg@lists.infradead.org
X-Gm-Message-State: AOJu0Yww5hMUj3tCFqoR7uN1A+J89AGRCjp0TgeARs53p9ASfT8EBrrI
	R2ZU/CMUT/JD4HjQMmy8rubdG0LTSiPg4n1BnuIULsd40ayqKTqH
X-Google-Smtp-Source: AGHT+IE+SUlLFoN/+EuPuCWvs6qpBKkmSyn3eiHJ8mhwnVR3nprD9gPRGUlcGSR5L/12vtyXRpdvcg==
X-Received: by 2002:a17:906:7311:b0:a9a:8502:6ebb with SMTP id a640c23a62f3a-a9de61ce5c1mr2560597666b.41.1730585835467;
        Sat, 02 Nov 2024 15:17:15 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c4f2dsm350412566b.52.2024.11.02.15.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 15:17:14 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-actions@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: power: actions,owl-sps: convert to YAML
Date: Sun,  3 Nov 2024 00:17:06 +0200
Message-ID: <20241102221707.2857342-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_151717_881629_C19C6C48 
X-CRM114-Status: GOOD (  18.59  )
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

Convert the Actions Semi Owl Smart Power System (SPS) bindings to DT
schema.

Changes during conversion:
 - Rename file to match compatible
 - Add a description

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/power/actions,owl-sps.txt        | 21 --------
 .../bindings/power/actions,owl-sps.yaml       | 50 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 51 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/actions,owl-sps.txt
 create mode 100644 Documentation/devicetree/bindings/power/actions,owl-sps.yaml

diff --git a/Documentation/devicetree/bindings/power/actions,owl-sps.txt b/Documentation/devicetree/bindings/power/actions,owl-sps.txt
deleted file mode 100644
index a3571937b..000000000
--- a/Documentation/devicetree/bindings/power/actions,owl-sps.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Actions Semi Owl Smart Power System (SPS)
-
-Required properties:
-- compatible          :  "actions,s500-sps" for S500
-                         "actions,s700-sps" for S700
-                         "actions,s900-sps" for S900
-- reg                 :  Offset and length of the register set for the device.
-- #power-domain-cells :  Must be 1.
-                         See macros in:
-                          include/dt-bindings/power/owl-s500-powergate.h for S500
-                          include/dt-bindings/power/owl-s700-powergate.h for S700
-                          include/dt-bindings/power/owl-s900-powergate.h for S900
-
-
-Example:
-
-		sps: power-controller@b01b0100 {
-			compatible = "actions,s500-sps";
-			reg = <0xb01b0100 0x100>;
-			#power-domain-cells = <1>;
-		};
diff --git a/Documentation/devicetree/bindings/power/actions,owl-sps.yaml b/Documentation/devicetree/bindings/power/actions,owl-sps.yaml
new file mode 100644
index 000000000..6496f3a71
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/actions,owl-sps.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/actions,owl-sps.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi Owl Smart Power System (SPS)
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+
+description: |
+  Actions Semi Owl SoCs feature a Smart Power System (SPS) that manages power
+  domains to optimize power usage across various hardware blocks. Each power
+  domain corresponds to a specific hardware block and is represented by a bit
+  in the power control register and an acknowledgment bit, which is then
+  translated into a corresponding voltage on a rail.
+
+properties:
+  compatible:
+    enum:
+      - actions,s500-sps
+      - actions,s700-sps
+      - actions,s900-sps
+
+  reg:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#power-domain-cells"
+
+additionalProperties: false
+examples:
+  - |
+    #include <dt-bindings/power/owl-s500-powergate.h>
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      sps: power-controller@b01b0100 {
+        compatible = "actions,s500-sps";
+        reg = <0xb01b0100 0x100>;
+        #power-domain-cells = <1>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 76ea65128..420d06d37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2023,7 +2023,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
 F:	Documentation/devicetree/bindings/mmc/owl-mmc.yaml
 F:	Documentation/devicetree/bindings/net/actions,owl-emac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/actions,*
-F:	Documentation/devicetree/bindings/power/actions,owl-sps.txt
+F:	Documentation/devicetree/bindings/power/actions,owl-sps.yaml
 F:	Documentation/devicetree/bindings/timer/actions,owl-timer.yaml
 F:	arch/arm/boot/dts/actions/
 F:	arch/arm/mach-actions/
-- 
2.43.0


