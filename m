Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DC3CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZxuoSjYz+JzFptXRO9TaoeA2QvsqHQ2Unar1rUmf8k=; b=4OVwjZDx3pUtp6FZVEaiVhnXJO
	2vNTMBFydbIi6kjDvjtrg39fnHKURU3hwejfCpr/yzIxwWvUC0D8VgfhBjMNW7zuBm7NyCZ8PbX6Q
	mYhSecs/CJtD3rc+TxUjifDbIiLvXRDvD9o6V4+d6Io/YeFQJPX/ALsWhSoD/3GVnMwiSqbESjGYe
	WmjP+AtPlFdwmvMSZnR35PkB55u97qiwsbWf2fUro8zvvMe1rZ8ECI3ga6Vr8DVmBAaUuoI/+Zg5A
	0dGSn9UAIkFAa1CS8D5Y3w2N0OiWubSESsj+7uIkHFuFdAnwMVcBgOem5jXWqdQPvjCKHCDrY5YSy
	ZGe+TA6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtPq-0000000EQiJ-1lKY;
	Mon, 20 Oct 2025 17:11:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtPn-0000000EQhe-2JHk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:11:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0449D620C5;
	Mon, 20 Oct 2025 17:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF48C2BCB1;
	Mon, 20 Oct 2025 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980282;
	bh=JAXFSTXHoi2lWkQbmUxgDURhf5LRyBjzq6/sRld0KGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qhSYF2x18gezxn8W9SgUF6hy6rUHBaXOg6ph2VjiEAx29wvX5U5Oa05T2lw7reI/n
	 kn1ZTDIbFT7UvV0xitDjxSv1SiFcBxxt2I6sNK6SG1hil/wKHdXC5b8ZYPeeV6Wost
	 cNvEU/VSA9UkcIsVT9MXgnSHiEhV6/+q3iExPXSj/YcNmzsO8CyXwxC+LJiJj+CnYh
	 24H2ACtsEv10HLPnZDIBB17J91hBsKeZwhaMdg5FwDgPXkvKZiIrSiu2RxVlLoMo2T
	 dTamHu9JEDL6WzK7OshtVzyzAdA4KY/Gwa7pD7e8XbD3TC3vy/PqcSSFsGu6JBL9h5
	 6V+cb5GCVcHOQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 770105FEC6; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
Date: Tue, 21 Oct 2025 01:10:56 +0800
Message-ID: <20251020171059.2786070-11-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Radxa Cubie A5E exposes I2S2 through the PI pin group on the 40-pin
GPIO header.

Add a pinmux setting for it so potential users can directly reference
it.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index eea9ce83783c..cebd8e16e845 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -145,6 +145,14 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			i2s2_pi_pins: i2s2-pi-pins {
+				pins = "PI2", "PI3", "PI4", "PI5";
+				allwinner,pinmux = <5>;
+				function = "i2s2";
+				bias-disable;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
 				allwinner,pinmux = <2>;
-- 
2.47.3


