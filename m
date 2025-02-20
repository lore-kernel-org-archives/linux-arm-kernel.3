Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D814C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=; b=yshNLgoupkpYeGbZJYnZmKxz2+
	Xd0+Gb858LAMXBXNAp7960rrKLZorwLQMXkbVwEYFPnrhf6zUW4wTmqMtBqnq0k3ZeYVgs+oWAQTh
	ee4l25Y3oqAFLwolKiof7orCoxpZ9iLnyxD+vfrA4ZBdHnKdNi4Xk6Mlej7XnvwshNvofYWsXa3JO
	lr0afKvcHfqH/5BF9MGuyxfnKvQRwHf1MG3qZIyGwJzjwQhuV3azZgoLvDLMIG8e22+4cLw/Hqo2C
	tRn+hFC0RQSvqi9QLOIIWDhRwz/D3gEgOSE/BP5/Wyxnm1mTCbwMEdHVcP4ScgkEFTsCgU8wV/tYv
	hipguv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8w8-00000001iMK-0mA0;
	Thu, 20 Feb 2025 15:58:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8q8-00000001g3l-3DQI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:51:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2212a930001so29106005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 07:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066712; x=1740671512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=Bo8+qVviHkljHuX8794U5uLj1ocGOfq2elGxEyr5WBMFDPvA6JkVD8rr+JNb+sfCbm
         DmdLqjmsHxPSZegqu1LD+146aLCIh3xT/B9xfBs8jmSl2KB/zxcws/+2xuG7WkgzlIo6
         rcDF33LT3cLKcVa6Xx5vpsaKSk4tz5eTQBHrnbXv9mUqh5g6Whyp+wcZG1ySXXP8Q0Bg
         NRcFqUL2HRFxVlpUMt8sM2dc1v5xMc8fxc0Xgp0GDh5kWMgcPOmLNTjS9dOKxdocQvzV
         UrP6B6cT6oJW8QloKMYUaQ8w0wwWUEsIvSUHIcmIbZXYn5jbxi4CnkzgAhRDCPoueA3z
         hrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066712; x=1740671512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=bxij8klqhwEUmZu9GGSJnH+sHNQSjyOW+cor2D3oiX2ORSprQDUfuoDqbzSxUO/uVU
         nmCZGyzWblbjQ8es7+0G1pwXTosN5RJhGlHAbavSlwNanyo1IryHg/w7LU8l1V/BevNQ
         46vJwtthXfH2AdZsbPrVka4HWmKdPfUzgruXeFLJkBG+TrKG25DHCLEIFxGujcmphTDR
         rCBTxlLkCdw0Vi5WBOSru/cRcKqamX59Bi5gMIZQBbRf56TYTlLNKTfKkipOUnSri/9f
         JfVKmKHICSCZPAH7RmQHxEPsxd93L9C6LE5NH7Jp+X+CHi+wjvHplwPhUDx/BQbmIhFU
         rmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWPteb5dTp90umhhBYy9hydI1VyldVb0nHMT/ulj+JPDtJzhFTm1qp0OaXO5lp45R87k26Eg/6nfoXitQlNn7c@lists.infradead.org
X-Gm-Message-State: AOJu0YzzwBEepgwTUFYB3rVEwyLZcxHNcdGTogmXDW7qOTxVfXN0wyxn
	mpol9guoNKl4yPeEAZr8RiYdVQgW5YUL8citQ2EmuAaY3M+8I6VW4oAmTg==
X-Gm-Gg: ASbGncu8DltZt3YZXL7rRkU3/+L4z2OLyAVd2+P0dBjuirLzusFzjd8wdrdQhvhDsiP
	nFGfNgM3/2lfKLpZdvYi9A5Dvpe32HCyioARTtWd8E4I+Njl8SJSWyEagD6PNQEafH7xm1L9gi8
	1ETF8xv+1g/9dl2b9vCvNb9KKuBGywpf6RF4Xh5PEqEodUrMP/GRgaYcQ5Y7ZuHLiOauRW4uZjs
	CBuTisnEYWOUel01RFFlZ4SS2Fbw3gdEMJAjBPdN/bc3AxBu5wx0KpzM+NEQfa9R3rj9RL2Of62
	22NDkddGvwe+PeBsxw==
X-Google-Smtp-Source: AGHT+IE8dFjT2Oon5YwErpoMrJGlxB95W6CjlQaMdMYIGfz791B9Eo46Mhq7uycbNpThPO6azcAR2Q==
X-Received: by 2002:a17:902:dac5:b0:21f:507b:9ada with SMTP id d9443c01a7336-2210405cc66mr363009275ad.31.1740066711834;
        Thu, 20 Feb 2025 07:51:51 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:51 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 23:51:05 +0800
Subject: [PATCH 3/5] arm64: dts: apple: s800-0-3: Add backlight nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dwi-dt-v1-3-d742431c7373@gmail.com>
References: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
In-Reply-To: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=3G32KGPWtAlTMVeEh2nFd9QMJAqTbBI6LKbnc/7mszk=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+MWpFjd2LtOQnV2+6ipFIwn+Yq7wK3q4mHQ
 R1LMKFNUimJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JOwlD/4+8SZyMCcMdoRA2KEvrrknMp5BdQaSl2xwUDTU+HVS+8Hns8oLhlQOjUvl4gyBvOSdfWB
 qVTyQNueZqUv/HzqwrGwIPBX3ZoZnLrfThWw+10dvcpOMo/IY6WUKJ6hHBk3s/I9PUw3ocwtk1a
 HPNNY15H3Ehbyo6MkofcTpZoF91EBuKlAamaf3xWvjbF1R78FlEoKtUk2PCrCQg9l2dcqRK7tkM
 9o+jPSajtTBnz8qTVkLRcVL4yokZiUo7+gE7ND8VISWjTm2J6BtJt4zmXpYmuks2LvF00HK7suB
 J+V4UVLQ2ahH45c6PJIRNyigGZ2FOZYlHXr7zyUBaSCGzxjTM/d/bHmfR9qj5UucOtH/6JnwkiQ
 9vxh1CSlhmZo8Rq8wuBamag1y79d2pQzEYVTouVVHFKNIg9hBccqariCHNw4l1PD070KqUpTe7V
 UWh6WU2MxLD7/iykt0jAMDVp3lXqwt9MymDzaIQaGDadO3E8HRfuhtBgSd0H5OU6yPHz8w9bxG/
 dWERsWXLVlkag1wMW4rC+gawidOeMd5j7HKbj9x4XeRZQWNjozaWF46IrS2Ui2yx3bhS2hTMrBb
 tO5jlnzHlBsiyZjCMUxX/3roFuN21IpFHLQasbkySU1mPoWv0BdtcWpflPl0i4zt9HqJRJI343j
 A6kuPPm7s12/DRQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_075152_810778_0406B978 
X-CRM114-Status: GOOD (  10.60  )
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

Add DWI backlight controller nodes for Apple A9 SoC, and enable it for:

- iPhone 6
- iPhone 6s
- iPhone SE
- iPad 5

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi b/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
index 4276bd890e81b16f19b04e1716a55f32f9a371d9..cb42c5f2c1b6caed4ae04ca0b6173e23bbda47f0 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
@@ -43,6 +43,10 @@ reserved-memory {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 2aec49f0da6467519aeb2561d00b14f46fe216fb..c0e9ae45627c8150bc0ddcdc1e6ab65d52fa7219 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -91,6 +91,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200080 {
+			compatible = "apple,s8000-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;

-- 
2.48.1


