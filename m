Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D10C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 19:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzU4tcRCWe90x9VFz0X/4AwrQIW/Skbx2gkRjFmqwGI=; b=MhdlAsWUH2Ll4vUAseJjqBjJvl
	xCCfE6hlvnhFYE4svJBu3D5G7kJ9Qekl1dC1EwCR0kWmUzpd3ZuPsymn/i1tUuWGhSFZP2z7yjRwP
	fp4uazp2ues4/swEpG5/xJAi9PMu3cFKdwCLFD2aF78YE6kK/0gIH5nzQOngmY8xmRSYzjLIAZO/s
	q/3hkdLkw/tEOOW+heDbfQ3M0zDyjb/6nptzu+ZMWD+mweLNwWO7XlGeQ7L4l2sFN+uV9veV3W//W
	ZGc4HO/wWykcJm39l1NDn92xF5ZInoqSqX+vAKqWMv1JfxzKupGZd2Bt0sUkJ+gl8Cntxe7ZmbPtG
	MLHrWgnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2y1G-0000000BiRL-2UGK;
	Thu, 10 Apr 2025 19:57:02 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xlx-0000000Bg0C-2Ydz;
	Thu, 10 Apr 2025 19:41:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744314061; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cRZ2Ck5pBqgNgLgGu28B0MvBLx73bnrH+fK0Ge9fVINgj03PM+Uq2QeaNg9BSpWqZpVag2HutUc6PndJiV1djAfZIyjapB6xVt+eHA+5KYKDLWqpX05/IpMM/HG9NJRILrCxfPlmBUrYMsQymL7jeioNU5iyKpynofWxpujtsZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314061; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VzU4tcRCWe90x9VFz0X/4AwrQIW/Skbx2gkRjFmqwGI=; 
	b=LjloAADxOwGupJcizyX/ibUtkQb3Jj4MS3DWDs4SeInWAk8XHedxUfWlmQTYfXjxqwl+Tx0b3k4LSs74w0di5bhtzuaXBnlLXvt+OrAQfCi1Gv6zm0yJKMrskBNfK3nrUTm4qro87bjypA1hku6nr3sqND9N0cJt2FlGUPiQDbI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314061;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=VzU4tcRCWe90x9VFz0X/4AwrQIW/Skbx2gkRjFmqwGI=;
	b=K+He45ZjszeLtl5y6bIX21FaEzPrL2HQ3iS8/uIZ44rJ/xQEGr73SRhdU6Z9fDeP
	E4AAkEbvXXdEGB5A3sykPGnJs7Cwc8WPcQeGGeEMmSGi0cMYGDJm70X8S6bjB/nDbWZ
	FOhEXz82sws6ne+xVcrN5BSP+MO1+5X5S1PZtJ/w=
Received: by mx.zohomail.com with SMTPS id 1744314058339686.5403179777842;
	Thu, 10 Apr 2025 12:40:58 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:40:00 +0200
Subject: [PATCH v2 08/11] arm64: dts: rockchip: Add RK3576 HDMI audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-8-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
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
X-CRM114-CacheID: sfid-20250410_124113_709104_A0E38E78 
X-CRM114-Status: UNSURE (   9.67  )
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

The RK3576 SoC now has upstream support for HDMI.

Add an HDMI audio node, which uses SAI6 as its audio controller
according to downstream.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 91aaba3b2b7c6d208254025cfb9ab711e0d424f5..848c82d70a076ee48049de1818245767133ed95f 100644
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


