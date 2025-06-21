Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E19C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyspq0V2HWwwS+VnZ1WgkjemW6T0dfdq87ixJii18ZY=; b=n8EquOCz3IYSQh3yLmwOzwfDr4
	UM8zwjB3GMO/46LNsPSmehCdc53c7wkIx7LXQTxBEFynnSQPUDHmmUZ1TEtamnQPNIE/acw/erKOD
	oW3BZrHXugLCqkaP2FTg+64KWPoj8ciVk7QbAqiTOXfMKfp2s68erHLsH2UZ06c8p5VRS3ns/JSg7
	JbTOWFXQvlExHDPPjDfL3oy09gVgIjmkDEvyyD3k97txxQ0d7V+U3TbsxAzAP+UAzvPJuZsiMirFt
	/mFqRUPfy6c2vyCZ+d7TFtZKL1GPokjE0konjR3jBPrT/hGA9vp+NG2xmQq7xCvihNj12rJYQQztR
	nSXM2gDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSwOS-0000000HOUR-0v1V;
	Sat, 21 Jun 2025 11:28:20 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSwJY-0000000HOFP-3n5E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 11:23:17 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso10877655ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Jun 2025 04:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504996; x=1751109796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyspq0V2HWwwS+VnZ1WgkjemW6T0dfdq87ixJii18ZY=;
        b=K+f8rYtlR3Xyk3vEQomrDAQaOXpeuQqqiVBoRqvb12SHulETQix6KXEVp1F6SH4Ep/
         ZQwgQw0rodbzus9SuBMycUMbmwKS4LutOMpm3NJF151mmSz523kqybcAX4K2z5J4FCTf
         Y9IxJTElSIbY7rcl9zSgwixshbf1BLZQkpCBlYP50G/rNDiW5VSlnZu1zkXTIiuA5Zdq
         XgA+LSp3kxYu/ZvyM/bNSysLwJ4DzIje76hyvlpH0FINRL1/wOX6u+Uj/Ts9Wq5IKn1l
         tBp/U6/l4YfuCv9ZG/NLMEBj9qzFs+nRjsfg7Z0lid1IzWDtcTWujfiuDZQ0Rd/u91iJ
         mqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504996; x=1751109796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyspq0V2HWwwS+VnZ1WgkjemW6T0dfdq87ixJii18ZY=;
        b=GQjH6I/nCQTfXKjlfQWFH4dDBl87UcgB7YmzrVV/naPZuIHRXiqMnxR/tS76kk1LUK
         DfPs298wluCkKRXdUZ2Uook+S7CXLHvB9wrqDsguHwZGhpRG1NzPp5aTxb6XlgtcOhoh
         tjW4cHJkP07RYyiVFEWvqrij65ITAjTBrALspUnf3hU6RhqJEhkCkqxCLu4m1oqINkoH
         HcyrlKzA2Vl4fb/0ysSuEMFBhTbpHGp3cDY+eaOOAexSZtMp2Q0hBCKUN2Rq35gsOqee
         Z+rJMsuxzV7Vud8fLPLfNQHw/95sv9Yk/TiAvCkEOaHBE55mJlUY93loMJbp/TwmHTo8
         xAFg==
X-Gm-Message-State: AOJu0Yyr3laX+sl6oLZd0r5te5CFDMZ+oX6PILNDU7FeqC9nP7JUhvlX
	H3uZz/IAFc/f8iAdbUEvkq3EHESkpPB7onbUDpcY6XNxp5PIkaJFstgzcexYew==
X-Gm-Gg: ASbGncuT6WY41X8QKvIbUjaf5Kg5WxIoMhRgDFf7CikyKDrKpyejSDZvUwn/Q9AfZw5
	8/lPfyQqeOJHqFy4KKsSUzpFIvECUqpSP5YciDaGCOHvKqay7w0PquPhP8j4alx6B4zwrxgulqc
	ev4iiAl0pnga6/BdiLAeESCdRAuhbBsGJ8HD+66VBHKNGLwwCEQNacjwQ+eEJrA1gpB2b8+Ueje
	qdQDOwJnxB4AG+H+CPvAo3Nln798PLSp2i76JuZfo1ja+iQYkHgIsg0NZ3tRVw1cOlvQZ93wk7z
	Wj3hFQMriI+qVfSveq3acxNXE7tqUOpr74BeXURGhYtPs1W4Q6UW4IFeOtTs7/saYWWpmBLmYLv
	KSHkBTh5mkB9oHZRRe02wDM4VlYQCL/1wNrs0
X-Google-Smtp-Source: AGHT+IEbOxBx/Sd+Bsqwp70aHm+2E+WsoOI4o1sbT5qYTMXDbDTw25OzNNsCWFVkE+Cq2EY8YZaaAg==
X-Received: by 2002:a92:c267:0:b0:3de:25cb:42c2 with SMTP id e9e14a558f8ab-3de38cc4f87mr72766065ab.18.1750504995670;
        Sat, 21 Jun 2025 04:23:15 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de3761874esm13654385ab.9.2025.06.21.04.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 04:23:15 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mn: Configure DMA on UART2
Date: Sat, 21 Jun 2025 06:23:10 -0500
Message-ID: <20250621112311.68101-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250621112311.68101-1-aford173@gmail.com>
References: <20250621112311.68101-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_042316_938467_C6AAB4FE 
X-CRM114-Status: GOOD (  10.31  )
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

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recomended to not use the DMA on the
console. Beacause, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 848ba5e46ee6..b98b3d0ddf25 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -860,6 +860,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MN_CLK_UART2_ROOT>,
 						 <&clk IMX8MN_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1


