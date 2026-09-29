Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F2FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8e30UgkiHDTjA8f5l8oWUq2Z/wD9LYb6yYMdtqEA+w=; b=h2j+YsjMWAL5F4pimmju1AgKru
	47RosZy1LSQnMz7LxFiUvsG4Ysmv5WX1VA6UOtwxU5l/caqWdihou7j2p26K+LLxoaqu1FL6N4rtF
	uCsVP70+Cxv43qBlAHxYteZBcI2mOD1ne1CXT+k6UdctY9253a5RfWyHoD+EjWxyinX11+1zeR6sJ
	Pvl2fUNLVAwSctU5icqERlvWFjXkUOamMl2hEqRxn5ZP90vT24WXGOWlQlDaG09npZ//rl2dDtf/k
	LPR1gcrsRq7HcWJCUEHQg7U98SDY+7R63b6G0oIJsam/8QOcONMvN/gYh5GNACpFs4g9nTLEKnxz5
	HO3PX/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ6M-00000003pVj-10td;
	Tue, 29 Sep 2026 14:46:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ5t-00000003pL9-1kAq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=C8e30UgkiHDTjA8f5l8oWUq2Z/wD9LYb6yYMdtqEA+w=; b=AqlXG2HT/NPdeE7DFIgPr9e2GS
	nfcEQxNydd+14Q2JTznsT7068w9HzHKd54jXVaG8bBHT0tagk347QKCPiXsA0PV+QM0vUBwtnbavD
	lAFJnKDVIe34xt/eyhfcTFhFdyXYbs1ukXIBXWf+e+AizOTWGdxlgUgJlhzV6oNnrEi1gPFTW52ec
	dWBNKiiAwvesjbgBoavzH0p4B2wEvCmWVH/OjicM6Ip4ikYMWtOT2c/2HOP6TlOVaivXOT/QKsjzo
	rrcQ/IJXEJGLPLZJ1p9OYS6jq+UI6+SRspOiwYXSmTXDa/7eb4sqdlTxnsPv3XgEYBKA8iLANvXe5
	pbWcZXkg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBZ5p-00000002ki2-3DjA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:46:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1DD234E410B8;
	Tue, 29 Sep 2026 14:46:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEE9F601BD;
	Tue, 29 Sep 2026 14:46:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07FBC10329812;
	Tue, 29 Sep 2026 16:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C8e30UgkiHDTjA8f5l8oWUq2Z/wD9LYb6yYMdtqEA+w=;
	b=J2c+ibLUY1FOIFVnNoAWOoDflzjCbqMpskEKFBx+sFfXN2MfCH4oC+8KN6AkHk0UfpTK1z
	4Gj5smJuhutqIUZ8oHoB+ZWOBdbK12AtKY9ZKdSaWSrDvmw8J1cbAuQFaUn3lWj3t/bN7L
	CwRXBnxP/Qi254kj08eMoeHthumHMAlSxAMoa9J4BO70KowRaXmwPJvuKKRmH3LCmMFNBu
	AF0JyG1gZnMiDGOI+jYydYQ69t8bOOpbb2hJQRm1E9D0LPzPP8xx+IUXQEMbZ9bGRNGwAg
	pr7cwcEa0gH1J0GKXocGuIIdbyEx9X2ZNnaGrvViMRqbcxIE8uWCnsC0k9mfcw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:52 +0200
Subject: [PATCH v5 9/9] arm64: dts: nuvoton: ma35d1: Add LXT crystal and
 correct HXT name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-9-68533e935ee4@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chi-Fang Li <cfli0@nuvoton.com>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_154606_518066_1B4CB0B3 
X-CRM114-Status: GOOD (  15.60  )
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

The clock controller takes its two crystal oscillator inputs from the
board: HXT and LXT. The current description of these crystals is wrong:
- HXT is described but not named correctly, which leads to two clocks
  being created without any relationship: hxt and clk_hxt. Fix this by
  exposing a correct name for hxt.
- LXT is not even described. Add the fixed clock node for it and
  reference it from the clock controller node.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Fixes: b69af0984732 ("arm64: dts: nuvoton: Add initial ma35d1 device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Without this patch, but with the previous patches applied:
* the platform correctly boots
* the peripherals are usable (the spi controller clock gets a correct rate)
* the HXT and LXT frequencies are guessed by the clock driver
* a spurious clk_hxt clock appears in the clk_summary (but is harmless)
---
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 9 ++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 9 ++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi         | 3 ++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..cb7d6f9ee297 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -35,7 +35,14 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
+		clock-output-names = "hxt";
+	};
+
+	clk_lxt: clock-lxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "lxt";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..992104289c81 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -35,7 +35,14 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
+		clock-output-names = "hxt";
+	};
+
+	clk_lxt: clock-lxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "lxt";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..9a341c2b1397 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -92,7 +92,8 @@ clk: clock-controller@40460200 {
 			compatible = "nuvoton,ma35d1-clk";
 			reg = <0x00000000 0x40460200 0x0 0x100>;
 			#clock-cells = <1>;
-			clocks = <&clk_hxt>;
+			clocks = <&clk_hxt>, <&clk_lxt>;
+			clock-names = "hxt", "lxt";
 		};
 
 		pinctrl: pinctrl@40040000 {

-- 
2.55.0


