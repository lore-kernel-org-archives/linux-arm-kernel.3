Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E03DC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDRpz+WjpZ7sC8EePoSNkoBxCQWB5I873+s6sivp2Vc=; b=atOpVd389hVRdK4+PBO8VOl0rA
	owVVI5orBqGuoN6gnZJA7nVkofxvHr/YtyuX1/xk62iZW6n/E3i83Mq8DYtnrNSf5Cx7zSGQCP4vn
	AJO094fb59b5q5bU9AYfCGDN7jFFbQ1eoZpeO4696CsSlpsNPAwFFZZHnTms4VfPIrQbVhVR1l8lP
	bC2IgRWxTG89h5kfXgcTFduwQy4MuzEYKS9JjppH5Vl5RywsjUByAwWNyfVc89iSK2IbVMN4aG9f5
	BAe5kkLSX0Wqo0LjGhyNptgZsA0PMg3neReyGrErkcr1tC4dTMWbuhsqp9v7mkQJnUG9bEMV/4y0C
	WanBaefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyC6-0000000B9YE-2bmR;
	Wed, 18 Jun 2025 19:11:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRv3z-0000000Ae4h-13G8;
	Wed, 18 Jun 2025 15:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=yDRpz+WjpZ7sC8EePoSNkoBxCQWB5I873+s6sivp2Vc=; b=bUJqgBzNDLj9oiBQEIFtJKtSEV
	78IFKDmiM7Qqd7p7zSpKTlelx52sYTjaKxEYD8Lg8CTdnIcLoDsj+Z5F8L6jnvEXI0LFiUZ7gUjQE
	DYkRZFmjmpbGawZWCyIHR6+6u2vA6woh1kw46+tesy8i2fCtba2L8T46xdxHtjrtKKt9wlXJgHWSo
	1DxYurv87HvNw3Yj2Wi5rxZ10rS66TkgLu8ZxCYdbcDOudDLhyxtk9jGRytiiThMHvKsUOJP13qgA
	t0567StKnUNz+TwWNbfV45xfqfcXxRowUNA38+ndy7f7TXBro9Ebdza6ko/lCt1S0iUIFhGaQxwdA
	MiRA2BKQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRv3u-00000004A1Q-14Bh;
	Wed, 18 Jun 2025 15:50:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A8824AA96;
	Wed, 18 Jun 2025 15:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1766C4CEF8;
	Wed, 18 Jun 2025 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750261850;
	bh=TNMqQ9ig0Rudb1/QNWTgkgtSOUlp1gOt/QsZw37f/u0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dqT3W5wBtuwtVbx97Sjwwgi6BzY1X5PjeY33h2Vw8SmVBprkDroDHyDBW3eqDg4JX
	 Q6B/3bBzRsZkG5oVl3TVNhUzYkL2IMKCmZoUt/zzyy+p3xx9KATUvEeHO7/3SVRMQ+
	 HxrLUCbTHp3KC0ewhDtgfBXvI0jFtham16n5dWsr+YYI/nPqKk6P0VyRjfsk1hWv2C
	 DSmB9Im9aUPFD4HPAaeEdmWrhogN72lrH78sAZrteTGjiwy8eme3kqpj9JH7jRJBuz
	 c8TwtxV+vjYNK/T0zOQJzcnuTol957fcddNcyu0hgOsULeAUEHF2ktplXCWUN/oQBO
	 ACXtdwoz/wpoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E18C7115B;
	Wed, 18 Jun 2025 15:50:49 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 18 Jun 2025 17:38:07 +0200
Subject: [PATCH v9 12/13] arm64: dts: rockchip: add mipi csi-2 receiver
 node to rk356x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v9-12-ace1e5cc4a82@collabora.com>
References: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750261092; l=1648;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=ddLOdVHadRX9CBv2fUjtzIB7CMDsWUeV+RUY6i6krlk=;
 b=oa2ZnPe3H1OmvcZqgSJxMN5QkMzQ6RgbI3/O/NU4lPh1RveOydEnM2tkh2Z/uGb6o466rO5mW
 PaKzUOk5vGuCy0Oxtd9nWof7X3OlRSdf68cudoGJirrt95pYdSXLkSH
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_165054_842229_C11FD3C7 
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

Add the device tree node for the RK356x MIPI CSI-2 Receiver.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index e0e4dc85a3a9..a6956aacad1a 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -564,6 +564,36 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	csi: csi@fdfb0000 {
+		compatible = "rockchip,rk3568-mipi-csi";
+		reg = <0x0 0xfdfb0000 0x0 0x10000>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "irq1", "irq2";
+		clocks = <&cru PCLK_CSI2HOST1>;
+		phys = <&csi_dphy>;
+		power-domains = <&power RK3568_PD_VI>;
+		resets = <&cru SRST_P_CSI2HOST1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi_in: port@0 {
+				reg = <0>;
+			};
+
+			csi_out: port@1 {
+				reg = <1>;
+
+				csi_output: endpoint {
+					remote-endpoint = <&vicap_mipi_input>;
+				};
+			};
+		};
+	};
+
 	vicap: video-capture@fdfe0000 {
 		compatible = "rockchip,rk3568-vicap";
 		reg = <0x0 0xfdfe0000 0x0 0x200>;
@@ -592,6 +622,10 @@ vicap_dvp: port@0 {
 
 			vicap_mipi: port@1 {
 				reg = <1>;
+
+				vicap_mipi_input: endpoint {
+					remote-endpoint = <&csi_output>;
+				};
 			};
 		};
 	};

-- 
2.39.5



