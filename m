Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byGtwtgi7pm6ZOuMJ3fH7+tgRzdrXvaDzEyMgIaZ2t4=; b=W+o/1ac/mF5YvRF1/4R5C6GQzf
	NKcLqHYqWoLQCTGMWaqn2rbPZo2jiZTnpn30DI8tFkUPVQ/GS4cmjlB1x4ixnxwjjcM1rQpppU5mj
	hHJ/npWx9JYMo9CSk4P+1TwFl9tOBRBFBLJVmFNQhdfl4OLnZzd72IiIWziJz1O9reUhAaotnHGOy
	bvlxlqKQv1cnYJ7zxz8J6Wui7hNoXezGt9qx5U3I8B1K5JZ5phr9NHPSUIQgI+GDevK7MYt5z6Jc3
	BRpu98EF9cOh3dMSLTuQbpCeIgAK+qF8izi9Mpzm3d7yCHtaOkFLMAHWIXscp6nCI6KFUNBXP5E17
	QbQOvx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEox-0000000FD00-3a7Z;
	Mon, 29 Jun 2026 16:26:55 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEou-0000000FCzB-3mtd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:26:54 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-137dd4cc208so3435075c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782750412; x=1783355212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byGtwtgi7pm6ZOuMJ3fH7+tgRzdrXvaDzEyMgIaZ2t4=;
        b=g5/vqZrzbR3b4VRrGGWXnQp5NCZonA8KHtMmzuM1QxqpZet5wbiRDOqaD0UQTDZezD
         AFDnfSlkE4UH3TDp0Eg4klsRSsHfuluMekV6mllzGHUUba4+44MJiD1wT+pprY0L52Ql
         AVZJcjtvt7oLAfoCSscbkF1/kLlDUThZOhIfDkEkRhgZoEgpDOsUbqifM8UV0GoxQHPf
         Pzpyt+FUz/834rrNAc68MzvftbbPRrMVJEJlhJmXgwHCkLqAt+loNHng4CdYT5ROaOCK
         FAt+sgUCQjd44+A27+nHFrBc4fpERBSkuucbv277Q5n50Fm7BRrLO8y7l0UoHniRIIjI
         HQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782750412; x=1783355212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byGtwtgi7pm6ZOuMJ3fH7+tgRzdrXvaDzEyMgIaZ2t4=;
        b=IY8HGQCyvtgcFYp0Qeojl8iTXKQdA3yEwMRIlhoooVD31shrbtIbrcPlkdSlxSNiWH
         Lx1QcyTpVl7dDKJHU4aZAmtQaTaKdLXbtaBDpPh6ITD8SDOJiI0Jyr1/OlkFPvo1qciv
         QUCsTOmxQbuNc41TCrUaYfkmuyB5YfaBT+s54pujzUdiYxLfvvcKpSzA1U3OI387A/Vq
         LcmWOZm225Cm5TJHeEMMPpO/EzwbLM5aiHdXAgzIRz5I5FCjQu8MGBQdubPktLI1yJ8E
         w7J627V+XO85ghnNes/PpLEtjCTGtZd+NNMHqTU9GFbOUGT5c3rXFE81Kfq31Qrx/qGW
         zZpw==
X-Forwarded-Encrypted: i=1; AFNElJ+hodVeG2XStdKMTTzPagTy01xQ3N0OeArdY2dAaG9pvanQkjPGvizELSBHKO+eMPp2Ny8FQRFGw3FfL7f/F24+@lists.infradead.org
X-Gm-Message-State: AOJu0YxumsD6icXmiAT66WKGiFIh7rAG5f9sYJRas35d5NSwG6fk2MRw
	2bEjuG/h3Tx86B7K/laInQPju+70Vvx1iqaTFqhhSJqt2t/Hs9R843AF
X-Gm-Gg: AfdE7ck/ZRkBp4BpiZWzdHhemOoN3TRNOx7uBu0WegpODmDHE/HLPZ4r4HjkjrjM5Hp
	lv8XFJWH/LXTOt0HrzPlBzWJMdWbvTo1Bv+vzTx6qTgSq5Tkmj4yTWuBCD+ZGS2XwjsrRloWPhk
	dR0RODVHsDyKrtmR1FqgmYSM7qBUZy6VaYPv/N/XTb0iWZQcoucOyJaB9Jocmy/E8jdGCTKv3Bv
	Q6nEaPjCZ3TSPztcD2xRyLI+g2TXLdFBfpq32uHxOUPNgDZSX1c/NFLtE5tf1MJbQzuiGIqCovg
	EVelaYVgfGYhK+4rgU7RNpjGbW3Jpn5QZR4q5c2VqYUnLS+t+R6XzkeMC6ikLUwTP45pj41+Zm6
	7NQLEYuhSQPv98tMkt8fMFLniRwwB/h4YprRZBEQi8Keh4dl/ee5ZufXH3DJUPje5LiOh4UlQN8
	V9um71UzJ9HQAqzfArVSofstQU331+kKkg43EDjyy4vG2haQ==
X-Received: by 2002:a05:7022:238b:b0:138:43a4:925b with SMTP id a92af1059eb24-13b2a52d100mr21534c88.20.1782750411902;
        Mon, 29 Jun 2026 09:26:51 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.62.174])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-139d912197bsm80851896c88.15.2026.06.29.09.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:26:50 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Mon, 29 Jun 2026 16:26:39 +0000
Subject: [PATCH v5 1/2] arm: dts: st: align MMC node names with established
 convention
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-st-mmc-v5-1-3cf0e639bff8@gmail.com>
References: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
In-Reply-To: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_092652_947270_859AE579 
X-CRM114-Status: GOOD (  11.61  )
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

Rename sdhci@9060000 and sdhci@9080000 nodes to mmc@9060000 and
mmc@9080000 in stih407-family.dtsi and update all derived board files
atomically to prevent orphaned node overrides.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--
 arch/arm/boot/dts/st/stih410-b2260.dts   | 4 ++--
 arch/arm/boot/dts/st/stih418-b2199.dts   | 4 ++--
 arch/arm/boot/dts/st/stih418.dtsi        | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 3e6a0542e3ae..08acba209c56 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -596,7 +596,7 @@ spi@9542000 {
 			status = "disabled";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
@@ -611,7 +611,7 @@ mmc0: sdhci@9060000 {
 			bus-width = <8>;
 		};
 
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09080000 0x7ff>;
diff --git a/arch/arm/boot/dts/st/stih410-b2260.dts b/arch/arm/boot/dts/st/stih410-b2260.dts
index 736b1e059b0a..44048a98648e 100644
--- a/arch/arm/boot/dts/st/stih410-b2260.dts
+++ b/arch/arm/boot/dts/st/stih410-b2260.dts
@@ -141,14 +141,14 @@ i2c3: i2c@9843000 {
 			status = "okay";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			pinctrl-0 = <&pinctrl_sd0>;
 			bus-width = <4>;
 			status = "okay";
 		};
 
 		/* high speed expansion connector */
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/stih418-b2199.dts b/arch/arm/boot/dts/st/stih418-b2199.dts
index 53ac6c2b7b7d..4ea174597365 100644
--- a/arch/arm/boot/dts/st/stih418-b2199.dts
+++ b/arch/arm/boot/dts/st/stih418-b2199.dts
@@ -82,11 +82,11 @@ i2c@9541000 {
 			st,i2c-min-sda-pulse-width-us = <5>;
 		};
 
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			status = "okay";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			status = "okay";
 			max-frequency = <200000000>;
 			sd-uhs-sdr50;
diff --git a/arch/arm/boot/dts/st/stih418.dtsi b/arch/arm/boot/dts/st/stih418.dtsi
index 8fb8b3af5e49..1a5fbbedc8cd 100644
--- a/arch/arm/boot/dts/st/stih418.dtsi
+++ b/arch/arm/boot/dts/st/stih418.dtsi
@@ -136,7 +136,7 @@ ehci1: usb@9a83e00 {
 			phy-names = "usb";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			assigned-clocks = <&clk_s_c0_flexgen CLK_MMC_0>;
 			assigned-clock-parents = <&clk_s_c0_pll1 0>;
 			assigned-clock-rates = <200000000>;

-- 
2.54.0


