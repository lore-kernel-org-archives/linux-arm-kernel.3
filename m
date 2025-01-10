Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3108E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jlu2z2pHdwrGgG2KP5sY+xg4s8F2B2cTQIqPiS7nzHw=; b=jR/1GgLvPsUBxs9MJMxd/3aaUM
	RN9Z7ZH/iUE+80zX/d9lwdtB9tt0/6+3jvctXPv+WuO0TFgV/cAT8rl+UeoVzuAZrZJ4e5qLbRhAt
	m8ALEK/thAKn4Y0wWg2gOvUqS+swbauLQyO+VTKMoba6HSOHQqKYm4GAxCL7bABRPvrtKvXf+uaiQ
	SqogySrLVesSNKsNnm84Hpp9Gg+Ss18e42A6vOGvMAfU3AnN8SiE7tj3D5zGyUKnUcmk0Yt3PlFCZ
	Rz2GsJMpQaXrxQCZuDVW9uFEmsQHdY+tuc2gCxtpNlKiaQycXh3FOEXS9z62lV37t2rwUZGMpEKXD
	jXECwV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBu3-0000000EsQn-15wu;
	Fri, 10 Jan 2025 10:06:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBre-0000000Ervu-0cKT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:03:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385eed29d17so995411f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 02:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736503416; x=1737108216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jlu2z2pHdwrGgG2KP5sY+xg4s8F2B2cTQIqPiS7nzHw=;
        b=33xH0ZwRgNhC5VMPhDkGlQBvUButyGfDK8Ev82ll+nrCGfS4u/Ci9QEW8jxrtDt35f
         4M9SCQBohWbTPK3uR++EGAiXNKrEqCqA1Byk4gxeGZ2sjJXdXu7MdwQ9uqIfVsyKfmLv
         6SGHmnoEhnvi/ni98R/xa7lDIt537CeK5f8fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503416; x=1737108216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jlu2z2pHdwrGgG2KP5sY+xg4s8F2B2cTQIqPiS7nzHw=;
        b=c2uGAGR5Bxs9H7HZ43SzQiYozZzGlSXak6Dizz4qgy7DM56mvFi63gWouJTl/b9Pjk
         hLgvKsf9ZiZCh97/zNexvfcYCAC5vYyTiwggBxkq6oQ75QJR78QD+95EgE5j/D1FpxFw
         65HQwRNqgGE5DDk1tIgKWW3AgQ8NNOGHlHq736chkJgnR1OGENvaKpldnlQk1QYWELZ8
         owGZCNt70vpl2n5makaEPVpmKvNCNmgMAHK3xYaE9Gm6CKMDegXLGj4LdwhiJX5gHw8p
         z6nvIsZyPr7sCmhwM5p9kuWGQn6ykuppS4TO1hgCVKfCUl9eeowaYDWBJKcOuLC6O2Wj
         po0w==
X-Gm-Message-State: AOJu0Yy2D5YlQqNy5VIJ5gJTlR7kVxBHuHvsMpI2xv2nUXvLp7RoXpki
	WShysJBEIGE8PkEBub5AxOwvvrasUU/8rZ/1kZjvdu676BergYdbVLVdLzQ8ndY=
X-Gm-Gg: ASbGncvC9bZ4KqszOfwAEx6dEWeXvAJ81wHf7gJyG/FkuOe06PlT7ssrxrGG2FLGteh
	Pib5aSEgka3WyeCKklhywFePHiqdpvTbASJ2e5QE5bEn92WuJcz0WgMYAQAw+tqxvvz0klih0Va
	p8ktSp1tmobMea35bpBSf4k6XV5/7Q6wn5nUiby2HckWfyH+A8SNWHk2warM0lNDvPyDZUVLWia
	Zdy9I6ooT8XK7LSl38sZI6g47FLlUlB8UHHiGqMPG3SHCgqvA7G5Q+VdYvOf4FBfclW8HKRjopK
	qdwgKmCke559HbV94CisIEl7bD6kg6vocz5DixHuR2Umd9/9xnF+dw==
X-Google-Smtp-Source: AGHT+IHyEAHWU5ly3eyj+DcRzpVdOPzllhfmOMWBbwpJQcUozRmuiIObKmwQNUj7Xey7hrqWhL/MZA==
X-Received: by 2002:a5d:588a:0:b0:385:fc32:1ec6 with SMTP id ffacd0b85a97d-38a87355087mr8406629f8f.50.1736503415656;
        Fri, 10 Jan 2025 02:03:35 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d085sm4198483f8f.13.2025.01.10.02.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:03:35 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	afd@ti.com,
	Romain Naour <romain.naour@skf.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [PATCH v5 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
Date: Fri, 10 Jan 2025 11:03:31 +0100
Message-ID: <20250110100331.1642242-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110100331.1642242-1-romain.naour@smile.fr>
References: <20250110100331.1642242-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_020338_186520_D2260B3C 
X-CRM114-Status: GOOD (  15.01  )
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

From: Romain Naour <romain.naour@skf.com>

Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
(CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
provide refclk through PCIe_REFCLK pins.

Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
module's PAD IO Buffers.

Using "ti,j721e-acspcie-proxy-ctrl" imply to use use "Proxy1"
address (1A090h) instead of "Proxy0" (18090h) to access
CTRLMMR_ACSPCIE0_CTRL register:

  CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)

So use "syscon@1a090" for acspcie0_proxy_ctrl node.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Romain Naour <romain.naour@skf.com>
---
With this patch, we can remove "HACK: Sierra: Drive clock out" patch
applied on vendor kernel for BeagleBone AI-64:
https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b

v5:
  - update the acspcie0_proxy_ctrl node address to use really use the
    "PROXY" register implied by ti,j721e-acspcie-proxy-ctrl compatible.

  https://lore.kernel.org/linux-devicetree/begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl/

v4: no change

v3:
 - update "acspcie0_proxy_ctrl" compatible to "ti,j721e-acspcie-proxy-ctrl"
   since this property is specific to j721e variant.

v2:
 - use generic style comments
 - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
 - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
   ACSPCIE buffer and its functionality is the same across all K3 SoCs.
   (Siddharth Vadapalli)

   "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
   J721E and all other K3 SoCs.
   For example, see:
   https://lore.kernel.org/r/20240402105708.4114146-1-s-vadapalli@ti.com/
   which introduced "ti,am62p-cpsw-mac-efuse" compatible.

   The same compatible is reused across all K3 SoCs:
   https://lore.kernel.org/r/20240628151518.40100-1-afd@ti.com/ "
---
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  5 +++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index fb899c99753e..741ad2ba6fdb 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -859,6 +859,11 @@ &pcie1_rc {
 	num-lanes = <2>;
 	max-link-speed = <3>;
 	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
+	/*
+	 * There is no on-board or external reference clock generators,
+	 * use refclk from the ACSPCIE module's PAD IO Buffers.
+	 */
+	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 };
 
 &ufs_wrapper {
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index af3d730154ac..bc016c551710 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
  */
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-cadence.h>
 #include <dt-bindings/phy/phy-ti.h>
 #include <dt-bindings/mux/mux.h>
 
@@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
 			reg = <0x4140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		acspcie0_proxy_ctrl: syscon@1a090 {
+			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
+			reg = <0x1a090 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
@@ -979,8 +985,8 @@ pcie1_rc: pcie@2910000 {
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 240 1>;
-		clock-names = "fck";
+		clocks = <&k3_clks 240 1>, <&serdes1 CDNS_SIERRA_DERIVED_REFCLK>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
-- 
2.47.1


