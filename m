Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBB7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaXuFtcQi8jjjejEchCnT8N8z7IASO+OLP5F3TIrQx0=; b=qXUGli3vs2f0Ign4pWpniuz/28
	CXjJ1PkigG3mULqOwJfG8K5wrFTO8P6E/f5NbuPZkOJDbi8/BYZAcr0HwUJu4qgwJ+8TbJaippTK1
	oi+KoON0r3Hkr63BGHb4STFT2jm++OGjqB49Z1lIGxaxTfT73qrNXE1xKwVtzJbVRBJXjaST16xl/
	mGT+xgHM9Ta7nR+H/bELenmvx7A8Lf7tJ3RFy5ZgHO0bgS2p4gU235Jnv4oYCUvQSY97hU4IDrAQE
	wX8dEc4/JZ+Ic8b8lHaLBXw+bghCdu2xvctgBST9zYmoImFZFfaQ30+ylOQhIBjyhYrwNTkM5fnCp
	+vSic8RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XMs-0000000Ae7K-0HLJ;
	Fri, 04 Apr 2025 03:05:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHU-0000000Acu9-05Rh;
	Fri, 04 Apr 2025 02:59:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F112944F28;
	Fri,  4 Apr 2025 02:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBB4C4CEF9;
	Fri,  4 Apr 2025 02:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735583;
	bh=BFNG9yNPBQp7lePtcF6xD0SGvnVh48+ACatG3ueW7Nc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VJ0e7SAxLo+dcCqV1y3fiUbeOj8nzMsubkIcSK61bhYmhFqk2usnd0d5OPi7EKFdM
	 DRyI+aUiub90+OB8O8n9WkGNHSq5XjDhMNm+jODyHcVHCh8hI7SogIEa2XHIKBVbw8
	 6tHA5u923suAWQtSIIk/r+qK55kVswhMUDnDMPy8x6G2h1iJ6myNUFghF4bIy9SHk7
	 1uL3lBV9f3bS0qy+RIFP3V8Bnxf3aItkKniTAn6Dhy/J/vRlG5X3AfYwDnSpkSqKXZ
	 5Fe4SyAA72tc2gCFbxbhmwKehbH+Di1xzgWfn9O8OHHZMPggV0LnlKOpky195Gw6O8
	 kIqHaQHcEPOZg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:23 -0500
Subject: [PATCH 02/19] arm64: dts: broadcom: bcm2712: Use "l2-cache" for L2
 cache node names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
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
X-CRM114-CacheID: sfid-20250403_195944_105746_5E50CCC1 
X-CRM114-Status: UNSURE (   9.94  )
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

There's no need include the CPU number in the L2 cache node names as
the names are local to the CPU nodes. The documented node name is
also just "l2-cache".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 9e610a89a337..ad0cac8e4444 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -64,7 +64,7 @@ cpu0: cpu@0 {
 			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
 			next-level-cache = <&l2_cache_l0>;
 
-			l2_cache_l0: l2-cache-l0 {
+			l2_cache_l0: l2-cache {
 				compatible = "cache";
 				cache-size = <0x80000>;
 				cache-line-size = <64>;
@@ -88,7 +88,7 @@ cpu1: cpu@1 {
 			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
 			next-level-cache = <&l2_cache_l1>;
 
-			l2_cache_l1: l2-cache-l1 {
+			l2_cache_l1: l2-cache {
 				compatible = "cache";
 				cache-size = <0x80000>;
 				cache-line-size = <64>;
@@ -112,7 +112,7 @@ cpu2: cpu@2 {
 			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
 			next-level-cache = <&l2_cache_l2>;
 
-			l2_cache_l2: l2-cache-l2 {
+			l2_cache_l2: l2-cache {
 				compatible = "cache";
 				cache-size = <0x80000>;
 				cache-line-size = <64>;
@@ -136,7 +136,7 @@ cpu3: cpu@3 {
 			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
 			next-level-cache = <&l2_cache_l3>;
 
-			l2_cache_l3: l2-cache-l3 {
+			l2_cache_l3: l2-cache {
 				compatible = "cache";
 				cache-size = <0x80000>;
 				cache-line-size = <64>;

-- 
2.47.2


