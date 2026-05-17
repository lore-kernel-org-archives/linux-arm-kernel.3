Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCC5CD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 23:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFby9i1jhlPu5HJbXvVneKL+o1hXPAgNpBdPwBqhzJU=; b=vmW2LGnriCgzkv6pMszOUp1yTi
	0UFdNJSxs9McchfYjeyCQpYHoMWsvBYVZktnAIDOtYx+K6fBYfRlQs1bOf9ICIVCU7A6EITo2KuH/
	otz6KjXmlYWvpXDs1R06Y7/MHaFGq3eQMJuITuD7gP0ySVy6hYbEXw+sHs6bwkI1L3Tf7UWpZXREA
	f5V5O+AqEPa2vogYFH1QSHDdMwTy47Id5SS64coYT3Rcg8eStIhKQV/zWJ3MvlSbm+96BXkqbiLmR
	6OkJ2rev8sYr6NylBQq4ytbbNV/Q850KRj1XoxMvvPaYXrOW6BuA2dOt5E9C9nJsP1lfjPLCJrh4k
	FFQprPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl72-0000000DgOh-25na;
	Sun, 17 May 2026 23:41:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl6u-0000000DgK4-3Wks
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 23:41:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45562c41ec7so822175f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 16:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061287; x=1779666087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFby9i1jhlPu5HJbXvVneKL+o1hXPAgNpBdPwBqhzJU=;
        b=BH8sAi6vxD36bgdgZEfhXaXaiKPlJkll0FhNsJbSS9HLYr55Gkz9Iokqx3XDCInmOm
         6HbAhtEle3MDkY3QBXTYyLC+calGnFOYQWDbfx5SYT+vvjkYBfci7+aGcR3ANU9IbJFf
         MbN7+15dguB078Wwy13+HNIscx2jwyUD5Yt+o1VW1HXjJks5lIv4Qx7irPY4hSjn9PvC
         p8pRPoakwCCl2NsAm0NUNLsLmPpd4sc8DFnv6QMZrYPa71zlBHGyz0taullC/4j1KLhR
         cOoWbdHVkVt3GX5OP5QavXAar+84RZzk0/pxIsTGWbRc7DirO1lLHloZ2AoqHOLPnXVC
         HhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061287; x=1779666087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fFby9i1jhlPu5HJbXvVneKL+o1hXPAgNpBdPwBqhzJU=;
        b=ZjO6VbR6Jn2fxN2KxLorYZT3+UJqRCfIvkMIwoUAL60SCJBHBB6T5uVmeJX0oM7SoI
         zgXGrbhkWweVxz1oiSAbrkAGYClslwlHReKz0ZzwP4hUhkIilOkg+jxcMetN0gueOlXz
         Iil+KXPzj6oVKr9CVfOr+Gkp7pQcdUpBUvuO5hc5OIu4pt6aaXbT4kp/eLD0IUZydYOo
         ortEFbGbsZGnQ+5Ocj2jBSsy+HKutFXCt20663rticH822uyueWpyXap00xO/w2gsPJ4
         gpINWrZAZoN7UVjfzAZvVE9DDsXAXtlBvxFIEt8j/gY/7is6HtlidEdcqlAd8MU+Xo4v
         F3Eg==
X-Forwarded-Encrypted: i=1; AFNElJ/RvNIPPdzexxA5cco7e2NZaUe16RSWQdyhrdhc1XsABd/xIdFRg4cFnYlHDwwymsiE1wfHdzN/cF006aaeAXjb@lists.infradead.org
X-Gm-Message-State: AOJu0YxQLbm/u4QMzXReZ8+4N2sBwUiv0RkraWY3B216xKy+JTiE/3k4
	LBVEfQlvlQ/50TtoMvLdO1UtcktLmMM1tikT2cyjs6RmKjz2qwRJji4r
X-Gm-Gg: Acq92OHCoeXEL8P+zMAB/IR/ZWURkKf/v5GWF0OpVn1x+ugiFsZVVcvDfC9YS//oDPI
	KFHk1NG9pO7FfVMEr8D9Y/WJNDNLrzL1DCPZ3CI9QJ5HcREuNodqhJ9FYchBMv3Rj6Ek1ZQUP4R
	B3XeXRozLIWyAu4wD4csforrPF0gI7ltitO2WTuzbZYlxjqZNkej8dlSfyZfGli32Ui21H2AKuR
	D/2CwK8FWT9WdI0dNz5oMJj4fmFG+uRTDHfOD1w6/pFBcrzKAEuGaK4eVbiRsrSbQ6soo6Zl7tI
	KWPklbn6D7XlnqGRPVMzMcSn0g4byGoj+Lpn1e4Ap4ovD20Loxr3XhyXrwfhFDudcRR0SYdIHrb
	65WM8cqZA674o8GbC8p+XpXpJyNUAiJ/BylywFE4RmVJEE798ZJ+RJYWBWhr0xJzKAcr8P5f2nB
	xS5RnyKbQG5zkj36r54/icBIliJIGGG48WqI7LrWhlkvWDK96zKNVbP+rKPOdtfxQAuCJ2NQvgV
	yfB+Stubeg=
X-Received: by 2002:a05:6000:1b85:b0:45e:739b:2748 with SMTP id ffacd0b85a97d-45e739b2792mr5067481f8f.25.1779061286975;
        Sun, 17 May 2026 16:41:26 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:25 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] arm64: dts: allwinner: a100: Add LRADC node
Date: Mon, 18 May 2026 01:41:29 +0200
Message-ID: <20260517234134.2737320-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_164128_900361_93E2615E 
X-CRM114-Status: GOOD (  10.87  )
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

A100/A133 SoCs feature a Low Rate ADC (LRADC) for Key application.

Specs:
- Power supply voltage: 1.8 V
- Reference voltage: 1.35 V
- Interrupt support
- Support Hold Key and General Key
- Support normal, continue and single work mode
- 6-bits resolution, sample rate up to 2 kHz
- Voltage input range between 0 and 1.35 V

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index b3fb1e0ee796..2bba13c5d25c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -466,6 +466,15 @@ ths: thermal-sensor@5070400 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		lradc: lradc@5070800 {
+			compatible = "allwinner,sun50i-r329-lradc";
+			reg = <0x05070800 0x400>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LRADC>;
+			resets = <&ccu RST_BUS_LRADC>;
+			status = "disabled";
+		};
+
 		usb_otg: usb@5100000 {
 			compatible = "allwinner,sun50i-a100-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.54.0


