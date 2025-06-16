Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B49C71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=; b=mcJIy5Mt2YH8k6hJ0o7fQCe4AD
	AAQ3OtXn/A+PV2labIGgdiBtC/bEr/0aWf/MkmaZxSGx2wNYNIxJznUzWOnV0SAdzcq0Dd3dc7KQ1
	Ema4S94EZSx3HyBQGLM//9MJTBS8FuwdkV4mkf2vYClqtp8upJsIDdV1ij1Zo7GKJny2KBFQf9KUp
	FJR3HmqEUBx2YODQenub8i478cvTxlMDDzcWgTA4Z1fd0d0HgKxDp0E/rVFiYG9n3d85QxBZcsUjh
	vtxHplB0xvLv/P9sJBDjxJlS2o5p/dYm6laJHnhOq8LIrsPmjfawaRZrdEo7QtRM5P3sffRIVjynE
	Kmy54dow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzJ0-000000038NA-2VkA;
	Mon, 16 Jun 2025 02:10:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyih-000000034Ow-254T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:33:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-234b9dfb842so35480815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037587; x=1750642387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=UaM2sUCBm2FUX9HWqwTsDNK6jyW3KhAoVDJPe+98kS4MVBLzOZCpBNoIBbeg6Mz8XG
         QJwuIKaYgJA1YaQUUTZlFWxu3Wo0j/9RoTwmpbS7oNfwtgsiggWUoY5jlvgGTlnphmCp
         QlB5a9bijDhrTTOadTPTeMv9bFO2zvctmf8NLgFIsVWjeDZOUXbH2c+K8zQ2tV452dhk
         1UMVLZcEKCn3tb6JYIIfsoC6Gi79YL2Tmfsj6vM2JFSXt4R2frwX69efsbtvt446+dtz
         C0VCBxUolwM5LbkUksYy2VVHj93K1xN73qHCY465k502kB7+RVd7UBfON8k3zCKEnBE1
         7ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037587; x=1750642387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=FKBfR4aM1BC2+HGKeVeesYdubfJKSw6pwTQeAApeF8brBNk4rNtfw9v4rFlqXVjbzu
         6U8RstxjnOY9DIu8rix7xs0sap0UEhNeNHJlpQbzAhzZyDYBMjIPEqPdAA/qooe3VGWi
         rg1vrShzFyMarmWNUmDZfLvPufeqxqMB3qYjG1KgDS0J/NV0KAgVoCoxtu3sJqPFPS4g
         4o9vtosFSqsYUn0M2BuW8pvQIIfN0srCIl52DJLbxK5JN3HFrD4wRJKIoTazwh0dxKtQ
         tZjQYzkcusKGYIE/5ZSSppBwYpAIJ5dVuHo2PncH3c+JVmy3Fen5qyiGtZG9rCIsiafv
         W11w==
X-Forwarded-Encrypted: i=1; AJvYcCW9vGK0QRw1BKaoAqXZuUzR8SN8QAs3bIlbf788nIU7/AGaLDR+hhM8WLqMqSmk4EfW7Jneh98xKi/oqt02m1In@lists.infradead.org
X-Gm-Message-State: AOJu0Yw04c7jtkc5zmjg0aPmpWBvxJSDcfi0bFY1v95/B3tvWVdbcU/I
	Z05JSeWmnFZObZNFdllnq4XHxxThXs4JDDbdwAPBIXeJFhpRlGPOMWO+
X-Gm-Gg: ASbGnctqkoXh/ah9u0qz1tFC9TdiyLhnpp4dHXYez4jRmzbcGsgtKC2hnaTB6faRrGX
	qhcqs2309yjn0/7JVIyJ5Jz5vRi5zj8lHcCLH8LwrKHLZA2bSB4pcH1nVxHxUVeKpvlA/s1Y+eX
	5Nu7fgICafygCnAXVikjc+qD6GidTzqYfoVIc/1WDKlKp7z19F4AMfrt8hvuUnL7P934jw8mTVM
	iiS0FcChU55kYLa0FFzg0WiVmIPKeBlzhKDC5n8iFRW/jkcrlHOEjK6/p0ZrJkr4tNSn458OXO0
	pIEil/lXccrTFD3Oo/ESioTqUS5m41+HuG4PvjKAiGT5xmaQzpQRKuv7R6qnYniGWy7CqF1FHrh
	uaOU=
X-Google-Smtp-Source: AGHT+IFpbr54K3SfdE93vU1A9Oail3ZLAXjkWYwnHo6reahgj/sU43SY534nUHgzqBMAkVdbvSdeYg==
X-Received: by 2002:a17:902:c404:b0:234:a139:1215 with SMTP id d9443c01a7336-2366b3c2d99mr114617475ad.35.1750037586747;
        Sun, 15 Jun 2025 18:33:06 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:05 +0800
Subject: [PATCH RESEND v7 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-16-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZtAIOFydNI0UsOg3Wz7XY2kVVbbfBFx8gW
 DWWfdoyWRSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JIjFD/40KiOG42X4vGHbzrl1x6NHjCpJkBsofgm/VOP+pjivJpEKor59cT9VmSmAAOEfNvdHYV8
 WzGZd+Kbavq21FyX5zYGsiojNaSpnNempliFZb44Z0+jc3Hta6h4bFs+YEb6aF2hDUv5wx4tY25
 jOVp7WRjT+PNExOpKda1cfbw1ehdKXCtz/TD4gIIjDlR8dkGp7cOuwm0A1rNhTwNNKclttSU4Z6
 dvn2o7Vwg6v+GYgLsvtl6RojajsSAgF0D7reCZtCwJWpeciZB20XADA7NUywlgRXV+NXGgRqCMp
 CaKm7m+CJT7wAd68jxuwRpjVrzNmNt6UAX/3mpvs5moscr8ZOs8PpaOGfQ1aWBFGpjG3uTCI39I
 m2O9zrH7SDb4OhbPLMa21Bitr6hH1CgN4ibcchAwv3Erp8QDT32CbowiWMm3uAXolH8EhWt+UdB
 DNvwCgVlyZKX3qC6lcJZT7EUcWpR8qL/qJU5EYyXy2Uc83TPx/7eKIC5yEZbZbXHuI1nRgcIexI
 ymKcMR/3UFRSVxhGz4OH/bBpt3txEKV5KCPRo/Qhe5y40xpxm4ADYhf0MauI2pUDt3w02545205
 eGYsvKU4315MXpZNqdm2lMoPk5bE7W7+NA1A3ZyTGbItjZXzFcOSPrI9zfrGFECEKAPsSVfnIfX
 37XFEWHlYvooq8A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183307_537752_250460DB 
X-CRM114-Status: UNSURE (   9.36  )
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

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index c0e9ae45627c8150bc0ddcdc1e6ab65d52fa7219..56ac6e7f3803a16beacc74764262b02c75a96fce 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -167,6 +167,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s800-0-3-pmgr.dtsi"

-- 
2.49.0


