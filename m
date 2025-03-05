Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C8AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GR+8LG9MFmxH5Armmscokt9RPhzC4Bl9BML33zsBE4=; b=tvIcnM3B17d7ymIYC2+UwJuL9X
	tB2dRCiULCKnM0IY7dZzeI+Qsx7Fr5eMKNbZhrnHFNHTNoIZB2iorT6CKDCvGQLNj+cB9QmH3b0PG
	Z2tScexH46aiBdTZ8chtkfroP6OykrIYx3RushiNLmbMbmh7RTW6RRPXkMpiSJmNoBYU5qq/kioo8
	dRAhXT4IqmLH/v12XtwQLRzds/exUOD3/xXQwyEhAeoXUkdGdr7cshQe5lAhc2idsB07kkJYmwb0u
	ckMKnRB5g3QeqIBPUOWQPIAdSZOuhWYPNUQsHanfWOyRw8QbYsOWp6toMb2z0MF5q/gpqEF4ISFs+
	BDUaNqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxXr-00000009WbV-3tPG;
	Wed, 05 Mar 2025 22:48:56 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwUX-00000009O2S-1cna
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741210884; bh=8GR+8LG9MFmxH5Armmscokt9RPhzC4Bl9BML33zsBE4=;
 b=TTuqd9IKskAa8dCaAy0iW1RYXWz9gvUh7rJrrunBwDjz1hpQl6UXSvLruAFJqV9OTtlu4q9LQ
 D9x99nm7vQpBc3eiY+8SeFVYwdrAtQ6kUgua39eiPogXjn+goBHh/PB7rZ55NhIn/iRNQTGt6+t
 TXh9zBWWS1kVwHQ3W8pUUD7dACBh78e39uPlgLXbDqLUZiFHvHwRr5TsRB7nxetkDlEZy0q1ZF1
 igcqzQ9sFvhz3FTgXYZf5ubljILn3nNff1oAq2jHz1fqIClV9/vq5sOR8v2rYHt561p6DdnOkjI
 xaf3lLALDm+E5dkAyF6e0+t1CBcuhdPxtLIUyTmNQPdg==
X-Forward-Email-ID: 67c8c50188fb7bbab4530f5a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/3] arm64: dts: rockchip: Add SDHCI controller for RK3528
Date: Wed,  5 Mar 2025 21:41:03 +0000
Message-ID: <20250305214108.1327208-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305214108.1327208-1-jonas@kwiboo.se>
References: <20250305214108.1327208-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134125_737474_B9FFB913 
X-CRM114-Status: UNSURE (   9.73  )
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

The SDHCI controller in Rockchip RK3528 is similar to the one included
in RK3588.

Add device tree node for the SDHCI controller in RK3528.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 363023314e9c..c1a71ea81e03 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -286,6 +286,30 @@ saradc: adc@ffae0000 {
 			#io-channel-cells = <1>;
 		};
 
+		sdhci: mmc@ffbf0000 {
+			compatible = "rockchip,rk3528-dwcmshc",
+				     "rockchip,rk3588-dwcmshc";
+			reg = <0x0 0xffbf0000 0x0 0x10000>;
+			assigned-clocks = <&cru BCLK_EMMC>, <&cru TCLK_EMMC>,
+					  <&cru CCLK_SRC_EMMC>;
+			assigned-clock-rates = <200000000>, <24000000>,
+					       <200000000>;
+			clocks = <&cru CCLK_SRC_EMMC>, <&cru HCLK_EMMC>,
+				 <&cru ACLK_EMMC>, <&cru BCLK_EMMC>,
+				 <&cru TCLK_EMMC>;
+			clock-names = "core", "bus", "axi", "block", "timer";
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <200000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&emmc_bus8>, <&emmc_clk>, <&emmc_cmd>,
+				    <&emmc_strb>;
+			resets = <&cru SRST_C_EMMC>, <&cru SRST_H_EMMC>,
+				 <&cru SRST_A_EMMC>, <&cru SRST_B_EMMC>,
+				 <&cru SRST_T_EMMC>;
+			reset-names = "core", "bus", "axi", "block", "timer";
+			status = "disabled";
+		};
+
 		sdio0: mmc@ffc10000 {
 			compatible = "rockchip,rk3528-dw-mshc",
 				     "rockchip,rk3288-dw-mshc";
-- 
2.48.1


