Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAF4C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYV3Fz4lXy/hUxS2uCWd44wQhW6J1E4HUo63tnJwMP4=; b=p3tG36DgQBO2oKXU64kXqZ0F0W
	w4hqqBNlEj/N2/jHuLWZWfhMorBFGBo3N/c8ojY+jqyBxTGMoH1ytRqAMuj6Td94+16rvY42wjkp8
	9MEjGrj+Zs+NZPEAyq4UKBwSxjOWoTLptJZUQ5Fvr1Ikg7gpI1IV4tGSueNsWZm/NuUl/Ahz/eZZU
	mMkcKCTjvnS6D1fdbYVjtyY7ME+2T0M/eOzC8xmipOhiC/kKSCgmtxBSJ9O6l56JtvreAlBobHq5s
	sdl6r48v+27V9owxyiV1HtvyP9RqEs5dhBdX1JI1Nm9EKYO3Dqtst12YxBQrAFj/qlmVXnWperZK2
	0E7KrP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XSD-0000000AexB-3ZfD;
	Fri, 04 Apr 2025 03:10:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHX-0000000Acux-2gYl;
	Fri, 04 Apr 2025 02:59:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F22544F49;
	Fri,  4 Apr 2025 02:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CD0C4AF09;
	Fri,  4 Apr 2025 02:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735584;
	bh=TR8856X/yXYP9UKEhMkJp7m8f9J+E8ChQGwtop6ZgA8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DUkDnjSM63kRZnwvM0O4CQNp4fGHP7NjHc0kMEGoFudbMbZwd7akrMVPzA7z4fsP/
	 LbzLYWMYPxL/Vp+jaNCT4G1kQQzfAPiLVe4GRnL7kHU6DyYihy7ZNO+Y43TX8Bnp/E
	 SQu6P3nGqwmxa0ZwYvgvpIfC7S8pOEGp4HN86eV4rekb6QVHa59ZiQ86gFvXN16cYI
	 ucq6IBizPqNpMPbRYiTdJeylxn6GfB6XEj6dMKmNQaF7mrRz9hp4c59gvk5IxjrbBn
	 Mw/HuaEhMQ/esGlKPERqAE7RhxCvANISjn9KUarZ5Qu46dIXeGUrJsVuY8dHYWwh96
	 LEIua7+H5rxVg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:24 -0500
Subject: [PATCH 03/19] arm64: dts: morello: Fix-up cache nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_195947_736671_6A5DCF24 
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

There's no need include the CPU number in the L2 cache node names as
the names are local to the CPU nodes. The documented node name is
also just "l2-cache".

The L3 cache is not part of cpu@0/l2-cache as it is shared among all
cores. Move it to /cpus node which is the typical place for shared
caches.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/arm/morello.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/morello.dtsi b/arch/arm64/boot/dts/arm/morello.dtsi
index 0bab0b3ea969..5bc1c725dc86 100644
--- a/arch/arm64/boot/dts/arm/morello.dtsi
+++ b/arch/arm64/boot/dts/arm/morello.dtsi
@@ -44,7 +44,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			clocks = <&scmi_dvfs 0>;
 
-			l2_0: l2-cache-0 {
+			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				/* 8 ways set associative */
@@ -53,13 +53,6 @@ l2_0: l2-cache-0 {
 				cache-sets = <2048>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
-
-				l3_0: l3-cache {
-					compatible = "cache";
-					cache-level = <3>;
-					cache-size = <0x100000>;
-					cache-unified;
-				};
 			};
 		};
 
@@ -78,7 +71,7 @@ cpu1: cpu@100 {
 			next-level-cache = <&l2_1>;
 			clocks = <&scmi_dvfs 0>;
 
-			l2_1: l2-cache-1 {
+			l2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				/* 8 ways set associative */
@@ -105,7 +98,7 @@ cpu2: cpu@10000 {
 			next-level-cache = <&l2_2>;
 			clocks = <&scmi_dvfs 1>;
 
-			l2_2: l2-cache-2 {
+			l2_2: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				/* 8 ways set associative */
@@ -132,7 +125,7 @@ cpu3: cpu@10100 {
 			next-level-cache = <&l2_3>;
 			clocks = <&scmi_dvfs 1>;
 
-			l2_3: l2-cache-3 {
+			l2_3: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				/* 8 ways set associative */
@@ -143,6 +136,13 @@ l2_3: l2-cache-3 {
 				next-level-cache = <&l3_0>;
 			};
 		};
+
+		l3_0: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-size = <0x100000>;
+			cache-unified;
+		};
 	};
 
 	firmware {

-- 
2.47.2


