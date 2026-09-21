Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A10C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KIoS8Wk3aO2W56jJdGPN5s/0bYew7FSDY+B2h6y7nI=; b=f3AsTZ+JsUWkfNubDF7bi0b4zN
	ZSp4FG3WbzZAl7/8RaRKV4wiFFMqNW0rUrnNyccnTqJ+w4qh8zsCIP3hdDK7MKjJs8CkIsvmBEz3t
	xM1Cj27BrDr8CqVkB7nCkM+BkRdn7vVMlFv5wZZNa4lJ2ig1fw7jsid3VXghyC8VsK/xM8cKxZREI
	253VK3SH9I9MvFebuXoP9O8T27LkJGtnMuWKO/HEAdQF8KJ6jQ4KpXxiLon3P1v6cjDpjzmJXtr4h
	7u5Has+kAoawmWbnLzxU3HLOZr0NlKfsgWAPOMBtACTMMOy+07qA/eIUqejw96e1Z5k7j9lNgVOXS
	Dv/k68XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YnH-00000001G6s-3zI5;
	Mon, 21 Sep 2026 07:50:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YnF-00000001G53-1mQG;
	Mon, 21 Sep 2026 07:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D90424491E;
	Mon, 21 Sep 2026 07:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A28C0C2BCFC;
	Mon, 21 Sep 2026 07:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789977028;
	bh=HmXNcA1YAnZLx3RPO+XZdE0dPg1yJCRKOMe6ArOea/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ei0GaIjp/JYeY5paFYYdOhUUpKgeAMxtlvvhXH7xYUsbPrUOJGxWKCq0tgnxPeEff
	 8iYfC6oAOtkIgqr9ubL8pRuU6Oy3pNRLis8Js+5SE8EoxM2p+j9bqS5WVLKlIgUd9e
	 DqQyzlNT8CsQLgeV3hms6dvSM1rAZBK+h9VP49mBi0AV9WGFqnRRrLVoj695JtSNWF
	 l4wM5jVmdciTIphDjySjrbtDNQlXdjG7SDv6fvJAQe6ZzYsZSXI4U2dlkFQ7rTfMp6
	 szoExnbD8MSIPlL6OiNDQf5aDAfxxk2Ow3CQlC1CYW77dTZDm5UHP9tq4Cx2wQ++Zz
	 Cv/jsRHK3F6dw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EF7C982E1;
	Mon, 21 Sep 2026 07:50:28 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 21 Sep 2026 10:50:04 +0300
Subject: [PATCH v5 3/3] ARM: dts: mediatek: mt6323: add EFUSE support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mt6323-nvmem-v5-3-2f5d308369f0@protonmail.com>
References: <20260921-mt6323-nvmem-v5-0-2f5d308369f0@protonmail.com>
In-Reply-To: <20260921-mt6323-nvmem-v5-0-2f5d308369f0@protonmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789977026; l=757;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=8n+fwUrTUb93L9BoRmKvxttEJdPZMxj+kOtwP+JsFd4=;
 b=SWoFRNidnBCUlUu656YiSgktrrfkfKBTAufN94jHbzP0uIfkrOYsUy/RuOLTGuMSNNMwX8OhO
 r1AiZZpqB58AUPELx7M3UW9eqjjGGHGyP6PH3PAFVownyr3h4R0WR2K
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add the devicetree node for the mt6323 efuse.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6323.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index c070f4b0936c..c2d08d29cee7 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -19,6 +19,10 @@ mt6323_adc: adc {
 			#io-channel-cells = <1>;
 		};
 
+		efuse {
+			compatible = "mediatek,mt6323-efuse";
+		};
+
 		mt6323_leds: leds {
 			compatible = "mediatek,mt6323-led";
 			#address-cells = <1>;

-- 
2.55.0



