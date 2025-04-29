Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A85C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=; b=N22bplREDYA2DIeUoGg1SnghqH
	W/fp/XqODXKFqabY+oVz37XiDIZBcdEXU2eo1zF3tLMN2o32xBtDCgkzqAfDpONIWfEkh5qgL4XdL
	J0kH41np+6LlILewL9F5joZQM6BEmq0bthTUC4Dc3vHUHC0qlYIcVp5OIGCuBqttRIthJI2gxKo4c
	Ordt3l86S+sUH+CPCkROAaPbhLfQtJ0nTB7gxzRyYqBX7g9VEA3Aw20++0OkI24MokKF29cS4QQMh
	6vlcRLpBzdAmR4hZBJ2rGTcyxiMP18V3FqPu2CIx5XePUQlUup9Lw7ZDZflLMPRDYbN5+b+MPhuk2
	w0pMKbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cJE-00000008H9u-3gti;
	Tue, 29 Apr 2025 04:11:04 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9btO-00000008DBP-2o9E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:23 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-30384072398so4778225a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898262; x=1746503062; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=Lv6pazBVlz9zbU31P2MCgXan44i4LbF394h8Iyvwyfb2de1mQQD1PpV+YmeNo6f5ZQ
         we927P79ZCU3JNwTtCj1scPtbrGC1mlOMwceYKKgNDyvllkDFlzuL+ZnnFlC5iIupwCJ
         O0RXDqlxJzycjh7G/Nz5n3EO9WTmkVkJqL//Nwvu2T0zvdmeqVsNbs2C4Qn8S5rnoSLd
         tPe/FykskAmMTrAaOVIwnigEIkQxHSu1WgJ1D8r5X/ts8+biVEcSE2jA0dnELjDIqXae
         iJHf6DLA/SpIKMRehmByUkIYPYMUhY8nCaxOdVr0pGF/Kg3kpb7QQG0TmjCuvRaUfXaG
         Y/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898262; x=1746503062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=Qb2f8HKNa/nhqnxlghdR0eR7KM7dr9IOjxZybjlqv26CcoGTZkJlnSeZ5GR31se6gu
         DzIC5iVWR1FRfF9nHqwh+H4wQEOtN64rtxEZ4m9K9MV/bNkyx70iotJmBe5OMyiyaaYE
         ETGtlsckNnnOGZ0zjoScoefKtTh1a4Wxd4wnPxs047hRpB5ux1vBFjeXKTeZTzzzGw1c
         iMPQyrBupSEdBGhtAhT2KoksVZmTo/pc8hi4OYF0p4Qd6eqDbke8YP6pjvr6bmwXRVcN
         DiXHpdh+DVHYmeRoNcc/JuO5P+f1etZxqcuWLHQs2HwnlVJFyxGCjvGxLDz2uSq8kuYR
         SXXw==
X-Forwarded-Encrypted: i=1; AJvYcCXVI0Ea4OyASGqA7byMsssUsdwSLyqAFrAkZJbUtqQyU7+XbOhv54o9VpKhySePCBzssbSf2V/B5YB6BRAAEBJY@lists.infradead.org
X-Gm-Message-State: AOJu0YxXfSGa8rszZI/TbCQEGJZ6uBfKLK7wnmjVUaP3+xBLMUDDHFBZ
	Kd5VkQps8CqYxxea3nUq3GPlNMcCbFa5BP5efD1fjPR/owjE1K8Y
X-Gm-Gg: ASbGnctDQtgCWNIRIWpLyNyWg+QC21fI6l9D6oN1IObK+tRpXhlsBckz6/xvj/kWo9j
	xA7QZ9ti/bekgJSM+Wm/zdiHiXMdvnGXUyFUw/ur+DI9HVBRMWzZqCQj2Htg24X3DNEhk3Aie+V
	rtOOb+zh560ZPJBtH+nnq5D+NrMq2xrHIE5EnUiUh35Lpi+FfDaD39zXY8vpuVd+BobSmU5iAnd
	gr/HT4Uy5L1BqKOYXOJejxb6gnm5/IBv57GUag53flfq3gZIyGyChQIv+WfW5LCJAHRjtzppBag
	+LoFsdDm93JeTlfzD5gE2OyKPtyfHl4BQg9dklgatDiZTvoAv0K1FWUJNQ==
X-Google-Smtp-Source: AGHT+IETjuI0siCRS9u2pXvps9EUIDQ4wR7KluYQHkBdrJXS9KMX45n+wsExNcKlbrDR5a+B01PX7w==
X-Received: by 2002:a17:90b:2750:b0:2ff:7ad4:77af with SMTP id 98e67ed59e1d1-30a23de91d4mr1580390a91.20.1745898261883;
        Mon, 28 Apr 2025 20:44:21 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:21 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:37 +0800
Subject: [PATCH RESEND v6 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-13-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErlfTyUVAy1ePsjHsSm1CJiFAxVuwctbhmdB
 xH4ukXVRrmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JEouEACzAD0sTgca0HLK6vqrrH2FMirQbIejbUzE91zU8/GE8ilbJPoJabc4+Yqgc20c44LHZ0A
 Ak/TsqoF6C9ppinHmYUuu7YiRF1vsG0DOgF+Ge0crlrxgwNyh5bk9tBPKkSjXMZ5glfwNI2i5tl
 h2ylYSy9PLj5CrKZJ+QQ1Lw8a+1qokfSHdzYMAxURp4fxyScyjNFCUN/ptIMaSbZAf7D/64EJOy
 BNH4hiqY4W9d94cr58UUxO7ZPxPQIDfKEJEhpPuHMix3Q+nBcAB5wUZEY1x6BGR1lYyzLrSqCW5
 aV75k4SHDC4dfLA/2QH549hkVWy48rSYfcpuVhdsLl3Q7NjJobWlZ/GP7/6lt1e0fZ1elGXxKRj
 ET+Y6WzpGhTmloIPF/Eci/U77IVneCcuO/DzHCXFtWCjJwBSMvnsV2mbnUNf09Vsg/sVVNxbcsJ
 0ngrGAEc0KcbN26+f71/VO6bMG0l96zXAm16BTklsWaFQ7kZ+M7wMg1L+vghuFFRnrFdM5kgOIQ
 FmsrgdzyVDo4B+buorhmXNlsICqKg5iHCYFhWPvHwXpqoTXVVvJSYa/K0R/y9+4xLXaw25929o2
 WvZbnvYdNrSeyq2nXtwnvBzrNP3QpY7YFMZCrtDNf9xAYBheq0y1XIn0UKHKPvR4FGy24DH9KLR
 i3JkZ6ljQoCI1qg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204422_722377_FFB2BE58 
X-CRM114-Status: GOOD (  10.04  )
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


