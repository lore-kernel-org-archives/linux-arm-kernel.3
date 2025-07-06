Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1456BC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4P9p0H3DiROKsIreFsVIqZyt5QEIdT4Xp+t3xFuytiE=; b=e6yjjL6zJfW7DavCwjXHfmgSQf
	K5lA5S0oXrf0cuGhF0J2gxQn9pZg9vtUl8uLsEAOmbMubtwuUw86fQ0qw5r8hO2oP51xNGcwllgTp
	vAzIHTs/nbLQjVxKeFseEEd1+n3NMPli9RQsXdHptzHxzhl+EYjvtg8EBHU60kK5NRUNeiPs+wdXf
	U84I6yaavPPlpKvRgBvMR37UIX+ptUQVh6kvH8DGvTH9d+Jb81kN/ZOIFwwtOUDGXFIXF3OhvKOJa
	/J80APalboDfOzhLwR2ne1IKU17xeq8Gs7ozfzbYCvAxA1z59lGqkIUpE3zzIQhkV1s6Ngkhr9AWM
	S7CLF8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYV25-00000000iwv-3kV2;
	Sun, 06 Jul 2025 19:28:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUON-00000000fFn-1R0r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A300845E62;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0753DC4CEF8;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=Gyw2ajWXng4ALyk4drR0/SENYcvbJJeZJ2j3hMEMh8Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AB69pOAMg5qiR+2A6FRy0onfjM/umxHcOVsYBqDr2cehtcdWSNIepntK1OxoGJE2J
	 GcfF5zcNz8u4nJ76JrlYTWF3Nm/XxXMqC0If/fqUcEIMwxe42w9+bzypvffvz70fq9
	 mQTQr28vT10gdSf37yQv9Oy4A3nFgcv8zfqTJdyfTQhHvpWMTCU3UmWu9sf+FCZqDL
	 lkNvzqXycPIOMok1vzPH1fYn5dQD+yrdzRojwVp2O9cdmhKwF2OFEOJP7lPGT4PRYF
	 JTuMfnw3QDuztTlMm8KbODF9VtaKhrn438RkZNJAa3dbL0y/q3yJ0RSHMAyG4iDAqP
	 eUTEkGsI6Y9oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4ECC83F0C;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:01 -0400
Subject: [PATCH 05/11] ARM: dts: lpc: add #address-cells and #size-cells
 for sram node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-5-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=2843;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=yvvtJHJXDcnE0guh0XGz0S0J+meX4MaeJw6QQIBdQLE=;
 b=ao040rLyQCrvsptZMb83xw9LeuTKXIy4k1TgT+im38fHu+on8uL8bCw8ocBn0S7ZliPdqArib
 VVGVrgH9vqdCho9A7QSObzsmEWMmF2jiU8ZSDi/TruSF4l4GF6zYW2D
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_114711_441320_1112BB44 
X-CRM114-Status: UNSURE (   8.93  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Add #address-cells and #size-cells for sram node to fix below DTB_CHECK
warnings:
  arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dtb: sram@2,0 (mmio-sram): '#address-cells' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts | 3 +++
 arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi           | 9 +++++++++
 arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi           | 9 +++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts b/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts
index 8fc89fb6eef1e839ad256ae33942e607fed862c6..9d36283efe0f6ea26efedae9f7246c04f00cbdb7 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts
@@ -406,6 +406,9 @@ cs2 {
 		ext_sram: sram@2,0 {
 			compatible = "mmio-sram";
 			reg = <2 0 0x80000>; /* 512 KiB SRAM on IS62WV25616 */
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 2 0 0x80000>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi
index c4422f5870556bd19272b976845cc2b7b5729911..707d22a219d8312381419dba952912b99e2400b2 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi
@@ -24,16 +24,25 @@ soc {
 		sram0: sram@10000000 {
 			compatible = "mmio-sram";
 			reg = <0x10000000 0x20000>; /* 96 + 32 KiB local SRAM */
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 		};
 
 		sram1: sram@10080000 {
 			compatible = "mmio-sram";
 			reg = <0x10080000 0x12000>; /* 64 + 8 KiB local SRAM */
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 		};
 
 		sram2: sram@20000000 {
 			compatible = "mmio-sram";
 			reg = <0x20000000 0x10000>; /* 4 x 16 KiB AHB SRAM */
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi
index 72f12db8d53a7d5e8e297762e89e2c11967c26ab..d138ee7869ff3ad3255ebc454d9b7fbbbf3f495a 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi
@@ -24,16 +24,25 @@ soc {
 		sram0: sram@10000000 {
 			compatible = "mmio-sram";
 			reg = <0x10000000 0x8000>; /* 32 KiB local SRAM */
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 		};
 
 		sram1: sram@10080000 {
 			compatible = "mmio-sram";
 			reg = <0x10080000 0xa000>; /* 32 + 8 KiB local SRAM */
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 		};
 
 		sram2: sram@20000000 {
 			compatible = "mmio-sram";
 			reg = <0x20000000 0x10000>; /* 4 x 16 KiB AHB SRAM */
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 		};
 	};
 };

-- 
2.34.1



