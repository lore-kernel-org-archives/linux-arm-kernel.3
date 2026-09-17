Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E46C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gigkPs+UENfJ6S76VxoXcUExljFxrNqFW4T+9fUWw3k=; b=rr9v1IewSDvRAKAVhmTrQvOX2i
	AqAaiiG0fA9SwkxWn35F9MkqD4VU4viqIMmujtKUu8tWTgmb7Bf7W6ss8XcG5pUlIF+Pv08qMOQI+
	nkDiVqWuQNwqsn4eENPcuEmupAEbfH9vGc3IwGfSh0GOH5YyST1L8HzbZdLkUFOdPqs/VTvgOUNL3
	qAPljtZODXow0HPfYZRQipPr2oHB1MC1sgH5Lf80qBP/kSnXF4J989CQkDijYEfFmfM+hjRr1jIps
	TfnoD5bAQSgUbRPGpTL7upt9bERtoHkgE1y+ZIFx3Q62iFeRf4V5DNIX2PkFNEMoWWwogZi8HO7f1
	mdp4FtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ciz-0000000BUoM-34Sm;
	Thu, 17 Sep 2026 14:04:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cir-0000000BUj8-06EJ;
	Thu, 17 Sep 2026 14:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789653858;
	bh=vMgJeIbDY4gfZKXLLhtV9STSMmBqMwbwlOznf1gK9P0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mq5lEHqqKN9k4SnqWL0ROBoGrQITCdZtrIOS+C219lTGh38WfibxB99vBbzxng5bv
	 sZfslvnhpbi6DcWxueZj++3pkw0BoVUTno5wf5BsVe6QORpgXgf92rParLUHAVi8/4
	 ZdzVmWhEFfqACG/SyH9eQaIFUtoANxZLloRrRX3+kZ2Z9klHT3tNFbOPh/W7zrisqc
	 yvTb0oICpAZhxEuqayMqrdcvenkT80zYAukwLcQnAvsyu1u2bAKb/czcy3lHD/bRvE
	 gEDFOcGAGo44Sp+UxmO+fH6rCCxiIT++IZaSq9eTQO5kDy3QuWUg9gOn08ZU66/ZzL
	 nP3UYXFzS1EXg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3350117E0C7E;
	Thu, 17 Sep 2026 16:04:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E902C480031; Thu, 17 Sep 2026 16:04:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Sep 2026 16:04:10 +0200
Subject: [PATCH 4/7] arm64: dts: rockchip: add DFI node to RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-rockchip-dfi-rk3576-support-v1-4-a5752a29f7bd@collabora.com>
References: <20260917-b4-rockchip-dfi-rk3576-support-v1-0-a5752a29f7bd@collabora.com>
In-Reply-To: <20260917-b4-rockchip-dfi-rk3576-support-v1-0-a5752a29f7bd@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TXuERcBa3lyF5yru0hC/lwhYh6FDQ895W7w6eKt3Ed8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqr82EIl+BsIL24IfiuW4c4yZ4tq0kfphkbA
 JI27g4p/2HJt4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqq/NhAAoJENju1/PI
 O/qaGJUP/3yufEr5zX51XBnayXqJXHfhkp+/bGSX1GDixamcNn+or8LJXRfnGElPdx/RX8AjoUJ
 b83dcf2sM0cCgeWgUotHvFLMpk2ussnkfVcDM/I+c0POLInkjoT4i10bjhNgAFvVWhej2qdFnbA
 jAA/UHjFmfVCyQgGMq2CIMe2bOGSXhLQyJSsHDGDDsauE2ZQzev/TvoFIgw7DVzyAk49gl0jwmU
 kBnT0/YoadcVhE6a+Z3j8E/rAMO0u71Em5NSuMLGUvshvEh8SdyG04oloIUaW4cYEsysd2AUMhL
 C94VKVMCl+m8RTEerEGWF4cxeHnJyRB/vTIVEfLvJwVO28SPFqxbQPuEedMaf/e74OJ1BHBJ8g7
 L04ZWiXqNW86EN01YETmiwqvepGYW6Z0nui9Tqnky+YMjDN148p/tfdAB20klocZ0AGyGDCD+8u
 MHa3ihdzhWCvSZr//U9nPTUNQ2rnFpEpVLPBBqlM8D4O4jpKp8+uRSVuqLCarL6ezX6bY8/oeSH
 EaKK2v5Ysjy5JSTs+CgYxgtqchBjJCpOoLL32cJJ7zhU3cEcxa05ZFVntWTeEoaWOObeSMOnIw2
 CM6nApRxvts4+J9j+9E0AFOx8y//a35K3ZaUSiVYc+R6w63HL71Y6X9H3fkAKTefv2qAwI+Mpmk
 3/KbIHfahNLH9rnSOlZ4xkw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_070421_224272_D283D562 
X-CRM114-Status: GOOD (  11.59  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Like previous Rockchip SoCs RK3576 has DFI hardware to measure DDR
bandwidth utilisation. Add the node for it to the SoC's DT.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..197b8c3b76b4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1832,6 +1832,17 @@ qos_npu_m1ro: qos@27f22100 {
 			reg = <0x0 0x27f22100 0x0 0x20>;
 		};
 
+		dfi: dfi@2a000000 {
+			compatible = "rockchip,rk3576-dfi";
+			reg = <0x0 0x2a000000 0x0 0x20000>;
+			clocks = <&cru PCLK_DDR_MON_CH0>,
+				 <&cru PCLK_DDR_MON_CH1>;
+			clock-names = "pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1";
+			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
+			rockchip,pmu = <&pmu1_grf>;
+		};
+
 		gmac0: ethernet@2a220000 {
 			compatible = "rockchip,rk3576-gmac", "snps,dwmac-4.20a";
 			reg = <0x0 0x2a220000 0x0 0x10000>;

-- 
2.53.0


