Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A008C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A32ObEoNOzLLIhJ2a8FlXtgVuyOGCOxMjYMX7sZKo4c=; b=ssrg+9rXkbhFet1YaqriSgWxU3
	BqzJiBmXkQkqGiSej/oidEwNN41okBTtKcOl/e81B9h7bmSetSDHQD7tmjQYjZvK/tQ05qv/iHgly
	7kGoZzgM+fTIEWLJyryClQaqktUpc+zd5YSlR5tqIye94kgqS8kYp4q6hDYNzUAVNQ0cq+MLhlM5L
	L8YEy3LvZGT1WofqwBl3xFc6WNXiylgM0jY2XoILMd8cZ94jvYb5+wwmiLRjxlO2ZigyMGznqZ4OV
	EuGYYY1ElIfW48Dnmo+savUCjXBqvEGsRBKyizlaO/apwuQiN5u73sgO03fF3gticzmgi3GWeP4xD
	mqeI/q6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpR9-0000000DcqZ-2e01;
	Wed, 04 Jun 2025 14:49:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpP2-0000000DcTm-1KUb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 14:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3B78AA5062D;
	Wed,  4 Jun 2025 14:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FD7C4CEEF;
	Wed,  4 Jun 2025 14:47:37 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: ebisu: Add CAN0 support
Date: Wed,  4 Jun 2025 16:47:32 +0200
Message-ID: <612b999870dd64789041e4b0e9c568389b3fb95e.1749048320.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_074740_424617_D04C8C32 
X-CRM114-Status: GOOD (  11.92  )
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

On R-Car E3, Classical CAN0/1 and CAN-FD share the same sets of pins, so
only one of them can be used at the same time.

Add support for using CAN0 instead of CAN-FD channel 0 on Ebisu.
By default, only CAN-FD channel 0 is enabled, as before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Both CAN0 and CAN-FD channel 0 were tested on Ebisu-4D.

To be queued in renesas-devel for v6.17.
---
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 4f38b01ae18de4f7..c518638b58db129e 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -327,9 +327,18 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&can0 {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-names = "default";
+
+	/* Please only enable canfd or can0 */
+	/* status = "okay"; */
+};
+
 &canfd {
 	pinctrl-0 = <&canfd0_pins>;
 	pinctrl-names = "default";
+	/* Please only enable canfd or can0 */
 	status = "okay";
 
 	channel0 {
@@ -579,6 +588,11 @@ avb_pins: avb {
 		function = "avb";
 	};
 
+	can0_pins: can0 {
+		groups = "can0_data";
+		function = "can0";
+	};
+
 	canfd0_pins: canfd0 {
 		groups = "canfd0_data";
 		function = "canfd0";
-- 
2.43.0


