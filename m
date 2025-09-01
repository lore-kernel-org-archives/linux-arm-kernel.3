Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08DACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Uk23reMmXgDI/w5qmGpfWGxz6PEwbCh/kpCkjC9vHM=; b=e3mBeDxCPsWhqPgJoppoFUQHqn
	SfETe0cwNaWb1JXpAhhQ6EeYTl4bUAHc9SllwciLP748KO6CjptaHtCI2VAvD6jA0rvbkuLBZcOu6
	gktop4iLGrsRJiqtKIovfjHt05VJitd/H56Hq0JujAehXTd8KrR69cHIswLXCi9n1pOuXyX3m6frF
	M7d/Z1AHzaY95gQ6KRsV+9Jz2eDKLuA4EnDpioagKn4mn5xEPCmY6lUnd+gUWxsY09qQlVKA/Zg1k
	3K2aOkyrwEqMhHNG0b9Dem2g2JULXN6iQXsoq5hX5zop8QLh/1RmVHZXLkYVbbUr8Q3tNLfD3KgN8
	tvjbiOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Vr-0000000DHhB-13oJ;
	Mon, 01 Sep 2025 16:36:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3zZ-0000000CalY-0dM6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:50:38 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f98e7782bso960004e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731035; x=1757335835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Uk23reMmXgDI/w5qmGpfWGxz6PEwbCh/kpCkjC9vHM=;
        b=tViXKK9gVzc3FAof4i2iiN0Q9G2upUrYVXxS6wbyPTRk6TA72Y0wT/ZH3pn840l6xt
         f3lng013YcsXIeMeI+rMvpxq77T00M0SGwtyvhneyStuPdKXhoIIaN7DRcDiXT555ETg
         ivOc+xZCIWv4ZOPltN9+yawZzNXuO7d2rU5nZKhPkpvUf7RE0GVsnZnUSd1bQOmhf204
         In8UIgT6S4ZZdC41o4NU0yhDSLmkr/UjjSY0tceWUhq2jTlqI/gJFfi+WtMF4CGyOXWT
         lZT7vsoOAxBaEgW+zr5vnB3NsqEPkp8R9F1X15I6MPGzyLmp8VoYt4zAm9xmdJKlBawD
         bPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731035; x=1757335835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Uk23reMmXgDI/w5qmGpfWGxz6PEwbCh/kpCkjC9vHM=;
        b=efCY+mbQnFcbr/gsLfOPTLKQ8vCceaHfWbzRwpBANJl9Gx4Dvu5tqXXGmqcxRjJDAq
         t0LM+q5nUh0jFz5shZmMn0j9hJxbOWSGoT9KxknRNm0AVKXCAOVaD8O7x4wA+10aondw
         bt5gDNwAHeEZlR9owxv7WoIXjpLgNHGPY0WoRxqmkzB+TbTcFzWh61IXgBK2JiLZcLns
         NdPqekiICitWHVuh9gabGu/yDjYJq/tRa5pMSRIFPmy0UalB5gWF87t2JwhPe79i5s9t
         OJZ1fDtmoE7KXCCsc7WIxtuP6CCtV+muk0MyFiDCfdGg4u8YquxuKd0BYRYML/Hvihuz
         Q3wA==
X-Gm-Message-State: AOJu0YwCtPSLlVsubwAN45cCMf4GAZDRn+k+1kxByrnXIlD5jae8ct9G
	L6WAoDlTw9Ce9bTR/7ycrEQaKmyOW6YBxZ5q1mWRg7UUVNJPnEOg7SeV+TnKrJD50ZM=
X-Gm-Gg: ASbGncuUKPdEVKN6Hos5/5fVn9+xH2DUYuWFSOuPCUToGX5OUZD8sgSIRJjN1743N88
	PeAWAmt2ap1DYDTQDbkNF9xhAsbs4fy4mVjHPejRwroJqhuFuceAr8psp0XX5RLoV6+mMoolP6H
	65KCArv4X3sNhBYv9nKOUw4n7TEPyCI1uuwsqfqhIN/nEhPRmdLz0efa+Iuvaedi/V21gJ5tfP3
	wjFKUWrNgDnl6t8YHNeHVwIleFqKtHjv2qRjntOamIpcOsULKe0T5vMTS2jVCBRYhiFsEFRJZhx
	WhmQxbYdaaKqF2D0t/W7Fm3LCoGRh9Z/n0XKT4tFVDTP9Mof6I2O/pb13+A4uCvxEoeOgh+IWg/
	kcSUZTTk2jWCVLguViptH63fuRX3hvU61C7cXpfOSjVA=
X-Google-Smtp-Source: AGHT+IGgDZfF6ACIKhFVzFs6/NPIi4QNdokWZPxPF83q3UjpzjtiD/USsFl39rjmYe2ag4JT1J4UTQ==
X-Received: by 2002:ac2:5e6b:0:b0:55c:df64:3769 with SMTP id 2adb3069b0e04-55f6f6bff08mr1379694e87.9.1756731035358;
        Mon, 01 Sep 2025 05:50:35 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6774bc3fsm2926155e87.59.2025.09.01.05.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:50:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Sep 2025 14:50:32 +0200
Subject: [PATCH 7/8] ARM: dts: bcm63138: Add STB I2C block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-bcmbca-i2c-dts-v1-7-ad81f60d4276@linaro.org>
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
X-CRM114-CacheID: sfid-20250901_055037_196249_045D6437 
X-CRM114-Status: GOOD (  10.59  )
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

The BCM63138 has a STB I2C block.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63138.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
index d7410bb1b5a8e221d7ca1f2f299ce6d2bc40b763..3bf41760ea52a74632744c50a5d096e8b193a046 100644
--- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
@@ -312,6 +312,15 @@ bootlut: bootlut@8000 {
 			reg = <0x8000 0x50>;
 		};
 
+		i2c0: i2c@be00 {
+			compatible = "brcm,brcmstb-i2c";
+			reg = <0xbe00 0x60>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pl081_dma: dma-controller@d000 {
 			compatible = "arm,pl081", "arm,primecell";
 			// The magic B105F00D info is missing

-- 
2.50.1


