Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709A3CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 02:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zPHa6Agzy1CClNZP307eBIa+jAOQbdPXd+dwL+YOTPg=; b=IA6DHbpx6+vpFpDLWN7sSTREbs
	zvNxk90MoXafX8PeFtTCKNhQ55lmTsoMgzzk75DT7z1HTqi/O+wRO7ibSKOygkgiR01sySrel+FiM
	apMyiKyKMeu4OTabJ85C/WUHC85RdGy0WRQHvZWrWi5bB1jCwjQfEIyDJE+Ml+j39zjxDTYB7egRd
	CVkdg0ihRGosa69tRCoYoVooUMdLfUgjI0AO6bWLI0Zlz8rxwVrSh1nPv3uqGhQT5NpKHOmW6Ibev
	5xX6oeL3MS+XKYxrTEzVolfE53MX/sYT0Rxc0t1hKafpCmnBXBXubaB7uGi5CV2FVcePLvxPJVclZ
	zLy3V+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdBO-0000000FIkj-22P9;
	Tue, 12 May 2026 02:49:18 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdBK-0000000FIk9-3clT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 02:49:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-366375c4076so2262720a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 19:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778554153; x=1779158953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zPHa6Agzy1CClNZP307eBIa+jAOQbdPXd+dwL+YOTPg=;
        b=BHcf1znBxyfbh1TUAte9Uqjw+klixdVJzLolKVGME4nf9aN5nUkVd56Q9QPF92NmG3
         rJlK7QJogUT2dylwiObIMPhrOA956TZm21SrK9balaqBL6aWzb9FHmthQAVOpDTEkcun
         wla9zDgFzNC49Bjx8x1+jZ2DCJCZD9mQCzWhdJpDfs7VUhN090HcjuHK93gVYBKbxXdl
         t5V45X6xnsCfBb5xh7ldYSFRNQhLXwBJUrUadE+VecuTfYHrHKqqHog252DaappCL8IL
         Y2HgPcaKQmVWULTdzvEdKG5cN3ST8XqRrEJVUIQEYCuoRa5Iy88YheS94S8X7A284diW
         9yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778554153; x=1779158953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPHa6Agzy1CClNZP307eBIa+jAOQbdPXd+dwL+YOTPg=;
        b=fPDAUvDektCE27DS2MtbkK7l94zaYcG52fJIMTHAjcnVD1FFlg8GqIHpNaDXtn7GuW
         oOsF1Gz8lkehLCz/DBwCQ5kG4nzreWjiaEbV2vAlZw2p7gAYbkyYqbCpPqJQN4teBtAx
         AYQUlWl9Pl9GHz0IV2VgH3W3ziGPFXKIkow42BLZKRclqrhSldiEwMNz/A90u5TJ0cAA
         EuXWKxZ1QMR6uZwmuDQr+t86I3uHyAaozs4C79WbmyWxwrvjjy0FZ0oX+2l4wUfZBEv3
         Fjy88HjryTHf620evtI19QxUeysF+gxISPBxUX4hDFwOct3B/UjLG//obUTMgbNOSvV/
         8skQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9/GzOTVIN6unn0UsU1ykrVg4OwGMlVwhw5JAIUk9pOIZi1ZkCRxX2jf6TrE9+tCT5aiuJkQgDlQVM8fv1xj1T@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1mDJNa/DYWFWgvDhxHfiQTuPSU07BwEblLv3maG4VxGlzGkS7
	22uD8611ev9SEDEhH0eyWl38j0e2V6YqMiTFFTx7THIztvPt0rgibjIe
X-Gm-Gg: Acq92OHBNmFn4RmT7GVvncFKGEgl1IgBNTNsFczCbaqE29Oo+edWsSodmRuTlWPsHJQ
	vna+J8wjwtzKBiLTMjOZM2AK8x+SRg75uGUN+LGTmxpFWF1974gPuZhsUGnBHFDvrzbInRMy2r5
	k07mVjhw6eEY3BlMOUdaxd0v+UqQlAsE/SyrVMNyL74BeVDnYgBSFnEM/p39hxHOe7pnMPr/3YG
	IR24vAb4BCurcFb0jAYJGsv71Hf+Zo1eVXf6F5WGO7qt/QOiH5KwdbuB/lNyhNpHL+BFdoqefLc
	P0MJZE+CMDu/g3VG1Yqt/2YT0lJqiL+6q2rmYWP9sJZKJxGjnP2kvYw4duIE8YvpLsABXNbCPxg
	4NdJH2Oxk0zZtPtsvCHVqlTt/WbEK4SVYTu8kxnLh3pNJ4xiWEt1LThU5wnhtAqwyk1Pry93Gw4
	RjXTCfomGhQFpo5MNgZh8owEgrT6M8QmXkGjrrbG0bglU8pNeL41x/3VgdhYaORYT2VbtnXs7Y
X-Received: by 2002:a17:90a:1001:b0:368:78da:803 with SMTP id 98e67ed59e1d1-36878da159fmr3395240a91.12.1778554153407;
        Mon, 11 May 2026 19:49:13 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e690c4sm118619185ad.57.2026.05.11.19.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 19:49:12 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	brgl@kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] dt-bindings: i2c: convert davinci i2c to dt-schema
Date: Tue, 12 May 2026 08:18:51 +0530
Message-ID: <20260512024851.4792-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_194914_908867_D76AF311 
X-CRM114-Status: GOOD (  21.61  )
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

Convert the Texas Instruments DaVinci and Keystone I2C controller
bindings from legacy text format to modern dt-schema (YAML).

During the conversion, the `interrupts` property was made required
to match the strict requirement in the driver probe function. The
custom `ti,has-pfunc` and `power-domains` properties were also
properly defined to match SoC-specific hardware features.

Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605120133.lQ1F3qlY-lkp@intel.com/
---
Changes in v2:
- Updated MAINTAINERS file to point to the new ti,davinci-i2c.yaml file instead of the deleted .txt file.
 .../devicetree/bindings/i2c/i2c-davinci.txt   | 43 -------------
 .../bindings/i2c/ti,davinci-i2c.yaml          | 62 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 63 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-davinci.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt b/Documentation/devicetree/bindings/i2c/i2c-davinci.txt
deleted file mode 100644
index 6590501c53d4..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-* Texas Instruments Davinci/Keystone I2C
-
-This file provides information, what the device node for the
-davinci/keystone i2c interface contains.
-
-Required properties:
-- compatible: "ti,davinci-i2c" or "ti,keystone-i2c";
-- reg : Offset and length of the register set for the device
-- clocks: I2C functional clock phandle.
-	  For 66AK2G this property should be set per binding,
-	  Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
-
-SoC-specific Required Properties:
-
-The following are mandatory properties for Keystone 2 66AK2G SoCs only:
-
-- power-domains:	Should contain a phandle to a PM domain provider node
-			and an args specifier containing the I2C device id
-			value. This property is as per the binding,
-			Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
-
-Recommended properties :
-- interrupts : standard interrupt property.
-- clock-frequency : desired I2C bus clock frequency in Hz.
-- ti,has-pfunc: boolean; if defined, it indicates that SoC supports PFUNC
-	registers. PFUNC registers allow to switch I2C pins to function as
-	GPIOs, so they can be toggled manually.
-
-Example (enbw_cmc board):
-	i2c@1c22000 {
-		compatible = "ti,davinci-i2c";
-		reg = <0x22000 0x1000>;
-		clock-frequency = <100000>;
-		interrupts = <15>;
-		interrupt-parent = <&intc>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dtt@48 {
-			compatible = "national,lm75";
-			reg = <0x48>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
new file mode 100644
index 000000000000..89c639d023a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ti,davinci-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DaVinci/Keystone I2C
+
+maintainers:
+  - Chaitanya Sabnis <chaitanya.msabni@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,davinci-i2c
+      - ti,keystone-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ti,has-pfunc:
+    description:
+      Indicates that the SoC supports PFUNC registers, allowing I2C pins 
+      to function as GPIOs for manual toggling.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@1c22000 {
+        compatible = "ti,davinci-i2c";
+        reg = <0x01c22000 0x1000>;
+        clocks = <&i2c_clk>;
+        clock-frequency = <100000>;
+        interrupts = <15>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@48 {
+            compatible = "national,lm75";
+            reg = <0x48>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index bc3bcc641663..50a11a8d71a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26396,7 +26396,7 @@ M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
-F:	Documentation/devicetree/bindings/i2c/i2c-davinci.txt
+F:	Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
 F:	arch/arm/boot/dts/ti/davinci/
 F:	arch/arm/mach-davinci/
 F:	drivers/i2c/busses/i2c-davinci.c
-- 
2.43.0


