Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0A2CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HDgZKqvl5arTHrbz+lrMLe4miAykT2EZW+lIqpCaAY=; b=BtQMAzJ9SkNQp7HdW38uk2J9Cp
	qpJGgWWFu8ma6+pVloZmKQrsDbKFcsgg445qDfR22WR58H2JZ0ngJbqjVRxmIInMYX8AzD6AHmuoz
	ijPrUEUAklDlNfByx2onOf1QtfTF0eREoRx2nXj++YewhOL8klmUECNDHvbMJl9iA96Rt7IJTcy7E
	FM4WJNlS1Nz6TiUWbqlUXjq6WDV7xdT+igHq/bJadHxE8V9OpMeTEf94+/Heu7rhoIyluP8LPwAS8
	y2QRwyxwtieDA228fTWd5bikZn4wCHyz3fOcXc5B2WTZ0K16Y/3K1ImX8I0hlvtgOjXWWPnlMpV/7
	rYW4+jfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfGz-0000000G3YL-3gCb;
	Mon, 05 Oct 2026 09:46:18 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfGx-0000000G3Vy-007s;
	Mon, 05 Oct 2026 09:46:16 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4188B202353;
	Mon, 05 Oct 2026 11:46:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791193573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HDgZKqvl5arTHrbz+lrMLe4miAykT2EZW+lIqpCaAY=;
	b=b0CaOmewkngMR5ZqrsMzDgoqt8+U01rEqLiKh0FQTS/XgundAsqDhhwwn5Yh7BjxP35K0j
	i3dp5oozMX4/THi5rf/wLYJxD9SxK8qINTB4QR9yDRDz634yxuxpdW4RN3rUEW7Coyip9n
	G0nBlV5zVQE+66+LO6ixGzfBwW3r90Boh2hkxVQD1f7BG0IGaU+S6g9DwK2Q0XfSOx1zeb
	RBoMmvfA5OUI25f95gmnnS6O2zTPnhqI/13l/jZILGVdC5lZTFGOcjewyjZavvvYXadzIn
	qwyhbSll6qVt0NyfZLvKJHm2HhRagCAz9l12ROZj6RoKLTUnQTiJAD7a76MjIQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791193573; a=rsa-sha256;
	cv=none;
	b=D6gvVJFXVaJVQKPYCNHPYr0qj6coMasLd5oUhk/jDIvk92AARzCir+usgZ2HWy4mX/jDJJ
	MCAg5zsO0LMOm6HO8He2tqVsu96kyZNqt/CoupmC9eA0ro+pda+phajeWNm8NYSGzj8NkW
	yl3vg5Aj93iK4Tkb201JgLjvodt5rzWwQREib6gRZQFcooJqrdxvgXN2L2bfBHRey4wtu1
	XFOgUg2MhLJPrbFW3YfSL6YPtcBcx8OyEhXHiwuVlAPeEjxqocyjZd/dBZ6ssIAPGwwJQ5
	8GV+15EdLeTKQ1cN4RFz/OXodKZAO6Rwn5wezzG/defPC4zylYevHd7TDzFTCA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791193573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HDgZKqvl5arTHrbz+lrMLe4miAykT2EZW+lIqpCaAY=;
	b=F1SgvGl6jem+OjcY0EggxRsezew80QwL5hR83tRYjddMA7055nFn+dvYVkiBzDwGnlCQe3
	k5tJEENF6kXvmzRSBsg/wIKBsCZoij0EB83HRRrHjAH865nE3sNUNqFOs7MFracbnVE/mE
	VNHLq/6R5YVA8Af7pObqtRCn3Vun7DuwG6Ef0LIIzRZUdep4zijHR9f56DmZmmc42Fjx7x
	e9/FoHpAsyhYMXFJeHJT8dEVFUHZ2gXfg0/FgYjEKSyBZY0RmWyP+K2kZAZ+VqSdJ99ZxO
	Q5OZKxyqk8q3PVwi1azM1wQa9JeegWGUCZMQaetVz9ahK/h+HPLQGRyPyYuDuA==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 Oct 2026 11:46:10 +0200
Subject: [PATCH v6 3/4] arm64: dts: rockchip: rk3588: Add JPEG decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rockchip-jpegdec-v6-3-25f16dea1697@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791193572; l=2105;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=lGGauPf6ZkseZOM/LSXBX6VE/9RDJeKUwsE6C323e7g=;
 b=ER3YSLOPxVsLi8F4vF47YnzQ10dOqb8pxyQYgFU+9tD2ePeuHfhBijzxTobfdyY5bO0mscEfp
 N99fSmWqMPXAkYwlTg1ZEjl5YOBJHx7snRTBQPv2d0o8Cabp1X48Bhm
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_024615_199580_5E8E9C03 
X-CRM114-Status: UNSURE (   9.70  )
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

Assisted-by: LLM
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


