Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA76C4450C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=; b=bi7q1JegODyGftac4yssnCs1bd
	xp4gVhMKg7qZTVyvKYGxylJGY+PN1hmdr9oUH32MeUeiYHFy7b3uZA0iT5uqpar1Xr7BP3TeQbNXh
	HWq+g2hH/wQWyyBMd3JwroPi0uadHecuUdguqhO1xHhX9D7/zCyGgrKB5kiAD5PJ1WM4HrqzDy/ZW
	wnk3fF0Xe2A+i2QKjPKeXBFMEmiOa0ffWtaTG8pYuxIaTEtYNtiCy2HqBiI4AANMYK0GVa7dF2IAw
	7ugOf4O8K6w4OM061TtsDkrGybYVqvIMRX97AeXc8MJNBoIFPgddFxsXzLChGeviVFWYOqaWV+OSg
	7QxFNMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt14-0000000Dsdj-453z;
	Wed, 15 Jul 2026 06:22:46 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0u-0000000DsTu-3GfI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:37 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c16794450aeso50475766b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096555; x=1784701355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=eFC/Ccz5CxU47BreOUuZ9g7vEKS8WxyZO6So1IGOqMCkoV8tak3ijGjpG7e0nRqCdY
         ic69ZOB+6FQF41VUNn7O4pH1ZjGN87bRA59iFuIBUffD6M4v8cicQt55lLKLnAjrZ7XR
         xz8l2fzxubAswkxdZ+3EG08JOLyFl+6Ck4/SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096555; x=1784701355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=DzbEiiiOdIY05K3cRnVeXsacABzRU2EkRMqBxEZILnebhfl0nu0mnrPPKRgfL1kee4
         TpgQz8viCjGnZ507C9A6Po4neUQ9DVjYqYNwIG/XvAKBCHt3aiAQmNpN6vxYWVYebwPG
         ORc5/mEFzgv9yu3V1A/8gRHg/9CPW7vTmGZi/CU72Ms0Z1pUmvhsTt6HXghlwL0CPAAn
         PErzudHld58uT3gQ/46rzPCcF/CFcwSdO0zduc8YmXeVviLYfTh5RgIch7dxbA9mtGUX
         cX0KRHcaJBapRaRf7G2QUXJ95WvfWMFQSD1NX/2cOrK+abGoNCnSJL4FSjVjnE9++bwl
         5KRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRWoUQLtOpm5nq5uLh2w/3ewAD6JL/vYhYC8Lo/5h9vz/ML5low+lNzdj6rFgY17ITLtrpYd5NXiCoY3MlRehC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw008mAy44iuyxblHqZkZiAhD957WvTyJx63qb8d1pJe306aOpl
	A9S42ZeF1sZ89mikbWpeCcjvnELpPjQzMNhnwjQKtGOuhDgOvQVtfwoIaMOCtyW6rvA=
X-Gm-Gg: AfdE7clPtI8QCwaiiPXGmNBIg0Qfomz2Er3GzutuYKz5CeJVQ1Atvt/5pNHyy3lz9ZG
	P5agFSXYDx43uLSxg/bv6rAXs1NObXC+CA5BlyTuTKEjV15Jzcu7nDi3pVOGZpYaE/UuTfYz9yi
	HFAIfS4hc+maQSQCCSOMomcR4e90P/0taM08vasdoEXah9YvAf0SMeT9l3Ym3clyF5Yi26YH1OQ
	MYmsZWG/ZjVh0cDo+1R23wwZdNuWsLL0yg/vS1k4Pwz8q2UPVhDWBhDoyazPdvRshxb2B5FbmTe
	F2m0Mfz7QxQgTmuX9+OrfGvdHCYey1hQFc0pMcQJJ/Tn3DNw1owORPH0psWRA6dI04soCc24vYJ
	sF0gCJ04+sTSg1kRuVKIfVDTohusuPUcFzalSCJ6bKgQMhVAos0+JIPWW8R/dPHUBxL1ybmuyBP
	zuey488Xn5B0lVIT1ESMD5Jvnc6wvoBybamV1fBnw9YahvnHhgvCj8CIXDM8r9qIgaPemTo37p9
	WEMWxD+gS+d
X-Received: by 2002:a17:906:6a29:b0:c12:5e3d:4023 with SMTP id a640c23a62f3a-c166161c474mr372775866b.10.1784096554994;
        Tue, 14 Jul 2026 23:22:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:28 +0200
Message-ID: <20260715062201.3599458-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232236_894302_101E1CC0 
X-CRM114-Status: GOOD (  10.90  )
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

Add the sdmmc2 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Change SDMMC2_CK pin bias from pull-up to bias-disable to
  avoid signal integrity issues on the clock line. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 002fbc724b9d..c816a6aece47 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -622,6 +622,86 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC2_CK */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* SDMMC2_CMD */
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0


