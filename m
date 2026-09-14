Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D7EC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVUZrYg+XX3ftKTmbZ6y3GjBx4YY/KKIzTtukvscq4w=; b=DbbvidgIJLsCUwkW64sN4k/44c
	p3QUCuuMQkGnaKAwGlhi8+XO3oqB3ze1GulD8zKQMRfXH0BCWpl8JUgXl8swwoviRbd8KqaS57+Y9
	X5epr9tkKGyo2QgvXh7yBoRMZDvtf+0MChlk1zc11pnyClRdU26DG4/KiTyUJdDYIs3boTDvjdktM
	qFpLpzAG3nw9RwB9qOKWiGspBl4LZUXF7sH8vrd3A+vG55WskJrfq3LKoqxRRmfJZlhWiLktIT6fm
	HBZNgRHjndRuowO8C5PSVMrN7ypkUOunLlOsohYp83Bsf0/yvJO4FjzGWLkLlvvskIcdIU4lQpOUx
	5kZLhoqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xDv-00000002G7O-0WyN;
	Mon, 14 Sep 2026 03:19:15 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xDq-00000002G51-2t7i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:19:12 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db22383fe8so10048225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355950; x=1789960750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVUZrYg+XX3ftKTmbZ6y3GjBx4YY/KKIzTtukvscq4w=;
        b=cmbMOetUw8KSbrXFV8g9HjNF0Y+/8YydVSojcGammjrbeeOrdMt8ocoCQjobrq6mOw
         U8qaMMilLznnd36/zY0pxfyINQctGfiYurnjm820ZTLhB/VgyKDMJGBOorQHKwpIYnuB
         GMxgtp+oOAf+FSQQoAqnDgL/EfcQ5l6Az15HEdYmmx6LypGcTx91i023n+rMQ8MVcSde
         uLgPiFnwbYmf18qgc0ufyWa/14YNOGzk5ef+UpfVdRO/hIji+UJNUgEjlC+PMQZnLpzd
         5PDYwmifTi2I11tWeu49UNWsePlNwtzcptm78YEOMkFuSw5Tw8ikNyQ9B4CbTh97pRVH
         pvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355950; x=1789960750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVUZrYg+XX3ftKTmbZ6y3GjBx4YY/KKIzTtukvscq4w=;
        b=L9+nZF5gz8fWP0QgxnG8xULfEsHTxzeXeNKnIDr+8UtGqSFNbyCs43KuoixzmT6BPX
         UgXjV1+77dqoOB9p//6vAhpah3nfXdPFhqAs6ISLMWRq24ZUI7/vC6DBJLjsPrjKWORJ
         QQWqNLvHpVOb4w45cy4K3+oISKVFWWjVqoI8Ks8AaXl1+dK9AWIyexpRoAbmUgG8Rriv
         5J5pbk1zWb0GrbvyYqCy9c/okTIpupxGu25Xp/pcp5T9pqpSnjZM7nfosAzoWKzFMRt1
         VfKBLMRiAnUFLMr78qxOXg9m8xSlSGRjwf9dcWd2f9JpvhRO9qEOq+wdBdR2XDnH3nTn
         GMBA==
X-Forwarded-Encrypted: i=1; AKwUvByCvGjucRP5YcacbdSnzLhLlVX1o6V7mO8hqp8UD0Btfg6fuyRMYvfwG8jrG8TX1gt1S+H98UiClLSN4DUzNdOS@lists.infradead.org
X-Gm-Message-State: AFuF++m3BlhxJDv6R68VKmRTX+G59DVvWVRLnRYwonxikYNDKqUTVtw5
	/Hpl33TJ/hlqhPs2sDogCkSZPzWbiyA9SIMjZOlQwm/vw2F7pKNRLPKi
X-Gm-Gg: AYBFou2x3TnlOP1b1WTUk/BjaMpt85VxWs8f3bMy0BpfM/2lyKfhyzgs5G2frFoOhyM
	YyuTbqGyB49EgpRYrEGoaG6iPzAg5Fwb+XOFgsLZXb3G6XdKmHXsvN+CLNX832BE4opMYrcdvem
	vmngwF+0lFW9R0FafEly2YFd968tNV1HnmO8jrnSbs2cg/8HG3bueUCbjEE5Zym1vImTJ7o3k1w
	/4vlpiD1NyXPPgSHiUwt+R70J7z1Ie6Qc6wf+uR8thRruGctsrdR/jDKJ+1AHuWe1ivbhPIpk9v
	mQQ8z3+Z5bW4kUr+aBKYr4UTv1hL9rxn/Qp63KNntLzgB7bH8IRBI/NfAQ4DdNEjWie1BeJ2C1m
	GiJVAbQ2BYcd2Jkq+uSV73qvyldqJFFAugUHyS7AOgrsenTYiF28OdfCFNRkSQnsFrYmhCScc8b
	/gQ+KfnHpxB8/vsVy0fGcHSUDPyN+tTlxHvFPy8N2VMd/M0Y+XDBeJnF695sKx6gL6lbXyqLjfa
	yxc8PwjepyBG2NoyLBtUDwrU7+KNMCMHB3WwX7K5UTyQxSWmpfDm4WIEos3K8k=
X-Received: by 2002:a17:902:d582:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2dd6c6db2e8mr18390955ad.12.1789355949721;
        Sun, 13 Sep 2026 20:19:09 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm41355145ad.48.2026.09.13.20.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:19:09 -0700 (PDT)
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
Subject: [PATCH v5 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Mon, 14 Sep 2026 11:18:57 +0800
Message-ID: <20260914031859.385224-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031859.385224-1-a0987203069@gmail.com>
References: <20260914031859.385224-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_201910_740554_96BFE592 
X-CRM114-Status: GOOD (  16.66  )
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
    board design time to match the PCB trace impedance.
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


