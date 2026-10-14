Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED819CC6B26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mD6uhOC25MC0utvblQcaawGrjbm/zqFeoGXg401bJQk=; b=mI92MyhQJEfnuJbejhr3HknCQX
	VZHt16skNvhLHeG4+F28gU1Sp7Kih3sCyB2jFSfeVzHjyy/Hjvu+8S/azFN1b6nx7k3UemmJ315G7
	Rxrg7L4cTJB5vl0AKOTU4IYVmdRLnZZcOhjNz+u9G0hPaexEoXRcx2k/KYSdU//zyK1WjpyTZ+GtV
	APGjSDt8MWiPmDyJxXcIer5k4RO9BsuQhPpsxHB6sycPcpUFkl3LU0QsTQPg6yLQhMHOudDiABeEh
	PS3E4lQT9ADGJHVM9TBmd6Scg0uevaGv04TJaKdPUBdKO/SpYNE1QPcZT3YctnaVoA/6IvGU2zzAf
	+loNoWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtLP-0000000Ek1M-2zXU;
	Wed, 14 Oct 2026 07:24:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKY-0000000EjPl-0mkz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2164222f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962596; x=1792567396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mD6uhOC25MC0utvblQcaawGrjbm/zqFeoGXg401bJQk=;
        b=KVYOf5Kog7J2Lx2mu5Qkb3u0dAFNSM2p6I7XaYIynVmlb4AOJDYgyyGiDGTflo6Hj8
         tb4/KenhgsrDhuHBCGeqkBArLouyQ1wwnIQVMOT0sYeEU/KdJk2NZdYAMl5O9Pc9g7Uc
         66TjNpZiE3Qu0/kEGix1feHklbiVcTdDUU9v+tVYxD3flU1hlUunY+6QzAxPUVj2m1IY
         jg643fwz4vCM8QBsYVIsLTMaLxtk+vjn7chWBRiMOB5UqQZsiVC4qqYbT1J4EjbCwCia
         jGzsu/PAF/G+ZSkjjneNo7QutoPKjhdY242SttiiC2eiILMWphcZ0rviOnsxLtGMVe1D
         S1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962596; x=1792567396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mD6uhOC25MC0utvblQcaawGrjbm/zqFeoGXg401bJQk=;
        b=XBERoSlAuh7JHbQalcFTJmFfgj3WHCTShYcksDCciQVttgsqT4yyzWnqEpy7t8RAtn
         ZsrF0iHfY1GiGZkxaHx3S5X5lGyw+x8mFdpierK4BqoFcFO4j5GMy6GUlDavCsXQT0ji
         EH25ASIaRrenXxz47fbb5wnA8S8hy4AqO0o1PK1O6HlpSxstdPDTegV8ZDRoc+gjrPKR
         iWNgS9i8IhEY+CJonlAW7fuJ26xZAArNevc7DQkLJ92zdJ2FF3y6QPuqJFjulqmIUED8
         8YvJNQqSrBCbZUpAItX1b/t+jAWzDStMss7xEuuywsYkHQX5cmBBlOTwOcPd2dALJ62g
         +f3Q==
X-Gm-Message-State: AFq9FYIpCRCORMHKCeydSYaaW0x5i3FxONQmxMjckWIoGRJcWtGaKLj6
	aRZiWercXzlfoQxM45mAcRlnAJw0VwG9IjOwcT+es89Ioe4RuZ12NDVU4BijxGcfmdSNhg==
X-Gm-Gg: AYBFou1/fnmZFJFBIW0645kcaXhd1/KNUVVLTYMug0oMETjPKh0/ApZ9mf2jepd4yUO
	JII7vqGcUPHTHMLT77ZD1fHoSTBecLyZNz4sz/jrB7p3HBYsquc5axeTSy534MiPdEnF7pgCDgV
	tkI2/A5d49TJeI4a8dpTVJiqqQhSdwMZDtz+2nsIhQX5u6VqNRGIVCNhacLAmAD5/ENNX35TxZ/
	jq7KJtOtVQlhEqsdGPSpJ35zM902vzsI/GE/raGF57peYQskEb0AllxuZ+Vhatq3uaOsENNTSNe
	w7mNPrZeswVBHoClja6T9pG9wQGndkAO+Wfuc8RPjtAmTtPg7nVc1Ym+m6duNg9x15tzJEDoMiv
	HNVH6P4+fOH08pykINANvP/UVKaxY1zVLfKtmXwC99TXshyAw3+/ujkTM5hywY8DDQH0rWq3sOR
	TWQuqZp3Lc/AODtHO/sjKeWLkYCqM0NXkZSheWge8sMvVTDabgpJwpNF31yXDj4Lddk/YoP7MtX
	5Cf/AHCFuvHuoe8O7eNwWGM1EZMgNZdc8AnKUJGelLssucMNLbUYQNOx3nMzv/nRdtRYK72qEbO
	DgjiaI48FvZe8m6Rg9dXdYWpbDhxxjFrYVFKrTF5H2k3wm65VE/pIFdk9HuJDs1DXr5oiRj4
X-Received: by 2002:a05:6000:27c6:b0:48b:11a5:d42 with SMTP id ffacd0b85a97d-48dbacfc1demr18369617f8f.30.1791962596282;
        Wed, 14 Oct 2026 00:23:16 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:15 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/24] dt-bindings: usb: Add ZTE ZX279128S DWC3 controller
Date: Wed, 14 Oct 2026 08:21:01 +0100
Message-ID: <20261014072109.1759502-22-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002322_570472_3C17ABA1 
X-CRM114-Status: GOOD (  14.34  )
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

Describe the USB host integration with three CRM clocks and four reset
bits.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/usb/zte,zx279128s-dwc3.yaml      | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
new file mode 100644
index 0000000000..2fd9fe0cc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/zte,zx279128s-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s DWC3 USB controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has a DesignWare USB3 controller (DWC_usb3 2.80a) with
+  integrated USB 2.0 and USB 3.0 PHYs, used as a host. Its clocks and resets
+  come from the top clock and reset module.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 20 MHz reference clock
+      - description: bus (AXI) clock
+      - description: 32.768 kHz suspend clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: suspend
+
+  resets:
+    description: The four reset bits of the controller and its PHYs, in the
+      order they are released.
+    minItems: 4
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@9100000 {
+        compatible = "zte,zx279128s-dwc3";
+        reg = <0x09100000 0x100000>;
+        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&topcrm ZX279128S_TOP_USB_REF>,
+                 <&topcrm ZX279128S_TOP_USB_ACLK>,
+                 <&topcrm ZX279128S_TOP_USB_SUSPEND>;
+        clock-names = "ref", "bus_early", "suspend";
+        resets = <&topcrm ZX279128S_TOP_RST_USB_B11>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B14>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B9>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B10>;
+        dr_mode = "host";
+    };
-- 
2.55.0


