Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBAECA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 02:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Cc:To:From:
	Content-Transfer-Encoding:MIME-Version:Date:Subject:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bro9JjGbbaJ8cSHnyXnMRJZOIgl4PR8uy7wdbmoDRHM=; b=lPVNIDEEgmLDgOFpM5N1sKsov2
	9g8hzH1Rsq04l6ca8zYCwOeJ+xIaGrPXL/lecCqC4lz3LPUocVE3GqasNJv1Q3+k/jkba2k506Kv9
	a7UEX9YIjiAMP09nTNxtqYaiL1ACmtoY5vQiRdR4rMnA1LOVjGUOkzr9mLXkfbKTYmEeNPkpMUi8c
	GwoC1MHBTCR3ce7bnTDWs/gBQZXk8jAzdVo2v4DMQX+Dw7ZuFTTdD/qW90tQ34Mz6erulYq9m3pCe
	9j3Mg1W3CcTsy0qcgjAvdjjz2RhUp6KTNzGcmQC0sxBSBfVewo8geeWhhfFtZ0ct3+/e/3opADqM7
	IJ/F4xTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYdh-0000000CBM2-2mR5;
	Wed, 20 Aug 2025 02:33:25 +0000
Received: from mail-107160.simplelogin.co ([79.135.107.160])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYb3-0000000CAyQ-3mny
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 02:30:43 +0000
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1755657037;
	cv=none; b=hFs+mQlxgLBbdopKrhrtUMwXpK8cUhzNU0sPdtWxKJiBa0C8FgRlH9YjSV/oglpYwJn5VZJ4/qPlIK/8lcN46w4FL0tlt0KVYGm8jhUKnBJr55PZ0ViIFfLgF7nkYN0XDwIuDOn3m4+0A6lSOBK3TNri+mbewY8A/tSs9xlySa+1xU6XxsuwaHwAdKP0lnHJrzckoy8ev/0sJ/EBYTk5Dpn3ZDxgXcCXNKV+eTUc/kSey9iTOChdfo4Jmo7GcBVnNYL+r7shhXp7DDtzm0ULAkYVs23Vn2EXSWTDrXq2AfyPnRAp1wnyS+5EHVVeno33zTgV2pGFbZOghmH2EycXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1755657037; c=relaxed/simple;
	bh=mE/FNXHmnDkXlnsGAUPUvCmd7qH+niPGFcQKPxcn5Fk=;
	h=Subject:Date:From:To:Cc; b=T5OSS3xG15zs0xt2HhfJVQDQqtFpM0JBQ4ComViM/+bEXcF3VSOwi1ncdWHs7D9heLZOl6hF/IT7MPqOD0wTh30B/QxOi24hx78acHljHiSc8KTdijnZe7o2dVtYtzUFVqP63Bo3HeFoGlz2fAKfMVb23HXZJoRAyXyNJOzQTeONBRG/EqfnQFKyg928eCtImJWq/jrvaqLUy9MXMzE7kRo2F2qUGOYnwNaFFsqz7aBoHt4kcv4FBUqrNfqvJ2dhunJE+MMrg895X6b4Y9bDIwy409DGMFhpm/qHRimubpWoeNmERwJoNTnO29+BFA9rixuigvft1ZpN4zPGcoi9cA==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=projectinitiative.io;
	s=dkim; t=1755657037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bro9JjGbbaJ8cSHnyXnMRJZOIgl4PR8uy7wdbmoDRHM=;
	b=pmrRVYY58Q58irFZMMKFUaJtggwUH2A+WuewyrE9A/1xF06WPConJYRuUpZ1UBTnZg5s+b
	Z36vpYN9Ly4u7pSQcPlstKfEH2a4RESSddVYI2d5iqAPbuGAg2XSC4LUsUgQeAQBkBwOKn
	YZDHdnHClk5jYmfAZ+g1HJkiZmTvBGQ=
Subject: [PATCH] arm64: dts: rockchip: rk3588s-rock-5a: Add green power LED
Date: Tue, 19 Aug 2025 21:30:12 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: kylepzak@projectinitiative.io
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-rockchip@lists.infradead.org,conor+dt@kernel.org,krzk+dt@kernel.org,robh@kernel.org
Message-ID: <175565703702.6.15498212790604388615.862782045@projectinitiative.io>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 862782050
X-SimpleLogin-Want-Signing: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_193042_149637_46FBF7AE 
X-CRM114-Status: GOOD (  10.07  )
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

The Radxa ROCK 5A board includes a green power LED that is defined in
the vendor device tree but is missing from the upstream kernel DTS file.

This causes the LED to be uncontrollable from the operating system, as no
entry is created for it under /sys/class/leds.

This patch adds the missing node to the leds block, creating a
"green:power" device and allowing the LED to be controlled by the kernel.

Signed-off-by: Kyle Petryszak <kylepzak@projectinitiative.io>
---
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
index f894742b1ebe..f70b49d9361a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
@@ -52,6 +52,13 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&io_led>;
 
+		power-led {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
 		io-led {
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_STATUS;
-- 
2.49.0



