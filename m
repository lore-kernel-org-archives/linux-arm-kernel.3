Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C16C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3B1CHvp+/NAtdvYK3PDi2I49Nj4XN1T6BUHalQZm0Y8=; b=hdJVEfrpqrADT57qdEk3JbMy/F
	X9LKDcpUn5y97p+OEukWMHBayr+BvPzMeHvySa5pYtypSU9uH6kM/u58e8KV59ZI2ri5/YsFRZ5hD
	+rOBU/EBIuPHSuTtBhriFOYUvn9srLXc9FDkdUK8KKr2bfud9eJBUPvCVQAYAC40+hq8Jo3Un59cy
	aUUScYmTv4GnAjOtr4JH8W0qSzQbhHut1HITzvl2eY3w+GazTpqZADmuwc810dRpwqjZAFgW74Sui
	dS5iN9SGE2A+2SemIW3e0488VfVYyxQQWWg3CdCen3X4FvOyHJQ6otOFmCqo3Upib1mmYO2dwg+xB
	zzFjoeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wti-000000038QQ-0HCC;
	Sun, 27 Apr 2025 07:57:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wgU-000000037Eu-1ftv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:44:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so35675485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739857; x=1746344657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B1CHvp+/NAtdvYK3PDi2I49Nj4XN1T6BUHalQZm0Y8=;
        b=R2hCUUcezYfY80MWbZUCRn3UdpKCjsFr5R30FNRsr5LOKAPyqatSsnu/8hKx0sNyvM
         yN76P4xATRnxFEGdEgHA6DNaz1QLsU5ZZQaiae93tv6hUAiBLtdt0cOLH/9sjh5lN8Ge
         ++spbVDR4Y0igi/pLIm8o1rJD8CtwjeQmvY4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739857; x=1746344657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B1CHvp+/NAtdvYK3PDi2I49Nj4XN1T6BUHalQZm0Y8=;
        b=A31hCfxNK7NZ7sI/7rIxaBtxR3tNE04/x5mmgrcrKKiwwC490OH75r1laVDvhfebwi
         pHO3FU5GeAe4FM1mTXNlU9irM6vvQ9NiEjLXlMYRt8SBMuhNXe/ekbRiJnXv++giOJu5
         tcNNHviVVBNS9FtblLU0l1jGvcAgElspZxDZYO+0PnCWgzpaNv9riKB8oBm/8HKRGtKb
         5hHHPmr5rAD4NTp5e7JEca8hqX29c5NbytEtuXpHi+GzX/LjM8f0UxyI7Ad1KU12Df5b
         BLDu5N7MnLtDL+HoaRqObetPWgsOzaxlDvFQ0gAUfvTzTe7JXGANgP4Q3Z3kPjtaaMM7
         7Ueg==
X-Forwarded-Encrypted: i=1; AJvYcCX7s2+ZhtxH/HOhLrGJe19h1lljTOWrJwzeYoL91z00MEMAfCsEMMf+8uNWNTkrKpGI6xl0opQ707SbsKfjz0C+@lists.infradead.org
X-Gm-Message-State: AOJu0YxFQ4IsXEPmhwEJ4sxHuz2+qytfKNWfElb66ZoGKMbvG/Z2h6i3
	rbj6c8xWteZk7q1+bO6EZoaz/dJNcZ8Rm5ozudTC4Jv2LwuerlIHEbHUmosAePM=
X-Gm-Gg: ASbGnctSg3XWiSAxPbx1KNf/JSSikdhndG6rNV1m40CmbQMKiIWvzkgVmbNOlhZ+mgz
	/vXJ9h9GoD/CmZ/AnstfzeRaIwMRJtTZsWU+Ba7+sf7gc/ETereLt+15ya+9roPbb2sQkq4GgMZ
	Y4weinalCbXwY5VGLSwUIOpLTIuadvpCEzlTDrork23ztzPid1Jzd0vnxOfgCon06Epc2SaJAUJ
	QCyWx7XBeX0aAD/kELNA/ot7Hqv3zjpVY511DNJN08Y6gWc9T1TkvVJOKHZ0o5jAHAYiBLYIoX4
	piu11skyN2qte+HOzRmgZS+H5BwIBFdmSrLd1YLnzQ4LsXjFE8AYBLMgltZ2yEhGglbEPBIvDSd
	S65VzIA==
X-Google-Smtp-Source: AGHT+IHZNrSu8FzIhEuFQ16NlJu+RuWVlKIcqsPehnQolCLBlqZN3KSAMIIbMcfsM4WNgYabQGztRg==
X-Received: by 2002:a05:600c:a15:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-440a64c159cmr74151955e9.2.1745739856765;
        Sun, 27 Apr 2025 00:44:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 6/8] ARM: dts: stm32: add pin map for UART8 controller on stm32h743
Date: Sun, 27 Apr 2025 09:43:25 +0200
Message-ID: <20250427074404.3278732-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_004418_434680_28681367 
X-CRM114-Status: GOOD (  11.21  )
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

Add a pin map configuration for using the UART8 controller on the
stm32h743 MCU.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
index ad00c1080a96..96022afd0168 100644
--- a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
@@ -211,6 +211,19 @@ pins2 {
 		};
 	};
 
+	uart8_pins_a: uart8-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('J', 8, AF8)>; /* UART8_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('J', 9, AF8)>; /* UART8_RX */
+			bias-disable;
+		};
+	};
+
 	usart1_pins_a: usart1-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
-- 
2.43.0


