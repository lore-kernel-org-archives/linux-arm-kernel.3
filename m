Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53688C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXMkSRINNwBaxu50t98o2g6F0hiutN+78b6vZXXpk4k=; b=geS11zUuJe/RoyXEqZCtoh3KUv
	nAZ6xiPflM5vZMKVI3w71JYFDFi1P6Fv4JHVUuOg65vhaZRTr2RRDejP8tof9ky7TG0p35s25puqC
	4SZyiQGiSdCQDz4ddjPY7E8ER7jEXAU35U5VvsBMYXPFYt+zot9gFYrNVbKSwyZlvVVXfj1yDH7bd
	w598J4YMykcjHuZ6aT9Rs+WmKhs2me7OR4EfbIDynLDCm0KYIla+RX1pcmbLPh+dSigG6y5RJTsfT
	tp2OcZZjwm16rcECa6+MGhJXiccU7a6zp75zluId01irwFRBYh1wdDbUQ5ci9eKKoXoeEWN9vh8Gr
	fWj2r32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzqu-00000008CTa-2cTn;
	Mon, 05 May 2025 17:43:40 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzbA-000000088xG-2qSO;
	Mon, 05 May 2025 17:27:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746466030; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WvaUuOHozLTxBreRVoRUZHIAEzPFGeRQMg4uBRsLda4UXmjGVA5cd0lSmJZVK1mmoHrEgX5EVsPj7yUqQ2VI+yFQJ1tlKUNSPbfuxsRYNx5hAN8LdngVVVcI2RbqUR5Avbw2x1279vvM49DbDT2Bx27InOsLU40h+muwSJDFVqQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746466030; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UXMkSRINNwBaxu50t98o2g6F0hiutN+78b6vZXXpk4k=; 
	b=i8/fed4EofhbKDyh8FRlPRZPRnvt/opLboTCojBOcJwnxBVvA6tVK2VzfmB34vzFJE+ILd8FSCRqfnGfnjW1jrSwhGEZT5XdMYHu+la1oK8Z8grseOlTVTEB9Y+x+P6k8rIyf7scxe3E/9orTlsgMiD3lhHfQkHpl4BKFaillzY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746466030;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UXMkSRINNwBaxu50t98o2g6F0hiutN+78b6vZXXpk4k=;
	b=I8LC2PmuD2lmjAGTQ7BwExEaZ4rARrEE+97Y4X5x4ugO4oq9Hok6tyxmSEJWTbJC
	otXtmma8ij4MUFJLrYWgzLT+5yHmOygsvCBUsBLO43pt7iUADP0hycYAmqDBL16uvam
	ae9+iAgMsYJp9QGcOv2zU1HIk2FiV8YAhvFzDm/g=
Received: by mx.zohomail.com with SMTPS id 1746466028949626.5537082120404;
	Mon, 5 May 2025 10:27:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 05 May 2025 19:26:39 +0200
Subject: [PATCH v2 4/5] arm64: dts: rockchip: reference u2phy1 as clock on
 RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-rk3576-sige5-usb-v2-4-d5ba4305f3be@collabora.com>
References: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
In-Reply-To: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_102724_789238_59F78E50 
X-CRM114-Status: GOOD (  13.97  )
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

The rockchip,dwc3 binding states that the utmi clock may be referenced
by the controller. Until now, the u2phy1's clock output had no
references to it in the SoC device tree. It's not known if this caused
any real-world issues, but it may have allowed the USB controller to
potentially do operations that depend on the utmi clock while it is not
enabled, leading to hard-to-reproduce race conditions during bootup.

Reference the u2phy1 output clock in its corresponding USB controller as
an utmi clock. This effectively increases the enable count of the
usb480m_phy1 clock in Linux on my system from a deviceless 1 to a 2 with
the USB controller as a named user.

Fixes: 23ec57a32da4 ("arm64: dts: rockchip: add usb related nodes for rk3576")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index ddc92ccc530d6757660971f0a609b5127784bb04..fa4ff44ec48b4b8759b7d4d1c752afd3333fd43d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -480,8 +480,9 @@ usb_drd1_dwc3: usb@23400000 {
 			reg = <0x0 0x23400000 0x0 0x400000>;
 			clocks = <&cru CLK_REF_USB3OTG1>,
 				 <&cru CLK_SUSPEND_USB3OTG1>,
-				 <&cru ACLK_USB3OTG1>;
-			clock-names = "ref_clk", "suspend_clk", "bus_clk";
+				 <&cru ACLK_USB3OTG1>,
+				 <&u2phy1>;
+			clock-names = "ref_clk", "suspend_clk", "bus_clk", "utmi";
 			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&power RK3576_PD_PHP>;
 			resets = <&cru SRST_A_USB3OTG1>;

-- 
2.49.0


