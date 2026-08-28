Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6582C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umRC7/1rxZqqrWBP2CEngTqkIwciikbySHcKhRtbIHI=; b=2wCVYUqpx74eIbbzBUhkGQwoeM
	v4DRIUBP38DCDrbV7eAm1g3hWdXrYzcL1MwTFz4yu/oSiA+sVhpnwDey9C5H43G26UfagTt0JUURs
	mkdRAEi1sqTDzRun4sDaWy/bgIjXo1iIDLzCIxJlUa2/bvceHYUJVOtV7V98lQnRBifvzo7JWWyuv
	5g/hQGaYTCVFF6PibIjM6vZWf949RJXAplA433kiJXQzyicA8sA8GkHnAtNAlbtIPDEnJbU/W00oW
	LaW0PzDnVDkDxPKInRif4l8YV6yYxkBoVPEyumu30uKa/tal7Qa8f1AWNLxAnNuedUFD4wk06DvYk
	0rJMq74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv1y-00000005fcz-2UWI;
	Fri, 28 Aug 2026 11:45:58 +0000
Received: from out-119.mta1.migadu.com ([2001:41d0:203:375::77] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv1s-00000005fXL-3yA0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 11:45:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bVACo8v5FEqx+4/0ojCAbrd58C/+n+Gtjw1O0FYevc8=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917551; v=1; x=1788522351;
 b=cihW0Gc+3f3bgK24aeajsH2tVR6faDKSCqHTJQimjA8KO7WMo4B67RMhs/4msb0uIptkXCf7
 qM6cebNW56cHouyAtq1LgCH+To/HH9PbC94A1byX3o9otcRfLYQRFJbxXba51cQ1I9AaOWaF03K
 f2lH5CJrjSCYOEZWSTUtC6oTbbTUwuJHdVdbd/3GWHRHpHNUgDatMUxKQpnuDdsdYd69gX6EVpt
 Lf1bDMvfnERny+WNZJQ2OYaCoHTgwZC+zyoNhRyZ0ZfYFq+805Mhg0RRFYT/YRP/G1W9trT7F4G
 NP/KwjvzDEeH7BOOTY0qdWOUKtXm9upODa2zLcYTQP/1g==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id aac531fba34cc0c3;
	Fri, 28 Aug 2026 11:45:50 +0000
X-Mizu-Trace-ID: aac531fba34cc0c3
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 3/7] arm64: dts: rockchip: Fix hym8563 pinctrl name and sorting on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:03 +0200
Message-ID: <20260828114530.1315798-4-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_044553_122301_1CFC223E 
X-CRM114-Status: UNSURE (   9.78  )
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

Use the pinctrl names as used in the schematics and use natural sort order
by property names for the hym8563 RTC node.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 16c35250bacf..84bfb33a4774 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -536,10 +536,10 @@ hym8563: rtc@51 {
 		reg = <0x51>;
 		#clock-cells = <0>;
 		clock-output-names = "hym8563";
-		pinctrl-names = "default";
-		pinctrl-0 = <&hym8563_int>;
 		interrupt-parent = <&gpio0>;
 		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&rtc_int_l_pin>;
+		pinctrl-names = "default";
 		wakeup-source;
 	};
 };
@@ -704,7 +704,7 @@ hp_det: hp-det {
 	};
 
 	hym8563 {
-		hym8563_int: hym8563-int {
+		rtc_int_l_pin: rtc-int-l-pin {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
-- 
2.55.0


