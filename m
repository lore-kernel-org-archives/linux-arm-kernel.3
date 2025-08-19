Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5731DCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=85wyCG8coVc4P+dYQ1rAaYOx8gFIkg9y2ilOKc3W8A8=; b=J30agjRdMKisxhbjw5E7FN0EVk
	el6R3iwtIVF7RDULgSiWwnOqMGvaDZkiGagXXEcu5U2H4wV3Arm89R2Li3w6DduNXdnMGSRa8yhaW
	wgqMdB7a68++7t5rYNXd9pcP+2SViIq7vGTqsM/VHSgT7e0ULWoGFGZu7eIDf/Mi5tOGPDjiGGTsa
	n1oeWdrwQ3GFZMr5DZVy4Id73I+6KVHVPoeoMyJP+lb3U5YfUMrVwpxv7BBYqtwz1Li9rA2kpI+ae
	UJRPuRtnaQaBtkUpDdArd8y1qyZP4jG/3jSh/Yxe4rW0G7LW2q//adx500iek8CDAn17f4Z6xcPpN
	VlDeUbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpw-0000000BCZ7-27MP;
	Tue, 19 Aug 2025 18:13:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMDd-0000000AZM5-1LCz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:17:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-61a20bd7a72so214833a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609460; x=1756214260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=85wyCG8coVc4P+dYQ1rAaYOx8gFIkg9y2ilOKc3W8A8=;
        b=VYkaLBR61d6PEA2D56JAVI8C6N71g/Ipk6yUCiuNnRg7wJ9kdOf6QUjKoYzQ19+ReF
         KNbh1JlXOByXEsYAlyuQMchZpm5NIfoJHGRo4y0/Z5ts2rFruL+vGyVFeSAoqtVBcTM5
         73DYQ2jW4sdbo0W+eB0cMKkaJjym8lWDFOodosrce7OlYUJUXNDYu+cOSruCgGGfz6lG
         1/DWKkyRsp8L99k1XFDkrhc7FFkWtVeQfDHvTkByV0aObCu5njaPs9kLNTSulX5tyvLK
         AflJJlMxuiMEJz4mPKu4LEYEgdNPKy193B3pMa66WfG1MVDB6az8i35NzTH6rzTjFWNY
         bMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609460; x=1756214260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85wyCG8coVc4P+dYQ1rAaYOx8gFIkg9y2ilOKc3W8A8=;
        b=szoEbtg3H6UM5jAOk7/WQrcIH21IBMskCplca5CzNqzXkLh+detg96hVLRFgSxrByO
         PEaxX1lRQFotM2GkaYb6CkYkKrqr6nb+b1XR03Fvy0FwYXrZBfz/NSodEFDYQAiaRXSy
         oqvhcrWAxd5vwiybIkJ1HWHyTi/3zDzuL+W2T3jJumaZdT+eSzIfIEGXvdh4bWN6fpvA
         0i1QfKWFo8hNeXUKUmCvRPG0ofo9GcBUHMkKMoTBHcEISeUHNl4y09jNgpJvW77M2tl4
         sUUSK/EV1GF7e0IS6dp2l1gWmT8E4TvlYnHvgxYfLhrB8xOQXlruB0HGwrvVVACF4UPV
         ZZnA==
X-Forwarded-Encrypted: i=1; AJvYcCXfV9m7tJzm31mIGjef86ld5VhICUD9XQWYp1LFqyWPKVFZ2lvleKbnVIpThcCohHMa5T1CH6rAmND2D5zLFl4Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxRY6ZTLG8U7iOyVB75P/PR9nQwApOMuWHA+8sChDRPa5migKcA
	WC5zVwHsmRjrwtJMDrAMhsgVBkEPoRKMoHZQaYT+p9paDtuAXBT3jzwNFhPIaRPRUWodbVmDTt2
	oD65I
X-Gm-Gg: ASbGnctWaSKk6lN6qfhpuNRDg2zZ6rcWpnxgysY0dY+VFIocGIuV61he/+a+S8pAX+F
	Z54soBShms6YdEJv7HudV+3Mh1Sc/74xGTSZi+44iGQjirqjPqzSJh5gsj+4whRIL2tTmVJxwso
	fwxheO4IeSzTaO45yow16hsv+OKTQ0wGQbj6gF587NLqaYKAh8Ub1gKMWIFP95ZxHpz1dIqwGli
	QX9VzhjhEVCS44qjmlcoj84XzEnxzqKggVkGet97Wzyq5OG6jmO/0JpIT6WDEjrSJtvzoYGsTRs
	xP6mYEFWmAkWzHnl/1mreWAlSAzWExzcPDZHY7GCSz1hPrusdtgQCm0pGR+ZYI4/2g9uYsFs0l7
	M5Nl6eHNlbd4YNWfTpRFLB+F5axslPlDP0w==
X-Google-Smtp-Source: AGHT+IG53VEovhwtR28QN2UOeD1JHPLe8QPkUrXRxvuFI47Q5JNDQ/MUoUcbuJ2GXmpU0iCo5CP0Nw==
X-Received: by 2002:a05:6402:40c4:b0:618:1835:faa7 with SMTP id 4fb4d7f45d1cf-61a7e6b6437mr994682a12.2.1755609459620;
        Tue, 19 Aug 2025 06:17:39 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a755d9cfasm1769363a12.9.2025.08.19.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: microchip: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:17:37 +0200
Message-ID: <20250819131736.86862-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=OI8xI4rriuzUcSjkeIqrlqCQ7LKECrbj3Rl5VDM/qiU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlw00SZ3DQZKclRCv15IUoY9iPx4Rzzc6aYV
 sFbvLNEWCiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5cAAKCRDBN2bmhouD
 12erD/4h2ip3iU4zgw2e1b01drQrNo98Z1jSHTsT4xA5nSpzNbl0LdXz7XgEmPc3bihs/MklTyF
 DqjFuHRoJrECQT9jHMH4QT/+Apv5mGkg6nHwxEL4ahq8qAPG2LHQBIdC6cSMedWpipUSqckcm+h
 tgcdEI9Rg6mjoyaqUGekrIaPRUX0wY8CcOMs5tE1TJeoqraLmMtYgtwkEyx/b7/FcpM4fjL5N54
 ln/Hwpkhl7ZsxxiOkNFAqFimp6hP2HjSF6B5wY5O+7yra9Vd54ceEWXC2VHXmEBB5dzW5Lqz9iB
 MW1+bVIl7Dq+BPF7oJRzULAPtQYuAMVakib8djwSsb3SsTPipSl41BHVPiZboLe1QCaxFdElvGd
 YvIE9M+KBVwuRCOC1UokvM490vmq0vlUfnHtJ+10Y2pRtaRfjRGThaHUEzZFnA/yWMcTdaWXQQq
 XMoD1DzPIHrNn/Mg4ylBQhNi1NUEvJOV4oDnTVZW1uf1DYUutZpUjPwOlRnUwy+bXu9BiV+UFHb
 4qzhIHZcQAKUDJxp9ZUnB2DXF/hm0uSqltMkjH0VuzO3/iWU2F7ntHBCqwgDWbdvabYKXndSdyW
 vJNqgHxgwmGWf8+Q2+Pwer9GYzXryChyWZEwJzZQeV4FykJK9K7bnoQ6KHz/B22Thkxg5E+Hpla +8MKT+dZumZ6/RA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061741_354799_878A0383 
X-CRM114-Status: GOOD (  11.96  )
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

The DTS code coding style expects exactly one space around '=' or '{'
characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts | 2 +-
 arch/arm/boot/dts/microchip/sama7d65.dtsi               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 7eaf6ca233ec..c14c52936ecc 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -346,7 +346,7 @@ pinctrl_gmac0_txck_default: gmac0-txck-default {
 		bias-pull-up;
 	};
 
-	pinctrl_i2c10_default: i2c10-default{
+	pinctrl_i2c10_default: i2c10-default {
 		pinmux = <PIN_PB19__FLEXCOM10_IO1>,
 			 <PIN_PB20__FLEXCOM10_IO0>;
 		bias-pull-up;
diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index c191acc2c89f..84bac1d29421 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -91,7 +91,7 @@ secumod: security-module@e0004000 {
 		};
 
 		sfrbu: sfr@e0008000 {
-			compatible ="microchip,sama7d65-sfrbu", "atmel,sama5d2-sfrbu", "syscon";
+			compatible = "microchip,sama7d65-sfrbu", "atmel,sama5d2-sfrbu", "syscon";
 			reg = <0xe0008000 0x20>;
 		};
 
-- 
2.48.1


