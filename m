Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199D9C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 07:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AAI5/pl9eCob0hfQckKDsXCAq3H8GXPTuykoKS8yFtE=; b=N4S1blKjh8eqAxDsWW4/baGP0K
	at7Fp5SBZYcVSUaz63PoGsLiXBpC/4BAnKGRSTFhieDkYRRPUOEohcnVHbYp/G3LQykRdQ3h1zkmB
	c8jHS+LTJQJEYFtmSor4qTIobdVkMdryqefkGNLXRiFqoW/5oHl+eOahlCm1tI3/XFCRjMxyn/Z3p
	2S19R3MpH08PRX62xMdu98K8CDi49RIwHGOxcAFLPgC+awSilAGUBlM5axvZx1aabQriRDr3B+yxs
	aA6ne3GtCyb/lgH11+6oJ0IcmK3NNsOun8wrvqYZm8ceO6AAoNdBmzf/RIlr70EqteIRAgNsg63rd
	PB8AmPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Zys-00000001ff7-3nMA;
	Sat, 26 Apr 2025 07:29:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZmH-00000001eSs-19kq
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Apr 2025 07:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AAI5/pl9eCob0hfQckKDsXCAq3H8GXPTuykoKS8yFtE=; b=FZqUOHZwE3yjHzDHPvBic2l7Ke
	IDqYjwjfS7G6GziNvA8Fo4uhlL1iTdtuY63PLG8RPgZIHfg/hKmmeWeB4KQmQa19CwFE5YNWCiUcS
	5pfF7MGdOU5lBnr+ec75ogRue95WqrgE2IPZ5xve3A/NzeVhm/Ju61NYDkckORhepsUa3Lp41EhKE
	6wypaDIQWe0aqPztbFhxcl5iOdFbx7A0RcVHhNJD56V+DDHpq1jtPGGG4GXcjpQNqNHEUyZsuw9yU
	4OL4qqJ7+mpuqPZLUFTQqXdTRTmHabvttemdzq57qy1+v/sPRhjRUt6R9bKIHUDgyPciqUwFj+ZF6
	EqXx2zJg==;
Received: from m16.mail.163.com ([220.197.31.3])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8ZmD-0000000CEFG-2jZl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 07:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=AAI5/
	pl9eCob0hfQckKDsXCAq3H8GXPTuykoKS8yFtE=; b=HZHicKehiD0hLKwrFRX3O
	K1bkC9oIiXkppeV50z/w4s2eyaPwVqcRYxMoDGs9HmOoy0d6i2Xaz77Qi2KpovN6
	q2zu5DTewrAItxT1cdaNSHswy4jgr4A59G7zgiEvUc7cQ68wGLL/OkkJOLXkmkg+
	Uj7FZXy3fHs0r8/ag7ydvw=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H1s0iAxo+8N6Cg--.20762S2;
	Sat, 26 Apr 2025 15:16:08 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Add eDP1 dt node for rk3588
Date: Sat, 26 Apr 2025 15:15:40 +0800
Message-ID: <20250426071554.1305042-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H1s0iAxo+8N6Cg--.20762S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4Utr4DJFWrCr45CFWDCFg_yoW8Gr1Up3
	ZrCFZxWryxu3WIqwsxtw1kXrZ0yanYka98Aw1fGF1Utr4Sqry2kr9xWrs3G34Ygr47Xa12
	9FsrtryUKr12yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE_HUQUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hY7XmgMhFFxrwAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_081642_267140_0AB3FEE5 
X-CRM114-Status: UNSURE (   7.83  )
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

Add eDP1 dt node for RK3588 SoC

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 099edb3fd0f6..9d81d3b9444e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -252,6 +252,34 @@ hdmi1_out: port@1 {
 		};
 	};
 
+	edp1: edp@fded0000 {
+		compatible = "rockchip,rk3588-edp";
+		reg = <0x0 0xfded0000 0x0 0x1000>;
+		clocks = <&cru CLK_EDP1_24M>, <&cru PCLK_EDP1>, <&cru CLK_EDP1_200M>;
+		clock-names = "dp", "pclk", "spdif";
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
+		phys = <&hdptxphy1>;
+		phy-names = "dp";
+		power-domains = <&power RK3588_PD_VO1>;
+		resets = <&cru SRST_EDP1_24M>, <&cru SRST_P_EDP1>;
+		reset-names = "dp", "apb";
+		rockchip,grf = <&vo1_grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			edp1_in: port@0 {
+				reg = <0>;
+			};
+
+			edp1_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	hdmi_receiver: hdmi_receiver@fdee0000 {
 		compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
 		reg = <0x0 0xfdee0000 0x0 0x6000>;
-- 
2.43.0


