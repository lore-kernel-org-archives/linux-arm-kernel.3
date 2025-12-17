Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111DFD65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgzrS6iAvFIUlLKBejM9CRNPYbscxZNKJWP8/12+9Yg=; b=w4b5pTbv6gp9YtrCjsh7UIvVdm
	jyGNTdaP9rW927QmEndv2+drP61LCU6YUclgYOTajqk1H6RcW+3fBDTx/EuEt1d3sf47foHSw55Lu
	EADDc491JTphxuHG+Sys9td8ODhmEJvpoSqIW1xIg9tFfKGifgxTsHZU2VvuscR0knk3I2vm2C3wq
	/2Cr14PqYGycNpNPvnrKxIXtuHtVS2JFoP6HkTNUiDuYvyIYCg/9j9qGYIGkrhoUsESaMz4YEG0HU
	Azayf7hDuaCCi5IBNiNY8T+w+QiJKyv66NbVkXrs1mleUZVJPjBj882/tz3kaeYXMmAaXBTYmc0kJ
	Z3rFZYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLF-000000075SG-2SaK;
	Wed, 17 Dec 2025 16:25:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuL9-000000075KR-2q2C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:25:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a0d6f647e2so58575025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988727; x=1766593527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgzrS6iAvFIUlLKBejM9CRNPYbscxZNKJWP8/12+9Yg=;
        b=eWL362cBqrnxAI4uRnnEyzj+h51E5NiUzbd8r0eUHscdnmKXcQpwValumIohAYlxZ5
         7wsC1WyaR0v7Zz5ireC24Kh8KhZ9ELEPFxtPdg786JAY87VKfwM0a77XV5bsH4nqJzvg
         lvby7Dz1WHXVrnVQoGas77kyVAotFCMYS0100+2hd+CoqMs780aBV5mlCXVxC4mjiqOP
         xbMZPFbDglkKRw27vUqRVk2eNKJ/jXvUMaTQ9RIEEtGYBsa+rFBEfN2oohZS5SXzArs0
         2zaGtuCyTy0G1637fcEn0adbAyyluTLu6gt9t5t5viyixMZvshWo/yrSceHYg1Ia6zIz
         F0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988727; x=1766593527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vgzrS6iAvFIUlLKBejM9CRNPYbscxZNKJWP8/12+9Yg=;
        b=P8ipRDdghj3Qt9Qui+DtbLCusngT70dLZD5xpmvcuSBfnU8MMLZKMc6RS3qiWfaUD3
         DwHKGH0+EnOUCJU3iZQoSsGVVkRw+f3l9NH897IOglkajrjuPHjTIYL100PD+GDwaOet
         cC+RneZp/9veIb6ij1wVKIg8dvW5IfJB5r5iX5PEEJdR6Au1EAGjLbsvKgQAFhe6pSBA
         V7hY2nZgelD47+xfNg9VXvgnUWf2jo4PAtdQkjfbEalyc/37MoKIQfBFMatuS1Tg2Occ
         YhpKKAzTiWsutmtMgWFZz7VMXEOVTGmxDXEqFcshF458pJjCA30qUcY7/OneEU6rmaeq
         qvTg==
X-Forwarded-Encrypted: i=1; AJvYcCUDJ+30mvbzIJTnHhDiShQOVm/jseW1WyFgVqSwUOeu3VNp+ow5tomk1Sjr9xhySFk4V4oqQj5/72T4mglRvjue@lists.infradead.org
X-Gm-Message-State: AOJu0YyCBMUXV2USLWu/OICgppRVxI3NYchQ9voE5087dGjSf/H8BLFg
	2sbo7fMtO9fofLN0eu0T1O+l+FrzTmMxjmx/Tk/RI3HRbgF/zkfnBPt6
X-Gm-Gg: AY/fxX7dK0wTd+98kEMrRi0y75S5rVdbXb8K+3wa5TxV74KSIOr+3CehvigFuCWDwCQ
	GDiPiZN6HDMr/A9A2Jwma9G4JGW5ya22QIhE4LuZmX4X/i9278hQtHZvNzLOMfcTDchU5B6E3My
	rZNaJk6TiForsYpm9zsqSKdbF85LKRn6iEM/L0+1JG0i5YyPcdnI1Pf50Oz+K+zphsGXCeHIFmS
	e/eGObvwo/tpKjWXOffMBtu4GLcV+66pNgP6VMARYt2vYbZnmlxA5uUKlcWC2y4EFwm0I+hPeA3
	VzyRTvyANAGPeDq4qCStltgE63IwTw2HukT+g4uxDZgkCYZUVNBZcemV2YzTVpigwkSHr1cLxSd
	Lr9fUuK03GfIcs3nhO3UCkOqVhNhdnM8w2S5MR153gz2KCTRqi9GWARuYHMYiRIOJPpO31T4492
	dCPh4jB9l9V88k
X-Google-Smtp-Source: AGHT+IFB6PeNIWSqXJ8An32WcsBQUhlnoYA7ieWW12lMPDU6l82Gj5e6zJ8t+G04ZDznqk99I6dBvw==
X-Received: by 2002:a17:903:19e4:b0:2a0:c954:3bc6 with SMTP id d9443c01a7336-2a0c9544164mr151113495ad.22.1765988726996;
        Wed, 17 Dec 2025 08:25:26 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:26 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:28 +0800
Subject: [PATCH v9 15/21] arm64: dts: apple: t7001: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-15-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8i2WC0AFNRoAyJx9LwHHLdlMc3fQP5/vwmujapLLxro=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlCclmzbQYq5sEToSOjMcDoblZHJnC01GxIz
 CCAYu6+ojqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JGC0EACgymanFylRFBZHGTD7TCucUXoM2oI8p5ZphAfJg5I8FzyKa+0UsRzIXvnt500vL+7/kVt
 S9c6jH6VokeA1GsxoMbft5KZGBkAqyk2zxOi12WMdNh4VCpBa77YtUhb60CzzoqWyf1xk/ddauw
 d4CuGVUSnE+vZhQhJHAfPiAiUvBIw4PDCQWGCSP0Cu2IHUkaZ1SC2ffq9dqXoBec7k50ltQmPax
 KN4WBAdaGiFMDKJh6UOxuNBtJFBkk2R0wclmF3+6XtsRJt0sW5je1KEGd+PAWPC574I9+//NH3q
 3NlmsUACZhKn/yQ4vc1O6gglLRYlvUpkahnHJCmgNWZe21O5js3uU2nmCAEDCOT0ac4nwozVL5m
 ZuBT6EMaf5LR22QDSRzGe2f7YFJltRNGMiVvJDu4azur+7pRxSuAohTKdMkKpQkmX82rh6qYPck
 e9H7MTwvGdRcjH1LkVKu+od7f31DxZr2xB/gRdlb3p1DVJvz3JocH4yk5IBU1sGR94tml8M6X2n
 t5grzoPFUrJLMu9YhCQ+8q8sEVbRINq9DlVPgkVzN9ZGFqB65jkc/A4jQzhBsEISF01jFTh0laq
 ooL8MG1kkdo/6ftO4VYZsYcDOyRDyp2STNTew0w9oozyoRZGsIYMGk1R+z+AiD0qE542KmWILHk
 atO4PaZduvUvvKg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082527_754358_417526F4 
X-CRM114-Status: UNSURE (   8.84  )
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

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index e1afb05423698223ebc15f2ae347e73fb46c7c24..b62122ea40f00a54ae42dc3cd0f864f25888489c 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -275,6 +275,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.52.0


