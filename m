Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A49ECD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/512MrEHO7sxLE+hovBiI8TbKkolqHX7zTsKHonXt4c=; b=1wWU/EdI2lrsp0Ne/Cs90T2fqJ
	u/oI7hjzsjROE9ISgjg1+XQYWnoJXnrrZs630z/l/8Rk/oSXH8dvAGhUqgRjyWjNghfDlAlfsKV9F
	KVjsvcdX/OIMR33TLMfa9OAHdSmANsuHSRshxHXV6dnj5+IOBMh6V+D+EAiouKK7pm/4UIi2F2tRY
	VrUOCgMvLGFVKYwtp4gAReUBKNxdD7RHKkXHfhyOhGA6tw5wtSFjyF5+kjMAKEXRKSwRM0v991sLF
	0tTw4iYMu+4b650puPkmMrtvTfTHRiP+zkk3ppZUGtAFCZ8h0xuZvTII7V6HLpl0iWmAGTwq+PxFe
	GavQw+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbTl-000000096YY-20UR;
	Thu, 11 Jun 2026 09:13:37 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbTi-000000096WV-2L4C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:13:35 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8423efd76c8so5021783b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781169213; x=1781774013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/512MrEHO7sxLE+hovBiI8TbKkolqHX7zTsKHonXt4c=;
        b=pmVWGlpsaF/8TJ4gnMgiug38rmiByPLSMXiTraWKVeBWQdYlB52Z1nklUWp1aK2MDj
         lxtX+xvW4TqZudx5FxHxaOi/W3+o8Vws3YUJ030u9AYBB8yfJQFchMgteVuYfFaX77EF
         tg5VPa96+lz1+VcC9Gjgoo5EyBnudERoa89ZERwdfpYAAKYiw51T9WBj642XFE+EK4If
         K/0fZkZjMod0a96EKK5Ys1Z+ifpWhLfpXdS9R/9XB9RMWWtnaw8cWt6W+hx++j5PBBIr
         hLYgh7QZb9JYlxQe4wfNPpawVuBKFCIxLZ9CS3gTVvNgRH/YvSajJLNYKmQBJsd05aIn
         PY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169213; x=1781774013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/512MrEHO7sxLE+hovBiI8TbKkolqHX7zTsKHonXt4c=;
        b=RH4gsaARHLBIRZBJeeO/JQwaZmI12d6890YaYA7z0Kt2gumWQ9cEs66sMotaK+aEan
         K5r/MUA4fpQ8masrWsxPblqMgaLyLE9wJ0NOwlqVl0YHd1hxWzSP7op9hyBeyq0QipHe
         G7NJRv0BLzsuJ29uiecBLf19F9Ql7pRK1nYrVixPnYBcKDWQcNlp2S9u+ZajfMWp1ylN
         LY/FEod+E61HBpkGrr8N0dXPCrDVmjWgH9b6r24HO5U20i+ycK/LHs2k3KmV2tNXubye
         RHfnpa+RGZ98f7d+U+JaSuStgqFTugQAizY6LY++bBBG2L1gWjK3p+XjoBlYDoeDPUIe
         DcjA==
X-Gm-Message-State: AOJu0YwnonBkkyi6uaHO5+DsMqdlfqGLDqASR+DcYP9RsaTRF8WJZWca
	/laOgiEDw+Uo2jbcP5hjHt5H5Bavq+r4WwgGPh+VCqpAQIKcQxka2lCX
X-Gm-Gg: Acq92OH1OTDggsJS7oMVwi6rQA2b54e3yXSA19SWUda0+uwHWfjrexQXB32ZDOVCL9e
	o/lpAc7/L1O1aPx+NDlvw9YibdR2SaI7VZrNGgq0WOBPQaPSXqVQiNoC8EwzWHtuUZ17vISR7ld
	o2aLTXMiDo0CiM/0OjtLy0zg3ysaHetHzEBuEKVrkIYdBLRtUVv2t0BZd01fAf2Nee0yKcMuI9u
	riqhRBHIFHPBOcvO60fUM5dlpeQNYxfSPmWd3fe/V1gEGkfphhmoTgkBtq7bBpTa7DRdxV3Rm/S
	CilCMuNbNUl6YFMuHRCu8AtyxnuX0HCNVN+TtbvqngtiFtJ4f9olpS9/eSKuFwR7toaol+GpwSc
	c+F9LvE9XQhWg7pQZ/Pa61AWFgdCFylXfVI2+Dj0e36kVHrbKWIvrPA4XSsaV230dXc41cRUqNp
	V/Cv97h58ygKB6ySMRqS3CbvD2fM9bGHQxUOAyAmrUm4d0xBfieYwim3e2oOc9thoolg1lpaXWx
	ILU4OM2+94J9UKcQSDAsTuy
X-Received: by 2002:a05:6a00:1d90:b0:841:58b0:82bb with SMTP id d2e1a72fcca58-843367c711bmr2254610b3a.9.1781169213545;
        Thu, 11 Jun 2026 02:13:33 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84338319d4esm1417446b3a.51.2026.06.11.02.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:13:33 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v3 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
Date: Thu, 11 Jun 2026 17:12:45 +0800
Message-Id: <20260611091246.2070485-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260611091246.2070485-1-cwweng.linux@gmail.com>
References: <20260611091246.2070485-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_021334_602505_D561AF30 
X-CRM114-Status: GOOD (  13.14  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

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
index 000000000000..d3b36e612eb0
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
+  - $ref: /schemas/spi/spi-controller.yaml#
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


