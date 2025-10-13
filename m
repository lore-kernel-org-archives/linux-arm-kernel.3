Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C41CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH7a2TSjC2EHRtCltLIXQ56Gx/zxJGstZzcrhDDVRTc=; b=X9LRYdqxssAnQdGTtm+Q1qJCEA
	5/4Vxx4d/VELEqYdbAVYLxz/+Uo68ouyZMksyofiFxIUzuOhpqzX/7u+42Ew5SvuK0K4OvmbksaD7
	2w0TzRIyogOV9bOqEUgkiHv2lKdhcldUt/WYtoEPCshk5p1XOHHiyzVPnZHtOwp1n3QSuMSzVECgh
	cnjVUQIIfgLO5W62SF9cUbIrAo+GnbC8Qf3gmWvssvo077S03J9RK7john4FxycRLFW1G92n1uKiv
	TbZpoGw9od0C/zwmUTid084wRm2YIf5avnDW7fbKXZB9jJJVZzpq17MjW5ZVjhflxzE6Zox9Fi2QN
	zZzpbRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KbC-0000000DimS-0CpQ;
	Mon, 13 Oct 2025 15:36:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KbA-0000000Dilm-1hoQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 15:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DH7a2TSjC2EHRtCltLIXQ56Gx/zxJGstZzcrhDDVRTc=; b=MV9e+LrFp4FN3tjIj6DCMkdOXb
	oxXpon3MbE5spA0kXzuuFDJ7ygSstvxn6K6DaKW9t2ByxMbJeOWOpfEiyK/ysS6YiIG+h3xTCOwGc
	hZyGzul5PM2ZWW4Ei6q56M4EB+Bi9N69Ch/84OvRN2Ps2o35/mih4H3WNFf0ri5Wx5IWVHf7c5gRn
	U/2AwQPc3ndRJZ0YgiUbnT+Fr1EbpPzHBFvyIAN6wMa/Wfl0jmRRlPa3606VtWNwuB5MvBy+bmJOV
	jfK3EEQciWVMjP0zwvoH5afxcf/Fi0LNUdeUAjRdRntRNxtanUTQHrz50DCHlrY6ZRuOqNGviEjBt
	tIVVh2UA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Kb1-00000004QAP-1fTl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:36:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5BDFFC093AF;
	Mon, 13 Oct 2025 15:27:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E7376067B;
	Mon, 13 Oct 2025 15:28:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8135102F2274;
	Mon, 13 Oct 2025 17:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760369285; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DH7a2TSjC2EHRtCltLIXQ56Gx/zxJGstZzcrhDDVRTc=;
	b=vm4q6bOOFq44I9xd7zWEfS4NDHsjVzBwyWgLd1oaepsy9fQ1gnZ86zupCQCfUs2GePKDPo
	9W12689n6cTZH9S5zOdzCicGXXah0xzp5z7ny+hwz0NvtBXzDUJx6CJ0xcjeUyPpwKSHHl
	yALkEOIThvFKahA/LehQEPX5AcjcTmRZyULPkA9X1H7knPqMu14iJXpDOaJa1LJW1WEoB6
	niAW8NSmxpCvtydMC/d+wTFFwqPDzP4bbo4PLt9lrGgFFXTXTkgcrGXhimSlnoMSEWXS6d
	tFJ/cJCeXzB3GGR63ubM+XSSJdNSSjD6RGrIs35BFn5ZJMYcP2nI0/9JFMxqLw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 15/15] arm64: dts: allwinner: h616: add NAND controller
Date: Mon, 13 Oct 2025 17:26:45 +0200
Message-ID: <20251013152645.1119308-16-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013152645.1119308-1-richard.genoud@bootlin.com>
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_163624_493006_93CCEAFA 
X-CRM114-Status: UNSURE (   8.65  )
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

The H616 has a NAND controller quite similar to the A10/A23 ones, but
with some register differences, more clocks (for ECC and MBUS), more ECC
strengths, so this requires a new compatible string.

Add the NAND controller node and pins in the device tree.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index ceedae9e399b..bb53c6c63836 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -304,6 +304,42 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			nand_pins: nand-pins {
+				pins = "PC0", "PC1", "PC2", "PC5", "PC8", "PC9",
+				       "PC10", "PC11", "PC12", "PC13", "PC14",
+				       "PC15", "PC16";
+				function = "nand0";
+			};
+
+			/omit-if-no-ref/
+			nand_cs0_pin: nand-cs0-pin {
+				pins = "PC4";
+				function = "nand0";
+				bias-pull-up;
+			};
+
+			/omit-if-no-ref/
+			nand_cs1_pin: nand-cs1-pin {
+				pins = "PC3";
+				function = "nand0";
+				bias-pull-up;
+			};
+
+			/omit-if-no-ref/
+			nand_rb0_pin: nand-rb0-pin {
+				pins = "PC6";
+				function = "nand0";
+				bias-pull-up;
+			};
+
+			/omit-if-no-ref/
+			nand_rb1_pin: nand-rb1-pin {
+				pins = "PC7";
+				function = "nand0";
+				bias-pull-up;
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";
@@ -377,6 +413,21 @@ iommu: iommu@30f0000 {
 			#iommu-cells = <1>;
 		};
 
+		nfc: nand-controller@4011000 {
+			compatible = "allwinner,sun50i-h616-nand-controller";
+			reg = <0x04011000 0x1000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_NAND>, <&ccu CLK_NAND0>,
+				<&ccu CLK_NAND1>, <&ccu CLK_MBUS_NAND>;
+			clock-names = "ahb", "mod", "ecc", "mbus";
+			resets = <&ccu RST_BUS_NAND>;
+			reset-names = "ahb";
+			dmas = <&dma 10>;
+			dma-names = "rxtx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		mmc0: mmc@4020000 {
 			compatible = "allwinner,sun50i-h616-mmc",
 				     "allwinner,sun50i-a100-mmc";

