Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0897DC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnTvkXnLPnEsvcW3pJgPQSCioz7Knyu5VGFT/VMkz+g=; b=D7S7TjofcE4GHImfMIKlWBTfzr
	oFMjTZ8Qj7Ys53RNkEgfnZCwmEOIBmIdo+BnxpRh4Re4eGNJABX8yL1n1maHhCz3/TRTSi3++W/Qr
	NzACqGlH/rLhx0OGNdCFDtBV/DUhc7xSPJKBDZ2HwSXg/7VmULLOQxsuJN9CEoRchpuMzLXiHFRWO
	zGONjT7MW2qoXZIQoYHpG7C10eGhNno+8K/56ohFbXkS3GfAKoeVCnGihT4KS9TfmrQkaGfFd/YWg
	QSjbh1CTk912zLiWN9EfDx/yWsMH1Q2yKEd+Ec/gLTC63QwjW2TaMiLC10AUnC+zjSSm1LEU4Q/Cf
	xobDqiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVDi-00000008qVz-2eSe;
	Wed, 09 Jul 2025 13:52:24 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSiY-00000008SAD-0Rd1;
	Wed, 09 Jul 2025 11:12:04 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 20E831008E0;
	Wed,  9 Jul 2025 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1752059519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnTvkXnLPnEsvcW3pJgPQSCioz7Knyu5VGFT/VMkz+g=;
	b=qSlqOF4lz0CDSZ1vHo349SAGdLFIJeKBU8e/U06hL1eUlc8BDTtkLkOAojH3JuPafkL0gD
	yGEZMpQudM81sWcM7HXIZDZv9o8dx0vDf94YoppkyimDJveOIt3JOdRBAWDTBWgIGTP8LP
	IcJcS0+ctJIT/fo9afDXdD8D1HXfjAo=
Received: from frank-u24.. (fttx-pool-217.61.157.99.bambit.de [217.61.157.99])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id BA1F01226CC;
	Wed,  9 Jul 2025 11:11:58 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v9 07/13] arm64: dts: mediatek: mt7986: add sram node
Date: Wed,  9 Jul 2025 13:09:43 +0200
Message-ID: <20250709111147.11843-8-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709111147.11843-1-linux@fw-web.de>
References: <20250709111147.11843-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_041202_286570_FACE277D 
X-CRM114-Status: GOOD (  10.79  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Currently sram is allocated in driver via offset from reg of ethernet
node. Change it to use a dedicated sram node like mt7988.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 559990dcd1d1..550f569451fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -523,7 +523,7 @@ wed1: wed@15011000 {
 
 		eth: ethernet@15100000 {
 			compatible = "mediatek,mt7986-eth";
-			reg = <0 0x15100000 0 0x80000>;
+			reg = <0 0x15100000 0 0x40000>;
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
@@ -553,6 +553,7 @@ eth: ethernet@15100000 {
 					  <&topckgen CLK_TOP_SGM_325M_SEL>;
 			assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>,
 						 <&apmixedsys CLK_APMIXED_SGMPLL>;
+			sram = <&eth_sram>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			mediatek,ethsys = <&ethsys>;
@@ -562,6 +563,15 @@ eth: ethernet@15100000 {
 			status = "disabled";
 		};
 
+		/*15100000+0x40000*/
+		eth_sram: sram@15140000 {
+			compatible = "mmio-sram";
+			reg = <0 0x15140000 0 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x15140000 0 0x40000>;
+		};
+
 		wo_ccif0: syscon@151a5000 {
 			compatible = "mediatek,mt7986-wo-ccif", "syscon";
 			reg = <0 0x151a5000 0 0x1000>;
-- 
2.43.0


