Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7E2C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XYuex0QeLqf/2qVUA70rdQFdW1DfuO89ydiRHewS/4=; b=fjh1tiY8rBXGvK0mtEqkMhPpTR
	subVv0nFOro4DgTe1UPs0NheVEH9MpDt9IYKBsKbaL72kLphpLdFP5M5ZCnOdL/7H6dXFsgEwl90z
	YiofFSOpT03gy7o1hzuv7BBuPe/GShRDQH8yT+fIrLK7Nx/E05qB8UsL/64LvDcHoxlyp+dhFnvL0
	jLsvpVRpN4cbSEVUKHh6PxzqOVyq+jZsCMO+47elci/P7XvAY3p/qA31Ni1vq3sJXuHhJe//Uetd1
	iui36wb4/A0BG54pWyuKUBrJ8lZt4bcC1AVjx2/6Ks++Q1wptn+l/pEfiDRR4wM/ArZgCUt0EiHEr
	IUZJMggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTC3-000000009db-0Lj5;
	Sun, 18 Jan 2026 13:51:51 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTBj-000000009PI-1MYG;
	Sun, 18 Jan 2026 13:51:32 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dvFPD4K8Yz9tdy;
	Sun, 18 Jan 2026 14:51:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4XYuex0QeLqf/2qVUA70rdQFdW1DfuO89ydiRHewS/4=;
	b=ieXjbrSQr5JtSN2nG0yzvf2K7c3rfRghnTSeQlymfTRhqSE0Zh0ICbjuog+qXlPGAvqBNf
	x9qky71uzvFrNIIilo3OR6nqwcZaEHj81VmViV5baJDxZWp+hAmgR8ODJyGcQwCAJp0HD3
	Iux3OSGh7UyQT08zgZvG4rGApOxkZm3pqEHZSmHwBbg/4JrQa/6YM3z2tJKp0YIS+XM3na
	bEzV2e5wn+h4ishFqaNg1H+NJT5HWvMMWg7sOu+2+sH6VtSWWwpNBcVpKn8261u4vBWcdq
	SR1K5E79NPWxfo/U3bURHPkFrlz4xEBAUgzFCmSR+XTT+lEHZU0I23g9arVfbA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="a/RDxqmV";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4XYuex0QeLqf/2qVUA70rdQFdW1DfuO89ydiRHewS/4=;
	b=a/RDxqmVmmQLJaRk5siKEbPTEBTouccUBqVQfno4xFycU9xrvtAybs39AXYSNZcQGWC4FE
	QOqf5wlUA3rTqTpuI7K5rcQ1+1WX02MoYGSxPg7nFiFAz+JlcR6DXBa+Sk7w+SC89rOd1O
	wzfHtByKfVVMtvgn/8jpcOvtgQs4lQz5O9cRDsiRuXJc4gRpHmVGrW9kVOSLBjdIjwQKdT
	2KfUCHD7RF8OcbhMagdOtzdZY874HuVg9TTOBYZ8j3/FoYwWYYOP9VE1P3RNgj5aHWyOu9
	G8HIPbqeEjoB4lt6CIAaYy0Q9UHX6420Ya9I7QcL+R13eZc/+Vj4ThQ1oxf4rw==
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
Subject: [PATCH v2 6/9] arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
Date: Sun, 18 Jan 2026 14:49:54 +0100
Message-ID: <20260118135038.8033-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xdp448xsbzao4m1d1tqce3p75czkmebd
X-MBO-RS-ID: 89f67c90aec460c75b0
X-Rspamd-Queue-Id: 4dvFPD4K8Yz9tdy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_055131_577706_513B1409 
X-CRM114-Status: GOOD (  10.76  )
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

Add USB 3.0 PHY and PHY clock node for R8877990 E3 . The PHY node is
different in that it does not have control registers and extal clock,
which are not routed to the SoC pads on E3, therefore describe the
PHY as usb-nop-xceiv simple PHY. Add USB3S0 clock pad fixed-clock
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
V2: Describe PHY as usb-nop-xceiv and update commit message
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 82e9ab458b05b..f2641ce567e8e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -2207,4 +2207,21 @@ timer {
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
+
+	usb3_phy0: usb-phy {
+		compatible = "usb-nop-xceiv";
+		clocks = <&usb3s0_clk>;
+		clock-names = "main_clk";
+		clock-frequency = <100000000>;
+		power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+		#phy-cells = <0>;
+		status = "disabled";
+	};
 };
-- 
2.51.0


