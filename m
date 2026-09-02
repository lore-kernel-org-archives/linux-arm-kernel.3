Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1DCC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 04:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QouME4t0AL3EJvqTOq4K6OtxPVBm5ADgp3Dr3ti6+Os=; b=up5wV1YzOU4YWfz+l/eTO7KoX6
	GVF5dlC1jacOb0trof4KEHBT3ESatEmkVFWa3cvKfMvT0d+FJ0PVshUpqBXGnDQxkiFsoxiYoBrPy
	Lphyip6pXURWt44Tt45czzDg4rmyeBYF4ZzB3GU1P68mrXI4KIzrJRrSFwO8noxNkNlP9COC67RfP
	iHraqZRiXcebtQV0nCamXhswho6F/4D2ni7Sy1YaqgdxXHgLapxi2ROWtQ41OPHiAWkQrLbkLjBy7
	SUoOfyqmbyMiNiQCJ6KltlYQ35Py1nqSpfnL1WtUqqLwm9CQdlNjWnYpOu5vpI7Euo/EuJj2yj6GO
	9mAs9n+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cEZ-0000000DkIv-0ja3;
	Wed, 02 Sep 2026 04:05:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cER-0000000DkEi-2Mpe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 04:05:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso3587235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 21:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321947; x=1788926747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QouME4t0AL3EJvqTOq4K6OtxPVBm5ADgp3Dr3ti6+Os=;
        b=w25+FS6B+15TGsb7j29yEB372OFzaN7f8RQ6Oby/DONa+ktW5iuKC/tgbJg51NyXUP
         Xr817Pw++h87ip5DIuqNuqVJZ9IxfXtZDLNnkVu7KI5/mF7BxT9lx8dSf888qbGH+tca
         TbewUI1VXSvQC+5KP1c3T3aX4YW+VRTy31tRJEOVhlXjPl2RAVLiJ2DhME6CcpwvRw/0
         uuH+uvNcVSBuiJeyET6WDxUqoeKtxSQmivU8Kw6BU9Ubg1X8su30UqnzSClQ+Q24+3DI
         HIbEjFMzVuG9QS3YYPELew4l6l+S2M9HzCJzXZdScEqMDOq1+aEapgfrVNqOWYNSbZG0
         wdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321947; x=1788926747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QouME4t0AL3EJvqTOq4K6OtxPVBm5ADgp3Dr3ti6+Os=;
        b=FRUWVFukrZ45TirxVnFrD9SBOySQY14cr8QDzLkaWq0OC9M/zBftyPenQSd9LRqpUt
         6EyKhVsB/ZFfTnKU7HIl5+9zWyVDblQPaFz4fiz2zi/LqFgLv6D7Zy7HP3OQoIAkAGaR
         GABHeLoUcSN28pMpxy8MejzVxWUQ502U/Gk2/Px6DhLSwW5L5+xlCmAgyZER5x05SeXa
         WcPXEycetSFqmoq7IDygFrDFsabUX3FLxqKXWCd54U/U+nh/wSEJldbNjaWY2AdTm4p5
         S8+jPE9lCySkdVdYC2QDTj1ihfgtvypnM9qvclLGlBBoa4GwI5x5oi7UOcFiVC5U5xKY
         0mrA==
X-Forwarded-Encrypted: i=1; AHgh+RqgVTJDcb+27nOLWQT5EOV1e8Us7FGTEqxuTs4UjvWzGpsq/blb1qeIpej5j7JaaeNGqmWISNo+rsmXLWdduBx3@lists.infradead.org
X-Gm-Message-State: AFuF++ljHQabfhSj25AehGAxb0sAWXaaa5L5+bjDILLUyv0zkZYxkdCa
	J8gto4J8/OGWgbmjqdHa6/4Thv+BRi3bpLxFYYxhZ7O6lloWpOXRv1Gh0BUpZfo4Gp0=
X-Gm-Gg: AR+sD12xTfMprkEnd9L6tV0F2alO+lA4R+w4aithxvw3Y27EPNKAEHRx0gnhRPDSOl8
	RN/dbsXjcNAcZsnd/WX668q3uzBn1Y4I8iq8JL6ixULHrgDwV9j0nxsx8FMxhDuZJg2TISJkemZ
	DqXBUDLKshkRe0OLSWuJZxIpw3LOzFb3LleQIK5XvcGegcqiaVMbpYVhHFPbvAjx+PS6zR7aZaB
	tXaLONDdkROxHRSzmxdIOWoo2Gj12JI+qaBWK+LfWFX9Ti0Mg78OC40HFdaeA9jXjU0bteIhAv2
	0NUkk3xnhFKucE6YbpKORsCKJ686+LjnpG+6UF5L/D96T95rS1u0OP3O9v/wVW9vPs1IYnUxmEb
	5JYucKLudQcwYa0lrSOYZKSNowmsS+0gyJTwqIZ8FdCaWxZboD64/v1uTiioj/PYrpU9MfpHuj+
	tTu3VAgHzhYDB7Nvpex5VHuy0qMc/xcZ7CpItHVsL55Uk8rlAOpmKSw5tfalFumcL65oVCJAtFW
	lcTMpSswWojIrSnIxpHrgIaIWRngtkAEbw2n3R3eGzkrr+tkVDq
X-Received: by 2002:a05:600c:46cc:b0:49c:cb6a:1687 with SMTP id 5b1f17b1804b1-49ce5812d7cmr29059215e9.4.1788321946697;
        Tue, 01 Sep 2026 21:05:46 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:46 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:38 +0100
Subject: [PATCH v6 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-1-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_210551_744233_81886668 
X-CRM114-Status: GOOD (  14.60  )
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

The PMU interrupt generation block introduced for the Google GS101 is
actually a standard Samsung Exynos IP block found in older SoCs, such
as the Exynos850, and is not exclusive to Google SoCs. To accurately
reflect its origin, move the schema file to under soc/samsung/
directory and rename it.
Concurrently, add the new "samsung,exynos850-pmu-intr-gen" compatible
string to the bindings. Support for this block is required to enable
power management features like CPU hotplug and idle states on Exynos850
platforms.
Also, move this file under Exynos850 SoC in MAINTAINERS entry.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../samsung,exynos850-pmu-intr-gen.yaml}                          | 8 +++++---
 MAINTAINERS                                                       | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
similarity index 70%
rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index 2be022ca6a7d..df23467d0e0e 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Power Management Unit (PMU) Interrupt Generation
+title: Samsung Power Management Unit (PMU) Interrupt Generation
 
 description: |
   PMU interrupt generator for handshaking between PMU through interrupts.
@@ -15,7 +15,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: google,gs101-pmu-intr-gen
+      - enum:
+          - google,gs101-pmu-intr-gen
+          - samsung,exynos850-pmu-intr-gen
       - const: syscon
 
   reg:
diff --git a/MAINTAINERS b/MAINTAINERS
index eb4e5a61056e..554246ef6d91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11172,7 +11172,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -24297,6 +24296,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0


