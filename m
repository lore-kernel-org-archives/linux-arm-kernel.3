Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845EBCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 02:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=; b=cIAvHK/3fggIR5N+sNv3rIuydn
	ar4YEPTJDokJP9bfpQLa89kn0lR6Y+GoK/U6xSuXlPe4XKsb1KdFWT6egnv7mob9MIsN0G7nO7Csy
	/n4KSUfn8WFxvF/fLZqjJnqXC0NDburur4p0J2wwKGDwup8NqoR3am1Zcy6VqceNLIP1a7p29T8tt
	IY4He+48fRgOh3ja7xH1/qJqAc7lpwETpUr/62mWGXjI1bVLCgYvYMFwhwkopF4Fly0YJy3wvtKVT
	+ij4t99+PV2vnZpyrpAZNR9VnDtEnSNWWYMr0eNZABxWqcsLTW/yj5gI9DOqaGNJcPu4dc3nsYBx5
	7BQxNMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNHN-000000026FX-421r;
	Tue, 29 Sep 2026 02:09:13 +0000
Received: from mail-pz2-x15.google.com ([2607:f8b0:4864:3b::15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNHF-000000026BZ-1nc4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 02:09:06 +0000
Received: by mail-pz2-x15.google.com with SMTP id 41be03b00d2f7-cc4c3304784so1499673a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 19:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790647744; x=1791252544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=FWT5bfeIAjhDyuP0+tXBfLEHWJvpt/cgxCaP2mC6YtujY+cV4EAuNPetGajToFxCix
         n3ynPt3MOQKm7b3aPTtsaSWUG87xjMEh6Rjan/7sqCT8UpGZt62RqQpLmPIhzfZpIVrD
         +hMZJ4E3cO0d/JBOLOWsFRWqLWM5xVllDV++9x+pNJ8XE7CYWncUlerbp4sDdtir8w9n
         CwwBoTs0eQKKx8ZWZTDnShpwcZCwcBvbSt/mtLqv4G7TD3KZO47EBW1YHFsFuEBy5mi6
         5UMk2vlviBHpKSKSRbvbmSTiPFGTpFlQRMv/xojuvUEGA4+8KS1ow98yy39SN2n6+8t8
         k5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647744; x=1791252544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=f7IN9DQRq3Bkwyr7Yqt52GRjX13ObC5kxORwHOScpCBsNu2rx8cp0wGLjcLzssWbyi
         yGBZ5hVt+B2ZQY/UTCnBuGjrMvHqFSmUMCZMKU95zpYnC5tt+bWat5sBXoJipysoOBKW
         sLmsQYAHJ5v/N313PfojrSKAucU5wt+dAPpbAMGuf5g9Lmy60E6fK6sSQKZUj6cvDl7A
         W9jb/3p+noXJL0a3iySAXetWROvRDhw6fNUkfm06ist3TOmLwwuNBq50Mfbln92vJDmd
         47gm2z52swYnAHN/YbIT2WwBIcE6kBQtcyWXWkyzDp+KVATllJDg2AecZGtHNaKVgj/E
         Wmhw==
X-Forwarded-Encrypted: i=1; AKwUvBxOKTNLbfghHInkstVGgBrUpwmYRTIY3bt7vB1yIBjhk+yMwMsJFEK6l8QRO+KFihAtjSybBoq2jwdCd7M4iZOj@lists.infradead.org
X-Gm-Message-State: AFuF++l2TnhZ/naV6FHUqiI8FZe/2pRDz7k9ElbRjxROSw42wiBFB5HX
	yzAjnY1hGCOJYXmjpLEP3PLq2GuGcqiBDzOOrIOEvw/6FiJ9r9IzCntA
X-Gm-Gg: AYBFou2Q6Bt78uQvH3ywLEBW+A5kVKSTxaEZwnMVxpM0jWtB2TMGNbCazZ7HcZCoCK4
	wKXcXxpLwaSQU5ifYpNxuFuq5pf9UybMfph2u3692qEY115UooqOMzMX+/IGVc00Q3JDfem1Gr5
	UcFVHpvJyWKdzz76QmL/8lbVVLdO/zF/80TC0FVlOgPYJ5dx6/+WEOH/zcQTfbiOil9fzm0AxhZ
	/Z+ck6rl+15iqzI3hwMP6WZNRyVNAhcuJDjw8+fGnuyJmahC6z8hkti7RmZGBfir4+EGijBeSOS
	6FoC6ij4Dsdwb9+D00Q6t74dJxZ6s09T0/8Y0aGJ/Gz6HQxBJfOjwIaXnFfxUknJyMWAuAeWVdF
	t2z2zqoCwgibQI3cnkVRI0Ope/+MlfPjHOQW+WcrKO++udY9Bsc4OD0buGGhxgshWKLT+bqTCyR
	GLkhm3J9b/3DpPsWcb57WDJ6esn5fV8vhVEHUylKhOdPBP5+k3KR1Tjyb3luTb/FbbRCjh9D6D7
	BW5skrY055VSSYb1sfO9mf5hsTgmxOa7dTL9pRu4OKbwPLr/41tTdTxXZEkeQjY
X-Received: by 2002:a05:6a21:e104:b0:3dd:a197:cf1b with SMTP id adf61e73a8af0-3de0e8e18ccmr13432494637.63.1790647744404;
        Mon, 28 Sep 2026 19:09:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796cf39sm5448596a12.32.2026.09.28.19.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:09:04 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
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
Subject: [PATCH v6 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Tue, 29 Sep 2026 10:08:52 +0800
Message-ID: <20260929020854.1282339-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929020854.1282339-1-a0987203069@gmail.com>
References: <20260929020854.1282339-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_190905_496064_9D521AAE 
X-CRM114-Status: GOOD (  17.37  )
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


