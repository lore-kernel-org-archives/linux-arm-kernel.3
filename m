Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2368D2AB1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/I+n4zk0HprnXJxl1E8/AMoicAPVbZXERfZKvFjQfOo=; b=J4F0NTB3k4Rd6VxiE1W47RKKY1
	llIwwCH0EGbbmHeF1cwgNB7v2/4TKHCaX316ncUjqzCwRfM1bJO9hYHBxHYmX+Qk86iRpqSWsK3hm
	r40JytPGeM9laKPfd0PATGDBgbyVshzZiAxWBgmXQr97L/FnXT0vZXOiD7Upx4KaxxlhjjwXd9spW
	Ekad0w6bHS0O2VbDXDlwXYi3YAGKZ2Ur+0/VQFSqk5Wi6diKmPI+irteIlRDf5FYR3lD9XdUX0jXN
	6G+Wh8akCFlnCyDsRUEhUbNwG7XEY6EPK6II9vvw/ohiErKck1zKKqZDsqwqGiG7u5ACz+R9HmwGO
	Jbl45xmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jyt-0000000E9Xo-3hzI;
	Tue, 29 Oct 2024 11:01:47 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jdg-0000000E49m-2kHc;
	Tue, 29 Oct 2024 10:39:54 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 87C271014E7;
	Tue, 29 Oct 2024 10:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1730198387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/I+n4zk0HprnXJxl1E8/AMoicAPVbZXERfZKvFjQfOo=;
	b=p8ODP3DhUBjIU4148EQGvGksboZwH87pbNhDCIoGrwDjRk/90VbNWMXSKltBFKYvxXGmWF
	ryzsf5j4SFqE8DYLaxHo0rbIIvTL1EZQBNo0ddg9qVTQ+KmWPG376+Y5Dtxml/I0/UEb+O
	FF9fyWPoAz2nuUsx326bR+w6eL9rkUA=
Received: from frank-u24.. (fttx-pool-80.245.73.173.bambit.de [80.245.73.173])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id F3F1B3600D8;
	Tue, 29 Oct 2024 10:39:46 +0000 (UTC)
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
Subject: [RFC v1 07/14] arm64: dts: mediatek: mt7988: add mmc support
Date: Tue, 29 Oct 2024 11:39:26 +0100
Message-ID: <20241029103937.45852-8-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029103937.45852-1-linux@fw-web.de>
References: <20241029103937.45852-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b606b4ef-e6a3-4657-86e5-a5b31fbcf146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_033952_869632_5869C2FD 
X-CRM114-Status: UNSURE (   9.02  )
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

Add devicetree node for MMC controller.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 777067b326b2..639c307b9984 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -278,6 +278,28 @@ ssusb1: usb@11200000 {
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 		};
 
+		mmc0: mmc@11230000 {
+			compatible = "mediatek,mt7988-mmc";
+			reg = <0 0x11230000 0 0x1000>,
+			      <0 0x11D60000 0 0x1000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_MSDC400>,
+				 <&infracfg CLK_INFRA_MSDC2_HCK>,
+				 <&infracfg CLK_INFRA_66M_MSDC_0_HCK>,
+				 <&infracfg CLK_INFRA_133M_MSDC_0_HCK>;
+			assigned-clocks = <&topckgen CLK_TOP_EMMC_250M_SEL>,
+					  <&topckgen CLK_TOP_EMMC_400M_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_NET1PLL_D5_D2>,
+						 <&apmixedsys CLK_APMIXED_MSDCPLL>;
+			clock-names = "source",
+				      "hclk",
+				      "axi_cg",
+				      "ahb_cg";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
-- 
2.43.0


