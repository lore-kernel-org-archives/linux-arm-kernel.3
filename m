Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3DBCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=; b=gM2ebdtPrNoc46L6sy7s3qjTty
	tJ4nJuLYf3FA8NUifCOu2+bBduzO3woYP+Bti4t5IzcxPGegKc5V7wzOsXEVfPTs72eLR+u0cmAKA
	JqWXeGSf37fT71SnuojMbVoIdbkF4XTN/7UYO09amhYjf2LrgjLTtL9uGDfYLStcL3p1XqxTJz3Mh
	WNEhA7tx92suAik2RkfmaqMqyPcxayhhcJ5TOz/bTq8BRN4L926gSvwqNDYoSmoYAA1xVdFRgiGOC
	ut3d6YDB8jwxwTH/bKFku6DHdA2lC9craihd0+iJxqLWw7kcF+wUb2niUgga2bhj5ZECL5OZ5ymPH
	egbrMTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvac5-0000000Gqqa-47mv;
	Mon, 08 Sep 2025 12:04:49 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYhC-0000000GEJs-3P7d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:01:59 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7722bcb989aso3124504b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325718; x=1757930518; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=;
        b=S0xkZJ4VzryJVBZqq179f3Q6HMUYUenZQqSc3LzPE1Tscme0A6yQv2ZbHprABXA8Vk
         o0o9hz6rrWuKwErBL87rNtaJ1chGrdAQF/nKeyi6MdnzzGZVoiMXFvMLYr3YZscMeORh
         NbUXyQ7lEutCiC77+WLDva93BGDFE21IJ4fM+g70mdiKh98BLfs7HzAj+UyAFXAFCkou
         EfEUO0mf7K6QTeTVnJPWn60q4bl0qfMLwKlSYykPXtuUWuwZ7zjdPO1C4yH7DL4rCNhk
         BxNnB1qJhRPeSBzvkzV36KvYHRdqAWfc4t4+b26E06nA+53atwLFS4IeAl9VoI3ZPLJO
         vwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325718; x=1757930518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=;
        b=ldSNasoIt8wjlVEOeu4731+DD+Va+N4NVqiQC4caiWenhcwp6lHTW/Mpj3gRF5yBk5
         ug3KSwdEY6q0V8n5y2tr29EFroNwz5A8Bz+FhA1aXzcX3E4m0Zv3/xFUKnV7A5L8VOX6
         TSxg3dP7r96LgaxvZYVYPP/4GGEIauhAlJVxfm82yM7IBEoKdhHURvwmAbZFdqKqLSRD
         emX5I1K7o1Ctgo/rihG0lpRps22jiB/sO9+vjWI/YTdUj8b4HN0d4ewgt2uhVFFPMKGz
         U5wErpOnFx398FC35IFxbasLWyI/Sz4PUbmfu/AKA3F98gHUmq2qpqVv1TBndwz9OJuB
         UXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQa3qJD60lF2iWVwUDB82HzueOi9jF5RYalXcf2y7D2+vB5FyAX9glu+b+FC3qqLqV43sZv7sEdWDOvbuD48Wh@lists.infradead.org
X-Gm-Message-State: AOJu0YwL1bmMYmRfx/kw6JS57vEA/W/LtZAhDZMqAxmHRw3Pr+FOk753
	McCdRm9iOY9LZisWSy6wHmy+Qm6zTmsHWuTZn6hBeS3mVCOBtG3OYxHE
X-Gm-Gg: ASbGncsoq6eYI/yilKwi3+cjL6oyqsNqUhT1zW5Wz5nwO/QfDDb/0F6UvzAcNc5Pf1J
	GZ9ytIE3VTV4/G9WSBlEWDqTVtCDOMwNY6pHbaHKtEtY/1D3fL+8x5CZGRGYpXe/lDbvce0zDid
	R8oa8xJbmpg7eZgbc2Y/ooHjvrkCo/xKiwPOveypWq0CRA7qR6hMeRkukzIjvSzh+riNIBA1uCX
	Sxdp9NM8x8+MLDeEgfr8B6PMg9W09QyPGEe3I9xqDIKgDqb1EL+MCQ5YgH2JQZtiu8iln5PMcy0
	aYTYOAO4fqFwnxk9fLMxlQtGttbPVlLIis/cf6MD+DB3P9tGR/Ye3eEdr8cufct8Vnz8m7x7tun
	THoXc5HM6Rpz1TKJi2QoAmBHtRtePXYFBodhMuw==
X-Google-Smtp-Source: AGHT+IEm2+gAoGZa0cwwAA0rX20QtV+5UuqaUU6OUNEfKaf4rVPNAoZSA3dqhcwbE9x5WjVSv6TpXA==
X-Received: by 2002:a17:903:2a8e:b0:244:6a96:6912 with SMTP id d9443c01a7336-251701a644cmr93794865ad.20.1757325717942;
        Mon, 08 Sep 2025 03:01:57 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:57 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:40 +0800
Subject: [PATCH RESEND v8 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-16-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
 h=from:subject:message-id; bh=KUmhbvVhE7a9qQQiOxTeh6fcRXxeiaIPFMb6Ibxmxag=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlEC/KtUs5Hq0AV/39vKlCFghpi48YewdkJ6
 gXzM4aJxfGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRAAKCRABygi3psUI
 JMKaEACmwYGs3rD8OMLjnTxxlkBn7vmh9k5AUksNc30NWUwChqVZ7NxW1ETKBoRn2MDPZntSVZG
 j0Dz2kXqhCTBd/E+9WVvyXc/fiattQEENQs7w+p/Z8OaY7iaUtP/3BcK0FgrqndtaPHh1pEFYKL
 EWEd0EWPLLApygXTuouliEthc/QiDUCSZ/xzT8w5lYWTaO0snntMglcPEr2oYLBskg92OfkGT9U
 piHI2YiFc1FIbbkb20ajSus589Dce4xbTeujD8COJ9RNOUo0tqJ9GW8HY/IjjvFQWGillETAnAn
 Ctdovt8ZeVV9Gh+ofL/XZm4rkN9e11zNHqtZdmk8o7kiAmQXoNRVFlsLmg9OPhfJyOKjnH05r0D
 nvQVMeN7oxBVCgD+8moOWVzaHFWZKzTbbO4t91ILeWMAaBWim8mTLVkfjBziSP3toGH01PwARya
 3Fnq0lj+jZ3ARWTwJejMV9eQBJPMK9Tg0Wj63WiyOZyt7MuZD3J4DuNzc/Lu49pmn5HwdqIql11
 q7BYDQWDwh+yG+J0f/hwpblU40AzNT3kPezF10Oi4gUXadmzS853w7ic1Ht52JCSzDEaLSiOQ8D
 r1KrcLXmAgFbVMk301HYHnr7mJT4ua1cWxfCjQ5h8y68yru2FWF4y7TV2zazaXmqUhvDmBnNG01
 tY/GmJKgRZKwDTw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030158_857640_1C7EEB0F 
X-CRM114-Status: GOOD (  10.26  )
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
index 09db4ed64054aefe5b8f8298553d87fe5514e81a..bdb66f7e0de43a6a751af37c9ceabba44ef907d6 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -180,6 +180,14 @@ timer {
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
2.51.0


