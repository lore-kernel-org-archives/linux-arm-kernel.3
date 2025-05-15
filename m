Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA78DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JJFY9A0mPReGWr4dEQqworQbI0QyU6TVKJ+h58G0Ww=; b=ktwUDd7VSyRnAQTD4pklF4gHOz
	xBOlVlEraHZb+AYjhWOmllTChxtDhpnlQke4EL6fMd0+5YOhKPun56XPr5FL3j0+EwFodvDZ49Jli
	/nIJgrvgIWoIsiO6eirW0NayYn2cXx9gpA9S8nCeV8WgJs32i0D3G66Ux3tBEINESu7q1jlTYorqq
	9ucdCeYI0oRpM3SLApJCvKQrMCLaqBOb7ls/UlV1/Q2nOGEF+VvJaUClYCNFy9fG6q8uN+9O8mn2f
	h70kmYn2jDFMqIwojJiMlRPrGSj3/CzMR6RVCsg/w3jmbGEu4mG6RmdDWL0pRXHyQ7C43YUW1W1t+
	Fc3ieBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYnS-00000000lIl-2Dcz;
	Thu, 15 May 2025 13:38:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYgf-00000000juA-2kg7;
	Thu, 15 May 2025 13:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747315908;
	bh=E6HitapnSoXVXZhWdCC31t/7KXrJLpjM/uxQsFuXi7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PKCo5cJVB6wGic0dq0bZjBjpRDl9J0G2Hvb9iKGzjFJlvY+OV2uPFHZi3oan+ESwY
	 UYeGOpzVAoomdZmFj4NPIsDWyRVAZ+uVHZSXORtAvMYJ2L6PiWW8V1bi3I5He4KFrK
	 hKrwumbAWn/qsUDgJw5mwqedNIzzMk01nnk3Zd17NjK9HWn62BxrlHsVSA+BNfWqUy
	 g+Qu9ZK7fSRxhtBWA1VINdbLDUjyrLJrlvBeCGpE08tmilNo1GKzf3Gt2uny77p+Wu
	 +WCCKqXznk2Jn97OVZuH3JFsNO/flF5Qx4+nBOnqVBY5fGIpi6tK354gXpH2uSHZST
	 o+emaZ/modeGQ==
Received: from apertis-1.home (2a01cb0892f2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8BD1F17E0630;
	Thu, 15 May 2025 15:31:47 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 15 May 2025 15:31:44 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8188: Add missing #reset-cells
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-dtb-check-mt8188-v1-2-cda383cbeb4f@collabora.com>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
In-Reply-To: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Garmin Chang <garmin.chang@mediatek.com>, 
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_063149_847103_1BAD5634 
X-CRM114-Status: UNSURE (   9.17  )
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

The binding now require the '#reset-cells' property but the
devicetree has not been updated which trigger dtb-check errors.

Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 296090fbaf4953db8075f72073509b731dc41e51..dec6ce3e94e92c8e1e2c3680cb3584394d9058bd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2647,36 +2647,42 @@ imgsys1_dip_top: clock-controller@15110000 {
 			compatible = "mediatek,mt8188-imgsys1-dip-top";
 			reg = <0 0x15110000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		imgsys1_dip_nr: clock-controller@15130000 {
 			compatible = "mediatek,mt8188-imgsys1-dip-nr";
 			reg = <0 0x15130000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		imgsys_wpe1: clock-controller@15220000 {
 			compatible = "mediatek,mt8188-imgsys-wpe1";
 			reg = <0 0x15220000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		ipesys: clock-controller@15330000 {
 			compatible = "mediatek,mt8188-ipesys";
 			reg = <0 0x15330000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		imgsys_wpe2: clock-controller@15520000 {
 			compatible = "mediatek,mt8188-imgsys-wpe2";
 			reg = <0 0x15520000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		imgsys_wpe3: clock-controller@15620000 {
 			compatible = "mediatek,mt8188-imgsys-wpe3";
 			reg = <0 0x15620000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		camsys: clock-controller@16000000 {
@@ -2689,24 +2695,28 @@ camsys_rawa: clock-controller@1604f000 {
 			compatible = "mediatek,mt8188-camsys-rawa";
 			reg = <0 0x1604f000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		camsys_yuva: clock-controller@1606f000 {
 			compatible = "mediatek,mt8188-camsys-yuva";
 			reg = <0 0x1606f000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		camsys_rawb: clock-controller@1608f000 {
 			compatible = "mediatek,mt8188-camsys-rawb";
 			reg = <0 0x1608f000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		camsys_yuvb: clock-controller@160af000 {
 			compatible = "mediatek,mt8188-camsys-yuvb";
 			reg = <0 0x160af000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		ccusys: clock-controller@17200000 {

-- 
2.49.0


