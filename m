Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08DBCE8D43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHXTT6DPSiT/3JhYcEkJb7Txb6kvwOVxENetMpoOxqE=; b=sEqEzM1jojxuhsHX3xyJKYksru
	eTyaQs/th6eKy6KgB07cknQapkXHwyM3HCai0WdXUrKK4trqMN2pfsQrLrhYSq2CeG7KTyYVPMcQa
	meeI3pq1wRBNY9jTnPG7g1cF/5TnZ7pPcmQDmWAVi5eaVcNuIsR51hFfJ6jhTx5PjeJwXiimRGn4x
	rOEI4gq1VN0UwWdsw7Jmi2DsrQyCrN02d1R/ljHwXuJrnehEat3caIa8H8DnJVZg5BxtJDnjt00uT
	FFrHFJiVkUusnekOx6Sn1GGVEEJ/O1IYZaohtA0Sw8mcNwWCl8oVO75RTle4aZ2VYw+ssFYYITMH2
	fDuqLT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvbg-0000000CX2y-1FGQ;
	Fri, 14 Nov 2025 15:21:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvbH-0000000CWOQ-3qWn;
	Fri, 14 Nov 2025 15:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=tHXTT6DPSiT/3JhYcEkJb7Txb6kvwOVxENetMpoOxqE=; b=fdil/7yprdQm20bIDSkni8Cc5N
	mvTMNYmsa3vw6TI+CjnAN+jR2c7KB6++pPx5Ho5vrIgjY4JB6JAtfsytqTxwn1isXyvAxC4z3U1Mx
	xcCzhA1U5p9yeWkd7+laE0m+tTpA8Sln2n0V/qSQkTbIyWwVUu4noDZ6Wkx/f6tiIYX/q5rfDkBIW
	1JYEfwogwk1QTlmBgYQheFu+TrY5kNqNbSutikziwIC9Kg6hLs9rzRn3CA6DaDAeJadO5rX+rp/Po
	g7MweaTFn9RgDZvAcrzSEM7vKEjn3dzaRhgVZYqzNbI0y1O4eg4mrwqhQNLJwQ5MHlQRWH/0dr0aR
	r6ytSPuQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvbE-00000009W3b-2qHF;
	Fri, 14 Nov 2025 15:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DA934454C;
	Fri, 14 Nov 2025 15:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E57B1C4CEF5;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133621;
	bh=Zl4Mel46TcR7AjpUnvtEjIgKxbaBwJflcYSmq34rCyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iAfQvPfi5SEADkrlUNoOM6I8Of1LYP0FGLct8zWunHT6+ytKuGxV8cnXyPGEyvXMQ
	 t5jTYgBnFuRUumcwcf7D2AHe4F44j+LxRFhOL7nR8e0GLwuWPWYIgAL49WTzCGN3wO
	 1htSQfWSMwzxcQdVjGPiU0hNwfuenZNJMxFJiL7Ua8So64KaO/1J1bJIJY58OYbgq6
	 Epz3MJxDVjFUXRrx8pUZsyCAIqC4x5M3NAb9tM8Mmas9ZVtSIL2s8Z8d8ERWFfHFJL
	 xN6At0nQ96mcBVN/pLGEDAB9vj07PQzCb+wS2DRnWO5xNT750op7wy3l43WpBnJNVE
	 1PLbFMtQx3LFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE98CCE8D40;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 14 Nov 2025 16:20:25 +0100
Subject: [PATCH v15 14/14] arm64: dts: rockchip: enable vicap dvp on
 wolfvision pf5 io expander
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v15-14-8f4915ee365d@collabora.com>
References: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763133617; l=1721;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=0H9SWagLsWuudSJ0hjW87B9xG48FbT9CuvPeqAKM5fI=;
 b=ON8s1W20TM2jD3yggSPiBMjn3TVdy681hETUmgkXMbCzQ5bIRhnbvJJbaQ2nq4R7R+7KYcocC
 kcQo4gi6jRWDuQiwLMpSjUDm9L/HBnw6KmYYdm+LkgOlG3FcDZKi8dm
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_152033_054801_FDA97CF5 
X-CRM114-Status: GOOD (  11.72  )
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

The Digital Video Port (DVP, the 16-bit variant) of the RK3568 VICAP
is broken out to the PF5 mainboard expansion header.
Enable it in the device tree overlay for the WolfVision PF5 IO
Expander board.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../rockchip/rk3568-wolfvision-pf5-io-expander.dtso  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
index 048933de2943..8cfce71dd318 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/rk3568-cru.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -134,3 +135,22 @@ &usb2phy0_host {
 	phy-supply = <&usb_host_vbus>;
 	status = "okay";
 };
+
+&vicap {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cif_clk &cif_dvp_clk &cif_dvp_bus16>;
+	status = "okay";
+};
+
+&vicap_dvp {
+	vicap_dvp_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_BT656>;
+		bus-width = <16>;
+		pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
+		rockchip,dvp-clk-delay = <10>;
+	};
+};
+
+&vicap_mmu {
+	status = "okay";
+};

-- 
2.39.5



