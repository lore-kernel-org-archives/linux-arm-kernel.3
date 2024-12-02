Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDA6D78315
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO38YWQlKDPKx94YytUi0voflSUi444I/+TJIqE+cyA=; b=VQmn/bGqoTKZACvhp7Mdu4/jl1
	cLWvdbnugUNnQbVYjD955Q0xcU+JnWxRZpPKwyuB7k64p3eTtdPMMJ+uKGt1nMKt5/xru0HIqLuhX
	paG+lWzeOoVdXL/ZZN7340b4lgIsjipnSboXNpOp1oDNK1dWALSZtYmBNBM9FeQUxit6ix88ehBUz
	bP1mIRggv58xq3AhfgSUn8UyzfiId1gTXOU//0SvXgPofhJqstyx+5slqiW0K9086YdC8FqwqO1vj
	qlt3BwjRRq+yX2hZKuYnoEv82F+KAntQXsyvyr0Vk0/UvFK39wBFnfND3hLbgFPqB4pyiAQfSKIV/
	WHy/6Rfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5hl-000000066WI-2JA9;
	Mon, 02 Dec 2024 12:39:09 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VL-000000064A6-0Uds;
	Mon, 02 Dec 2024 12:26:20 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 9006241A61;
	Mon,  2 Dec 2024 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LO38YWQlKDPKx94YytUi0voflSUi444I/+TJIqE+cyA=;
	b=AeWwZsC6GepwJXqt2oaCwdTjZDB/rqFHyvg1IwPRVdgosWLDg0nmqKKy9wYjjvpoNJrGbT
	I7yavoCI3tsoV2I7beXAHwbvELObEPATxtsaHxNxLg7BYc5R5iepwgv4QBC9ACZf6mQTHl
	/a+gAYYOSrUSjJR5lENpiqyB10lZhGA=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 06AAA360554;
	Mon,  2 Dec 2024 12:26:17 +0000 (UTC)
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
Subject: [PATCH v2 12/18] arm64: dts: mediatek: mt7988: add missing clock-div property for i2c
Date: Mon,  2 Dec 2024 13:25:53 +0100
Message-ID: <20241202122602.30734-13-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e2d390f3-2774-4bd2-9ab9-5306062dcd01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042619_298078_754F031F 
X-CRM114-Status: UNSURE (   8.38  )
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
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index abf81a7d02a5..956f2be600a2 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -274,6 +274,7 @@ i2c@11003000 {
 			reg = <0 0x11003000 0 0x1000>,
 			      <0 0x10217080 0 0x80>;
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			clock-div = <1>;
 			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
 				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
 			clock-names = "main", "dma";
@@ -287,6 +288,7 @@ i2c@11004000 {
 			reg = <0 0x11004000 0 0x1000>,
 			      <0 0x10217100 0 0x80>;
 			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clock-div = <1>;
 			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
 				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
 			clock-names = "main", "dma";
@@ -300,6 +302,7 @@ i2c@11005000 {
 			reg = <0 0x11005000 0 0x1000>,
 			      <0 0x10217180 0 0x80>;
 			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			clock-div = <1>;
 			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
 				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
 			clock-names = "main", "dma";
-- 
2.43.0


