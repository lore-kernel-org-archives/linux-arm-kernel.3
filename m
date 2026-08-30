Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9B8C61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 18:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4U0BNDYU2UB4eOhplmVYpzX07XscyKMmjV+K/BC4jg=; b=0JmFIHDR9/J7UcVEI+SadTxMJZ
	RZPxN+yYO2y3JOESHZLp5ZjPwLvNr6B9G9NEf2xUdOyg1QI76YsInnhl73hN343Nybeu7To775YSh
	5MfWRcxutusM/t6MBpfS+cv5N1GRHmY2VQ+JW3M9W5xeDGu43N2QWV+vHMG7bSltovVpSoT9J6uvP
	/BEpUbDu7XzvEohKmqnA1pKsEk4YN3AxNBgYG/Tfe4sjvKZCeli+SflBWptti3d9tRWIFru5Qubga
	i1LN2Bpe8Tqzay8nU7N6Yj1rC5F1AzehZCpuOQVv+/04jTdKvzVBMNYs+ponAi0kH/ITzEPja7p+7
	23i22MSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0k9R-00000007zFX-3kNk;
	Sun, 30 Aug 2026 18:21:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0k9Q-00000007zEh-0rQ9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 18:21:05 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cbee846deecso3639913a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 11:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114063; x=1788718863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4U0BNDYU2UB4eOhplmVYpzX07XscyKMmjV+K/BC4jg=;
        b=IQRqxPBtrJ3WXvw80tieNt+1saz+OIDyXCg+u2YWJqrH9aFXTjocnM7S+zJ22K+cqC
         DknK47QLXGbFZVax8lms6WGpifS0SwglMHMmbi3+x81EK8dSaMAQZGoXAnX8h/Vp53xR
         pdSYVAsDVhbQR/sB+AegSlwDC+j374c92bunVkFlKa8mHC+ympoitP+OVTcNMXacPjH3
         nOHU3vmqzRfchWuOIy5gwA9e1Vr8IxP0zLEFtwvRtEPawSLks7S221iEtfTzRo7xkjdg
         Cqsl4wrcNeKBtWu/o1JFIb0Lo9A2GyL1N0vk6e94VyGBk+AFCXR9jfFDgSNt5QLZVKy6
         fwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114063; x=1788718863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c4U0BNDYU2UB4eOhplmVYpzX07XscyKMmjV+K/BC4jg=;
        b=D4Gp7kFDWuimFQVnvuFO/1ktmG95lQyi75LS8AlubhTAqqYyTQagwi3Lduv9tf9Em/
         xn7vy2LlxfCfw0yzf8h4/GJ+OogUdoZf0/FpscY+lyuQySVgGAvzGk2V6ND5eDD+mPj9
         OGMiXgcyAIIULVp3DRtISfxbwTxO0SzDv0S5OganftLakOcbaJ2JRDHrgOkCx+9/y8Nx
         9uU43QGZKhdDoMb4HP+I+9w0Bp2F1/EvyQaE/IYotK6Ii+0g66nvKt99as+gstrEEwKU
         xQ096GhorXa0TaKceRvns+NuAH6O3aqkXmx2QPibdo03pjxiFhMFt3+fASxJobepZqEN
         3t9g==
X-Forwarded-Encrypted: i=1; AHgh+RrwWV+N3waOC6MBF7rgZlVRaxEOX1yXat/Qbe1oc4sh0K8909/X5N7C6TjH/KnG5FG1UKQJWS34S0Bj+hkJrSDO@lists.infradead.org
X-Gm-Message-State: AFuF++ktxUizfyYmbEChRCZTLLDCdpFb1pt+4BX+rweKmsG5kc5IWYPr
	M4X9VnTNWPtUzUFpIOC6xqArDq64dXFz1lcAzdY+Q3fJW2KGqlB/jv9i
X-Gm-Gg: AR+sD11JLQrHQV1IiA9zGMo+nfU1PDvl6IX0ooalTARoAHAaTbwh9LxXm8sPmHfiUJC
	Pg+nTWUMfzZgvYxnih5cvF+z7FTi9rEzXZo/enVT3zFD9upuE3QsdwFID9VLbVbVDszStDph3hI
	J9Q0VXjAQ87YoebUWaL0y9jYQa1Qfxq2MfTEITplEDxmqbN2hl55WIvVCiztUEGRhjEVwGi4WL4
	U4lt+DYZsfZV89YO3DVT5S03DYc+tr3QSnLs0pfHzkq8OWMQAgi2YWJ0hvtwQhYwFx3wbPwGpxL
	39AJVLhuguS74Oigbd1r6TcbKbqPWjs5W8OIOL2QAVITm0n7f/ZnbHuigCnm6PTpT4WJtt+2Z9w
	0SuLECe92sW4ROxli37jSJu1bu1MTMvC6YoNkLtpFTBlrZjk4gCTCyy56qL9DQBtVlwNHNbU6t5
	6+nNASvG6yM67Pg8/a8dlTUal6JSCnErDjrWuxjiFuBMGY+hhmwFDIDLGTvGWl5BdZ8szonhTPD
	osrvFtcR4Ck4ap5vQ==
X-Received: by 2002:a05:6a21:4784:b0:3d3:ae50:97c8 with SMTP id adf61e73a8af0-3d3ae509971mr20102216637.21.1788114063191;
        Sun, 30 Aug 2026 11:21:03 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm21619480eec.17.2026.08.30.11.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:21:02 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Sun, 30 Aug 2026 23:50:36 +0530
Message-ID: <20260830182036.284736-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_112104_254505_A3E219C0 
X-CRM114-Status: GOOD (  15.69  )
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

Add the device tree for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART console, and
MAC0 connected to an RTL8211F Ethernet PHY.

The MAC0 RGMII RX delay configuration was validated on hardware.
The RTL8211F requires its internal RX delay for reliable operation,
while an additional TX delay is not required.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6b68671f9379..b109491d5c8f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-altrad8.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000000..aa623f0ca36c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model = "ASRock Rack B650D4U BMC";
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "bmc";
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		status = "okay";
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot@0 {
+				reg = <0x00000000 0x000e0000>;
+				label = "u-boot";
+				read-only;
+			};
+
+			u-boot-env@e0000 {
+				reg = <0x000e0000 0x00020000>;
+				label = "u-boot-env";
+			};
+
+			kernel@200000 {
+				reg = <0x00200000 0x00800000>;
+				label = "kernel";
+			};
+
+			rofs@a00000 {
+				reg = <0x00a00000 0x02000000>;
+				label = "rofs";
+				read-only;
+			};
+
+			rwfs@2a00000 {
+				reg = <0x02a00000 0x01600000>;
+				label = "rwfs";
+			};
+		};
+	};
+};
+
+&mac0 {
+	status = "okay";
+
+	/*
+	 * The RTL8211F provides the required RGMII RX delay. No additional
+	 * TX delay is required for this board.
+	 */
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
-- 
2.47.3


