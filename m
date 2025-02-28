Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544D8C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=; b=PexGrZWeVaDS0O6qAkBjrs7j7f
	H1ZzUFlGspMFndcEkyHUpZZGezfvibJelNWajddV+ECsaYaTqko4dbhf2D9LeOj7aTrXGJXKvnmZi
	Gpgb5sAIgkJYE6vJkfpYq9rUmsCsgr8j6tRQvJ7ZicZSLWZmNEf2J6cT79B9cpOwND5FNzrn9B9e7
	xDbJ8jY1l78AIpFTOEAj0fR4Rr+w/i1LEmVORtcGTDZ0KeJ4SWoGFYVAdsNFQYtaelfL9ryAcWUME
	g75RrN95am35/hztsDyHv2s6m2zK2erRdxKcpt90Hc51Q5sl17lVsYUclNxrKHy3jW/Ama/mEPO83
	P/F4eApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tns7g-00000009kNI-0YNM;
	Fri, 28 Feb 2025 04:37:16 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrwx-00000009j1P-2aGJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:26:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22334203781so41627995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740716771; x=1741321571; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=A9xb+IBi/1YhzCKLylIbP8fa/wrNu+5XlQKsU0ebewSAiONgJCg6jhivmGvYhdU4Cd
         L/OGy408evKV/Ln1PSWmxKVY7r645lKZdJbVKzLkxAgcMeRGbAGg7/8lfnSQDarNdD8f
         gqfJ483rsXnQrgl52S2jP9mL9DqgzGeapPIVdi8LV82WkOd+MHjz4CbERI8rEL+iIpaE
         x6ztjyN5MpD9h6+QAV7DLOc6Acitg4W0QdWDhn1V3z5o509iTz30IAGZOU3J7FCwisNh
         DHYnYrFwsbr6mHZ9b2S4O5BHV0vYZhtX/G9osZyo/J009nLBZ3IswUSrBd908MSWBS3G
         Zibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716771; x=1741321571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=A6/ABrQk58egwVEv262VlfR/+1D5GDuIJFrFlfA6+HOGLuU4M8Enw1+WWq4RgBWAgo
         i3vD2/EVjEZ2elimD141uw2XlXslFkzDpxsPd2Jcn7MHHK1WN/BaxrfO93ZovElocaEK
         Ru5ElY5Y6tjqwc3H5nZIIwCXZbqN8OquqRh5OesEcNT2uxF4BiEQo8hvAV5t+PVaaWt4
         gqi/XXgQcv8wg8mWOmWHqTPdR9gS2czyni8IVkQOXmJ3zUafwlV+9VXhRueY8ooQvTML
         Z+PqRFmS/cYu4+MxzqI6y0x8MCId+UoL1OmSbSnJkMoTv7UkNLH6mUPcfEUPIxTtHjq6
         Qkrw==
X-Forwarded-Encrypted: i=1; AJvYcCXewV8ChvZo0avxeXjuJHOSrxoGHUC75+NfKrbIDR3pg28RWhvmZl41qxo8JKqQP9l6fQTDGlwJjz7DEv/yRHGk@lists.infradead.org
X-Gm-Message-State: AOJu0YxwXOB8/7sdwTmQEu/R2cKwINUKhTp3398nq0blyATA3SrxrFRA
	FDS3qtAhngQchgqdAyDV3ne8iLs34sNZfEpEcx0J0XUkqS6Gp0sF
X-Gm-Gg: ASbGncsOPRYVxwZMxluL/LDYUnfixuyrfmIQhNLrFB0w70mA6dPxC63n2u4Jx7m0xQF
	NjJIwmW6rHUsW0xauL9AuVNyoYMAf9h2zHHg16x3UpJbsoQ11w75sAlrnlk6cwRrGq47nZJhV0d
	rqHPA2YqHcoQy1FyvSllgLVKp9nKE0hI/s0pyAfZgktw43jkNjW5XnndnC7D25PL/2cB2/gGn4E
	aum1DVfyQW+DbVTfUV/vwmPQfQcGiseLx7KZ+gafWuxJV0F31G6h4gwE1hAtAd+QoC0+yQGYwSy
	D5clKVMPO5l960D4LOFy9876yQ==
X-Google-Smtp-Source: AGHT+IGtmQbdyfEwfeBhk6WSmYrLAOp0IoV4HAJOcN/bRjv63mAj9b0G7a2Jab/56/ebMWJ1KgLJIA==
X-Received: by 2002:a05:6a00:4c8e:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-7349d2f3d9emr11980732b3a.8.1740716771005;
        Thu, 27 Feb 2025 20:26:11 -0800 (PST)
Received: from [127.0.1.1] ([49.130.82.63])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dd19sm2738318b3a.131.2025.02.27.20.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:26:10 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:25:34 +0800
Subject: [PATCH v2 3/5] arm64: dts: apple: s800-0-3: Add backlight nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-3-4243fe8647a4@gmail.com>
References: <20250228-dwi-dt-v2-0-4243fe8647a4@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-4243fe8647a4@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTrQ6B830j95Oaa2PfNNLQHTfwWsbYuH9Ingq
 4BzjP+wPs2JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E60AAKCRABygi3psUI
 JAoiD/99DcQPTKCtLKCyntFf0CEhJfzKeDiiSPEmtdNYXNQnTApnskUoUjwDGyT34wShAW/Jfm6
 4OyKEdK+a2SpFyR7zMBI8Js8fTTDTuUvvLG+m+g4iYDohNXqW/iB725Bjqc0IHN0Pt8xk08fHu8
 lDP9PQKDq3NRj4cleRUkgCOr5ZTJ+c47xNGjNJ33weHToGdEVHH51bqVQClb+G5+o9q4ndiCm6q
 4DdtI6xZy/493Gka3iw78EJ+xS9r2JT+FvGG9b8N9auFwM1sPx64fLUMoSF5JbBlBdO1m2HYxJk
 +KIDaJCWL/ayODMRVBTGiVXgMoXM7uGgkh3gR3QsIOu+NiHufd9yAhxA9k3ABgSqBCg64cCTp76
 IDzLSMYDRQYMUfd1N9Fa7MyVXBRIwEfdyNs3EAFpkl8BJZjsVpmg41zL7ET0SDzh4B5G4uByrhZ
 L5EesJUN4Egr9qLQtqKTWuiK11rutpzzgHbOo4RTNY5ZoHkG4iNaIqEBjF3Mshklhv60k7YUrIb
 ILvINDBoWzm9BiO/Gdk7mCIu0i01lQK01J5JktmLFNBgho2ZRnNmbb6dvMEW9sPnPRCQjQ0Xwj2
 daSoOrUSOkzJwKIvleRg29x/gZhGZZRsPVirdFRDgMKcYM1ZQEc3XUPb23A2NHQq6p8UbgUja9p
 fGgeEniyD6GmLDw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_202611_659552_4BD3151D 
X-CRM114-Status: GOOD (  10.20  )
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


