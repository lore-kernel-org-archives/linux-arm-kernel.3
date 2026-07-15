Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03141C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=; b=0l6lfogdd34HvFxzbUN5zGMwSj
	MyQ9rsxq20ni9kqnBwHLUfPZoCuEH5EcGBbBEbo3Ui+CbaD3YtHSqBLZksi6pGd2EtHQFtvHFIU1v
	3SA0PHzNyU/53FoKyinyqdrXE8VRplin8sWKnXIzl6gzmkn0LDhxb3/B1Gi6BiZYb+teUekUOPv2B
	Zumgi3aJqdXPslsLmTtm6eUI6h1uYto88lXeM10RAvi7QVtBJDrvkrgCvF2SnpZBU5FdsYsDUZbID
	n/4Esyl6YZZTPS7pUg9CqfmDsmMMWdHiipeP8i43A08tWrJeGdTRLVNZQGG290/3gwJG2Ygz52zBd
	8x493wHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt14-0000000Dsd4-1qQW;
	Wed, 15 Jul 2026 06:22:46 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0q-0000000DsQM-1tez
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:33 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so250030366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096551; x=1784701351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=nF6+dyNlwxSf/VH/WyG9AooLQ/WYLlYtNiLn7M6CMvvcgI1XEbPCL7WPghWFUVZkND
         ijDTl+zYCAoqCgdGtB8vUr1F3PNoqCcbn8Fh7gzY4se6+j1NMGD7igkdVWDJu2dVRkLP
         BD09OXsxhRIzsZiScleWj+OM1sACzDNZMGhA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096551; x=1784701351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=KieFLPbXafLIuhTHA+ZXVKMtLFrQze9zLNMP0shOAt/p5V/5+AcVaGDmny5p/UcdGI
         L837qAbhJz91qGXUIlOPAqqKe2UzR9butThpRaTnyfcUZ2Pkdqnnk7zQStS0JEvdF52W
         KhEwZXUzhbZWdjQxLdHJL/tL7moultlhAU8V0GgwA1cPinJzQXYG+oTOTUUwhzmawrOd
         XoUi+JWTumZ+nT2/yoUM+s4rvrLhLb1e1Q/5BUes5vj1TjN+R2/5S4yng6OSWzzlwmtd
         0MMkjByJNvFu0i/v5Pff0BKWGU/cRzSEPfWqZQE01E8hgHLdPUW0KJRpTfYdvKbUGE09
         9Dxg==
X-Forwarded-Encrypted: i=1; AHgh+RrovHWkjASvqMlgpglmx8kvCofZAygHcyWa4xmFJA1KSszcqqpP5R5RtqZ898/9papkTDzyEgBnhW6tjZ7dLm+9@lists.infradead.org
X-Gm-Message-State: AOJu0YyOkSNXP+U4N7SpWCI+0cAyjoGTYntpwP6JFLdbfGxXdCyxuWVC
	yvP6lfQGfg1I/zTRt1LSzscex7E05LPRBA7mmxP72OYxK8uCEtMQxqD/BPGZGK4oSq0=
X-Gm-Gg: AfdE7clLfTPO7B3rSrtav08GLVezDGd7eWEIeoCtoP6oLJam6zHv93TZUgkiG4Skt2A
	2NpmLZf9s5AMa6cIy1C+RR+H6tBU2jGbAiAJVuPkBoAVV8hfzKHBswZ8ztWBhxIEGGdu5slKkoK
	x1m03p30j4T3oOCKtQ0WqASsZTiV3nuGQfGwevTFZlk8d3jFk/jQxYoaDA6lYkPFnBnU218zbZJ
	JpSg+I1kSG1n2A4Cz+SCXnua8T8pvIRhQl2KFl6fGYRop31BsVp+GFrUwUPd/L5BjEQPi7+j2qX
	3pxyIaH9oVZVoRjJYsXy1Vhuzp5kujC/R8HZCZwU5fyrCQMSUPW5eguxtjXpTf/CQo0Z3Gua412
	wsXs3Vo59CzxTo+jwbGKNil/HOTCzQzbgwOgxQ/YZWgiMjzihKciZWqcKtdiWW/9vL42CNWZ7yg
	jwPBDxCBV789Xx6RIRXH9ElnS+I1zvUMItAj5BY/LU01CKn4XV9hSkx0MXkAjzjRiFw1QemE4xt
	VUdcXEcCWqH
X-Received: by 2002:a17:907:97d5:b0:c12:b2dc:4834 with SMTP id a640c23a62f3a-c161ea6d217mr823641266b.57.1784096550856;
        Tue, 14 Jul 2026 23:22:30 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:30 -0700 (PDT)
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
Subject: [RESEND PATCH v7 09/16] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:26 +0200
Message-ID: <20260715062201.3599458-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232232_513241_6DE514D4 
X-CRM114-Status: GOOD (  10.79  )
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
index 6482dd47e977..695c9d771853 100644
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


