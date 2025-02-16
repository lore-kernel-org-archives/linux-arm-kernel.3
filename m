Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D281FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fc98cghyxHurMf4gIMDc0Zz5DtHcJqgJZZs0uG92bqM=; b=Juhs/ayGThTbMIHMr/io+E+RbK
	wfE3NZordnJv85aMfaDGJSxXwttpR+DaN/Ym8QcPQRvn6n6iel5GQ45Pmp1qrEnpRwt5DKp9gEjhZ
	MlDww1v88qsFX1vtJ2t9A/pJLuG1gJvCzhFv4JanxgPFOoTWSDtPiylwD79dyPj3DBGEuc0oEH7tl
	V6msSFev+WFCrtiijUxcDGto9opKWBu7FmweS4qv1jOg4jHtDi4KfEM1gu5FQz99sPghjFtV+5w5j
	YyMfU2OF8TPRklaHGpYMGtkPHkMPRWYLfgJhJ686/5Zou5i2T46YzDuxyPstJvxAhg5Lj50rZtc3r
	gCc5xYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbGC-00000001aRj-3uqT;
	Sun, 16 Feb 2025 09:48:24 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaxJ-00000001XS6-3mTN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 09:28:55 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C1FD52540115;
	Sun, 16 Feb 2025 04:28:52 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 16 Feb 2025 04:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698132; x=
	1739784532; bh=Fc98cghyxHurMf4gIMDc0Zz5DtHcJqgJZZs0uG92bqM=; b=U
	Dxq/OrxMa2gKBxhrK+CH6UU5wZp2lHS4nIzAy6H2rsW/2yjT3ux75bWjmpCkKtlG
	5LqC/RMzx/grAZknMObG8fO0XE+rjtwAYnmZ08w/6vexwF67+Xw15TAaW6HQC3zu
	7YK0NSw/NsRZzOVYAlZtJXJ9XeFZvEHxzT7pbsqnC4SzLPHTlqeo04/RiQZGnhJg
	XwaQYdW+IwtFl3mkV35+yJ7t5eRszVDdzh6ele2eLJmuzVM3odv9ZoAk21rRIbyo
	7oOYNgG0d8zQPJcslWZ0dNvfbkf+4/Xu8h9EB77EmDpAEjMTB7gD7Nn4ElQWClky
	DU0nVAqAk3QNyqj5K/Vxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698132; x=1739784532; bh=F
	c98cghyxHurMf4gIMDc0Zz5DtHcJqgJZZs0uG92bqM=; b=mbGeIk8dbcNtGibWp
	FAdHWYnvLNF08Nc7PruxRjVl4P3xr9lXm1vvbqR/bG7FvAJtrh3Qj4ZV4P1k3RLS
	q+UhXf2wNkBgeX+UcWPPmxQtO+E7oD/Zmkla8jHEsmU9TQhovyy4pz4X37isEBoD
	pzCbJWp63iZPrHjzN8sHNnzSZT128VC0cdv7M/kBICrzaU2QqtH4QqSA+J+HwtLO
	czST1IjjOrUtb5tdP+ra0PZSg1J85EL9W6pB30mDxJRNEFXs19yQzFdWnKwvP6xA
	4aEelLVk3m3iMqafLKq/k70yGs55tFIhtXCpqNJp5euzkR3TscG0PHiE7MvAGzlU
	1T2ZA==
X-ME-Sender: <xms:1K-xZ65OxRyVitDIJvp2t_oAPbksUgr3e8nAeVPdor2UTLJnKgnE6w>
    <xme:1K-xZz7wEDl02rQMMfcqRXFQW797EHuZv_5qvWhYL-8Ah_3-q-LsnqlG2gWldhcFQ
    cYqxOPmUPkB8kkubQ>
X-ME-Received: <xmr:1K-xZ5dWlrjk3F-KslwtIv9B0tog607ykof3Us_4ijeQZb0JXJFLPADMJqdq9hM6dAy2T-RVgNzoDUGSIfrdvNhPqks1hgFfDvYjsBdhsGnf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:1K-xZ3L05bOBYtUwbSKRPREq7ZQzYPKssdMEwULYWABznUmYbk7XtQ>
    <xmx:1K-xZ-JE46NlAnARUk9iHITRu-T0xhuies8bAG1rgx5oCjYvgJM7Gw>
    <xmx:1K-xZ4z85fRsoHaeU2yZ-UnL7yo1LZoHwV1nmViJkBfdkeIfZCNrMg>
    <xmx:1K-xZyLhf5IhAwFlfMxUVCg7NmzIXQcKvDaathjF0tb-vYD2T5kt5w>
    <xmx:1K-xZwgC21kY6QIkZkeoxNWmqUkjDPrrMRF6V1zRHbzbyoB-waEieO8v>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:28:48 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 2/8] arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
Date: Sun, 16 Feb 2025 22:27:09 +1300
Message-ID: <20250216092827.15444-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_012854_040304_9A8C6E79 
X-CRM114-Status: GOOD (  11.74  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The Allwinner H616 and variants (H618, H700 and T507) have a new display
engine variant (DE33). Support has been added to the existing DE2/DE3
sun4i driver in a previous patch series (x). The variant is selected via
the appropriate mixer device tree compatible string.

Add the respective device-tree nodes for the DE, bus, clock and mixer to
the H616 DTSI, and the matching SRAM section for the DE.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index cdce3dcb8ec02..ab8b70ce7df89 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -94,6 +94,12 @@ l2_cache: l2-cache {
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun50i-h6-display-engine";
+		allwinner,pipelines = <&mixer0>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -150,6 +156,51 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		bus: bus@1000000 {
+			compatible = "allwinner,sun50i-h616-de33",
+				     "allwinner,sun50i-a64-de2";
+			reg = <0x1000000 0x400000>;
+			allwinner,sram = <&de3_sram 1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x1000000 0x400000>;
+
+			display_clocks: clock@8000 {
+				compatible = "allwinner,sun50i-h616-de33-clk";
+				reg = <0x8000 0x100>;
+				clocks = <&ccu CLK_DE>, <&ccu CLK_BUS_DE>;
+				clock-names = "mod", "bus";
+				resets = <&ccu RST_BUS_DE>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			mixer0: mixer@100000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x100000 0x100000>,
+				      <0x8100 0x40>,
+				      <0x280000 0x20000>;
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER0>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER0>;
+				iommus = <&iommu 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer0_out: port@1 {
+						reg = <1>;
+
+						mixer0_out_tcon_top_mixer0: endpoint {
+							remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
+						};
+					};
+				};
+			};
+		};
+
 		crypto: crypto@1904000 {
 			compatible = "allwinner,sun50i-h616-crypto";
 			reg = <0x01904000 0x800>;
@@ -173,6 +224,11 @@ sram_c: sram@28000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0 0x00028000 0x30000>;
+
+				de3_sram: sram-section@0 {
+					compatible = "allwinner,sun50i-a64-sram-c";
+					reg = <0x0000 0x1e000>;
+				};
 			};
 		};
 
-- 
2.48.1


