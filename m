Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A8CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WgQCeGTf9CF/h4JnW/yiE5NtebJaOdCDgRUZRh4GSw=; b=0JTqBkBwgcjxotPrbbowQSiYpr
	OcPzev4QwAxTbQj9QCkcBSZ35MAkhdUSRoFv34yM+BuPsOuZbepEnwM1+AZd3+uIwri4nwsF0Ga8D
	0mb0xqGGEZd/I+YDbIzLFVtt/CLuuO3Y2HZ98uqdLT4OqvuERoyypH1wTYrLetGyRXLaZQtl6CHec
	RI3Ibq2oeCX3YQJ81O5bCBwVI5HJV9fvQRPuCEOE7cXkwWabaNSh2UzxyZ0lC8Xxx7HSayH/XtUhA
	c+MP1jaV/JVi62td1lwXN5UVXQrt2sQtypAXTGYGWVrxWs8or8rSvWlU9mWhzJ/6836EaH1Zenp0v
	JvfzRU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Ve-0000000DHK6-1bGG;
	Mon, 01 Sep 2025 16:35:58 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3zS-0000000Cail-2ohu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:50:31 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55f76454f69so1200794e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731029; x=1757335829; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WgQCeGTf9CF/h4JnW/yiE5NtebJaOdCDgRUZRh4GSw=;
        b=PgI4KCZnFfvpHlp/JDRsBmGI02Z+h820CTsFd061iiE2MHP38d4DWVrGRuKFM61Il7
         rMlWHVaMehQ7SOWgnkS+oBKTYjwzwchIfTXEvb8PGAM0X2x2hxoldNKWL3uCQxwibSVk
         ClWuWPMinYIGuUq4J3I6V8+bb/RwhaTAGvNAZ+73+xT1Ag9Fn9NBUS0TnngBYhX2xeRK
         6lWizmw/HHXptk/Iw/UIcSW3Fmd1s5/ASzik+ao5uiLVhFqgnKk6/d8SAU8M0PhTQ/r/
         2YNHX9NJhoSpebrzaxtSdzDhe5wNv8/iPB1l0e7k73Bg7NA35xqKVz9LEi4yJkViJDe0
         X/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731029; x=1757335829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WgQCeGTf9CF/h4JnW/yiE5NtebJaOdCDgRUZRh4GSw=;
        b=nIb0NK3CUmunuJ59UBWLrl73CP7snzXcn2Mu6OBs18WDnmxwTz83jaI+DSnwMULIwI
         Hi17pm3gsDWAyc6jF3BGlhZlmsXS/AJ9MZ3bkwvUBjsnZOcphdKhUypD2oh64HIJPHjy
         Q0O7eKWHGQ2dYl3VXjpm4JTFdEG5uz8HngzDY0SacGXUw2iJNPhvdNi2FPvgme8sAaY5
         PWNSIH4vCjwDUOmCRIRBba4RuoQQqPkDTDIvPGVx0TzmJq68hyyHh3HQbo4aOJNmiURH
         8PxQD7QXZpiApxm3d4Cinn2NsPhi4w45zuSdruQVN9l0DTZHD9VvoxqjDrbM1pIkFWh5
         znig==
X-Gm-Message-State: AOJu0YxE6IxLIKw0uN4z3Ug4TC63fjKTAF81MCyWT4aDB0el4U+qh5Xz
	Gyn1xANA+euYKnt/2YB6y/hI3ZEYXN/VFMYqslLbnNdRpjs+WskFkilTuacybAC9gyo=
X-Gm-Gg: ASbGncvKdtROPWaKm8DfkzEaLydCgQMwgyltiZtjzjyrNm82/tYpRZN0gpkX/KS4dLf
	p4DcXgWtyRf3UfQ0hN3r8IUCIPl88eTIPej08x495nmDm8SMWvNjNPhXt1WU5HjSHDyi7nb2ehg
	I5u/XYvvshvxA3/ORRa4GmsJRJFouCDNk12JFd0WXj5dSzimv7GD3zWhrXWuW0jKFKklKWaFA+g
	yyay1MUuanvZDhfFGgmPqLzZxuPSiB8XWETe6OsfkidY/uMN7VxgKWWaBHgHKwW2xXY0PWH/BS6
	5YPZYY4F6EEBDPhaJmbxVXeE3eL9qo230Os44zKtXwHuB03nDn4GZ52OPmvp7NgNR4kaNhm6ZZ2
	Ky6ADvv2+O9hBoyDkyYyFboTiDc4ZoJwU6jrtkihbFtM=
X-Google-Smtp-Source: AGHT+IGMVZHOA6bbv4eTF0GnmsbCMwyyGuhT/uJmR0J21YdIrRo8CdQpfFpX5qaQ6gOJYh7trwuDmw==
X-Received: by 2002:a05:6512:4002:b0:55f:3e8f:ac10 with SMTP id 2adb3069b0e04-55f709886f7mr2371750e87.49.1756731028864;
        Mon, 01 Sep 2025 05:50:28 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6774bc3fsm2926155e87.59.2025.09.01.05.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:50:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Sep 2025 14:50:26 +0200
Subject: [PATCH 1/8] ARM: dts: bcm6878: Fix PL081 DMA block IRQ
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-bcmbca-i2c-dts-v1-1-ad81f60d4276@linaro.org>
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_055030_712559_7A414869 
X-CRM114-Status: GOOD (  12.79  )
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

This iRQ is on SPI_TABLE_OFFSET_2 which begins at
64, designated 64+30 = 94.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6878.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index dd837bf693905736a7b8ef9cfefea8368e6df6ed..5a37bfd7f53f16fa07cc93b570a585ec34f5f443 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -244,7 +244,7 @@ pl081_dma: dma-controller@11000 {
 			// The magic B105F00D info is missing
 			arm,primecell-periphid = <0x00041081>;
 			reg = <0x11000 0x1000>;
-			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 			memcpy-burst-size = <256>;
 			memcpy-bus-width = <32>;
 			clocks = <&periph_clk>;

-- 
2.50.1


