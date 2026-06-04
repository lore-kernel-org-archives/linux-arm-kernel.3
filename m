Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F59CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 06:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NtaAcXvkd+ZHvkxzFNtCE7f1OoHFsi4VoYohL3Cqqs4=; b=rrWiW15cGOCCpjo2KJYJ158wMT
	+N6ZxCPzd9lq9FQmau60xMnHSe2G/s3Mw9q6r4Ewz56GQGIYjAywHBIukAgPEHZoOoV+a/8v6/Eyg
	YC5AFfC2aB/Pq3/z9enUVhefPgDtJ54afkviPfdHXmRHi404KQf7wA9mQZ3ozjSkPJwiqd/tTZd9T
	gg2Ff+u2muVzjy0yrOksKSJZGthDp4g0MDSFOozaht+lqKeDNDKN2ca9rBpG5iVY8lJzgqffMuAWo
	h2/8uPG1Tx3fC7isz6tzT7sp5hC+VtzARWAdV52kFDpE5s4ZFrW+HL+thuPRRr439SpPnz/uvWGpd
	kWfgYu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV19F-0000000GCn5-2BpL;
	Thu, 04 Jun 2026 06:01:45 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV19C-0000000GCmi-1BXe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 06:01:43 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-842273a2c4dso223580b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 23:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780552901; x=1781157701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtaAcXvkd+ZHvkxzFNtCE7f1OoHFsi4VoYohL3Cqqs4=;
        b=AiyLCFP3fzYYNr0PqYcmgYppd606gZJZFAhaxWSzDk8oyt1c195hza+QfJsLLR2m9g
         2CKVO+Dwq34+/4RoALQUGon2FtYrj1ma50i36CN/V6MgTkKdr5L0u50HzeS36fng82Aj
         dRTmlt1cixMejBrM18L07l6hvBULajFtIKV7ZGFwKRCh6dWM0wGeldWgtCX04R7GP1xd
         CAY0DIn87/QPHLUMUfKUzZXWBlEbpsy72vYt/FL/kIwEipmJAajtkkoLo/syeJWP56f0
         cD/tHsIEWF93uerN7czBCRKCb+zPsxyigN5d7BKfvbm/x0KyYg9oKjZ6HVmlKtdfM4fA
         NFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552901; x=1781157701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtaAcXvkd+ZHvkxzFNtCE7f1OoHFsi4VoYohL3Cqqs4=;
        b=F1k8j4PPNCwM0f0B6F60Ty0xvvpO1B5TzInQH6Pg+1gl+YSzO/K59ryFQA8RvbGN9Q
         EDbBgbg9oxS+1kd/bsipfWiK29rfybcTqgyem4bcIsx4b7rplDjKXQ/W6vMcAC71oyVN
         rDHRFuE09slbLi7OXVi+vnhFjO1rAonSROhPh7O9Zf8YXCH/R3TPyDXkAK+Xha781YTC
         7n8y1HuNKXR1MO8fH1jAPUtCcC0KK3Z2MC2xIGxy7IQtS3vWCVXSHRQLwvheiU3HLuG1
         Z9pTbItOPOv84NJ3VWGeyatJDUp7VvRS2mu6cT+clF+1/z14tHXw9+zUkWHuk4aCNcrC
         kB7A==
X-Forwarded-Encrypted: i=1; AFNElJ/6xuJDSCNqSYD4azX1tPXEK4MnZW2cLPSRYmroofgV9LC5xRUpkOk3iFHLPotTvvLf5xZloDxO+4M4ude2fHsa@lists.infradead.org
X-Gm-Message-State: AOJu0YyJpPMNHG24pxLRNkuJX0VtR9PJ8wnMXcwXiXnqIGAC34XkebP3
	Tqpb1RM6/i/obxgvjyibZzqvrOKEWPtmvA6AkAUXtTHM9m1pIW9RRXbh
X-Gm-Gg: Acq92OFly2bFk1KWyUICCNEHtvk/v55cAr1WU+/1Pl6Z+zb2BSQpRHeoM623qmWG+Yx
	6i92ozRkh9/TjUDUCbZ7XNuud0If1eUnS7mdmH5AilLOvNs3Pn7rTjzKJqNZP8Nzt9a/nZDj/aS
	wOe6sM9MmsHZ1LLRbldMpQ6zdiplqfU5OsFwmxJg5vrsIvEVlT63LDLZm08xtoZ2zjgEFsm6V45
	vCFaHst7NyAyxOkDCH3g/12Nb3OVom1YAjQBTFxsvVKkhx/nYllgdZvXj0f0pAstpV8j5R8XSRS
	fOqZslOruX92hK8eag/3hsqM5lZV3pTyZKWNfX9/TZCwZyL5xZs9Q5Z/O9o6JROsbzrI55aJpat
	rwUkS2NDWniIK72mzcO1Cgm8V66hSolZ3kip27+TR0ZHgC6MbFRWDmi5PM49IKZFNWxbR12qVzX
	NlsgOdzbpczuVNAmhGKqoqU+GGrzrgoLxVN7ONj5Shh7XwS22zBIdSa0wvQ1IrErr6PUGXDjj2w
	ToEh5bevFDWRYFWWyMZ
X-Received: by 2002:a05:6a00:3687:b0:83e:f208:b0f8 with SMTP id d2e1a72fcca58-84284fad484mr6307177b3a.47.1780552900943;
        Wed, 03 Jun 2026 23:01:40 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428706fa9asm4178130b3a.45.2026.06.03.23.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:01:40 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Thu,  4 Jun 2026 14:01:04 +0800
Message-Id: <20260604060104.1662700-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_230142_357293_E2C57CA7 
X-CRM114-Status: UNSURE (   9.80  )
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

Add controller nodes for the four Bosch M_CAN blocks found on the
Nuvoton MA35D1 SoC.

Additionally, configure pinctrl and enable CAN1 and CAN3 on the
MA35D1 SOM board.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 26 ++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 60 +++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..1b8ea14d3446 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -37,6 +37,18 @@ clk_hxt: clock-hxt {
 	};
 };
 
+&can1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+};
+
+&can3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can3>;
+};
+
 &clk {
 	assigned-clocks = <&clk CAPLL>,
 			  <&clk DDRPLL>,
@@ -56,6 +68,20 @@ &clk {
 };
 
 &pinctrl {
+	can-grp {
+		pinctrl_can1: can1-pins {
+			nuvoton,pins = <11 14 4>,
+				       <11 15 4>;
+			bias-disable;
+		};
+
+		pinctrl_can3: can3-pins {
+			nuvoton,pins = <11 10 3>,
+				       <11 11 3>;
+			bias-disable;
+		};
+	};
+
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
 			nuvoton,pins = <4 14 1>,
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..584dd8d44701 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -244,6 +244,66 @@ gpion: gpio@340 {
 			};
 		};
 
+		can0: can@403c0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&clk APLL>, <&clk CAN0_DIV>;
+			assigned-clock-rates = <200000000>, <50000000>;
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can1: can@403d0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403d0000 0x0 0x200>, <0x0 0x403d0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN1_GATE>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&clk APLL>, <&clk CAN1_DIV>;
+			assigned-clock-rates = <200000000>, <50000000>;
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can2: can@403e0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403e0000 0x0 0x200>, <0x0 0x403e0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN2_GATE>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&clk APLL>, <&clk CAN2_DIV>;
+			assigned-clock-rates = <200000000>, <50000000>;
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can3: can@403f0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403f0000 0x0 0x200>, <0x0 0x403f0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clk HCLK3>, <&clk CAN3_GATE>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&clk APLL>, <&clk CAN3_DIV>;
+			assigned-clock-rates = <200000000>, <50000000>;
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
 		uart0: serial@40700000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40700000 0x0 0x100>;
-- 
2.34.1


