Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9F9C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noNFGyMHn+G12oU3fMyt85bZyrL7/rnSlw7jXK1JU9I=; b=EFOZsq9WgtR9pNK5SswGwVqqDd
	pgCNton7UX18T4Wf0h840SyOSWKAdNaAxaMkbIgIrS1chWe1StG8Ru0kfOonM0uMiJPWYte+Y/zQ9
	iIgWEK6IdsODtsa2GIioFQB8LyCr2nHAJcjAhz3ZvPjJ5C5HUa5JByAZ2u4LPVw31b/GTYKW/6YTh
	GOWM0YrEIU4LrDGrkUlqtRTcrQH4727OMDlZyS2t8dN5vGChKQcd3iQXyxKDqM3sd45cqphm0ETQ1
	TuTkHqhINv4jGd1JGBTCjJm199Od1pzGB5vGOWlwSC7vYcTk0GGkCBHF5ybtZonOYNIt1f7gh3J99
	UUMwxOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xsZ-00000003EhG-488g;
	Sun, 27 Apr 2025 09:00:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wgM-000000037Cp-3k7w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:44:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso36043745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739849; x=1746344649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noNFGyMHn+G12oU3fMyt85bZyrL7/rnSlw7jXK1JU9I=;
        b=p2ZrZSQI/G2EvFbR+6wdLZICFasXH4Yq8qaRl7TLR9HCY2DT5i96ZRcuPeuympf66G
         mfCZKlPxkM/cwfVxfKLVfKxHUuTx8YY6B9hAWwYhYf872/7tTIvljWFUh392iOWZq2S8
         3N6XLQOOpdibH0Udg8BQU3xXxfHFauzoVV/lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739849; x=1746344649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noNFGyMHn+G12oU3fMyt85bZyrL7/rnSlw7jXK1JU9I=;
        b=rUDqYnWHy1yP5PFNruvo2RSFq1Zq+hD1zf5/xPtLey5gHohbSWIz0Ga2isj1w1/Gds
         dp2UJS2bxOFRHzZFoyb6mN3GJs4jUen8cumVcfBYzNcVZFYqmDvdXNPqoAwUAjOWoePn
         AKlbknxSGP5+hvVNMFIcSTWjyU0F2/OJ2Q/QVxwOX7lSr6pEbj18kXj0kTviRrv3NDNZ
         +0eO5VfZirI7Ls9h9ECO90Wc+ax824bbMoh4aKyHQzmjoyq+6SeUwrGNEToj1VUf+aqt
         l2QTIsKio6fgcFhPjneUvpudwUPOJxeZaKvWWZnbraD/Nq98OwH5CZmWRTMzEyFwQZvs
         Sscw==
X-Forwarded-Encrypted: i=1; AJvYcCXhUDV3DWusStx6gm4/0ofxLx7oxITvtB8Ib0Qsig+dNYPDTnAUBltg2jFtYridbLCyuqZJAhVOHv53au5KlEa4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7fadksxv/bx+9sPANohRFtEHbPwTFjzrlddyri8V1dzQhNpXj
	Odtc1B+qHDPXfTwqKqWHxn48qDfRkbH4cd9zhb+bjFm68doQfD1DsZ87z1ABW4M=
X-Gm-Gg: ASbGncvDfZulK7lIJ+bMCCMPGbLxU27Z8RjCZH6cenA/UPGH11ImjEYDd3N42r4sZHY
	3kbOiQJfE05V4NUEz9RqMOwVSZ10pNXjPTKNCH1HJEdhSGvsmHACIhb0usx6PmLmGOfx1QrCwSO
	UNpf5i8eVvw935u7PKQf4oMsefAOwb5nmWa6Ct7K+LUrfbmwGAhcXcYB9RSVkb1/DlDlnjr6lso
	XZYMqEmzaEKtQRHuxLirYx+GZ+F3wrZcW0k//O6qh05DcxQVt1rGHyRr9dqdyccnmGJphomCiw1
	DfGF7jvkf7Yz2bhKHpcbsReDdbPTkV42dkBP8Q6yQ5//bjBBBFkJqIAGMw46FH11pDt3DVKxUhH
	PzOkhg7ZBJQjDfct6
X-Google-Smtp-Source: AGHT+IH4VnwQA0G2EjuoChB3GFw2EN00/9sNtBiR6r7qJ1qzu/LcPcmBTKtOPPgOwsnIXhXKwnF/jA==
X-Received: by 2002:a05:600c:524a:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-440ab845dfemr33087695e9.26.1745739849570;
        Sun, 27 Apr 2025 00:44:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:09 -0700 (PDT)
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
Subject: [PATCH 1/8] ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
Date: Sun, 27 Apr 2025 09:43:20 +0200
Message-ID: <20250427074404.3278732-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_004410_928651_E32385B7 
X-CRM114-Status: GOOD (  10.91  )
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

Allow expanding possible configurations for the same peripheral,
consistent with the scheme adopted in Linux.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi  | 8 ++++----
 arch/arm/boot/dts/st/stm32h743i-disco.dts  | 2 +-
 arch/arm/boot/dts/st/stm32h743i-eval.dts   | 2 +-
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
index 7f1d234e1024..ad00c1080a96 100644
--- a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
@@ -198,7 +198,7 @@ pins2 {
 		};
 	};
 
-	uart4_pins: uart4-0 {
+	uart4_pins_a: uart4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('A', 0, AF8)>; /* UART4_TX */
 			bias-disable;
@@ -211,7 +211,7 @@ pins2 {
 		};
 	};
 
-	usart1_pins: usart1-0 {
+	usart1_pins_a: usart1-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
 			bias-disable;
@@ -224,7 +224,7 @@ pins2 {
 		};
 	};
 
-	usart2_pins: usart2-0 {
+	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
 			bias-disable;
@@ -237,7 +237,7 @@ pins2 {
 		};
 	};
 
-	usart3_pins: usart3-0 {
+	usart3_pins_a: usart3-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
 				 <STM32_PINMUX('D', 12, AF7)>; /* USART3_RTS_DE */
diff --git a/arch/arm/boot/dts/st/stm32h743i-disco.dts b/arch/arm/boot/dts/st/stm32h743i-disco.dts
index 2b452883a708..8451a54a9a08 100644
--- a/arch/arm/boot/dts/st/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-disco.dts
@@ -105,7 +105,7 @@ &sdmmc1 {
 };
 
 &usart2 {
-	pinctrl-0 = <&usart2_pins>;
+	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32h743i-eval.dts b/arch/arm/boot/dts/st/stm32h743i-eval.dts
index 5c5d8059bdc7..4b0ced27b80e 100644
--- a/arch/arm/boot/dts/st/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-eval.dts
@@ -145,7 +145,7 @@ &sdmmc1 {
 };
 
 &usart1 {
-	pinctrl-0 = <&usart1_pins>;
+	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
index 44c307f8b09c..00d195d52a45 100644
--- a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
@@ -197,14 +197,14 @@ partition@0 {
 };
 
 &usart2 {
-	pinctrl-0 = <&usart2_pins>;
+	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
 	status = "disabled";
 };
 
 &usart3 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&usart3_pins>;
+	pinctrl-0 = <&usart3_pins_a>;
 	dmas = <&dmamux1 45 0x400 0x05>,
 	       <&dmamux1 46 0x400 0x05>;
 	dma-names = "rx", "tx";
@@ -221,7 +221,7 @@ bluetooth {
 };
 
 &uart4 {
-	pinctrl-0 = <&uart4_pins>;
+	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.43.0


