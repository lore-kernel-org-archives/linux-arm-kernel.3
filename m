Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A034CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2a/uAq+WStsO8aQx6BMPUzRVm0wlq4SS94ygHqJZbI=; b=JFENQHa5jtKsj+lyhYxEfUBptF
	BiY32goqNGXJjhVT5Stxgv1OTDI28ADz30MfE/yE6Mx1lz7avrvlw/1EYzm6x4CD5w9jJ78vVi0vk
	NYm2Bua4dubDctqx3BR/4D5mhusk/Jbv3H2ULUqfpf1oHmZT4JOxTK3XJb7ce2RmOLDlWK546VxMA
	I0UHXSfg0o/F1wNqo8059SoLCq2Oz6skLhtvq1GlKUCy++X8dbSLg8fguRYq//GtJQ63nBgXTPl6c
	h/SJhlrijUg+DF8K3LIfMoNgx1z0HGRz5TOGbSF/B4Ivs65tGIlwN4KyeBj7Bf2+0k089zfqlLZEI
	P38cB5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGgE-00000009DQw-25zi;
	Thu, 01 Oct 2026 13:18:35 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGgB-00000009DPh-2k3L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:18:33 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso2602430a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790860711; x=1791465511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2a/uAq+WStsO8aQx6BMPUzRVm0wlq4SS94ygHqJZbI=;
        b=VnBxJdbTJWv/fPrHXfTiAjJaKIzVAYonloIxvKabV9oVwYp2o3Pnuvxm2rUYTFMFpv
         L3LRYdJiybUdubLwfoktHLTkiSpVynG+aTFa1YEvNV+ovQjc6nZ9X+Pyrhn6DhoALmpM
         VTHRwrbr6flm3eWEPm6BIBjEQyMdo1MgQu3Vi8+3lcTd/tLMfc8H1xy/Gziy/4tIE2s6
         Xi8VuNPBCjV4LhZuPrhKrod4atjvWnlt77rE5DGsydKYCHIJmSJTE9YUEhQvLinpPHQQ
         DxIjY2Z3VAKOsleizD+bqKBI9cxO1nCaaF1hXScIunggXdR3A9ZY3KIm9A4qu68gDeYT
         ps7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860711; x=1791465511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2a/uAq+WStsO8aQx6BMPUzRVm0wlq4SS94ygHqJZbI=;
        b=vmQiZq2Uqj1tYrEN4PsVFtGaikH6Kj0hKRZnhbenRfsLiJc97jo7vXitaKX1jpTN9X
         mKyR/q7/kqRi7oCwWDrxt8mM8FzdWg0szICOuRFkj4LFIvW4Oh/QyCMk46QZlglp2QRJ
         10RgzaG0JLmKt0+6C7ZxmlBwUShwYOoKTOmt4BE8n+SlSD/cxyw97fhyGJaoLFNNYhhR
         CwVzBqJK9ITFSiAD+kL5NGowXL1KNp2MqxQY5RFgKYqB/T0hHn05qq8vJse8ZCoFKZ00
         9vl0EsX0et7B4JZ15+bkzbqJ2rTO1rOFRA9esd9uznv6LIPCU0OESUOIi1imEz8Ww/Qm
         MrEg==
X-Gm-Message-State: AFq9FYKtYWkY1cjZU7MN1USpNEssUtlrRhcAuOd5IM1WHum0tXQwwxmD
	bLbXXe+PBOjVI7UJDFzRPf1Y5BiUJSLIr1APSEkNq6ctuv5NOCFLro/r
X-Gm-Gg: AYBFou26a9tGmi72vwdOKao9VuFBBpVqxGPHbedXe4DCTNcgdoTw5iDSanHgtKiPFWL
	tnYlvk7JW/q2RlC4EQtK+pryzTPG4Ncq9nx/EflQekpqgcgsjcBmX2mc6NaGFVTwsH5wUvQBFz6
	hhIGyne7TBU3IafX7YhXvstrb3+RuVYLd36zIZ8YVU8L0yxrx0Q4jidKoWiH3SQphOdcYKG4koB
	TyK+5xE81BQMB031S4CMJCTv9aoCj/XQ8Ljldwy0CH4pmCim0ttho7yq2JR/9xWqJqlM2vc7WmF
	2aii4a86vTLJYXAnXwGOWVSxZ7u5C3NhiaSrIpuiAO4gOVQgprWeH38YtZCuy4U8nsv1/c542+K
	zl58qJ3z6Bt/gL8fMWRwIsYrK2wHPr2NuCjzkzqsfffjk+H/xIxTqm7JjZMncmDMJdHtSYNnIba
	UM/uKlXsypQWjguShpvlGVVObBhyWXZPoGHoApmsfT8YhNQwFVjSQgi7yK8GxG9ZEfWzFB6KuQ+
	rVaAQ0Yi6VcWvj745/HYushYiuaA6K25CtL6eqPAspBOIylYng3L0YkK6bL
X-Received: by 2002:a17:90b:5787:b0:3a0:c1de:f720 with SMTP id 98e67ed59e1d1-3a4d197e17emr4062843a91.20.1790860710586;
        Thu, 01 Oct 2026 06:18:30 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46bb550sm5016692a91.5.2026.10.01.06.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:18:29 -0700 (PDT)
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
Subject: [PATCH v2 1/3] spi: dt-bindings: nuvoton,ma35d1-qspi: Add MA35D1 SPI controller
Date: Thu,  1 Oct 2026 21:18:16 +0800
Message-Id: <20261001131818.110028-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001131818.110028-1-cwweng.linux@gmail.com>
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061832_090156_1C528C71 
X-CRM114-Status: GOOD (  14.19  )
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

Extend the existing MA35D1 QSPI binding to also describe the MA35D1 SPI
controller.

The SPI and QSPI controllers are separate hardware IPs. QSPI additionally
supports dual, quad and DTR transfers and a target-mode timeout function,
but these differences do not require additional controller-specific
Devicetree properties.

Both controllers expose the same Devicetree-visible resources and provide
up to two native chip-select signals. GPIO chip selects are supported
through the generic SPI controller binding. Since the MA35D1 QSPI driver
now supports GPIO chip selects, also remove the existing restriction
on cs-gpios for the QSPI compatible.

Add the nuvoton,ma35d1-spi compatible and update the binding description
and examples to cover both controllers.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 41 +++++++++++++++++--
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
index 40965ec5163b..72f2e1e1219a 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -4,7 +4,17 @@
 $id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Nuvoton MA35D1 Quad SPI Controller
+title: Nuvoton MA35D1 SPI and Quad SPI Controllers
+
+description: |
+  The Nuvoton MA35D1 SoC contains separate SPI and QSPI controller IPs.
+  Both controllers expose the same Devicetree-visible resources and provide
+  two native chip-select signals. GPIO chip selects are supported through the
+  generic SPI controller binding.
+
+  The QSPI controller additionally supports dual, quad and DTR transfers and
+  a target-mode timeout function. These capability differences do not require
+  additional controller properties.
 
 maintainers:
   - Chi-Wen Weng <cwweng@nuvoton.com>
@@ -14,7 +24,9 @@ allOf:
 
 properties:
   compatible:
-    const: nuvoton,ma35d1-qspi
+    enum:
+      - nuvoton,ma35d1-spi
+      - nuvoton,ma35d1-qspi
 
   reg:
     maxItems: 1
@@ -33,8 +45,6 @@ properties:
     maximum: 2
     default: 2
 
-  cs-gpios: false
-
 required:
   - compatible
   - reg
@@ -59,7 +69,30 @@ examples:
             interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
             clocks = <&clk QSPI0_GATE>;
             resets = <&sys MA35D1_RESET_QSPI0>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@40600000 {
+            compatible = "nuvoton,ma35d1-spi";
+            reg = <0 0x40600000 0 0x10000>;
+            interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk SPI0_GATE>;
+            resets = <&sys MA35D1_RESET_SPI0>;
+
             #address-cells = <1>;
             #size-cells = <0>;
         };
     };
+...
-- 
2.25.1


