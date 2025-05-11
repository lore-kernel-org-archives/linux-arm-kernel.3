Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14279C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIpcylB5fzCTDBOFA4Z00OOIwBo7iCTSZMGBABeHvVU=; b=Z2+c9araT8ajbUewFZ1sDt+qds
	B5CZCdZvQtzAgs6cn7VRXWKjTQfLd+e0xOfaxXx2RevGWTD58NKwSbiBu+jeadltVSjFYydy52oC+
	HJKe3KypOzfE1WyatG1HT5Nukkok1EKE2TMdUNuc5WVw4dd6ot6AqML3iZXaFfZzf7xXQGcEfyUeP
	NHbLae6UUfh+Q9wd71JUKc5WhvmUj0szkv3DOWTYtHz/iTOh0RAp63KM6hd06h/futbfZhIMlrC2O
	H9SX80Ol4niaBwCWbHEu5QFeO2O1oPHRKV3DwB8TTSbPTzUOW2rAThqv9txEboVMWIS0iDD58jlT+
	nNJkoxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7b3-00000007Lyg-3yQH;
	Sun, 11 May 2025 14:24:05 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7X6-00000007LWM-23zj;
	Sun, 11 May 2025 14:20:01 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id BA9606031F;
	Sun, 11 May 2025 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1746973198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIpcylB5fzCTDBOFA4Z00OOIwBo7iCTSZMGBABeHvVU=;
	b=WRrECvsfhitZDMIF0vlite1OGd4LPms+7fBxsoz2sedS++0zkHwj00k+QmFBqi/+zCMBla
	wNcwMCU8OOllB5kaxKQMJtwFz5SbxlA0bHiW1tgtV+1PUyxdNl0U2yHulGucbCVUlq4Ko6
	DEMfg+r5YpQaDmnFul3pz42jtM4Z7W0=
Received: from frank-u24.. (fttx-pool-194.15.84.99.bambit.de [194.15.84.99])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 98F64100500;
	Sun, 11 May 2025 14:19:57 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 06/14] arm64: dts: mediatek: mt7988: add cci node
Date: Sun, 11 May 2025 16:19:22 +0200
Message-ID: <20250511141942.10284-7-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511141942.10284-1-linux@fw-web.de>
References: <20250511141942.10284-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: beeb7784-23fa-410f-9e58-cc51116d869e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_072000_674056_69544814 
X-CRM114-Status: UNSURE (   9.01  )
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
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index ab6fc09940b8..64466acb0e71 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -12,6 +12,35 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	cci: cci {
+		compatible = "mediatek,mt8183-cci";
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


