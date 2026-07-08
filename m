Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B8EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phrqd1lecyMf28t/u+W7zekPmM5RqS/waumL1i8YI0k=; b=Mt1OiWO46yLhE/7pcirZNzFlAP
	LkYU8NwEYhnSvyIfkO3ARxJd9C/bZH6PK0ti0i8WaD+E/lTkuBFq/NE3QZ6wxtLU55fajlGugT9wY
	xmX/eYLFY0GvEdKsxsy1rnZ2fVS+oxEK2xrOB9kdrp8UI4+qBa+qidS42EDOwE5hpsHdrsOcrNUHG
	Km4PfU1vkmF7kryz2jHMTJjMLDFWWqyOcLpFh+O7D/GbCmHknZbFlK/yjsM3w7MBD5VbvLGtiCU+v
	JkqhxkJdAM3hPmGEYw8yP0pYrNWYxxSNVrX3aDgp8uLm7eJknxAigf0YdUUsQ+a6NRdE1x52aJQmx
	IW7OX86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPdg-0000000Guvy-3Q3J;
	Wed, 08 Jul 2026 10:36:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPdc-0000000GutM-3dh8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:36:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so23562705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506980; x=1784111780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phrqd1lecyMf28t/u+W7zekPmM5RqS/waumL1i8YI0k=;
        b=ZdwZicubxGEfpActTPhsMh3/HRcI2FGNXi3Mp2vAq6GHhTDkhJmYxoaZQleAG3GpP6
         eb2wYAOX4bcxRPblCt8VDUO8ixhbQmK3HMAIGFxszJLIRtrTTnZ244KF/h0sd9v5lyGd
         eVAxtb1U9gJtLKtIg6FYZaVXpqBBxK85aml+sP20ScNoUeeROHrhO4IhdytSAsYEHbh7
         Su9MfaC9uwtkdyUCiwA+rrB4qGIItNIZY+MESXGGoipPeD0qtavCSB5dGTnn+5B4fwgq
         U80EpBfMnYZ41VD3quKnnnumFip2nJ7VsSV82hjXUmvZ2JvJAjQw7qyMzNQVsxz9nYAr
         Wcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506980; x=1784111780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phrqd1lecyMf28t/u+W7zekPmM5RqS/waumL1i8YI0k=;
        b=Ba4uTwaB8wJPAX6SfFCOYCMXPvY/F8Fd8gVKQVN8+bqOWlupfEJmz6nsqFsIuOdhva
         vbio/PI9MsEysAOlCuRDoeYoEtKp8twC3XgWSB8l3RJ7n6tHJIexGHMF+MdhTocZHx6f
         yxgNTpxmECCRW7G+E9SUCSXMOuDt0M1acVZEbX7A1I055qnrMALftYNnrtqgEa1C9u2x
         rOqsg7U1T9qOH9cOfXyvzcKzgzL9Rs9lLDV1OUxzA/yD6buryJKYw0wkDMf4G1yF2/z+
         VkmamRIwue5qVJKsh8SxGx9EL4f1kpYrggUf7gCECiYiLyPZsq9DOKerc02F4KrF6TkE
         qH5w==
X-Forwarded-Encrypted: i=1; AHgh+Rrd+nRBEDQWWCy/xbti4+BnBTtXoDsfwJ5FsI2tYmDofs3r/1gWSOx/qjVxXS0S7IzK9V0t+MmlD48OITnFml1v@lists.infradead.org
X-Gm-Message-State: AOJu0Yyne5+f4Ej0qF8GIShILuCHIFyveynwDyGaQ/ZxHsXks4k3KEuY
	UlcvVufWHCpmpIGzI6D1SEWKDmXQ9Il4rLaSBiLITDX0xZ+YjCZYjJB6
X-Gm-Gg: AfdE7cmJX4aDz+xcxRAWagwmgijUYz07cMAYAKPilmcDUnJfltO884clsOuHrGRg0g6
	8uvlEC5tQWeSe2fM12zSNOCsbdUP67ULLurWcMvP54kxOCOOp8wsCR6qZAKp/KpXDoeMi8HROoE
	QkplN9A1OGVkEC9d0moSHHocXdydZGlNhJXQnbrMFdR+R7xvREX5qcqeCVT4FpYLE8GIIpZ6omg
	+FegdckW464wb7UNWzkT52P+ndy23HrheA1VEt2nuGJm/7alFfhsmW7fKVLzUitYFXSH6KMt66T
	J9W8OkQe4hSfFQAm9QvIywYAH7f+5R/Wl1VbKxTtlpiy/bqtm2kiRapzCbLzREinxEiTpjk6Y4U
	Kk/CoEbwxMDlxdemxg2JQy2iUquQOWXc6ZXw4+T65nTeV39suOWVRLw46mwpxuHjwdPeA57C0OM
	Ba/ApiFPj6Z4fVQR5b85tDwHqRI/Tnm6mZOAdPzP92oNtwhL4a3ANIIu6E6PHSOYqIgzqPtrSAg
	A==
X-Received: by 2002:a17:902:ce04:b0:2c9:fc4c:8142 with SMTP id d9443c01a7336-2cce9f79c01mr19599535ad.2.1783506979889;
        Wed, 08 Jul 2026 03:36:19 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9a3sm25987525ad.13.2026.07.08.03.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:36:19 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v3 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Wed,  8 Jul 2026 18:36:05 +0800
Message-ID: <20260708103606.1462960-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708103606.1462960-1-a0987203069@gmail.com>
References: <20260708103606.1462960-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_033621_374121_FE938FA0 
X-CRM114-Status: GOOD (  13.09  )
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

PHY0 is referenced by both the DWC2 gadget and EHCI0/OHCI0 nodes because
the USB0 signal lines are physically wired to all three controllers
simultaneously; the on-chip hardware mux, driven by the USB ID pin,
selects which controller is active.  The PHY framework handles this shared
reference correctly.

OHCI companion nodes are required alongside their EHCI counterparts so
that the EHCI driver can hand off full-speed and low-speed devices that
cannot operate at high speed; without them those device classes fail to
enumerate.

The board files add pinctrl entries for the HSUSB signals (VBUSVLD,
PWREN, OVC) because these lines are routed through multiplexed pads and
must be explicitly configured for USB function.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
 3 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..0a068abda6e0 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>, /* PWREN */
+				       <11 13 9>; /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -151,3 +161,29 @@ eth_phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
 };
+
+&usb_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hsusb>;
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..7f1e6d2a1fc2 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -100,6 +100,16 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>, /* PWREN */
+				       <11 13 9>; /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -153,3 +163,29 @@ eth_phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
 };
+
+&usb_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hsusb>;
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..5a7a39b1b514 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -88,6 +88,14 @@ sys: system-management@40460000 {
 			#reset-cells = <1>;
 		};
 
+		usb_phy: usb-phy {
+			compatible = "nuvoton,ma35d1-usb2-phy";
+			clocks = <&clk HUSBH0_GATE>;
+			nuvoton,sys = <&sys>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		clk: clock-controller@40460200 {
 			compatible = "nuvoton,ma35d1-clk";
 			reg = <0x00000000 0x40460200 0x0 0x100>;
@@ -431,5 +439,62 @@ mdio1: mdio {
 				#size-cells = <0>;
 			};
 		};
+
+		usb: usb@40200000 {
+			compatible = "snps,dwc2";
+			reg = <0x0 0x40200000 0x0 0x1000>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk USBD_GATE>;
+			clock-names = "otg";
+			phys = <&usb_phy 0>;
+			phy-names = "usb2-phy";
+			dr_mode = "peripheral";
+			g-np-tx-fifo-size = <16>;
+			g-rx-fifo-size = <0x100>;
+			g-tx-fifo-size = <256 256 64 64 64 32 32 32>;
+			status = "disabled";
+		};
+
+		ehci0: usb@40140000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0x40140000 0x0 0x1000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH0_GATE>;
+			phys = <&usb_phy 0>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			status = "disabled";
+		};
+
+		ehci1: usb@401c0000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0x401c0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH1_GATE>;
+			phys = <&usb_phy 1>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			status = "disabled";
+		};
+
+		ohci0: usb@40150000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0x40150000 0x0 0x1000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH0_GATE>;
+			phys = <&usb_phy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@401d0000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0x401d0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH1_GATE>;
+			phys = <&usb_phy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


