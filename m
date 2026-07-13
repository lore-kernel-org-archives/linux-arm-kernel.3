Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9B5C4450D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 20:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbYEB5ZcCyHG2Dk0PoXn0J4ZXUBYnrV2qBYzBiqtyaE=; b=yRiLJi2vDbw1XZxMznrHHVC1v2
	AHX6JJis0MmVC8xw58kIcXn5MaV6N6iv/cw6+8Zh+B2V9Aww2QUxoZI2xB5yoFHw4kqnfvAdvMlIg
	8G98JthiGnMTMKcd72p+3tOZ28aKw+X8K4OPxJ3iKJ9/YUTjQQNAnR6ni+GE8kfAI880EFhfFJRC5
	eHoNRNmjMdHw12UbM9aiDZDYGC820G5kJnkaxbTwsltJwqgKvae2wiXfYQMfkQSF/r1VOQ5KXjRmn
	nADtzLxU+mm3vNDx/DT3p9lfgAqL2U8Tv4oz/zTvCqfmGn0qYPvQQ3gF4idPI9ipYkt+kxo+Xv0Qv
	aq8ofglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjNIl-0000000AN00-3rv7;
	Mon, 13 Jul 2026 20:30:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjNIj-0000000AMx8-2Lt2;
	Mon, 13 Jul 2026 20:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05A4E42DFF;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D02BFC2BCF4;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974652;
	bh=HgQcs89lvtTaOzFYyfub5T0h+85ljYHNvHGxWWPu98g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AMKKV7AX22d2fg0yJo7rZajRHrSkscirRkHDqfmVfWjfGVHqukhteqysts/Hq9Emv
	 OHs9bZLyOXJHObpsGP9VJzrLpmieuc5GmyOvzCKiMxRsfSw+mdiWFTkVuIrNkOmdJt
	 KnnjQEMsHRbBAWIyvTCZIS61U9A06S218AKfjOFdhlFNNaWxHyunGPOIGuAxts7aGd
	 j7alSFoXyPjTczQaee83A3hahkRmyzMO7DeUEGJAIr+MG5vC/XeaIgN0giEp3V7CjI
	 13hZOEh4Dt8Rl4LeSlmmTIkTsO/wF0IqdX8WZ1M1kIchSdsMbqf3XsyAYUAldf6/46
	 gyfzgZN1g0jxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6CDC44508;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:06 +0200
Subject: [PATCH v3 02/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix
 missing sdmmc cd pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-2-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=1143;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=jHdQb+otpVtf3Zy9VFk36AJnKjgFthAh3MuUfqpCMnk=;
 b=HLDcuT6+iCkV0lggdbczZK0JA0fkv+U686BUqPOQUAz1LtC0OqY638AZy8fZgAPmt7Yn6hn/m
 NIxvVZIFDrtDBuVoBJeOjUmc9P49RDXyELMv3d3mYq2TmF6Ol+7niao
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The cd (card detect) pin is used, but not reserved through pinctrl.

Fixes: 95147bb42bc1 ("arm64: dts: rockchip: Fix the SD card detection on NanoPi R6C/R6S")
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 91b6eefd7abf..67e284a15c35 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -421,6 +421,10 @@ rtc_int: rtc-int {
 	};
 
 	sdmmc {
+		sdmmc_det_pin: sdmmc-det-pin {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		sd_s0_pwr: sd-s0-pwr {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
@@ -496,6 +500,8 @@ &sdmmc {
 	no-mmc;
 	no-sdio;
 	sd-uhs-sdr104;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det_pin>;
 	vmmc-supply = <&vcc_3v3_sd_s0>;
 	vqmmc-supply = <&vccio_sd_s0>;
 	status = "okay";

-- 
2.55.0



