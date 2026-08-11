Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C158C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ptgbg2rZaEsTjE9dLT79mTbDs0W/jNl0+5wzhjip51A=; b=yKyBKrxSGb7O2f8m+2HtgclPE1
	IbUHK0X5jo3KwvijOdmCC0vx85HzBxtTpaXsfEQxMU3pEaB2X19nPa7VxExkXOmBLmeLmMToyZg0E
	6M8SQisuANjiFmcQHm63Edg/bdyFooYM9qpAREFH8xLuEVaF1eyQHHwy7pxxGX6h/eog0uyAHOytS
	QlE93biipOAmbQyUSg1WK+gBvjbUcjqBMmocY59Hh9Rb9LjwD8OSaL4+X1fGpMU5OrnQAXA/Plz36
	knVXv0U0XOYo6IJRFbKpr0etBz9n7NdR0tHLKRnZttl5Lhk9KWsaFGB8b2Bag2IrYyOlWcGOH7g7h
	39df0wIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoxn-0000000EQXv-40sL;
	Tue, 11 Aug 2026 16:04:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoxl-0000000EQVX-2cQN;
	Tue, 11 Aug 2026 16:04:26 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786464261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ptgbg2rZaEsTjE9dLT79mTbDs0W/jNl0+5wzhjip51A=;
	b=xr9xb9zrTfHNTZeaj5MGgn0tyThqOx/RCSoZjSPSlo+Akg052DnNmPKATeCfNOpEi4NC/g
	tgWDU1S1bj0UjWRZ7OjUUUqW6RFleBxAkcQ0fqp7whUsEtnc7AukvaoKPqwZOamFonig8X
	2XbN91ii3ZbKtj7yTlq4AWkGGuNeeeWJIdnHb0j23UInf9bJEs3t7FHNusHTNFuF3/8Da+
	RiCjCHbcklMj0+x1HjIm3zucOLhMda4cwgaB0mmdGArYG/2uv0IUn4gF9GDKYmAqlZ5/rp
	KSzFUqsBjiInWkONZJtM2pCLSowCFQ5y36pb30Q+RCPayWtT6nK+2HqDIIzWUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786464261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ptgbg2rZaEsTjE9dLT79mTbDs0W/jNl0+5wzhjip51A=;
	b=sQQQuvQU9bqBEBvfQzlakrKZ4HGiHWQSxamvy/zoJeVhMQg94uiIWrED98Jc68Lg3cURoT
	OW2PNlF+zkr19KCg==
Date: Tue, 11 Aug 2026 18:04:15 +0200
Subject: [PATCH 1/2] arm64: dts: broadcom: rp1: add spi controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-bcm2712-spi-v1-1-4c1708d354bb@linutronix.de>
References: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
In-Reply-To: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786464260; l=3713;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=FqFbK4KpdGlkNZietP69oqW51qLSXbPgbYrtUFNu9Zo=;
 b=JELCilY3swOAHdx7HexxZOuK/fCO0wHMs3FrfqCULObgSSNNgd2xg9JpLyQIk3ivCmKrkrIjr
 llMGKllo2GiDf6g0pCso0s04+i/PtetnpQ1b+/RAFarzSvCup5xFjUt
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_090425_817191_647D63D0 
X-CRM114-Status: UNSURE (   7.90  )
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

The rp1 processor found on the Raspberry Pi 5 has nine Synchronous
Serial Interfaces.

Add the relevant nodes to the devicetree.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 119 +++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 16f5359395835..8d9de71efdba9 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -26,6 +26,125 @@ rp1_clocks: clocks@40018000 {
 				       <200000000>;  // RP1_CLK_SYS
 	};
 
+	rp1_spi8: spi@4004c000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x4004c000  0x0 0x130>;
+		interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <2>;
+
+		status = "disabled";
+	};
+
+	rp1_spi0: spi@40050000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40050000  0x0 0x130>;
+		interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <4>;
+
+		status = "disabled";
+	};
+
+	rp1_spi1: spi@40054000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40054000  0x0 0x130>;
+		interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <3>;
+
+		status = "disabled";
+	};
+
+	rp1_spi2: spi@40058000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40058000  0x0 0x130>;
+		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <2>;
+
+		status = "disabled";
+	};
+
+	rp1_spi3: spi@4005c000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x4005c000  0x0 0x130>;
+		interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <2>;
+
+		status = "disabled";
+	};
+
+	rp1_spi4: spi@40060000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40060000  0x0 0x130>;
+		interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <0>;
+		#size-cells = <0>;
+		num-cs = <1>;
+		spi-slave;
+
+		status = "disabled";
+	};
+
+	rp1_spi5: spi@40064000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40064000  0x0 0x130>;
+		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <2>;
+
+		status = "disabled";
+	};
+
+	rp1_spi6: spi@40068000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x40068000  0x0 0x130>;
+		interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-cs = <3>;
+
+		status = "disabled";
+	};
+
+	rp1_spi7: spi@4006c000 {
+		compatible = "snps,dw-apb-ssi";
+		reg = <0x00 0x4006c000  0x0 0x130>;
+		interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		clock-names = "ssi_clk";
+		#address-cells = <0>;
+		#size-cells = <0>;
+		num-cs = <1>;
+		spi-slave;
+
+		status = "disabled";
+	};
+
 	rp1_i2c0: i2c@40070000 {
 		compatible = "snps,designware-i2c";
 		reg = <0x0 0x40070000  0x0 0x1000>;

-- 
2.47.3


