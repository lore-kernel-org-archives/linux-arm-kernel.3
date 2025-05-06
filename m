Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C232AC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxT8cr+193Obv8GfGr35buihctxekuhGDSXKGKcSfq8=; b=m/MjtHPJ53ZlICiC4snGPYDQwe
	P6ICSsvSwzESxj0w+g3aAi2gJ2LkaU48awWuqrg+cxbgfS5kjmibJD+CguUYQSnnUcqI61BLwReXN
	h92PiMcYyD2rk8uG6qX8NKt/qbC20f1huAaVdFRvHyvg0DpjnX5HIwsYplswADihrcbwM9a3ox3tl
	I+Mhb+JHMdYyTYGeP4BOzs/7mLEOzybSyH/B1RR97YJhsE+dZuZCQ4eRZBWZm5GNIn3hj4kYV3BmN
	oSv1rMc/o0ekGR7bak2b6VrP2PPybdJjdZrDmlUwmPWaNKRjQqeFZQ/Ec6QX+ND8s6O5CrZznCJuc
	dt6Z2gMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHxm-0000000C0zY-1lZs;
	Tue, 06 May 2025 13:03:58 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFli-0000000BbgI-1LHm;
	Tue, 06 May 2025 10:43:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746528190; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C76y26vKwaGzejYv5+YKfGJ+Fa6w0TyeuU0Y+GpH4blBlSe0Tg+7gA3GpFCRRHvMgKCw9lolyd8E2gSqrv9MTkhuE2VES70/2YmlobnEXvrE85WgkWT3sTKVUjUnB7HDYhjzuSbVjMGSWhftoi6HcCJBvOdd6Y3PJaeKo6eEDxA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746528190; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VxT8cr+193Obv8GfGr35buihctxekuhGDSXKGKcSfq8=; 
	b=laTJFK2K21pkc9+17acb5I5nVw6ELAIAqIRhlnDWq4P1pYwZ21jts28VbrvCaTu+fqEA8EJUO8tpxXGr3A+khwSKHgNo8/KpbGrbxFeXWDWYT++hvsoWVWC9B8t6yBsggc6wC/wo80YhFNwSwM7yx1TvV0COrjp2FDYaFN2jH7o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746528190;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=VxT8cr+193Obv8GfGr35buihctxekuhGDSXKGKcSfq8=;
	b=fKZpePs/wbVR5qQ40+w/8djFfrySApNY+ACkxu2bqKFLYUzMkUirrjdqmtG25Ev5
	xBnmn69OPg0NFwYI9GN2BPf9GJeGlbievAV3NRbZQIAw86wtHbXLRuBH6RfurdS9tMw
	2XOkWASjd3ZPFoDB2W7L5peIQaEyvCoCq5xfIQtY=
Received: by mx.zohomail.com with SMTPS id 1746528189233583.4256418746694;
	Tue, 6 May 2025 03:43:09 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 06 May 2025 12:42:41 +0200
Subject: [PATCH v4 2/5] arm64: dts: rockchip: Add RK3576 HDMI audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-rk3576-sai-v4-2-a8b5f5733ceb@collabora.com>
References: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
In-Reply-To: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_034322_426310_48D7D2F9 
X-CRM114-Status: GOOD (  10.05  )
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

The RK3576 SoC now has upstream support for HDMI.

Add an HDMI audio node, which uses SAI6 as its audio controller
according to downstream.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 335a868a1200493d60d08983281fe5637a20ec61..79800959b7976950fb3655289076de70b5814283 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -413,6 +413,22 @@ scmi_clk: protocol@14 {
 		};
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "HDMI";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai6>;
+		};
+	};
+
 	pmu_a53: pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
@@ -1069,6 +1085,7 @@ hdmi: hdmi@27da0000 {
 			reset-names = "ref", "hdp";
 			rockchip,grf = <&ioc_grf>;
 			rockchip,vo-grf = <&vo0_grf>;
+			#sound-dai-cells = <0>;
 			status = "disabled";
 
 			ports {

-- 
2.49.0


