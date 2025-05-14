Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61874C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAj4abHM1OpWEeuXTcJ31rJDcOIG0px0JqDGJYF502A=; b=iGSHsKqQ5QVZw434hn7n0TRW/p
	tSyYu4wBdFM5wzDdwnnMV5yju1a+cwAozlPmP+p96nvyYufzZG/2scNus6kksJ41467H5QDp+ub3N
	0Tr2Bua4+jNFo/Ekk1XdC5S+G5JmE/f3pz5iqxmHC2k41kswZ9qUqYAtEzdfkHZSVPYbEBIZPLT3m
	GF9MfzaoL9xCQD6Akf5ZrlXuk8/66E681/s4yPsOaB6a5AgonttPmcfTdCPdI9vekd1dueN5qYgwy
	f7TPB6/44mL3VHo9VE25qz62DhPtA2V2pCEyOTj2NfmURcmp9dFCuIgM5F5CAPCAOtjZZziAtEwXh
	XoC36ODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF1Z-0000000FlCX-41Sy;
	Wed, 14 May 2025 16:32:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEQ4-0000000FeSD-3O18;
	Wed, 14 May 2025 15:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=GAj4abHM1OpWEeuXTcJ31rJDcOIG0px0JqDGJYF502A=; b=X+j4K81laqk4GcrDwiRlJIesSx
	BRZgFnHf2HxQKw6oJbXMs/1RRdf46hUrSts+fl4f81TEyvobxmr5IMiO92LnZYGP0Wyvjzb4ZU9l0
	fXRPk7Wl/hUDOaQoTQ4r9uJPc4dCpDdNLd62O+Vj6jdQgmYFScCCJnbejHsbADZ7TYX/EHO6rprUZ
	ZBeIyJAg10PhIRA02l8canyrf0wgxQqQ9sY3xsCoZQ3c37cZzvCwnocLgRRtT+3YxWDYIBjZeh3iU
	xyKQN7E1s2fZMjIegLoyQDzl9Yoi/dvhesW8TbnTI7bRRi3B9mMFxmZsUjsCxKaGsMz2BpIu2fFmx
	qECQHZ7A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEPx-0000000CV9X-2xqz;
	Wed, 14 May 2025 15:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 039854A8AF;
	Wed, 14 May 2025 15:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C087C4CEF7;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237983;
	bh=PIseqjeo0I9CQ8TfQjzy3djUSEl3eIkK1NNEhH2P13A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uoz88r7/+kLXFMfH5qMdpsBudDd9ALBtfPPRV/3TSu1GjNr/EvYeCsPWBsZU2nSWS
	 fQDzByhR3wkvSc+LFQ2QJsqlG/bn7pajvd7l8cqCQA/oCyyWOBPWBLXtJn3O7aVgjO
	 anlmVUMi2DMz5ObMLWdix3NT+AcEkggBkz/fvC9ZPGOrnxlQR7hPCzX+ZPURpHFFSp
	 pXIonFenGt95bzyvc/Jh8H0zuZktFVl9BR2fcEV6WqWB5qeC3EK3vo3BuckmPXPOg9
	 Twq1OLZi/Xw+E2XsKkoEhOwjS5InBKVw3X4l7415LR1BgHMyzmJN1bkcGA2jZPTmg1
	 dj4q6UphdWD9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6C0C54754;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 14 May 2025 17:41:14 +0200
Subject: [PATCH v7 13/14] arm64: dts: rockchip: add mipi csi-2 receiver
 node to rk356x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v7-13-7581fd96a33a@collabora.com>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747237265; l=1513;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=n7SsQ0Jm8O3DWkSGx7UsFwouL+EV1n9f6o7pvgBiZes=;
 b=axySYzoXRGz4OoC8UlEodgNCj6d7uVONZ75MRd8GKO6aj4kveNxFHssw7jdeoG8MvlMQrxLVg
 ZB38dUmBS0uAgZwCEs+S+1i7pjTtRnolhx7/Y4o4wdH4ZRBfMdiRWA6
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_165314_082012_887D4D17 
X-CRM114-Status: GOOD (  10.34  )
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

From: Michael Riesch <michael.riesch@wolfvision.net>

Add the device tree node for the RK356x MIPI CSI-2 Receiver.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index e0e4dc85a3a9..a1eab57003f6 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -564,6 +564,33 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	csi: csi@fdfb0000 {
+		compatible = "rockchip,rk3568-mipi-csi";
+		reg = <0x0 0xfdfb0000 0x0 0x10000>;
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
@@ -592,6 +619,10 @@ vicap_dvp: port@0 {
 
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



