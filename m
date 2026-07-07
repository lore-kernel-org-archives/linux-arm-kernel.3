Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2890C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lh9yzmm47jQRqeSTpuwljg2cNNdryTAreJDOVz1dgpE=; b=yjVToyX4OfLGc/UXF3tkQ/VKKO
	+L5UxM6pCwoKP0tIA+Pxey1JllFv/0IE6i1VwqO+DdyrfQyWP8/NuEjyF21L6+pbZ+4MFmvfgysZr
	zoW5AVDidkRf3o5KiYRurgK8XRfuJG2/GVvJkC5t9eHtkLHVqAzEv1RHJWDCs2V+VGipL4vf+BiqB
	REA73ouaYustomCpkdkEdeMtybAOq6HwrnWNmY+1BUMitMk86eSxQ6+mUdzOw8lt3RcX6eQ16c1eE
	wz50TxnHSB8DocPHSNIsxKeNFiGnYrx+8RO7OD+ziNXtbMe/9ZMDJ6tT3fApaAZrfaU2CRuvfnnZn
	Z58nAfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SO-0000000EfQy-2ICy;
	Tue, 07 Jul 2026 09:51:12 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SF-0000000EfK4-3zKb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Lh9yzmm47jQRqeSTpuwljg2cNNdryTAreJDOVz1dgpE=; b=jhIqfXOnaxLo8rFdr1uyiuIPWP
	M/Aw+jMcJo2hN5ky8rMpkhSjninAGbEt1PPm5ow7qCRpcQAxf6mI+PmTl92YT2lsphjspybU10Afx
	t+EmI3e3Qo+LwGfN9T0dL/lL8RWNaZ2ftvB0RJvVZSEFWRaSuxDIBu/fBYvilDYYbOB5rKgaPu+5B
	k00OxRE+lNjOMGBpbKR7wYynqlzt869atn3n9mJwePvDD27ZMX7aU2B+srrSGVKlqtnqxbyL+afkB
	n2OlKZG1kpLVMeFIX0RlXQfRBhWgA+cCJLPx6SrVfpah73VA8gZ7n+il9szWLoTep0pRG4zn8pm1v
	ZKeVIwow==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SE-000PWU-0u;
	Tue, 07 Jul 2026 11:51:02 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SD-000Ck1-25;
	Tue, 07 Jul 2026 11:51:02 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: add various GPIO hogs
Date: Tue,  7 Jul 2026 11:50:51 +0200
Message-ID: <20260707095057.1745867-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
References: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_025104_148083_4F7DD84B 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Add GPIO hogs for various signals:

- Reset signals not assiciated with a device described in the Device
  Tree (SATA, PCIe, ...)
- Inputs that must never be driven to avoid hardware damage

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 259 ++++++++++++++++++
 1 file changed, 259 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index a79290401551e..431e4ed2a8b86 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -187,6 +187,118 @@ gpioex3: gpio@20 {
 		#gpio-cells = <2>;
 		gpio-controller;
 		vcc-supply = <&reg_vcc3v3>;
+
+		line0-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "NOR_SWAP#";
+		};
+
+		line1-hog {
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "BOOT_SRC2";
+		};
+
+		line2-hog {
+			gpio-hog;
+			gpios = <2 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "BOOT_SRC1";
+		};
+
+		line3-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "BOOT_SRC0";
+		};
+
+		line4-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "EMMC_SEL1";
+		};
+
+		line5-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "EMMC_SEL0";
+		};
+
+		line6-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD2_4_MUX_SEL";
+		};
+
+		line7-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD2_3_MUX_SEL";
+		};
+
+		line8-hog {
+			gpio-hog;
+			gpios = <8 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD2_2_MUX_SEL";
+		};
+
+		line9-hog {
+			gpio-hog;
+			gpios = <9 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD1_MUX_SEL";
+		};
+
+		line10-hog {
+			gpio-hog;
+			gpios = <10 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "ENABLE_FAN";
+		};
+
+		line11-hog {
+			gpio-hog;
+			gpios = <11 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD3_MUX_SEL";
+		};
+
+		line12-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD2_7_MUX_SEL";
+		};
+
+		line13-hog {
+			gpio-hog;
+			gpios = <13 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "SD2_6_MUX_SEL";
+		};
+
+		line14-hog {
+			gpio-hog;
+			gpios = <14 GPIO_ACTIVE_HIGH>;
+			input;
+			/* Reserved */
+		};
+
+		line15-hog {
+			gpio-hog;
+			gpios = <15 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "EC2_SEL";
+		};
 	};
 };
 
@@ -223,6 +335,83 @@ gpioex0: gpio@20 {
 				#gpio-cells = <2>;
 				gpio-controller;
 				vcc-supply = <&reg_vcc3v3>;
+
+				line2-hog {
+					gpio-hog;
+					gpios = <2 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "QSFP_MODPRS#";
+				};
+
+				line3-hog {
+					gpio-hog;
+					gpios = <3 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "QSFP_INT#";
+				};
+
+				line5-hog {
+					gpio-hog;
+					gpios = <5 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "IRQ_RETIMER_1#";
+				};
+
+				line6-hog {
+					gpio-hog;
+					gpios = <6 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "IRQ_RETIMER_2#";
+				};
+
+				line7-hog {
+					gpio-hog;
+					gpios = <7 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "MPCIE_1_WAKE#";
+				};
+
+				line8-hog {
+					gpio-hog;
+					gpios = <8 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "MPCIE_1_DISABLE#";
+				};
+
+				line9-hog {
+					gpio-hog;
+					gpios = <9 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "MPCIE_1_RESET#";
+				};
+
+				line10-hog {
+					gpio-hog;
+					gpios = <10 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "MPCIE_2_WAKE#";
+				};
+
+				line11-hog {
+					gpio-hog;
+					gpios = <11 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "MPCIE_2_DISABLE#";
+				};
+
+				line12-hog {
+					gpio-hog;
+					gpios = <12 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "MPCIE_2_RESET#";
+				};
+
+				line15-hog {
+					gpio-hog;
+					gpios = <15 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "SIM_CARD_DETECT";
+				};
 			};
 
 			gpioex1: gpio@21 {
@@ -231,6 +420,20 @@ gpioex1: gpio@21 {
 				#gpio-cells = <2>;
 				gpio-controller;
 				vcc-supply = <&reg_vcc3v3>;
+
+				line13-hog {
+					gpio-hog;
+					gpios = <13 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "RST_M2_SATA_1#";
+				};
+
+				line14-hog {
+					gpio-hog;
+					gpios = <14 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "RST_M2_SATA_2#";
+				};
 			};
 
 			gpioex2: gpio@22 {
@@ -239,6 +442,62 @@ gpioex2: gpio@22 {
 				#gpio-cells = <2>;
 				gpio-controller;
 				vcc-supply = <&reg_vcc3v3>;
+
+				line8-hog {
+					gpio-hog;
+					gpios = <8 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "XFI1_RET_LOSS";
+				};
+
+				line9-hog {
+					gpio-hog;
+					gpios = <9 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "XFI2_RET_LOSS";
+				};
+
+				line10-hog {
+					gpio-hog;
+					gpios = <10 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "PCIE_1_PERST#";
+				};
+
+				line11-hog {
+					gpio-hog;
+					gpios = <11 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "PCIE_2_PERST#";
+				};
+
+				line12-hog {
+					gpio-hog;
+					gpios = <12 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "PCIE_WAKE#";
+				};
+
+				line13-hog {
+					gpio-hog;
+					gpios = <13 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "X8_PRSNT1#";
+				};
+
+				line14-hog {
+					gpio-hog;
+					gpios = <14 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "X4_1_PRSNT1#";
+				};
+
+				line15-hog {
+					gpio-hog;
+					gpios = <15 GPIO_ACTIVE_HIGH>;
+					input;
+					line-name = "X4_2_PRSNT1#";
+				};
 			};
 		};
 
-- 
2.54.0


