Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D10EFCBD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 07:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCp2IUyZSG3Ta11plRL9Oe3OMExs/bvEcTbIRdbhTkU=; b=Sa2CM+YwVZpmwqIl4kzgWrhbEG
	9jb2N9eQ9yjjACfdPEvo99J8dgyvFfoE8bKNk4Zr8lDnnEy6FqEwNRrfYPm6V+gXFc4bSUz3GiOKK
	35KDpVMD5bFkeT3rs6nWSwZpS/su8zWRy2tfRobZsay3PdhpRFd8rDkvywczrMyqpnb44Cfp6+4LZ
	rpGXJxSCv4S8aSXwymvWuWQrLDixGiXxpIyrXS3dTyQTKwN3Tse5fZza2IjLvEgevi0pGntwZx/je
	E/sYj3VYym3cx83cEAvAPW/+ATy1/GkCb34J7k4ijBNlyqEQPWclWQjYZsv9QQZdsq0yer4fQg+Hp
	SXzf2n5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w221W-00000003Rog-2wyZ;
	Mon, 16 Mar 2026 07:05:58 +0000
Received: from mta-64-227.siemens.flowmailer.net ([185.136.64.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w221L-00000003Rm7-2Oug
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 07:05:50 +0000
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202603160705410eac4f3e07000207e1
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 16 Mar 2026 08:05:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nCp2IUyZSG3Ta11plRL9Oe3OMExs/bvEcTbIRdbhTkU=;
 b=Em3apcim3nacc0cVwHG+50ghzpRjqkyScqAVHKOk86YY7Hss06CSOHMabwFWagDL1snWns
 DlKDyEtoKwKJyWT1kB8ojv2kT7rcMw327pJflYDVMTEBSGuUGgBTBj5nvSdJCVwmj3HEpA6v
 RCa2VobW1ob4KP8GJGF2V8P4QTQxtycpy54p6EtXrf9zsAqWUKT3pZSVYzzHOMrHvTVgRYZ7
 TT6OLjx4svGPRomFz/OmLExK6yclk/xM+fJoloqbue0vgUO/zrxZg0CVn0HbXls6+Qah2Ilr
 hE7fCI5JtfnQgfzz7tnBCxb4v3x04tDtYq46Ic0Bg+JwRo2oo5G+Nlog==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Abraham I <kishon@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-*: Add am64x and newer reset registers
Date: Mon, 16 Mar 2026 08:04:24 +0100
Message-ID: <20260316070429.1545707-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20260316070429.1545707-1-alexander.sverdlin@siemens.com>
References: <20260316070429.1545707-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_000548_233405_5FA7EC30 
X-CRM114-Status: UNSURE (   7.83  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add the reset registers present on AM64x and newer SoCs carrying reset
cause information.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2: no changes

 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi  | 5 +++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 5 +++++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi    | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
index 75aed3a88284d..954130e8f37ba 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
@@ -41,6 +41,11 @@ usb1_phy_ctrl: syscon@4018 {
 			compatible = "ti,am62-usb-phy-ctrl", "syscon";
 			reg = <0x4018 0x4>;
 		};
+
+		rst@18170 {
+			compatible = "ti,am64-rst";
+			reg = <0x18170 0x10>;
+		};
 	};
 
 	target-module@2b300050 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
index 23877dadc98dc..7c94e6e16c069 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
@@ -39,6 +39,11 @@ usb1_phy_ctrl: syscon@4018 {
 			compatible = "ti,am62-usb-phy-ctrl", "syscon";
 			reg = <0x4018 0x4>;
 		};
+
+		rst@18170 {
+			compatible = "ti,am64-rst";
+			reg = <0x18170 0x10>;
+		};
 	};
 
 	target-module@2b300050 {
diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index 1b1d3970888b8..acbc7243cb16a 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -74,6 +74,11 @@ epwm_tbclk: clock-controller@4130 {
 			reg = <0x4130 0x4>;
 			#clock-cells = <1>;
 		};
+
+		rst@18170 {
+			compatible = "ti,am64-rst";
+			reg = <0x18170 0x10>;
+		};
 	};
 
 	gic500: interrupt-controller@1800000 {
-- 
2.52.0


