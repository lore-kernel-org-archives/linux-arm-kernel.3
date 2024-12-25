Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B507AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 19:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5TwIvC+pogcjmLFzMEJfSARog3Ov5O6G7UbbZ1ELaQ=; b=rfySaYe0JMBsUMQ1xQa9MbBJzA
	yg+Pz3hJ7Sf2mapRbkGcwPzl9ms47OKNK9Ps/p0+NxIK+I+GAYpOQp7k7sK0pKEvHW3UTSkSWJvNk
	6ZdU4+/TRC+15a9xtS75/dOczu9Qugg9EpY/hpStL+Q4gzN5tffLpUI35Mj0ANKvUxmlFmsTFrLCH
	YuNDTk31WPMvi+ppIm1uFja1J2iSoiDLyOOQ116c2n37lWVARFvUYpH542j8SsjVIp+XwE52nogZP
	Dv2lgiaSO52SpoaDA4wCu2+gkmao0vlO7ExMAH49rQKi/KZaCvGpCEf74gcVuFjfEdeb41kN/oCj7
	CM4YuiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQX68-0000000EEwy-0hdX;
	Wed, 25 Dec 2024 19:31:12 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQX2f-0000000EEUs-3dt2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 19:27:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735154855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5TwIvC+pogcjmLFzMEJfSARog3Ov5O6G7UbbZ1ELaQ=;
	b=OjTI0p64NaP3/yljJiC8m3FwQD4cgw7sRgLh0H0uWN779kN5uHlp5hm9Q5UqG+/bJBDQZD
	YF4vFvJIDJXjzjS2lEGSlWhJkqvumSw5JEh9qlM+5oGhmCMbbCqbEzVfxCIQidejrQ8M5p
	ni1PXGewnW9oj1VLvniL4d7syoPQ9Xh5niLifoAeKXJ03zZTY9uEObDKcQ1m7d1Z33F/PS
	Vn6s3YcVddzZds4cw3aEFSorCxie6TAKsbwYb9kdwhRTds9Arfs8e9D4bDb6Hin6XmPRBQ
	62aF+8mMbtLBZAvIHbd0LTlgrEaMnG4PYxhIexHaKr50e+SvweJ0U0d/iWE5EQ==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
Date: Wed, 25 Dec 2024 16:26:20 -0300
Message-ID: <20241225192631.25017-3-val@packett.cool>
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
References: <20241225192631.25017-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_112738_068443_CBC05226 
X-CRM114-Status: GOOD (  10.72  )
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

The mt6779-keypad binding specifies using a compatible for the
actual SoC before the generic MT6779 one.

Fixes: a8013418d35c ("arm64: dts: mediatek: mt8183: add keyboard node")
Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 ++-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c7008bb8a81da..0aa34e5bbaaa8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1024,7 +1024,8 @@ pwrap: pwrap@1000d000 {
 		};
 
 		keyboard: keyboard@10010000 {
-			compatible = "mediatek,mt6779-keypad";
+			compatible = "mediatek,mt8183-keypad",
+				     "mediatek,mt6779-keypad";
 			reg = <0 0x10010000 0 0x1000>;
 			interrupts = <GIC_SPI 186 IRQ_TYPE_EDGE_FALLING>;
 			clocks = <&clk26m>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 9c91fe8ea0f96..2bf8c9d02b6ee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -449,7 +449,8 @@ pwrap: pwrap@1000d000 {
 		};
 
 		keypad: keypad@10010000 {
-			compatible = "mediatek,mt6779-keypad";
+			compatible = "mediatek,mt8365-keypad",
+				     "mediatek,mt6779-keypad";
 			reg = <0 0x10010000 0 0x1000>;
 			wakeup-source;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_EDGE_FALLING>;
-- 
2.47.1


