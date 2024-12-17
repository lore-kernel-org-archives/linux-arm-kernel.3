Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27938E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIkaePG1Ki3jrWm17Ja1Ts8o0MCVOj6U5V8OCW4VVRA=; b=DFafKJG8nQ58BF03HpJyAaTIJf
	F8I0osRbAr+Yd1D96ExuOMK7SCodduHGQeHf+zOw3F7YqqA/srucZQl676oCzxfVK/d3ysh2wZeBG
	am4wt9/Rv2reQfzRy3B6sQbCB6H/ThBqHkkOAz2i8jqpAKPjotkfRYwFvs9sYu+3weZf9m3Kjaz0p
	RtYbsgkUoBxGgczeNZK+GC2ZC4kSdeh5+fS4pcI/OzyriBZ97EBPIzh1OdmwALmqbQVRgu9OyI952
	wlAshSuIYjCCD6HRTUXmusL4ICzQcVPqmoZHQCBvSaDrpNgwM3qXAt4IZ0kHOdHZydG/CD1+9Jacq
	IpB+J5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTts-0000000CvW9-118L;
	Tue, 17 Dec 2024 09:29:56 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdR-0000000Cr3C-3Pxd;
	Tue, 17 Dec 2024 09:12:59 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 8369E60265;
	Tue, 17 Dec 2024 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kIkaePG1Ki3jrWm17Ja1Ts8o0MCVOj6U5V8OCW4VVRA=;
	b=E3b2Vp9x/63D+nao7pbGnFvW+1Dk7axFPXqEnSX9enASjQg1mClH3zSt/Lwl3YQAsrCBos
	4lh4KcR9qGsu4hakrZR2Pt+/RYmttIEaT+ZAhtjpo2y6MfPdqlk19qb4qgWgFbe8czVfQ3
	h5PMg1QgdsmMdIA9vqcP/jZR+bNQk/Q=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 94C6D10030F;
	Tue, 17 Dec 2024 09:12:55 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 07/22] arm64: dts: mediatek: mt7988: Add CPU OPP table for clock scaling
Date: Tue, 17 Dec 2024 10:12:21 +0100
Message-ID: <20241217091238.16032-8-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8150ac17-4322-4ebd-9700-bca82c1fff16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011257_991107_8C6EE510 
X-CRM114-Status: UNSURE (   8.50  )
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

Add operating points defining frequency/voltages of cpu cores.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changes:
v3:
- change commit-title
v2:
- drop cpu-labels for now
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 5e53ea47f159..a7954bf5c81e 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -21,6 +21,10 @@ cpu@0 {
 			reg = <0x0>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
+				 <&topckgen CLK_TOP_XTAL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu@1 {
@@ -28,6 +32,10 @@ cpu@1 {
 			reg = <0x1>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
+				 <&topckgen CLK_TOP_XTAL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu@2 {
@@ -35,6 +43,10 @@ cpu@2 {
 			reg = <0x2>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
+				 <&topckgen CLK_TOP_XTAL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu@3 {
@@ -42,6 +54,32 @@ cpu@3 {
 			reg = <0x3>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
+				 <&topckgen CLK_TOP_XTAL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
+		};
+
+		cluster0_opp: opp-table-0 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-800000000 {
+				opp-hz = /bits/ 64 <800000000>;
+				opp-microvolt = <850000>;
+			};
+			opp-1100000000 {
+				opp-hz = /bits/ 64 <1100000000>;
+				opp-microvolt = <850000>;
+			};
+			opp-1500000000 {
+				opp-hz = /bits/ 64 <1500000000>;
+				opp-microvolt = <850000>;
+			};
+			opp-1800000000 {
+				opp-hz = /bits/ 64 <1800000000>;
+				opp-microvolt = <900000>;
+			};
 		};
 	};
 
-- 
2.43.0


