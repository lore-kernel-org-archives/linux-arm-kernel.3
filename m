Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3B8C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 17:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHQ5vPeo13GqSQMpnsgrtHpzp9AC7Cqs5ZLxrZU37Ag=; b=NzVh5+zFGD/+Bik5vtWK9WvkRA
	pKlE5+Oxag/pZYIVO8w0UNZjKt9Rg+YgsF4P1VzrQB3TyQ4yNxVHLF9FN8MVL2NcjR1/+HEdHcSov
	ViAkltq7OAkSrSCFriqC2qEiQgxA+vRtCfxYbVnr9+sFo5t6C610c5Yl0trSNsZLBmWRlRepkeRtR
	oFoi5qXAByZBy3xMlBQYCdcDO11doRDLm7kD7MUdL3B9XN5l44biPqaRYGydiS5TXSqs4g1bfJqXQ
	uy+Mzyh0O0JZwVvv9EY2Xgp4CYnU5Ntd1GOwtsJfWu2WJGuLBy0x3hw6bhgSUl39U6T4f+Kcl0FKO
	rXokwWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZ0z-0000000H5AP-2oLP;
	Sat, 28 Jun 2025 17:06:57 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYpW-0000000H3Qu-2YuF;
	Sat, 28 Jun 2025 16:55:08 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id BF0886025C;
	Sat, 28 Jun 2025 16:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1751129705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHQ5vPeo13GqSQMpnsgrtHpzp9AC7Cqs5ZLxrZU37Ag=;
	b=Kl0nPAKreVprPknsFX7/M3ARN4b/TiiQapjcQhzYPWI46RKhD0QBm9zy2TcUpcUZ4dMlsc
	MaV1QDDNg5LyZUOf7KynTLYmQZx8kC77ivxWNQL97h7PN9nLAQDzwzdjugytQWK78RHHg+
	eU5qYoSzIafxiXtR6UrxT6/DQk9R+gY=
Received: from frank-u24.. (fttx-pool-217.61.150.139.bambit.de [217.61.150.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 635AF1226EC;
	Sat, 28 Jun 2025 16:55:04 +0000 (UTC)
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v7 06/14] arm64: dts: mediatek: mt7988: add cci node
Date: Sat, 28 Jun 2025 18:54:41 +0200
Message-ID: <20250628165451.85884-7-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250628165451.85884-1-linux@fw-web.de>
References: <20250628165451.85884-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_095506_810608_AA39E0C6 
X-CRM114-Status: UNSURE (   9.52  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add cci devicetree node for cpu frequency scaling.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v3:
- add mt7988-cci compatible as suggested by angelo
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index c46b31f8d653..560ec86dbec0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -12,6 +12,35 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	cci: cci {
+		compatible = "mediatek,mt7988-cci", "mediatek,mt8183-cci";
+		clocks = <&mcusys CLK_MCU_BUS_DIV_SEL>,
+			 <&topckgen CLK_TOP_XTAL>;
+		clock-names = "cci", "intermediate";
+		operating-points-v2 = <&cci_opp>;
+	};
+
+	cci_opp: opp-table-cci {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-microvolt = <850000>;
+		};
+		opp-660000000 {
+			opp-hz = /bits/ 64 <660000000>;
+			opp-microvolt = <850000>;
+		};
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <850000>;
+		};
+		opp-1080000000 {
+			opp-hz = /bits/ 64 <1080000000>;
+			opp-microvolt = <900000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -25,6 +54,7 @@ cpu0: cpu@0 {
 				 <&topckgen CLK_TOP_XTAL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu1: cpu@1 {
@@ -36,6 +66,7 @@ cpu1: cpu@1 {
 				 <&topckgen CLK_TOP_XTAL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu2: cpu@2 {
@@ -47,6 +78,7 @@ cpu2: cpu@2 {
 				 <&topckgen CLK_TOP_XTAL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu3: cpu@3 {
@@ -58,6 +90,7 @@ cpu3: cpu@3 {
 				 <&topckgen CLK_TOP_XTAL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
+			mediatek,cci = <&cci>;
 		};
 
 		cluster0_opp: opp-table-0 {
-- 
2.43.0


