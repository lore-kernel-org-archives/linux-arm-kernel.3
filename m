Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1C6CCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pte3u3WxOgw3Qgy52tQrveaoQhV4YTR7h3cZS1HtB1I=; b=Wg4i2nc4e/izhlk6+1wL64M1HV
	o2MqwKCwk/6x4EHWCrJaen1STVHmNqCHdgtWJkAthsKiyPht82rECO2c7XOm8Ton05GKIKQls1lkl
	3QrfN4vqCSS0bW8gCTyjQGQFEftEGaGzbt0dhqLQ+4g17xO3pYWKFgJiKBdlZmuJyNRULvWQSOSOT
	k8ie5/8/WRN6gyLbW7olnUQgdEabXxNymGrYhZg3xzulXkHLibEjBjqUKzr7jNHUJa7UwfPfrSVmA
	Iohf2sLkjIJaEb4heTG3BlSd8l1YZQa1c8c2qZ+Jm8M2IPFIN3+yPqNcnoVWwYpcxuFtrUKAU8kWh
	UWkNPgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7m-00000003AkD-3wsV;
	Fri, 16 Oct 2026 14:41:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7e-00000003Af7-47sC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1d665a5efso263985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161685; x=1792766485; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pte3u3WxOgw3Qgy52tQrveaoQhV4YTR7h3cZS1HtB1I=;
        b=gxCluD3jaNAYPGFzgKTrqyzl4Knb9i4tLgurEx28Y+kRL6wmhs8RKqDIgESUXDJTfU
         HNhZ84IKf+Hz+xSnuV2zITv7u2iw4ZGRl+nZFI7NzcZ8obGZ8+XyqmdsFS3zPeVC1C+Q
         hpU2uv1iX3uKexDHfHDAORwR8QGAEQvyH2Sa63Pb+88ZIVzo8equBKuldn1SZzyJ3mU5
         njSxQcD1i7rSf36i6DJnoNt/voiK28EF4KYCmf1e0I2QGifZJGjcDwgnaJzweH9moTzr
         z5p49LQjZ4nt2DQhxUqC8K+EvaABGXsq6tzocSe4xcmVWRprgS9je2sf/Th7u5JgzhLK
         t4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161685; x=1792766485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pte3u3WxOgw3Qgy52tQrveaoQhV4YTR7h3cZS1HtB1I=;
        b=l9+2Q2jFZw/SxMx5Q9hx0RpLfTHwvbnUjVCRalL43PwaTtK81dy1JyBWVOOj0opzW2
         CVb1khI+tpJIMOJiDo7GpGWbfTZwYCHUW3yKt4uY63gf83Shdp6kJBwofxMLraGNTCG9
         5VFI/uWe5QOZ9IDeocqafC6xHv/3MFVvop/I5svu42EbfCVTKtq4SHZWHMZFVjxJivji
         ISDwzWqt7zVWfdsCZ+HekxucT+6AVE2PXerZYaaiTq+xEfSLMslv7VBNWd6uTcfaKSw8
         WPKnNUaw4dASjuqWIO6Cy03r67OeL3hgCPyXw2dlsyYRNFU40YV8OErOeK+c2utMpKPH
         YnyA==
X-Forwarded-Encrypted: i=1; AKwUvByzUwoB5MHAHhExcxdyQ0Vw3dQthPoBLMVSp+ytt8CRw5/r1e9JyOFc2MaagX9ECr8c8Z/f2BmN6Mq/PGggwYDm@lists.infradead.org
X-Gm-Message-State: AFq9FYIxUyNalMEjEko6lIV5Qpl4D+7uwH5m1vJdKjqfzMyAMZeLwFkk
	a8U9fkoANxrgg/oHvJLLQhYbDXes9rFNVBDLSidG4U9TChbskcEvEe6TJox7WvkJcgo=
X-Gm-Gg: AYBFou3L4z+n2Nhfd9RsjkjHwVJPVxj0XZh+C5Z5c5vjQmpEV3MlwpZ1J4eUzOtu5Vv
	FQafl36B5Jsl1BbYWXObEJSbi8oEjkJwancfQkrwikRebECyevG4pIV2TmtXC4DN7Z5uyD3nZyO
	k82BH1VBaJtZ9T2kBMt5HG8eMpHO4eDeLQ6o1uiFFDstduw0jZJ2FKRKLJi4bmkhDQRJyaOF1o8
	8mEz5+5ScB7/9gQtqeYtdR7s9+as+URBn5BlLAA1NgLLzxNKfu38r//ZayAdhVJPv9kAiDiuhTp
	HEuIHJ4EVt720NJ0JgFqL3G8cytek0vfnnDQA/vhuu1kjdYwvbg9ha1MZvZY22c0W7OTH86I6qi
	x8N26jkx57QepT69L3aKB9oHwbrdnOlVP5WUp5oobwbRKTR3Edh7qkcoEY7+o5+uw5HXppGFAkF
	sesI+xBLGVAdc+HHcuQwRUS2JLYgxbpn2resa7dobuTCRY+wQNuSNnNriw5jt6p6uqsGx83RuK2
	9b6YZ8M3iZavEAH5FXLytm5IFsvXbT4qosQWHZrMrJHSrhTtDAgXkRiLo0cI3zECTS0kA==
X-Received: by 2002:a05:600c:1394:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1d75f2524mr381415e9.11.1792161685121;
        Fri, 16 Oct 2026 07:41:25 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:24 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:18 +0200
Subject: [PATCH 03/10] ARM: dts: omap: dm816x: use dedicated SoC pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-3-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=991;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=rQYMzDtVh44VYgzn8ZF81rVqoyDsHoJv3ovI5wxNPaA=;
 b=3S50pMz7zQmvtFmL+2YZ1KgPdiCvRypjaxgUOOH+3aWGkFuLX2ipy1EzPmzd3M2yImYr6voQo
 syqhbr54WckBewNboAWAqmAJKY/GJNXAurDQYOCbAHJZBNcilzj5MjP
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074127_045339_7B388151 
X-CRM114-Status: GOOD (  12.82  )
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

In the TI Sitara DM816x SoCs, the pinctrl configuration macros are not
identical to OMAP2/3. They are actually inverted between Pullup/down
enabled and disabled (third bit in pinctrl registers). Using dedicated
DM816x pinctrl header to differentiate between the SoC families.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index ee0090f7aa64..de4d48babf77 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -3,7 +3,7 @@
 #include <dt-bindings/bus/ti-sysc.h>
 #include <dt-bindings/clock/dm816.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/omap.h>
+#include <dt-bindings/pinctrl/dm816x.h>
 
 / {
 	compatible = "ti,dm816";

-- 
2.56.0


