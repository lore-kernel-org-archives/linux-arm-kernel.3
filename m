Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F25EEE25E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCDtUbPgnjiX6hN1A423qZeAcOS1S6hnA5ROM71zNUU=; b=tJNek6o3Gqal5p9FsxFbXQpZPa
	X5PZQKtukePA4Vr2UiyYCJBTtmFQ+PEXgnDSLUwUisD7S4VIt10FnKQKsxIGoeRyun0tZiWyMlF7S
	Cdgd5C/ktd6VImNK1NqIp5uEK4iCZcsD8fszdj2tHgnc/xRYy/Il99hT29N19zsh5b2hkPLPdp3sF
	PMOJ0irLn2Une8Ie4iFdajNeQ/J144RHdlnIwuQQGtsOMRF3gyj1uUgAooOyLb4QD3Wwoizn/YH7n
	ir37OKTHYMaMoMosTkJVdL+Lb5qrtPV82WkGHj/28cBZtJjU5PVvpdwgPSJcP6colY+o9aYTX9SSP
	Ebl4D7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPSm-00000007U7k-1Ry3;
	Thu, 01 Jan 2026 20:40:04 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPSi-00000007U5l-3WyZ;
	Thu, 01 Jan 2026 20:40:03 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dhzGQ3zBlz9spj;
	Thu,  1 Jan 2026 21:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uCDtUbPgnjiX6hN1A423qZeAcOS1S6hnA5ROM71zNUU=;
	b=kSGAeDL9rGUYTCq9g0TPwE+HrnRYwovIeom/XK6l53urAwdc/Lkba5dSyoU3nLKZjzO7Sk
	lm0xXctj2reDEeTaOfcN+aa95iy/6gcxX4cd9oEtcAAp9nZQRPOiGtG/vzw4T4cZNdXGP9
	BcNZodj26V51W26Jh+K1QAF52OPA7d11K4q6K5Yhi8A4+6I6ZOQ/zjc3ymMFa7Gw731fPq
	pg1u7dperyysCXz5KELUiYNBlL7Eqxd9S+RLq30e9RKjy99YQc/eTIdI8gmCbDPsH0BDBp
	EMmadiWBLBnHzCLeOgV34KT+kJYmm1561QTrVFvFnkAkMS4zX/uHR1rDJ+WJZA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uCDtUbPgnjiX6hN1A423qZeAcOS1S6hnA5ROM71zNUU=;
	b=KNM7Onf9kM2AAoMHBgadmJdlEiFVDLOXjdOjYbhquQqLzzBfdoWyuySA2LrY+WQ6RIcPaW
	IobPHBu9r51+lSNa2OSQOu/gXVYxNT+nTSVXv3orImdv22i6XJ5Llqwg1NgbXp8/t7AZ30
	oz9BJpBL6Ce8WWLkbBxIRZ/hQaCXN+uSx9/N41djUugzZVdKYeA+Z34IpAXEkhwXNY7GGT
	HhyVrraL4kvoC8QDwaVKVh/h8eQv15dD04Q0RGpt4TYlKu4nPoyKNETOqfJ1oKfPnKew34
	KWqAKH4zPUZ/DDnBZKNVi0sy3FNMlkcW3bO5QgS3NKfQECoADY+JA94CqpR6OA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 02/11] arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
Date: Thu,  1 Jan 2026 21:35:49 +0100
Message-ID: <20260101203938.159161-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: w4jjscham9zdbfiebfd1y6mxrr81dk84
X-MBO-RS-ID: 156121c78b40487a853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_124001_106833_617B5BFF 
X-CRM114-Status: GOOD (  11.59  )
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

This patch adds USB 3.0 PHY node for R8877990 E3 . The PHY node is
slightly different in that it does not have extal clock, which are
not routed to the SoC pads on E3. Add USB3S0 clock pad fixed-clock
node, the frequency has to be overridden at board level.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 97a7cf675efa7..9b4569782d61d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -763,6 +763,18 @@ usb_dmac1: dma-controller@e65b0000 {
 			dma-channels = <2>;
 		};
 
+		usb3_phy0: usb-phy@e65ee000 {
+			compatible = "renesas,r8a77990-usb3-phy",
+				     "renesas,rcar-gen3-usb3-phy";
+			reg = <0 0xe65ee000 0 0x90>;
+			clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>;
+			clock-names = "usb3-if", "usb3s_clk";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		arm_cc630p: crypto@e6601000 {
 			compatible = "arm,cryptocell-630p-ree";
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
@@ -2197,4 +2209,11 @@ timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
+
+	/* External USB clocks - can be overridden by the board */
+	usb3s0_clk: usb3s0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
 };
-- 
2.51.0


