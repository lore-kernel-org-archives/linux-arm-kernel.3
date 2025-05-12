Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211A3C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkP0iqtAV8ORY1eZgH6I8IG6wC09KK/zaOfIkhxn6iI=; b=ZcHRVvOMQZx7hoKlpclAk+Gw5/
	xu+sfCmsg1+4ujxGrlpVOK8yGaEkQoRX9AbOKCUElxgv2sCOex6gQryDZdyGVzxhcjinwTVTH5ZSW
	qyDfoTi6ON6k19QAatN3gyh20/QQlDN2u6Ory3t2AUr8OBIgKLduvbI6YKSHWQhmiV2dvNGL0oGIj
	pDpBgZNErjk7CcnS+uOHb6qLzxCayAKFDqOLaCIzg0ltSCFl1Ay1EgBRllgCX+Zlvt3MEz5ctXkOi
	WBPdn3wX/GdZsv+u01Fmb36ebhWiDgq18fsay4ZfR2EtTyXahX9cR3oL2q62LLyIGqd7lLrUR45mP
	d69GjQWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uES0t-00000009LxP-35cx;
	Mon, 12 May 2025 12:12:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERur-00000009Kqe-0SnR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:05:54 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so4383779e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051551; x=1747656351; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkP0iqtAV8ORY1eZgH6I8IG6wC09KK/zaOfIkhxn6iI=;
        b=eZ8LhgxRe2phEyKi6kQphpcrRQNbDl5Q9+/YwaEW7mgmxEwAfwavnrXYqWnzQtUf0M
         d/U4O46AIPkrV6uzvmCU5LvMArNZ2c4SzQADzCkyECLFrw0oAbsopVkz53SZJ2hjJZ37
         kt4dXV/zowU+xJKBC7aVoEPIXc5eP8nMoqwvQqakskJRbUe7UcqG8N739RMdIUiz98OR
         ZHacktv96+xwfgJWLQLRbT9Q5O8LfmM5u0taS3bfYtDOzdvkFgdGHMj3m34+ZW/QgsR0
         ghY2QevH34C4vddJI74yRJ/X0j228f9RT6is9ll5p5etRR3rrM2H+ipE2S3jM5HEUCog
         KW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051551; x=1747656351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkP0iqtAV8ORY1eZgH6I8IG6wC09KK/zaOfIkhxn6iI=;
        b=FrWQr29/S8+RXdUTSn/mGWX5l8Z8vxeufcxM4n+tzYHEsD8cNIwO6ZKb+UJ/aPtpP2
         8148Cc7bdERB8D3h0yoDNqcEhsJW9rO7vT1qfdYCOWOpx2Zq7yr4evDQUxSJaRmc/3oQ
         FP9TMLwkrK6ot8uy3uLV2KXt8sXhfmSfu1IETUJQKeCQ2dxvcUpyNsVIIiljWeEKBUX3
         rNGN1XnD/mvwGJUEqMtYmTWXZ05K/rVrLrRw80nTBjS6eI+Z+81kB+Rj4/6ik6oiTnDo
         p41scibsh8nY7a7MILL5fZFyEOuw/nVshsHS0S7oJplsGeIxW+Qi0kBribHnWNeVbjPZ
         ZvGw==
X-Forwarded-Encrypted: i=1; AJvYcCVexLoLwQYd3ft4zMkGWtk4T8YC1cmjNB3uvKuUxmUm+xVy2T3SVic8SXnwA3j14ascvu6Jb7Ak/pNBnGZO6SzR@lists.infradead.org
X-Gm-Message-State: AOJu0YyvxbGl6AUs4oGjr1evzpCajmEflJ6lT4Bw24jaEvdtfpJw0YgF
	khPPr2MlLjnY1hFenmqZvl2LrBuC3G+V96sLuiDxZqZujN3WKtcSHnmpW4Ceohs=
X-Gm-Gg: ASbGncvBCgZ5v1+B1LAc2mgHr8D9jc3uRPGDcnm1iByFZ21+X31XXIiufrHLGieYrMP
	u3F+CpuIDkLE258QxD86pff7E2eIb1jjLI1KgdINd5ObZpcWquUlfLJOBosPV1xR6KbEcXuuvIQ
	7weTQ4E9QWo8kuZSNd+6qyWzs/63HmX3h7/HWVZ0Aab4fk83xRCGIiw1x11Cf49ZuA9vZoMyhdT
	eSVBLPpWWp+GeJAqpaa2ivQ3jWgZdnMxDo9TaO/NM1oa7sj/8KKtrLmzQ484Pf8ybQJbvf60VZJ
	CPejwaRetApLrYQangxKNGAY6l1MXKyqYaX7aeBdzW9A3w5AHbIgqCTNDfW8Re51ltwckoxz
X-Google-Smtp-Source: AGHT+IFR9Nx1JFMLBQ2HkT2lwCOY+IxKJSVXbedntzV9xfWGZUYC+w6s/M2ra/sM9ro0Y82w+A8WvQ==
X-Received: by 2002:a05:6512:695:b0:54f:c1ce:9bbb with SMTP id 2adb3069b0e04-54fc67ecf35mr4581782e87.47.1747051551149;
        Mon, 12 May 2025 05:05:51 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:05:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:47 +0200
Subject: [PATCH v3 01/12] ARM: dts: bcm6878: Correct UART0 IRQ number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-1-86f97ab4326f@linaro.org>
References: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
In-Reply-To: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_050553_174220_67F7AEBE 
X-CRM114-Status: GOOD (  12.78  )
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

According to the vendor file 6878_intr.h the UART0 has IRQ
92, not 32.

Assuming this is a copy-and-paste error.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6878.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index 70cf23a65fdb5ac7ed9eabc986f4ebb4df263c43..43eb678e14d04be487af39c9365186b6fb919cf3 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -137,7 +137,7 @@ nandcs: nand@0 {
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&uart_clk>, <&uart_clk>;
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";

-- 
2.49.0


