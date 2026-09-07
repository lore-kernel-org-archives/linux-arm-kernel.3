Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4F5C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+tecQI/RAFJySwtEv9OqcvDunXy81vhadYC9Bp1rn4=; b=HqrPVyBgImzZMgJdzIlRhsjZPn
	pefABOW1o+ngE1Xa6FedgdUAtg0LZiJ5llHVpbVhwjrRXeY91DmN4EvDMT/0ANETFxnqmpWVYGiOJ
	s7b1w2W7dvd6qyw5TnmxZp7nzizJDPBoZeS8wQcb36qWkwq3dCRIuIn6ma0jhjBpqWR31wGECdyrB
	K67agAy7eETXkOaBt6GebSehJLVsL6DpWeJrpd2+/6VzEpgfdG3gxgEK6J74Esk3dobRBpv4ftbyS
	zAYtJiqTI4lPC9AaCOH1ptoTlwduCVv1Dc0pj/cmtm10Z04m/aitbSjL6nFp1IAD2NwlL3T+jTeW7
	ewnLiqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMw-00000006viT-24i8;
	Mon, 07 Sep 2026 13:26:42 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMs-00000006vfF-1xvJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:26:39 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c252c7270faso506686066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787596; x=1789392396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+tecQI/RAFJySwtEv9OqcvDunXy81vhadYC9Bp1rn4=;
        b=DaCH8bAA9Kf0TKLOwXhkdltvXUvI3c5etf85RqS643U252I1m/xLcK947ox27Zk0R7
         UY6UbNNiYKfGQfP1F8sWt9vazMFzl0tmIxXXXoEmZ1Le3Ds+lxIYUFK4f3awatLOmryD
         +9jR8iQ979FNv5Kc/OMe9IcNl6TgFQMc9GNItDASCTCQDGxl1tw0hRQSugT4uDzg16Sp
         Zq41xagUIRZMRGROQcJbAzRH+QifSO9NQ1hF4nkACj3gmgmBktsJLitGSmniYdYp75zQ
         etcVfULlDM6tUAsTXeme0Lt/2JGu+ap1m6eY+jHJVvZxi2i4CDsXqlQSywWMCF+6vZlD
         Hb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787596; x=1789392396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+tecQI/RAFJySwtEv9OqcvDunXy81vhadYC9Bp1rn4=;
        b=Xar4pNdxobMFy5xmPf4fp6VO0JdRY4g39YCHj3Y6Brv/K9kC2QCn9queRFLX5Zdzg+
         ehdifsRbW59iq65t80BD4iTDK/RFfALYQVucwFVtgFZuPuD41h7KSABGA2T3DGWFVPqZ
         j11QoeNGR3aXZsxROsSgko8eKglR+B0UYk/7Xn1NWoW46xwgpW2w+r7QEs+dXL8B93LO
         kyQZLsxEvxvmBygIzGx3UQnx5aRjGHofZ7hijpRh2erRr5xOC+QOhG4iRaTcLSY/I8iR
         Xc7jODCruGL3b5Rq/WpmAt9g9IMmQpsaoW8G+uHocSZtosQRvUvXAis0rsLEJKkPUhDa
         bHfA==
X-Forwarded-Encrypted: i=1; AKwUvBym0KIz6DOgLZzE1HYR3wvmKnD70on1N8a2ojnJZLNJg8yQL+gKg2pz9HUvsPNeRBGwJzl42mV8lbRNq/XP8v+C@lists.infradead.org
X-Gm-Message-State: AFuF++kAhp/NAySASaox2RD88k2enXfbAUT9pzUTdJcJbE/xv5CRuyIG
	rQxn38C3NiU1U2SOzADD5xME8RBMLeA13im6S/9TyLCnbe1wmHcDQYW8VdvfTaS0c2c=
X-Gm-Gg: AYBFou2u7y+KXOZ7OG38Ucjg3+epuglBBzhPk/ZUUPh3yC6EO5KhUHe8lb5RiVrCeCs
	aZJBa7sTcyhqodHo/Gp7tDnO4Y4hWzQV+6wIKJpakglTLfznAXmKFhCWwl2QzK1AXwseyQ8oh0m
	25f5tyzj2EQBHN1MQAi+jFNEp+WSlvdXw7QrxwhnzsAVBpS9E8D8hYT3DHD5I69LCUsJlqgJqaF
	cxFubD/LqdEU67GTk16bJiKGVPj/SmcESCzcnK0/5uR7JwLQvM5hXvAuEPAvMur6BXQbGS8VR3w
	gJ6e2Mp1TCs7NaGMSWvJ+OULPonb4kdTc8uQudZMfMgzVws5PfRDN79wsd2kcTuzP5Ho0RBO89c
	54CA2hODkGerFvKWWFm+soyaa4jJU6TAXM3pzl/oVypPKI2HVM0gOYkgmHy8h5RhDZ6fB+S3Mxz
	YExjLGhiO/AM/v6Ua7I+ueGWUuMtyebYAJSWNpSjSs0Ie2NlbtJgxlFRgGiK98wVRaQHrNkrsiY
	shpH9UuPPVFMClu/kjB5tduv0MvaJgXXUxlrFQc4IWhSR65eZrDSoPhjEeO+Mf/rjTPbVcaq5yq
	LMGeGHKKnPneYzQrGRLGMBAMXNGs/4IU8wpuuyPrYVRDjijE
X-Received: by 2002:a17:907:d28:b0:c25:8eb7:f388 with SMTP id a640c23a62f3a-c260cc0bcdbmr1608993266b.17.1788787595858;
        Mon, 07 Sep 2026 06:26:35 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:35 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 4/6] arm64: dts: microchip: lan969x: add SDMMC nodes
Date: Mon,  7 Sep 2026 15:25:32 +0200
Message-ID: <20260907132617.1198548-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_062638_527423_07C9E199 
X-CRM114-Status: GOOD (  10.84  )
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

Add nodes for both SDMMC controllers. Connect their bus interface clock to
the fabric clock and their core clock to the corresponding generated clock.

Configure SDMMC0 with a 100 MHz generated clock for 50 MHz eMMC DDR
operation. Configure SDMMC1 with an exact 50 MHz generated clock so the
integer base clock encoded in the SDHCI capabilities remains accurate and
the identification clock does not exceed 400 kHz.

Keep both nodes ordered by unit address.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Use the fabric clock for the SDMMC bus interface clock.
* Configure SDMMC1 with an exact 50 MHz generated clock.
* Move the SDMMC1 node to preserve unit-address ordering.
* Explain the selected clock rates in the commit description.

 arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index a8541c6a098d..5e330d5fab50 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -414,6 +414,18 @@ qspi0: spi@e0804000 {
 			status = "disabled";
 		};
 
+		sdmmc0: mmc@e0830000 {
+			compatible = "microchip,lan9691-sdhci",
+				     "microchip,sam9x60-sdhci";
+			reg = <0xe0830000 0x00000300>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC0>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&clks GCK_ID_SDMMC0>;
+			assigned-clock-rates = <100000000>;
+			status = "disabled";
+		};
+
 		qspi2: spi@e0834000 {
 			compatible = "microchip,lan9691-qspi";
 			reg = <0xe0834000 0x00000100>,
@@ -429,6 +441,18 @@ qspi2: spi@e0834000 {
 			status = "disabled";
 		};
 
+		sdmmc1: mmc@e0838000 {
+			compatible = "microchip,lan9691-sdhci",
+				     "microchip,sam9x60-sdhci";
+			reg = <0xe0838000 0x00000300>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC1>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&clks GCK_ID_SDMMC1>;
+			assigned-clock-rates = <50000000>;
+			status = "disabled";
+		};
+
 		reset: reset-controller@e201000c {
 			compatible = "microchip,lan9691-switch-reset",
 				     "microchip,lan966x-switch-reset";
-- 
2.55.0

