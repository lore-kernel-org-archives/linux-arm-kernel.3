Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964A9C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqaMC8w6qtB1n0xipg6hxZmuKd9Q6kyn2/VlH0Aqgtg=; b=cFvc0svl0Qqw+O/ZqmEnL6a40Y
	simfg7gISLKjWMUpPnE/p/74OvMXlCufufllTG+/BkzmYh3syOa2KI6CNLmy4ZSet6aPc7XHFXVzB
	R7Ugu1Uw9dyFFsTtWmt1RllgQw0DyFJXT8YG0U7MyGdmNMEwsyU2GSY+AfE1lWEZNRs7cDwTpbq8N
	5a3VqFSL3gcpqn0oZVeP4hGUwWroA8EnnhyByypl8yhZ8Q2Z8LAT1ZSbYLlqtzOif2CNlDgEY2FhE
	WfMf246K3E90Y2PB22aEZWjbMAvc8kzpmYs94OEsIYEq9vGp7WnsMjzMJ/0F+EX6QBENdu2Lwsx0y
	PKQIO0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAGI-0000000DQoo-433q;
	Wed, 30 Apr 2025 16:26:18 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAA7y-0000000DPL5-0ZKm;
	Wed, 30 Apr 2025 16:17:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746029822; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f+93AWjXW5VDIYoO0E8YkXtcP4BNlDbolM9nmkTGiVwL68mOHaRgl7DboLKuv8bcPK2Jcd0AhTUZdwV4/AlzQU0nIsNqhKQkkyzVd1mY+jqabGVhjRmAVPJjxdjoUMi6+b5Xl42lVoayoktTy6+RSqtvNevw5YTaBaynbP9Quh0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746029822; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PqaMC8w6qtB1n0xipg6hxZmuKd9Q6kyn2/VlH0Aqgtg=; 
	b=f4aEIU8IMcZFVD8SF9NY5xKGsw4lA1Q7usyi756Q5oMolxZS3oLCIEXM9e30A1AK3WlJu5Hm0fGEK+XXy9BIDVG4OuismmG50gxuQXC079FRnYC0IAfrrCaMYlEi6XxSVeFT8u5U95wHFGYy9oWu2xN7PvrGgpkd0R7z11oqU3c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746029822;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PqaMC8w6qtB1n0xipg6hxZmuKd9Q6kyn2/VlH0Aqgtg=;
	b=Z9TRme2wLZNYuuNwMyq+DF6xQHWyn8Ly6bn2n+YAwblU1fFtJasEEs8LqT2GeuOb
	ST6jMaIKHJj2rzuzlNfMDRZE0xSG1xGpPEXvaXoGeBj27ksCPZ7k2GXLQ7f32UWjQ4Q
	kZKtbcPHXyURRbSLwCAsr24jyM3Vx5FPpiopDfXs=
Received: by mx.zohomail.com with SMTPS id 1746029821190216.44843874019614;
	Wed, 30 Apr 2025 09:17:01 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 30 Apr 2025 18:16:36 +0200
Subject: [PATCH 3/3] arm64: dts: rockchip: add RK3576 RNG node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3576-hwrng-v1-3-480c15b5843e@collabora.com>
References: <20250430-rk3576-hwrng-v1-0-480c15b5843e@collabora.com>
In-Reply-To: <20250430-rk3576-hwrng-v1-0-480c15b5843e@collabora.com>
To: Daniel Golle <daniel@makrotopia.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_091742_238911_62F7E6AC 
X-CRM114-Status: UNSURE (   9.82  )
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

The RK3576 has a hardware random number generator IP built into the SoC.

Add it to the SoC's .dtsi, now that there's a binding and driver for it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index a6bfef82d50bc9b0203a04324d61e0f232b61a65..ce8bcab215c0e6b7786ab3baae6977072497ed2f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1527,6 +1527,14 @@ sfc0: spi@2a340000 {
 			status = "disabled";
 		};
 
+		rng: rng@2a410000 {
+			compatible = "rockchip,rk3576-rng";
+			reg = <0x0 0x2a410000 0x0 0x200>;
+			clocks = <&cru HCLK_TRNG_NS>;
+			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&cru SRST_H_TRNG_NS>;
+		};
+
 		otp: otp@2a580000 {
 			compatible = "rockchip,rk3576-otp";
 			reg = <0x0 0x2a580000 0x0 0x400>;

-- 
2.49.0


