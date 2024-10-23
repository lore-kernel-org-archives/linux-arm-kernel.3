Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8E5CF5367
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J2MTS/u+0Vf8uU8MokaRsyUGwP3Z9gCshpIWDYlPy20=; b=rHFO6jrp8+ZxM7tt+JKGmz9DTR
	KTqJ2iUMYgak9Gor50wg0NWDa9ax3Ie26M3ion1JLQNqaHQ4eGDjbEXN5boJLcGfsAmg3nPvj9PCy
	12QZJF7Tc2F+R1lV6Mf7nqZdQ6W2n/DQgOAZoVPsEGpJvBZ3WJBbviHwjBT/r8TSYnmm+kGpUzjeH
	SZfIkp4G0JPbQpQ8R+2zEFfBV5c0dnZIdK23gQQYBR+m9dd00dl5SPUnalCnXjPNHPipB547O9rGs
	KyiCv7kfPYTG9TDZe+hRM2fKGxJbh//iQaf3AxhB9DW34PrpIywJqXdtV5RwXA1wfRg38GCbEx1lF
	HNuew5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLN-0000000EILu-3lLd;
	Wed, 23 Oct 2024 12:20:05 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3a2W-0000000EFPA-3Dqy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 12:00:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20cbb1cf324so58980465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 05:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729684836; x=1730289636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J2MTS/u+0Vf8uU8MokaRsyUGwP3Z9gCshpIWDYlPy20=;
        b=aIJw/n+F1rvM2LO1hES53xrTQ4OQeu/6SLAbGGp04CfAZygbSPInemkr2YdRRKuFU3
         WeQqrI2zPVJhD4ZAz/+um83hpcZbJAoglpfVn1LEXjkwCsWb++HXMVmNOgZbXIxbsMeq
         e0jV6FNoq+UTF5uteaIly+44+e1Kcf6NKYBbD+VZm7bXjlE9Fl/OD4c6wbzG7kPlT/Gi
         VhzNzRoGoUPhLNe/6liGNS11Kq+04pzgH9R9dNWVi4HucMU3ZwtAcqP0+M/NouHCUhMW
         SsoBwoJHRLQT0els2hsxmc7cGY2GCjpMQWthBVHL1Mb+hWEzSw320/h4qHdlgbZogMnP
         wZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729684836; x=1730289636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2MTS/u+0Vf8uU8MokaRsyUGwP3Z9gCshpIWDYlPy20=;
        b=GPwZmhkqqbpKS/PsTOvFPA4Y/xWNOM3dOkgbHmQEH+zNJcnIoSFieSv1vHwtqtgYEj
         w+9xBAKKzE2p9UR+5nQv+wTujody4AXYLGX227wNjF1SV/uuMAIvio6UkgljaNNwzJVS
         OkXpHQGI7QPkFcMpx+kHGqSC8GFVy9E/fvPtmz3CD+WcQZTCLo4g94mKuNQUWqc/Rasa
         Wn8MhhYXOTYGZB1ftIMKe5OVrzog1A3vARfL/RzuTXfLjiKz0reKeX7z1wYW4O/UrOSa
         zlDRsOMhRFRkJCtJF4+UwgFPyEwFu7EIC+da9Th/X/MFIFlP2QdjXf6NPGN3sHpOnTiN
         h5fA==
X-Forwarded-Encrypted: i=1; AJvYcCV7gyWq00aCrNVHgrhgTsghDkXJhjdV2TON3Te0NoxvIKYKxEFLOYaQyk3CGOY+HLLDIQTTCCAXTDLEDagBecOS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx7YdRc+NFkVgsahzSJl8ipAfQasH5kaKu45G8zvn3pNgz2ql3
	GueizLq8xjbRc1mZz9NFioN3UzqwOMAhYcWJ9nCHJJNIIE4Zy1Fu
X-Google-Smtp-Source: AGHT+IGxv5dhAMbuXomoFYpbS6FEm3jtO/yUDIs/ac5RmQKBFN9OI2RYgb7XmCKEqMNPK3ZzAdsf8w==
X-Received: by 2002:a05:6a21:1698:b0:1d4:e68c:2eb9 with SMTP id adf61e73a8af0-1d978b1dd36mr3306402637.20.1729684835614;
        Wed, 23 Oct 2024 05:00:35 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3468:366c:e529:6d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f3665sm56598825ad.271.2024.10.23.05.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:00:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	linux-spi@vger.kernel.org,
	shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	lukma@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] dt-bindings: misc: lwn,bk4-spi: Add binding
Date: Wed, 23 Oct 2024 09:00:13 -0300
Message-Id: <20241023120015.1049008-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_050036_835907_2190D505 
X-CRM114-Status: GOOD (  17.55  )
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

From: Fabio Estevam <festevam@denx.de>

Add a lwn,bk4-spi.yaml binding for Liebherr's BK4 external SPI controller.

Currently, the compatible string used for this device is "lwn,bk4",
which is the same as the board compatible string documented at fsl.yaml.

This causes several dt-schema warnings:

make dtbs_check DT_SCHEMA_FILES=fsl.yaml
...

['lwn,bk4'] is too short
'lwn,bk4' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
'lwn,bk4' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
'lwn,bk4' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
...

Use a more specific "lwn,bk4-spi" compatible string for this
device.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/misc/lwn,bk4-spi.yaml | 54 +++++++++++++++++++
 .../devicetree/bindings/misc/lwn-bk4.txt      | 26 ---------
 2 files changed, 54 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/lwn,bk4-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/misc/lwn-bk4.txt

diff --git a/Documentation/devicetree/bindings/misc/lwn,bk4-spi.yaml b/Documentation/devicetree/bindings/misc/lwn,bk4-spi.yaml
new file mode 100644
index 000000000000..7fb86e6abade
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/lwn,bk4-spi.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/lwn,bk4-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Liebherr's BK4 external SPI controller
+
+maintainers:
+  - Lukasz Majewski <lukma@denx.de>
+
+description: |
+  Liebherr's BK4 external SPI controller is a device which handles data
+  acquisition from compatible industrial peripherals.
+  The SPI is used for data and management purposes in both master and
+  slave modes.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: lwn,bk4-spi
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 30000000
+
+  fsl,spi-cs-sck-delay: true
+
+  fsl,spi-sck-cs-delay: true
+
+required:
+  - compatible
+  - spi-max-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        spidev@0 {
+            compatible = "lwn,bk4-spi";
+            reg = <0>;
+            spi-max-frequency = <30000000>;
+            fsl,spi-cs-sck-delay = <200>;
+            fsl,spi-sck-cs-delay = <400>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/misc/lwn-bk4.txt b/Documentation/devicetree/bindings/misc/lwn-bk4.txt
deleted file mode 100644
index d6a8c188c087..000000000000
--- a/Documentation/devicetree/bindings/misc/lwn-bk4.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* Liebherr's BK4 controller external SPI
-
-A device which handles data acquisition from compatible industrial
-peripherals.
-The SPI is used for data and management purposes in both master and
-slave modes.
-
-Required properties:
-
-- compatible : Should be "lwn,bk4"
-
-Required SPI properties:
-
-- reg : Should be address of the device chip select within
-  the controller.
-
-- spi-max-frequency : Maximum SPI clocking speed of device in Hz, should be
-  30MHz at most for the Liebherr's BK4 external bus.
-
-Example:
-
-spidev0: spi@0 {
-	compatible = "lwn,bk4";
-	spi-max-frequency = <30000000>;
-	reg = <0>;
-};
-- 
2.34.1


