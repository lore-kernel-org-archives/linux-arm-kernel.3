Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BD6C3ABAD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsJ0uu0+k5q97j0fojNsiTYMw+kcsIPUow5pYeDRNeA=; b=PLcRY+RVRcHmp61EGslvb8LJOV
	BThYxCMIsOh7RhQWoEv/aYDyAVRauSUcWI8sw+b3HFaACazckUMzJUf9u0e4xxNNNFpCiVBzwgZPX
	L+pMgdsSuuZNUdX0KT2shxCEqoXTS2w7XHpLEDBnWRvOD21jgAWRCxr0z8zEKy3df8qsAsKhem0gt
	5MyxnoTdtugKrkYbIz+lzq0wyNpEIA0vRAsdD8ELiaC7vsHR8lfP5+n86C/Zzlk+HmMjbh4yNvaOB
	kvQmhvlrSlhuYbb1y2mRSHUCvJvNAI+xwwGp18VysLFA7x4u6uFWdt/6hRKX4EDsOtzp798Yvn2GD
	8X5/xlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoJ4-00000001k8Y-2eJu;
	Fri, 02 May 2025 11:11:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoBa-00000001ihR-0TYB;
	Fri, 02 May 2025 11:04:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746183833; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZcFVGoEOKZ6opSPiRm58lBwy31HbQCD7AArR7Py7RK4KmyDZ81Eg5bQxKHai4PJoD9U2c2FTUgNQXapsi0Ymoqzo46WvxlAgISKboR5bxphl4dxbw20Ei0pgwX9ktK7AOFBPiYlmnBimEKyNBQSPGAdKQedkv1TnQ0K3ZotIF7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183833; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KsJ0uu0+k5q97j0fojNsiTYMw+kcsIPUow5pYeDRNeA=; 
	b=kNDhVEp72aLlVqsrQvzKOBRWP7q4GpO0ue6cT8+kWl/FaCwIPDgTWfyrLqDFw7hhCHuYjYqNLOfsI38bq4lEXcUDdyZk8Fm7fAZHI4Pl/YzoZ1leQSk37G7qU5uEnQitsxuGJt5zhHYZWJeyrGWIUraOybfl7X8r37MyGgx2+K0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183833;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=KsJ0uu0+k5q97j0fojNsiTYMw+kcsIPUow5pYeDRNeA=;
	b=E4Y2QTv1+WRePRFi8E1hKzIUehShpcAAhtEGPNPAm+Ja6v+brMxfgOBGuIT/kdaI
	qD6vC11jwDIRgIuS9liO5AM7dqrMVRIbsuoPdPM6c30FP72K1+W3lKjpBqRyPdNpnZJ
	HisSr4IT1/fc//dSqJRXxTMgP85SIDkyZnZg3E5E=
Received: by mx.zohomail.com with SMTPS id 1746183831926614.9332549402269;
	Fri, 2 May 2025 04:03:51 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:11 +0200
Subject: [PATCH v3 05/10] arm64: dts: rockchip: Add RK3576 SAI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-5-376cef19dd7c@collabora.com>
References: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
In-Reply-To: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
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
X-CRM114-CacheID: sfid-20250502_040406_219155_11C5F1CA 
X-CRM114-Status: GOOD (  11.28  )
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

The RK3576 SoC has 10 SAI controllers in total. Five of them are in the
video output power domains, and are used for digital audio output along
with the video signal of those, e.g. HDMI audio.

The other five, SAI0 through SAI4, are exposed externally. SAI0 and SAI1
are capable of 8-channel audio, whereas SAI2, SAI3 and SAI4 are limited
to two channels. These five are in the audio power domain.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 200 +++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index ddc92ccc530d6757660971f0a609b5127784bb04..7bb906c3cb4e80691abf39d0e57888f79370bc75 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1010,6 +1010,41 @@ vop_mmu: iommu@27d07e00 {
 			status = "disabled";
 		};
 
+		sai5: sai@27d40000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x27d40000 0x0 0x1000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI5_8CH>, <&cru HCLK_SAI5_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac2 3>;
+			dma-names = "rx";
+			power-domains = <&power RK3576_PD_VO0>;
+			resets = <&cru SRST_M_SAI5_8CH>, <&cru SRST_H_SAI5_8CH>;
+			reset-names = "m", "h";
+			rockchip,sai-rx-route = <0 1 2 3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI5";
+			status = "disabled";
+		};
+
+		sai6: sai@27d50000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x27d50000 0x0 0x1000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI6_8CH>, <&cru HCLK_SAI6_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac2 4>, <&dmac2 5>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_VO0>;
+			resets = <&cru SRST_M_SAI6_8CH>, <&cru SRST_H_SAI6_8CH>;
+			reset-names = "m", "h";
+			rockchip,sai-rx-route = <0 1 2 3>;
+			rockchip,sai-tx-route = <0 1 2 3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI6";
+			status = "disabled";
+		};
+
 		hdmi: hdmi@27da0000 {
 			compatible = "rockchip,rk3576-dw-hdmi-qp";
 			reg = <0x0 0x27da0000 0x0 0x20000>;
@@ -1050,6 +1085,57 @@ hdmi_out: port@1 {
 			};
 		};
 
+		sai7: sai@27ed0000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x27ed0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI7_8CH>, <&cru HCLK_SAI7_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac2 19>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_VO1>;
+			resets = <&cru SRST_M_SAI7_8CH>, <&cru SRST_H_SAI7_8CH>;
+			reset-names = "m", "h";
+			rockchip,sai-tx-route = <0 1 2 3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI7";
+			status = "disabled";
+		};
+
+		sai8: sai@27ee0000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x27ee0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI8_8CH>, <&cru HCLK_SAI8_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac1 7>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_VO1>;
+			resets = <&cru SRST_M_SAI8_8CH>, <&cru SRST_H_SAI8_8CH>;
+			reset-names = "m", "h";
+			rockchip,sai-tx-route = <0 1 2 3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI8";
+			status = "disabled";
+		};
+
+		sai9: sai@27ef0000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x27ef0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI9_8CH>, <&cru HCLK_SAI9_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac0 26>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_VO1>;
+			resets = <&cru SRST_M_SAI9_8CH>, <&cru SRST_H_SAI9_8CH>;
+			reset-names = "m", "h";
+			rockchip,sai-tx-route = <0 1 2 3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI9";
+			status = "disabled";
+		};
+
 		qos_hdcp1: qos@27f02000 {
 			compatible = "rockchip,rk3576-qos", "syscon";
 			reg = <0x0 0x27f02000 0x0 0x20>;
@@ -1596,6 +1682,120 @@ log_leakage: log-leakage@22 {
 			};
 		};
 
+		sai0: sai@2a600000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x2a600000 0x0 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI0_8CH>, <&cru HCLK_SAI0_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac0 0>, <&dmac0 1>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			resets = <&cru SRST_M_SAI0_8CH>, <&cru SRST_H_SAI0_8CH>;
+			reset-names = "m", "h";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sai0m0_lrck
+				&sai0m0_sclk
+				&sai0m0_sdi0
+				&sai0m0_sdi1
+				&sai0m0_sdi2
+				&sai0m0_sdi3
+				&sai0m0_sdo0
+				&sai0m0_sdo1
+				&sai0m0_sdo2
+				&sai0m0_sdo3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI0";
+			status = "disabled";
+		};
+
+		sai1: sai@2a610000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x2a610000 0x0 0x1000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI1_8CH>, <&cru HCLK_SAI1_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac0 2>, <&dmac0 3>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			resets = <&cru SRST_M_SAI1_8CH>, <&cru SRST_H_SAI1_8CH>;
+			reset-names = "m", "h";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sai1m0_lrck
+				&sai1m0_sclk
+				&sai1m0_sdi0
+				&sai1m0_sdo0
+				&sai1m0_sdo1
+				&sai1m0_sdo2
+				&sai1m0_sdo3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI1";
+			status = "disabled";
+		};
+
+		sai2: sai@2a620000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x2a620000 0x0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI2_2CH>, <&cru HCLK_SAI2_2CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac1 0>, <&dmac1 1>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			resets = <&cru SRST_M_SAI2_2CH>, <&cru SRST_H_SAI2_2CH>;
+			reset-names = "m", "h";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sai2m0_lrck
+				&sai2m0_sclk
+				&sai2m0_sdi
+				&sai2m0_sdo>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI2";
+			status = "disabled";
+		};
+
+		sai3: sai@2a630000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x2a630000 0x0 0x1000>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI3_2CH>, <&cru HCLK_SAI3_2CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac1 2>, <&dmac1 3>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			resets = <&cru SRST_M_SAI3_2CH>, <&cru SRST_H_SAI3_2CH>;
+			reset-names = "m", "h";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sai3m0_lrck
+				&sai3m0_sclk
+				&sai3m0_sdi
+				&sai3m0_sdo>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI3";
+			status = "disabled";
+		};
+
+		sai4: sai@2a640000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x2a640000 0x0 0x1000>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI4_2CH>, <&cru HCLK_SAI4_2CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac2 0>, <&dmac2 1>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			resets = <&cru SRST_M_SAI4_2CH>, <&cru SRST_H_SAI4_2CH>;
+			reset-names = "m", "h";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sai4m0_lrck
+				&sai4m0_sclk
+				&sai4m0_sdi
+				&sai4m0_sdo>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI4";
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@2a701000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0x2a701000 0 0x10000>,

-- 
2.49.0


