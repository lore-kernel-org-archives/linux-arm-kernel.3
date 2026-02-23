Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BDAEA4FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEf9sD0ORFSG7AS78V5QZeKdYhd2SNplxEEftC+5unM=; b=Jekb8t2WhRqTaAqn+vUkYUTWi5
	mxBG8SJ7pdUDhKfLn4VgJBoL5oJpXLfJ7OljdnAu0EdYsvxW+8E9xAogq9tK37eA7AlQEUIWx0Sna
	rgQC6e0mbYB07P3UwXZmCYojoBLgAaOhpXKNlDw9tzU7Hf+1ihxNY2LX7NDhikeiA0rs44vF381oW
	B4uvd9sJ2dIDByNUAr2hXCwEKKL8bGWO3QYwWiMBBYC6lbLHUJvcvHCj06Y+C474NuK0t50DITxqS
	qpkCggG/KSodou89Wf+jbjqAZNBfdwgAKSd363d3AL17hpBdqIBFR+zG1fY8Utmql23C3rRrcnbM2
	qhmob27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwk-0000000098a-1Nju;
	Mon, 23 Feb 2026 11:17:50 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwf-0000000095s-3iGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:17:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a9296b3926so28478255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845465; x=1772450265; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEf9sD0ORFSG7AS78V5QZeKdYhd2SNplxEEftC+5unM=;
        b=YuW5Lv96q3t/smULpNzw9WAQkABWr4cTt2ye/Jk9hHGeJqQiKKekEUKF5iUR0hVGV7
         7Yi2nG0+jbzxposuZ8YsbkoHQEKekDQx1OILmI/ZZP8A3CQQvu918ZP922CEcB99kB9T
         8gTV1QLVYY8sG1+iXVreikzfsW9RIuhr+fCl4WPMesX9o6sdvZJV0rTNCqG292AKni7G
         Ru5j15AFnyKYFs0zIA6Kb0xS1F61y39aAO+Rc3fnGeZASgjwe1DVKIhb5xG0EQx2P8Eo
         4yk2EUO8XV+5KpPNQjLjsFD0ooloeq3EGesw34ZQ9hc8YRCd3T8voMgjKvKiHYOP8+Z9
         w13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845465; x=1772450265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEf9sD0ORFSG7AS78V5QZeKdYhd2SNplxEEftC+5unM=;
        b=BkNW4DjWIwCSUyuBW5H7HgTtU08t726nk4/Oow4E+Vyzowz2V9eKu9O9uj1J5evSLL
         bIxyXEq711r1tCK4mwTfUh6WHV+2SPSe5q7qZMBbdMANjHRXPnxqiEqaBZQ6E+FYHpSh
         tM0hqqNP9fcDTm7wwwIxpT0FEsWPWTcojT1A3e+6I1ne8R9LPLEr5LIrmVVtoCEX69A3
         7PqbiF0TdDIbIUYGuSm8xR535cccSRi20DgvF8huTvjq0QKfk0gbwzJD5BHY8Pvv6utL
         Xd+PyZ86zVHvU6TiO+Elp+f0hfVbuaXseBzRCRdBlzKd640uiXvsg1B91Dtd4Nr3qH9J
         j5RA==
X-Forwarded-Encrypted: i=1; AJvYcCWeluY1Mb3EPFGy/lHPiodtWlq6pbn3ZvYrkOjGkJcydUoZvKVhfizMUH7YHTmRfWOalUdCizqOE/IuHSiUWbmd@lists.infradead.org
X-Gm-Message-State: AOJu0YyLYM6lC+o5Y6Ex/MxMUNXHFQAeRaatf8DOpJl2g8qAlfCMQf34
	wDKRZY6+JIjRL9g/6mZQ1eKgbUSDVz8sU//kcW/721/L7DjqKUq4IB48
X-Gm-Gg: ATEYQzyB0mHbY9trRLKA7cZl6pBQHSO9XLSn+Gs2FWf//Zd+aGABlM7/nHOqjeihwsY
	z65FKqEypP/IQm+DCnhMmCELZm3OneM/kXbqFKAKk7VSV+WgSS2CK6fbzy33WSVldZHT5zC3Q4M
	NvUwr5UV16o4khEYDUxj19ZapFsMqiy5FV4eH/5x121gV0AGLqoLm+9jUb2b4Y6C6+nafM/AtF7
	gnjeJGM+ht8qul4Qy3+pJcGLt+3UQA6YjzVGqyFQOPHM7FRu3n3paKK24M5cFZ0cWMFYsNv8ACi
	f5rE0NyD+5QMMESSMOFbkjQOmrkxjMdWv/JMDh5LX+fd7niD+qQy+jm3UPT6BDsz9Book4vF+AR
	nWonGD0hkEuJHTNMcc52HRPvV9ZlBWVWne7Jqj3JB0PNAucztX3QbCFHaCVPKhauhOPgb4aDdPh
	JOaj7cqcRlDvtrMQGUduIfGedmMNNpXtjVANFQ3gwWISRIqwz4CDh5sAwJwtHKfuhcPsp7Jm0/S
	U54mPRY4bfczIPsEN8iLi39AU2cNo20OY6A6nBpaDSXAEMUbFUUFiE9kP+MQMiQ7IjqywAOKXdn
	tiPZvLkOjqfQMsV9RxxS
X-Received: by 2002:a17:903:1a2d:b0:2aa:e817:1bd3 with SMTP id d9443c01a7336-2ad744e1731mr86659805ad.29.1771845465072;
        Mon, 23 Feb 2026 03:17:45 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:17:44 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:17:34 +0800
Subject: [PATCH v5 2/8] ARM: dts: aspeed: yosemite5: Remove ambiguous power
 monitor DTS nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-yv5_revise_dts-v5-2-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
In-Reply-To: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=1501;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=9mIn+NRMcnY3nQa3xJUsbsqiUrUJYrQ5MBs5E/B+nyA=;
 b=6Y7zZJPug+L/D4hZsJuZ8qj0dU08TZ1l9Yv+yjr0PCQyZ7UQs5aT10ImulnrtBzWJFP1+lqkw
 R3+pUZQKbQ+Db8upoOwg3GGp9wJhWjkORgkT0J6Xe/KwYjRNQ/B+bSc
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031745_956636_71FA7A58 
X-CRM114-Status: GOOD (  10.71  )
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

Two different power monitor devices, using different drivers, reuse
I2C addresses 0x40 and 0x45 on bus 10 across Yosemite5 board variants.
Defining these devices statically in the DTS can lead to incorrect
driver binding on newer boards when the wrong device is instantiated.

Therefore, remove 10-0040 and 10-0045 device nodes, and let the driver
selection is instead handled in user space by the OpenBMC Entity
Manager based on the actual board configuration.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 7991e9360847532cff9aad4ad4ed57d4c30668a0..45b8ac2e8c65a4f672e64571631b7f6944f26213 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -674,20 +674,6 @@ gpio-expander@22 {
 			"PWRGD_P3V3_AUX","ALERT_TEMP";
 	};
 
-	power-sensor@40 {
-		compatible = "ti,ina233";
-		reg = <0x40>;
-		shunt-resistor = <2000>;
-		ti,maximum-expected-current-microamp = <32768000>;
-	};
-
-	power-sensor@45 {
-		compatible = "ti,ina233";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
-		ti,maximum-expected-current-microamp = <32768000>;
-	};
-
 	adc@48 {
 		compatible = "ti,ads7830";
 		reg = <0x48>;

-- 
2.53.0


