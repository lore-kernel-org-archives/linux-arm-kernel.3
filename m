Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82879103E302
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oew6plTQUglpQ71LtBpSHJEfk84VjfMzOK5mAFR0CRY=; b=tBC9JSEIJiDhK1mSulhlffLdjA
	qMZUvi6VleAoSD3v1IpORy011Ldr/CcToV1ySYveqWkufnEAQFb8qwE19+pMlAMA35luw20x7xOvV
	xilcdPv4AgXMYTrVaA/lrnNT13ZM3rFP06KL38b/QB4G99FoDBhvKEyK27av48O7n7zo6o/9LCFqT
	+/T+o8+hGA3OqfFjZ2I6zzfkKj33X6Oy3RhN3uVqZaisCG8p98nXnY4umY40GIHUncjGuOlLGF6tW
	qXbV+kADIk/W473czz1n95sTvgoqr+KQapvfQ4yDuuYeYZaFp0WU9CKduMqC+yy6rbxABM0uuwuRO
	tU1G4vHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14KE-00000000Wkg-2ofu;
	Fri, 13 Mar 2026 15:21:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Jp-00000000WUX-0kEF;
	Fri, 13 Mar 2026 15:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=Oew6plTQUglpQ71LtBpSHJEfk84VjfMzOK5mAFR0CRY=; b=NpgmRrmbDZz6L+uSswnNnD8IDS
	jms5VIyhoHzGLPce1pmSIRxVovDMREA+/7OBNRcCOiTV1P4n0FLHn3wpLmILWulhdF8CEwzb2E+9N
	uewfMK+Mwv/GyXhJjg++cNmkOR+ITpEwr1Iw/tLA0HKhHMXX44VA4jx+8vijBGdZCCS3UZQE/zw8H
	ZYlkUuA7qb7s6p8u9XuqvbnX4OvyiD3FrrsBZe8pSd7Me1TIyG//CdpWwiYeumdPfWFT5DTNAwkWY
	htkkYa6EoCCdWn2AKeiW7vAl7FUNAD2P9xtr4++nGolYr7QcvByHDGk1kEn4DcDKnvEYMojdAFzKt
	DI6Pl9TA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Jk-00000003fcw-1h8b;
	Fri, 13 Mar 2026 15:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBD0F43E47;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F570C2BC87;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773415246;
	bh=FhTQ5SVdxITPm8tDe0bW/0ZG36G8hCk0e58aJbKwRGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Usqoq4eujdp/ykdqtdOMtfmZZCceIAhKYKuh7KzHk5jzBRbVLuQiF0uGRszoT1z7/
	 VMipIWN3SPKq/rcXOTBcVzRDa1l5ULLW/HHjS0x/j7H5l6UFYJZfyZKsjHuPNfb66i
	 VV8SXyZ/L0Qfs+KZCVovydewPhYnA1R6RCBcqgLILMOLa2/Hj21oaPXRSkvwE0nKNE
	 1hbt41eGXS4vPpCn2CPm+nxzRodSg4ou5VzT7t+2M7/8PVLP+jZU/8FMHbB1T7o0sb
	 wYKNE6gjTAQktjc5rJDBBuooKjipTBFTwEuBITzNe9CsnoJYYY9Z8XizFnfoFV2XwX
	 633Eg1KIKZ7yQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65ADE105F7BC;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 13 Mar 2026 16:20:47 +0100
Subject: [PATCH DONOTMERGE 5/9] arm64: dts: rockchip: add mipi csi-2
 receiver nodes to rk3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v1-5-b3bddf749914@collabora.com>
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773415244; l=2664;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=5oU0klzEB2FubzgZ+1XdUaBRRnzqz5jTIQAtdWBAHeM=;
 b=9XFhFOGOTKJeatU9czWomdBIwqBazjGoUPrY+Ii0pHpmta8bfcJzBj1veZEg0TtAR6BAet7Jz
 J5dzoQVl+6TAGzP/TYqPNvw1PWuktisY7B8caLtSFBLTUez+q0Q4les
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_152048_830118_B10B323F 
X-CRM114-Status: UNSURE (   9.93  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

This patch is discussed over at
https://lore.kernel.org/all/20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com
included here for testing purposes only.

The Rockchip RK3588 features six MIPI CSI-2 receiver units:
 - MIPI0: connected to MIPI DCPHY0 (not supported)
 - MIPI1: connected to MIPI DCPHY1 (not supported)
 - MIPI2: connected to MIPI DPHY0
 - MIPI3: connected to MIPI DPHY0-1 (not supported)
 - MIPI4: connected to MIPI DPHY1
 - MIPI5: connected to MIPI DPHY1-1 (not supported)
As the MIPI DCPHYs as well as the split DPHY mode of the DPHYs
are not yet supported, add only the device tree nodes for the
MIPI2 and MIPI4 units.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 7fe9593d8c19..6c593b0255c3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1430,6 +1430,58 @@ av1d: video-codec@fdc70000 {
 		resets = <&cru SRST_A_AV1>, <&cru SRST_P_AV1>, <&cru SRST_A_AV1_BIU>, <&cru SRST_P_AV1_BIU>;
 	};
 
+	csi2: csi@fdd30000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd30000 0x0 0x10000>;
+		interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_2>;
+		phys = <&csi_dphy0>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_2>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi2_in: port@0 {
+				reg = <0>;
+			};
+
+			csi2_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
+	csi4: csi@fdd50000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd50000 0x0 0x10000>;
+		interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_4>;
+		phys = <&csi_dphy1>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_4>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi4_in: port@0 {
+				reg = <0>;
+			};
+
+			csi4_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	vop: vop@fdd90000 {
 		compatible = "rockchip,rk3588-vop";
 		reg = <0x0 0xfdd90000 0x0 0x4200>, <0x0 0xfdd95000 0x0 0x1000>;

-- 
2.39.5



