Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A591C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYTdTPo7gdfIod3VXco89+GzTJbHnShql4UCGhP3aKM=; b=aJ+3FEwyhRjSrFsTV2nl3xFNzO
	ogABNcxcHn7CR2H/9JO9abfc3d06Q9rkpD7J7nHswRgcHFhxZTnBEaHamlItOeeXYitNSZX/YKupk
	WXQPctOqHTE+ag6tDGeoWWD84c6UWFE0Q/Ggf/lVtrE4DxQsHrKLZn0htxMBWaCvfoNKtYecNNFKw
	Ku4L34oHnGps9v8fKVrmF5ZYv8rM+oBWeiCGq4yucjZkg2n25fP6qg371ftq1dCG42aAuogRIjA08
	VTHApY0FI8DdAUq8O0qKolTKaYiMi5wfTeQRg1Q5KHH2V+X5kegQqUX8i3LaYGEOExKmUYO31CMQf
	z8AkLyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoOq-00000001lGv-1Y4D;
	Fri, 02 May 2025 11:17:48 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoBf-00000001iiW-26IW;
	Fri, 02 May 2025 11:04:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746183839; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IGDBiVr+XbI3WMm93tqKREzyyTsjqqgjNFWqoYIgTDiig1NYqOiVzgqVRQkiScCnTMWFdPLipvqAvVIA9kVKHS2n9QI9+qzks13DzdEbTvQh7sHx94B6oGU3/a0w+6oaOegA/PCi5lYA+c7AHIYHdItHa7htbCbcGadyeD+wViM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183839; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aYTdTPo7gdfIod3VXco89+GzTJbHnShql4UCGhP3aKM=; 
	b=QVugQTjc/saGp/cYW1Npm3DDUDI5wdjWVc9rTMssQOW2X80coJu4tksGkj/k/cVCrzr9Xhf0WKvqgWF2DfTLYo1LmOYe8+43viKvCrQPzECuGraPXYYIq7r33SXfGLlI+OyftJG5RC7yzqGKeWyLSZLxS/BXPU0a/xVenxVLAZs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183839;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=aYTdTPo7gdfIod3VXco89+GzTJbHnShql4UCGhP3aKM=;
	b=ZnrHWtIol75xCy5ZulgNFrCG7HlQeZbeCiyb3iWQMGUHtKokaIjoocLZ8oUUIUu/
	wfp3UjcGqfZPMqYZZ3HH9JtgpEy2lHHHKbKkSY//GuerR8qt8RMI6SUgGtbJ+r438TC
	7FvYk5f15QwGW0X7eB/RWOm0IobMk6/JlLgVYZ2s=
Received: by mx.zohomail.com with SMTPS id 1746183837415802.8243954889812;
	Fri, 2 May 2025 04:03:57 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:12 +0200
Subject: [PATCH v3 06/10] arm64: dts: rockchip: Add RK3576 HDMI audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-6-376cef19dd7c@collabora.com>
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
X-CRM114-CacheID: sfid-20250502_040411_604708_52F0DAB1 
X-CRM114-Status: GOOD (  10.29  )
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
index 7bb906c3cb4e80691abf39d0e57888f79370bc75..cb53561f55f3dfb913f40eaab7b0c8e090d23c31 100644
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


