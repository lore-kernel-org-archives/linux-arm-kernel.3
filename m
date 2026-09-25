Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B2EC98324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+kLoc8HWzyOxKOyXRrCV9IQDfH2HyHmz14W6mFXI/A=; b=BwOXyY0KFgKK/b/IEZ7v9OLOB2
	I2hmPudtM5Fo+1xK4F2sLikUIteDsJvunZ311/dMHD8rlB7jLBTlYNP1ovwC0Uon293QVdMyfTpHt
	rhQpb9wWtQRjwQ6Jq8Z9TRWjabA3sOYhIwjLcAblBHT9DbqIP+zVT5XUfMYynPUJAxf5dmbONCe5C
	zAyS7YcmbEKYisXKZ8rrMtR5FXXDbnmyzDxwKh7l0ikcJA11r9GVfxkDfcftf6kJFvK90PXAwLMTG
	+yBf00jj0GZO0GCIZZTzZKi/dLS0LcUEj71NFB5I77xyeWK9MdgQh4hAayoH/aMVAFOpwjD2oxpwt
	PZe7uhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4N1-0000000DEr5-20eN;
	Fri, 25 Sep 2026 11:45:39 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Mq-0000000DEmT-2Qx8;
	Fri, 25 Sep 2026 11:45:30 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 81724201E70;
	Fri, 25 Sep 2026 13:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J+kLoc8HWzyOxKOyXRrCV9IQDfH2HyHmz14W6mFXI/A=;
	b=fnloXkQPX31QqhFSm2I6hftJIZyL14WEDJm+tJ8VukuWAQT7TlKROK7xyyhlj4U4BlKNDX
	bWo88xM3hCVdYyukaMSBNy+5XvUycT8oFPv7gGRvmhec+15rxK6qbZc+fe2LHCieWHZaD6
	WQBihvtqaVKJgb+QN71viuyyxZ4tXceiWxx9rm9hZA4HziZobbWZjWboLyslPbvUI53Bgm
	mg0iLb0RcJ7s8BbLX5Xmn8+Vrlh85iwNaO4EDRV7ERhZWe/+08ipMR6zMKh5ZbtoYh/4a8
	u0cr1fNVvBPp4jmhbDKUUE98pBd+YZfPWcva810xczPLYM2DEj9lhg2Z7o/1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J+kLoc8HWzyOxKOyXRrCV9IQDfH2HyHmz14W6mFXI/A=;
	b=Avafuu8eF7aKOxf0OGrBNYHFsjXj1jShq+wXTWjMqo5Vt1IW0cQM4UX923pVPAaMejRGD/
	Esp3WvmkY30YqYlV4za+ClAjljqdRhqrcLjr+SiB5Kc0imU0g47cMQ3ZiLM3gMOavXSBVT
	JO+2ev5WQOiB3XaVn2QQtSrff5U3OhbLRvl2hW28F5VsJliKuTddfwlgRbb5/v5P4VuR/K
	a//8AaKMvTehke9H0T2e4RFTIYLDtiDYpC58HFA4SSBrxSLy6Q08xo4iTuKp3UUDkTqN3p
	nxTU6yOyvaUQvN2NDGYiO2AVbdcwBaCOk5Fw8jhlO9ueXI+K/i8P1sXf5ubJfw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790336726; a=rsa-sha256;
	cv=none;
	b=UlUTwMXOqfZhS11bLVcsjY3poevP8U1RYShmi90q/WD1QVS7y2zcBjdqQlj+juqIqCH11r
	hBWK6h1My/FoYBp0+vrxHRpjGNoMlWHDphO4HdN7l3DbEq1MmdCRk7RAYGUc6lY7BF4Gw5
	d/VJQvON89RK3gnC1QHePhy7/XOll746V5Ow6q/wVC1jcHirmlea55IsiDV+WdN+6wt5f6
	A1QHCcHoo8f9gAbmmah1eCYsYfjlyhMLdDBhzqxjr2RcYms6yN1WtDGszVXBDlgvvrCJHb
	REyxkO1KFAJ4X3SY/5J7qxYff1vEV37tT78J3X1zSe2uKjCtLDdOwUgTemvNZw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 25 Sep 2026 13:45:28 +0200
Subject: [PATCH v5 4/4] arm64: dts: rockchip: rk356x: Add JPEG decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-rockchip-jpegdec-v5-4-30658833cb68@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790336726; l=2456;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=ujCnc81X8XtyLlHK4oFfY/Z41Z4iwHW9m83DFIX6cSE=;
 b=0NNEUUXKJXtKH6jDpUNUDfCktEQowrHfPSEtlcmG48o8RZv7uzGT1Exoq5zEo1jMvkhjfsAWO
 arX+qCJlgDrBbCtYUyjXu1HzB15ng8/Lnz92R4BlInEMEokKbiOVTdo
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_044528_783550_95E39051 
X-CRM114-Status: GOOD (  12.19  )
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

Assisted-by: Claude:claude-opus-5
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


