Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B70C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=; b=M7M0qTDKRMs/08A/no6iycE4iQ
	/NR5nZN4eNb3+G/o9TwHrm7rIG0g/Zjj/Xhk5yCsVF/v58JMWJq7KQhLS2u+pLnV6kme9Vdu5XmxF
	SeNAolh+qP9z3KSAES/IjhCpltOSjRisT/R6L9rNAP8umgv6HjqEvkl759l5CdlVcMuJjsBBRMp47
	6bZVDSBlcvN8FxM2wHCNsLvqD/D52Q0jSRGr3ecIFrFs23owECnfFxhEPWJw1D1O+2aT+E3wNGXiS
	Xi9fN18dSOU9H9ZbLlWgQnEsNdZyoh6hg1uHTRbq/8thEXQ6My5OfzjCX5fru/vTV4Mb0/iMsDtVq
	0ZK8PZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1elE-0000000GQHx-0woo;
	Mon, 07 Apr 2025 05:11:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNk-0000000GMp0-0LFh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:49 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-303a66af07eso2915503a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001207; x=1744606007; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=bdHelwxy4W3VxvRfBFKwGtsBgJcqlK1I9VwgZFIdHj1DyhG9LbkeT6HsEOYJDPFhb2
         tJBzNMoj31do+CTme+JHD9s+fBHSSjB+3h43PYwhzQOGUA+ifzJfJpNA9uZ6QPKgdS9a
         pNBc3tuRyXyB+vi3zskG3VYR7LLkOi2i0iwuWiF77ABE6rlCbcoiJkWLZgUZSvNBXWsV
         8U5x9mCFl1zTAkekcs3JJaNiMH2V21dTQ0CSkL2FF//2PK2YfisJN4m0ivPeS5CkPgWA
         bWPWTMfnewYNiNjitQ5o4ZFFfPtpOWOOoCu9w+MTrQde5vmIbxKJtHbtMl7eC5DsTkkI
         YzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001207; x=1744606007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=U8O4ItVFPCB2QSdxfu3qbwv8zK33NMsbFri5LysgmfKvKTwIcGxO2OmuqLu+c3IRyE
         hBuWnwOrSSM8CLUC9Ih/hW47Zp6iNP0puaZMmTuGKDJ2EOxBXr7mP653RH023m7J+vd6
         gQwub5Wphexcafq/FalsxIvNtmlDD9/gVS1rX+PNG+WlAYfnrcDdm7ZkLcx/neY0UY23
         3pkBBwXPLjG9lvsdDz4qSQigUu1iEUZt1JN/rlwkfdOrG2Fn/Dh2lWO3vHwrUeR0vlk/
         5JQ4S39zD48MwGogq3niADVRhmpFJ8fTJXScEU/JK9rIkFWLJOWLkdl/f5hpIYqymUeS
         8jYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGZeGMHXdij3trJLoqVtj7CBUrSIFs7/6psGTAM/6rfXGLYSj6hv3q4xouARzYxMhLpfmF5Bbv2c32ccit1fAI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+FeW4sj8/Qyr4oVsKcSKsSsyMiM+gUo0yqRmuI8rE26ZAQHqi
	NTl9OTp9Zpdg2eq7sismkGCrCYg+Pj1zzSJyHk76PBeChjvDB2Uc
X-Gm-Gg: ASbGncv7NeLXjtSCYaxkqLmB1pCl5INFMGb2DxCe7o8+V6VbNfLPGEzIyjTVKPVqdWv
	V9s7JBc2qFOzejk3/5Ea6pZnZlwTU+1fqRhV2aJeo1qYIMhKWmjti+OpMMdGmLIcFnQYypz68fq
	DwMHlSRGlj5DNvyHxV65z9M4fhhuKZNxGecz+vUaTvOzFnx3QiNFeQ+DyupiTwPDSmwfdpvylJj
	QwWBzqmrelbokTs3gJaUGUuC5hvQbhHrg45/5tFaWPaH9nruv/ucGFbGgPsEuGZLZnLvJ7I4Uxk
	TW0gLd0A2U6QQMKgeQgW/c2eOwQVWzrocrhGwaB0wDXz+QsNFUQoeZYjBw==
X-Google-Smtp-Source: AGHT+IHJMs9e++cYbiJtszqdGefR9NoF4hG72mVISh3CMPmNo7vdIqtGqf/Fr2iI/L8DP1Be2KWA1Q==
X-Received: by 2002:a17:90a:fc44:b0:2ee:aed2:c15c with SMTP id 98e67ed59e1d1-306af788c23mr10490130a91.28.1744001207459;
        Sun, 06 Apr 2025 21:46:47 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:47 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:22 +0800
Subject: [PATCH v6 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-13-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LZ5pN5iqWz3OCuzIiw27nZWBzYhm/oPtBhWwt5qbJRc=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iHZej07K4cgcyZGTeJm6SSKprUs+DfbEz1O
 QRY0WyIqpeJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhwAKCRABygi3psUI
 JPJND/oCRoiuuMx0WjE436hra0n7lRJ23QGEwbuaKRrYxUzTehmLsZZZNAikViX1e9FoBgFDURz
 IT7+8f9AAZ3QHy8hpjGht8u31siCvpoj5i9rp9juEBzUgqG3bOyavFIalzGTYGqZC0QWdNFhNz/
 adg/FayUYDvgET64rIwipHx2mL2/rnCK43cINTtE9+ZAuksw/BHs3gfVzj9GRbEC5rhbPYhQxXX
 jiTuVbAhcPpuM4vcbIc9zG5rjsldL+P2jPzxwskJAlIat/wizYYaB03wlaPnx8yVNtvHZ9pDV9G
 b6+2+U5E+0nIbwwu5rbtKr+kcHcN15EhGab0q/xpiDpRCjaS2/OLM9XtNFGnW9Rk8CYrZc6+L+S
 ezXJvhp4dSFRHyFvM5V0fqiAb5u8qWVUrLSLrStpPQT0Y3IUyH+RGQ3v5Ar/G4Kng9kCoEqjJNi
 B7f9DM+aH9LjFbRGqVEFaxNlxRo+22tpJ6rG3/MPCS2Pv/L4zi/WwmB734iKMEAXTHzz3faJuH2
 S4dueUw8aqrxVWXkai92CxaEQSVEVJ3cSXhofEh3e6J9lVSar9FgVeq4XoTi2B0UUVvBOeAUgYt
 8C1YjgpdhFlo6T0GLP5nondqLtcbyjiI/hSGhum9P15PA8LpcTvu21Rjz2wMJANHebZn4rMiJZD
 Zr6HOVJPunwWpEQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214648_123590_A1F7C40D 
X-CRM114-Status: UNSURE (   9.72  )
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
index d820b0e430507f681a5f2aa13a498be98080e1db..62d528d4b7204af28b66a90d68e27e1c78e2df26 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -138,6 +138,14 @@ timer {
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
2.49.0


