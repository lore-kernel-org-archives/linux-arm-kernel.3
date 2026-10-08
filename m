Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93223CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=; b=xTP6BRGrjZk0Bqukda5x/Sta/O
	k34AU8qNbxJ1mOPBOd+MDOquBivRi9jOKTij11RnBDGMh7muvUos/TZQgOI0xgVMsfEz0UoMHOGkJ
	sZ0i7kCaJPV2CIMSMeuCraTu1r5op83sIZgyLK0tY+QuxNu3qZdO/v8VDjzLzG2r2oQ6aXLTtZOai
	abCTZop/aEH7vlrzinGy7TOKlz222hFK68sNoNHwSAyafr+WqFxmTY7q04K5kRhzVqB6lyVlez9Xy
	0E6S1R4MUSOulHU5xV4mp/wwZHVxFU+gfjJ8ShoCe0YM4AQJ9EO26W7754r0CQ79LJi2XvScxdSlK
	OyZw2kaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhHA-00000003c0l-1ren;
	Thu, 08 Oct 2026 06:06:44 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhH7-00000003bym-33vu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:06:43 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so1187090a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439601; x=1792044401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=L5fNH400VgVQzQmrP4vTEmAmbj5e053QatSTU2M7fZyR3xQJx3EuhA/W20vXlNIPF0
         3ngHLeD3igU14BzzuqZ7qVzp5eJjuZKzVOxZzAu2kxIJwli5bVHlsqrFI+12DKG2MvLE
         sASfSi8TccriLD2BPE1QM260C5YQ7qdoQX6X7M3xnEbLVdRrSF1xtpsdZBTCHerrm//k
         TkjfyAjex6ZKSpXJKObE/5hBBB2rzkY//oyCZh+0yBQH1nv4c9IKYxDXtz/AGF6Mm+hU
         T4YPFdacKib3xzTF0q9qi05idpw/VMfUjtyCkQiK4e23bGutVgcOdqVr3WzE61kyw+0V
         HlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439601; x=1792044401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=KqdCX5jz0Lw1+O44LnuFGttWOXXErQCYhhtuDeXojVDk1w0SyikPYiBZo5UHeRE1Un
         Bc5lv+OWVxAoCN1f3q7jY9OihzJv0vbEnjbv4iF/055jeQF59Oue8/KCDLTJo3QoRnY9
         JEQzSDS10djA9+Y18E8arLVOzIlkTIePMA4dFveRo7oXduZVFsAfJvErCFi2hBQkaOHS
         SWagigWqLtBQl+z08CtAc6G6tVvwY1zdv9U5T2q8U1Jw1pOVx3XEobpv3AUD5YSlTsZ/
         Ve9Qho5GXAOZ1fbA65+jONFrFirrweSsop6p/N6PSjUA5YiScB9xR1uqe0zhOjNmrgRp
         Q1SQ==
X-Forwarded-Encrypted: i=1; AKwUvByiZGNnyCUS9IXn9jUn8u/3gJehDHxUyxC3g/zv5I2ApTrGjudyc0O5CjejeKVoJ4mzJpZpA1FI0oh2R1O66cyB@lists.infradead.org
X-Gm-Message-State: AFq9FYIya7eoztXy6rOf7fSWz+wUnnEpYPplLQxmN98QOiNNwnx2z6Ti
	vUbZU3YgjOiHSQkl5u+latWuJjWw+bQil6Dv1WON7bwQKFOZTQOsGJsE
X-Gm-Gg: AYBFou0aqtlcaTNBrp5gByfKKi9FMY0K7pa2IS6HtHO5f4QIdEZ19yVvhtvAYGCtP7B
	h433/nYntUvXKvvkDiETWU+mWsFtIygvt2RVLeIs++LKq9Pcw8ZBhAHaocQeecanVBqKo1SoaCt
	KMf6bsBRUtgB4zcuNbAn2wBkZsDOsL0CqUcjCE/agmIX486aGojzDRCTg7svMb6Bu+HJZmWc7u9
	7+8g13buGoyUOIDadMZYsXDYiE9qbdYtGRi0uOhItD6pKbZ0FoFlCp7fYP+gBEc1Pl38qyCfGPN
	Ce7ZgMQbvNln9hSm2ExXyaEbPwDiT/p+9SYv5dgaVLR4p0utCj6hVTXrDZbfuVvLOSUJ9RBMkDS
	wVpjmvLzgT46tAtGGtdbWA61NcCgZAwSkEuxRcQ4C2E5Z9t3WVoYXQSFEOWzpcLJ+Ku1L+JIYyk
	MmfUfeXyEFutTiEnaCbkNfHEwc5qXS1y/V56OeEUn/IbZIXi0AAPItVAWBCFuI/vclk6GXNDJzU
	xscUk4JfD66s0EFb2BycfQ4axKEVYwb4SvUh38dtPnA8a3QLQ3lb9qD4/owW1Ci
X-Received: by 2002:a17:90b:2241:b0:3aa:fdad:7d73 with SMTP id 98e67ed59e1d1-3aafdad8873mr755187a91.55.1791439600648;
        Wed, 07 Oct 2026 23:06:40 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:40 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Thu,  8 Oct 2026 14:06:26 +0800
Message-ID: <20261008060629.2736806-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008060629.2736806-1-a0987203069@gmail.com>
References: <20261008060629.2736806-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_230641_778993_121B94B8 
X-CRM114-Status: GOOD (  16.77  )
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

The MA35D1 exposes two USB PHY ports (PHY0 and PHY1) managed by the
same hardware block (USBPMISCR register in the system-management syscon).
PHY0 is shared between the DWC2 gadget controller and EHCI0/OHCI0
through an automatic hardware mux that follows the USB ID pin; PHY1 is
dedicated to EHCI1/OHCI1.  Because both ports share the same register
topology a single binding and driver should cover both.

Changing '#phy-cells' from const: 0 to enum: [0, 1] lets consumers name
the port they need while preserving backward compatibility: boards already
using '#phy-cells = <0>' continue to validate and function unchanged.

The two new optional properties:
  - nuvoton,rcalcode: the resistor calibration trim code is determined at
    board design time to match the PCB trace impedance.  Both PHY0 and
    PHY1 values must be supplied together when the property is present.
  - nuvoton,oc-active-high: the over-current detect polarity depends on
    the choice of VBUS power switch.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..1bd22dd0e5fc 100644
--- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
@@ -8,6 +8,18 @@ title: Nuvoton MA35D1 USB2 phy
 
 maintainers:
   - Hui-Ping Chen <hpchen0nvt@gmail.com>
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY for the Nuvoton MA35D1 SoC. The PHY node is a standalone
+  platform device that accesses the USB PHY control registers inside the
+  system-management syscon block via the nuvoton,sys phandle.
+
+  PHY0 is the OTG port whose signals are routed to either the DWC2 gadget
+  controller or the EHCI0/OHCI0 host controller by a hardware mux that
+  follows the USB ID pin automatically.
+
+  PHY1 is a dedicated host-only port used by EHCI1/OHCI1.
 
 properties:
   compatible:
@@ -15,7 +27,12 @@ properties:
       - nuvoton,ma35d1-usb2-phy
 
   "#phy-cells":
-    const: 0
+    enum: [0, 1]
+    description:
+      When 0, the node exposes PHY0 only and consumers reference it
+      with no cell argument. When 1, the single cell selects the port,
+      with 0 for the OTG port (USB0, shared with DWC2 gadget controller)
+      and 1 for the host-only port (USB1).
 
   clocks:
     maxItems: 1
@@ -23,7 +40,29 @@ properties:
   nuvoton,sys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      phandle to syscon for checking the PHY clock status.
+      Phandle to the system-management syscon node providing access to the
+      USB PHY control registers.
+
+  nuvoton,rcalcode:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 15
+    description:
+      Resistor calibration trim codes for PHY0 and PHY1 respectively.
+      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
+      adjusts the PHY's internal termination resistance. Both entries must
+      be supplied when this property is present; when absent the hardware
+      reset default is used for each port.
+
+  nuvoton,oc-active-high:
+    type: boolean
+    description:
+      When present, the over-current detect input from the VBUS power switch
+      is treated as active-high. The default (property absent) is active-low.
+      This setting is shared by both USB host ports.
 
 required:
   - compatible
@@ -42,4 +81,5 @@ examples:
         clocks = <&clk USBD_GATE>;
         nuvoton,sys = <&sys>;
         #phy-cells = <0>;
+        nuvoton,rcalcode = <7 7>;
     };
-- 
2.43.0


