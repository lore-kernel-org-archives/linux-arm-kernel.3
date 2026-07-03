Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384B8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=; b=0wtoKeDTHBLXnjpl2N4BV0TQF1
	ccs6eKMoFMujDDPi80aqF7Y2Cw+ypv1upjQY+WIsSjxUAma/HkOdfyLXKu//8MY3gFsFeIGtvKbgY
	pPAIVM80l6HOELnQlGjNChh+SqcBg6qZExmKs1/Oskuz8b3KBrbMyARPEIM94tld3DjWg7Ke3SvRF
	/R+dzd11UESaOCYGlrHZpFkZbPj/4GAPVebPmAELYNyMA4p+nmsNocc+0oI2+jVxeH9WRHPetIho6
	zkUBmI5B2T/WAxcHrTcdqIejffjz2nwpBdkWeaZsix0T7SP+UN5oM16Pqe2Rjf1booiogXZ0CFLlQ
	/8jnQELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXl7-00000006DV5-2zIM;
	Fri, 03 Jul 2026 06:52:21 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXl6-00000006DRg-0IcD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:52:21 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c128cc012b4so33646166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061538; x=1783666338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=UbgeN+OrjARjVNe08CAqsoPiPk7cswan/aN32x/OTAM7+3YeVout4qcMuHoIH3r+UZ
         pubfdTHZcx5TtirDhTDx8deq9kg0nHKeo0CVU7BAt9kiODO+/ICVzWULkaYoLyOAlHoA
         h4OVEwKT2dfkzL5worTi+1arLYQRNuGFDvS+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061538; x=1783666338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=RHGmhGmRLEgsTcYlYtIhf+5VRBhvDPEPS4imXLgW74I/xT3XhYsA5XEtbSAdSqH/Fj
         f7RPBncHq0oxBwdrhh2C4FPJXSxcak6Xy1q8knWdiE543DjgfBV0B//jqVEPh3d+laUv
         SDBz2XsHFVdY5a7phyry36WdWmtfjTAVmo1/1AxsGonBy1uP7AWXGxOQJBdxPG0GLTHG
         G62XyqjahgEl/TEHK0Tqi54N/5DWB7JnAhBU5zi0zgDa93Wcs5jKq/6CKJjJB0a3iKTb
         DGOKLhtKs/oi3cAx0yCPh/kYuxDWT7hD1o7FGTOR1bWth22Q9gO+KcbZlDEwAEX8L5v9
         rOsg==
X-Forwarded-Encrypted: i=1; AHgh+RpMk+pBbFW/8Ewtv8WxzIgxNoKcXpN3JjOFruEqJ+QBrxquYGr1vpk1R1PzwA3Hxjvl0GbiCJ8Po8F8gwdTyKx7@lists.infradead.org
X-Gm-Message-State: AOJu0YwxBp1E+Iik/D3YRkPx8BWCX/pMUzB7r0yf6rZ4dD4JRA4sTWl6
	0VbcjUMtG4nYXxB5HrLRj/lm1b6t1sP9RHMfvJTMsb3qxDuNPFH3vY/Kgxuz542djL4=
X-Gm-Gg: AfdE7cn5Uhk1Qcwrcr46Z2Jy1NYEu2kjJJxBYwSsvgVerFuK22wLQOnOhbi/tkmoDll
	1VZLEMyF8IuKZCpRhwYDTvW+uNq6HrzZ8Bb23yy5TIufknLLNo3i2XhyXnHX607RCwO2YUszbEV
	2EI6SxuP0X+sXpAUlojSKAxiGDhaMSHzFmrtxYelgVbyyIeSFJLpOflAS3HRkFEirqsdU7gQDya
	iFj6iI4ruhPNF6n9pdIYQLdRKBvCStRwY9nBup7xRKhiZpBsZblluvy6udyEoq7RfR30QUC8D84
	Lg31n3YoV8nerhotvN0vr2vLSAXEkwivqyLA5CHeNy0/aCmJoohuVpnriqeFshlZeW+iXNWEEDj
	j3Aluig0u6vlpkFeYgSRRw2E/1lTZ3Ni1uP0EnsIgU/oNY30CdmSFetLitJsHLrDXBpqhkw9rrN
	M/pIEmAUUMU7EGPswVwWWYBJrmAfJopxNfVLfrXcspgmebka+TOhukzwVfc++0VfDcgLtH3uOpw
	PaF0qh4xeYW2P4h2GPr7w==
X-Received: by 2002:a17:907:808:b0:c12:9bee:3b86 with SMTP id a640c23a62f3a-c12c9de19cfmr147004466b.4.1783061537641;
        Thu, 02 Jul 2026 23:52:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:52:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:49:03 +0200
Message-ID: <20260703065110.1433283-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235220_137726_79AA8C4C 
X-CRM114-Status: GOOD (  10.11  )
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

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4e570e2e5157..d515e44832d7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -766,6 +766,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, AF6)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('B', 10, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
-- 
2.43.0


