Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74D7D65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx92mpsjRydjbKNezVplOe9ZgSTsezLCchII9GIIrGo=; b=ZKcrv4Vv42M9TpjU22EiRPotg4
	LERhxQWGGBeHPttA53IyzM6hLiNTHkhyKw8uhxiviX4Ip5J1HrAq9C/1WulyH0Ek9N1J+gbYHIzj4
	EGA0tljUB4LBtrG9RcS9zPCI1If+ZVzBgkLpachxD4oGSUIfIgxmvXQnpRyb0REOF8urRbA/blFfH
	eBQYolhc3BC/e61pkg4xDn3wJju7jvZlJa2hzA1H3AgDXh8sFNdNh7MaTL3AYOBxMu9sQgw61Bztv
	Dq6e5fhK9HnMjwsCr4yqSG0eLZ/Ydk8cKDoRnY0Kln7RH/hZGm4y9SIhB6t8ZxuhdAhXY2ymBWcqg
	e+BIzprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLA-000000075LE-0VBl;
	Wed, 17 Dec 2025 16:25:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuL3-000000075DM-3kwG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:25:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-29f0f875bc5so78955145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988721; x=1766593521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yx92mpsjRydjbKNezVplOe9ZgSTsezLCchII9GIIrGo=;
        b=RGKb5E+G+J+nMsWe9NHi6bESA+4Mngkwhd4atjEUMe4wSA8mKOsMfeidQqABbFtX0I
         e1Oo50sXSAmAAV4cHiLBUIzCUdFkAaxEkEfIHkADWTlgRlfbiuacKhH10X5/aF8RcqnN
         aL1JfG5JB6LShwSvG2ZLqQaqFw4OdATSq62PZQK/5dDH32oHcERQuamd7XfJ5sD0hfr1
         5QHNNy7562G7mMKevmJaf5dhJrQli3sSR7uLA7SsjlkHvBfkCqZbjQoLE1u7YwlAfQ3E
         /5tEQaNLKOamf/Yq1mBV4J5DsYXHnHtHOEwalgdFxC3Y0RVb8LZW2epDwkUYNK1TKozr
         kNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988721; x=1766593521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yx92mpsjRydjbKNezVplOe9ZgSTsezLCchII9GIIrGo=;
        b=R9Xq0wiKXrHd/PKQSks2j1pxI67Y8u1YFQf1tqOo4MAFiYiFVbLxc+FJnratw2baYZ
         vlGhK/ZPPXEk36ralUzg7/C7xNKu7epW2A+KCBJX3PCO991ofV+ItynVECIeFIoZqb/P
         HF0eAWb7/5XzUB3q6E2t3Fvnph7CwhB4ltdGA+uu66sNU8JRi1mwE4UaydWAllHnIGlX
         NWj5LFxQ4E8qQ4x8o4/sjQl4Xu9+A8WQu+ZC7m1xYoPlBAbZ7RKx6/KcZTFLowh5PP7l
         QLy+FKcWv4+4n0c/szhZ4AlKE8YWBPjf2o4qo2UGRdHsQC0QYU7uZyUkVysiT3BpyHw2
         uqiA==
X-Forwarded-Encrypted: i=1; AJvYcCW/SCV9yepr8d4Zjyy2S6LyKxeb1xWZmRx9KD8C2cAreSbA+ROPeV8iTMj38inpFgJ3DhJA4L4IPAoiVcLiD2r0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3599VGuFoW7ZwLihrengaxKjldhywHKNCfXs+iglqB6JMRwez
	1MmrrLr5z/wlpR/7jTWL9higqooCt26XrDYafs/pF8xMlTfuvhVrFdOu
X-Gm-Gg: AY/fxX4Rwox/0eiymrpUX1v9NMu++YY8hIfkaGH9lZ2Mc7oi9Y9HGMFDdtkHaK2VTX1
	ezIjjEHbxMV58ydZrTsyY3/Cd8sXjc7yoPm8e49Okps+qKE1M+uyCSmORYQ3IY5BOAEY3T7f2H5
	fIE9LRl+TBoOjP79Zo0q+jGnFOK42981QiTUHBWAA4hikeJlQ2ZkMLvu/3bCWnanjpyZrCcHu6y
	lrBlNFd90A9RkxG3nqZAeN1EWsT7HUxejJdXJCqR+zVPiyS1yyyhd8tty3cWTIApwiUhoZxFOtP
	IJlkdQSs4mDhAOGnFuMhlTFhmgJLEW1BwnYq1ycU5+26y4CKMVgsfL+Gc7S7hqDg9KSHs4vRq6m
	3dZvxbPIzp9pNAyTP+zy9yL9tQYiYdnedlMEC9FZpaSDm05GSXAgyCI0rCAZ3ux2PreUDPW/m0g
	QLiVi17JoEE343
X-Google-Smtp-Source: AGHT+IF7B3HOGs7poX5/sJEvWU5wHnYg5DS9Wk9uSkNrADU4CHuaQXTQoglGtMoHKKgXqB8/eL9B1Q==
X-Received: by 2002:a17:902:ccc8:b0:2a0:823f:4da6 with SMTP id d9443c01a7336-2a0823f4e6bmr133717945ad.50.1765988720769;
        Wed, 17 Dec 2025 08:25:20 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:20 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:26 +0800
Subject: [PATCH v9 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-13-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6LjbldlF3OoWMCnhY7fHqRvAfCOGSBQ1ExvFhoCzNxY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlBWlRtK8fFZOggW0gRKimen2m37MOO5vrnf
 Etv7BkdrRuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQQAKCRABygi3psUI
 JIT/EAC0nDegP45eFiq6zKOvzllfwjkCQO2MKS5faldtXHkXIwSRRT8b7VeKPzBD3X52sVnN9+F
 lpFKKATIVC4kmxROD/OqVnvW1nhRsdPo7NupCCpzC1d2FgmJqA9WZx+KSPYpwKL63hiEKNe+YEd
 +sMkijYl/9qzwLf0qL/K2S2rWg+xh9AgWYHpyw03Ec+76O6IcKBQQP9KJ1UVd8m9scXbweOVsgX
 s+008dpPi8RPfSbKL5ONyq0CP7uc/rOv0pwwSGBq4s1ijYa0CbDrEY9wUBr89FpNenZI9Heo9JF
 PbtFtV2DdaUxjCVeOo6JwYUzZLwV5nCBU8QDBK8CKCglDYLl+g5ezH6VjnHTxq2J38ADkfFhgao
 646jhqsLpzBUfgv0fCbqPPQr5HPYVsUHD22uidyW99begHvLY2ya7h7lUpdE8S5oGBkAU1l1PqL
 JAW0HU0xeeEmUo83Q43m3t9+khjoNvU6yG+MiPcIJcfv9pwKDoGsxp93Qh3Q5HNeos22cnHyhoX
 4csuVwEL8pG9P6ucMtRVQS3bG6QxCAUvw5knCbNaoYJdoDhycRfm1uwFRbzFLaT/l/CszXl5cwT
 20Dj8u8rVBJJJM26yxbBlRDh2vHsKbpEARB81h0FSlLwMtEEczin0405Pp0SRinzk20zCc0u1pj
 nf9XufhyGMKQxog==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082521_963417_5A136A26 
X-CRM114-Status: UNSURE (   9.26  )
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

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 462ffdd348fc893d8e1d597b11d063dc5f88bdf3..d7a9cf1bb4911805a946d64e5892c1fe4b832186 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -227,6 +227,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.52.0


