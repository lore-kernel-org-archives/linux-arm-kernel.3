Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FDACCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 23:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L+nHfvIYCrgROUwGVGZYqdh67rBw+LFFXBTqFw6Ps2c=; b=EauUiMYqzE691yxkFflcZXSVL9
	4RkYIPlqtGFyCK4tYOh2+5UNOEkzhuLFNKBHi9EW5hMfTbdCHgtgVGYQH026kw2OEqupO+X6DHPNv
	t5dTIlN5aQ3pB+EWCM1J2UdX20Q2UXu7A97r3VIzyNdusCKEM+qJSFbpqaeixpPVssMm/kOJ2atPT
	OUwwl3FrMZcTMFWhO5/xZZiC+vcpzF9bKamC3D3e3M5JVXPT8ylUwnV8YPxMM5gAvkJk5BYjZ2VD4
	MSnm3bl0aRQmKH1jafVrm2HoP1pwlMuuFDyxYEXpg3fhZNs/B20+CJui53hKmhEJi00BFsCMtAaFX
	8cPOpMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHrLV-00000004Cex-20DT;
	Fri, 16 Oct 2026 23:28:17 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHrLT-00000004CeB-1v3W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 23:28:16 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-7c03744ef27so119397137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 16:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792193294; x=1792798094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+nHfvIYCrgROUwGVGZYqdh67rBw+LFFXBTqFw6Ps2c=;
        b=ZB2XbTIz5zWppt2XChS85WpnxGlTGOiDj8V7k9PY6wpxIfnLDUpklifvrcHexKEznc
         ukERMFyJ5bqsPe9eBGeImBhFQOK0tQ4mL28JFCIx917HZNeI8jq1RnWpbs3S0e00DGAE
         e1fLEYVmid5gZujTnJssqoURok9R2gNCBJi6eQwV4NGBK1Y1H2Lf6D8AMIYEirVF7joo
         jwZ1kTKKNtPZNR+0SBTQySCQTKFMqUVhRBNu6ofehFJHIQ6iOEg4otkEqBn7tpcl+Kbt
         ZL8fYG4QIBvAeMUDcuV3kWUHIQE73S7P5lVDzG0mX/fMkpL+Z7CtqUZrmbhXsNs1/1pa
         gaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792193294; x=1792798094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+nHfvIYCrgROUwGVGZYqdh67rBw+LFFXBTqFw6Ps2c=;
        b=SIjU2pf0YMuTVSr5dgCYp/+Td8SPVnsJ2Zo0iJGs4i3i/LLuxUTb+C40st7uOX9o/b
         c1v052yn2g0Xpgf0gZbKZjupxNBHrkmpI9TCqdlx8ms/MkKoKjfR1wgf6NvM/rs2rxKa
         pNOKp8h27B7ndUU9kl43dPVRemqHJXaTHR2WTIYIJGWV7kO94KzXErnIbEaOyN7+rpld
         VOhuEGUFe+e5rk/NxU5ADIYtwRGA0LITf++9juKxdz+EBObJqErRPbOjSzw9rf8eGPVG
         /UNiIlwSYDPxmqQ3ur0eIG/g6XGxme46sD+bKBLXzW/wXjQK6ao+HGuXaMAb15O/c1op
         mGlw==
X-Forwarded-Encrypted: i=1; AKwUvBzJBEax++Q1sVnffOiGpm9bdzNpc2rdCjCzESGMLZnGUWr5S+bK+y55699d/Oxw7wwRq+UDh1altyH4mpKkw0jz@lists.infradead.org
X-Gm-Message-State: AFq9FYL1kqk8utN5+BX4y1B1cWDx9KGcYM8TEdZcpUdlnxIKIfrzzuvQ
	/xD5NTAbgaADCvvTbLxAWYrqYKg23o0UQJVP6h88HqUddCmj6n9dDkXeO9jFeg==
X-Gm-Gg: AYBFou1dYKncaRBz/go1hiy5mR4muOt7vO4CcHF2iOq4FpiQ+fNhD71hVLk3i7FhYUT
	ID0wLE3QfGAGaJrKTQVl4gEv8l/IBF6Rd9lH9q7AA3F0hIAGPFwhbT0ivl9PKlsMvguHLJu0Dhj
	iNICKNLvJG5i5pxYgkHIDZlREx7wgjSSPwoX3YOEH3JUOrjnt2FUpt21RScQ18cjd3jWgiwsK69
	Dd8rGetKQ9FjfEPGKfNu9jFlZRuu834dyN9CMLa6OsfJYE20aZOdoB53hoo+qAbTwR7ffry5rOJ
	mQTN8QAgKuaD4m+QzaVkmMn1063xhvmVJwtnjTFqvoClSrw25zmt6StwIYCEHjkomvxBcl7fYll
	1jGDoObxfWYRbIJgMmxdfPWrNbUhN5Fqil6N5n7MX09NwWPpiUZRUxvjMR4cJuvVWLhyKkL7FVy
	bwncmkVE6suS9hkxp1p7gb8ilv/aQk+fhijNPXXQbi1MqPsKkHHj2AzHHgI/VwGPVuAnVPXhvxa
	OOEB5+QjrwAkljDoPLPMQNAEp7MPZlIiA5gbhO8fe8BA9M=
X-Received: by 2002:a05:6102:4247:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7cc3691f50bmr274471137.6.1792193293549;
        Fri, 16 Oct 2026 16:28:13 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4f58bbsm2804299e0c.10.2026.10.16.16.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:28:12 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: nvmem: imx-iim: Allow syscon fallback on i.MX5
Date: Fri, 16 Oct 2026 20:27:59 -0300
Message-ID: <20261016232800.536654-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_162815_534681_255A6EA2 
X-CRM114-Status: GOOD (  10.29  )
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

The i.MX51 and i.MX53 SoC device code reads the unique ID through
syscon_regmap_lookup_by_compatible(). Their IIM nodes therefore need the
syscon fallback so the syscon core can instantiate a regmap.

Allow the two-item compatible sequence for these SoCs. This prepares for
restoring the fallback removed while making the IIM nodes conform to the
binding.

Cc: stable@vger.kernel.org
Fixes: d5b55c35e033 ("ARM: dts: imx: Fix the iim compatible string")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/nvmem/imx-iim.yaml    | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
index bb37d72c9eaa..ebfd947e6800 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
@@ -20,13 +20,17 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx25-iim
-      - fsl,imx27-iim
-      - fsl,imx31-iim
-      - fsl,imx35-iim
-      - fsl,imx51-iim
-      - fsl,imx53-iim
+    oneOf:
+      - enum:
+          - fsl,imx25-iim
+          - fsl,imx27-iim
+          - fsl,imx31-iim
+          - fsl,imx35-iim
+      - items:
+          - enum:
+              - fsl,imx51-iim
+              - fsl,imx53-iim
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -50,7 +54,7 @@ examples:
     #include <dt-bindings/clock/imx5-clock.h>
 
     iim: efuse@63f98000 {
-        compatible = "fsl,imx53-iim";
+        compatible = "fsl,imx53-iim", "syscon";
         reg = <0x63f98000 0x4000>;
         interrupts = <69>;
         clocks = <&clks IMX5_CLK_IIM_GATE>;
-- 
2.43.0


