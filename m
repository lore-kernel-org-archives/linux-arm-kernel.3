Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F8BCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=; b=spf7NVvQQAVk1ZNs7eZw+MNs4O
	+2qPuH3WsLuTQocfgTmSwaaMs5ZF3/SAQ0sDzHYCjSi6BfY/zYKiPeTYVKF5wJbRkPV2WmPvRws90
	U2pnY/hDLdY0o+jNETjMYqWsp0v7qfpjG8gOZD3xxQG0UCnWXyWEGsiHYWIygKowbFM/TghGJsxea
	xTLs7M+wAdaAveAAye3CmzCxajaS2Y4/FaXpxKxzL9erVqb6kaeLOwXtapUmaufNSxotXV4fhDqL6
	uPKds7K29b9iE9tyihkPYpiNFcUdh/zDeE+0jPMmEkLk7KkenPEZRqrfREIu4VcTx+QqS3ZT8S45n
	aHiYJ53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUp-00000007YWt-2yWf;
	Fri, 29 May 2026 14:47:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUj-00000007YSH-3u2V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4909def6a21so3673665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066048; x=1780670848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
        b=O5HCAFOxh4QaS623q1w3TnUIGQSe/w4l4AncsAvBL5H/1THVRtT2zrcy0ivVwSaDu5
         /XJ+FSJ/bMX292OIUnXca77AKDCCIXfbA5Y+w03ffejIO7gWo+yD8gXcak4DrHKyEoyB
         B0j5NDLVPsfyeQjvzhbF9eSfYy5gn6uxZD4Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066048; x=1780670848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
        b=czNtR4oRrzvav8XJfev7Zm36kZ9yUx2uLZ1K5qak/sRr9Srug7+eh5VWTBzdCClBTs
         MS2cXb2875fpCdQYA93X8PCvRTB0xAkRXiPvL2ITpMrpc+9DtdTQ9EcB4IVLcR+04gZv
         6zdbAthDiiXhm5mmBfpeLojr3S9rTttjAqraDxfJcIhKVKn7ImHxJGd2j9PNpG6Qxrxg
         1g0E2hs1QDrboh83auKFb5kzc6m4LofRyEg+JtVsmA1ac6dR4ir473u57JuJKJej0PvE
         0HuyHLLPfvWrXi79BAfCTqlODcndVlxPnTJnwAG7bXaEELXbcursUwYQprTe2lWBA6CI
         jalw==
X-Forwarded-Encrypted: i=1; AFNElJ/rTn2e6F+3BfVPwBPglujLsoOFESOSqWSXY9I8sO316NnxJLTsyeQcytEZy+RjHsU5GsOqCB0iEMPWlZKfubVh@lists.infradead.org
X-Gm-Message-State: AOJu0YyoqcxsirJKrG3wOkxeWwGWGfVUk6Xx68SZw4Ua3tUOh5VTP6oG
	i9TzyDQYba85+KxSyDMcr63K+MMvOOHDU6yTGlm88cSa7IlOFZ6q3zySQjkWE0zDehQ=
X-Gm-Gg: Acq92OGjer0zqSxaGYcSBfOhUFxUFI7+J4iSx4DKXBX8271Ehkx+/WCjPmPbS9ZX/Zi
	Jw1ihLX2HcW0PZBqB0C/EpIwLXCcOMAvLfdrPiArxyZp8lOV9SakBVOwwRsHK40w5oP5fwJeHGT
	pVdxejRgsyMGaONwGq7Gwcz4t0EHU0ZIEtwkli/W5zOQwUcIVBiN73FKqLNkEu9XfWPfUuXtVn2
	xHudLciGGn4HRHYXX4AALDTfHVXkJ3N0ojkoiJOwClHZZOxmRzxqOCREpWn8w5gJx9PBBKfIdxN
	MUDsytSHG4G/4ScwwuV5uizCGZGryCFzy647KUj3eIvGV1Z2GlPs1iTeUJOsU50UeUDtqVKPtko
	X+4FbeRBUrQcXrnSKdjVcfGaMwl3/9cZWy2NYsJ67MaIe6KPXvq7DKtrvjg4vWsim5zG1N1LVkY
	U7DGbEx/v5VUe0MzlnYiXlhzTqikb20KpNDpQOedzJ4cwyHYRXCzy9M84ed3TK8AI0muuLefGzL
	piMWDT4VdxCJSo+ULvYt6qTPIK9O8+WlOfqaQVY/f2awJ8zOOsgurkWPoo=
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-4909c0bb2e7mr48377025e9.27.1780066048216;
        Fri, 29 May 2026 07:47:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v2 07/15] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:21 +0200
Message-ID: <20260529144707.3931919-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074729_988786_D6F7F64B 
X-CRM114-Status: GOOD (  10.63  )
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

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4be01a6574c7..eab8ebe71660 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -433,6 +433,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm2_pins_a: pwm2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, AF7)>; /* TIM2_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_sleep_pins_a: pwm2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, ANALOG)>; /* TIM2_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm3_pins_a: pwm3-0 {
 		pins {
@@ -450,6 +467,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* TIM4_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>; /* TIM4_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
-- 
2.43.0


