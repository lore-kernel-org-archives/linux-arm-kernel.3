Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BA0E77184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iXYAffnZPGtECXS58BWfoA0BdRGwpVmbASDvyhm7ws=; b=ImQf3yLp0570h27MIWRxcHyARx
	iUXHC4dJwpxm+Ap+3ExIpxldwVAAJUpFbnT2sYwyLCRtyJrUea5HhZkFVWOuDJ8ueJZmvwlJxiFF0
	RN+PCvE860iklqXs1hPQS2FZ09Jb9UrMdtboO1MqLR3GxpPVS89H3XbtnC9wgFMLBYVvRjAkG916w
	BrI66Gq0gIwyizLXilIsvkHeAua8Zxbltwv5xNwlFbXaFyFZZ+q//VnNuyFb7EXJIcX5G4Q1RaGRY
	McmHJerduGkxf7s/cFkaaUHrXL98a5DxK5j5uLNfh4nfGUsTk5R3A7IwYUixCayVoQnJk+bWmxe8u
	wGL1Ou2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAs9-0000000A41z-1FZf;
	Mon, 16 Dec 2024 13:10:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNAnt-0000000A2uB-31Uk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 13:06:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso632327366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 05:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734354388; x=1734959188; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iXYAffnZPGtECXS58BWfoA0BdRGwpVmbASDvyhm7ws=;
        b=Ix6F4EYEzmkADAM3B5v0kJ4F6vC4/PTuysB80gyCoX0aCgF2IbT5/heGBadKWslXde
         Nh3bY0Cm6MR3ag92qsG8vXo4K2ubq2wwxpUbvyU1Lcl0t4Gu8pE/37OjypaDxm8keBTE
         rIEtjBshnCKXGh47GpI2LNY+peEZPCwJuH9G59H/J0uFiR7IEg2/0nLd1C0q+G1UjD9L
         wKyXPOZ94oRnTTOrvWlCrsUgDTlqyyodYWgrAPvKTTrdcZBfcx39IGqBo/gLpeHQdWs2
         CGmtJH4E0YFSutiNNX7J/uIAfgQ8VGsj5LnCUQzl4E18h6DQqluuk1aUrmBUfJfoUTCC
         gmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734354388; x=1734959188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iXYAffnZPGtECXS58BWfoA0BdRGwpVmbASDvyhm7ws=;
        b=ntZxaQQ5WecnAeBrW39nVLYncyUkZWScUT5l4z3Qwwr9md5Dpe0Qoicicxca4FpTGd
         yss4HGzufPGUxWuLoe5IbaKgaOYesHkqXFxVfB7iq4sT1oqce+BxR435Sk57fSex8eDR
         1D9uo4ZxtizLLfFh7v7P8ujlrR4N8FRYk7JdokDMhuKSjirpL6Knq8Ln+c/u/bAjjcc1
         7Z0+NXx26/7OIXgRvUq5XwAZbDqvxBEpoAsk7Nj9rrlhKyki70qD4odsYUxpTNADpoix
         N5vowQ6bX5nP+fG+23yE1y40pXuPCzs9ur71L5/T0FxWFbkTjDoR82fdTcyYxHiajvu2
         XeIw==
X-Forwarded-Encrypted: i=1; AJvYcCXNr0fvaSXcM1Mo+bCyHW2rYF94kZdimQL33+Gt1fBPCzRC4AlzAWaWhqpz18WOW/179QHOJbon5JNUZNvJAw6v@lists.infradead.org
X-Gm-Message-State: AOJu0YzgFCMmcgwZOCPhzoyKRSow1s+krMo3apAghZXcDceHc9g2Mpie
	5eYRze4U/b9/0N3vzu2yVFHSnu85qbYYwoVTsnsIlQQU5B7xsQ9QRdkTjwAryy8uwDq8c1KDV7F
	zVHw=
X-Gm-Gg: ASbGncsigwHMfNMqkWjFgtV9o5gSYDS62mARtuwxdWn3bvGEdAnRbu11NkPOgzuzVhy
	bcH/Rz429iUC2de73Dxl34rsCVrpawnIctn75Gt2S7MxS7Nw96evOut/xsrSUEHNhoFNMIYuQmE
	ygfJM5xf/5Sh/UGHXvePOXHBjrTnnR0x1e8gWcTqeN/YYp2IELMeZbuqBCWUXVi8A9CVgyrJZfq
	iQTHcpON+6XiOa65eepRedyDZ+T+vR5D4m4vObZNl8/gzMlZB9j7Hsz9i0VM9b4IKoKFhZL2DrN
	WG60IxP3WNgf+YewqKKectsP9mQZ635YVYI48NS9
X-Google-Smtp-Source: AGHT+IHmRvbKYFM2gzJ/maU3pCLS3k+De0vwQVUzRJ/k1xRFMah4EErhor43z4R/cOK2YTYFrzuA+g==
X-Received: by 2002:a17:907:86a4:b0:aa6:2bba:a1f9 with SMTP id a640c23a62f3a-aab77eda8fdmr1112929566b.59.1734354387511;
        Mon, 16 Dec 2024 05:06:27 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960681dbsm326648666b.52.2024.12.16.05.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 05:06:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 16 Dec 2024 13:06:27 +0000
Subject: [PATCH 2/4] arm64: dts: exynos: gs101-oriole: configure
 simple-framebuffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-gs101-simplefb-v1-2-8ccad1830281@linaro.org>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_050629_785348_C92494E9 
X-CRM114-Status: GOOD (  11.41  )
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

The bootloader configures the display hardware for a framebuffer at the
given address, let's add a simple-framebuffer node here until we get a
proper DRM driver.

This has several benefits since it's an OLED display:
* energy consumption goes down significantly, as it changes from white
  (as left by bootloader) to black (linux console), and we generally
  don't run out of battery anymore when plugged into a USB port
* less of a burn-in effect I assume
* phone stays cooler due to reduced energy consumption by display

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index e58881c61d53..4e1625e3fbb4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -23,9 +23,23 @@ aliases {
 	};
 
 	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
 		/* Bootloader expects bootargs specified otherwise it crashes */
 		bootargs = "";
 		stdout-path = &serial_0;
+
+		/* Use display framebuffer as setup by bootloader */
+		framebuffer0: framebuffer@fac00000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
 	};
 
 	gpio-keys {
@@ -69,6 +83,13 @@ ufs_0_fixed_vcc_reg: regulator-1 {
 		regulator-boot-on;
 		enable-active-high;
 	};
+
+	reserved-memory {
+		cont_splash_mem: splash@fac00000 {
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			no-map;
+		};
+	};
 };
 
 &ext_24_5m {

-- 
2.47.1.613.gc27f4b7a9f-goog


