Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19930C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hB5oz3jt9HbdApNy+Qkzl5HYzNK/wz7/ltME20GJbd8=; b=VzCQWsKmMWHs0k8OhNvPV4tmbQ
	pyDoJ1y2optfgdgVBtE/gXGipaZHWL50egsTNklUvcbvzCoRm37W858tB3qZACURwfuBoEgTGf/4X
	ep3cO30Da6z3FcYbxjvVc3NNlVm3aJ1csTwTzq2wiVkG4x6nIaAEfZP9smkM9hNXCU5QbZzIDpu4v
	DOSt8JxXxwZXoYlg24J18QOwhIQQM4wmSDIitDZVRgfKq8WXqiBGxWdpEXkfLDXGTn0nMvAx7WW86
	EqCcPcHe8QoIObn/BTJLF5DqYgpwCwWLIklyuMNzVcN/Qmxo+GGh3PxYG3KpZ98TBBRZOftPvjW4T
	C0vMNSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrgi-0000000GC5V-3e9a;
	Sun, 30 Mar 2025 12:22:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrYW-0000000GBCE-0XYB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 12:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=hB5oz3jt9HbdApNy+Qkzl5HYzNK/wz7/ltME20GJbd8=; b=P0jmem
	QvkAvu44ptj/pm3Don9b1FORQV3KgeTTbD5npI8/e/aq3yOpwCF+WYf8vHl1HWMD
	PTOel7EVWiUQ3OsNFvAmH3XkJ/KRsIkRTXtma4nO8wTWwnUg3hKoGXzxKL0m8x/N
	HURH2w4NY0pFw8MoSvkjfJINcfN/8AriOJZbTzbEin2eXg5nVTwmplVNVQA/2Ni6
	giUDRyoXk6HLqVR9VGfcTtInonNb67eEbRgoBJc7MINhueSIwSheV4kRZG7gMayB
	Lsx5NRTIM5CMb6Z4Hta9FhoWgarZV0+9nVd2xtMzhISLzRAPo5+4HhBBcQqS92pI
	TojpG3w8Hoha5XmA==
Received: (qmail 855832 invoked from network); 30 Mar 2025 14:14:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 14:14:19 +0200
X-UD-Smtp-Session: l3s3148p1@2UIwPo4x7WBtKjBa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	soc@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] ARM: dts: st: fix faulty ohci/ehci node names
Date: Sun, 30 Mar 2025 14:13:26 +0200
Message-ID: <20250330121326.9069-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
References: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_051424_442202_D720EC09 
X-CRM114-Status: UNSURE (   9.43  )
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

They should be named "usb@".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/st/spear1310-evb.dts | 8 ++++----
 arch/arm/boot/dts/st/spear1340-evb.dts | 8 ++++----
 arch/arm/boot/dts/st/spear13xx.dtsi    | 8 ++++----
 arch/arm/boot/dts/st/spear300-evb.dts  | 6 +++---
 arch/arm/boot/dts/st/spear310-evb.dts  | 6 +++---
 arch/arm/boot/dts/st/spear320-evb.dts  | 6 +++---
 arch/arm/boot/dts/st/spear320-hmi.dts  | 6 +++---
 arch/arm/boot/dts/st/spear3xx.dtsi     | 6 +++---
 arch/arm/boot/dts/st/spear600.dtsi     | 8 ++++----
 9 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1310-evb.dts b/arch/arm/boot/dts/st/spear1310-evb.dts
index ad216571ba57..089bd7db55c7 100644
--- a/arch/arm/boot/dts/st/spear1310-evb.dts
+++ b/arch/arm/boot/dts/st/spear1310-evb.dts
@@ -205,19 +205,19 @@ partition@390000 {
 			};
 		};
 
-		ehci@e4800000 {
+		usb@e4800000 {
 			status = "okay";
 		};
 
-		ehci@e5800000 {
+		usb@e5800000 {
 			status = "okay";
 		};
 
-		ohci@e4000000 {
+		usb@e4000000 {
 			status = "okay";
 		};
 
-		ohci@e5000000 {
+		usb@e5000000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index 9b515b21a633..d24146c3c9e8 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -203,7 +203,7 @@ partition@390000 {
 			};
 		};
 
-		ehci@e4800000 {
+		usb@e4800000 {
 			status = "okay";
 		};
 
@@ -221,7 +221,7 @@ button@1 {
 			};
 		};
 
-		ehci@e5800000 {
+		usb@e5800000 {
 			status = "okay";
 		};
 
@@ -238,11 +238,11 @@ incodec: dir-hifi {
 			status = "okay";
 		};
 
-		ohci@e4000000 {
+		usb@e4000000 {
 			status = "okay";
 		};
 
-		ohci@e5000000 {
+		usb@e5000000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 3b6897084e26..76749992394d 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -174,7 +174,7 @@ smi: flash@ea000000 {
 			status = "disabled";
 		};
 
-		ehci@e4800000 {
+		usb@e4800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe4800000 0x1000>;
 			interrupts = <0 64 0x4>;
@@ -182,7 +182,7 @@ ehci@e4800000 {
 			status = "disabled";
 		};
 
-		ehci@e5800000 {
+		usb@e5800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe5800000 0x1000>;
 			interrupts = <0 66 0x4>;
@@ -190,7 +190,7 @@ ehci@e5800000 {
 			status = "disabled";
 		};
 
-		ohci@e4000000 {
+		usb@e4000000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe4000000 0x1000>;
 			interrupts = <0 65 0x4>;
@@ -198,7 +198,7 @@ ohci@e4000000 {
 			status = "disabled";
 		};
 
-		ohci@e5000000 {
+		usb@e5000000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe5000000 0x1000>;
 			interrupts = <0 67 0x4>;
diff --git a/arch/arm/boot/dts/st/spear300-evb.dts b/arch/arm/boot/dts/st/spear300-evb.dts
index 303ef29fb805..7d4e6412d558 100644
--- a/arch/arm/boot/dts/st/spear300-evb.dts
+++ b/arch/arm/boot/dts/st/spear300-evb.dts
@@ -119,15 +119,15 @@ spi0: spi@d0100000 {
 			status = "okay";
 		};
 
-		ehci@e1800000 {
+		usb@e1800000 {
 			status = "okay";
 		};
 
-		ohci@e1900000 {
+		usb@e1900000 {
 			status = "okay";
 		};
 
-		ohci@e2100000 {
+		usb@e2100000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear310-evb.dts b/arch/arm/boot/dts/st/spear310-evb.dts
index ea0b53036f7b..459182210825 100644
--- a/arch/arm/boot/dts/st/spear310-evb.dts
+++ b/arch/arm/boot/dts/st/spear310-evb.dts
@@ -133,15 +133,15 @@ spi0: spi@d0100000 {
 			status = "okay";
 		};
 
-		ehci@e1800000 {
+		usb@e1800000 {
 			status = "okay";
 		};
 
-		ohci@e1900000 {
+		usb@e1900000 {
 			status = "okay";
 		};
 
-		ohci@e2100000 {
+		usb@e2100000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear320-evb.dts b/arch/arm/boot/dts/st/spear320-evb.dts
index 3c026d021c92..6ac53d993cf3 100644
--- a/arch/arm/boot/dts/st/spear320-evb.dts
+++ b/arch/arm/boot/dts/st/spear320-evb.dts
@@ -142,15 +142,15 @@ spi2: spi@a6000000 {
 			status = "okay";
 		};
 
-		ehci@e1800000 {
+		usb@e1800000 {
 			status = "okay";
 		};
 
-		ohci@e1900000 {
+		usb@e1900000 {
 			status = "okay";
 		};
 
-		ohci@e2100000 {
+		usb@e2100000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear320-hmi.dts b/arch/arm/boot/dts/st/spear320-hmi.dts
index 721e5ee7b680..8010918e5257 100644
--- a/arch/arm/boot/dts/st/spear320-hmi.dts
+++ b/arch/arm/boot/dts/st/spear320-hmi.dts
@@ -92,7 +92,7 @@ dma@fc400000 {
 			status = "okay";
 		};
 
-		ehci@e1800000 {
+		usb@e1800000 {
 			status = "okay";
 		};
 
@@ -147,11 +147,11 @@ button@2 {
 			};
 		};
 
-		ohci@e1900000 {
+		usb@e1900000 {
 			status = "okay";
 		};
 
-		ohci@e2100000 {
+		usb@e2100000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear3xx.dtsi b/arch/arm/boot/dts/st/spear3xx.dtsi
index cc88ebe7a60c..f54bb80ba28a 100644
--- a/arch/arm/boot/dts/st/spear3xx.dtsi
+++ b/arch/arm/boot/dts/st/spear3xx.dtsi
@@ -73,21 +73,21 @@ spi0: spi@d0100000 {
 			status = "disabled";
 		};
 
-		ehci@e1800000 {
+		usb@e1800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe1800000 0x1000>;
 			interrupts = <26>;
 			status = "disabled";
 		};
 
-		ohci@e1900000 {
+		usb@e1900000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe1900000 0x1000>;
 			interrupts = <25>;
 			status = "disabled";
 		};
 
-		ohci@e2100000 {
+		usb@e2100000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe2100000 0x1000>;
 			interrupts = <27>;
diff --git a/arch/arm/boot/dts/st/spear600.dtsi b/arch/arm/boot/dts/st/spear600.dtsi
index 6b67c0ceaed9..9a93367445ca 100644
--- a/arch/arm/boot/dts/st/spear600.dtsi
+++ b/arch/arm/boot/dts/st/spear600.dtsi
@@ -91,7 +91,7 @@ smi: flash@fc000000 {
 			status = "disabled";
 		};
 
-		ehci_usb0: ehci@e1800000 {
+		ehci_usb0: usb@e1800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe1800000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -99,7 +99,7 @@ ehci_usb0: ehci@e1800000 {
 			status = "disabled";
 		};
 
-		ehci_usb1: ehci@e2000000 {
+		ehci_usb1: usb@e2000000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe2000000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -107,7 +107,7 @@ ehci_usb1: ehci@e2000000 {
 			status = "disabled";
 		};
 
-		ohci_usb0: ohci@e1900000 {
+		ohci_usb0: usb@e1900000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe1900000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -115,7 +115,7 @@ ohci_usb0: ohci@e1900000 {
 			status = "disabled";
 		};
 
-		ohci_usb1: ohci@e2100000 {
+		ohci_usb1: usb@e2100000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe2100000 0x1000>;
 			interrupt-parent = <&vic1>;
-- 
2.47.2


