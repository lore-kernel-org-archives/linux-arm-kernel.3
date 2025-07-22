Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978C2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ibyjI5E3qW6kSn6XqkbCf4AS/khULVCPNIJfzv5g85s=; b=LLyNkxoI84dghYOHt6ncUCmokC
	rFO3tKC5kQk/X5u+W8PO0pu0yvPgEh+QNWYjdisPRVWWhhG70tysn9aFiSRcgMr4Rph0G9JCimn2Y
	f4ICyoE+tdaovtPluAqZg6zC+LAdHikJo31EAbGyDogw4EkcUfBVcZUJXdfqOaQvWsZE59SB5wmyX
	+79ekFR6ZQwqfjt39GFK2ZxDvuqdZ11TU/vwfdl56l/Q8Jxwh9IGA7xw5PfuYRMVy3XMRhS/gEeZo
	BLgxarDs7pEbLZy9rfYZFZnZP5U43jsrGKwGhdUWkq6XFsikozS/PlQfzBhF9vmkPqRN13TiDaiUa
	S0r404tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGeQ-000000037VB-0iW4;
	Tue, 22 Jul 2025 17:19:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGbv-000000037GB-0SFM;
	Tue, 22 Jul 2025 17:17:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6819E61444;
	Tue, 22 Jul 2025 17:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01743C4CEEB;
	Tue, 22 Jul 2025 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753204622;
	bh=w1K4bvODgaupuZ6rTZXJyHZe+HGhv/jTyPnbCIz8yz0=;
	h=From:To:Cc:Subject:Date:From;
	b=CFA8FgKUfxPDnZ3oYkOZ86kNnByY29sDQi+lr7AXgJlmDghA5oCtLETsYqBplCXGm
	 2WmCp4OG7tGny1nCj94jOPRaEeJHXqNZRJaCZ+Kv0v2olRyLTCQGd6+9jrNjkk3XAO
	 dGHLQuDsbQbNoNsbvwobiov9EVpkqHJRmylodK4BiIFECMrg32GIbtx8DXhLULx2YW
	 JTBW7kEWqZ6Ue9VsZmgzh4mMlDT74ZbPErX8rAw6cUSWyhL9B4dIr+wWRIQUVcFatE
	 bL3MjD15bGo15RDXnRubQMG1WfsxDxJB+0rd7CS3s1ogVMkUjZVyRPJSHU+6A0dPKb
	 LliRIGvFiU4+Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8183: Fix out of range pull values
Date: Tue, 22 Jul 2025 12:11:52 -0500
Message-ID: <20250722171152.58923-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

A value of 10 is not valid for "mediatek,pull-down-adv" and
"mediatek,pull-up-adv" properties which have defined values of 0-3. It
appears the "10" was written as a binary value. The driver only looks at
the lowest 2 bits, so the value "10" decimal works out the same as if
"2" was used.

Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
Fixes: 19b6403f1e2a ("arm64: dts: mt8183: add mt8183 pumpkin board")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
This is just a few of the warnings related to mt8183-pinctrl... Mediatek 
is #1 for DT warnings on arm64. And by #1, I mean worst. :( It would be 
nice to see some progress on fixing them. Otherwise, seeing new Mediatek 
bindings rather than fixing the existing stuff makes me grumpy.

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi  | 14 +++++++-------
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 400c61d11035..fff93e26eb76 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -580,7 +580,7 @@ pins-cmd-dat {
 		pins-clk {
 			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins-rst {
@@ -609,13 +609,13 @@ pins-cmd-dat {
 		pins-clk {
 			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins-ds {
 			pinmux = <PINMUX_GPIO131__FUNC_MSDC0_DSL>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins-rst {
@@ -633,13 +633,13 @@ pins-cmd-dat {
 				 <PINMUX_GPIO33__FUNC_MSDC1_DAT2>,
 				 <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
 			input-enable;
-			mediatek,pull-up-adv = <10>;
+			mediatek,pull-up-adv = <2>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
 			input-enable;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 	};
 
@@ -652,13 +652,13 @@ pins-cmd-dat {
 				 <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
 			drive-strength = <6>;
 			input-enable;
-			mediatek,pull-up-adv = <10>;
+			mediatek,pull-up-adv = <2>;
 		};
 
 		pins-clk {
 			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
 			drive-strength = <8>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 			input-enable;
 		};
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index dbdee604edab..7c3010889ae7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -324,7 +324,7 @@ pins_cmd_dat {
 		pins_clk {
 			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins_rst {
@@ -353,13 +353,13 @@ pins_cmd_dat {
 		pins_clk {
 			pinmux = <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins_ds {
 			pinmux = <PINMUX_GPIO131__FUNC_MSDC0_DSL>;
 			drive-strength = <MTK_DRIVE_14mA>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins_rst {
@@ -377,13 +377,13 @@ pins_cmd_dat {
 				 <PINMUX_GPIO33__FUNC_MSDC1_DAT2>,
 				 <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
 			input-enable;
-			mediatek,pull-up-adv = <10>;
+			mediatek,pull-up-adv = <2>;
 		};
 
 		pins_clk {
 			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
 			input-enable;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 		};
 
 		pins_pmu {
@@ -401,13 +401,13 @@ pins_cmd_dat {
 				 <PINMUX_GPIO30__FUNC_MSDC1_DAT3>;
 			drive-strength = <6>;
 			input-enable;
-			mediatek,pull-up-adv = <10>;
+			mediatek,pull-up-adv = <2>;
 		};
 
 		pins_clk {
 			pinmux = <PINMUX_GPIO29__FUNC_MSDC1_CLK>;
 			drive-strength = <8>;
-			mediatek,pull-down-adv = <10>;
+			mediatek,pull-down-adv = <2>;
 			input-enable;
 		};
 	};
-- 
2.47.2


