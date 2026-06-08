Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ABCCD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVfBDie60n2tkYsVA0eLmiW0R8D3OP3qoUkg6UxA748=; b=F1z8Hg6PCUxsMkrg/hY2fWqTti
	+bXL7aBvILtf8cRGK8UOYWTrhAZmUbSCflIiJx+mrGBVlXqQ84LHcPVCR+SRDW3xn/z5RtMKUZ8fj
	eh+jusviMnlFJRJGRzBFvJzRmYeX1Gzp7Hjafbs2JADFQ74oDbnZ0sreJtGVPsU/8jRn1xfZa2JjW
	oPPrTwqOhpizwALkiVlwI4kL0S9IoOe2UWeG0W1mkdVSaJEM8UETwjrIbjEWrQiloA9WIjVmCfnfO
	YYD2GG+9mPdsiRiBz8PLXdJ+9/Y8wfloraYrPTf1fVPBH7lhbO4pBAHUyUh77PQeWNJKYb295ONSQ
	zZdS8Rzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWQ4J-00000002kCg-0bHG;
	Mon, 08 Jun 2026 02:50:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWQ4G-00000002kBr-0CVN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:50:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0c379e8ffso24811435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780887023; x=1781491823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVfBDie60n2tkYsVA0eLmiW0R8D3OP3qoUkg6UxA748=;
        b=gvU9MA0/6CZtRLTrgHQN5tMc9XiCSEghmMLwvCECZ9d9+E/ZY9o5XN2ZeqhnXJ1Lzx
         P70ozo0yW5wYnxPEfybY+5WF/jF2dVeKtwMXyAsugbKcPvXcI2CLgaOYgGZV0PTeaqr3
         dcvTXUkgkKzRns36QYFWLxaybAQE3GPbbDhHRO8l2k/p+QctV1mc6G3FxNqQZhy54FJ2
         FrLGF1xtCXGiQ2k3BEP8PbbTG7I8Eqesa+cfLYoW7QEf5AoLnBjcs2RnOwCOjiogn7z6
         psdaflBTanWuL0CtI6rOc4h3q88BjUylPCKghp2X9nykdygAV0XCjFfyfGpTc07Oqmhs
         oNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780887023; x=1781491823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NVfBDie60n2tkYsVA0eLmiW0R8D3OP3qoUkg6UxA748=;
        b=Zr0mVC3njKVh2yKoa/RlML/v/NrkTxS2M0BeLgcZ5d6s1F9+oKpyoaXiz6UUFZ5QaO
         bxzTiSIciMtH0FbHvEqZLQUBe+DXom+h+HlboPngkAIkE2Dvk82J20vj6lU6qptx7IwL
         s/Hu2/XuoZYaBz3khaAvcs2DxKKeWkUSwluyXqNceQ5qa30y7OXsK/BycRz8NEtafYm4
         KmAt3JWmM6RmHBmuZYZO36wYJUfw42HKwEub/YuI8D/zTSdUbCbvAMymO8wbpaERMUNN
         +tElhxLcsZYZ4hAtKu4PGiMLpZZXxrjMl+Yv+bLp5D9i2Iv0cNvvrdah63ian/2zjiKq
         h2Iw==
X-Gm-Message-State: AOJu0YwDlxVcZcosH+vyCRVGtveXazvdTBZzHYBxM8L/UUzBXWSzlsGB
	H/3VK5hp4LnbCxuZBgB6j3kroFYDfYNIxv+9a+lf3eK5nsPO+Lv2cXp4
X-Gm-Gg: Acq92OEKUGO2FwbjlBRNhl0C04DjqjPztjtqu2CYJf1riIER/3x+IElnOi3ymN01sL4
	ryJ5D4rVuzVa/5CjlzVeykPLZrwLAWabfqNm4+ZKmwR38vr+oNTuyI7IEeIUG/8GuZA2LUd+VbU
	WcBBK7y+O8jo4btvYPpeJmWbca4UG4XuYEcfY6cFk6OTJ2V/cX3MLFWidUz+6Js15uU2/v4G+kH
	1xe5uxECTxCcJhfdohW4qnugbaLWmAnO4+IIXeN5Ijc+FuRkoWwX8gT6TwJxb5ShxVUkE4P2bY6
	0uZP4W+emEYdvWAlY/l+jZZI/UrZlVMNSBLa18uktqq5BXO/fW6tY+7HXsb75D8+//+dq9KldOd
	su0IcCsWSor5qBicWvSffHgQtY6R7AqTQ5NvJLzpay7hwK3dDqk0ZHsWZghWroUad/G0H+lBUpc
	wSAaiyGgjtNZK9tyUnvBcaomBWpluOqEVmjZ3QIOwSUMy6axCqvEfAZrQEcC3i/1OnuDLfO5QHe
	PU4rPQmLnKgXd9DbBM=
X-Received: by 2002:a17:903:1965:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2c1e80edc5bmr144390375ad.32.1780887023133;
        Sun, 07 Jun 2026 19:50:23 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm165745555ad.3.2026.06.07.19.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:50:21 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
X-Google-Original-From: Chi-Wen Weng <cwweng@nuvoton.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: [PATCH v2 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
Date: Mon,  8 Jun 2026 10:50:08 +0800
Message-Id: <20260608025009.1504971-2-cwweng@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260608025009.1504971-1-cwweng@nuvoton.com>
References: <20260608025009.1504971-1-cwweng@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_195024_098570_644E9473 
X-CRM114-Status: GOOD (  13.64  )
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

Add a devicetree binding for the Quad SPI controller found in
Nuvoton MA35D1 SoCs.

The controller supports SPI memory devices such as SPI NOR and SPI NAND
flashes. It has one register range, one clock input and one reset line,
and supports up to two chip selects.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
new file mode 100644
index 000000000000..68e6d79e6b7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Quad SPI Controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-qspi
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
+  resets:
+    maxItems: 1
+
+  num-cs:
+    maximum: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@40680000 {
+            compatible = "nuvoton,ma35d1-qspi";
+            reg = <0 0x40680000 0 0x100>;
+            interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk QSPI0_GATE>;
+            resets = <&sys MA35D1_RESET_QSPI0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+
-- 
2.25.1


