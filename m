Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18FECAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCwmY2pnMCIRz7dbQaD5vqCGF4sY0ycNRhCjd6QBLnI=; b=JbYnFrIir1CoOohhP8lGsXvSSj
	MOnlMVeqY9DMt06/V8SX+604wLEJcJRxi/HQd4WIFBPraZ3o5uRdVppfRo6ANoGzHpHE4qrrOPFst
	27xuPNzXMBrVc/cyyP/CWTJ6nCffm/ZVolM5rxQ2nagTgB8bB2a6uWI3sALNPhsBV8agT0qWefJmP
	SeNHkoUkLutdFRQ8WfscXxh1pKYjaWZf3A4ws+9h8OgK+Lr6j/U557h4m/juEWoN53RWvm2MxDI6Y
	0XLKzRKFx8DTMK3qwGv7zHxJ8yTe0yhlpVfGX9S2Hqq3BbnESEfxv9l4EoR3BanLmM+DaMZEnOQ2K
	NJMfN6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFQ-000000091Fw-0YtQ;
	Tue, 16 Sep 2025 20:25:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEx-000000090kG-23gx;
	Tue, 16 Sep 2025 20:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0387244D0B;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4A68C2BC86;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=RDpCXuNwW3F3KJj6jQvBGASBrt12FmdgYBI4SvuFthg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VxzdsYVHyAvZMHPfARysp6GnpbZGKIKAOSLH+/pcWfrhLRvw8CZeX4KnHfb/K1tX9
	 LE82efrF2Fjxu3Fm/sD4iY5MI7Wqc7UEtrvz1mLbEtH/XNk6rIq7pFvjGXbqCjK//L
	 nmMILf+OnZr6N/2F8f6DxmpoB68iWmkv2PZeNTuLKlyOA8JUcjAl4E2iaZzzzIqc7h
	 l1GZGUn9BySXjQjcz92UWO1Eqp/7V4O1olgW1jJEdBu/c9dIAKtxd2gMrfmsuAqkjf
	 L+kNV8bLWAu5gdX1uA3wymb1CkPqnBtu5MtUbnGeXEaJ5vRKoZEMk+wVUeCAVyqxsl
	 t9yao+8SSno0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE81CAC5A0;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:09 +0700
Subject: [PATCH 12/25] dts: unisoc: rda8810pl: Add OPP for CPU and define
 L2 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-12-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=1899;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=GGuxO6sraElHWuAQ/FHMGYb5YyRNyQdi3IohZFnJO8o=;
 b=45yf1gKixsaK1bkMYGoKRUqzU4uJvxee7LDvXHPDAXh0W7cXAZpeAuF2mOgWJyZNK24hfZKsM
 GIqqJqEHIYuDn891fKiP8cE0LCeJJW/uSiFgTzEbed0Tkmppo8BGIdV
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132527_645297_DCC74C26 
X-CRM114-Status: GOOD (  10.75  )
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

Add available frequency table came from downstream kernel, this
ensures that the CPU clock can be dynamically tuned.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index 1f7a6908d68367441e5dc865216cc7a5c39feb35..299b29e4df6e0a04c5769a568eba73ed1684a9e5 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -16,6 +16,54 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	/*
+	 * There are two frequency table for CPU.
+	 *
+	 * "High" table is used when operating in normal mode
+	 * "Low" table is used when operating in power saving mode
+	 */
+	cpu_high_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-329333333 {
+			opp-hz = /bits/ 64 <329333333>;
+		};
+
+		opp-395200000 {
+			opp-hz = /bits/ 64 <395200000>;
+		};
+
+		opp-494000000 {
+			opp-hz = /bits/ 64 <494000000>;
+		};
+
+		opp-988000000 {
+			opp-hz = /bits/ 64 <988000000>;
+		};
+	};
+
+	cpu_low_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-266666666 {
+			opp-hz = /bits/ 64 <266666666>;
+		};
+
+		opp-320000000 {
+			opp-hz = /bits/ 64 <320000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -24,6 +72,10 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a5";
 			reg = <0x0>;
+			next-level-cache = <&l2>;
+
+			clocks = <&ap_syscon CLK_CPU>;
+			operating-points-v2 = <&cpu_high_opp_table>;
 		};
 	};
 

-- 
2.51.0



