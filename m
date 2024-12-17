Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23961E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsuZqQ/JNf9mBqEmyBoioMuI4QEZbD0mlGv4gUBUgMo=; b=VkJo3X74a2iJ4Imh9si+cMgeJ2
	6imIYvKktO0wm3M/drSjrne83OnrPAZOhcBG5UhX7448JPgQ3fq0TJ1to3h9muJkEqyxMMndtIA51
	Km9FQ/PIfYhEuOq6HYwjI3oU1DdgjpttJsFKxG2c9RCCKxoInpLyErtJBvzzgA2NgUOKF5cf12evP
	oxOYVJSPpDpMyCr1vTRhKREdS5AT6r7B1GH1na27Ijl3eV69NsC004Rv4e4+1v33obshuBvE+VWk6
	3GIXpenOT9njR32YSTbrH7T4gy10KFu3AgFydbydAxa/E7eOH+iNM12C5RrL9p5gS0jBOgBjIrq/g
	wNTPdpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUzd-0000000D9Gw-3yEB;
	Tue, 17 Dec 2024 10:39:58 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdR-0000000Cr3B-1U9O;
	Tue, 17 Dec 2024 09:12:58 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id EAE04402B4;
	Tue, 17 Dec 2024 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsuZqQ/JNf9mBqEmyBoioMuI4QEZbD0mlGv4gUBUgMo=;
	b=YqXjivKpS8MbPf+wjamGMTitdGmHLBeyWuMLI8+U9pVC8+tPAQHRx1vzJnmcrK6I0IES6q
	YHJHj5QZD8cMpwuQzB5ks1/h/waazZv4NOWgojG47lGw1Wy73TMBj1W04dqsIG+8VxNH/O
	20RfE+4D21WnvjylKJuP+cikuowoKjM=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 4CE5E100532;
	Tue, 17 Dec 2024 09:12:54 +0000 (UTC)
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
Subject: [PATCH v3 05/22] arm64: dts: mediatek: mt7988: Add missing clock-div property for i2c
Date: Tue, 17 Dec 2024 10:12:19 +0100
Message-ID: <20241217091238.16032-6-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f46f7446-c2e1-4dc4-982c-d9d600d29033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011257_536372_DD86F06A 
X-CRM114-Status: UNSURE (   7.63  )
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

I2C binding requires clock-div property.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Fixes: 660c230bf302 ("arm64: dts: mediatek: mt7988: add I2C controllers")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 0e75a8692879..16b28fcf1e3c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -230,6 +230,7 @@ i2c@11003000 {
 			reg = <0 0x11003000 0 0x1000>,
 			      <0 0x10217080 0 0x80>;
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			clock-div = <1>;
 			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
 				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
 			clock-names = "main", "dma";
@@ -243,6 +244,7 @@ i2c@11004000 {
 			reg = <0 0x11004000 0 0x1000>,
 			      <0 0x10217100 0 0x80>;
 			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clock-div = <1>;
 			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
 				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
 			clock-names = "main", "dma";
@@ -256,6 +258,7 @@ i2c@11005000 {
 			reg = <0 0x11005000 0 0x1000>,
 			      <0 0x10217180 0 0x80>;
 			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			clock-div = <1>;
 			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
 				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
 			clock-names = "main", "dma";
-- 
2.43.0


