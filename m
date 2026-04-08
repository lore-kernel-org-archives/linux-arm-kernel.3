Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A467F10F9972
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 19:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4zUBIFw/HF5dirv0NLFw/6PIijmCuYxXH2VDwMiCbM=; b=O3dAMIXcGGmOSrAqo9qB5pRsOm
	At7Tw51K3Sduq/4RzyXUtKpze7x3yIx3YZiFOFQDKNBwxuJFKskq7hn5QARIZHfcgR2nTYSWMJEHX
	umISmvSSVw1iZlsDx3JXyfLzhCly6zG3642tTEj0adoqcSnzB8HBjjgjURlOohLDM2TaLpVzLaRi8
	pb22DEStxQBRI0Ij6eF9pAHEycx7ABEvyjGdUZjOgl4b0K4qXqFVQAy5mWlOQ/h0O3zPWeyFH8mZh
	rQG9qOu4ZfjpyYfYEayYTopotBbKantiRKSfPbeMnK34tKxbqUEAokX6SBflKQPLCIQ3hmSvRdquq
	QJW0eYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYmk-00000009KCW-3Lyi;
	Wed, 08 Apr 2026 19:41:58 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYmh-00000009KBG-3Mmm;
	Wed, 08 Apr 2026 19:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775677316; x=1807213316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1+enQnmuX1LnH5Cl4aiWgRetEzO2ZLiVdEHYf6jTViE=;
  b=KLRrgwOi8p0BD57lDfZcx0bwdqXUxbU8Lh8Oxt5jkiZUa8PWkJZ9w3qP
   S1XJ8o3H9r6CJOi/lIb4b4/7vMLivGiAUVeJVoCreqS7+ubqfN3HDqfMZ
   Y3nB9vqr6cJCELilzXOuxFFvNevTGAtAcpQLB2Nfqb8Dd/y+8OexDERlH
   Qr+vAr5JZATHJ8JYi7Fwc9MXRyzV6yislXejQj1NXIid45aL4fGPseMGu
   do5h6jH22Gy2Mdsr67TWnf8Fo5CBhIqdwQM6wYm8SG4rSBTzG+drrfZK8
   aKcZjj86+kV5Gv4Hppe+7YORzcvqB4XsKR1eVEmI3UyBTFOFzd+6QhWdh
   A==;
X-CSE-ConnectionGUID: Ld71k0IyTPS0AOTHmKABdg==
X-CSE-MsgGUID: dr4WqHJ0RzK7TC0p/8OTHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88056896"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="88056896"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:41:55 -0700
X-CSE-ConnectionGUID: fF6AKzoqTu+53pqR3F15Mw==
X-CSE-MsgGUID: tCjcqbXvQbSX7dUs/GlmFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="222053356"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:41:52 -0700
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
Subject: [PATCH v3 1/3] ARM: dts: aspeed-g6: move i2c controllers directly into apb node
Date: Wed,  8 Apr 2026 22:34:33 +0200
Message-ID: <e50c40a2dfefe3e400abf0aa0bbdec1ca141b00a.1775679285.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775679285.git.dawid.glazik@linux.intel.com>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_124155_861650_E8699761 
X-CRM114-Status: GOOD (  13.01  )
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

We currently have the apb's mapping of the i2c controller space as a
labelled mostly-empty node:

  apb {
    i2c: bus@1e78a000 {
      ranges = <...>;
    };
  }

... and then define the contents of the i2c block later:

  i2c: {
    i2c0: i2c-bus@80 {
      reg = <0x80 0x80>;
    };
    i2c1: i2c-bus@100 {
      reg = <0x100 0x80>;
    };
  }

Krzysztof mentions[1] that isn't convention though, with the top-level
simple-bus being empty and linked via the label. So, drop the label
usage and move the i2c bus definition into the simple-bus node directly
under the apb:

  apb {
     bus@1e78a000 {
      ranges = <...>;

      i2c0: i2c-bus@80 {
        reg = <0x80 0x80>;
      };
      i2c1: i2c-bus@100 {
        reg = <0x100 0x80>;
      };
    };
  }

This will allow us to be consistent when we add new definitions for the
i3c nodes, which would require the latter format.

Link: https://lore.kernel.org/linux-devicetree/c5331cf8-7295-4e6a-ba39-e0751a2c357e@kernel.org/ [1]
Originally-by: Jeremy Kerr <jk@codeconstruct.com.au>
Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
v3:
 - wasn't sure about target tree - picked the one pointed in
	https://docs.kernel.org/process/maintainer-soc.html
 - pick up series after two years
 - rebase on top of latest tree and solve conflicts
 - as agreed with Jeremy off-list, he said I can take authorship of this going forward
v2:
 - new patch: reorganise i2c nodes before adding new-format i3c nodes
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 452 ++++++++++++------------
 1 file changed, 225 insertions(+), 227 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 189bc3bbb47c..f5641128614f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -835,11 +835,235 @@ uart9: serial@1e790300 {
 				status = "disabled";
 			};
 
-			i2c: bus@1e78a000 {
+			bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0 0x1e78a000 0x1000>;
+
+				i2c0: i2c@80 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x80 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c1_default>;
+					status = "disabled";
+				};
+
+				i2c1: i2c@100 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x100 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c2_default>;
+					status = "disabled";
+				};
+
+				i2c2: i2c@180 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x180 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c3_default>;
+					status = "disabled";
+				};
+
+				i2c3: i2c@200 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x200 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c4_default>;
+					status = "disabled";
+				};
+
+				i2c4: i2c@280 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x280 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c5_default>;
+					status = "disabled";
+				};
+
+				i2c5: i2c@300 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x300 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c6_default>;
+					status = "disabled";
+				};
+
+				i2c6: i2c@380 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x380 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c7_default>;
+					status = "disabled";
+				};
+
+				i2c7: i2c@400 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x400 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c8_default>;
+					status = "disabled";
+				};
+
+				i2c8: i2c@480 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x480 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c9_default>;
+					status = "disabled";
+				};
+
+				i2c9: i2c@500 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x500 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c10_default>;
+					status = "disabled";
+				};
+
+				i2c10: i2c@580 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x580 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c11_default>;
+					status = "disabled";
+				};
+
+				i2c11: i2c@600 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x600 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c12_default>;
+					status = "disabled";
+				};
+
+				i2c12: i2c@680 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x680 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c13_default>;
+					status = "disabled";
+				};
+
+				i2c13: i2c@700 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x700 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c14_default>;
+					status = "disabled";
+				};
+
+				i2c14: i2c@780 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x780 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c15_default>;
+					status = "disabled";
+				};
+
+				i2c15: i2c@800 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x800 0x80>;
+					compatible = "aspeed,ast2600-i2c-bus";
+					clocks = <&syscon ASPEED_CLK_APB2>;
+					resets = <&syscon ASPEED_RESET_I2C>;
+					interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+					bus-frequency = <100000>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c16_default>;
+					status = "disabled";
+				};
 			};
 
 			fsim0: fsi@1e79b000 {
@@ -870,229 +1094,3 @@ fsim1: fsi@1e79b100 {
 };
 
 #include "aspeed-g6-pinctrl.dtsi"
-
-&i2c {
-	i2c0: i2c@80 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x80 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c1_default>;
-		status = "disabled";
-	};
-
-	i2c1: i2c@100 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x100 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c2_default>;
-		status = "disabled";
-	};
-
-	i2c2: i2c@180 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x180 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c3_default>;
-		status = "disabled";
-	};
-
-	i2c3: i2c@200 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x200 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c4_default>;
-		status = "disabled";
-	};
-
-	i2c4: i2c@280 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x280 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c5_default>;
-		status = "disabled";
-	};
-
-	i2c5: i2c@300 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x300 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c6_default>;
-		status = "disabled";
-	};
-
-	i2c6: i2c@380 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x380 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c7_default>;
-		status = "disabled";
-	};
-
-	i2c7: i2c@400 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x400 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c8_default>;
-		status = "disabled";
-	};
-
-	i2c8: i2c@480 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x480 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c9_default>;
-		status = "disabled";
-	};
-
-	i2c9: i2c@500 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x500 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c10_default>;
-		status = "disabled";
-	};
-
-	i2c10: i2c@580 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x580 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c11_default>;
-		status = "disabled";
-	};
-
-	i2c11: i2c@600 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x600 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c12_default>;
-		status = "disabled";
-	};
-
-	i2c12: i2c@680 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x680 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c13_default>;
-		status = "disabled";
-	};
-
-	i2c13: i2c@700 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x700 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c14_default>;
-		status = "disabled";
-	};
-
-	i2c14: i2c@780 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x780 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c15_default>;
-		status = "disabled";
-	};
-
-	i2c15: i2c@800 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x800 0x80>;
-		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB2>;
-		resets = <&syscon ASPEED_RESET_I2C>;
-		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
-		bus-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c16_default>;
-		status = "disabled";
-	};
-};
-- 
2.43.0


