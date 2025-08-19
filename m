Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4198CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NFTccCtP1uRd9Wzn26xkl65ZZWOAVPiCAiod9SnwQ6w=; b=rbIp07baZlrR3hBTpEggygve7h
	nYIrrBmW2vZZjNUpQN+msC+meMXRHrzsltF+7cWs6UBVKqXdygBai4h3g3+DC8DjVizczCWcJPwI9
	GrotsvL1k4OUIhakmG4RW4WgWOHsRuZPGHaieYiPDmfvTWUgRAiKMwa17AH2bCRvGWub10xle5cW0
	1klya5tTpnsUmMVXg1yGd08dqJ9Ge9dgpIfqGlP3St0Fug+UiPOoGE9PdNlT3E5AICrR+YYtkAUKN
	Ql3+U4XsOlyjulz1L5DnnbDSce5bqkjhNAYY/04rhGH9dI5fLe5y1XZY7jJUclNDelHelAtRhLVIU
	oREmBrMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQph-0000000BC9e-2AjW;
	Tue, 19 Aug 2025 18:13:17 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMCd-0000000AZ8D-3ZHa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:16:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb7a41b78so71836966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609398; x=1756214198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFTccCtP1uRd9Wzn26xkl65ZZWOAVPiCAiod9SnwQ6w=;
        b=hSJPbmBmXjlSSt/mW+dW2HHiQWINU6y+nzJjEuzSotqKSzCOQqWkUc5PeNGwWLM/mW
         qpLFJDLC8iFlgvJlFrC3mfrsKCG1qcolZvJbTon6oKC1PLfpj863L+UHsfaW1vUmlLCn
         3zhTYydqYJsWAwsupj2f15GvjERCFDLToL34LQPvC7fBdBcz/4rhJH4EgrUzHustATjt
         sWjG43WfaMteX47lpUNMGljU5UaabebG0cWdLCzcuVtyr6BBXVkKxPLalrbKzCUmGhqB
         6g6QZ4YPXWYGV+0MEEfs4PSE5oX5M3+x2Q4a3Y8FljXzXM1HNpwAiGnnjsTJwl7gdHmR
         OAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609398; x=1756214198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFTccCtP1uRd9Wzn26xkl65ZZWOAVPiCAiod9SnwQ6w=;
        b=GrIDx5Qnqk4xlbjB8NLyHe5nxzP06OhVdWJMUyKQJd1SZtZAFtHVsHr0Fa0mxSyL7D
         Rpi+j6/GrPiyAhdhgb22ozhggTv96XGmMyfmC0xNfWhUkgiz0x7C8yffqRlJmgvg+1fA
         4tdNvuTIas0uy1YO2ZrnRZzzr6eRIgUAbMBxzKh3kl+Ig4enh93KfvbRu015pIr6kxsT
         fXrTuQvd/wGLDXUI1WENibmhEEIe6kDO1BVMa3WDTApMNav1/b15ZHlg8vTntK/l3OZT
         lbk/BqjAkcBIo0LqyzGYysroQvLyvl3Nsh2ec19Z+GSGPNObIF26qaqPWjxZBAW1+/sn
         tTyw==
X-Forwarded-Encrypted: i=1; AJvYcCUiSjkR8LDKw8aR/NJhyd7obNtX79iqmc/JyjVpvusFInk6SGhzPSio/ePdz2i6ZiZebn1dhAJmpPzWvS40oZGg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5zwWJwUPe9zW0DspUpCwTO5HAn7uPcfYH6S5DX9+hNtvWqhU4
	PJc17jgPYwV9DF9CvT4c4zlAq95E5DaYR3vgizwcJ20CPvtQlBNsBiRUc7YdfamCQCM=
X-Gm-Gg: ASbGnctBZI2e0Zxec+mSVUVajys0HG0HZlXtU+eZ5i3AtKp6kJ2/Ew4xHQOrY/0zAbb
	SXrvzVo4ESfmBeos/pD9dNj952Dc46A9gnuU+2CBU6gOeHZGQ0Qr+/L/b71yCmJtahtysP5U92S
	ZyAakBCYSa3QNSuc9cMDa30d1492v4FNwIAOiUSrWtemw4wo+oh6AYTd6Rzkm54eRwjzz1v9ET6
	TzExDCn4IK0EVQZP+Pnb7uhLVfRC27gntLbUl0SOtOnFGyHBhMhchmNLou0Ly0xz2Qs4i+Vl+NW
	J1Q2oe2OHsehSmjpIJrrwa0AH4JEnWeOkZ4w0WSshnBIGZsjPzUkQHwLrUQAXd4DMmVhjahP6CF
	C8JW2mzLyenEcGoMVLqyPqVqCGFcc8EhzCw==
X-Google-Smtp-Source: AGHT+IFfradJwu63FUvwOcWbWyp08fd8Whf4HqNHMGG30wEYvsKB2XGXhYm0YYCzs8cM3Nd6qzySVw==
X-Received: by 2002:a17:907:d90:b0:aec:4f0a:f9ac with SMTP id a640c23a62f3a-afddd1e433dmr90382066b.6.1755609398378;
        Tue, 19 Aug 2025 06:16:38 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce73e22sm1014924066b.41.2025.08.19.06.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:16:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: marvell: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:16:34 +0200
Message-ID: <20250819131633.86478-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2105; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=25w9nGp+VOPFwF4xTLHunMmNW2bcpRsbxGsrD/LXVBg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHkxJCXGErwlGNb4uJVx8zh/NpiVZLUoMdgV6
 s1NAOw/hOKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5MQAKCRDBN2bmhouD
 11/vD/9KkTiJjpBqGx1OFTTWGwcAynI2RwbCno697sZX6nOadE1UXEXPVYt/raAiGjguhjov+zP
 4NewcszElKfspMkCFlX2RDpILBiNfGCdf+1Uazl3Zi+Ltmfo8YzB+RjrD2NIyzeK1IS8tvaq7OK
 rTcYVk17JbVGHeqh4L/ofJl1cpvm3rUq7F+RQiwEvCx6Ai9Kgb24R48y49+DR1XMOD30r7m+veJ
 a0qyaHz8opg1LJI1ktI9A2GeQUdAeelDe7PcgNNOHRkUc95qNvdZDdq/JX1gLFeo0WkZLw63wMd
 Zn/CsHu+Odo9L3p/YxLAyWN3p7byj7gKg1WSUSKTleIEca5/StBNqdTuuX+vdEn7OmevGhLj68D
 RFMFbsK2yBk7SWNQORW+nM2OUCywV/sBZnDd6Xcfach6gnAYWDJGGCdcDnga4VxTaEYNWkwNQoG
 WEgJd6OqacPsntBQG7cr8QrFBo9MLW1wvUSKquT90WkJQjuNk171q8RNmP566mrWiMlH6q6qF4T
 CKtx6yQOLseAJR/O+Jsl4nIWm/qaK5M31RoDcv7PWqy5TpSn3dybtAodNajbYmmkPhvKDfj2Bvo
 crn4Ax0STKTpxaYa+kIermy1ul++6DSrNCkLXPHIl6Gy7hvZ060ZE3zvaw4P27mnJ6+Nc7FigAR FaelHWw9cWGq7mw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061639_887160_0F2F16DD 
X-CRM114-Status: GOOD (  12.07  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi   | 2 +-
 arch/arm64/boot/dts/marvell/cn9132-clearfog.dts | 4 ++--
 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
index 605f5be1538c..4878773883c9 100644
--- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
@@ -322,7 +322,7 @@ spi1: spi@805a8000 {
 
 		nand: nand-controller@805b0000 {
 			compatible = "marvell,ac5-nand-controller";
-			reg =  <0x0 0x805b0000 0x0 0x00000054>;
+			reg = <0x0 0x805b0000 0x0 0x00000054>;
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts b/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
index 0f53745a6fa0..c872c8eca518 100644
--- a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
+++ b/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
@@ -559,7 +559,7 @@ led@2 {
 };
 
 &cp2_ethernet {
-	status =  "okay";
+	status = "okay";
 };
 
 /* SRDS #2 - 5GE */
@@ -572,7 +572,7 @@ &cp2_eth0 {
 };
 
 &cp2_gpio1 {
-	pinctrl-names= "default";
+	pinctrl-names = "default";
 	pinctrl-0 = <&cp2_rsvd9_pins>;
 
 	/* J21 */
diff --git a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi b/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
index afc041c1c448..1c9996d8cb24 100644
--- a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
@@ -442,7 +442,7 @@ tpm@0 {
 		reg = <0>;
 		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
 		spi-max-frequency = <10000000>;
-		pinctrl-names  = "default";
+		pinctrl-names = "default";
 		pinctrl-0 = <&cp1_tpm_irq_pins>;
 		interrupt-parent = <&cp1_gpio1>;
 		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
-- 
2.48.1


