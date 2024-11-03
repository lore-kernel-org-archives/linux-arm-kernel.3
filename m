Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FEAD10C0E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7j3cATWnm4HzXABiCv4XHWvp91cgQ9f7x4sZtJZS+Es=; b=hMtHQNG+5AlH2EQoF9DcMkQWpi
	Wp545cg7YkNgWanAw1+TnluFu3h2F4pYSdRza8pKlMJYPrTGMngVS/yCfnoiALjP2yZLY7uxJnTiH
	Jem4aLvDWYug7qhnZuanSF9V2SOxAOqRq1mqjhzdv6vn5M4vPylGhOLmIFUfHLY4hIWoekLyYW2a8
	TSDDjooDqb1p+We+ChSEuhQbErqEEc/T6rwEyu5xhGXZfjnBxdPPzz5C3UKEvlrl8ZBMrGfZsfiFM
	UE3T0L1az5d4RU2jIlxZ9Z8bNvTCFzEY6zmWfboIiB2ujRWMZrzAvxkR3e6qY1fye+fHuedfmcjdT
	Cgr7PTeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Zuk-0000000BPdj-3Z1E;
	Sun, 03 Nov 2024 12:41:06 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Zt4-0000000BPVI-48xF;
	Sun, 03 Nov 2024 12:39:24 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9a850270e2so548237766b.0;
        Sun, 03 Nov 2024 04:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730637561; x=1731242361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7j3cATWnm4HzXABiCv4XHWvp91cgQ9f7x4sZtJZS+Es=;
        b=W/XUhlpYnSqddZpYZD45ryfJchRpwUiGSJU1dHDwDR0q36fZRMs707UuAy/akJ6yra
         wQfIxxvk5HCT0nUPFxbRCIx5WDU2bPSun2y08fKXXIeSUzadwxfappkV7wE2mSBL8cNJ
         XVu6FuohsFiwRRuf0+6RKfmQLNdu9csBYySxMFi0Ao3Fqg2Fe1zdtpUHOVmSJ+UWfOYI
         JNkkg+GDQHw3JoYMr3Zy004fyHORMlE3JJIh1qsI12MmGMWQ3A9gpAvgi77xTPzTNODH
         yGAOYa9nQNUwEBGtCaAS0s/Fua+Vs8S5hqKw5+8pFFNZ6aHGzOrLE1SBkgiIVEVbNxR9
         qVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730637561; x=1731242361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7j3cATWnm4HzXABiCv4XHWvp91cgQ9f7x4sZtJZS+Es=;
        b=dNeqApaip5Qx8BuxR/ISdIO0BGSXIozjiT4J/Q4OIMCqGg3tI2oQ4HTdxOjZ1PxfAk
         we4jfXejQH5OgKJRd7Nl3B+250QT+Cbt9KKYdIt38MV1iPc9MoO6aZPdHI1X72Rjd8hR
         WhIvcslRBBL82L16PRcaluqVYPxuWNLq5f3kGDXpBhnoaCUKzPtZZgpULNFQ+M5uBHWI
         3hF5NqsjBhWCqNGWIqeMn7DwEW2i+XTJ/PuJevFKAqnkO3BPaMb34VC9mfVZEMpSEZ+u
         CUkN4NKTtm4JKtsTQdRV2pT4m4xVsX5xQH9cv2XSGo8bct+QTaZcFqdEq3BP46FixP14
         5Tsg==
X-Forwarded-Encrypted: i=1; AJvYcCU5JyOwlPC25KwGUvKrYYNFektV7PyUn+N4Y1ZcSEbALFMfVn8CcCXi4zMNklSFHuAbgWCbRdzC/MerdGLfKGuW@lists.infradead.org
X-Gm-Message-State: AOJu0YwAr7csQarOHAdQaE4ZpD+FkZUCx+9YhfOZYqEQ1qKJ01Vxmz2s
	k/4oK/EGz8KfII8Hpz3p+cL7uk3UQVbwgrPJiif+S/FgXe+TxuO7+1bxMg==
X-Google-Smtp-Source: AGHT+IGpnRd0UvcHqm472HJ7iothM0hy6ObMxdHV/Ghz9bQRgK1XBu15I9OSgPH8IQoyOnJ1aBCQGQ==
X-Received: by 2002:a17:907:ea8:b0:a99:44d1:5bba with SMTP id a640c23a62f3a-a9e6587e272mr855330966b.45.1730637560566;
        Sun, 03 Nov 2024 04:39:20 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56494119sm418884266b.27.2024.11.03.04.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 04:39:20 -0800 (PST)
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
Subject: [PATCH v2] dt-bindings: power: actions,owl-sps: convert to YAML
Date: Sun,  3 Nov 2024 14:39:16 +0200
Message-ID: <20241103123917.2890436-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_043923_055992_FAF9B1E0 
X-CRM114-Status: GOOD (  17.51  )
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
 - Add a description

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
v2: add r-b tag from Krzysztof Kozlowski <krzk@kernel.org>
v2: update commit message to be accurate (Krzysztof)
v2: don't preserve formatting in the description (Krzysztof)
v2: add a blank line after additionalProperties (Krzysztof)
---
 .../bindings/power/actions,owl-sps.txt        | 21 --------
 .../bindings/power/actions,owl-sps.yaml       | 51 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 52 insertions(+), 22 deletions(-)
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
index 000000000..0855d82f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/actions,owl-sps.yaml
@@ -0,0 +1,51 @@
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
+description:
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
+
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


