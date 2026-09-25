Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A053C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MC47sMHNRJ/nvzIcP+t6YwsT76ZT+zbTX932PFJH7lE=; b=qvt9CoF0EApj5jzGjJaGbUVGac
	7tlZbTR/u+akgWMH3B1f+5bykej5I5PpaPYfxr0603UmQxmemc7lt8GiyoBqC6TT9hY7H5jbjg7Rv
	ZW+pCOWwVUp9awq4I/tcIGKDYVq9uS1e9boodk9t14zU2f/kbWH1cB/YtUZ1xNEgHVJl18K/11MCW
	8vjvzCxs/qFBRo/E11GeXaJkhxEvPFI9kpsINjJRQ+80wlFkhmTpi/LeW9TnfoZWlupRubkajXTsn
	uPA25FJ895p1W/tNm/C1i+8UPpvQ4v+NhoXevXlBFDFdRy9bw7IG3Vdje0QMNbgktw1N5XJBk+Mfb
	MnFa8Pqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Ms-0000000DEnt-47VT;
	Fri, 25 Sep 2026 11:45:30 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Mq-0000000DEmS-1uPh;
	Fri, 25 Sep 2026 11:45:30 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6CEB4201E6E;
	Fri, 25 Sep 2026 13:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MC47sMHNRJ/nvzIcP+t6YwsT76ZT+zbTX932PFJH7lE=;
	b=NXKu3rZeFQl0D15h/4KyhMZkLkSGragapw0iZpP42KgQK/NCotv3+6gf/0PvWOIRDM09Jz
	7sJ3UGuho6SkOsm/W5aWwJXCBeGQe+HUP3q/GhhjfFOGRdurG0GPHi21fGp8B4XEnA08A6
	zSl4OPCjVXkvr9mGw+HFKpn0a7IK0mTcJ+FdGjt2qAFn8x+fQwkP5NcuEidTXniNpuSq3w
	Tz1lF5KLH/Y0Umy6E3LjjzecRZSkGQR4HCHCIVKVSf8YdCIRdXb1N4r2lRgdBkI5l7Qgcp
	ip04c00wSg39Tbr8PoJgfXWv0dRTNHjYhIcOIQX2hil1+ajQojqzz8yd2Uqcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MC47sMHNRJ/nvzIcP+t6YwsT76ZT+zbTX932PFJH7lE=;
	b=M9d/CE2XJ+95H+MVM7qgy3ZdE0aZUVtA76sFHWxhhVdxaMVqc5/xzN4PgrW48dHsb7srgB
	irWA7K777uTXQfq5Lq+FAm0rdm9zZCNQPanGrQyxxtSOD/QZEx0eLDAfH5mbOOq7WI5LVb
	3aaFGU/Dyqe+4r3uslC76O+Fst151UU/Db6+Q3aMHpAyeSZQMkCPrMHeaOhA7Nku3HzliH
	kwJjybPjbcNZazcOqBKritkuL0vyv0ph4vfoK4FbAE9K0VJCEdZFYbfrPi4AvLkDasDGRq
	iUEj9lfiDT9NzwdRP64KX4NJG6r9GKaqRjmBPFEZJQPL5fOTu82NOAXu32P4mg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790336726; a=rsa-sha256;
	cv=none;
	b=N/I0pd1F1Hc90wgbNJXlwtXFGHIYHgOCdS3ISce0ZGZcj/y+xJBhsrpbs2M0Wn4uUSWHxp
	kJXrPbxge2wnilTxDQ5Oo1DRIlcaxSgwbHILkyjj5tkT8eczgTGJ4eeLJ0MvmS5AQLAL+m
	rZhxEm/qYGKaNJswsp3MR/CH/OiUfJ8tLGK07jogJifICuje7LZKlKqMzpsEIjacLpfr+t
	k6bcK2YXZzsNMPWwDOau2wATxog6oVHM6tV/HZsKBDE+DiT6I3Hy3+RZMsaR1a6Rh3HQt+
	hAcExV4k1jiSSoAEuKY8X6MLC5HuDot3K9NlyBxib8V8BNspK04NOVjbt/1wgA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 25 Sep 2026 13:45:27 +0200
Subject: [PATCH v5 3/4] arm64: dts: rockchip: rk3588: Add JPEG decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-rockchip-jpegdec-v5-3-30658833cb68@pengutronix.de>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
In-Reply-To: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790336726; l=2122;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=dd9ZB+DgEvJG+UhAAEoJPAdb4Iq3fKUiQVJjo25/3KI=;
 b=H6CYZJo3AadXM8dV7CpzAcYKV3TvuUHYK8JfZrgNYlh5zBA49LIDiKArC5msK8hvacTus9Bhb
 yg/nCK4/R0hD/hGr5lAI8fxyk6WdoNGzreZP6DhPXVBTnReLWg4nKpW
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_044528_653458_B7063842 
X-CRM114-Status: UNSURE (   9.89  )
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

Add device tree nodes for the Rockchip JPEG hardware decoder and its
IOMMU on the RK3588.

The decoder is at 0xfdb90000 with its MMU at 0xfdb90480.  It takes the
AXI and AHB clocks and resets, and sits in the VDPU power domain.  The
AXI clock is pinned to 600 MHz, which is the rate the downstream BSP
runs it at; it is a dedicated clock, not shared with another block.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e07869..cc53878502898 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1317,6 +1317,30 @@ rga: rga@fdb80000 {
 		power-domains = <&power RK3588_PD_VDPU>;
 	};
 
+	jpegd: video-codec@fdb90000 {
+		compatible = "rockchip,rk3588-jpegd";
+		reg = <0x0 0xfdb90000 0x0 0x400>;
+		interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+		clock-names = "axi", "ahb";
+		assigned-clocks = <&cru ACLK_JPEG_DECODER>;
+		assigned-clock-rates = <600000000>;
+		resets = <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER>;
+		reset-names = "axi", "ahb";
+		iommus = <&jpegd_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	jpegd_mmu: iommu@fdb90480 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdb90480 0x0 0x40>;
+		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	vepu121_0: video-codec@fdba0000 {
 		compatible = "rockchip,rk3588-vepu121";
 		reg = <0x0 0xfdba0000 0x0 0x800>;

-- 
2.47.3


