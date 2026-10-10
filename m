Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EBCCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZGGWiHspaUSLm7YkvfnqPFJNEs8gUx31Fh9NnvvTUo=; b=EgpKVWoaqGj2twLXuQZidWmwQP
	zQSqO0IhqceMg0mKyZETp3IatTy+QJr2ofIQK7/8zceVHyFgLqK7ZK7EiGZP0ieJuC+Ofi9SgtxFn
	gOBRpuGG74CkJav3Pi2/eHYk7kpar2Grv3vAOAIixanrLjs8V9xWTFKiHia3Ylgxs/QL+y7kd2trT
	7Kjz2rjfiUsdfWV0xgQQcw92y3M7Yc5xS2GMmwiST4+F96jX2VVbdO9AAjjwR7vLoAre40g4q+6NU
	9xpPHOV6OUn59quWJaTqfAnvAqcbGTVTc45AahtYJyZX7kd/rGB9/xS6fzSeDLRqnoLu6ytvqBFOB
	/kDgjOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWhe-00000008469-0jr8;
	Sat, 10 Oct 2026 13:01:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgz-000000083NO-0ips
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49e73611928so17241965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637247; x=1792242047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZGGWiHspaUSLm7YkvfnqPFJNEs8gUx31Fh9NnvvTUo=;
        b=IcdhMBUD6HD7k4jtRvKRFdWm76lfnEt9ZkMZyeVg5KqJ5jsv0h4POljO3HPpJ+41fm
         sVtSOYmfPtIMy9Idl51XpRmGRk1EqaxWJA56WUa+2fnzmYC021uGD4Dik9ayaMFjtWnJ
         5SDqN9Me2ERpSTIq3ZA+EQGvxvVQzN5bwrlpUQRVusheQzAXe3rUip8e9wcNVmcJHdw9
         AuuCkysPnSD9q5Et/Ky+gGlgQqDZlIYj7vWudCK/C7+iECT6W99ICUTVzMeZxxCryBVT
         Hr3Mn8edZQKF/HmEGQIaBFk5A/dY6VDs1xg/1rHtiPWYb6mOGWxtgm26eUe+7rhHgCEg
         wTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637247; x=1792242047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZGGWiHspaUSLm7YkvfnqPFJNEs8gUx31Fh9NnvvTUo=;
        b=Ep0ysAtJXHcwLm6ClKqYYKELT+7u0oVD6gc3iPO7mvsT9Q28sWBh6S0s2et5rq8JbU
         UV5P1FRA7mmsxfYu/0UL3/Y7sDNGYgDkYXze2jrrUge0dQ2OjhFXfO4MEqTpGBdoRffX
         ZLALVXL0wCGzXcjENEQyqPZmY9iz7rl6f4uHHarNZycvUGITSJ935nmqzfTZY6phhDXi
         5i3IehE3ODTcoSiGX0iS5/QiEwiRCdPNZWc6krrijzwo7ix4ibSx501rmVBB01+VBCCr
         fpVltRCcx8Ro2YqndzqiuxayWwDwUB8Xr8sKPEDdkmWASMjHWGbCzZ7fBnO2wbityodO
         podA==
X-Gm-Message-State: AFq9FYI0wbwnx3IH5IWmjedx8Wk65QB9jazfAqk9LrdS9knv3X3VX297
	JLv69ZxZ8P+xr4M9vaQ6SvLGrqQA5LFkmm/+3/bcyFrCkZgptOdn8wn5HKU7qY5h+bAMog==
X-Gm-Gg: AYBFou3iMZU/K+EyrNmKag7np+KmxZePILhL8CvLvlTxtl5s4gxrb0jDIBzOIyS7UaI
	aWtwQqvU2s+S8NYwZm5cWS+KChhlcT8OwtaJ1uwUn3SRpjjoJDXrMXdbmzZ0YXxIQengx/2NHrw
	TEZKs3j33277FTUx0+tiEzMAKbXOUumd5lGAAiCB2MI3wNnGwnLRnlEWB3WZDvxZ9ZKEsYwhpUM
	PXmtPZAjvon69N9WgkOQMkCkXctJRaCY2ovbnKK2sPRc91JkQJNcn5ygI/T6puisymTZetQAuRn
	KwECYGp5x31cRrEBAMXc53WrBD3THI8A7H+g47z1HbOkj8ybrvIMK9ySmxV7WCCnROiKrtst1vB
	jfYtXaz/oUwQAmNeHslIIwRaWfRdofg0mm0ZSPsLRNA6gkD+NwY3l0xVNSqfiHIxKdm0HNY3l7g
	Q6KaJbLRIL8u7ISE/WBiFT1dZTYZQbsyhSDZ54EiqxAfV74infGpkXW69SO4HqGKGIDxHSy9KZE
	QmQHQoutDQ/gRqziOxaYhHcm5fCWrsYETLpSQ7BO4ClUC4VFPSYPyQNO+bDPCKWaNdIJu/eBsQF
	+c1Hi5yFxLWngGljzuWDMSAaDP3dkd5b3plWqQ/pjpCKRkBna+EFSH3ae6ciZg==
X-Received: by 2002:a05:600c:810a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a18e3ef100mr78533535e9.0.1791637247192;
        Sat, 10 Oct 2026 06:00:47 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:46 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 19/24] dt-bindings: spi: Add ZTE ZX279128S SPI flash controller
Date: Sat, 10 Oct 2026 13:59:57 +0100
Message-ID: <20261010130024.177503-20-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060051_536538_0EB7669B 
X-CRM114-Status: GOOD (  13.33  )
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

Describe the flash-operation controller and its work and register
clocks.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/spi/zte,zx279128s-spifc.yaml     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml

diff --git a/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml b/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
new file mode 100644
index 0000000000..967d460ec2
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/zte,zx279128s-spifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s SPI flash controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The SPI flash controller of the ZTE zx279128s runs flash operations (an
+  opcode with optional address, dummy and data phases) on one chip select.
+  The data phase can use one, two or four lines.
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-spifc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the SPI clock
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spi@94406000 {
+        compatible = "zte,zx279128s-spifc";
+        reg = <0x94406000 0x1000>;
+        interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_SPI_WCLK>,
+                 <&lsp0crpm ZX279128S_LSP0_SPI_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
+        };
+    };
-- 
2.55.0


