Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8201CF65E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MgZ0OpzeYIEGkSOAjnnCTvMD7nKRRxbynpoh6rZ0UTk=; b=tCOjGmIklEyByi5BTA2Y4FWYzM
	VMiTwfuf3HrhLiCaIPvQ/LtZkE7bIrJIjBOQDm2o1wPcEAgptbJrfDwdB2tAyMHV4rminYhLCPlmN
	sF04tcrACuOcRkAZnQGLDyaj0g9QEQVv+GvIxhvmIOWjzinDBXKfgncOQl1ut/ybf1cAgThA9WgMS
	4KNhPySoToygNuV3+Vad5v8Vc3ZTM7p+zhjKL+Sb9cTDT7DQxG/wablnLom9U2ITqpeud0F4fiKMP
	hozxbBhd4v6GlRI0J0dlCho6QSDY8BYCTTD+lWIV0xyjf9EU6WOLSoUr9aIGP1a7yVrP3K53sOZR4
	/jU2e9Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLlU-0000000CXaT-3N0r;
	Mon, 26 Jan 2026 12:32:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLlP-0000000CXYN-0wH0;
	Mon, 26 Jan 2026 12:32:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08E0D339;
	Mon, 26 Jan 2026 04:32:08 -0800 (PST)
Received: from 010265703453.arm.com (unknown [10.57.51.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 86C9D3F5CA;
	Mon, 26 Jan 2026 04:32:13 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Christian Hewitt <christianshewitt@gmail.com>,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH] Revert "arm64: dts: rockchip: add SPDIF audio to Beelink A1"
Date: Mon, 26 Jan 2026 12:32:04 +0000
Message-Id: <0af77a02c2b0806d4ca72066392a5453fcc89a8f.1767111968.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_043215_317884_1B07EA52 
X-CRM114-Status: UNSURE (   7.64  )
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

This reverts commit bdc4d388c6452498ab62ef2564589f40e0c8c262.

While Beelink A1 mostly follows the high-end RK3328 reference design,
it does not in fact have the S/PDIF connector, only HDMI and a 3.5mm
jack for the analog audio/TV codecs - the tiny form factor literally
doesn't have room to fit more!

Cc: Christian Hewitt <christianshewitt@gmail.com>
Cc: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts | 23 ----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
index 30bdb38f0727..e810ed146451 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
@@ -58,24 +58,6 @@ ir-receiver {
 		gpios = <&gpio2 RK_PA2 GPIO_ACTIVE_LOW>;
 		linux,rc-map-name = "rc-beelink-gs1";
 	};
-
-	spdif_dit: spdif-dit {
-		compatible = "linux,spdif-dit";
-		#sound-dai-cells = <0>;
-	};
-
-	spdif_sound: spdif-sound {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "SPDIF";
-
-		simple-audio-card,cpu {
-			sound-dai = <&spdif>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&spdif_dit>;
-		};
-	};
 };
 
 &analog_sound {
@@ -343,11 +325,6 @@ &sdmmc {
 	status = "okay";
 };
 
-&spdif {
-	pinctrl-0 = <&spdifm0_tx>;
-	status = "okay";
-};
-
 &tsadc {
 	rockchip,hw-tshut-mode = <0>;
 	rockchip,hw-tshut-polarity = <0>;
-- 
2.34.1


