Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEDEEFCBB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 06:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5k8sNwUCtuNl5KQTKE9dvLLTtEJ1hjFmuOQqcpUNe8=; b=1Oc9MVXApfxYUTOb+kUY9VggVA
	IWIdUrs0n8AiZoLu+p9XAINozegyPljKLCthr3fSc0rAEGlePC4Gmo8PztENGtcYUYuHqFk5OgufB
	saI2v7abT3ONoWN59w60mb0krCGTvXSKI1s44xdfaamdBzXL8/u1Hf01bhLo589L6e3w14iFunqAb
	lCYsMV9hevvARjImGSbArTNbfyAdO5ANKpumqrlqqrFD7gG17T/VeZdeyqdPiKc+uyrHQRF2DzNhl
	lKSshjxIuWhOTimx8pJyb0aSwKtWkOM05N80SUdtNNPTZSKQ+vsoFVe/EVxzyxY67E4k6iKfcPUkv
	JZoGAOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21aT-00000003QkZ-2Q6S;
	Mon, 16 Mar 2026 06:38:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21aQ-00000003Qiq-202g
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 06:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v5k8sNwUCtuNl5KQTKE9dvLLTtEJ1hjFmuOQqcpUNe8=; b=e+dcNtRY8rzhvVvl7j0eOC25IU
	z2prlKWfVUDxKy8jWe7Gwc9WgB645TlR800BARQgWxfFdSQZp4GGR/5GK/YwqxXPBHX9Up1sFLlHv
	IiUGxDCosICRn8Oj6QoGFe3/0we9b7VuxrfjSSXxdjn7cLMWa5YHvncrLLpfdQ1HMKov4jHTcKYw8
	M2rXBsJ2s9swC9Kpug9vCXX9EIavm4+8lMvs4Sf3L6iovFMOWfKk+PWZOOurlRxviUZ6Em7w4NgxF
	v4n66D1KQd036lqaPsGo28a9GqDBW9XYEmnpZRiVlFUyVwZdOHH47FdLGCvU1y3fDR1FWBvqhqAwq
	sNpypsZw==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21aM-000000068kL-2k20
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 06:37:57 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c73c990a96dso1540628a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 23:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773643071; x=1774247871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5k8sNwUCtuNl5KQTKE9dvLLTtEJ1hjFmuOQqcpUNe8=;
        b=HP7+6skesnk5KfTCz2gwy8FMrvpMuyGN8aMDHNE7RoL9U+PfwwtdGtKEXgBPfaAGiF
         5fgI/erUy96q1w9iYm48oZF3hxhCO/ha1BWm7hvKUF0pK6y2KB9BlakWCPD8QRBzEhaq
         JTTGEGmuRRPwIYPWRbMljN7ZF7VzL4UHFNYE/nUQBJ5BxV2XPr1O49aV+Lm90ifL7BC8
         CkwBjod0pYbnbmvWzS+Y3BwILKYU92kEkFOTuj3B+430NkZYvwjnCbP/HLRmlmGa+E2f
         nBHu4024Q7Ym6YYRTqOpXFwE30pzIlcFReeTVcc6DFubeVIsbkqWDjSeQ41FCUKQnR8w
         Y9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773643071; x=1774247871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v5k8sNwUCtuNl5KQTKE9dvLLTtEJ1hjFmuOQqcpUNe8=;
        b=C6/T+GurIXpODXmJa7pqpRhL9ZwwNxPbf+NSqqZQMHO7UfTS9oeynhcA/4bR5tycK1
         NdCWUGmRqpu89TILypPMjRI3bnQdfTSubX7MC3/y0DZyUP7oggdVRxlxCvIyViFaQIYl
         oxf1nKCM4Mtn+HhXVzUlffaPRqSlI7fABibZXgj1b37OKQY02w7xJRNQaWcb0vDp7oLB
         grURVuBuq2L/4BO3Clg8XFA9ODUb1xrXjY9wD5S0p7fm3QMVTeXhihevYinGq/WvYHJO
         Y2kLuJvpIdkq/27JajPlAsccXmZQo66412Oz++QayjqHkCcOHKIEg6f0uNaDehQXmCMm
         P8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDITRaeatSyBOFtiNiRs5VRFFTIdBem52uBv1sAXywVFOYplhtzlHp0G/Ev/jZLdDFlI8P6ypiRtU/8xR1M3kO@lists.infradead.org
X-Gm-Message-State: AOJu0YzZFzMY3aFm8EIibMLEUApEjLjcyIuURhJOS4JjA/rgvOLwP9rU
	vzACovd2K/C8A2MoSAkkK5YKQTKtrxM33AcTI83YZBMq//RUWJnNcdpo
X-Gm-Gg: ATEYQzzS7WQ/6DQJ7nqWPvMEz05YvZvLjxL1t46WpjgjUDdeFGuce6t8omHX89Grvxd
	PAuKKTqUZMSnizeCE3UEFMwyAuLsk7Y85rva0SkjZ8AoYg0/9HAJrHwSfs1dgBUGUgXUxTPFlcp
	5Wrf01ShNFJI1td+Y/n8/6pL2f9btmiCIje5M39fN/abbG7kYLgO6KmOG3vfFQ6EjfkFRhCML+s
	687aSMblC+8aOTitDksQfNsKKj/sFaRf0MjhibV7pmy0h9O9QdRSFBvllL9ofnGLYXiFMue2DGd
	HDWAAETwbeJWDg9ZINxndkqYp8CGSXMHwnsEqlP0YghGoYOoSX3/C/4eDqlQ1jwl2c5FIq2is6G
	nLROInuHlMGt9MXmx4MF2dQMVdonfAjerOJHTsOH0OFo9eEgexcrDiJEfs/7VFar0ssis3hWvXY
	s4LFTxAMmuybLgEBrZj8pJ/QS3OyvRAus7yxmzvqOEaPYhrG1ABKpQ7gxLMfEWeIW9KdkbXH+dC
	gsvLngYSA==
X-Received: by 2002:a17:903:2b06:b0:2ae:c001:834b with SMTP id d9443c01a7336-2aecac3e7bdmr118041445ad.39.1773643071442;
        Sun, 15 Mar 2026 23:37:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56cdf4sm122845295ad.8.2026.03.15.23.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:37:51 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: andi.shyti@kernel.org,
	ychuang3@nuvoton.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zychennvt@gmail.com
Subject: [PATCH v2 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Mon, 16 Mar 2026 06:37:26 +0000
Message-Id: <20260316063726.41048-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316063726.41048-1-zychennvt@gmail.com>
References: <20260316063726.41048-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_063755_624001_5E12F502 
X-CRM114-Status: GOOD (  11.96  )
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

Add I2C controller nodes to the MA35D1 SoC dtsi.
Also enable the I2C interfaces on the MA35D1 SOM board
to allow communication with onboard peripherals.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 18 +++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 60 +++++++++++++++++++
 2 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..4dfb5340a139 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -13,6 +13,7 @@ / {
 	compatible = "nuvoton,ma35d1-som", "nuvoton,ma35d1";
 
 	aliases {
+		i2c0 = &i2c2;
 		serial0 = &uart0;
 		serial11 = &uart11;
 		serial12 = &uart12;
@@ -55,6 +56,12 @@ &clk {
 			   "integer";
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -98,6 +105,15 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+	
+	i2c-grp {
+		pinctrl_i2c1: i2c1-pins {
+			nuvoton,pins = <1 10 12>,
+				       <1 11 12>;
+			bias-disable;
+		};
+
+	};
 };
 
 &uart0 {
@@ -128,4 +144,4 @@ &uart16 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
-};
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..a88d1c2938e7 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,66 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1


