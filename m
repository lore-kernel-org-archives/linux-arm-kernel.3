Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B74CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iA6BDAFFSivvDJvfncgF5ApGj9cWDmXDuEaDbWv5cik=; b=C3tWxoxQWRgW7ZhvuqV3gAT/44
	CnbVBeyo1RY4roYpxBpjuHVjZiN7zseFgePZYDqKQsJedtyw5rrUFQ5tBnlONp85D2i3vz6GdoM/r
	7jXtcBT6ISaV6YzLFJXUZ6uUbv6SEwLPfiOnGZCWNKZSufS9oCj2FeJVSAKexU1wJZLQUSExKXLYd
	rmNqjgaHqeFypX8yk8OQ5IgWoOFU9VYmg12d08NHNwldf9QV+773g6cLVpOAIXtpQppTf16G39JdX
	B6UtFeYbrci/34cnzubzIDqpbbzw9ugDnYJJsOC3wO/cD79eFOJpRJYfTBTpWuoMTMaSH5907WBeK
	PnlCQBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8sI-00000008fiJ-1mhB;
	Wed, 12 Nov 2025 11:18:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8sE-00000008fen-23eG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:18:52 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-297e982506fso8454705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946330; x=1763551130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iA6BDAFFSivvDJvfncgF5ApGj9cWDmXDuEaDbWv5cik=;
        b=KVG/cZJLvXu/V+dbyeFc1qMwN9KurHN9akM1CUUhghvzAZ1uzNAWd6z0G0Cm1w+QZJ
         lcxKYzldrK7CqwhOIZmlZMtcdw+lwIDeyJITlG6ezqpoNDntD6GnuzQSEgYjpVLgTO8+
         Hsfhr+9b82tk2IlUbIwYqoI8DPP7tJhVRsECR3f/g0w7mjCsOFzp4zwwjdYRTMD3HLu8
         8qbaSyGVrvRP6jo8P0izXb0MBNEGcAupMJd1p9B2OnrEHZQTJnkxMPYIiifRdpFg+sdS
         jlPaTVth22BXgmbfp05dyDERIvudF4gTcVhWy4XKedtVNOz8x5TZqAfA/d4DxBhUoCac
         tY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946330; x=1763551130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iA6BDAFFSivvDJvfncgF5ApGj9cWDmXDuEaDbWv5cik=;
        b=TAOniEm2k5kBFSQly7qQtkBG3edYAAOI9TTqNLsQsD0URwou2GWo57D4/CXcv/GrSm
         u24KuA4BY8cN33JMqn+xhRmPE9ibq2oWgCDKOvKLBPDeF1nWuBrO1sPSqzZUr86+2J6x
         YD+NUPerEPpWvH8pjLm0/h+DlwufKesF49hTb9Ohbz6noagk9XSXLD+Ahl6tgQP/lxMU
         QJghdrzr/Qb0XnUTrVxdyxXvdVNG8ORjRUJxwUE4OhhUI4xdcE4OaqlyqKXbhbyFj53C
         67XP+LGzBFTeZZhcadfWGTUUoOyX6fxtf3sRrwq69VhXjT4fhJT8BYjh9DdgY9k29Ss7
         pweQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDN6vq7yN9E+lwXdy6EdfCntPxPl0YPTMqf4LJfs/IbgsGgZT2S4s9SUZlic8VZSLBDygt7GbjHR/67gzSVKA5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Axa3TPYMEoFmfSg2EJP03wVru4RDW1yigC3KgeHrgEARger6
	Bco/qUH2uKb1jRCN6FysBrqZN7Pcl/XGuVgLhDhA5phuujqqTYzmSRd2
X-Gm-Gg: ASbGncu+mxal9OPkOdjqxx12G0vrK4HzPSLNbs9dD1WRMfKLg8v5QTFxdY2JtHNaD5Y
	xFrzRb0BDq0LqHcdt0J7g2kghqTC8dnr5URDTyBuIilPj7X9L7j+VNC1jNo4C5vWS2VCNtua8as
	eS0eSv7IyDheYOj6d91AHZeMhn3Js6FIOr+ZhiPB/h7BZuOFHKenVF+jEjShRvgYd4a3c0gwZpv
	A98g+evq8SqBWWp1XPeK6ifX1Cn4GPJWcrdryGFPZPjhAEDFnL0fpamWCtQhe78DI8+Oplh5pUN
	e4GrPIDE1Z0/SfdUnqX+u1oZg/zWGrgghWsun/XjM9R4j2UVyysjC80grN2TFzqKgSaKSBt7CAK
	IujHpc3YP3KkKsqgm8GwHlOsrKAtmek8KfxqiNDrn7eL2XB5yD0rH/cB8XM63v5PgeWppMY8A+K
	r1R0moCVJhX+zhkXUHLsbV8xrpxrqCI+DQfgSEy2MhjjKh4TmRlzmCRR/8G7Dfi077xwASSVki2
	QE8gU/v+84rhGUlF6uhrA5DCOLGQwNJRx2tIqk9hBuD4jPRdUQApM0=
X-Google-Smtp-Source: AGHT+IFR7QWTTs3Zcb/5ft94/X6vbUaJNlBlezavBVdQ/3VzVvLaCae6d4kQA/Kg2GnApMGUCG81qQ==
X-Received: by 2002:a17:902:e543:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2984ee16a71mr33782855ad.51.1762946329798;
        Wed, 12 Nov 2025 03:18:49 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:49 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:56 +1000
Subject: [PATCH v5 10/11] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-10-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=WbLk+4olybI4wwc+d0lxY+Dd90gh9RgPWEprBEz0Yao=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOcfOlYr8bFj60khS+5UQ9+ndU0LetjI3h5jenRAds
 vHv9vyajoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFTPsGBk2Hnku/XnVYdT5a8tbZ2TVdjOzRLv9rKet/G+5L3EV+bhcYwM3TMD+QP
 1Wg9YbJ+ZoGimuWT1km1Luw48U79aPqHg7cRgRgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031850_582225_22525511 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

From: Sven Peter <sven@kernel.org>

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2ab..f715b19efd16 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 2e7d2bf08ddc..8622ddea7b44 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -121,6 +121,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	pinctrl_smc: pinctrl@2a2820000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968..59f2678639cf 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af..6bc3f58b06f7 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.51.2


