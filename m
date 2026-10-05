Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C26CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuoWp/N/KlBV8lwab/+aPTx/4RNkZa+sJjWMlvh/CQc=; b=oQ4Q/Wj7LEIZ1L/SPUJEQ+YvOq
	rtB2xoQ8LN7DlvqoeuaySaqdSHxNPJ7RhDYE+YGPv7uqhBrDjk6awsKRwyiG95d5sy1GIcof7Zy6T
	y3uTix+y0gV9yKSvkb5+6KHbk4rw3d9rUE0vsBY6LbyhRjMXTt1DLeBq6qiCyMejBzYwbPPkGN1t2
	rOQ97hOk0AXm0bASdx1g7xf4RonnW7yg8cLLlGNVjo0Mat7q0mnO1oIboQQacw5fUmpnXTQYQVFQI
	APaS6REd3WTLc2bY4hUkJZcuLizLhx6s28O1IYu5VyASAXk8eoFP0IfAwYz1lU5F/kpiiFRdyOHWy
	1OBs9OUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfH5-0000000G3c4-02Or;
	Mon, 05 Oct 2026 09:46:23 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfGx-0000000G3W3-2Tf9;
	Mon, 05 Oct 2026 09:46:17 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 574DA202354;
	Mon, 05 Oct 2026 11:46:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791193573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuoWp/N/KlBV8lwab/+aPTx/4RNkZa+sJjWMlvh/CQc=;
	b=Sz72JUvl0Npg0vRw58xE8tpKL1ffvk5DhClTQLXqmi3W1HhGwoTgorlWWyKlSGrPadgziy
	qypFel35YOen/AFKUg88ua1a2BEdSrnTaYkRMw2hbcAaI7esfuurZlRrbd43n1cg9EhZ99
	ee3r5SDFXNBFH1bK5zSRSotBg44Abn35G6VDtI5NTku4x/So0/k+z5cDxE9EyZZNepd2S5
	g/RJHVJ/alqQzt5dZ6lCInpheC7dakopFM01MmAnW2gWNbm5VMCY8HFf5QBF6LXgzu2Gcd
	oVpRMTNn4YO6JZjp3TovPTDsrCdYefBW8baRMVA0hmK14umm1USvEYRVp6Ko8g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791193573; a=rsa-sha256;
	cv=none;
	b=ZOpZZiexwEm4V71C2aeS0w2LnjQT6lEQaUlypac4TVmGYXtgTzOnW/bUes79LmEhKY/+2M
	kK3GEXjWK4KDZSxMfM3C8YdTYX2svYKnRbRA0cbs53ck75I8WO++1Z/FKBfa2N9/w+7EpH
	FLKgErqiWyXggOWQoqv8z6JlIux0r5OToc43mJEKOjE+up5+5NC+16BzgJ8lG0B9jolmcM
	CEQBFnjfcjwDYJI2wARZnVWrj+xvkioJQ3Jay8CHtnFA2jssWoD6ZOLLDavHp2GDjF05on
	VGIly3+zu1SWDqtUydZlcgWcMWjH7ymmnmYmbW7uc4z3vB35Rtj7k5pdq9Gt1A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791193573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuoWp/N/KlBV8lwab/+aPTx/4RNkZa+sJjWMlvh/CQc=;
	b=fITpcM6PhL+b6Xyn99OwF72zlTvbd8ndDuD/zdqHK30OQj6etApicaSERqX58h1Te9pi79
	iYVglfM2ueXyeJK1A4xQJO/YdBfXccdy97K8Irxz5JMq1oTUZnzrBih0qG7xjtgiV8hmVI
	DTcMMfo4yE4Vfr06YfaYDU+qCd684fUHhHAGbC8KugcSe8Uq0AKaOO/IVvChAjqTwLjVJ5
	3g15hJSKzXxUXH2m/hfLzDqcwh7X1RC0XNroiZFNbBYXvs5mB+Z4fVcv96VkJ1VIuxTxOz
	49hlfbZmwPveZwriIBGconrlJ5Ve8/mphr5mBKEUnF1HrwEhZMzbZ0R7kWHYjg==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 Oct 2026 11:46:11 +0200
Subject: [PATCH v6 4/4] arm64: dts: rockchip: rk356x: Add JPEG decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rockchip-jpegdec-v6-4-25f16dea1697@pengutronix.de>
References: <20261005-rockchip-jpegdec-v6-0-25f16dea1697@pengutronix.de>
In-Reply-To: <20261005-rockchip-jpegdec-v6-0-25f16dea1697@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791193572; l=2439;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=qLeZrdfkumnxcCcT4IZ8DVTZHmi+IuhUnXTquRcO/mI=;
 b=t7raURYopiHbIwhBrLcTtJ1ICGjWSaVVLFN0R7SmjEooP8NK5Pcv9FJgWFi/y/fFCjbHu55i7
 peP3upgVySNDfoY0SfaH/JsW+8F6dqSD5xaUjpc+lymHWWpdDmOEvD1
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_024615_788401_BDC84324 
X-CRM114-Status: GOOD (  12.00  )
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

Add device tree nodes for the Rockchip JPEG hardware decoder and its
IOMMU on the RK356x.

The decoder is the same block as on the RK3588, here at 0xfded0000 with
its MMU at 0xfded0480 and the same 0x400 register window.  Only the
integration differs: ACLK_JDEC and HCLK_JDEC instead of the JPEG decoder
clocks, SRST_A_JDEC and SRST_H_JDEC for the AXI and AHB resets, and the
RGA power domain rather than VDPU.

No rate is assigned to the AXI clock here.  Unlike on the RK3588 it is a
gate off aclk_rga_pre, shared with the RGA, the IEP and the EBC, so a
rate set for the decoder would move those too.  Its mux tops out at
300 MHz, which is also the default rate of the downstream driver.  The
downstream device tree assigns no rate to it either, and the vepu node
on the same clock tree already leaves it alone.

The domain needs nothing else, it already lists qos_jpeg_dec.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

Assisted-by: LLM
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd392..e6c7ae908a99f 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -619,6 +619,28 @@ rga: rga@fdeb0000 {
 		power-domains = <&power RK3568_PD_RGA>;
 	};
 
+	jpegd: video-codec@fded0000 {
+		compatible = "rockchip,rk3568-jpegd";
+		reg = <0x0 0xfded0000 0x0 0x400>;
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_JDEC>, <&cru HCLK_JDEC>;
+		clock-names = "axi", "ahb";
+		resets = <&cru SRST_A_JDEC>, <&cru SRST_H_JDEC>;
+		reset-names = "axi", "ahb";
+		iommus = <&jpegd_mmu>;
+		power-domains = <&power RK3568_PD_RGA>;
+	};
+
+	jpegd_mmu: iommu@fded0480 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfded0480 0x0 0x40>;
+		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_JDEC>, <&cru HCLK_JDEC>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3568_PD_RGA>;
+		#iommu-cells = <0>;
+	};
+
 	vepu: video-codec@fdee0000 {
 		compatible = "rockchip,rk3568-vepu";
 		reg = <0x0 0xfdee0000 0x0 0x800>;

-- 
2.47.3


