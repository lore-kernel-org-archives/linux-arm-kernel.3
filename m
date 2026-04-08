Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD3010F9968
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHj7gjj1D1yA/EFj38EA0iN8+3lz3HIFKmJ7PEWQ+Co=; b=2Bx5QLWLnMetHr37FY5Gjcs1Vr
	p0S/D6nBjSwfb8R+70mz+AMUdkrjvTp913Jkd+oiZqyVMlxlF0xiEsMLFjsIJUEipC71SOZ2ABraY
	hN+NFiC4GxsMICRt2egSnJ58xOrIfLR11D43dyoBd7vLSlFQhraMq6vMo+qipybzIxtLh36ncGzNL
	TVSJTMxYGrNxcs2vCT4rjs6alRZPg+sq/AsrNnqlCZTt/ilzq/kcxQmtzl+wH/Hj4seWo604KkLU5
	g4XMyZDNY5lA92Ck6P6Xbg5mMQEB/bWbyIEPM2Wc6BE16MxPM+IGdmkIYrIeNvy/06mCuVw5zChVR
	AYLyVzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYms-00000009KGL-39eb;
	Wed, 08 Apr 2026 19:42:06 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYmp-00000009KEo-3aQ0;
	Wed, 08 Apr 2026 19:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775677324; x=1807213324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k7GFqr8iVjM9fGnPESeuAJUAMk8q27E6YsZrl96Pn0w=;
  b=hDKM8WzH3Lnh++e0RA/xRrfmDedynbanHEwM85NJJcogi3dn7lceEj6/
   VymC04GXU+s3m7WFfSdIh08I4B7hV3IrIo9Egj/wWzvb6leR+EgclodnJ
   t5OHAcmvw7/ddWPwPL65y/oYNzueXXfjDZif6N73YkOdXS9GeYVcujpJp
   Rv1pzhkIytaMLm76Ba/GXryUnEeUL8Cg7rBjG1c6semXhc/IuDjPBBt24
   QGO96De/qoi4hHZgiry2DvmYsoLoj41u4KRmxWgRWW4/UesCige+4VplN
   vYH0XU8zZQb32QXhqVC7hHycLrE2xpi+jxWsWvyP36l/wFQQO9sEmHQZH
   w==;
X-CSE-ConnectionGUID: /T7hyZCbTOK8XUV2rurv6A==
X-CSE-MsgGUID: 5q/dMyOLS+mdUO/9atQiVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88056910"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="88056910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:42:04 -0700
X-CSE-ConnectionGUID: ZxCq1cQ/T3Kj4nHh+MIksg==
X-CSE-MsgGUID: Zc7l3OXLRPOe5SNMKJ1z6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="222053368"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:42:00 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Dawid Glazik <dawid.glazik@linux.intel.com>,
	Maciej Lawniczak <maciej.lawniczak@intel.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>
Subject: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add nodes for i3c controllers
Date: Wed,  8 Apr 2026 22:34:34 +0200
Message-ID: <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775679285.git.dawid.glazik@linux.intel.com>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_124203_908979_85B63807 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Add the i3c controller devices to the ast2600 g6 common dts. We add all
6 busses to the common g6 definition, but leave disabled through the
status property, to be enabled per-platform.

Originally-by: Jeremy Kerr <jk@codeconstruct.com.au>
Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
v3:
 - add i3c aliases
 - rebase on top of latest tree and solve conflicts
 - as agreed with Jeremy off-list, he said I can take authorship of this going forward
v2:
 - use inline bus representation, without the i3c: label
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 97 +++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index f5641128614f..f986fcbed604 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -29,6 +29,12 @@ aliases {
 		i2c13 = &i2c13;
 		i2c14 = &i2c14;
 		i2c15 = &i2c15;
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
+		i3c2 = &i3c2;
+		i3c3 = &i3c3;
+		i3c4 = &i3c4;
+		i3c5 = &i3c5;
 		serial0 = &uart1;
 		serial1 = &uart2;
 		serial2 = &uart3;
@@ -1066,6 +1072,97 @@ i2c15: i2c@800 {
 				};
 			};
 
+			bus@1e7a0000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e7a0000 0x8000>;
+
+				i3c_global: i3c-global@0 {
+					compatible = "aspeed,ast2600-i3c-global", "syscon";
+					reg = <0x0 0x1000>;
+					resets = <&syscon ASPEED_RESET_I3C_DMA>;
+				};
+
+				i3c0: i3c@2000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x2000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C0CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c1_default>;
+					interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 0>;
+					status = "disabled";
+				};
+
+				i3c1: i3c@3000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x3000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C1CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c2_default>;
+					interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 1>;
+					status = "disabled";
+				};
+
+				i3c2: i3c@4000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x4000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C2CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c3_default>;
+					interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 2>;
+					status = "disabled";
+				};
+
+				i3c3: i3c@5000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x5000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C3CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c4_default>;
+					interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 3>;
+					status = "disabled";
+				};
+
+				i3c4: i3c@6000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x6000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C4CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c5_default>;
+					interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 4>;
+					status = "disabled";
+				};
+
+				i3c5: i3c@7000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x7000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C5CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c6_default>;
+					interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 5>;
+					status = "disabled";
+				};
+			};
+
 			fsim0: fsi@1e79b000 {
 				#interrupt-cells = <1>;
 				compatible = "aspeed,ast2600-fsi-master";
-- 
2.43.0


